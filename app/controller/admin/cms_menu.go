package admin

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/service/admin/cms_service"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/cache_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//cms栏目管理
type CmsMenu struct{}

func (c *CmsMenu) List(r *ghttp.Request) {
	var req *cms_category.ReqSearchList
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	var menus []*cms_category.Entity
	var err error
	var list g.List
	if req != nil && req.Name != "" {
		//按栏目名搜索
		menus, err = cms_service.GetMenuListSearch(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		list = gconv.Maps(menus)
	} else {
		//获取所有栏目
		menus, err = cms_service.GetMenuList()
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		list = gconv.Maps(menus)
		list = utils.PushSonToParent(list, 0, "parent_id")
	}
	res := g.Map{
		"list": list,
	}
	response.SusJson(true, r, "ok", res)
}

//添加栏目分类
func (c *CmsMenu) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *cms_category.ReqAdd
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		_, err := cms_service.AddSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		cache_service.New().RemoveByTag(cache_service.AdminCmsTag)
		response.SusJson(true, r, "栏目添加成功")
	}
	//获取上级分类(频道)
	menus, err := cms_service.GetMenuListChannel()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	list := gconv.Maps(menus)
	list = utils.PushSonToParent(list, 0, "parent_id")
	typeChecker, err := dict_service.GetDictWithDataByType("cms_category_type", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"menus":       list,
		"typeChecker": typeChecker,
	}
	response.SusJson(true, r, "添加栏目", res)
}

//修改栏目
func (c *CmsMenu) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *cms_category.ReqEdit
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		_, err := cms_service.EditSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		cache_service.New().RemoveByTag(cache_service.AdminCmsTag)
		response.SusJson(true, r, "栏目修改成功")
	}
	//获取栏目数据
	id := r.GetInt("id")
	menuInfo, err := cms_service.GetMenuInfoById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	if menuInfo == nil {
		response.FailJson(true, r, "参数错误")
	}
	//获取上级分类(频道)
	menus, err := cms_service.GetMenuListChannel()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	list := gconv.Maps(menus)
	list = utils.PushSonToParent(list, 0, "parent_id")
	typeChecker, err := dict_service.GetDictWithDataByType("cms_category_type", gconv.String(menuInfo.CateType))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	res := g.Map{
		"menuInfo":    menuInfo,
		"menus":       list,
		"typeChecker": typeChecker,
	}
	response.SusJson(true, r, "修改栏目", res)
}

//栏目排序
func (c *CmsMenu) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "排序失败")
	}
	for k, v := range s {
		cms_category.Model.Where("id=?", k).Data("list_order", v).Update()
	}
	cache_service.New().RemoveByTag(cache_service.AdminCmsTag)
	response.SusJson(true, r, "排序成功")
}
