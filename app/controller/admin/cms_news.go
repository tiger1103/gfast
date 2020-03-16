package admin

import (
	"gfast/app/model/admin/cms_news"
	"gfast/app/service/admin/cms_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type CmsNews struct{}

func (c *CmsNews) List(r *ghttp.Request) {
	response.SusJson(true, r, "信息列表")
}

//添加信息
func (c *CmsNews) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *cms_news.ReqAddParams
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		cateIds := r.GetInts("cateIds")
		userId := user_service.GetLoginID(r)
		ids, err := cms_service.AddNews(req, cateIds, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加信息成功", ids)
	}
	//获取可选栏目
	menus, err := cms_service.GetPublishableMenuList()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	menus = utils.PushSonToParent(menus, 0, "parent_id")
	res := g.Map{
		"menus": menus,
	}
	response.SusJson(true, r, "添加信息", res)
}
