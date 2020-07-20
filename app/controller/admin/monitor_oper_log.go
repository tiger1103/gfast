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

// @Summary 操作日志列表
// @Description 操作日志列表
// @Tags 操作日志
// @Param data body sys_oper_log.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/operlog/list [get]
// @Security
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

// @Summary 操作详细
// @Description 操作详细
// @Tags 操作日志
// @Param id body integer  true "id"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/operlog/detail [post]
// @Security
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

// @Summary 删除日志
// @Description 删除日志
// @Tags 操作日志
// @Param ids body integer  true "ids[]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/operlog/delete [delete]
// @Security
func (c *MonitorOperationLog) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := monitor_service.DeleteOperationLogByIds(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

// @Summary 清空日志
// @Description 清空日志
// @Tags 操作日志
// @Param ids body integer  true "ids[]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/operlog/clear [post]
// @Security
func (c *MonitorOperationLog) Clear(r *ghttp.Request) {
	err := monitor_service.ClearOperationLog()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "清除成功")
}
