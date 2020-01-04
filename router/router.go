package router

import (
	"gfast/app/api/user"
	"gfast/app/controller/admin"
	"github.com/gogf/gf/frame/g"
)

// 统一路由注册.
func init() {
	s := g.Server()
	s.BindObject("/user", new(user.Controller))
	s.BindObject("/system/public", new(admin.Public))
}
