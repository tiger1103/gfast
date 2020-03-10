package monitor_service

import (
	"gfast/app/model/admin/sys_job"
	"gfast/app/task"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcron"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"strings"
)

func init() {
	//自动执行已开启的任务
	jobs, err := sys_job.Model.Where("status", 0).All()
	if err != nil {
		g.Log().Error(err)
	}
	for _, job := range jobs {
		JobStart(job)
	}
}

//添加计划任务
func AddJob(req *sys_job.ReqAdd, userId int) (id int64, err error) {
	entity := new(sys_job.Entity)
	entity.JobName = req.JobName
	entity.JobGroup = req.JobGroup
	entity.InvokeTarget = req.InvokeTarget
	entity.JobParams = req.JobParams
	entity.CronExpression = req.CronExpression
	entity.MisfirePolicy = req.MisfirePolicy
	entity.Remark = req.Remark
	entity.Status = req.Status
	entity.CreateTime = gconv.Uint64(gtime.Timestamp())
	entity.CreateBy = gconv.Uint64(userId)
	res, err := entity.Save()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("添加任务失败")
	}
	id, err = res.LastInsertId()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("添加任务失败")
	}
	return
}

//修改计划任务
func EditJob(req *sys_job.ReqEdit, userId int) (rows int64, err error) {
	entity, err := GetJobInfoById(req.JobId)
	if err != nil {
		return
	}
	entity.JobName = req.JobName
	entity.JobGroup = req.JobGroup
	entity.InvokeTarget = req.InvokeTarget
	entity.JobParams = req.JobParams
	entity.CronExpression = req.CronExpression
	entity.MisfirePolicy = req.MisfirePolicy
	entity.Remark = req.Remark
	entity.Status = req.Status
	entity.UpdateTime = gconv.Uint64(gtime.Timestamp())
	entity.UpdateBy = gconv.Uint64(userId)
	res, err := entity.Update()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("修改任务失败")
	}
	rows, err = res.RowsAffected()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("修改任务失败")
	}
	return
}

//任务列表
func JobListByPage(req *sys_job.SelectPageReq) (total, page int, list []*sys_job.Entity, err error) {
	model := sys_job.Model
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
		req.PageSize = utils.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("job_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//通过id获取任务信息
func GetJobInfoById(id int64) (job *sys_job.Entity, err error) {
	if id == 0 {
		err = gerror.New("参数错误")
		return
	}
	job, err = sys_job.Model.FindOne("job_id", id)
	if err != nil {
		g.Log().Error(err)
	}
	if job == nil || err != nil {
		err = gerror.New("获取任务信息失败")
		return
	}
	return
}

//批量删除计划任务
func DeleteJobByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
	}
	_, err = sys_job.Model.Delete("job_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}

//启动任务
func JobStart(job *sys_job.Entity) error {
	//可以task目录下是否绑定对应的方法
	f := task.GetByName(job.InvokeTarget)
	if f == nil {
		return gerror.New("当前task目录下没有绑定这个方法")
	}
	//传参
	paramArr := strings.Split(job.JobParams, "|")
	g.Log().Debug(paramArr)
	task.EditParams(f.FuncName, paramArr)
	rs := gcron.Search(job.InvokeTarget)
	if rs == nil {
		if job.MisfirePolicy == 1 {
			task, err := gcron.Add(job.CronExpression, f.Run, job.InvokeTarget)
			if err != nil || task == nil {
				return err
			}
		} else {
			task, err := gcron.AddOnce(job.CronExpression, f.Run, job.InvokeTarget)
			if err != nil || task == nil {
				return err
			}
		}
	}
	gcron.Start(job.InvokeTarget)
	if job.MisfirePolicy == 1 {
		job.Status = 0
		job.Update()
	}
	return nil
}

//停止任务
func JobStop(job *sys_job.Entity) error {
	//可以task目录下是否绑定对应的方法
	f := task.GetByName(job.InvokeTarget)
	if f == nil {
		return gerror.New("当前task目录下没有绑定这个方法")
	}
	rs := gcron.Search(job.InvokeTarget)
	if rs != nil {
		gcron.Stop(job.InvokeTarget)
	}
	job.Status = 1
	job.Update()
	return nil
}
