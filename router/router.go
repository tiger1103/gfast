package router

import (
	"gfast/app/common/api"
	_ "gfast/app/system/router"
	"gfast/middleware"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func init() {
	s := g.Server()
	//跨域处理
	s.Use(middleware.CORS)
	s.Group("/", func(group *ghttp.RouterGroup) {

		//上传的文件允许跨域请求
		group.Hook("/pub_upload/*", ghttp.HookBeforeServe, func(r *ghttp.Request) {
			r.Response.CORSDefault()
		})
		group.Group("/captcha", func(group *ghttp.RouterGroup) {
			group.GET("/get", api.Captcha.Img)
		})
	})
}
