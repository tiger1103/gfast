package sys_dict_type

import (
	"gfast/app/model/admin/sys_dict_data"
	"gfast/app/service/cache_service"
	"gfast/library/service"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

// Fill with you ideas below.

//新增操作请求参数
type AddReq struct {
	DictName string `p:"dictName"  v:"required#字典名称不能为空"`
	DictType string `p:"dictType"  v:"required#字典类型不能为空"`
	Status   uint   `p:"status"  v:"required|in:0,1#状态不能为空|状态只能为0或1"`
	Remark   string `p:"remark"`
}

//修改操作请求参数
type EditReq struct {
	DictId int64 `p:"dictId" v:"required|min:1#主键ID不能为空|主键ID必须为大于0的值"`
	AddReq
}

//分页请求参数
type SelectPageReq struct {
	DictName  string `p:"dictName"`  //字典名称
	DictType  string `p:"dictType"`  //字典类型
	Status    string `p:"status"`    //字典状态
	BeginTime string `p:"beginTime"` //开始时间
	EndTime   string `p:"endTime"`   //结束时间
	PageNum   int    `p:"PageNum"`   //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
}

//添加数据
func AddSave(req *AddReq, userId uint64) (int64, error) {
	var entity Entity
	entity.Status = req.Status
	entity.DictType = req.DictType
	entity.DictName = req.DictName
	entity.Remark = req.Remark
	entity.CreateTime = gconv.Uint64(gtime.Timestamp())
	entity.CreateBy = gconv.Uint(userId)

	result, err := entity.Insert()
	if err != nil {
		return 0, err
	}
	id, err := result.LastInsertId()
	if err != nil || id <= 0 {
		return 0, err
	}
	return id, nil
}

//通过id获取字典数据
func GetDictById(id int) (dict *Entity, err error) {
	dict, err = Model.FindOne("dict_id=?", id)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取字典数据失败")
		return
	}
	if dict == nil {
		err = gerror.New("获取字典数据失败")
		return
	}
	return
}

//修改保存字典类型
func EditSave(req *EditReq, userId uint64) (int64, error) {
	entity, err := GetDictById(gconv.Int(req.DictId))
	if err != nil || entity == nil {
		return 0, err
	}
	entity.DictType = req.DictType
	entity.DictName = req.DictName
	entity.Status = req.Status
	entity.Remark = req.Remark
	entity.UpdateBy = gconv.Uint(userId)
	entity.UpdateTime = gconv.Uint64(gtime.Timestamp())
	res, err := Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("更新失败")
	}
	return res.RowsAffected()
}

//根据主键判断是否唯一
func CheckDictTypeUnique(dictType *EditReq) bool {
	dict, err := Model.FindOne("dict_type=? and dict_id!=?", dictType.DictType, dictType.DictId)
	if err != nil {
		g.Log().Error(err)
		return false
	}
	if dict != nil {
		return false
	}
	return true
}

//检查字典类型是否唯一
func CheckDictTypeUniqueAll(dictType string) bool {
	dict, err := Model.FindOne("dict_type=?", dictType)
	if err != nil {
		g.Log().Error(err)
		return false
	}
	if dict != nil {
		return false
	}
	return true
}

//字典列表查询分页
func SelectListByPage(req *SelectPageReq) (total, page int, list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.DictName != "" {
			model = model.Where("dict_name like ?", "%"+req.DictName+"%")
		}

		if req.DictType != "" {
			model = model.Where("dict_type like ?", "%"+req.DictType+"%")
		}

		if req.Status != "" {
			model = model.Where("status = ", gconv.Int(req.Status))
		}

		if req.BeginTime != "" {
			model = model.Where("create_time >=?", utils.StrToTimestamp(req.BeginTime))
		}

		if req.EndTime != "" {
			model = model.Where("create_time<=?", utils.StrToTimestamp(req.EndTime))
		}
	}
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("dict_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//通过字典键类型获取选项
func GetDictWithDataByType(dictType, defaultValue, emptyLabel string) (dict g.Map, err error) {
	//初始化dict的值
	dict = g.Map{
		"dict_name": "",
		"remark":    "",
		"values":    g.Slice{},
	}
	cache := cache_service.New()
	//从缓存获取
	data := cache.Get(gconv.String(cache_service.AdminConfigDict) + "_" + dictType)
	if data != nil {
		dict = data.(g.Map)
		return
	}
	dictEntity, err := Model.FindOne(g.Map{"dict_type": dictType, "status": 1})
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取字典选项失败")
		return
	}
	var dictDataEntities []*sys_dict_data.Entity
	if dictEntity != nil {
		//获取字典数据
		dictDataEntities, err = sys_dict_data.Model.Where("dict_type", dictType).
			Order("dict_sort ASC,dict_code ASC").All()
		if err != nil {
			g.Log().Error(err)
			err = gerror.New("获取字典选项失败")
			return
		}
		values := make(g.List, len(dictDataEntities))
		for k, v := range dictDataEntities {
			isDefault := 0
			if defaultValue != "" {
				if gstr.Equal(defaultValue, v.DictValue) {
					isDefault = 1
				}
			} else if emptyLabel == "" {
				isDefault = v.IsDefault
			}
			values[k] = g.Map{
				"key":       v.DictValue,
				"value":     v.DictLabel,
				"isDefault": isDefault,
				"remark":    v.Remark,
			}
		}
		if emptyLabel != "" {
			values = append(g.List{g.Map{"isDefault": 0, "key": "", "value": emptyLabel}}, values...)
		}
		dict = g.Map{
			"dict_name": dictEntity.DictName,
			"remark":    dictEntity.Remark,
			"values":    values,
		}
		//缓存
		cache.Set(gconv.String(cache_service.AdminConfigDict)+"_"+dictType, dict, 0, cache_service.AdminSysConfigTag)
	}
	return
}

//删除字典
func DeleteDictByIds(ids []int) error {
	discs, err := Model.Where("dict_id in(?)", ids).All()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("没有要删除的数据")
	}
	//删除字典下的数据
	for _, v := range discs {
		sys_dict_data.Model.Delete("dict_type=?", v.DictType)
		Model.Delete("dict_id", v.DictId)
	}
	return nil
}

//获取所有字典类型
func GetAllDictType() (list []*Entity, err error) {
	list, err = Model.Where("status", 1).Order("dict_id ASC").All()
	return
}
