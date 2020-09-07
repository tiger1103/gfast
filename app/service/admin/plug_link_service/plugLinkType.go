package plug_link_service

import (
	"gfast/app/model/admin/plug_linktype"
)

// 添加
func AddSave(req *plug_linktype.AddReq) error {
	// 验证栏目名称的唯一性
	err := plug_linktype.CheakLinkTypeNameUnique(req.LinktypeName, 0)
	if err != nil {
		return err
	}
	err = plug_linktype.AddSave(req)
	if err != nil {
		return err
	}
	return nil
}

// 删除
func DeleteLinkTypeByID(id []int) error {
	return plug_linktype.DeleteLinkTypeByID(id)
}

// 修改栏目
func EditSave(editReq *plug_linktype.EditReq) error {
	// 判断修改后的栏目名称的唯一性
	err := plug_linktype.CheakLinkTypeNameUnique(editReq.LinktypeName, editReq.LinktypeId)
	if err != nil {
		return err
	}
	err = plug_linktype.EditSave(editReq)
	if err != nil {
		return err
	}
	return nil
}

// 根据ID查询栏目
func GetLinkTypeByID(id int64) (*plug_linktype.Entity, error) {
	return plug_linktype.GetLinkTypeByID(id)
}

// 分页查询栏目
func SelectListByPage(req *plug_linktype.SelectPageReq) (total int, page int64, list []*plug_linktype.Entity, err error) {
	return plug_linktype.SelectListByPage(req)
}
