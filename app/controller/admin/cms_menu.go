package admin

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/service/admin/cms_service"
	"gfast/app/service/admin/dict_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

//cms栏目管理
type CmsMenu struct{}

func (c *CmsMenu) MenuList(r *ghttp.Request) {
	response.SusJson(true, r, "栏目列表")
}

//添加栏目分类
func (c *CmsMenu) MenuAdd(r *ghttp.Request) {
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
		response.SusJson(true, r, "栏目添加成功")
	}
	//获取上级分类(频道)
	menus, err := cms_service.GetMenuListChannel()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	typeChecker, err := dict_service.GetDictWithDataByType("cms_category_type")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"menus":       menus,
		"typeChecker": typeChecker,
	}
	response.SusJson(true, r, "添加栏目", res)
}
