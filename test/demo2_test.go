package test

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	// 基本事件回调使用
	p := "/:name/info/{uid}"
	s := g.Server()
	s.BindHookHandlerByMap(p, map[string]ghttp.HandlerFunc{
		ghttp.HOOK_BEFORE_SERVE:  func(r *ghttp.Request) { glog.Println(ghttp.HOOK_BEFORE_SERVE) },
		ghttp.HOOK_AFTER_SERVE:   func(r *ghttp.Request) { glog.Println(ghttp.HOOK_AFTER_SERVE) },
		ghttp.HOOK_BEFORE_OUTPUT: func(r *ghttp.Request) { glog.Println(ghttp.HOOK_BEFORE_OUTPUT) },
		ghttp.HOOK_AFTER_OUTPUT:  func(r *ghttp.Request) { glog.Println(ghttp.HOOK_AFTER_OUTPUT) },
	})
	s.BindHandler(p, func(r *ghttp.Request) {
		r.Response.Write("用户:", r.Get("name"), ", uid:", r.Get("uid"))
	})
	s.SetPort(8299)
	s.Run()
}
