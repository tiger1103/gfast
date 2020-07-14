package admin

import (
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"gfast/library/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
)

type Index struct{}

//获取登录用户信息
func (c *Index) GetInfo(r *ghttp.Request) {
	//获取用户信息
	userEntity, err := user_service.GetCurrentUser(r)
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取当前登录用户信息失败")
	}
	userInfo := gconv.Map(userEntity)
	rolesList := make([]string, 0, 10)
	if userInfo != nil {
		userId := userEntity.Id
		delete(userInfo, "user_password")
		userInfo["roles"] = make([]string, 0)

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
				userInfo["roles"] = roles
				rolesList = name
			} else {
				g.Log().Error(err)
			}
		} else {
			g.Log().Error(err)
		}
	}

	result := g.Map{
		"user":        userInfo,
		"roles":       rolesList,
		"permissions": nil,
	}

	response.SusJson(true, r, "ok", result)
}

//获取后台菜单
func (c *Index) GetRouters(r *ghttp.Request) {
	//获取用户信息
	userEntity := user_service.GetLoginAdminInfo(r)
	//菜单列表
	var menuList g.List
	isSuperAdmin := false
	if userEntity != nil {
		userId := userEntity.Id

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
			}
		} else {
			g.Log().Error(err)
		}
	}
	if menuList == nil {
		menuList = g.List{}
	}
	response.SusJson(true, r, "ok", menuList)
}
