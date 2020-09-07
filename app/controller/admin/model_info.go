package admin

import (
	"gfast/app/model/admin/model_info"
	"gfast/app/service/admin/model_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

//控制器
type ModelInfo struct{}

// @Summary 列表页
// @Description 列表页
// @Tags 模型列表
// @Param data body model_info.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/info/list [post]
// @Security
func (c *ModelInfo) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *model_info.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := model_service.SelectListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "获取列表数据成功", result)
}

// @Summary 新增
// @Description 新增
// @Tags 模型列表
// @Param data body model_info.AddReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/info/add [post]
// @Security
func (c *ModelInfo) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *model_info.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		req.CreateBy = user_service.GetLoginID(r)
		// 调用service中的添加函数添加
		err = model_service.AddSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加模型成功")
	}
}

// @Summary 修改
// @Description 修改
// @Tags 模型列表
// @Param data body model_info.EditReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/info/edit [post]
// @Security
func (c *ModelInfo) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *model_info.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		editReq.UpdateBy = user_service.GetLoginID(r)
		err = model_service.EditSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt64("id")
	params, err := model_service.GetByID(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// @Summary 删除
// @Description 删除
// @Tags 模型列表
// @Param data body model_info.RemoveReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/info/delete [post]
// @Security
func (c *ModelInfo) Delete(r *ghttp.Request) {
	var req *model_info.RemoveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := model_service.DeleteByIds(req.Ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}

// @Summary 设置模型状态
// @Description 设置模型状态
// @Tags 模型列表
// @Param data body model_info.StatusSetReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/info/setStatus [post]
// @Security
func (c *ModelInfo) SetStatus(r *ghttp.Request) {
	var req *model_info.StatusSetReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := model_service.SetInfoStatus(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "状态设置成功")
}

// @Summary 模型生成
// @Description 模型生成
// @Tags 模型列表
// @Param modelId path int true "int valid"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/info/createModel [post]
// @Security
func (c *ModelInfo) CreateModel(r *ghttp.Request) {
	modelId := r.GetInt64("modelId")
	err := model_service.CreateModel(modelId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "模型生成成功")
}

// @Summary 复制模型
// @Description 复制模型
// @Tags 模型列表
// @Param modelId path int true "int valid"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/model/info/copyModel [post]
// @Security
func (c *ModelInfo) CopyModel(r *ghttp.Request) {
	modelId := r.GetInt64("modelId")
	err := model_service.CopyModel(modelId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "模型复制成功")
}
