package auth_service

import (
	"database/sql"
	"errors"
	"fmt"
	"gfast/app/model/admin/auth_rule"
	"gfast/app/model/admin/role"
	"gfast/app/model/admin/user"
	"gfast/app/service/cache_service"
	"gfast/app/service/casbin_adapter_service"
	"gfast/library/utils"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//获取isMenu==1菜单列表
func GetIsMenuList() ([]*auth_rule.Entity, error) {
	list, err := GetMenuList()
	if err != nil {
		return nil, err
	}
	var gList = make([]*auth_rule.Entity, 0, len(list))
	for _, v := range list {
		if v.Ismenu == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

//获取isMenu=1且status=1的菜单列表
func GetIsMenuStatusList() ([]*auth_rule.Entity, error) {
	list, err := GetMenuList()
	if err != nil {
		return nil, err
	}
	var gList = make([]*auth_rule.Entity, 0, len(list))
	for _, v := range list {
		if v.Ismenu == 1 && v.Status == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

//获取status==1的菜单列表
func GetMenuIsStatusList() ([]*auth_rule.Entity, error) {
	list, err := GetMenuList()
	if err != nil {
		return nil, err
	}
	var gList = make([]*auth_rule.Entity, 0, len(list))
	for _, v := range list {
		if v.Status == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

//获取所有菜单
func GetMenuList() (list []*auth_rule.Entity, err error) {
	cache := cache_service.New()
	//从缓存获取
	iList := cache.Get(cache_service.AdminAuthMenu)
	if iList != nil {
		list = iList.([]*auth_rule.Entity)
		return
	}
	//从数据库获取
	list, err = auth_rule.Model.Order("weigh desc,id asc").FindAll()
	if err != nil {
		return
	}
	//缓存菜单
	cache.Set(cache_service.AdminAuthMenu, list, 0, cache_service.AdminAuthTag)
	return
}

//检查菜单规则是否存在
func CheckMenuNameUnique(name string, id int) bool {
	model := auth_rule.Model.Where("name=?", name)
	if id != 0 {
		model = model.And("id!=?", id)
	}
	c, err := model.Count()
	if err != nil {
		g.Log().Error(err)
		return false
	}
	return c == 0
}

// 添加菜单操作
func AddMenu(req *auth_rule.MenuReq) (err error, insertId int64) {
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
func EditMenu(req *auth_rule.MenuReq, id int) (err error, rows int64) {
	menuMap := gconv.Map(req)
	now := gtime.Timestamp()
	menuMap["updatetime"] = now
	res, e := auth_rule.Model.Where("id=?", id).Update(menuMap)
	err = e
	rows, _ = res.RowsAffected()
	return
}

//获取用户组(角色)列表
func GetRoleList() (list []*role.Entity, err error) {
	cache := cache_service.New()
	//从缓存获取
	iList := cache.Get(cache_service.AdminAuthRole)
	if iList != nil {
		list = iList.([]*role.Entity)
		return
	}
	//从数据库获取
	list, err = role.Model.OrderBy("list_order asc,id asc").All()
	//缓存数据
	cache.Set(cache_service.AdminAuthRole, list, 0, cache_service.AdminAuthTag)
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

//添加角色授权规则
func AddRoleRule(iRule interface{}, roleId int64) (err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	rule := gconv.Strings(iRule)
	for _, v := range rule {
		_, err = enforcer.AddPolicy(fmt.Sprintf("g_%d", roleId), fmt.Sprintf("r_%s", v), "All")
		if err != nil {
			return
		}
	}
	return
}

//修改角色信息操作
func EditRole(tx *gdb.TX, data map[string]interface{}) (err error) {
	if _, k := data["id"]; !k {
		err = errors.New("缺少更新条件Id")
		return
	}
	if e := checkRoleData(data); e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	//保存角色信息
	now := gtime.Timestamp()
	roleMap := gdb.Map{
		"id":          data["id"],
		"parent_id":   data["parent_id"],
		"status":      data["status"],
		"name":        data["name"],
		"update_time": now,
		"list_order":  data["list_order"],
		"remark":      data["remark"],
	}
	_, err = tx.Table(role.Table).Data(roleMap).Save()
	if err != nil {
		return
	}
	return
}

//修改角色的授权规则
func EditRoleRule(iRule interface{}, roleId int64) (err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	//查询当前权限
	gp := enforcer.GetFilteredPolicy(0, fmt.Sprintf("g_%d", roleId))
	//删除旧权限
	for _, v := range gp {
		_, e = enforcer.RemovePolicy(v)
		if e != nil {
			err = e
			return
		}
	}
	rule := gconv.Strings(iRule)
	for _, v := range rule {
		_, err = enforcer.AddPolicy(fmt.Sprintf("g_%d", roleId), fmt.Sprintf("r_%s", v), "All")
		if err != nil {
			return
		}
	}
	return
}

//删除角色权限操作
func DeleteRoleRule(roleId int) (err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	//查询当前权限
	gp := enforcer.GetFilteredNamedPolicy("p", 0, fmt.Sprintf("g_%d", roleId))
	//删除旧权限
	for _, v := range gp {
		_, e = enforcer.RemovePolicy(v)
		if e != nil {
			err = e
			return
		}
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

//添加管理员操作
func AddUser(data map[string]interface{}) (InsertId int64, err error) {
	e := checkUserData(data, "add")
	if e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	if i, _ := user.Model.Where("user_name=?", data["user_name"]).Count(); i != 0 {
		err = gerror.New("用户名已经存在")
		return
	}
	if i, _ := user.Model.Where("mobile=?", data["mobile"]).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		return
	}
	//保存管理员信息
	data["create_time"] = gtime.Timestamp()
	//密码加密
	data["user_password"] = utils.EncryptCBC(gconv.String(data["user_password"]), utils.AdminCbcPublicKey)
	res, err := user.Model.Filter().Data(data).Save()
	if err != nil {
		return
	}
	InsertId, _ = res.LastInsertId()
	return
}

//修改用户信息
func EditUser(data map[string]interface{}) (err error) {
	e := checkUserData(data, "edit")
	if e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	if i, _ := user.Model.Where("id!=? and user_name=?", data["id"], data["user_name"]).Count(); i != 0 {
		err = gerror.New("用户名已经存在")
		return
	}
	if i, _ := user.Model.Where("id!=? and mobile=?", data["mobile"]).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		return
	}
	//保存管理员信息
	//提交了密码？密码加密
	if val, ok := data["user_password"]; ok && gconv.String(val) != "" {
		data["user_password"] = utils.EncryptCBC(gconv.String(data["user_password"]), utils.AdminCbcPublicKey)
	} else {
		delete(data, "user_password")
	}
	_, err = user.Model.Filter().Data(data).Save()
	if err != nil {
		return
	}
	return
}

//添加用户角色信息
func AddUserRole(roleIds interface{}, userId int64) (err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	rule := gconv.Ints(roleIds)
	for _, v := range rule {
		_, err = enforcer.AddGroupingPolicy(fmt.Sprintf("u_%d", userId), fmt.Sprintf("g_%d", v))
		if err != nil {
			return
		}
	}
	return
}

//修改用户角色信息
func EditUserRole(roleIds interface{}, userId int) (err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	rule := gconv.Ints(roleIds)
	//删除用户旧角色信息
	enforcer.RemoveFilteredGroupingPolicy(0, fmt.Sprintf("u_%d", userId))
	for _, v := range rule {
		_, err = enforcer.AddGroupingPolicy(fmt.Sprintf("u_%d", userId), fmt.Sprintf("g_%d", v))
		if err != nil {
			return
		}
	}
	return
}

//验证用户表单数据
func checkUserData(params map[string]interface{}, t string) error {
	rules := []string{
		"id@integer|min:1#管理员id必须为整数|管理员Id必须大于0",
		"user_name@required|length:3,60#请填用户名|用户名应在:min到:max个字符之间",
		"mobile@telephone#手机号码格式不正确",
		"user_nickname@required|length:3,50#请填写姓名|姓名应在:min到:max个字符之间",
		"user_email@email#邮箱格式错误",
	}
	if t == "add" {
		rules = append(rules, "user_password@required|length:6,60#请填写密码|密码应在::min到:max个字符之间")
	} else {
		rules = append(rules, "user_password@length:6,60#密码应在::min到:max个字符之间")
	}
	e := gvalid.CheckMap(params, rules)
	if e != nil {
		return e
	}
	return nil
}

func DeleteRoleByIds(ids []int) (err error) {
	//查询所有子级id
	roleAllEntity, err := GetRoleList()
	if err != nil {
		g.Log().Debug(err)
		err = gerror.New("删除失败，不存在角色信息")
		return
	}
	roleAll := gconv.SliceMap(roleAllEntity)
	sonList := make(g.List, 0, len(roleAll))
	for _, id := range ids {
		sonList = append(sonList, utils.FindSonByParentId(roleAll, id, "parent_id", "id")...)
	}
	for _, role := range sonList {
		ids = append(ids, gconv.Int(role["id"]))
	}
	tx, err := g.DB("default").Begin() //开启事务
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("事务处理失败")
		return
	}
	_, err = tx.Table(role.Table).Where("id in(?)", ids).Delete()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		err = gerror.New("删除失败")
		return
	}
	//删除角色的权限
	for _, v := range ids {
		err = DeleteRoleRule(v)
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			err = gerror.New("删除失败")
			return
		}
	}
	tx.Commit()
	return
}

//删除菜单
func DeleteMenuByIds(ids []int) (err error) {
	//获取菜单数据
	menus, err := GetMenuList()
	if err != nil {
		return
	}
	menuList := gconv.SliceMap(menus)
	son := make(g.List, 0, len(menuList))
	for _, id := range ids {
		son = append(son, utils.FindSonByParentId(menuList, id, "pid", "id")...)
	}
	for _, v := range son {
		ids = append(ids, gconv.Int(v["id"]))
	}
	_, err = auth_rule.Model.Where("id in (?)", ids).Delete()
	return
}
