package admin

import (
	"gfast/app/model/admin/sys_job"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/monitor_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

type MonitorJob struct{}

// @Summary 任务列表
// @Description 任务列表
// @Tags 定时任务
// @Param data body sys_job.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/job/list [get]
// @Security
func (c *MonitorJob) List(r *ghttp.Request) {
	var req *sys_job.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := monitor_service.JobListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取相关选项
	jobStatus, err := dict_service.GetDictWithDataByType("sys_job_status", "", "全部")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	jobGroup, err := dict_service.GetDictWithDataByType("sys_job_group", "", "全部")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage":  page,
		"total":        total,
		"list":         list,
		"searchStatus": jobStatus,
		"searchGroup":  jobGroup,
	}
	response.SusJson(true, r, "任务列表", result)
}

// @Summary 添加任务
// @Description 添加任务
// @Tags 定时任务
// @Param data body sys_job.ReqAdd true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/job/add [post]
// @Security
func (c *MonitorJob) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_job.ReqAdd
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err := monitor_service.AddJob(req, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "任务添加成功")
	}
	//获取相关选项
	jobStatus, err := dict_service.GetDictWithDataByType("sys_job_status", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	jobGroup, err := dict_service.GetDictWithDataByType("sys_job_group", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	jobPolicy, err := dict_service.GetDictWithDataByType("sys_job_policy", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"jobStatus": jobStatus,
		"jobGroup":  jobGroup,
		"jobPolicy": jobPolicy,
	}
	response.SusJson(true, r, "添加任务", res)
}

// @Summary 修改任务
// @Description 修改任务
// @Tags 定时任务
// @Param data body sys_job.ReqEdit true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/job/edit [post]
// @Security
func (c *MonitorJob) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_job.ReqEdit
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err := monitor_service.EditJob(req, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改任务成功")
	}
	id := r.GetInt64("id")
	job, err := monitor_service.GetJobInfoById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取相关选项
	jobStatus, err := dict_service.GetDictWithDataByType("sys_job_status", gconv.String(job.Status), "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	jobGroup, err := dict_service.GetDictWithDataByType("sys_job_group", job.JobGroup, "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	jobPolicy, err := dict_service.GetDictWithDataByType("sys_job_policy", gconv.String(job.MisfirePolicy), "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"jobStatus": jobStatus,
		"jobGroup":  jobGroup,
		"jobPolicy": jobPolicy,
		"jobInfo":   job,
	}
	response.SusJson(true, r, "添加任务", res)
}

// @Summary 详情
// @Description 详情
// @Tags 定时任务
// @Param id body integer true "id"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/job/details [post]
// @Security
func (c *MonitorJob) Details(r *ghttp.Request) {
	id := r.GetInt64("id")
	job, err := monitor_service.GetJobInfoById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "success", job)
}

// @Summary 删除计划任务
// @Description 删除计划任务
// @Tags 定时任务
// @Param ids body integer true "ids[]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/job/delete [delete]
// @Security
func (c *MonitorJob) Delete(r *ghttp.Request) {
	ids := r.GetInts("id")
	err := monitor_service.DeleteJobByIds(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

// @Summary 启动任务
// @Description 启动任务
// @Tags 定时任务
// @Param id body integer true "id"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/job/start [post]
// @Security
func (c *MonitorJob) Start(r *ghttp.Request) {
	id := r.GetInt64("id")
	job, err := monitor_service.GetJobInfoById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	err = monitor_service.JobStart(job)
	if err != nil {
		response.FailJson(true, r, "定时任务管理启动"+err.Error())
	}
	response.SusJson(true, r, "定时任务管理启动成功")
}

// @Summary 停止任务
// @Description 停止任务
// @Tags 定时任务
// @Param id body integer true "id"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/monitor/job/stop [post]
// @Security
func (c *MonitorJob) Stop(r *ghttp.Request) {
	id := r.GetInt64("id")
	job, err := monitor_service.GetJobInfoById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	err = monitor_service.JobStop(job)
	if err != nil {
		response.FailJson(true, r, "定时任务管理停止"+err.Error())
	}
	response.SusJson(true, r, "定时任务管理停止成功")
}
