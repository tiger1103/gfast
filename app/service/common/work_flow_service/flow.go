package work_flow_service

import (
	"fmt"
	"gfast/app/model/admin/user"
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/model/admin/wf_run"
	"gfast/app/model/admin/wf_run_process"
	"gfast/app/model/admin/wf_run_sign"
	"gfast/library/utils"
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//工作流数据
type WorkFlow struct {
	WfModel     int                    `json:"wf_model"` //模式
	SingSt      int                    `json:"sing_st"`
	FlowId      uint                   `json:"flow_id"`
	Status      *wf_run_process.Entity `json:"status"`
	FlowProcess uint                   `json:"flow_process"`
	RunId       uint                   `json:"run_id"`
	RunProcess  uint                   `json:"run_process"`
	FlowName    string                 `json:"flow_name"`
	Process     *ProcessData           `json:"process"`
	NextProcess []*ProcessData         `json:"next_process"`
	Preprocess  map[int]string         `json:"preprocess"`
	SingUser    []uint64               `json:"sing_user"`
	SignInfo    *wf_run_sign.Entity    `json:"sign_info"`
	BillCheck   string                 `json:"bill_check"`
	BillTime    string                 `json:"bill_time"`
}

var msgNoAction = "该功能仅对捐赠用户开放，捐赠199即可获得完整工作流功能及配套视频。"

//获取流程信息
func GetFlowInfoById(flowId int64) (entity *flowModel.Entity, err error) {
	return flowModel.GetByID(flowId)
}

//获取流程名称
func GetFlowName(flowId int64) (name string, err error) {
	var info *flowModel.Entity
	info, err = GetFlowInfoById(flowId)
	if err != nil || info == nil {
		return
	}
	name = info.FlowName
	return
}

//检查流程逻辑
func CheckFlow(flowId int64) error {
	_, processList, err := ProcessAll(flowId)
	if err != nil {
		return err
	}
	if processList == nil {
		return gerror.New("没有找到步骤信息!")
	}
	oneStep := 0
	for _, process := range processList {
		if process.Process.ProcessType == "is_one" {
			oneStep++
		}
	}
	if oneStep == 0 {
		return gerror.New("没有设置第一步骤,请修改!")
	}
	if oneStep > 1 {
		return gerror.New(fmt.Sprintf("有 %d 个起始步骤，请修改！", oneStep))
	}
	return nil
}

//获取发起流程按钮及状态
func SetBtn(wfFid uint, wfType, wfTitle, wfStatusField string, status int, userId uint64, departmentId uint64) (g.MapStrAny, error) {
	switch status {
	case 0:
		return g.MapStrAny{
			"title":           "发起审批",
			"api":             "wfStart",
			"wf_type":         wfType,
			"wf_status_field": wfStatusField,
			"wf_title":        wfTitle,
			"wf_fid":          wfFid,
			"type":            "link",
		}, nil
	case 1:
		st := 0
		userName := ""
		flowInfo, processList, err := WorkFlowInfo(wfFid, wfType, userId, departmentId)
		if err != nil {
			if err.Error() == "无权限" {
				//获取当前步骤审批人信息
				userNameArr := make([]string, 0, 10)
				for _, process := range processList {
					userNameArr = append(userNameArr, process.SponsorText)
				}
				return g.MapStrAny{
					"title": "无审批权限（" + gstr.Join(userNameArr, ",") + "）",
					"type":  "text",
				}, nil
			}
			return nil, err
		}
		if flowInfo != nil && flowInfo.NextProcess != nil {
			if flowInfo.Status == nil {
				return g.MapStrAny{
					"title": "提示：当前流程故障，请联系管理员重置流程！",
					"type":  "alert",
				}, nil
			}
			if flowInfo.SingSt == 0 {
				user := garray.NewStrArrayFrom(gstr.Split(flowInfo.Status.SponsorIds, ","))
				userName = flowInfo.Status.SponsorText
				if flowInfo.Status.AutoPerson == 3 || flowInfo.Status.AutoPerson == 4 || flowInfo.Status.AutoPerson == 6 {
					if user.Contains(gconv.String(userId)) {
						st = 1
					}
				} else if flowInfo.Status.AutoPerson == 5 {
					if user.Contains(gconv.String(departmentId)) {
						st = 1
					}
				}
			} else {
				userInfo, err := user.GetUserById(gconv.Uint64(flowInfo.SignInfo.Uid))
				if err != nil {
					return nil, err
				}
				userName = userInfo.UserNickname
				if gconv.Uint64(flowInfo.SignInfo.Uid) == userId {
					st = 1
				}
			}
		} else {
			return nil, nil
		}
		if st == 1 {
			return g.MapStrAny{
				"title":           "审批（" + userName + "）",
				"api":             "wfCheck",
				"wf_type":         wfType,
				"wf_status_field": wfStatusField,
				"wf_title":        wfTitle,
				"wf_fid":          wfFid,
				"type":            "link",
			}, nil
		} else {
			return g.MapStrAny{
				"title": "无审批权限（" + userName + "）",
				"type":  "text",
			}, nil
		}
	case 100:
		return g.MapStrAny{
			"title":           "代审",
			"api":             "wfCheck",
			"wf_type":         wfType,
			"wf_status_field": wfStatusField,
			"wf_title":        wfTitle,
			"wf_fid":          wfFid,
			"type":            "link",
			"sup":             "1",
		}, nil
	}
	return nil, nil
}

//流程状态查询
func WorkFlowInfo(wfFid uint, wfType string, userId uint64, departmentId uint64) (
	*WorkFlow, []*wf_run_process.Entity, error) {

	workFlow := &WorkFlow{}
	processList := ([]*wf_run_process.Entity)(nil)
	if wfFid == 0 || wfType == "" {
		return nil, nil, gerror.New("单据编号，单据表不可为空！")
	}
	//根据表信息，判断当前流程是否还在运行
	runInfo, err := wf_run.GetRunning(&wf_run.RunSearch{
		FromId:    wfFid,
		FromTable: wfType,
		IsDel:     0,
		Status:    0,
	})
	if err != nil {
		return nil, nil, err
	}
	if runInfo != nil {
		info := new(wf_run_process.Entity)
		//获取当前运行的信息
		where := &wf_run_process.SearchRunProcess{
			RunId:          runInfo.Id,
			RunFlow:        runInfo.FlowId,
			RunFlowProcess: runInfo.RunFlowProcess,
			Status:         "0",
		}
		processList, err = wf_run_process.GetProcessList(where)
		if err != nil {
			return nil, nil, err
		}
		if processList == nil || len(processList) == 0 {
			process, err := wf_run_process.GetProcess(where)
			if err != nil {
				return nil, nil, err
			}
			processList = append(processList, process)
		}
		//如果有两个以上的运行步骤，则认定为同步模式
		if len(processList) < 2 {
			workFlow.WfModel = 0
			info = processList[0]
		} else {
			workFlow.WfModel = 2 //同步模式
			for _, process := range processList {
				uIds := garray.NewStrArrayFrom(gstr.Split(process.SponsorIds, ","))
				if process.AutoPerson == 4 || process.AutoPerson == 3 {
					if uIds.Contains(gconv.String(userId)) {
						info = process
						break
					}
				} else {
					if uIds.Contains(gconv.String(departmentId)) {
						info = process
						break
					}
				}
			}
			if info == nil || info.Id == 0 {
				return nil, processList, gerror.New("无权限")
			}
		}
		//设置运行信息数据
		workFlow.SingSt = 0
		workFlow.FlowId = runInfo.FlowId
		if info == nil {
			info = new(wf_run_process.Entity)
		}
		workFlow.Status = info
		workFlow.FlowProcess = info.RunFlowProcess
		workFlow.RunId = runInfo.Id
		workFlow.RunProcess = info.Id
		//获取流程名称
		flowName, err := GetFlowName(gconv.Int64(runInfo.FlowId))
		if err != nil {
			return nil, nil, err
		}
		workFlow.FlowName = flowName
		//获取流程步骤信息
		var processData *ProcessData
		processData, err = GetProcessInfo(info.RunFlowProcess, runInfo.Id)
		if err != nil {
			return nil, nil, err
		}
		workFlow.Process = processData
		//获取下一个步骤信息
		var nextProcess []*ProcessData
		nextProcess, err = GetNexProcessInfo(wfType, wfFid, info.RunFlowProcess, runInfo.Id)
		if err != nil {
			return nil, nil, err
		}
		workFlow.NextProcess = nextProcess
		//获取前几个步骤信息，用于步骤回退
		var preProcess map[int]string
		preProcess, err = GetPreProcessInfo(info.Id)
		workFlow.Preprocess = preProcess
		//获取所有会签人员 todo...
		if runInfo.IsSing == 1 {
			info, err = wf_run_process.GetProcess(&wf_run_process.SearchRunProcess{
				RunId:          runInfo.Id,
				RunFlow:        runInfo.FlowId,
				RunFlowProcess: runInfo.RunFlowProcess,
				Status:         "0",
			})
			if err != nil {
				return nil, nil, err
			}
			workFlow.SingSt = 1
			workFlow.FlowProcess = info.RunFlowProcess
			process, err := GetProcessInfo(info.RunFlowProcess, runInfo.Id)
			if err != nil {
				return nil, nil, err
			}
			workFlow.Status = &wf_run_process.Entity{
				WfMode:   gconv.Int(process.WfMode),
				WfAction: process.WfAction,
			}
			nextProcess, err = GetNexProcessInfo(wfType, wfFid, info.RunFlowProcess, runInfo.Id)
			if err != nil {
				return nil, nil, err
			}
			workFlow.NextProcess = nextProcess
			workFlow.Process = process
			workFlow.RunProcess = info.Id
			workFlow.SignInfo, err = GetSignInfoById(gconv.Uint(runInfo.SingId))
		} else {
			workFlow.BillCheck = ""
			workFlow.BillTime = ""
		}
	} else {
		workFlow.BillCheck = ""
		workFlow.BillTime = ""
	}
	return workFlow, processList, nil
}

//获取对应类型的工作流
func GetWorkFlowByType(wfType string) (flows []*flowModel.Entity, err error) {
	return flowModel.GetWorkFlowByType(wfType)
}

func StartWorkFlow(req *flowModel.SaveWfFlowReq) error {
	//判断流程是否存在--获取所选工作流信息
	flowInfo, err := flowModel.GetByID(req.WfId)
	if err != nil {
		return err
	}
	if flowInfo == nil {
		return gerror.New("未找到工作流信息")
	}
	//判断单据（业务表信息）是否存在
	bill, err := GetBill(req.WfFid, req.WfType)
	if err != nil {
		return err
	}
	if bill == nil {
		return gerror.New("单据不存在")
	}
	//根据流程获取流程第一个步骤
	wfProcesses, err := wf_flow_process.GetProcessesByMap(g.Map{"flow_id": req.WfId})
	if err != nil {
		return err
	}
	if wfProcesses == nil {
		gerror.New("没有流程信息。")
	}
	firstProcess := getFirstProcess(wfProcesses)
	if firstProcess == nil {
		return gerror.New("流程设计出错，未找到第一步流程，请联系管理员！")
	}
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("开启事务处理失败")
	}
	//保存流程数据
	runId, err := AddWfRun(req.WfId, firstProcess.Id, req.WfFid, req.WfType, req.WfTitle, req.WfStatusField, req.UserId, tx)
	if err != nil {
		tx.Rollback()
		return gerror.New("流程设计出错，未找到第一步流程，请联系管理员！")
	}
	//添加流程运行步骤
	err = AddWorkflowProcess(req.WfId, firstProcess, runId, req.UserId, "", tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	//设置第一步审批人员/部门信息
	err = SetBusinessChecker(req.WfFid, req.WfType, runId, firstProcess, "", tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	//添加流程日志
	err = AddWorkflowCache(runId, flowInfo, firstProcess, req.WfFid, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	//更新单据数据
	err = UpdateBill(req.WfFid, req.WfType, req.WfStatusField, 1, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	err = AddRunLog(runId, req, "Send", tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

//获取审批日志
func FlowLog(logType string, wfFid uint, wfType string) ([]*RunLogInfo, error) {
	if logType == "logs" {
		infos, err := RunLog(wfFid, wfType)
		if err != nil {
			return nil, err
		}
		return infos, nil
	}
	return nil, gerror.New("参数出错！")
}

func WorkCheckAction(req *flowModel.CheckWfSaveReq) error {
	if req.Art != "" {
		art := gjson.New(req.Art)
		url := art.GetString("0.url")
		if url != "" {
			url, err := utils.GetFilesPath(url)
			if err != nil {
				return err
			}
			art.Set("0.url", url)
		}
		req.Art, _ = art.ToJsonString()
	}

	if req.SingSt == 0 {
		runCheck, err := RunCheck(req.RunProcess)
		if err != nil {
			return err
		}
		if runCheck == 2 {
			return gerror.New("该业务已办理，请勿重复提交！")
		}
		if req.SubmitToSave == "ok" {
			//提交处理
			err = DoTask(req)
			if err != nil {
				return err
			}
		} else if req.SubmitToSave == "back" {
			//退回处理
			err = DoBack(req)
			if err != nil {
				return err
			}
		} else if req.SubmitToSave == "sing" {
			//会签处理
			err = DoSing(req)
			if err != nil {
				return err
			}
		} else {
			return gerror.New("参数出错")
		}
	} else {
		err := DoSingEnt(req)
		if err != nil {
			return err
		}
	}
	return nil
}

type Running struct {
	*wf_run.Entity
	FlowName string `json:"flow_name"`
	User     string `json:"user"`
}

func GetRunningFlow() ([]*Running, error) {
	run, err := wf_run.GetRuns("status", 0)
	if err != nil {
		return nil, err
	}
	running := make([]*Running, len(run))
	for k, v := range run {
		rn := &Running{Entity: v}
		flow, _ := flowModel.GetByID(gconv.Int64(v.FlowId))
		if flow != nil {
			rn.FlowName = flow.FlowName
		}
		process, err := wf_run_process.GetProcessByMap(g.Map{
			"run_id":           v.Id,
			"run_flow_process": v.RunFlowProcess,
		})
		if err != nil {
			return nil, err
		}
		sponsorText := ""
		for _, s := range process {
			sponsorText += s.SponsorText + ","
		}
		sponsorText = gstr.TrimRightStr(sponsorText, ",")
		rn.User = sponsorText
		running[k] = rn
	}
	return running, nil
}
