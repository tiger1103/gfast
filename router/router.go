package router

import (
	"gfast/app/controller/admin"
	"github.com/gogf/gf/frame/g"
)

// 统一路由注册.
func init() {
	s := g.Server()
	s.BindMiddleware("/sysLogin/login", MiddlewareCORS)
	s.BindMiddleware("/sysLogin/logout", MiddlewareCORS)
	group := s.Group("/")
	group.Middleware(MiddlewareCORS)
	sysLoginGroup := group.Group("/sysLogin")
	sysLoginGroup.ALL("/public", new(admin.Public))
	systemGroup := group.Group("/system")
	systemGroup.ALL("/index", new(admin.Index))
	systemGroup.ALL("/auth", new(admin.Auth))
}
