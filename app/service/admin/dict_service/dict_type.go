package dict_service

import (
	"gfast/app/model/admin/sys_dict_type"
	"github.com/gogf/gf/frame/g"
)

//检查字典类型是否唯一
func CheckDictTypeUniqueAll(dictType string) bool {
	return sys_dict_type.CheckDictTypeUniqueAll(dictType)
}

//根据主键判断是否唯一
func CheckDictTypeUnique(dictType *sys_dict_type.EditReq) bool {
	return sys_dict_type.CheckDictTypeUnique(dictType)
}

//添加数据
func AddSave(req *sys_dict_type.AddReq, userId int) (int64, error) {
	return sys_dict_type.AddSave(req, userId)
}

//修改保存字典类型
func EditSave(req *sys_dict_type.EditReq, userId int) (int64, error) {
	return sys_dict_type.EditSave(req, userId)
}

//字典列表查询分页
func SelectListByPage(req *sys_dict_type.SelectPageReq) (total, page int, list []*sys_dict_type.Entity, err error) {
	return sys_dict_type.SelectListByPage(req)
}

//通过id获取字典数据
func GetDictById(id int) (dict *sys_dict_type.Entity, err error) {
	return sys_dict_type.GetDictById(id)
}

//通过字典键类型获取选项
func GetDictWithDataByType(dictType, defaultValue, emptyLabel string) (dict g.Map, err error) {
	return sys_dict_type.GetDictWithDataByType(dictType, defaultValue, emptyLabel)
}

//删除字典
func DeleteDictByIds(ids []int) error {
	return sys_dict_type.DeleteDictByIds(ids)
}
