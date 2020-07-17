package main

import (
	_ "gfast/boot"
	_ "gfast/router"
	"github.com/gogf/gf/frame/g"
)

// @title gfast API文档
// @version 1.0
// @description gfast 在线API文档
// @host localhost
// @BasePath /system
func main() {
	g.Server().Run()
}
