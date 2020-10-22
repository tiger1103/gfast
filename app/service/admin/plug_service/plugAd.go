package plug_service

import (
	"gfast/app/model/admin/plug_ad"
)

// 添加广告
func AddSaveAd(req *plug_ad.AddReq) error {
	return plug_ad.AddSave(req)
}

// 删除广告
func DeleteByIDs(Ids []int) error {
	return plug_ad.DeleteByIDs(Ids)
}

//修改广告
func EditPlugAdSave(editReq *plug_ad.EditReq) error {
	return plug_ad.EditSave(editReq)
}

// 根据ID查询广告
func GetPlugAdByID(id int64) (*plug_ad.Entity, error) {
	return plug_ad.GetPlugAdByID(id)
}

// 分页查询广告
func SelectPlugAdListByPage(req *plug_ad.SelectPageReq) (total int, page int64, list []*plug_ad.ListEntity, err error) {
	return plug_ad.SelectListByPage(req)
}

// 获取size条状态为status的广告信息,优先按排序序号排序,其次按时间倒序(status 0停用 1正常)
func GetSizeAd(size int, status int, typeId int) ([]*plug_ad.Entity, error) {
	return plug_ad.GetSizeAd(size, status, typeId)
}
