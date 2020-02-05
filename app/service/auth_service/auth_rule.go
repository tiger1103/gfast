package auth_service

import (
	"database/sql"
	"gfast/app/model/auth_rule"
	"gfast/app/model/role"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
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

//获取用户组列表
func GetRoleList(where string, params ...interface{}) (err error, list g.List) {
	var rl []*role.Entity
	if where != "" {
		rl, err = role.Model.Where(where, params).OrderBy("list_order asc,id asc").All()
	} else {
		rl, err = role.Model.OrderBy("list_order asc,id asc").All()
	}
	if err != nil {
		g.Log().Error(err)
		return err, nil
	}
	list = make(g.List, len(rl))
	for k, v := range rl {
		tMap := gconv.Map(v)
		list[k] = tMap
	}
	return
}

//保存角色信息并返回插入的id
func AddRole(tx *gdb.TX, data map[string]interface{}) (InsId int64, err error) {
	if e := checkRoleData(data); e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	//保存角色信息
	now := gtime.Timestamp()
	roleMap := gdb.Map{
		"parent_id":   data["parent_id"],
		"status":      data["status"],
		"name":        data["name"],
		"create_time": now,
		"update_time": now,
		"list_order":  data["list_order"],
		"remark":      data["remark"],
	}
	var res sql.Result
	res, err = tx.Table(role.Table).Data(roleMap).Save()
	if err != nil {
		return
	}
	InsId, _ = res.LastInsertId()
	return
}

func AddRoleRule(tx *gdb.TX, iRule interface{}, roleId int64) (err error) {
	rule := iRule.([]interface{})
	for _, v := range rule {
		g.Log().Debug(v)
	}
	return
}

func checkRoleData(params map[string]interface{}) error {
	rules := []string{
		"name@required|length:1,20#请填写角色名称|名称应在:min到:max个字符之间",
		"parent_id@integer|min:0#父级ID必须为整数|父级ID必须大于等于0",
	}

	e := gvalid.CheckMap(params, rules)
	if e != nil {
		return e
	}
	return nil
}
