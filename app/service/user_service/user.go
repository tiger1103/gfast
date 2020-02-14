package user_service

import (
	"fmt"
	"gfast/app/model/role"
	"gfast/app/model/user"
	"gfast/app/service/casbin_adapter_service"
	"gfast/boot"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//获取登陆用户ID
func GetLoginID(r *ghttp.Request) int64 {
	resp := boot.AdminGfToken.GetTokenData(r)
	userId := resp.GetInt("data")
	return gconv.Int64(userId)
}

//获取管理员的角色信息
func GetAdminRole(userId int64) (roles []*role.Entity, err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	//查询关联角色规则
	groupPolicy := enforcer.GetFilteredGroupingPolicy(0, fmt.Sprintf("u_%d", userId))
	if len(groupPolicy) > 0 {
		roleIds := make([]int64, len(groupPolicy))
		//得到角色id的切片
		for k, v := range groupPolicy {
			roleIds[k] = gconv.Int64(gstr.SubStr(v[1], 2))
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
func GetAdminMenusByRoleIds(roleIds []int) (menus g.Map, err error) {
	//获取角色对应的菜单id
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	for _, roleId := range roleIds {
		//查询当前权限
		gp := enforcer.GetFilteredPolicy(0, fmt.Sprintf("g_%d", roleId))
		g.Log().Debug(gp)
	}

	return
}
