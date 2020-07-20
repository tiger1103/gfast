package admin

import (
	"gfast/app/model/admin/user_online"
	"gfast/app/service/admin/monitor_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type MonitorOnline struct{}

// @Summary 用户状态列表
// @Description 用户状态列表
// @Tags 在线用户
// @Param data body user_online.ReqListSearch true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/online/list [get]
// @Security
func (c *MonitorOnline) List(r *ghttp.Request) {
	var req *user_online.ReqListSearch
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := monitor_service.GetOnlineListPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "用户在线状态", result)
}

// @Summary 强制退出
// @Description 强制退出
// @Tags 在线用户
// @Param ids body integer  true "ids[]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/online/forceLogout [post]
// @Security
func (c *MonitorOnline) ForceLogout(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "参数错误")
	}
	if err := monitor_service.ForceLogout(ids); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "用户已退出")
}
