package dict_service

import (
	"gfast/app/model/admin/sys_dict_data"
	"gfast/app/model/admin/sys_dict_type"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//检查字典类型是否唯一
func CheckDictTypeUniqueAll(dictType string) bool {
	dict, err := sys_dict_type.Model.FindOne("dict_type=?", dictType)
	if err != nil {
		g.Log().Error(err)
		return false
	}
	if dict != nil {
		return false
	}
	return true
}

//根据主键判断是否唯一
func CheckDictTypeUnique(dictType *sys_dict_type.EditReq) bool {
	dict, err := sys_dict_type.Model.FindOne("dict_type=? and dict_id!=?", dictType.DictType, dictType.DictId)
	if err != nil {
		g.Log().Error(err)
		return false
	}
	if dict != nil {
		return false
	}
	return true
}

//添加数据
func AddSave(req *sys_dict_type.AddReq, userId int) (int64, error) {
	var entity sys_dict_type.Entity
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

//修改保存字典类型
func EditSave(req *sys_dict_type.EditReq, userId int) (int64, error) {
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
	res, err := entity.Update()
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("更新失败")
	}
	return res.RowsAffected()
}

//字典列表查询分页
func SelectListByPage(req *sys_dict_type.SelectPageReq) (total, page int, list []*sys_dict_type.Entity, err error) {
	model := sys_dict_type.Model
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
		req.PageSize = utils.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("dict_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//通过id获取字典数据
func GetDictById(id int) (dict *sys_dict_type.Entity, err error) {
	dict, err = sys_dict_type.Model.FindOne("dict_id=?", id)
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

//通过字典键类型获取选项
func GetDictWithDataByType(dictType, defaultValue, emptyLabel string) (dict g.Map, err error) {
	dictEntity, err := sys_dict_type.Model.FindOne("dict_type", dictType)
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
	}
	return
}
