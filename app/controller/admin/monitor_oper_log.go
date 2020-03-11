package admin

import (
	"gfast/app/model/admin/sys_oper_log"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/monitor_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type MonitorOperationLog struct{}

//操作日志列表
func (c *MonitorOperationLog) List(r *ghttp.Request) {
	var req *sys_oper_log.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := monitor_service.OperationLogListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取相关选项
	logStatus, err := dict_service.GetDictWithDataByType("sys_oper_log_status", "", "全部")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage":  page,
		"total":        total,
		"list":         list,
		"searchStatus": logStatus,
	}
	response.SusJson(true, r, "操作日志列表", result)
}

//操作详细
func (c *MonitorOperationLog) Detail(r *ghttp.Request) {
	id := r.GetInt64("id")
	log, err := monitor_service.GetOperationLogById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "操作日志列表", g.Map{
		"info": log,
	})
}

//删除日志
func (c *MonitorOperationLog) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := monitor_service.DeleteOperationLogByIds(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

//清空日志
func (c *MonitorOperationLog) Clear(r *ghttp.Request) {
	err := monitor_service.ClearOperationLog()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "清除成功")
}
