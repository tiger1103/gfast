package service

import (
	"gfast/app/system/dao"
	"gfast/app/system/model"
)

type info struct {
}

var SysInfo = new(info)

func (i *info) GetModelsByCateIds(cateIds []int) (models []*model.SysModelInfo, err error) {
	return dao.SysModelInfo.GetModelsByCateIds(cateIds)
}
