/*
* @desc:定时任务配置
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/16 15:45
 */

package task

import (
	"gfast/app/system/api"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
)

func init() {
	task1 := &service.TimeTask{
		FuncName: "test1",
		Run:      Test1,
	}
	task2 := &service.TimeTask{
		FuncName: "test2",
		Run:      Test2,
	}
	checkUserOnlineTask := &service.TimeTask{
		FuncName: "checkUserOnline",
		Run:      api.Auth.CheckUserOnline,
	}
	service.TimeTaskList.AddTask(task1).AddTask(task2).AddTask(checkUserOnlineTask)
	//自动执行已开启的任务
	jobs, err := service.SysJob.GetJobs()
	if err != nil {
		g.Log().Error(err)
	}
	for _, job := range jobs {
		service.SysJob.JobStart(job)
	}
}
