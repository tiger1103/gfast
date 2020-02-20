package router

import (
	"fmt"
	"gfast/app/model/auth_rule"
	"gfast/app/service/casbin_adapter_service"
	"gfast/app/service/user_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/encoding/gurl"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

//跨域处理中间件
func MiddlewareCORS(r *ghttp.Request) {
	r.Response.CORSDefault()
	r.Middleware.Next()
}

//权限判断处理中间件
func MiddlewareAuth(r *ghttp.Request) {
	//获取登陆用户id
	adminId := user_service.GetLoginID(r)
	//获取无需验证权限的用户id
	for _, v := range utils.NotCheckAuthAdminIds {
		if v == adminId {
			r.Middleware.Next()
			return
		}
	}
	url := r.GetUrl()
	info, err := gurl.ParseURL(url, 32)
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "请求地址错误")
	}
	//获取地址对应的菜单id
	gValue, err := auth_rule.Model.Where("name=?", info["path"]).Fields("id").Value()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "请求数据失败")
	}
	menuId := gValue.Int()
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
		g.Log().Debug(groupPolicy)
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
	r.Middleware.Next()
}
