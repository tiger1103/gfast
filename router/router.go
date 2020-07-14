package router

import (
	"gfast/app/controller/admin"
	"gfast/app/controller/front"
	"gfast/hook"
	"gfast/middleWare"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
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
	group.Group("/sysLogin", func(group *ghttp.RouterGroup) {
		group.ALL("/public", new(admin.Public))
	})

	group.Group("/system", func(group *ghttp.RouterGroup) {
		group.Middleware(middleWare.Auth) //后台权限验证
		//后台操作日志记录
		group.Hook("/*", ghttp.HOOK_AFTER_OUTPUT, hook.OperationLog)

		//文件上传
		group.POST("/upload", new(admin.Upload))
		//后台首页
		group.ALL("/index", new(admin.Index))
		//权限管理
		group.ALL("/auth", new(admin.Auth))

		//部门管理
		group.ALL("/dept", new(admin.Dept))

		//个人中心
		group.ALL("/user", new(admin.User))

		//岗位管理
		group.ALL("/post", new(admin.Post))

		//配置管理
		group.Group("/config", func(group *ghttp.RouterGroup) {
			group.ALL("/dict", new(admin.Dict))
			group.ALL("/params", new(admin.Params))
		})
		//系统监控
		group.Group("/monitor", func(group *ghttp.RouterGroup) {
			group.ALL("/online", new(admin.MonitorOnline))
			group.ALL("/job", new(admin.MonitorJob))
			group.ALL("/server", new(admin.MonitorServer))
			group.ALL("/operlog", new(admin.MonitorOperationLog))
			group.ALL("/loginlog", new(admin.MonitorLoginLog))
		})

		//代码生成
		group.Group("/tools", func(group *ghttp.RouterGroup) {
			group.ALL("/gen", new(admin.Gen))
		})

	})

	group.Group("/front", func(group *ghttp.RouterGroup) {
		//前台首页
		group.ALL("/index", new(front.Index))
	})

}
