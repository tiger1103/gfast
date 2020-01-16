package admin

import (
	"gfast/app/service/auth_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

//用户管理
type Auth struct{}

//添加用户组
func (c *Auth) AddGroup(r *ghttp.Request) {
	r.Response.Write("添加用户组")
}

func (c *Auth) AddMenu(r *ghttp.Request) {
	if r.Method == "POST" {
		postData := r.GetFormMap()
		response.SusJson(true, r, "成功", postData)
	}
	//获取父级菜单信息
	err, list := auth_service.GetMenuList()
	if err != nil {
		response.FailJson(true, r, "获取数据失败")
	}
	returnData := g.Map{"parentList": list}
	response.SusJson(true, r, "成功", returnData)
}
