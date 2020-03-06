package user_service

import (
	"fmt"
	"gfast/app/model/admin/role"
	"gfast/app/model/admin/user"
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/casbin_adapter_service"
	"gfast/boot"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//获取登陆用户ID
func GetLoginID(r *ghttp.Request) (userId int) {
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

//获取管理员列表
func GetAdminList(where g.Map, page int) (total int, userList []*user.Entity, err error) {
	userModel := user.Model
	if v, ok := where["keyWords"]; ok {
		keyWords := gconv.String(v)
		if keyWords != "" {
			keyWords = "%" + keyWords + "%"
			userModel = userModel.Where("user_name like ? or mobile like ? or user_nickname like ?",
				keyWords, keyWords, keyWords)
		}
	}
	total, err = userModel.Count()
	userList, err = userModel.ForPage(page, utils.AdminPageNum).OrderBy("id asc").All()
	return
}

//获取管理员的角色信息
func GetAdminRole(userId int, allRoleList []*role.Entity) (roles []*role.Entity, err error) {
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
	}
	return
}

//获取管理员对应的角色ids
func GetAdminRoleIds(userId int) (roleIds []int, err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	//查询关联角色规则
	groupPolicy := enforcer.GetFilteredGroupingPolicy(0, fmt.Sprintf("u_%d", userId))
	if len(groupPolicy) > 0 {
		roleIds = make([]int, len(groupPolicy))
		//得到角色id的切片
		for k, v := range groupPolicy {
			roleIds[k] = gconv.Int(gstr.SubStr(v[1], 2))
		}
	}
	return
}

//根据用户id获取用户信息
func GetAdminInfoById(id int64) (userMap g.Map) {
	//获取用户角色信息
	if id != 0 {
		userInfo, err := user.Model.Where("id=?", id).One()
		if err != nil {
			g.Log().Error(err)
			return
		}
		userMap = gconv.Map(userInfo)
	}
	return
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
		menu["index"] = v.Name
		menus[k] = menu
	}
	menus = utils.PushSonToParent(menus, 0, "pid", "id", "subs", "", nil, false)
	return
}

//获取管理员所属角色菜单
func GetAdminMenusByRoleIds(roleIds []int) (menus g.List, err error) {
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
			roleMenu["index"] = v.Name
			roleMenus = append(roleMenus, roleMenu)
		}
	}
	menus = utils.PushSonToParent(roleMenus, 0, "pid", "id", "subs", "", nil, false)
	return
}
