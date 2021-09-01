package main

import (
	_ "gfast/boot"
	_ "gfast/router"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/swagger"
)

// @title       GFast
// @version     2.0
// @description GFast后台管理框架
// @schemes     http https
func main() {
	s := g.Server()
	s.Plugin(&swagger.Swagger{})
	s.Run()
}
