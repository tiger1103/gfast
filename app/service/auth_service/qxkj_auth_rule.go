package auth_service

import (
	"gfast/app/model/qxkj_auth_rule"
	"gfast/library/utils"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

func GetMenuList() (error, gdb.List) {
	list, err := qxkj_auth_rule.Model.Where(" ismenu=?", 1).Order("weigh desc,id asc").FindAll()
	if err != nil {
		g.Log().Error(err)
		return err, nil
	}
	var gdbList = make(gdb.List, len(list))
	for k, v := range list {
		tMap := gconv.Map(v)
		gdbList[k] = tMap
	}
	gdbList = utils.ParentSonSort(gdbList)
	return nil, gdbList
}
