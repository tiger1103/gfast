package router

import (
	"gfast/app/controller/admin"
	"gfast/hook"
	"gfast/middleWare"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

// 统一路由注册.
func init() {
	s := g.Server()
	s.Use(middleWare.CORS)
	group := s.Group("/")
	group.Group("/sysLogin", func(group *ghttp.RouterGroup) {
		group.ALL("/public", new(admin.Public))
	})
	group.Group("/system", func(group *ghttp.RouterGroup) {
		group.Middleware(middleWare.Auth) //后台权限验证
		//后台操作日志记录
		group.Hook("/*", ghttp.HOOK_AFTER_OUTPUT, hook.OperationLog)

		group.ALL("/index", new(admin.Index))
		group.ALL("/auth", new(admin.Auth))

		group.Group("/cms", func(group *ghttp.RouterGroup) {
			group.ALL("/menu", new(admin.CmsMenu))
			group.ALL("/news", new(admin.CmsNews))
		})

		group.Group("/config", func(group *ghttp.RouterGroup) {
			group.ALL("/dict", new(admin.Dict))
			group.ALL("/params", new(admin.Params))
		})

		group.Group("/monitor", func(group *ghttp.RouterGroup) {
			group.ALL("/online", new(admin.MonitorOnline))
			group.ALL("/job", new(admin.MonitorJob))
			group.ALL("/server", new(admin.MonitorServer))
			group.ALL("/operlog", new(admin.MonitorOperationLog))
			group.ALL("/loginlog", new(admin.MonitorLoginLog))
		})
	})

}
