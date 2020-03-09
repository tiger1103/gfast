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

//用户状态列表
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

//强制退出
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
