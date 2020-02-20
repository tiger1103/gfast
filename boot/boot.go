package boot

import (
	"gfast/library/utils"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/glog"
)

var AdminGfToken *gtoken.GfToken

func init() {
	g.Log().SetFlags(glog.F_ASYNC | glog.F_TIME_DATE | glog.F_TIME_TIME | glog.F_FILE_LONG)
	g.Server().SetPort(8200)
	g.Server().AddStaticPath("/public", g.Cfg().GetString("server.ServerRoot"))
	//后台初始化配置
	initAdmin()

}

func initAdmin() {
	//无需验证权限的用户id
	utils.NotCheckAuthAdminIds = g.Cfg().GetInts("adminInfo.notCheckAuthAdminIds")
	//后端分页长度配置
	utils.AdminPageNum = g.Cfg().GetInt("adminInfo.pageNum")
	// 设置并启动后台gtoken处理
	initAdminGfToken()
}

func initAdminGfToken() {
	//多端登陆配置
	utils.AdminMultiLogin = g.Cfg().GetBool("gToken.MultiLogin")
	AdminGfToken = &gtoken.GfToken{
		CacheMode:        g.Cfg().GetInt8("gToken.CacheMode"),
		CacheKey:         g.Cfg().GetString("gToken.CacheKey"),
		Timeout:          g.Cfg().GetInt("gToken.Timeout"),
		MaxRefresh:       g.Cfg().GetInt("gToken.MaxRefresh"),
		TokenDelimiter:   g.Cfg().GetString("gToken.TokenDelimiter"),
		EncryptKey:       g.Cfg().GetBytes("gToken.EncryptKey"),
		AuthFailMsg:      g.Cfg().GetString("gToken.AuthFailMsg"),
		MultiLogin:       utils.AdminMultiLogin,
		LoginPath:        "/sysLogin/login",
		LoginBeforeFunc:  utils.AdminLogin,
		LogoutPath:       "/sysLogin/logout",
		AuthPaths:        g.SliceStr{"/system/*"},
		AuthAfterFunc:    utils.AuthAfterFunc,
		LogoutBeforeFunc: utils.AdminLoginOut,
	}
	AdminGfToken.Start()
}
