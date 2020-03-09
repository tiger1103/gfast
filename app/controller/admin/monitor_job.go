package admin

import (
	"gfast/app/service/admin/dict_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type MonitorJob struct{}

//任务列表
func (c *MonitorJob) List(r *ghttp.Request) {}

//添加任务
func (c *MonitorJob) Add(r *ghttp.Request) {
	//获取相关选项
	jobStatus, err := dict_service.GetDictWithDataByType("sys_job_status", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	jobGroup, err := dict_service.GetDictWithDataByType("sys_job_group", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"jobStatus": jobStatus,
		"jobGroup":  jobGroup,
	}
	response.SusJson(true, r, "添加任务", res)
}
