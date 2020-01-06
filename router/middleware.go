package router

import "github.com/gogf/gf/net/ghttp"

func MiddlewareCORS(r *ghttp.Request) {
	r.Response.CORSDefault()
	r.Middleware.Next()
}
