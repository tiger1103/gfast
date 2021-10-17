/*
* @desc:定时任务
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/14 9:02
 */

package api

import (
	"gfast/app/system/dao"
	"gfast/app/system/service"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type sysJob struct {
	SystemBase
}

var SysJob = new(sysJob)

// List 任务列表
func (c *sysJob) List(r *ghttp.Request) {
	var req *dao.SysJobSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	total, page, list, err := service.SysJob.JobList(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	c.SusJsonExit(r, result)
}

func (c *sysJob) Add(r *ghttp.Request) {
	var req *dao.SysJobAddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.CreateBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	err := service.SysJob.AddJob(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "任务添加成功")
}

func (c *sysJob) Get(r *ghttp.Request) {
	id := r.GetInt64("id")
	job, err := service.SysJob.GetJobInfoById(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, job)
}

func (c *sysJob) Edit(r *ghttp.Request) {
	var req *dao.SysJobEditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.UpdateBy = c.GetCurrentUser(r.GetCtx()).GetUserId() //获取登陆用户id
	err := service.SysJob.EditJob(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "修改任务成功")
}

// Start 启动任务
func (c *sysJob) Start(r *ghttp.Request) {
	id := r.GetInt64("id")
	job, err := service.SysJob.GetJobInfoById(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	err = service.SysJob.JobStart(job)
	if err != nil {
		c.FailJsonExit(r, "定时任务管理启动"+err.Error())
	}
	c.SusJsonExit(r, "定时任务管理启动成功")
}

// Stop 停止任务
func (c *sysJob) Stop(r *ghttp.Request) {
	id := r.GetInt64("id")
	job, err := service.SysJob.GetJobInfoById(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	err = service.SysJob.JobStop(job)
	if err != nil {
		c.FailJsonExit(r, "定时任务管理停止"+err.Error())
	}
	c.SusJsonExit(r, "定时任务管理停止成功")
}

// Run 执行任务
func (c *sysJob) Run(r *ghttp.Request) {
	id := r.GetInt64("id")
	job, err := service.SysJob.GetJobInfoById(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	err = service.SysJob.JobRun(job)
	if err != nil {
		c.FailJsonExit(r, "定时任务管理执行"+err.Error())
	}
	c.SusJsonExit(r, "定时任务管理执行成功")
}

// Delete 删除任务
func (c *sysJob) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := service.SysJob.DeleteJobByIds(ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "删除成功")
}
