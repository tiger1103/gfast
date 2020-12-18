package work_flow_service

import (
	"gfast/app/model/admin/user"
	"gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/model/admin/wf_run"
	"gfast/app/model/admin/wf_run_process"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//添加流程步骤日志
func AddWorkflowProcess(wfId int64, process *wf_flow_process.Entity, runId int64, userId uint64, todo string, tx *gdb.TX) error {
	processData := &ProcessData{
		Entity: process,
	}
	if process.AutoPerson == 6 && process.ProcessType == "is_one" {
		//事务处理人员
		wf, err := wf_run.GetRunById(gconv.Uint(runId))
		if err != nil {
			return err
		}
		userIdBil, err := GetBilValue(wf.FromTable, wf.FromId, process.WorkText)
		if err != nil {
			return err
		}
		userInfo, err := user.GetUserById(gconv.Uint64(userIdBil))
		if err != nil {
			return err
		}
		processData.UserInfo = userInfo
		processData.Todo = g.MapStrAny{"text": userInfo.UserNickname}
	}
	sponsorIds := ""
	sponsorText := ""
	//非自由选择
	if todo == "" {
		if process.AutoPerson == 3 {
			//办理人员
			sponsorIds = process.RangeUserIds
			sponsorText = process.RangeUserText
		} else if process.AutoPerson == 4 {
			//办理人员
			sponsorIds = process.AutoSponsorIds
			sponsorText = process.AutoSponsorText
		} else if process.AutoPerson == 5 {
			//办理部门
			sponsorIds = process.AutoRoleIds
			sponsorText = process.AutoRoleText
		} else if process.AutoPerson == 6 {
			sponsorText = processData.UserInfo.UserNickname
			sponsorIds = gconv.String(processData.UserInfo.Id)
		}
	} else {
		todoArr := gstr.Split(todo, "*%*")
		sponsorText = todoArr[1]
		sponsorIds = todoArr[0]
	}
	timeNow := gconv.Uint(gtime.Timestamp())
	//判断如果运行步骤已经存在则置为转交状态
	err := UpdateRunProcess(g.Map{
		"run_id":           runId,
		"run_flow":         wfId,
		"run_flow_process": processData.Id,
	}, g.Map{"status": 2}, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	//添加新的运行状态
	data := &wf_run_process.SaveRunProcessData{
		Uid:               gconv.Uint(userId),
		RunId:             gconv.Uint(runId),
		RunFlow:           gconv.Uint(wfId),
		RunFlowProcess:    gconv.Uint(processData.Id),
		ParentFlow:        0,
		ParentFlowProcess: 0,
		RunChild:          0, //未处理，第一步不能进入子流程
		Remark:            "",
		IsSponsor:         0,
		Status:            0,
		SponsorIds:        sponsorIds,                        //办理者id
		SponsorText:       sponsorText,                       //办理者信息
		AutoPerson:        gconv.Int(processData.AutoPerson), //办理类别
		JsTime:            timeNow,
		Dateline:          timeNow,
		WfMode:            gconv.Int(processData.WfMode),
		WfAction:          processData.WfAction,
	}
	return wf_run_process.Add(data, tx)
}

func RunCheck(process uint) (status uint, err error) {
	var entity *wf_run_process.Entity
	entity, err = wf_run_process.GetProcessById(process)
	if err != nil {
		return
	}
	status = entity.Status
	return
}

func EndProcess(runProcess uint, con string, status int, tx *gdb.TX) (err error) {
	_, err = wf_run_process.Model.TX(tx).Where("id", runProcess).Update(g.Map{"status": status, "remark": con, "bl_time": gtime.Timestamp()})
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("结束流程错误")
	}
	return
}

func UpdateRunProcess(where g.Map, data g.Map, tx *gdb.TX) (err error) {
	_, err = wf_run_process.Model.TX(tx).Where(where).Update(data)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("设置运行流程信息失败")
	}
	return
}

func GetBackTodo(req *wf_flow.BackTodoReq) (string, error) {
	where := &wf_run_process.SearchRunProcess{
		RunId:          req.RunId,
		RunFlowProcess: req.Pid,
	}
	runProcess, err := wf_run_process.GetProcess(where)
	if err != nil {
		return "", err
	}
	todo := ""
	if runProcess == nil {
		return todo, nil
	}
	if runProcess.AutoPerson == 3 {
		todo = runProcess.SponsorIds + "*%*" + runProcess.SponsorText
	}
	return todo, nil
}
