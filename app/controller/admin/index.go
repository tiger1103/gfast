package admin

import (
	"gfast/boot"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
)

type Index struct{}

func (c *Index) Index(r *ghttp.Request) {
	resp := boot.AdminGfToken.GetTokenData(r)
	g.Log().Debug(r.Router.Uri)
	r.Response.Write("hello Index-", gconv.Map(resp.Get("data"))["user_nickname"])
}
