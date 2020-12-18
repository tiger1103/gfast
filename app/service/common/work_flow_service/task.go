package work_flow_service

import (
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_run_process"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

func DoTask(req *flowModel.CheckWfSaveReq) error {
	npid := req.Npid             //下一步骤流程id
	runId := req.RunId           //运行中的id
	runProcess := req.RunProcess //运行中的process
	if req.Sup == 1 {
		req.CheckCon = "[管理员代办]" + req.CheckCon
	}
	var runProcessList []*wf_run_process.Entity
	if req.WfMode == 2 {
		var err error
		runProcessList, err = wf_run_process.GetProcessByMap(g.Map{
			"run_id": req.RunId,
			"status": 0,
			"id <> ": req.RunProcess,
		})
		if err != nil {
			return err
		}
		if runProcessList != nil {
			npids := make([]uint, len(runProcessList))
			for k, v := range runProcessList {
				npids[k] = v.RunFlowProcess
			}
			npid = gstr.JoinAny(npids, ",")
		}
	}
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error()
		return gerror.New("开启事务失败")
	}
	if npid != "0" && npid != "" { //判断是否为最后一步
		//不是最后一步
		//结束流程
		err = EndProcess(runProcess, req.CheckCon, 2, tx)
		if err != nil {
			tx.Rollback()
			return err
		}
		//同步模式下只写入记录
		if req.WfMode != 2 { //非同步模式
			//更新单据信息
			err = Up(runId, npid, tx)
			if err != nil {
				tx.Rollback()
				return err
			}
			//记录下一个流程(消息记录)
			err = Run(req, "ok", tx)
			if err != nil {
				tx.Rollback()
				return err
			}
		} else {
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
			err = AddRunLog(gconv.Int64(req.RunId), fm, "ok", tx)
			if err != nil {
				tx.Rollback()
				return err
			}
		}
	} else {
		//是最后一步
		//结束流程
		err = EndFlow(runId, tx)
		if err != nil {
			tx.Rollback()
			return err
		}
		err = EndProcess(runProcess, req.CheckCon, 2, tx)
		if err != nil {
			tx.Rollback()
			return err
		}
		//删除审批表中的用户/部门信息
		err = DeleteBusinessChecker(req.WfFid, req.WfType, tx)
		if err != nil {
			tx.Rollback()
			return err
		}
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
		err = AddRunLog(gconv.Int64(runId), fm, "ok", tx)
		if err != nil {
			tx.Rollback()
			return err
		}
		//更新单据状态
		err = UpdateBill(gconv.Int(req.WfFid), req.WfType, req.WfStatusField, 2, tx)
		if err != nil {
			tx.Rollback()
			return err
		}
	}
	tx.Commit()
	return nil
}
