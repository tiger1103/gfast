package plug_service

import "gfast/app/model/admin/plug_adtype"

// 添加广告位
func AddSave(req *plug_adtype.AddReq) (err error) {
	// 判断广告位名称是否已存在
	err = plug_adtype.CheakAdtypeNameUnique(req.AdtypeName, 0)
	if err != nil {
		return err
	}
	// 不存在则调用plug_adtype中的AddSave()函数添加广告位信息
	err = plug_adtype.AddSave(req)
	if err != nil {
		return err
	}
	return nil
}

// 删除广告位
func DeleteAdTypeByID(id []int) error {
	return plug_adtype.DeleteAdTypeByID(id)
}

// 修改广告位
func EditSave(editReq *plug_adtype.EditReq) error {
	// 判断修改后的广告位名称的唯一性
	err := plug_adtype.CheakAdtypeNameUnique(editReq.AdtypeName, editReq.AdtypeID)
	if err != nil {
		return err
	}
	err = plug_adtype.EditSave(editReq)
	if err != nil {
		return err
	}
	return nil
}

// 根据ID查询广告位
func GetAdtypeByID(id int64) (*plug_adtype.Entity, error) {
	return plug_adtype.GetAdtypeByID(id)
}

// 分页查询广告位
func SelectListByPage(req *plug_adtype.SelectPageReq) (total int, page int64, list []*plug_adtype.Entity, err error) {
	return plug_adtype.SelectListByPage(req)
}
