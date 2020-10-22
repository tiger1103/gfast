package user_service

import (
	"database/sql"
	"errors"
	"fmt"
	"gfast/app/model/admin/auth_rule"
	"gfast/app/model/admin/role"
	"gfast/app/model/admin/sys_dept"
	"gfast/app/model/admin/sys_post"
	"gfast/app/model/admin/user"
	"gfast/app/model/admin/user_post"
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/casbin_adapter_service"
	"gfast/boot"
	"gfast/library/service"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

type EditParams struct {
	Id           int    `p:"id" v:"required#用户id不能为空"`
	UserNickname string `p:"user_nickname" v:"required#用户昵称不能为空" orm:"user_nickname"` // 用户昵称
	Mobile       string `p:"mobile" v:"required|phone#手机号不能为空|手机号格式错误" orm:"mobile,unique"`
	UserEmail    string `p:"user_email" v:"email#邮箱格式错误" orm:"user_email"`
	Sex          int    `p:"sex" orm:"sex"`
}

type UpdatePwdReq struct {
	OldPassword string `p:"oldPassword" v:"required#旧密码不能为空"`
	NewPassword string `p:"newPassword" v:"required#新密码不能为空"`
}

/**
修改密码
*/
func UpdatePwd(r *ghttp.Request, data *UpdatePwdReq) error {

	currentUser, err := GetCurrentUserInfo(r)

	if err != nil {
		return err
	}

	OldPassword := utils.EncryptCBC(gconv.String(data.OldPassword), utils.AdminCbcPublicKey)

	if OldPassword != currentUser["user_password"].(string) {
		return errors.New("原始密码错误!")
	}

	return ResetUserPwd(&user.ResetPwdReq{
		Id:       gconv.Uint64(currentUser["id"]),
		Password: data.NewPassword,
	})
}

/**
用户中心修改用户信息
*/
func Edit(info *EditParams) (sql.Result, error) {
	return user.Model.Where("id", info.Id).Data(info).Update()
}

// 获取单前登录用户的信息
func GetCurrentUserInfo(r *ghttp.Request) (map[string]interface{}, error) {
	id := GetLoginID(r)
	userEntity, err := user.GetUserById(id)
	if err != nil {
		return nil, err
	}
	userInfo := gconv.Map(userEntity)
	//delete(userInfo, "user_password")
	userInfo["roles"] = make([]string, 0)
	userInfo["posts"] = new([]*user_post.Entity)
	userInfo["dept_info"] = nil
	allRoles, err := auth_service.GetRoleList()
	if err != nil {
		return nil, err
	}
	roles, err := GetAdminRole(userEntity.Id, allRoles)
	if err != nil {
		return nil, err
	}
	//角色
	userInfo["roles"] = roles
	//岗位
	posts, err := GetPostsByUserId(userEntity.Id)
	if err != nil {
		return nil, err
	}
	userInfo["posts"] = posts
	//部门
	if dept_info, err := sys_dept.GetDeptById(userEntity.DeptId); err != nil {
		return nil, err
	} else {
		userInfo["dept_info"] = dept_info
	}

	return userInfo, nil

}

func GetPostsByUserId(id uint64) ([]*sys_post.Entity, error) {
	return user_post.GetPostsByUserId(id)
}

//获取登陆用户ID
func GetLoginID(r *ghttp.Request) (userId uint64) {
	userInfo := GetLoginAdminInfo(r)
	if userInfo != nil {
		userId = userInfo.Id
	}
	return
}

//获取缓存的用户信息
func GetLoginAdminInfo(r *ghttp.Request) (userInfo *user.Entity) {
	resp := boot.AdminGfToken.GetTokenData(r)
	gconv.Struct(resp.Get("data"), &userInfo)
	return
}

//获取当前登录用户信息，直接从数据库获取
func GetCurrentUser(r *ghttp.Request) (userInfo *user.Entity, err error) {
	id := GetLoginID(r)
	userInfo, err = user.GetUserById(id)
	return
}

//获取管理员列表
func GetAdminList(req *user.SearchReq) (total, page int, userList []*user.Entity, err error) {
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}
	var depts []*sys_dept.Dept
	if req.DeptId != "" {
		depts, err = sys_dept.GetList(&sys_dept.SearchParams{Status: "1"})
		if err != nil {
			g.Log().Error(err)
			err = gerror.New("获取部门信息失败")
			return
		}
		mDepts := gconv.SliceMap(depts)
		deptId := gconv.Int(req.DeptId)
		req.DeptIds = append(req.DeptIds, deptId)
		childrenIds := utils.FindSonByParentId(mDepts, deptId, "parentId", "deptId")
		for _, d := range childrenIds {
			req.DeptIds = append(req.DeptIds, gconv.Int(d["deptId"]))
		}
	}
	return user.GetAdminList(req)
}

//获取管理员的角色信息
func GetAdminRole(userId uint64, allRoleList []*role.Entity) (roles []*role.Entity, err error) {
	roleIds, err := GetAdminRoleIds(userId)
	if err != nil {
		return
	}
	roles = make([]*role.Entity, 0, len(allRoleList))
	for _, v := range allRoleList {
		for _, id := range roleIds {
			if id == v.Id {
				roles = append(roles, v)
			}
		}
		if len(roles) == len(roleIds) {
			break
		}
	}
	return
}

//获取管理员对应的角色ids
func GetAdminRoleIds(userId uint64) (roleIds []uint, err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	//查询关联角色规则
	groupPolicy := enforcer.GetFilteredGroupingPolicy(0, fmt.Sprintf("u_%d", userId))
	if len(groupPolicy) > 0 {
		roleIds = make([]uint, len(groupPolicy))
		//得到角色id的切片
		for k, v := range groupPolicy {
			roleIds[k] = gconv.Uint(gstr.SubStr(v[1], 2))
		}
	}
	return
}

func GetAdminPosts(userId uint64) (postIds []int64, err error) {
	return user_post.GetAdminPosts(userId)
}

//获取菜单
func GetAllMenus() (menus g.List, err error) {
	//获取所有开启的菜单
	allMenus, err := auth_service.GetIsMenuStatusList()
	if err != nil {
		return
	}
	menus = make(g.List, len(allMenus))
	for k, v := range allMenus {
		menu := gconv.Map(v)
		menu = setMenuMap(menu, v)
		menus[k] = menu
	}
	menus = utils.PushSonToParent(menus, 0, "pid", "id", "children", "", nil, true)
	return
}

//获取管理员所属角色菜单
func GetAdminMenusByRoleIds(roleIds []uint) (menus g.List, err error) {
	//获取角色对应的菜单id
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	menuIds := map[int64]int64{}
	for _, roleId := range roleIds {
		//查询当前权限
		gp := enforcer.GetFilteredPolicy(0, fmt.Sprintf("g_%d", roleId))
		for _, p := range gp {
			mid := gconv.Int64(gstr.SubStr(p[1], 2))
			menuIds[mid] = mid
		}
	}
	//获取所有开启的菜单
	allMenus, err := auth_service.GetIsMenuStatusList()
	if err != nil {
		return
	}
	roleMenus := make(g.List, 0, len(allMenus))
	for _, v := range allMenus {
		if _, ok := menuIds[gconv.Int64(v.Id)]; gstr.Equal(v.Condition, "nocheck") || ok {
			roleMenu := gconv.Map(v)
			roleMenu = setMenuMap(roleMenu, v)
			roleMenus = append(roleMenus, roleMenu)
		}
	}
	menus = utils.PushSonToParent(roleMenus, 0, "pid", "id", "children", "", nil, true)
	return
}

//组合返回menu前端数据
func setMenuMap(menu g.Map, entity *auth_rule.Entity) g.Map {
	menu["index"] = entity.Name
	menu["name"] = gstr.UcFirst(entity.Path)
	menu["menuName"] = entity.Title
	if entity.MenuType != 0 {
		menu["component"] = entity.Component
		menu["path"] = entity.Path
	} else {
		menu["path"] = "/" + entity.Path
		menu["component"] = "Layout"
	}
	menu["meta"] = g.MapStrStr{
		"icon":  entity.Icon,
		"title": entity.Title,
	}
	if entity.AlwaysShow == 1 {
		menu["hidden"] = false
	} else {
		menu["hidden"] = true
	}
	if entity.AlwaysShow == 1 && entity.MenuType == 0 {
		menu["alwaysShow"] = true
	} else {
		menu["alwaysShow"] = false
	}
	return menu
}

func ChangeUserStatus(req *user.StatusReq) error {
	return user.ChangeUserStatus(req)
}

func ResetUserPwd(req *user.ResetPwdReq) error {
	//密码加密
	req.Password = utils.EncryptCBC(gconv.String(req.Password), utils.AdminCbcPublicKey)
	return user.ResetUserPwd(req)
}

func GetPermissions(roleIds []uint) ([]string, error) {
	//获取角色对应的菜单id
	enforcer, err := casbin_adapter_service.GetEnforcer()
	if err != nil {
		return nil, err
	}
	menuIds := map[int64]int64{}
	for _, roleId := range roleIds {
		//查询当前权限
		gp := enforcer.GetFilteredPolicy(0, fmt.Sprintf("g_%d", roleId))
		for _, p := range gp {
			mid := gconv.Int64(gstr.SubStr(p[1], 2))
			menuIds[mid] = mid
		}
	}
	//获取所有开启的按钮
	allButtons, err := auth_service.GetIsButtonStatusList()
	userButtons := make([]string, 0, len(allButtons))
	for _, button := range allButtons {
		if _, ok := menuIds[gconv.Int64(button.Id)]; gstr.Equal(button.Condition, "nocheck") || ok {
			userButtons = append(userButtons, button.Name)
		}
	}
	return userButtons, nil
}
