package boot

import (
	"gfast/library/utils"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
)

var AdminGfToken *gtoken.GfToken

func init() {
	g.Server().SetPort(8200)
	g.Server().AddStaticPath("/public", g.Cfg().GetString("server.ServerRoot"))
	// 设置并启动后台gtoken处理
	initAdminGfToken()
}

func initAdminGfToken() {
	AdminGfToken = &gtoken.GfToken{
		CacheMode:        g.Cfg().GetInt8("gToken.CacheMode"),
		CacheKey:         g.Cfg().GetString("gToken.CacheKey"),
		Timeout:          g.Cfg().GetInt("gToken.Timeout"),
		MaxRefresh:       g.Cfg().GetInt("gToken.MaxRefresh"),
		TokenDelimiter:   g.Cfg().GetString("gToken.TokenDelimiter"),
		EncryptKey:       g.Cfg().GetBytes("gToken.EncryptKey"),
		AuthFailMsg:      g.Cfg().GetString("gToken.AuthFailMsg"),
		MultiLogin:       g.Cfg().GetBool("gToken.MultiLogin"),
		LoginPath:        "/sysLogin/login",
		LoginBeforeFunc:  utils.AdminLogin,
		LogoutPath:       "/sysLogin/logout",
		AuthPaths:        g.SliceStr{"/system/*"},
		AuthAfterFunc:    utils.AuthAfterFunc,
		LogoutBeforeFunc: utils.AdminLoginOut,
	}
	AdminGfToken.Start()
}
