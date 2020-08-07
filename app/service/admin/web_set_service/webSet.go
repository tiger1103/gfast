package web_set_service

import "gfast/app/model/admin/web_set"

//  更新站点信息
func UpdateSave(req *web_set.UpdateReq) error {
	return web_set.UpdateSave(req)
}

// GetInfoByID 根据ID查询站点信息
func GetInfoByID(id int) (*web_set.Entity, error) {
	return web_set.GetInfoByID(id)
}
