package monitor_service

import (
	"gfast/app/model/admin/sys_job"
	"github.com/gogf/gf/frame/g"
)

func init() {
	//自动执行已开启的任务
	jobs, err := sys_job.GetJobs()
	if err != nil {
		g.Log().Error(err)
	}
	for _, job := range jobs {
		JobStart(job)
	}
}

//添加计划任务
func AddJob(req *sys_job.ReqAdd, userId uint64) (id int64, err error) {
	return sys_job.Add(req, userId)
}

//修改计划任务
func EditJob(req *sys_job.ReqEdit, userId uint64) (rows int64, err error) {
	return sys_job.Edit(req, userId)
}

//任务列表
func JobListByPage(req *sys_job.SelectPageReq) (total, page int, list []*sys_job.Entity, err error) {
	return sys_job.JobListByPage(req)
}

//通过id获取任务信息
func GetJobInfoById(id int64) (job *sys_job.Entity, err error) {
	return sys_job.GetJobInfoById(id)
}

//批量删除计划任务
func DeleteJobByIds(ids []int) (err error) {
	return sys_job.DeleteJobByIds(ids)
}

//启动任务
func JobStart(job *sys_job.Entity) error {
	return sys_job.JobStart(job)
}

//停止任务
func JobStop(job *sys_job.Entity) error {
	return sys_job.JobStop(job)
}
