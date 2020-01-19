package auth_service

import (
	"gfast/app/model/auth_rule"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

//菜单对象
type MenuReq struct {
	IsMenu    int    `p:"ismenu" c:"ismenu" v:"min:0|max:1#菜单类型最小值为:min|菜单类型最大值为:max"`
	Pid       int    `p:"pid" c:"pid" v:"min:0"`
	Name      string `p:"name" c:"name" v:"required#请填写规则名称"`
	Title     string `p:"title" c:"title" v:"required|length:1,100#请填写标题|标题长度在:min到:max位"`
	Icon      string `p:"icon" c:"icon"`
	Weigh     int    `p:"weigh" c:"weigh"`
	Condition string `p:"condition" c:"condition"`
	Remark    string `p:"remark" c:"remark"`
	Status    int    `p:"status" c:"status"`
}

//获取菜单列表
func GetMenuList(where string, params ...interface{}) (error, g.List) {
	var err error
	var list []*auth_rule.Entity
	if where != "" {
		list, err = auth_rule.Model.Where(where, params...).Order("weigh desc,id asc").FindAll()
	} else {
		list, err = auth_rule.Model.Order("weigh desc,id asc").FindAll()
	}
	if err != nil {
		g.Log().Error(err)
		return err, nil
	}
	var gList = make(g.List, len(list))
	for k, v := range list {
		tMap := gconv.Map(v)
		gList[k] = tMap
	}
	return nil, gList
}

// 添加菜单操作
func AddMenu(req *MenuReq) (err error, insertId int64) {
	menuMap := gconv.Map(req)
	now := gtime.Timestamp()
	menuMap["createtime"] = now
	menuMap["updatetime"] = now
	res, e := auth_rule.Model.Insert(menuMap)
	err = e
	insertId, _ = res.LastInsertId()
	return
}

//修改菜单操作
func EditMenu(req *MenuReq, id int) (err error, rows int64) {
	menuMap := gconv.Map(req)
	now := gtime.Timestamp()
	menuMap["updatetime"] = now
	res, e := auth_rule.Model.Where("id=?", id).Update(menuMap)
	err = e
	rows, _ = res.RowsAffected()
	return
}
