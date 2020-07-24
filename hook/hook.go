package hook

import (
	"gfast/app/model/admin/auth_rule"
	"gfast/app/service/admin/auth_service"
	"gfast/app/service/admin/monitor_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
)

func OperationLog(r *ghttp.Request) {
	user := user_service.GetLoginAdminInfo(r)
	if user == nil {
		return
	}
	url := r.Request.URL //请求地址
	//获取菜单
	//获取地址对应的菜单id
	menuList, err := auth_service.GetMenuList()
	if err != nil {
		g.Log().Error(err)
		return
	}
	var menu *auth_rule.Entity
	path := gstr.TrimLeft(url.Path, "/")
	for _, m := range menuList {
		if gstr.Equal(m.Name, path) {
			menu = m
			break
		}
	}
	go monitor_service.OperationLogAdd(user, menu, url, r.GetMap(), r.Method, utils.GetClientIp(r))
}
