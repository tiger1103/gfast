package router

import (
	"gfast/app/controller/admin"
	"gfast/middleWare"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

// 统一路由注册.
func init() {
	s := g.Server()
	s.Use(middleWare.MiddlewareCORS)
	group := s.Group("/")
	group.Group("/sysLogin", func(group *ghttp.RouterGroup) {
		group.ALL("/public", new(admin.Public))
	})
	group.Group("/system", func(group *ghttp.RouterGroup) {
		group.Middleware(middleWare.MiddlewareAuth) //后台权限验证
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
		})
	})

}
