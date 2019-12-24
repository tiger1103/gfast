package router

import (
    "gfast/app/api/hello"
    "gfast/app/api/user"
    "github.com/gogf/gf/frame/g"
)

// 统一路由注册.
func init() {
    g.Server().BindHandler("/", hello.Handler)
    g.Server().BindObject("/user", new(user.Controller))
}
