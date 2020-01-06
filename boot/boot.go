package boot

import (
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
)

func init() {
	g.Server().SetPort(8200)
	g.Server().AddStaticPath("/public", g.Cfg().Get("server.ServerRoot").(string))
	// 启动gtoken
	gtoken := &gtoken.GfToken{
		LoginPath:       "/login",
		LoginBeforeFunc: loginFunc,
		LogoutPath:      "/user/logout",
		AuthPaths:       g.SliceStr{"/system/*"},
	}
	gtoken.Start()
}
