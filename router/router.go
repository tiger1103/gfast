package router

import (
	"gfast/app/controller/admin"
	"github.com/gogf/gf/frame/g"
)

// 统一路由注册.
func init() {
	s := g.Server()
	group := s.Group("/")
	group.Middleware(MiddlewareCORS)
	systemGroup := group.Group("/system")
	systemGroup.ALL("/public", new(admin.Public))
}
