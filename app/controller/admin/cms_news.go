package admin

import (
	"gfast/app/model/admin/cms_news"
	"gfast/app/service/admin/cms_service"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type CmsNews struct{}

// @Summary 信息列表
// @Description 信息列表
// @Tags 文章管理
// @Param data body cms_news.ReqListSearchParams true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/news/list [get]
// @Security
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

	//文章发布状态
	statusOptions, err := dict_service.GetDictWithDataByType("cms_news_pub_type", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//文章附加状态
	attrOptions, err := dict_service.GetDictWithDataByType("cms_news_attr", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//文章附加状态
	typeOptions, err := dict_service.GetDictWithDataByType("cms_news_type", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage":   page,
		"total":         total,
		"list":          list,
		"menus":         menus,
		"statusOptions": statusOptions,
		"attrOptions":   attrOptions,
		"typeOptions":   typeOptions,
	}
	response.SusJson(true, r, "信息列表", result)
}

// @Summary 添加信息
// @Description 添加信息
// @Tags 文章管理
// @Param data body cms_news.ReqAddParams true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/news/add [post]
// @Security
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
	res := g.Map{
		"menus": menus,
	}
	response.SusJson(true, r, "添加信息", res)
}

// @Summary 修改信息
// @Description 修改信息
// @Tags 文章管理
// @Param data body cms_news.ReqEditParams true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/news/edit [post]
// @Security
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

	res := g.Map{
		"menus": checkedCategoryId,
		"news":  news,
	}
	response.SusJson(true, r, "添加信息", res)
}

// @Summary 删除信息
// @Description 删除信息
// @Tags 文章管理
// @Param ids body integer  true "ids[1,2,3..]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/news/delete [delete]
// @Security
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

// @Summary 获取模型字段
// @Description 获取模型字段
// @Tags 栏目管理
// @Param cateIds body integer  true "cateIds[1,2,3...]"
// @Param newsId body integer  true "newsId"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/news/getModelFields [get]
// @Security
func (c *CmsNews) GetModelFields(r *ghttp.Request) {
	//获取栏目ID
	cateIds := r.GetInts("cateIds")
	//文章id
	newsId := r.GetInt64("newsId")
	res, err := cms_service.GetModelFieldsByCateIds(r, cateIds, newsId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", res)
}
