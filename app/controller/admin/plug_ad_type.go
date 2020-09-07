package admin

import (
	"gfast/app/model/admin/plug_adtype"
	"gfast/app/service/admin/plug_service"
	"gfast/library/response"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/util/gconv"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type AdType struct{}

// @Summary 添加广告位
// @Description 添加广告位
// @Tags 广告位管理
// @Param data body plug_adtype.AddReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/type/add [post]
// @Security
func (c *AdType) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *plug_adtype.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		// 调用service中的添加函数添加广告位
		err = plug_service.AddSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功!")
	}
}

// @Summary 删除广告位
// @Description 删除广告位
// @Tags 广告位管理
// @Param adtypeID body integer  true "adtypeID[1,2,3...]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/type/delete [delete]
// @Security
func (c *AdType) Delete(r *ghttp.Request) {
	// 从页面获取要删除记录的 ID int切片
	id := r.GetInts("adTypeID")
	if len(id) == 0 {
		response.FailJson(true, r, "ID获取失败，删除失败")
	}
	err := plug_service.DeleteAdTypeByID(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

// @Summary 修改广告位信息
// @Description 修改广告位信息
// @Tags 广告位管理
// @Param data body plug_adtype.EditReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/type/edit [post]
// @Security
func (c *AdType) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *plug_adtype.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = plug_service.EditSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("adTypeID")
	params, err := plug_service.GetAdtypeByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// @Summary 广告位列表
// @Description 广告位列表
// @Tags 广告位管理
// @Param data body plug_adtype.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/type/list [get]
// @Security
func (c *AdType) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *plug_adtype.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	total, page, list, err := plug_service.SelectListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "广告位列表", result)
}

// @Summary 栏目排序
// @Description 栏目排序
// @Tags 广告位管理
// @Param sorts body integer  true "sorts"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/plug/ad/type/sort [post]
// @Security
func (c *AdType) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "排序失败")
	}
	var err error
	for k, v := range s {
		_, err = plug_adtype.Model.Where("adtype_id=?", k).Data("adtype_sort", v).Update()
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
	}
	response.SusJson(true, r, "排序成功")
}

// 查询所有广告位名和对应id
func (c *AdType) Type(r *ghttp.Request) {
	res, err := plug_adtype.Model.FindAll()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询所有广告位名失败!")
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "广告位名列表", res)
}
