package admin

import (
	"gfast/app/model/admin/plug_ad"
	"gfast/app/service/admin/plug_service"
	"gfast/library/response"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type PlugAd struct{}

// @Summary 添加广告
// @Description 添加广告
// @Tags 广告列表
// @Param data body plug_ad.AddReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/info/add [post]
// @Security
func (c *PlugAd) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *plug_ad.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		// 调用service中的添加函数添加广告
		err = plug_service.AddSaveAd(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功!")
	}
}

// @Summary 删除广告
// @Description 删除广告
// @Tags 广告列表
// @Param data body integer  true "ids"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/info/delete [delete]
// @Security
func (c *PlugAd) Delete(r *ghttp.Request) {
	ids := r.GetInts("plugAdID")
	if len(ids) == 0 {
		response.FailJson(true, r, "ID获取失败，删除失败")
	}
	err := plug_service.DeleteByIDs(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

// @Summary 修改广告
// @Description 修改广告
// @Tags 广告列表
// @Param data body plug_ad.EditReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/info/edit [post]
// @Security
func (c *PlugAd) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *plug_ad.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = plug_service.EditPlugAdSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("plugAdID")
	params, err := plug_service.GetPlugAdByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// @Summary 广告列表
// @Description 广告列表
// @Tags 广告列表
// @Param data body plug_ad.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/info/list [get]
// @Security
func (c *PlugAd) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *plug_ad.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	total, page, list, err := plug_service.SelectPlugAdListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "广告列表", result)
}

// @Summary 栏目排序
// @Description 栏目排序
// @Tags 广告列表
// @Param sorts body integer  true "sorts[]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/info/sort [post]
// @Security
func (c *PlugAd) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "获取记录id、序号失败")
	}
	var err error
	for k, v := range s {
		_, err = plug_ad.Model.Where("ad_id=?", k).Data("ad_sort", v).Update()
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
	}
	response.SusJson(true, r, "排序成功")
}
