package work_flow_service

import (
	"encoding/json"
	"gfast/app/model/admin/user"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/model/admin/wf_run"
	"gfast/app/model/admin/wf_run_process"
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//流程运行数据
type ProcessData struct {
	*wf_flow_process.Entity
	Todo     g.MapStrAny  `json:"todo"`
	UserInfo *user.Entity `json:"user_info"`
}

//获取流程下所有步骤信息
func ProcessAll(flowId int64) (total int64, list []*wf_flow_process.ProcessData, err error) {
	return wf_flow_process.ProcessAll(flowId)
}

//获取流程转出信息
func GetProcessStep(processInfo *wf_flow_process.ProcessData, processList []*wf_flow_process.ProcessData) (
	list []*wf_flow_process.ProcessStepData, err error) {
	if processInfo == nil || processInfo.ProcessTo == "" || processList == nil {
		return
	}
	processArr := garray.NewStrArrayFrom(gstr.Split(processInfo.ProcessTo, ","))
	for _, process := range processList {
		if processArr.Contains(gconv.String(process.Id)) {
			var con []string
			con, err = getProcessCondition(processInfo.Process.OutCondition, process.Id)
			list = append(list, &wf_flow_process.ProcessStepData{
				PrevId:      processInfo.Id,
				Id:          process.Id,
				ProcessName: process.ProcessName,
				ProcessType: process.Process.ProcessType,
				Condition:   con,
			})
		}
	}
	return
}

//获取转出条件
func getProcessCondition(condition string, id interface{}) ([]string, error) {
	if condition == "" {
		return nil, nil
	}
	j, err := gjson.DecodeToJson(condition)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("转换转出条件失败")
	}
	return j.GetStrings(gconv.String(id) + ".condition"), nil
}

//添加流程步骤
func ProcessAdd(flowId int64) error {
	return wf_flow_process.ProcessAdd(flowId)
}

//保存流程设计
func SaveProcess(req *wf_flow_process.SaveProcessReqBatch) error {
	return wf_flow_process.SaveProcess(req)
}

//获取流程管理表字段信息
func GetFlowTableFields(tableName string) (fields []*wf_flow_process.FlowTableField, err error) {
	//表前缀
	dbPrefix := g.DB().GetPrefix()
	//数据库
	database := g.Cfg().GetString("database.name")
	return wf_flow_process.GetFlowTableFields(dbPrefix, database, tableName)
}

//pid 步骤ID wf_flow_process 主键
//runId 运行步骤ID wf_run 主键
func GetProcessInfo(pid, runId uint) (data *ProcessData, err error) {
	var flowProcessInfo *wf_flow_process.Entity
	flowProcessInfo, err = wf_flow_process.GetProcessInfoById(pid)
	if err != nil {
		return
	}
	if flowProcessInfo == nil {
		err = gerror.New("不存在流程信息")
		return
	}
	data = &ProcessData{
		Entity: flowProcessInfo,
	}
	if flowProcessInfo.AutoPerson == 3 { //自由选择
		data.Todo = g.MapStrAny{"ids": gstr.Split(flowProcessInfo.RangeUserIds, ","), "text": gstr.Split(flowProcessInfo.RangeUserText, ",")}
	} else if flowProcessInfo.AutoPerson == 4 { //办理人员
		data.Todo = g.MapStrAny{"text": flowProcessInfo.AutoSponsorText}
	} else if flowProcessInfo.AutoPerson == 5 { //办理部门
		data.Todo = g.MapStrAny{"text": flowProcessInfo.AutoRoleText}
	} else if flowProcessInfo.AutoPerson == 6 { //事务接受
		var runInfo *wf_run.Entity
		runInfo, err = wf_run.GetRunById(runId)
		if err != nil {
			return
		}
		if runInfo == nil {
			err = gerror.New("不存在运行状态信息")
			return
		}
		var userId interface{}
		userId, err = GetBilValue(runInfo.FromTable, runInfo.FromId, flowProcessInfo.WorkText)
		if err != nil {
			return
		}
		if userId == nil {
			err = gerror.New("获取事务接受用户ID失败，请检测流程设计是否设置的是用户ID字段")
			return
		}
		var userInfo *user.Entity
		userInfo, err = user.GetUserById(gconv.Uint64(userId))
		if err != nil {
			return
		}
		data.Todo = g.MapStrAny{"text": userInfo.UserNickname}
		data.UserInfo = userInfo
	}
	return
}

//同步步骤信息
func GetProcessInfos(ids []uint, runId uint) (datas []*ProcessData, err error) {
	var list []*wf_flow_process.Entity
	list, err = wf_flow_process.GetProcessInfosByIds(ids)
	if err != nil {
		return
	}
	datas = make([]*ProcessData, len(list))
	for k, v := range list {
		var todo g.MapStrAny
		var userInfo *user.Entity
		if v.AutoPerson == 3 { //自由选择 办理人员
			todo = g.MapStrAny{
				"ids":  gstr.Split(v.AutoSponsorIds, ","),
				"text": gstr.Split(v.AutoSponsorText, ","),
			}
		} else if v.AutoPerson == 4 { //办理人员
			todo = g.MapStrAny{"text": v.AutoSponsorText}
		} else if v.AutoPerson == 5 { //办理部门
			todo = g.MapStrAny{"text": v.AutoRoleText}
		} else if v.AutoPerson == 6 { //事务接受
			var runInfo *wf_run.Entity
			runInfo, err = wf_run.GetRunById(runId)
			if err != nil {
				return
			}
			if runInfo == nil {
				err = gerror.New("不存在运行状态信息")
				return
			}
			var userId interface{}
			userId, err = GetBilValue(runInfo.FromTable, runInfo.FromId, v.WorkText)
			if err != nil {
				return
			}
			if userId == nil {
				err = gerror.New("获取事务接受用户ID失败，请检测流程设计是否设置的是用户ID字段")
				return
			}
			userInfo, err = user.GetUserById(gconv.Uint64(userId))
			if err != nil {
				return
			}
			todo = g.MapStrAny{"text": userInfo.UserNickname}
		}
		datas[k] = &ProcessData{
			Entity:   v,
			Todo:     todo,
			UserInfo: userInfo,
		}
	}
	return
}

//获取事务接受信息
func GetBilValue(fromTable string, fromId int, workText string) (value interface{}, err error) {
	var rec gdb.Record
	rec, err = GetBill(fromId, fromTable)
	if err != nil {
		return
	}
	value = rec[workText]
	return
}

//获取工作流业务表信息
func GetBill(fromId int, fromTable string) (rec gdb.Record, err error) {
	rec, err = g.DB().Table(fromTable).FindOne(fromId)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取工作里业务数据失败")
		return
	}
	return
}

//更新业务表信息
func UpdateBill(wfFid int, wfType string, statusField string, status int, tx *gdb.TX) error {
	_, err := tx.Table(wfType).WherePri(wfFid).Update(g.Map{
		statusField: status,
	})
	if err != nil {
		g.Log().Error(err)
		return gerror.New("更新单据信息失败")
	}
	return nil
}

//删除流程节点
func ProcessDelete(req *wf_flow_process.DeleteProcessReq) error {
	return wf_flow_process.ProcessDelete(req)
}

//清空节点
func ProcessDeleteAll(flowId int) error {
	_, err := wf_flow_process.Model.Where("flow_id", flowId).Delete()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}

//获取下个审批流信息
//wfType 单据表
//wfFid 单据id
//pid 流程id
//runId 运行id
func GetNexProcessInfo(wfType string, wfFid uint, pid uint, runId uint) ([]*ProcessData, error) {
	if pid == 0 {
		return nil, nil
	}
	nex, err := wf_flow_process.GetProcessInfoById(pid)
	if err != nil {
		return nil, err
	}
	var process *ProcessData
	var processes []*ProcessData
	//先判断下上一个流程是什么模式
	if nex.ProcessTo != "" {
		//下一个流程的下一步
		nexPidStr := gstr.Split(nex.ProcessTo, ",")
		nexPid := make([]uint, len(nexPidStr))
		for k, v := range nexPidStr {
			nexPid[k] = gconv.Uint(v)
		}
		//下一个流程转出条件
		var outCondition g.MapStrAny
		err = json.Unmarshal([]byte(nex.OutCondition), &outCondition)
		if err != nil {
			outCondition = g.MapStrAny{}
		}
		switch nex.WfMode {
		case 0: //单一模式
			process, err = GetProcessInfo(gconv.Uint(nex.ProcessTo), runId)
			if err != nil {
				return nil, err
			}
			processes = append(processes, process)
		case 1: //多个审批流
			var nextProcessId uint
			for key, val := range outCondition {
				mapVal := gconv.Map(val)
				condition := gstr.Join(gconv.SliceStr(mapVal["condition"]), " ")
				//根据条件寻找匹配符合的工作流id
				if gstr.ContainsI(condition, "include") {
					condition = gstr.ReplaceI(condition, "include", " REGEXP ")
				}
				info, err := g.DB().Table(wfType).Where(condition).WherePri(wfFid).FindOne()
				if err != nil {
					g.Log().Error(err)
					return nil, gerror.New("获取转出条件对应的审批信息失败")
				}
				if info != nil {
					nextProcessId = gconv.Uint(key)
					break
				}
			}
			if nextProcessId == 0 { //没有权限
				return nil, nil
			}
			process, err = GetProcessInfo(nextProcessId, runId)
			if err != nil {
				return nil, err
			}
			processes = append(processes, process)
		case 2: //同步模式
			processes, err = GetProcessInfos(nexPid, runId)
			if err != nil {
				return nil, err
			}
		}
	} else {
		process = &ProcessData{
			Entity: &wf_flow_process.Entity{
				Id:          0,
				AutoPerson:  0,
				ProcessName: "END",
			},
			Todo: g.MapStrAny{"text": "结束"},
		}
		processes = append(processes, process)
	}
	return processes, nil
}

func GetPreProcessInfo(runId uint) (map[int]string, error) {
	var pre []*wf_flow_process.Entity
	preRun, err := wf_run_process.GetProcessById(runId)
	if err != nil {
		return nil, err
	}
	//获取本流程中小于本次ID的步骤信息
	var preP []*wf_run_process.Entity
	preP, err = wf_run_process.GetProcessLtId(preRun)
	if err != nil {
		return nil, err
	}
	//遍历获取小于本次ID中的相关步骤
	for _, v := range preP {
		wfp, err := wf_flow_process.GetProcessInfoById(v.RunFlowProcess)
		if err != nil {
			return nil, err
		}
		pre = append(pre, wfp)
	}
	preMap := make(map[int]string, 5)
	preMap[0] = "退回制单人修改"
	if len(pre) > 0 {
		for _, v := range pre {
			todo := ""
			if v.AutoPerson == 4 { //办理人员
				todo = v.AutoSponsorText
			} else if v.AutoPerson == 5 { //办理部门
				todo = v.AutoRoleText
			}
			preMap[v.Id] = v.ProcessName + "(" + todo + ")"
		}
	}
	return preMap, nil
}

//保存流程节点属性
func SaveProcessAttr(req *wf_flow_process.SaveAttrReq) error {
	if req == nil {
		return gerror.New("参数错误")
	}
	processCondition := gstr.Split(req.ProcessCondition, ",")
	outCondition := make(g.MapStrAny, 10)
	if len(processCondition) > 1 && req.WfMode == "1" {
		return gerror.New(msgNoAction)
	}
	ocbt, _ := json.Marshal(outCondition)
	entity, err := wf_flow_process.FindOne(req.ProcessId)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("获取流程信息失败")
	}
	style := gjson.New(nil)
	style.Set("width", req.StyleWidth)
	style.Set("height", req.StyleHeight)
	style.Set("color", "#0e76a8")

	entity.ProcessName = req.ProcessName
	entity.ProcessType = req.ProcessType
	entity.AutoPerson = gconv.Uint(req.AutoPerson)
	entity.WfMode = gconv.Uint(req.WfMode)
	entity.WfAction = req.WfAction
	entity.AutoSponsorIds = req.AutoSponsorIds
	entity.AutoSponsorText = req.AutoSponsorText
	entity.AutoRoleIds = req.AutoRoleIds
	entity.AutoRoleText = req.AutoRoleText
	entity.RangeUserIds = req.RangeUserIds
	entity.RangeUserText = req.RangeUserText
	entity.WorkText = req.WorkText
	entity.WorkIds = req.WorkIds
	entity.WorkMsg = req.WorkMsg
	entity.WorkSql = req.WorkSql
	entity.IsSing = gconv.Uint(req.IsSing)
	entity.IsBack = gconv.Uint(req.IsBack)
	entity.OutCondition = string(ocbt)
	entity.Style = style.MustToJsonString()
	_, err = wf_flow_process.Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("保存失败")
	}
	return nil
}

//获取流程步骤第一步
func getFirstProcess(processes []*wf_flow_process.Entity) *wf_flow_process.Entity {
	//找到 流程第一步
	var firstProcess *wf_flow_process.Entity
	for _, process := range processes {
		if process.ProcessType == "is_one" {
			firstProcess = process
			break
		}
	}
	return firstProcess
}
