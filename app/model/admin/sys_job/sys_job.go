package sys_job

import (
	"gfast/app/task"
	"gfast/library/service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcron"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"strings"
)

// Fill with you ideas below.

//添加操作请求参数
type ReqAdd struct {
	JobName        string `p:"job_name" v:"required#任务名称不能为空"`
	JobParams      string `p:"job_params"` // 任务参数
	JobGroup       string `p:"job_group" `
	InvokeTarget   string `p:"invoke_target" v:"required#执行方法不能为空"`
	CronExpression string `p:"cron_expression" v:"required#任务表达式不能为空"`
	MisfirePolicy  int    `p:"misfire_policy"`
	Concurrent     int    `p:"concurrent" `
	Status         int    `p:"status" v:"required#状态（0正常 1暂停）不能为空"`
	Remark         string `p:"remark" `
}

//修改操作请求参数
type ReqEdit struct {
	JobId int64 `p:"job_id" v:"min:1#任务id不能为空"`
	ReqAdd
}

//分页请求参数
type SelectPageReq struct {
	JobName  string `p:"jobName"`  //任务名称
	JobGroup string `p:"jobGroup"` //任务组名
	Status   string `p:"status"`   //状态（0正常 1暂停）
	PageNum  int    `p:"pageNum"`  //当前页码
	PageSize int    `p:"pageSize"` //每页数
}

func GetJobs() (jobs []*Entity, err error) {
	jobs, err = Model.Where("status", 0).All()
	return
}

//添加计划任务
func Add(req *ReqAdd, userId uint64) (id int64, err error) {
	entity := new(Entity)
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

//通过id获取任务信息
func GetJobInfoById(id int64) (job *Entity, err error) {
	if id == 0 {
		err = gerror.New("参数错误")
		return
	}
	job, err = Model.FindOne("job_id", id)
	if err != nil {
		g.Log().Error(err)
	}
	if job == nil || err != nil {
		err = gerror.New("获取任务信息失败")
		return
	}
	return
}

//修改计划任务
func Edit(req *ReqEdit, userId uint64) (rows int64, err error) {
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
	res, err := Model.Save(entity)
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
func JobListByPage(req *SelectPageReq) (total, page int, list []*Entity, err error) {
	model := Model
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
		req.PageSize = service.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("job_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//批量删除计划任务
func DeleteJobByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
	}
	_, err = Model.Delete("job_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}

//启动任务
func JobStart(job *Entity) error {
	//可以task目录下是否绑定对应的方法
	f := task.GetByName(job.InvokeTarget)
	if f == nil {
		return gerror.New("当前task目录下没有绑定这个方法")
	}
	//传参
	paramArr := strings.Split(job.JobParams, "|")
	task.EditParams(f.FuncName, paramArr)
	rs := gcron.Search(job.InvokeTarget)
	if rs == nil {
		if job.MisfirePolicy == 1 {
			task, err := gcron.AddSingleton(job.CronExpression, f.Run, job.InvokeTarget)
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
		Model.Save(job)
	}
	return nil
}

//停止任务
func JobStop(job *Entity) error {
	//可以task目录下是否绑定对应的方法
	f := task.GetByName(job.InvokeTarget)
	if f == nil {
		return gerror.New("当前task目录下没有绑定这个方法")
	}
	rs := gcron.Search(job.InvokeTarget)
	if rs != nil {
		gcron.Remove(job.InvokeTarget)
	}
	job.Status = 1
	Model.Save(job)
	return nil
}
