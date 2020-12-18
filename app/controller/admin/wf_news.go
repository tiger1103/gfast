// ==========================================================================
// 生成日期：2020-09-17 10:13:16
// 生成人：gfast
// ==========================================================================
package admin

import (
	wfNewsModel "gfast/app/model/admin/wf_news"
	wfNewsService "gfast/app/service/admin/flow_news_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/common/work_flow_service"

	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

//控制器
type WfNews struct{}

//列表页
func (c *WfNews) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *wfNewsModel.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	userInfo := user_service.GetLoginAdminInfo(r)
	total, page, list, err := wfNewsService.SelectListByPage(req, userInfo.Id, userInfo.DeptId)
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

// 新增
func (c *WfNews) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *wfNewsModel.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		req.Uid = user_service.GetLoginID(r)
		// 调用service中的添加函数添加
		err = wfNewsService.AddSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功")
	}
}

// 修改
func (c *WfNews) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *wfNewsModel.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = wfNewsService.EditSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("id")
	params, err := wfNewsService.GetByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// 删除
func (c *WfNews) Delete(r *ghttp.Request) {
	var req *wfNewsModel.RemoveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := wfNewsService.DeleteByIds(req.Ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}

//审批日志
func (c *WfNews) CheckLog(r *ghttp.Request) {
	id := r.GetUint("id")
	wfType := r.GetString("wf_type")
	//获取流程审批日志信息
	flowLogs, err := work_flow_service.FlowLog("logs", id, wfType)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", flowLogs)
}
