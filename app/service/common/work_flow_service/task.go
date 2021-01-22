package work_flow_service

import (
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/model/admin/wf_run_process"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

func DoTask(req *flowModel.CheckWfSaveReq) error {
	nPid := req.Npid             //下一步骤流程id
	runId := req.RunId           //运行中的id
	runProcess := req.RunProcess //运行中的process
	isAddNextMode2 := true       //同步模式是否添加下一步节点
	if req.Sup == 1 {
		req.CheckCon = "[管理员代办]" + req.CheckCon
	}
	runProcessList := ([]*wf_run_process.Entity)(nil)
	if req.WfMode == 2 {
		var err error
		//获取当前流程运行信息
		thisProcess := (*wf_run_process.Entity)(nil)
		thisProcess, err = wf_run_process.GetProcessById(runProcess)
		if err != nil {
			return err
		}
		//获取当前审批分支的所有下级节点
		thisNpidSAll := make([]uint, 0, 100)
		thisNpidSAll, err = GetAllNextProcessIds(thisProcess.RunFlowProcess)
		//获取其他同步的步骤信息
		runProcessList, err = wf_run_process.GetProcessByMap(g.Map{
			"run_id": req.RunId,
			"status": 0,
			"id <> ": req.RunProcess,
		})
		if err != nil {
			return err
		}
		if runProcessList != nil {
			nPidS := make([]uint, len(runProcessList))
			for k, v := range runProcessList {
				//查询每个分支的所有下级节点
				nPidS[k] = v.RunFlowProcess
			}
			//查询对应的流程步骤信息判断他们的下一步是否是同一个节点（分支合并）
			processes := ([]*wf_flow_process.Entity)(nil) //和当前步骤同步模式下的其他分支步骤
			processes, err = wf_flow_process.GetProcessInfosByIds(nPidS)
			if err != nil {
				return err
			}

			for _, v := range processes {
				hasLinkNode := false             //是否在分支上还有下一级节点,并且下个节点在分支内
				nPidSAll := make([]uint, 0, 100) //每个分支的所有下级节点
				nPidSAll, err = GetAllNextProcessIds(gconv.Uint(v.Id))
				if err != nil {
					return err
				}
				tagLink := true
				for _, nv := range nPidSAll {
					tag := false
					for _, tv := range thisNpidSAll {
						if tv == nv {
							tag = true
							break
						}
					}
					if !tag {
						tagLink = false
					} else {
						tagLink = true
					}
				}
				if nPid != v.ProcessTo && tagLink {
					hasLinkNode = true
					break
				}
				isAddNextMode2 = isAddNextMode2 && hasLinkNode
			}
			nPid = gstr.JoinAny(nPidS, ",")
		}
	}
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error()
		return gerror.New("开启事务失败")
	}
	if nPid != "0" && nPid != "" { //判断是否为最后一步
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
			err = Up(runId, nPid, tx)
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
			if isAddNextMode2 {
				//更新单据信息
				if nPid == "" {
					nPid = req.Npid
				} else {
					nPid = nPid + "," + req.Npid
				}
				g.Log().Debug(nPid)
				err = Up(runId, nPid, tx)
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
