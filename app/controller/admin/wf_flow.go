// ==========================================================================
// 生成日期：2020-08-24 17:13:46
// 生成人：gfast
// ==========================================================================
package admin

import (
	"gfast/app/model/admin/sys_dept"
	"gfast/app/model/admin/user"
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/service/admin/dept_service"
	flowService "gfast/app/service/admin/flow_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/common/work_flow_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//控制器
type Flow struct{}

//列表页
func (c *Flow) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *flowModel.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := flowService.SelectListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取流程运行状态
	listData, err := flowService.GetRunningStatus(list)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        listData,
	}
	response.SusJson(true, r, "获取列表数据成功", result)
}

// 新增
func (c *Flow) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *flowModel.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		req.Uid = user_service.GetLoginID(r)
		// 调用service中的添加函数添加
		err = flowService.AddSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功")
	}
}

// 修改
func (c *Flow) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *flowModel.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = flowService.EditSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("id")
	params, err := flowService.GetByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// 删除
func (c *Flow) Delete(r *ghttp.Request) {
	var req *flowModel.RemoveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := flowService.DeleteByIds(req.Ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}

//设置状态
func (c *Flow) StatusSetFlow(r *ghttp.Request) {
	var req *flowModel.StatusReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	err := flowService.SetStatus(req)
	if err != nil {
		response.FailJson(true, r, "状态设置失败")
	}
	response.SusJson(true, r, "状态设置成功")
}

//工作流设计页
func (c *Flow) DesignFlow(r *ghttp.Request) {
	id := r.GetInt64("id")
	if id == 0 {
		response.FailJson(true, r, "参数错误")
	}
	//获取工作流信息
	flowInfo, err := work_flow_service.GetFlowInfoById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	if flowInfo == nil {
		response.FailJson(true, r, "未找到数据，请返回重试!")
	}
	total, processList, err := work_flow_service.ProcessAll(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	processStep := make([]*wf_flow_process.ProcessStepData, 0, 20)
	for _, process := range processList {
		step, err := work_flow_service.GetProcessStep(process, processList)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		if step != nil {
			processStep = append(processStep, step...)
		}
	}
	//获取流程对应表字段信息
	fields, err := work_flow_service.GetFlowTableFields(flowInfo.Type)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", g.Map{
		"flowInfo":    flowInfo,
		"processList": processList,
		"total":       total,
		"fields":      fields,
		"processStep": processStep,
	})
}

//添加流程步骤
func (c *Flow) AddProcess(r *ghttp.Request) {
	id := r.GetInt64("id")
	if id == 0 {
		response.FailJson(true, r, "参数错误")
	}
	//获取工作流信息
	flowInfo, err := work_flow_service.GetFlowInfoById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	if flowInfo == nil {
		response.FailJson(true, r, "添加失败,未找到流程")
	}
	err = work_flow_service.ProcessAdd(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "添加成功")
}

//保存设计
func (c *Flow) SaveProcess(r *ghttp.Request) {
	var req *wf_flow_process.SaveProcessReqBatch
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	for _, rq := range req.Data {
		// 使用结构体定义的校验规则和错误提示进行校验
		if err := gvalid.CheckStruct(rq, nil); err != nil {
			response.FailJson(true, r, err.FirstString())
		}
	}
	if err := work_flow_service.SaveProcess(req); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "保存成功")
}

//获取办理对象（人员/部门）
func (c *Flow) GetManager(r *ghttp.Request) {
	manageType := r.GetString("type")
	//kid := r.GetString("kid")
	keyWords := r.GetString("key")
	if manageType == "getUser" {
		req := &user.SearchReq{
			KeyWords: keyWords,
			PageSize: 50,
		}
		_, _, userList, err := user_service.GetAdminList(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		res := make(g.ListStrAny, len(userList))
		for k, v := range userList {
			res[k] = g.MapStrAny{
				"label": v.UserNickname,
				"value": v.Id,
			}
		}
		response.SusJson(true, r, "ok", res)
	} else if manageType == "getDepartment" {
		req := &sys_dept.SearchParams{
			DeptName: keyWords,
		}
		list, err := dept_service.GetList(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		res := make(g.ListStrAny, len(list))
		for k, v := range list {
			res[k] = g.MapStrAny{
				"label": v.DeptName,
				"value": v.DeptID,
			}
		}
		response.SusJson(true, r, "ok", res)
	}
	response.FailJson(true, r, "参数错误")
}

//保存节点属性
func (c *Flow) SaveAttr(r *ghttp.Request) {
	var req *wf_flow_process.SaveAttrReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	if err := work_flow_service.SaveProcessAttr(req); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "保存成功", req)
}

//删除节点
func (c *Flow) DeleteProcess(r *ghttp.Request) {
	var req *wf_flow_process.DeleteProcessReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	if err := work_flow_service.ProcessDelete(req); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

//清除流程节点
func (c *Flow) DeleteProcessAll(r *ghttp.Request) {
	flowId := r.GetInt("flow_id")
	if flowId == 0 {
		response.FailJson(true, r, "参数错误")
	}
	if err := work_flow_service.ProcessDeleteAll(flowId); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "清除成功")
}

//检查流程逻辑
func (c *Flow) CheckFlow(r *ghttp.Request) {
	flowId := r.GetInt64("flow_id")
	if flowId == 0 {
		response.FailJson(true, r, "参数错误")
	}
	err := work_flow_service.CheckFlow(flowId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "简单逻辑检查通过，请自行检查转出条件！")
}

//发起选择工作流程
func (c *Flow) WfStart(r *ghttp.Request) {
	var req *flowModel.StartFlowReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	flow, err := work_flow_service.GetWorkFlowByType(req.WfType)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	response.SusJson(true, r, "ok", g.Map{
		"flow": flow,
		"info": req,
	})
}

//保存业务流程信息
func (c *Flow) SaveStartWf(r *ghttp.Request) {
	var req *flowModel.SaveWfFlowReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	req.UserId = user_service.GetLoginID(r)
	err := work_flow_service.StartWorkFlow(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "发起成功")
}

//审批
func (c *Flow) WfCheck(r *ghttp.Request) {
	var req *flowModel.CheckWfReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	//当前用户信息
	userInfo := user_service.GetLoginAdminInfo(r)
	//获取流程信息
	flowInfo, _, err := work_flow_service.WorkFlowInfo(req.WfFid, req.WfType, userInfo.Id, userInfo.DeptId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取流程审批日志信息
	flowLogs, err := work_flow_service.FlowLog("logs", req.WfFid, req.WfType)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取业务信息
	table, err := work_flow_service.GetBill(gconv.Int(req.WfFid), req.WfType)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", g.Map{
		"info":     req,
		"flowInfo": flowInfo,
		"flowLogs": flowLogs,
		"table":    table,
	})
}

//审批数据保存
func (c *Flow) CheckSave(r *ghttp.Request) {
	var req *flowModel.CheckWfSaveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	req.UserId = user_service.GetLoginID(r)
	err := work_flow_service.WorkCheckAction(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", req)
}

//获取回退步骤数据
func (c *Flow) GetBackTodo(r *ghttp.Request) {
	var req *flowModel.BackTodoReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	todo, err := work_flow_service.GetBackTodo(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", todo)
}

//流程监控
func (c *Flow) Monitoring(r *ghttp.Request) {
	list, err := work_flow_service.GetRunningFlow()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", list)
}

//终止流程
func (c *Flow) StopFlow(r *ghttp.Request) {
	runId := r.GetUint("id")
	wfStatusField := r.GetString("WfStatusField")
	if runId == 0 || wfStatusField == "" {
		response.FailJson(true, r, "参数错误")
	}
	userId := user_service.GetLoginID(r)
	if err := work_flow_service.DoSupEnd(runId, userId, wfStatusField); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "终止成功")
}
