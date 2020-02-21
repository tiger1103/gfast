package admin

import (
	"fmt"
	"gfast/app/model/admin/auth_rule"
	"gfast/app/model/admin/role"
	"gfast/app/model/admin/user"
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/casbin_adapter_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//菜单用户组用户管理
type Auth struct{}

//菜单列表
func (c *Auth) MenuList(r *ghttp.Request) {
	//获取菜单信息
	err, list := auth_service.GetMenuList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	list = utils.PushSonToParent(list)
	response.SusJson(true, r, "成功", g.Map{
		"list": list,
	})
}

//菜单排序
func (c *Auth) MenuSort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "排序失败")
	}
	for k, v := range s {
		auth_rule.Model.Where("id=?", k).Data("weigh", v).Update()
	}
	response.SusJson(true, r, "排序成功")
}

//添加菜单
func (c *Auth) AddMenu(r *ghttp.Request) {
	if r.Method == "POST" {
		menu := new(auth_rule.MenuReq)
		if err := r.Parse(menu); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		//判断菜单规则是否存在
		if !auth_service.CheckMenuNameUnique(menu.Name, 0) {
			response.FailJson(true, r, "菜单规则名称已经存在")
		}
		//保存到数据库
		err, _ := auth_service.AddMenu(menu)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "添加菜单失败")
		}
		response.SusJson(true, r, "添加菜单成功")
	}
	//获取父级菜单信息
	err, list := auth_service.GetMenuList("ismenu=?", 1)
	if err != nil {
		response.FailJson(true, r, "获取数据失败")
	}
	list = utils.ParentSonSort(list)
	response.SusJson(true, r, "成功", g.Map{"parentList": list})
}

//修改菜单
func (c *Auth) EditMenu(r *ghttp.Request) {
	id := r.GetInt("id")
	if r.Method == "POST" {
		menu := new(auth_rule.MenuReq)
		if err := r.Parse(menu); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		//判断菜单规则是否存在
		if !auth_service.CheckMenuNameUnique(menu.Name, id) {
			response.FailJson(true, r, "菜单规则名称已经存在")
		}
		//保存到数据库
		err, _ := auth_service.EditMenu(menu, id)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "修改菜单失败")
		}
		response.SusJson(true, r, "修改菜单成功")
	}
	menuEntity, err := auth_rule.Model.Where("id=?", id).One()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	//获取父级菜单信息
	err, list := auth_service.GetMenuList("ismenu=?", 1)
	if err != nil {
		response.FailJson(true, r, "获取数据失败")
	}
	list = utils.ParentSonSort(list)
	response.SusJson(true, r, "成功", g.Map{
		"parentList": list,
		"menu":       menuEntity,
	})
}

//删除菜单
func (c *Auth) DeleteMenu(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败，参数错误")
	}
	_, err := auth_rule.Model.Where("id in(?)", ids).Delete()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}

//角色列表
func (c *Auth) RoleList(r *ghttp.Request) {
	//获取角色列表
	err, list := auth_service.GetRoleList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	list = utils.PushSonToParent(list, 0, "parent_id", "id", "children", "", nil, false)
	response.SusJson(true, r, "成功", g.Map{
		"list": list,
	})
}

//添加角色
func (c *Auth) AddRole(r *ghttp.Request) {
	//添加操作
	if r.Method == "POST" {
		//获取表单提交的数据
		res := r.GetFormMap()
		tx, err := g.DB("default").Begin() //开启事务
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "事务处理失败")
		}
		//插入角色
		//添加角色获取添加的id
		insertId, err := auth_service.AddRole(tx, res)
		if err != nil {
			tx.Rollback() //回滚
			response.FailJson(true, r, err.Error())
		}
		//添加角色权限
		err = auth_service.AddRoleRule(res["rule"], insertId)
		if err != nil {
			tx.Rollback() //回滚
			g.Log().Error(err.Error())
			response.FailJson(true, r, "添加用户组失败")
		}
		tx.Commit()
		response.SusJson(true, r, "添加用户组成功")
	}
	//获取父级组
	err, pList := auth_service.GetRoleList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取父级数据失败")
	}
	pList = utils.ParentSonSort(pList, 0, 0, "parent_id", "id", "flg", "name")
	//获取菜单信息
	err, mList := auth_service.GetMenuList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取菜单数据失败")
	}
	mList = utils.PushSonToParent(mList)
	res := g.Map{
		"parentList": pList,
		"menuList":   mList,
	}
	response.SusJson(true, r, "成功", res)
}

//修改角色
func (c *Auth) EditRole(r *ghttp.Request) {
	id := r.GetRequestInt64("id")
	if r.Method == "POST" {
		//获取表单提交的数据
		res := r.GetFormMap()
		tx, err := g.DB("default").Begin() //开启事务
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "事务处理失败")
		}
		//修改角色信息
		err = auth_service.EditRole(tx, res)
		if err != nil {
			tx.Rollback() //回滚
			response.FailJson(true, r, err.Error())
		}
		//添加角色权限
		err = auth_service.EditRoleRule(res["rule"], id)
		if err != nil {
			tx.Rollback() //回滚
			g.Log().Error(err.Error())
			response.FailJson(true, r, "添加用户组失败")
		}
		tx.Commit()
		response.SusJson(true, r, "修改用户组成功")
	}
	//获取角色信息
	role, err := role.Model.Where("id=?", id).One()
	if err != nil {
		response.FailJson(true, r, "获取角色数据失败")
	}
	//获取父级组
	err, pList := auth_service.GetRoleList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取父级数据失败")
	}
	pList = utils.ParentSonSort(pList, 0, 0, "parent_id", "id", "flg", "name")
	//获取菜单信息
	err, mList := auth_service.GetMenuList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取菜单数据失败")
	}
	//获取角色关联的菜单规则
	enforcer, err := casbin_adapter_service.GetEnforcer()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取权限处理器失败")
	}
	gp := enforcer.GetFilteredNamedPolicy("p", 0, fmt.Sprintf("g_%d", id))
	g.Log().Debug(gp)
	gpMap := map[int64]int64{}
	for _, v := range gp {
		gpMap[gconv.Int64(gstr.SubStr(v[1], 2))] = gconv.Int64(gstr.SubStr(v[1], 2))
	}
	//关联选中的权限
	for k, v := range mList {
		if _, has := gpMap[gconv.Int64(v["id"])]; has {
			v["isChecked"] = true
		} else {
			v["isChecked"] = false
		}
		mList[k] = v
	}
	mList = utils.PushSonToParent(mList)
	res := g.Map{
		"parentList": pList,
		"menuList":   mList,
		"role":       role,
	}
	response.SusJson(true, r, "成功", res)
}

//删除角色
func (c *Auth) DeleteRole(r *ghttp.Request) {
	ids := r.GetRequestArray("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败，参数错误")
	}
	tx, err := g.DB("default").Begin() //开启事务
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "事务处理失败")
	}
	_, err = tx.Table(role.Table).Where("id in(?)", ids).Delete()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		response.FailJson(true, r, "删除失败")
	}
	//删除角色的权限
	for _, v := range ids {
		err = auth_service.DeleteRoleRule(gconv.Int64(v))
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			response.FailJson(true, r, "删除失败")
		}
	}
	tx.Commit()
	response.SusJson(true, r, "删除成功")
}

//添加管理员
func (c *Auth) AddUser(r *ghttp.Request) {
	if r.Method == "POST" {
		requestData := r.GetFormMap()
		InsertId, err := auth_service.AddUser(requestData)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		//设置用户所属角色信息
		err = auth_service.AddUserRole(requestData["role_id"], InsertId)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "设置用户权限失败")
		}
		response.SusJson(true, r, "添加管理员成功")
	}
	//获取角色信息
	err, roleList := auth_service.GetRoleList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取角色数据失败")
	}
	roleList = utils.ParentSonSort(roleList, 0, 0, "parent_id", "id", "flg", "name")
	res := g.Map{
		"roleList": roleList,
	}
	response.SusJson(true, r, "成功", res)
}

//修改管理员
func (c *Auth) EditUser(r *ghttp.Request) {
	id := r.GetRequestInt64("id")
	if r.Method == "POST" {
		requestData := r.GetFormMap()
		err := auth_service.EditUser(requestData)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		//设置用户所属角色信息
		err = auth_service.EditUserRole(requestData["role_id"], id)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "设置用户权限失败")
		}
		response.SusJson(true, r, "修改管理员成功")
	}
	//用户用户信息
	userEntity, err := user.Model.Where("id=?", id).One()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取用户数据失败")
	}
	//获取角色信息
	err, roleList := auth_service.GetRoleList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取角色数据失败")
	}
	roleList = utils.ParentSonSort(roleList, 0, 0, "parent_id", "id", "flg", "name")
	res := g.Map{
		"roleList": roleList,
		"userInfo": userEntity,
	}
	response.SusJson(true, r, "成功", res)
}

//用户列表
func (c *Auth) UserList(r *ghttp.Request) {
	keyWords := r.GetString("keywords")
	page := r.GetInt("page")
	if page == 0 {
		page = 1
	}
	var where = map[string]interface{}{}
	if keyWords != "" {
		where["keyWords"] = keyWords
	}
	total, userList, err := user_service.GetAdminList(where, page)
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取用户列表数据失败")
	}
	users := make([]g.Map, len(userList))
	for k, u := range userList {
		users[k] = gconv.Map(u)
		roles, err := user_service.GetAdminRole(gconv.Int(u.Id))
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "获取用户角色数据失败")
		}
		roleInfo := make(map[int]string, len(roles))
		for _, r := range roles {
			roleInfo[r.Id] = r.Name
		}
		users[k]["roleInfo"] = roleInfo
	}
	//获取用户对应角色

	res := g.Map{
		"total":       total,
		"currentPage": page,
		"userList":    users,
	}
	response.SusJson(true, r, "成功", res)
}

//删除管理员
func (c *Auth) DeleteAdmin(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) > 0 {
		_, err := user.Model.Where("id in(?)", ids).Delete()
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "删除失败")
		}
	} else {
		response.FailJson(true, r, "删除失败，参数错误")
	}
	//删除对应权限
	enforcer, err := casbin_adapter_service.GetEnforcer()
	if err == nil {
		for _, v := range ids {
			enforcer.RemoveFilteredGroupingPolicy(0, fmt.Sprintf("u_%d", v))
		}
	}
	response.SusJson(true, r, "删除成功")
}
