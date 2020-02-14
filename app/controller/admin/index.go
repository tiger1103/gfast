package admin

import (
	"gfast/app/service/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"strings"
)

type Index struct{}

//后台首页接口数据
func (c *Index) Index(r *ghttp.Request) {
	//获取用户信息
	userId := user_service.GetLoginID(r)
	//获取用户角色信息
	userMap := user_service.GetAdminInfoById(userId)
	if userMap != nil {
		delete(userMap, "user_password")
		roles, err := user_service.GetAdminRole(userId)
		if err == nil {
			name := make([]string, len(roles))
			roleIds := make([]int, len(roles))
			for k, v := range roles {
				name[k] = v.Name
				roleIds[k] = v.Id
			}
			userMap["roles"] = strings.Join(name, "，")
			//获取菜单信息
			user_service.GetAdminMenusByRoleIds(roleIds)
		} else {
			g.Log().Error(err)
			userMap["roles"] = ""
		}
	}

	result := g.Map{
		"userInfo": userMap,
	}
	response.SusJson(true, r, "ok", result)
}
