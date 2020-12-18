package work_flow_service

import (
	"gfast/app/model/admin/user"
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/model/admin/wf_run_log"
	"gfast/app/model/admin/wf_run_process"
	"gfast/app/model/admin/wf_workinfo"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//工作流审批日志记录
func AddRunLog(runId int64, req *flowModel.SaveWfFlowReq, btn string, tx *gdb.TX) error {
	workReturn := ""
	if btn != "Send" && btn != "SupEnd" {
		//workReturn =
		//在日志记录前加载节点钩子
		var err error
		workReturn, err = WorkApi(req, tx)
		if err != nil {
			return err
		}
	}
	err := wf_run_log.Add(&wf_run_log.AddData{
		Uid:       gconv.Uint(req.UserId),
		FromId:    req.WfFid,
		FromTable: req.WfType,
		RunId:     gconv.Uint(runId),
		Content:   req.CheckCon,
		WorkInfo:  workReturn,
		Art:       req.Art,
		Btn:       btn,
		Dateline:  gconv.Uint(gtime.Timestamp()),
	}, tx)
	return err
}

func WorkApi(req *flowModel.SaveWfFlowReq, tx *gdb.TX) (string, error) {
	sqlReturn := "null"
	msgReturn := "null"
	//去除当前运行的步骤ID
	runProcess, err := wf_run_process.GetProcessById(req.RunProcess)
	if err != nil {
		return "", err
	}
	runFlowProcess := runProcess.RunFlowProcess
	//获取当前步骤版本ID，对应的所有信息
	flowProcessInfo, err := wf_flow_process.GetProcessInfoById(runFlowProcess)
	if err != nil {
		return "", err
	}
	if flowProcessInfo == nil {
		return "flow_process_info err!", nil
	}
	if flowProcessInfo.WorkSql != "" {
		workInfoId, err := workSql(req, flowProcessInfo, tx)
		if err != nil {
			return "", err
		}
		sqlReturn = gconv.String(workInfoId)
		if flowProcessInfo.WorkMsg != "" {
			workInfoId, err := workMsg(req, flowProcessInfo, tx)
			if err != nil {
				return "", err
			}
			msgReturn = gconv.String(workInfoId)
		}
	}
	return "work_sql:" + sqlReturn + "|work_msg:" + msgReturn, nil
}

func workMsg(req *flowModel.SaveWfFlowReq, flowProcessInfo *wf_flow_process.Entity, tx *gdb.TX) (int64, error) {
	newWorkMsg := gstr.ReplaceIByArray(flowProcessInfo.WorkMsg, []string{
		"@from_id", gconv.String(req.WfFid),
		"@run_id", gconv.String(req.RunId),
		"@check_con", req.CheckCon,
	})
	workInfoId, err := wf_workinfo.Add(&wf_workinfo.AddData{
		Datetime: gtime.Now(),
		Type:     "work_msg",
		BillInfo: gconv.String(req),
		Data:     newWorkMsg,
		Info:     "success",
	}, tx)
	if err != nil {
		return -1, err
	}
	return workInfoId, nil
}

func workSql(req *flowModel.SaveWfFlowReq, flowProcessInfo *wf_flow_process.Entity, tx *gdb.TX) (int64, error) {
	newWorkSql := gstr.ReplaceIByArray(flowProcessInfo.WorkSql, []string{
		"@from_id", gconv.String(req.WfFid),
		"@run_id", gconv.String(req.RunId),
		"@check_con", req.CheckCon,
	})
	workReturn := ""
	_, err := g.DB().Query(newWorkSql)
	if err != nil {
		g.Log().Error()
		workReturn = "SQL_Err:" + newWorkSql
	}
	workInfoId, err := wf_workinfo.Add(&wf_workinfo.AddData{
		Datetime: gtime.Now(),
		Type:     "work_sql",
		BillInfo: gconv.String(req),
		Data:     newWorkSql,
		Info:     workReturn,
	}, tx)
	if err != nil {
		return -1, err
	}
	return workInfoId, nil
}

type RunLogInfo struct {
	*wf_run_log.Entity
	User string `json:"user"`
}

//获取审批日志
func RunLog(wfFid uint, wfType string) ([]*RunLogInfo, error) {
	types := g.MapStrStr{
		"Send":     "流程发起",
		"ok":       "同意提交",
		"Back":     "退回修改",
		"SupEnd":   "终止流程",
		"Sing":     "会签提交",
		"sok":      "会签同意",
		"SingBack": "会签退回",
		"SingSing": "会签再会签",
	}
	runLog, err := wf_run_log.GetRunLog(g.Map{
		"from_id":    wfFid,
		"from_table": wfType,
	})
	if err != nil {
		return nil, err
	}
	logs := make([]*RunLogInfo, len(runLog))
	for k, v := range runLog {
		logs[k] = &RunLogInfo{
			Entity: v,
		}
		logs[k].Btn = types[v.Btn]
		userInfo, err := user.GetUserById(gconv.Uint64(v.Uid))
		if err != nil {
			return nil, err
		}
		logs[k].User = userInfo.UserNickname
	}
	return logs, nil
}

//运行记录
func Run(req *flowModel.CheckWfSaveReq, btn string, tx *gdb.TX) error {
	if req.Npid != "" && req.Npid != "0" {
		nexPid := gstr.Split(req.Npid, ",")
		var wps []*wf_flow_process.Entity
		for _, v := range nexPid {
			wfProcess, err := GetProcessInfo(gconv.Uint(v), req.RunId)
			if err != nil {
				return err
			}
			//添加流程步骤日志
			wp := new(wf_flow_process.Entity)
			err = gconv.Struct(wfProcess.Entity, wp)
			if err != nil {
				g.Log().Error(err)
				return gerror.New("转换流程步骤数据失败")
			}
			err = AddWorkflowProcess(req.FlowId, wp, gconv.Int64(req.RunId), req.UserId, req.Todo, tx)
			if err != nil {
				return err
			}
			wps = append(wps, wp)
		}
		if wps != nil {
			//设置下一步审批人员/部门信息
			err := SetBusinessCheckers(gconv.Int(req.WfFid), req.WfType, gconv.Int64(req.RunId), wps, req.Todo, tx)
			if err != nil {
				return err
			}
		}
	}
	//日志记录
	fm := &flowModel.SaveWfFlowReq{
		WfType:     req.WfType,
		WfFid:      gconv.Int(req.WfFid),
		WfId:       req.FlowId,
		CheckCon:   req.CheckCon,
		RunProcess: req.RunProcess,
		RunId:      req.RunId,
		Art:        req.Art,
		UserId:     req.UserId,
	}
	err := AddRunLog(gconv.Int64(req.RunId), fm, btn, tx)
	if err != nil {
		return err
	}
	return nil
}
