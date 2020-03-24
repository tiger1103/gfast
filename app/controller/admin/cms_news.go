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

//信息列表
func (c *CmsNews) List(r *ghttp.Request) {
	var req *cms_news.ReqListSearchParams
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := cms_service.NewsListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取可选栏目
	menus, err := cms_service.GetPublishableMenuList(req.CateId...)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	menus = utils.PushSonToParent(menus, 0, "parent_id")
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
		"menus":       menus,
	}
	response.SusJson(true, r, "信息列表", result)
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
		_, err := cms_service.AddNews(req, cateIds, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加信息成功")
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

//修改信息
func (c *CmsNews) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *cms_news.ReqEditParams
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		cateIds := r.GetInts("cateIds")
		err := cms_service.EditNews(req, cateIds)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改信息成功")
	}
	id := r.GetInt("id")
	if id == 0 {
		response.FailJson(true, r, "参数错误")
	}
	//获取文章信息
	news, err := cms_service.GetNewsById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	checkedCategoryId, err := cms_service.GetCheckedCategoryIdByNewsId(news.Id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取可选栏目
	menus, err := cms_service.GetPublishableMenuList(checkedCategoryId...)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	menus = utils.PushSonToParent(menus, 0, "parent_id")
	res := g.Map{
		"menus": menus,
		"news":  news,
	}
	response.SusJson(true, r, "添加信息", res)
}

//删除信息
func (c *CmsNews) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := cms_service.DeleteCmsByIds(ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除信息成功")
}
