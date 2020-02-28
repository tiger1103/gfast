package dict_service

import (
	"gfast/app/model/admin/sys_dict_data"
	"gfast/app/model/admin/sys_dict_type"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

//添加字典数据操作
func AddSaveData(req *sys_dict_data.AddDataReq, userId int) (int64, error) {
	var entity sys_dict_data.Entity
	entity.DictType = req.DictType
	entity.Status = req.Status
	entity.DictLabel = req.DictLabel
	entity.CssClass = req.CssClass
	entity.DictSort = req.DictSort
	entity.DictValue = req.DictValue
	entity.IsDefault = req.IsDefault
	entity.ListClass = req.ListClass
	entity.Remark = req.Remark
	entity.CreateTime = gconv.Uint64(gtime.Timestamp())
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

//修改字典数据操作
func EditSaveData(req *sys_dict_data.EditDataReq, userId int) (int64, error) {
	entity, err := GetDictDataById(req.DictCode)
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
	result, err := entity.Update()
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("修改失败")
	}
	return result.RowsAffected()
}

//通过字典数据主键获取数据
func GetDictDataById(dictCode int) (*sys_dict_data.Entity, error) {
	entity, err := sys_dict_data.Model.FindOne("dict_code", dictCode)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("获取字典数据失败")
	}
	if entity == nil {
		return nil, gerror.New("获取字典数据失败")
	}
	return entity, nil
}

//字典数据列表查询分页
func SelectDataListByPage(req *sys_dict_data.SelectDataPageReq) (total, page int, list []*sys_dict_data.Entity, err error) {
	model := sys_dict_data.Model
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
		req.PageSize = utils.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("dict_sort asc,dict_code asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//删除字典
func DeleteDictByIds(ids []int) error {
	discs, err := sys_dict_type.Model.Where("dict_id in(?)", ids).All()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("没有要删除的数据")
	}
	//删除字典下的数据
	for _, v := range discs {
		sys_dict_data.Model.Delete("dict_type=?", v.DictType)
		v.Delete()
	}
	return nil
}

//删除字典数据
func DeleteDictDataByIds(ids []int) error {
	_, err := sys_dict_data.Model.Delete("dict_code in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}
