package boot

import "github.com/gogf/gf/frame/g"

func init() {
	g.Server().SetPort(8200)
	g.Server().AddStaticPath("/public", g.Cfg().Get("server.ServerRoot").(string))
}
