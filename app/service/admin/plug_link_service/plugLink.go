package plug_link_service

import (
	"gfast/app/model/admin/plug_link"
)

// 添加
func AddSavePlugLink(req *plug_link.AddReq) error {
	return plug_link.AddSave(req)
}

// 删除
func DeleteByIDs(Ids []int) error {
	return plug_link.DeleteByIDs(Ids)
}

//修改
func EditPlugLinkSave(editReq *plug_link.EditReq) error {
	return plug_link.EditSave(editReq)
}

// 根据ID查询
func GetPlugLinkByID(id int64) (*plug_link.Entity, error) {
	return plug_link.GetPlugLinkByID(id)
}

// 分页查询,返回值total总记录数,page当前页
func SelectPlugLinkListByPage(req *plug_link.SelectPageReq) (total int, page int64, list []*plug_link.ListEntity, err error) {
	return plug_link.SelectListByPage(req)
}
