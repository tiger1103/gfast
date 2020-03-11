package admin

import (
	"gfast/app/model/admin/sys_login_log"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/monitor_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type MonitorLoginLog struct{}

//登录日志列表
func (c *MonitorLoginLog) List(r *ghttp.Request) {
	var req *sys_login_log.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := monitor_service.LoginLogListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取相关选项
	logStatus, err := dict_service.GetDictWithDataByType("admin_login_status", "", "全部")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage":  page,
		"total":        total,
		"list":         list,
		"searchStatus": logStatus,
	}
	response.SusJson(true, r, "登录日志列表", result)
}

//删除登录日志
func (c *MonitorLoginLog) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := monitor_service.DeleteLoginLogByIds(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

//清空登录日志
func (c *MonitorLoginLog) Clear(r *ghttp.Request) {
	err := monitor_service.ClearLoginLog()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "清除成功")
}
