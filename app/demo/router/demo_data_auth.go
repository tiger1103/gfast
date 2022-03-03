// ==========================================================================
// GFast自动生成路由代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2022-03-03 10:11:15
// 生成路径: gfast/app/demo/router/demo_data_auth.go
// 生成人：gfast
// ==========================================================================

package router

import (
	"gfast/app/demo/api"
	sysApi "gfast/app/system/api"
	"gfast/middleware"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

//加载路由
func init() {
	s := g.Server()
	s.Group("/", func(group *ghttp.RouterGroup) {
		group.Group("/demo", func(group *ghttp.RouterGroup) {
			group.Group("/demoDataAuth", func(group *ghttp.RouterGroup) {
				//gToken拦截器
				sysApi.GfToken.AuthMiddleware(group)
				//context拦截器
				group.Middleware(middleware.Ctx, middleware.Auth)
				//后台操作日志记录
				group.Hook("/*", ghttp.HookAfterOutput, sysApi.SysOperLog.OperationLog)
				group.GET("list", api.DemoDataAuth.List)
				group.GET("get", api.DemoDataAuth.Get)
				group.POST("add", api.DemoDataAuth.Add)
				group.PUT("edit", api.DemoDataAuth.Edit)
				group.DELETE("delete", api.DemoDataAuth.Delete)
			})
		})
	})
}
