package middleWare

import (
	"fmt"
	"gfast/app/model/admin/auth_rule"
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/casbin_adapter_service"
	"gfast/library/response"
	"gfast/library/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//跨域处理中间件
func CORS(r *ghttp.Request) {
	r.Response.CORSDefault()
	r.Middleware.Next()
}

//权限判断处理中间件
func Auth(r *ghttp.Request) {
	/*if r.Method != "GET" {
		response.FailJson(true, r, "演示系统禁止操作")
	}*/
	accessParams := r.GetStrings("accessParams")
	accessParamsStr := ""
	if len(accessParams) > 0 && accessParams[0] != "undefined" {
		accessParamsStr = "?" + gstr.Join(accessParams, "&")
	}
	//获取登陆用户id
	adminId := user_service.GetLoginID(r)
	//获取无需验证权限的用户id
	for _, v := range service.NotCheckAuthAdminIds {
		if gconv.Uint64(v) == adminId {
			r.Middleware.Next()
			return
		}
	}
	url := gstr.TrimLeft(r.Request.URL.Path, "/") + accessParamsStr
	//获取地址对应的菜单id
	menuList, err := auth_service.GetMenuIsStatusList()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "请求数据失败")
	}
	var menu *auth_rule.Entity
	for _, m := range menuList {
		ms := gstr.SubStr(m.Name, 0, gstr.Pos(m.Name, "?"))
		if m.Name == url || ms == url {
			menu = m
			break
		}
	}
	//只验证存在数据库中的规则
	if menu != nil {
		//若存在不需要验证的条件则跳过
		if gstr.Equal(menu.Condition, "nocheck") {
			r.Middleware.Next()
			return
		}
		menuId := menu.Id
		//菜单没存数据库不验证权限
		if menuId != 0 {
			//判断权限操作
			enforcer, err := casbin_adapter_service.GetEnforcer()
			if err != nil {
				g.Log().Error(err)
				response.FailJson(true, r, "获取权限失败")
			}
			groupPolicy := enforcer.GetFilteredGroupingPolicy(0,
				fmt.Sprintf("u_%d", adminId))
			if len(groupPolicy) == 0 {
				response.FailJson(true, r, "没有访问权限")
			}
			hasAccess := false
			for _, v := range groupPolicy {
				if enforcer.HasPolicy(v[1], fmt.Sprintf("r_%d", menuId), "All") {
					hasAccess = true
					break
				}
			}
			if !hasAccess {
				response.FailJson(true, r, "没有访问权限")
			}
		}
	} else if menu == nil && accessParamsStr != "" {
		response.FailJson(true, r, "没有访问权限")
	}
	r.Middleware.Next()
}
