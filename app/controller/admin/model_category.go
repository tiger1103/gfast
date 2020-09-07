package admin

import (
	"gfast/app/model/admin/model_category"
	"gfast/app/service/admin/model_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/cache_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//模型分类
type ModelCategory struct{}

// @Summary 模型列表
// @Description 模型列表
// @Tags 模型分类
// @Param data body model_category.SearchReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/category/list [get]
// @Security
func (c *ModelCategory) List(r *ghttp.Request) {
	var req *model_category.SearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, list, err := model_service.GetCategoryList(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"total": total,
		"list":  list,
	}
	response.SusJson(true, r, "信息列表", res)
}

// @Summary 模型分类
// @Description 模型分类
// @Tags 模型分类
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/category/all [post]
// @Security
func (c *ModelCategory) All(r *ghttp.Request) {
	list, err := model_service.GetCategoryAll()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", list)
}

// @Summary 添加模型分类
// @Description 添加模型分类
// @Tags 模型分类
// @Param data body model_category.AddReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/category/add [post]
// @Security
func (c *ModelCategory) Add(r *ghttp.Request) {
	var req *model_category.AddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}

	req.CreateBy = gconv.Uint(user_service.GetLoginID(r))
	err := model_service.AddCategory(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	cache_service.New().RemoveByTag(cache_service.AdminModelTag)
	response.SusJson(true, r, "添加成功")
}

// @Summary 修改模型分类
// @Description 修改模型分类
// @Tags 模型分类
// @Param data body model_category.EditReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/category/edit [post]
// @Security
func (c *ModelCategory) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *model_category.EditReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}

		req.UpdateBy = gconv.Uint(user_service.GetLoginID(r))
		err := model_service.EditCategory(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		cache_service.New().RemoveByTag(cache_service.AdminModelTag)
		response.SusJson(true, r, "修改成功")
	}
	id := r.GetInt64("id")
	if id == 0 {
		response.FailJson(true, r, "参数错误")
	}
	cate, err := model_service.GetCategoryById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", cate)
}

// @Summary 分类排序
// @Description 分类排序
// @Tags 模型分类
// @Param sorts body string  true "sorts"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/category/sort [post]
// @Security
func (c *ModelCategory) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "排序失败")
	}
	for k, v := range s {
		model_category.Model.Where(model_category.Columns.CId+"=?", k).Data(model_category.Columns.CSort, v).Update()
	}
	cache_service.New().RemoveByTag(cache_service.AdminModelTag)
	response.SusJson(true, r, "排序成功")
}

// @Summary 删除分类
// @Description 删除分类
// @Tags 模型分类
// @Param ids body integer true "ids"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/category/delete [delete]
// @Security
func (c *ModelCategory) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := model_service.DeleteCategoryByIds(ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	cache_service.New().RemoveByTag(cache_service.AdminModelTag)
	response.SusJson(true, r, "删除成功", ids)
}
