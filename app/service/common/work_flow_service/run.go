package work_flow_service

import (
	"fmt"
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_run"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

func AddWfRun(wfId int64, processId int, wfFid int, wfType, wfTitle, wfStatusField string, userId uint64, tx *gdb.TX) (runId int64, err error) {
	//删除旧的流程数据
	_, err = wf_run.Model.TX(tx).Delete(g.Map{
		"from_table": wfType,
		"from_id":    wfFid,
	})
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("删除旧流程信息失败")
	}
	data := &wf_run.RunAddData{
		Pid:            0,
		Uid:            gconv.Uint(userId),
		FlowId:         gconv.Uint(wfId),
		FromTable:      wfType,
		FromId:         wfFid,
		FromTitle:      wfTitle,
		FromStatus:     wfStatusField,
		RunName:        gconv.String(wfFid),
		RunFlowId:      gconv.Uint(wfId),
		RunFlowProcess: gconv.String(processId),
		Dateline:       gconv.Uint(gtime.Timestamp()),
	}
	return wf_run.Add(data, tx)
}

func Up(runId uint, flowProcess string, tx *gdb.TX) (err error) {
	err = wf_run.UpdateRun(runId, g.Map{
		"run_flow_process": flowProcess,
	}, tx)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("更新流程运行信息失败")
	}
	return
}

func UpFlowPress(id uint, runProcess string, tx *gdb.TX) error {
	return Up(id, runProcess, tx)
}

func EndFlow(runId uint, tx *gdb.TX) error {
	err := wf_run.UpdateRun(runId, g.Map{
		"status":  1,
		"endtime": gtime.Timestamp(),
	}, tx)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("结束流程主状态失败")
	}
	return err
}

func UpFlow(runId uint, sid int64, tx *gdb.TX) error {
	err := wf_run.UpdateRun(runId, g.Map{
		"is_sing": 1,
		"sing_id": sid,
		"endtime": gtime.Timestamp(),
	}, tx)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("设置会签状态失败")
	}
	return err
}

func UpRun(id uint, tx *gdb.TX) error {
	err := wf_run.UpdateRun(id, g.Map{
		"is_sing": 0,
	}, tx)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("更新流程状态失败")
	}
	return err
}

//终止流程操作
func DoSupEnd(runId uint, userId uint64, wfStatusField string) error {
	//获取流程运行信息
	runInfo, err := wf_run.GetRunById(runId)
	if err != nil {
		return err
	}
	//日志信息
	fm := &flowModel.SaveWfFlowReq{
		WfType:     runInfo.FromTable,
		WfFid:      runInfo.FromId,
		WfId:       gconv.Int64(runInfo.FlowId),
		CheckCon:   fmt.Sprintf("编号：%d的管理员终止了本流程！", userId),
		RunProcess: gconv.Uint(runInfo.RunFlowProcess),
		RunId:      runId,
		Art:        "",
		UserId:     userId,
	}
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("开启事务失败")
	}
	//结束流程
	err = EndFlow(runId, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	err = EndProcess(gconv.Uint(runInfo.RunFlowProcess), fm.CheckCon, 2, tx)
	if err != nil {
		tx.Rollback()
		return err
	}

	//日志记录
	err = AddRunLog(gconv.Int64(runId), fm, "SupEnd", tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	//更新单据状态
	err = UpdateBill(fm.WfFid, fm.WfType, wfStatusField, 2, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}
