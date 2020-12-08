package blog

import (
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gview"
)

func Response(r *ghttp.Request, tpl string, params ...gview.Params) error {
	view := g.View()
	view.SetPath("template/plugin/blog")
	return response.WriteTpl(r, tpl, view, params...)
}
