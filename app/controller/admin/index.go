package admin

import (
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"gfast/library/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"strings"
)

type Index struct{}

//后台首页接口数据
func (c *Index) Index(r *ghttp.Request) {
	//获取用户信息
	userEntity := user_service.GetLoginAdminInfo(r)
	userInfo := gconv.Map(userEntity)
	//菜单列表
	var menuList g.List
	isSuperAdmin := false
	if userInfo != nil {
		userId := userEntity.Id
		delete(userInfo, "user_password")
		//获取无需验证权限的用户id
		for _, v := range service.NotCheckAuthAdminIds {
			if v == userId {
				isSuperAdmin = true
				break
			}
		}

		//获取用户角色信息
		allRoles, err := auth_service.GetRoleList()
		if err == nil {
			roles, err := user_service.GetAdminRole(userId, allRoles)
			if err == nil {
				name := make([]string, len(roles))
				roleIds := make([]int, len(roles))
				for k, v := range roles {
					name[k] = v.Name
					roleIds[k] = v.Id
				}
				userInfo["roles"] = strings.Join(name, "，")
				//获取菜单信息
				if isSuperAdmin {
					//超管获取所有菜单
					menuList, err = user_service.GetAllMenus()
				} else {
					menuList, err = user_service.GetAdminMenusByRoleIds(roleIds)
				}
				if err != nil {
					g.Log().Error(err)
				}
			} else {
				g.Log().Error(err)
				userInfo["roles"] = ""
			}
		} else {
			g.Log().Error(err)
			userInfo["roles"] = ""
		}
	}

	result := g.Map{
		"userInfo": userInfo,
		"menuList": menuList,
	}
	response.SusJson(true, r, "ok", result)
}
