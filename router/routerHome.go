package router

import (
	"gfast/app/controller/home"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

//前端路由处理
func init() {
	s := g.Server()
	s.Group("/", func(group *ghttp.RouterGroup) {
		home := new(home.Index)
		group.GET("/cms", home.Index)
		group.GET("/cms/list/:cateId/*page/*keyWords", home.List)
		group.GET("/cms/show/:cateIds/:newsId", home.Show)
		group.ALL("/cms/search/*page/*keyWords", home.Search)
	})
}
