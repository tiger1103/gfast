package boot

import (
	"gfast/library/utils"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
)

var AdminGfToken *gtoken.GfToken

func init() {
	g.Server().SetPort(8200)
	g.Server().AddStaticPath("/public", g.Cfg().Get("server.ServerRoot").(string))
	// 设置并启动后台gtoken处理
	initAdminGfToken()
}

func initAdminGfToken() {
	AdminGfToken = &gtoken.GfToken{
		CacheMode:        int8(g.Cfg().Get("gToken.CacheMode").(float64)),
		CacheKey:         g.Cfg().Get("gToken.CacheKey").(string),
		Timeout:          int(g.Cfg().Get("gToken.Timeout").(float64)),
		MaxRefresh:       int(g.Cfg().Get("gToken.MaxRefresh").(float64)),
		TokenDelimiter:   g.Cfg().Get("gToken.TokenDelimiter").(string),
		EncryptKey:       []byte(g.Cfg().Get("gToken.EncryptKey").(string)),
		AuthFailMsg:      g.Cfg().Get("gToken.AuthFailMsg").(string),
		MultiLogin:       g.Cfg().Get("gToken.MultiLogin").(bool),
		LoginPath:        "/sysLogin/login",
		LoginBeforeFunc:  utils.AdminLogin,
		LogoutPath:       "/sysLogin/logout",
		AuthPaths:        g.SliceStr{"/system/*"},
		LogoutBeforeFunc: utils.AdminLoginOut,
	}
	AdminGfToken.Start()
}
