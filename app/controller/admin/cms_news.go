package admin

import (
	"gfast/app/service/admin/cms_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type CmsNews struct{}

func (c *CmsNews) List(r *ghttp.Request) {
	response.SusJson(true, r, "信息列表")
}

//添加信息
func (c *CmsNews) Add(r *ghttp.Request) {
	//获取可选栏目
	menus, err := cms_service.GetPublishableMenuList()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	res := g.Map{
		"menus": menus,
	}
	response.SusJson(true, r, "添加信息", res)
}
