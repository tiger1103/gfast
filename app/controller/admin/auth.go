package admin

import (
	"fmt"
	"gfast/app/model/admin/auth_rule"
	"gfast/app/model/admin/role"
	"gfast/app/model/admin/sys_dept"
	"gfast/app/model/admin/user"
	"gfast/app/model/admin/user_post"
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/admin/dept_service"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/post_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/cache_service"
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

// @Summary 分页列表
// @Description 获取菜单列表
// @Tags 菜单管理
// @Param data body auth_rule.ReqSearch true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/auth/menuList [get]
// @Security
func (c *Auth) MenuList(r *ghttp.Request) {
	var req *auth_rule.ReqSearch
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	var listEntities []*auth_rule.Entity
	var err error
	if req != nil {
		listEntities, err = auth_service.GetMenuListSearch(req)
	} else {
		//获取菜单信息
		listEntities, err = auth_service.GetMenuList()
	}
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	list := gconv.SliceMap(listEntities)
	if req != nil {
		for k := range list {
			list[k]["children"] = nil
		}
	} else {
		list = utils.PushSonToParent(list, 0, "pid", "id", "children", "", nil, true)
	}
	//菜单显示状态
	visibleOptions, err := dict_service.GetDictWithDataByType("sys_show_hide", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//菜单正常or停用状态
	statusOptions, err := dict_service.GetDictWithDataByType("sys_normal_disable", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	response.SusJson(true, r, "成功", g.Map{
		"list":           list,
		"visibleOptions": visibleOptions,
		"statusOptions":  statusOptions,
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
	cache_service.New().RemoveByTag(cache_service.AdminAuthTag)
	response.SusJson(true, r, "排序成功")
}

// @Summary 添加菜单
// @Description 添加菜单
// @Tags 菜单管理
// @Accept  application/json
// @Product application/json
// @Param data body auth_rule.MenuReq true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/addMenu [post]
// @Security Bearer
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
		//判断路由是否已经存在
		if !auth_service.CheckMenuPathUnique(menu.Path, 0) {
			response.FailJson(true, r, "路由地址已经存在")
		}
		//保存到数据库
		err, _ := auth_service.AddMenu(menu)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "添加菜单失败")
		}
		//清除TAG缓存
		cache_service.New().RemoveByTag(cache_service.AdminAuthTag)
		response.SusJson(true, r, "添加菜单成功")
	}
	//获取父级菜单信息
	listEntities, err := auth_service.GetIsMenuList()
	if err != nil {
		response.FailJson(true, r, "获取数据失败")
	}
	response.SusJson(true, r, "成功", g.Map{"parentList": listEntities})
}

// @Summary 修改菜单
// @Description 修改菜单
// @Tags 菜单管理
// @Accept  application/json
// @Product application/json
// @Param data body auth_rule.MenuReq true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "修改成功"}"
// @Router /system/auth/editMenu [post]
// @Security Bearer
func (c *Auth) EditMenu(r *ghttp.Request) {
	id := r.GetInt("menuId")
	if r.Method == "POST" {
		menu := new(auth_rule.MenuReq)
		if err := r.Parse(menu); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		//判断菜单规则是否存在
		if !auth_service.CheckMenuNameUnique(menu.Name, id) {
			response.FailJson(true, r, "菜单规则名称已经存在")
		}
		//判断路由是否已经存在
		if !auth_service.CheckMenuPathUnique(menu.Path, id) {
			response.FailJson(true, r, "路由地址已经存在")
		}
		//保存到数据库
		err, _ := auth_service.EditMenu(menu, id)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "修改菜单失败")
		}
		//清除TAG缓存
		cache_service.New().RemoveByTag(cache_service.AdminAuthTag)
		response.SusJson(true, r, "修改菜单成功")
	}
	menuEntity, err := auth_rule.Model.Where("id=?", id).One()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	//获取父级菜单信息
	listEntities, err := auth_service.GetIsMenuList()
	if err != nil {
		response.FailJson(true, r, "获取数据失败")
	}
	list := gconv.SliceMap(listEntities)
	list = utils.ParentSonSort(list)
	response.SusJson(true, r, "成功", g.Map{
		"parentList": list,
		"menu":       menuEntity,
	})
}

// @Summary 删除菜单
// @Description 删除菜单
// @Tags 菜单管理
// @Accept  application/json
// @Product application/json
// @Param ids body integer  true "ids[1,2,3]"
// @Success 200 {object} response.Response	"{"code": 0, "message": "修改成功"}"
// @Router /system/auth/deleteMenu [delete]
// @Security Bearer
func (c *Auth) DeleteMenu(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败，参数错误")
	}
	err := auth_service.DeleteMenuByIds(ids)
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "删除失败")
	}
	//清除TAG缓存
	cache_service.New().RemoveByTag(cache_service.AdminAuthTag)
	response.SusJson(true, r, "删除成功")
}

// @Summary 角色列表
// @Description 分页列表
// @Tags 角色管理
// @Param data body role.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/auth/roleList [get]
// @Security
func (c *Auth) RoleList(r *ghttp.Request) {
	var req *role.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	//获取角色列表
	total, page, list, err := auth_service.GetRoleListSearch(req)
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	//菜单正常or停用状态
	statusOptions, err := dict_service.GetDictWithDataByType("sys_normal_disable", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "成功", g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
		"searchTypes": statusOptions,
	})
}

// @Summary 添加角色
// @Description 添加角色
// @Tags 角色管理
// @Accept  application/json
// @Product application/json
// @Param data body string  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/addRole [post]
// @Security Bearer
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
		err = auth_service.AddRoleRule(res["menuIds"], insertId)
		if err != nil {
			tx.Rollback() //回滚
			g.Log().Error(err.Error())
			response.FailJson(true, r, "添加角色失败")
		}
		tx.Commit()
		//清除TAG缓存
		cache_service.New().RemoveByTag(cache_service.AdminAuthTag)
		response.SusJson(true, r, "添加角色成功")
	}

	//获取菜单信息
	mListEntities, err := auth_service.GetMenuList()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取菜单数据失败")
	}
	var mList g.ListStrAny
	for _, entity := range mListEntities {
		m := g.Map{
			"id":    entity.Id,
			"pid":   entity.Pid,
			"label": entity.Title,
		}
		mList = append(mList, m)
	}
	mList = utils.PushSonToParent(mList)
	res := g.Map{
		"menuList": mList,
	}
	response.SusJson(true, r, "成功", res)
}

// @Summary 修改角色
// @Description 修改角色
// @Tags 角色管理
// @Accept  application/json
// @Product application/json
// @Param data body string  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/editRole [post]
// @Security Bearer
func (c *Auth) EditRole(r *ghttp.Request) {
	id := r.GetRequestInt64("roleId")
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
		err = auth_service.EditRoleRule(res["menuIds"], id)
		if err != nil {
			tx.Rollback() //回滚
			g.Log().Error(err.Error())
			response.FailJson(true, r, "添加用户组失败")
		}
		tx.Commit()
		//清除TAG缓存
		cache_service.New().RemoveByTag(cache_service.AdminAuthTag)
		response.SusJson(true, r, "修改用户组成功")
	}
	//获取角色信息
	role, err := role.Model.Where("id=?", id).One()
	if err != nil {
		response.FailJson(true, r, "获取角色数据失败")
	}

	//获取菜单信息
	mListEntities, err := auth_service.GetMenuList()
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
	gpSlice := make([]int, len(gp))
	for k, v := range gp {
		gpSlice[k] = gconv.Int(gstr.SubStr(v[1], 2))
	}

	var mList g.ListStrAny
	for _, entity := range mListEntities {
		m := g.Map{
			"id":    entity.Id,
			"pid":   entity.Pid,
			"label": entity.Title,
		}
		mList = append(mList, m)
	}

	mList = utils.PushSonToParent(mList)
	res := g.Map{
		"menuList":     mList,
		"role":         role,
		"checkedRules": gpSlice,
	}
	response.SusJson(true, r, "成功", res)
}

// @Summary 删除角色
// @Description 删除角色
// @Tags 角色管理
// @Accept  application/json
// @Product application/json
// @Param ids body integer  true "ids[1,2,3]"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/deleteRole [delete]
// @Security Bearer
func (c *Auth) DeleteRole(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败，参数错误")
	}
	err := auth_service.DeleteRoleByIds(ids)
	if err != nil {
		response.FailJson(true, r, "删除失败，"+err.Error())
	}
	//清除TAG缓存
	cache_service.New().RemoveByTag(cache_service.AdminAuthTag)
	response.SusJson(true, r, "删除成功")
}

// @Summary 添加用户
// @Description 添加用户
// @Tags 用户管理
// @Accept  application/json
// @Product application/json
// @Param data body user.AddUserReq  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/addUser [post]
// @Security Bearer
func (c *Auth) AddUser(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *user.AddUserReq
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}

		InsertId, err := auth_service.AddUser(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		//设置用户所属角色信息
		err = auth_service.AddUserRole(req.RoleIds, InsertId)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "设置用户权限失败")
		}
		//设置用户岗位
		err = auth_service.AddUserPost(req.PostIds, InsertId)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "设置用户岗位信息失败")
		}
		response.SusJson(true, r, "添加管理员成功")
	}
	//获取角色信息
	roleListEntities, err := auth_service.GetRoleList()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取角色数据失败")
	}
	//获取岗位信息
	posts, err := post_service.GetUsedPost()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"roleList": roleListEntities,
		"posts":    posts,
	}
	response.SusJson(true, r, "成功", res)
}

// @Summary 编辑用户
// @Description 编辑用户
// @Tags 用户管理
// @Accept  application/json
// @Product application/json
// @Param data body user.EditUserReq  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/editUser [post]
// @Security Bearer
func (c *Auth) EditUser(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *user.EditUserReq
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err := auth_service.EditUser(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		//设置用户所属角色信息
		err = auth_service.EditUserRole(req.RoleIds, req.UserId)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "设置用户权限失败")
		}
		//设置用户岗位数据
		err = auth_service.AddUserPost(req.PostIds, gconv.Int64(req.UserId))
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "设置用户岗位信息失败")
		}
		response.SusJson(true, r, "修改管理员成功")
	}
	id := r.GetUint64("id")
	//用户用户信息
	userEntity, err := user.Model.Where("id=?", id).One()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取用户数据失败")
	}
	//获取角色信息
	roleListEntities, err := auth_service.GetRoleList()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取角色数据失败")
	}

	//获取已选择的角色信息
	checkedRoleIds, err := user_service.GetAdminRoleIds(id)
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取用户角色数据失败")
	}
	if checkedRoleIds == nil {
		checkedRoleIds = []uint{}
	}
	//获取岗位信息
	posts, err := post_service.GetUsedPost()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	checkedPosts, err := user_service.GetAdminPosts(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	if checkedPosts == nil {
		checkedPosts = []int64{}
	}
	res := g.Map{
		"roleList":       roleListEntities,
		"userInfo":       userEntity,
		"checkedRoleIds": checkedRoleIds,
		"posts":          posts,
		"checkedPosts":   checkedPosts,
	}
	response.SusJson(true, r, "成功", res)
}

// @Summary 用户列表
// @Description 分页列表
// @Tags 用户管理
// @Param data body user.SearchReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/Auth/userList [get]
// @Security
func (c *Auth) UserList(r *ghttp.Request) {
	var req *user.SearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, userList, err := user_service.GetAdminList(req)
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取用户列表数据失败")
	}
	users := make([]g.Map, len(userList))
	//获取所有角色信息
	allRoles, err := auth_service.GetRoleList()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取用户角色数据失败")
	}
	//获取所有部门信息
	depts, err := dept_service.GetList(&sys_dept.SearchParams{})
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取部门数据失败")
	}
	for k, u := range userList {
		var dept *sys_dept.Dept
		users[k] = gconv.Map(u)
		for _, d := range depts {
			if u.DeptId == d.DeptID {
				dept = d
			}
		}
		users[k]["dept"] = dept
		roles, err := user_service.GetAdminRole(u.Id, allRoles)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "获取用户角色数据失败")
		}
		roleInfo := make([]g.Map, 0, len(roles))
		for _, r := range roles {
			roleInfo = append(roleInfo, g.Map{"roleId": r.Id, "name": r.Name})
		}
		users[k]["user_status"] = gconv.String(u.UserStatus)
		users[k]["roleInfo"] = roleInfo
	}
	//用户状态
	statusOptions, err := dict_service.GetDictWithDataByType("sys_normal_disable", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//用户性别
	userGender, err := dict_service.GetDictWithDataByType("sys_user_sex", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"total":         total,
		"currentPage":   page,
		"userList":      users,
		"statusOptions": statusOptions,
		"userGender":    userGender,
	}
	response.SusJson(true, r, "成功", res)
}

// @Summary 删除管理员
// @Description 删除管理员
// @Tags 用户管理
// @Accept  application/json
// @Product application/json
// @Param ids path integer  true "ids[1,2,3...]"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/deleteAdmin [delete]
// @Security Bearer
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
	//删除用户对应的岗位
	_, err = user_post.Delete(user_post.Columns.UserId+" in (?)", ids)
	if err != nil {
		g.Log().Error(err)
	}
	response.SusJson(true, r, "删除成功")
}

// @Summary 设置角色状态
// @Description 设置角色状态
// @Tags 用户管理
// @Accept  application/json
// @Product application/json
// @Param data body role.StatusSetReq  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/statusSetRole [post]
// @Security Bearer
func (c *Auth) StatusSetRole(r *ghttp.Request) {
	var req *role.StatusSetReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := auth_service.StatusSetRole(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "状态设置成功")
}

// @Summary 角色数据权限分配
// @Description 角色数据权限分配
// @Tags 用户管理
// @Accept  application/json
// @Product application/json
// @Param data body role.DataScopeReq  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/roleDataScope [post]
// @Security Bearer
func (c *Auth) RoleDataScope(r *ghttp.Request) {
	var req *role.DataScopeReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := auth_service.RoleDataScope(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "数据权限设置成功", req)
}

// @Summary 修改用户状态
// @Description 修改用户状态
// @Tags 用户管理
// @Accept  application/json
// @Product application/json
// @Param data body user.StatusReq  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/changeUserStatus [post]
// @Security Bearer
func (c *Auth) ChangeUserStatus(r *ghttp.Request) {
	var req *user.StatusReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	if err := user_service.ChangeUserStatus(req); err != nil {
		response.FailJson(true, r, err.Error())
	} else {
		response.SusJson(true, r, "用户状态设置成功")
	}
}

// @Summary 重置用户密码
// @Description 重置用户密码
// @Tags 用户管理
// @Accept  application/json
// @Product application/json
// @Param data body user.ResetPwdReq  true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/auth/resetUserPwd [post]
// @Security Bearer
func (c *Auth) ResetUserPwd(r *ghttp.Request) {
	var req *user.ResetPwdReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	if err := user_service.ResetUserPwd(req); err != nil {
		response.FailJson(true, r, err.Error())
	} else {
		response.SusJson(true, r, "用户密码重置成功")
	}
}
