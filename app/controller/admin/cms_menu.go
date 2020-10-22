package admin

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/service/admin/cms_service"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/model_service"
	"gfast/app/service/cache_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//cms栏目管理
type CmsMenu struct{}

// @Summary 栏目列表
// @Description 分页列表
// @Tags 栏目管理
// @Param data body cms_category.ReqSearchList true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/menu/list [get]
// @Security
func (c *CmsMenu) List(r *ghttp.Request) {
	var req *cms_category.ReqSearchList
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	menus, err := cms_service.GetMenuListSearch(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//栏目显示状态
	statusOptions, err := dict_service.GetDictWithDataByType("sys_show_hide", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//栏目类型
	typeOptions, err := dict_service.GetDictWithDataByType("cms_category_type", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"list":          menus,
		"statusOptions": statusOptions,
		"typeOptions":   typeOptions,
	}
	response.SusJson(true, r, "ok", res)
}

// @Summary 添加栏目
// @Description 添加栏目
// @Tags 栏目管理
// @Param data body cms_category.ReqAdd true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/menu/add [post]
// @Security
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
	//获取分类栏目模板
	ListTemp, contentTemp := cms_service.GetCmsTemplate()
	res := g.Map{
		"parentList":  menus,
		"listTemp":    ListTemp,
		"contentTemp": contentTemp,
	}
	response.SusJson(true, r, "添加栏目", res)
}

// @Summary 修改栏目
// @Description 修改栏目
// @Tags 栏目管理
// @Param data body cms_category.ReqEdit true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/menu/edit [post]
// @Security
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
	//获取分类栏目模板
	ListTemp, contentTemp := cms_service.GetCmsTemplate()
	res := g.Map{
		"menuInfo":    menuInfo,
		"parentList":  menus,
		"listTemp":    ListTemp,
		"contentTemp": contentTemp,
	}
	response.SusJson(true, r, "修改栏目", res)
}

// @Summary 栏目排序
// @Description 栏目排序
// @Tags 栏目管理
// @Param data body string  true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/menu/sort [post]
// @Security
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

// @Summary 删除栏目
// @Description 删除栏目
// @Tags 栏目管理
// @Param ids body integer  true "ids"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/menu/delete [delete]
// @Security
func (c *CmsMenu) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := cms_service.DeleteMenuByIds(ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	cache_service.New().RemoveByTag(cache_service.AdminCmsTag)
	response.SusJson(true, r, "删除信息成功", ids)
}

// @Summary 栏目模型选项
// @Description 栏目模型选项
// @Tags 栏目管理
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/cms/menu/modelOptions [get]
// @Security
func (c *CmsMenu) ModelOptions(r *ghttp.Request) {
	//栏目模型分类
	modelOptions, err := dict_service.GetDictWithDataByType("cms_cate_models", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	values := gconv.SliceAny(modelOptions["values"])
	keys := make([]int, len(values))
	for k, val := range values {
		data := gconv.Map(val)
		keys[k] = gconv.Int(data["key"])
	}
	//获取对应模型
	models, err := model_service.GetModelsByCateIds(keys)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", models)
}
