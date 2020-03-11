package dict_service

import (
	"gfast/app/model/admin/sys_dict_data"
)

//添加字典数据操作
func AddSaveData(req *sys_dict_data.AddDataReq, userId int) (int64, error) {
	return sys_dict_data.AddSaveData(req, userId)
}

//修改字典数据操作
func EditSaveData(req *sys_dict_data.EditDataReq, userId int) (int64, error) {
	return sys_dict_data.EditSaveData(req, userId)
}

//通过字典数据主键获取数据
func GetDictDataById(dictCode int) (*sys_dict_data.Entity, error) {
	return sys_dict_data.GetById(dictCode)
}

//字典数据列表查询分页
func SelectDataListByPage(req *sys_dict_data.SelectDataPageReq) (total, page int, list []*sys_dict_data.Entity, err error) {
	return sys_dict_data.SelectDataListByPage(req)
}

//删除字典数据
func DeleteDictDataByIds(ids []int) error {
	return sys_dict_data.DeleteByIds(ids)
}
