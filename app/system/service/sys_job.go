/*
* @desc:定时任务处理
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/15 9:32
 */

package service

import (
	comModel "gfast/app/common/model"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"strings"

	"github.com/gogf/gf/container/gset"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcron"
	"github.com/gogf/gf/util/gconv"
)

type sysJob struct {
}

var SysJob = new(sysJob)

// JobList 获取任务列表
func (s *sysJob) JobList(req *dao.SysJobSearchReq) (total, page int, list []*model.SysJob, err error) {
	model := dao.SysJob.M
	if req != nil {
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
		if req.JobGroup != "" {
			model = model.Where("job_group", req.JobGroup)
		}
		if req.JobName != "" {
			model = model.Where("job_name like ?", "%"+req.JobName+"%")
		}
	}
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = comModel.PageSize
	}
	err = model.Page(page, req.PageSize).Order("job_id asc").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	return
}

// GetJobs 获取已开启执行的任务
func (s *sysJob) GetJobs() (jobs []*model.SysJob, err error) {
	err = dao.SysJob.Where(dao.SysJob.C.Status, 0).Scan(&jobs)
	return
}

func (s *sysJob) AddJob(req *dao.SysJobAddReq) (err error) {
	_, err = dao.SysJob.Insert(req)
	return
}

func (s *sysJob) GetJobInfoById(id int64) (job *model.SysJob, err error) {
	if id == 0 {
		err = gerror.New("参数错误")
		return
	}
	err = dao.SysJob.Where("job_id", id).Scan(&job)
	if err != nil {
		g.Log().Error(err)
	}
	if job == nil || err != nil {
		err = gerror.New("获取任务信息失败")
	}
	return
}

func (s *sysJob) EditJob(req *dao.SysJobEditReq) error {
	_, err := dao.SysJob.FieldsEx(dao.SysJob.C.JobId, dao.SysJob.C.CreateBy).Where(dao.SysJob.C.JobId, req.JobId).
		Update(req)
	return err
}

// JobStart 启动任务
func (s *sysJob) JobStart(job *model.SysJob) error {
	//获取task目录下是否绑定对应的方法
	f := TimeTaskList.GetByName(job.InvokeTarget)
	if f == nil {
		return gerror.New("没有绑定对应的方法")
	}
	//传参
	paramArr := strings.Split(job.JobParams, "|")
	TimeTaskList.EditParams(f.FuncName, paramArr)
	rs := gcron.Search(job.InvokeTarget)
	if rs == nil {
		if job.MisfirePolicy == 1 {
			t, err := gcron.AddSingleton(job.CronExpression, f.Run, job.InvokeTarget)
			if err != nil {
				return err
			}
			if t == nil {
				return gerror.New("启动任务失败")
			}
		} else {
			t, err := gcron.AddOnce(job.CronExpression, f.Run, job.InvokeTarget)
			if err != nil {
				return err
			}
			if t == nil {
				return gerror.New("启动任务失败")
			}
		}
	}
	gcron.Start(job.InvokeTarget)
	if job.MisfirePolicy == 1 {
		job.Status = 0
		_, err := dao.SysJob.Where(dao.SysJob.C.JobId, job.JobId).Unscoped().Update(g.Map{
			dao.SysJob.C.Status: job.Status,
		})
		return err
	}
	return nil
}

// JobStop 停止任务
func (s *sysJob) JobStop(job *model.SysJob) error {
	//获取task目录下是否绑定对应的方法
	f := TimeTaskList.GetByName(job.InvokeTarget)
	if f == nil {
		return gerror.New("没有绑定对应的方法")
	}
	rs := gcron.Search(job.InvokeTarget)
	if rs != nil {
		gcron.Remove(job.InvokeTarget)
	}
	job.Status = 1
	_, err := dao.SysJob.Where(dao.SysJob.C.JobId, job.JobId).Unscoped().Update(g.Map{
		dao.SysJob.C.Status: job.Status,
	})
	return err
}

//执行任务
func (s *sysJob) JobRun(job *model.SysJob) error {
	//可以task目录下是否绑定对应的方法
	f := TimeTaskList.GetByName(job.InvokeTarget)
	if f == nil {
		return gerror.New("当前task目录下没有绑定这个方法")
	}
	//传参
	paramArr := strings.Split(job.JobParams, "|")
	TimeTaskList.EditParams(f.FuncName, paramArr)
	task, err := gcron.AddOnce("@every 1s", f.Run)
	if err != nil || task == nil {
		return gerror.New("启动执行失败")
	}
	return nil
}

// DeleteJobByIds 删除任务
func (s *sysJob) DeleteJobByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}
	gst := gset.NewFrom(ids)
	var jobs []*model.SysJob
	jobs, err = s.GetJobs()
	if err != nil {
		return
	}
	for _, job := range jobs {
		if gst.Contains(int(job.JobId)) {
			err = gerror.New("运行中的任务不能删除")
			return
		}
	}
	_, err = dao.SysJob.Delete(dao.SysJob.C.JobId+" in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}
