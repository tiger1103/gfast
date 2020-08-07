package router

import (
	"gfast/middleWare"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/swaggo/swag"
)

// 统一路由注册.
func init() {
	s := g.Server()
	s.Use(middleWare.CORS)
	group := s.Group("/")
	//上传的文件允许跨域请求
	group.Hook("/pub_upload/*", ghttp.HOOK_BEFORE_SERVE, func(r *ghttp.Request) {
		r.Response.CORSDefault()
	})

	group.GET("/swagger.json", func(r *ghttp.Request) {
		jsonStr, err := swag.ReadDoc()
		if err != nil {
			r.Response.Write(err)
			return
		}
		r.Response.WriteJson(jsonStr)
	})
}
