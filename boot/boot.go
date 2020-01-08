package boot

import (
	"gfast/library/utils"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
)

func init() {
	g.Server().SetPort(8200)
	g.Server().AddStaticPath("/public", g.Cfg().Get("server.ServerRoot").(string))
	// 启动gtoken
	gtoken := &gtoken.GfToken{
		LoginPath:        "/sysLogin/login",
		LoginBeforeFunc:  utils.AdminLogin,
		LogoutPath:       "/sysLogin/logout",
		AuthPaths:        g.SliceStr{"/system/*"},
		LogoutBeforeFunc: utils.AdminLoginOut,
	}
	gtoken.Start()
}
