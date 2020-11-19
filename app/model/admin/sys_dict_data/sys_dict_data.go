package sys_dict_data

import (
	"gfast/library/service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

// Fill with you ideas below.

//新增字典数据页面请求参数
type AddDataReq struct {
	DictLabel string `p:"dictLabel"  v:"required#字典标签不能为空"`
	DictValue string `p:"dictValue"  v:"required#字典键值不能为空"`
	DictType  string `p:"dictType"  v:"required#字典类型不能为空"`
	DictSort  int    `p:"dictSort"  v:"integer#排序只能为整数"`
	CssClass  string `p:"cssClass"`
	ListClass string `p:"listClass"`
	IsDefault int    `p:"isDefault" v:"required|in:0,1#系统默认不能为空|默认值只能为0或1"`
	Status    int    `p:"status"    v:"required|in:0,1#状态不能为空|状态只能为0或1"`
	Remark    string `p:"remark"`
}

type EditDataReq struct {
	DictCode int `p:"dictCode" v:"required|min:1#主键ID不能为空|主键ID不能小于1"`
	AddDataReq
}

//分页请求参数
type SelectDataPageReq struct {
	DictType  string `p:"dictType"`  //字典类型
	DictLabel string `p:"dictLabel"` //字典标签
	Status    string `p:"status"`    //状态
	PageNum   int    `p:"pageNum"`   //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
}

//添加字典数据操作
func AddSaveData(req *AddDataReq, userId uint64) (int64, error) {
	var entity Entity
	entity.DictType = req.DictType
	entity.Status = req.Status
	entity.DictLabel = req.DictLabel
	entity.CssClass = req.CssClass
	entity.DictSort = req.DictSort
	entity.DictValue = req.DictValue
	entity.IsDefault = req.IsDefault
	entity.ListClass = req.ListClass
	entity.Remark = req.Remark
	time := gconv.Uint64(gtime.Timestamp())
	entity.CreateTime = time
	entity.UpdateTime = time
	entity.CreateBy = userId
	result, err := entity.Insert()
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("添加失败")
	}
	id, err := result.LastInsertId()
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("添加失败")
	}
	return id, nil
}

//通过字典数据主键获取数据
func GetById(dictCode int) (*Entity, error) {
	entity, err := Model.FindOne("dict_code", dictCode)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("获取字典数据失败")
	}
	if entity == nil {
		return nil, gerror.New("获取字典数据失败")
	}
	return entity, nil
}

//修改字典数据操作
func EditSaveData(req *EditDataReq, userId uint64) (int64, error) {
	entity, err := GetById(req.DictCode)
	if err != nil {
		return 0, err
	}
	entity.DictType = req.DictType
	entity.Status = req.Status
	entity.DictLabel = req.DictLabel
	entity.CssClass = req.CssClass
	entity.DictSort = req.DictSort
	entity.DictValue = req.DictValue
	entity.IsDefault = req.IsDefault
	entity.ListClass = req.ListClass
	entity.Remark = req.Remark
	entity.UpdateTime = gconv.Uint64(gtime.Timestamp())
	entity.UpdateBy = userId
	result, err := Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("修改失败")
	}
	return result.RowsAffected()
}

//字典数据列表查询分页
func SelectDataListByPage(req *SelectDataPageReq) (total, page int, list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.DictLabel != "" {
			model = model.Where("dict_label like ?", "%"+req.DictLabel+"%")
		}
		if req.Status != "" {
			model = model.Where("status = ", gconv.Int(req.Status))
		}
		if req.DictType != "" {
			model = model.Where("dict_type = ?", req.DictType)
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
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("dict_sort asc,dict_code asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//删除字典数据
func DeleteByIds(ids []int) error {
	_, err := Model.Delete("dict_code in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}
