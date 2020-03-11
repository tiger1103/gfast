package auth_service

import (
	"fmt"
	"gfast/app/model/admin/auth_rule"
	"gfast/app/model/admin/role"
	"gfast/app/model/admin/user"
	"gfast/app/service/casbin_adapter_service"
	"gfast/library/utils"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/util/gconv"
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
	return auth_rule.GetMenuList()
}

//检查菜单规则是否存在
func CheckMenuNameUnique(name string, id int) bool {
	return auth_rule.CheckMenuNameUnique(name, id)
}

// 添加菜单操作
func AddMenu(req *auth_rule.MenuReq) (err error, insertId int64) {
	return auth_rule.Add(req)
}

//修改菜单操作
func EditMenu(req *auth_rule.MenuReq, id int) (err error, rows int64) {
	return auth_rule.Edit(req, id)
}

//获取用户组(角色)列表
func GetRoleList() (list []*role.Entity, err error) {
	return role.GetList()
}

//保存角色信息并返回插入的id
func AddRole(tx *gdb.TX, data map[string]interface{}) (InsId int64, err error) {
	return role.Add(tx, data)
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
	return role.Edit(tx, data)
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
	return role.DeleteRoleRule(roleId)
}

//添加管理员操作
func AddUser(data map[string]interface{}) (InsertId int64, err error) {
	//密码加密
	data["user_password"] = utils.EncryptCBC(gconv.String(data["user_password"]), utils.AdminCbcPublicKey)
	return user.Add(data)
}

//修改用户信息
func EditUser(data map[string]interface{}) (err error) {
	//提交了密码？密码加密
	if val, ok := data["user_password"]; ok && gconv.String(val) != "" {
		data["user_password"] = utils.EncryptCBC(gconv.String(data["user_password"]), utils.AdminCbcPublicKey)
	} else {
		delete(data, "user_password")
	}
	return user.Edit(data)
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

func DeleteRoleByIds(ids []int) (err error) {
	return role.DeleteByIds(ids)
}

//删除菜单
func DeleteMenuByIds(ids []int) (err error) {
	return auth_rule.DeleteByIds(ids)
}
