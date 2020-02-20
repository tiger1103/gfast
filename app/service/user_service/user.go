package user_service

import (
	"fmt"
	"gfast/app/model/role"
	"gfast/app/model/user"
	"gfast/app/service/auth_service"
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
	userInfo := GetCacheAdminInfo(r)
	if userInfo != nil {
		userId = gconv.Int(userInfo["id"])
	}
	return
}

//获取缓存的用户信息
func GetCacheAdminInfo(r *ghttp.Request) (userInfo g.Map) {
	resp := boot.AdminGfToken.GetTokenData(r)
	userInfo = gconv.Map(resp.Get("data"))
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
func GetAdminRole(userId int) (roles []*role.Entity, err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	//查询关联角色规则
	groupPolicy := enforcer.GetFilteredGroupingPolicy(0, fmt.Sprintf("u_%d", userId))
	if len(groupPolicy) > 0 {
		roleIds := make([]int, len(groupPolicy))
		//得到角色id的切片
		for k, v := range groupPolicy {
			roleIds[k] = gconv.Int(gstr.SubStr(v[1], 2))
		}
		//获取角色信息
		roles, err = role.Model.Where("id in(?)", roleIds).All()
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
	err, allMenus := auth_service.GetMenuList("status=? and ismenu=?", 1, 1)
	if err != nil {
		return
	}
	roleMenus := make(g.List, 0, 100)
	for _, v := range allMenus {
		if _, ok := menuIds[gconv.Int64(v["id"])]; ok {
			v["index"] = v["name"]
			roleMenus = append(roleMenus, v)
		}
	}
	menus = utils.PushSonToParent(roleMenus, 0, "pid", "id", "subs", "", nil, false)
	return
}
