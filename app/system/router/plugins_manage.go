// ==========================================================================
// GFast自动生成路由代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2021-08-31 17:58:43
// 生成路径: gfast/app/system/router/plugins_manage.go
// 生成人：gfast
// ==========================================================================

package router

import (
	"gfast/app/system/api"
	"gfast/middleware"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

//加载路由
func init() {
	s := g.Server()
	s.Group("/", func(group *ghttp.RouterGroup) {
		group.Group("/system", func(group *ghttp.RouterGroup) {
			group.Group("/pluginsManage", func(group *ghttp.RouterGroup) {
				//gToken拦截器
				api.GfToken.AuthMiddleware(group)
				//context拦截器
				group.Middleware(middleware.Ctx, middleware.Auth)
				group.GET("list", api.PluginsManage.List)
				group.GET("get", api.PluginsManage.Get)
				group.PUT("changeStatus", api.PluginsManage.ChangeStatus)
				group.POST("install", api.PluginsManage.Install)
				group.GET("captcha", api.PluginsManage.Captcha)
				group.POST("loginR", api.PluginsManage.LoginR)
				group.POST("installOffLine", api.PluginsManage.InstallOffLine)
			})
		})
	})
}
