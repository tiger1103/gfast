package main

import(
	_ "gfast/boot"
	_ "gfast/router"
	"github.com/gogf/gf/frame/g"
)

func main() {
	g.Server().Run()
}
