package admin

import (
	"gfast/app/model/admin/model_fields"
	"gfast/app/service/admin/model_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//控制器
type ModelFields struct{}

//列表页
func (c *ModelFields) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *model_fields.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	list, err := model_service.SelectFieldsAll(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"list": list,
	}
	response.SusJson(true, r, "获取列表数据成功", result)
}

// 新增
func (c *ModelFields) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *model_fields.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		req.CreateBy = gconv.Uint64(user_service.GetLoginID(r))
		// 调用service中的添加函数添加
		err = model_service.AddFieldsSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功")
	}
}

// 修改
func (c *ModelFields) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *model_fields.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		editReq.UpdateBy = gconv.Uint64(user_service.GetLoginID(r))
		err = model_service.EditFieldsSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("id")
	params, err := model_fields.GetByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// 删除
func (c *ModelFields) Delete(r *ghttp.Request) {
	var req *model_fields.RemoveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := model_service.DeleteFieldsByIds(req.Ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}

//修改字段属性
func (c *ModelFields) SetFieldsAttr(r *ghttp.Request) {
	var req *model_fields.SetFieldsAttrReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	if err := model_service.SetFieldsAttr(req); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "修改成功", req)
}
