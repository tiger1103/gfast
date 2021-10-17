// ==========================================================================
// GFast自动生成路由代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2021-09-19 09:44:19
// 生成路径: gfast/app/system/router/demo_gen_class.go
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
            group.Group("/demoGenClass", func(group *ghttp.RouterGroup) {
                //gToken拦截器                
                api.GfToken.Middleware(group)                
                //context拦截器
                group.Middleware(middleware.Ctx, middleware.Auth)                
                group.GET("list", api.DemoGenClass.List)
                group.GET("get", api.DemoGenClass.Get)
                group.POST("add", api.DemoGenClass.Add)
                group.PUT("edit", api.DemoGenClass.Edit)
                group.DELETE("delete", api.DemoGenClass.Delete)                
            })
        })
    })
}
