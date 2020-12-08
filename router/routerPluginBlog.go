package router

import (
	"gfast/middleWare"
	blogHome "gfast/plugin/blog/controller/home"
	blogSystem "gfast/plugin/blog/controller/system"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func init() {
	s := g.Server()
	group := s.Group("/")
	s.Group("/plugin", func(group *ghttp.RouterGroup) {
		group.ALL("/blog", new(blogHome.Index))
	})
	group.Group("/system/plugin", func(group *ghttp.RouterGroup) {
		group.Middleware(middleWare.Auth) //后台权限验证
		// 简单博客管理
		group.Group("/blog", func(group *ghttp.RouterGroup) {
			group.ALL("/log", new(blogSystem.BlogLog))
			group.ALL("/classification", new(blogSystem.BlogClassification))
			group.ALL("/comment", new(blogSystem.BlogComment))
		})
	})
}
