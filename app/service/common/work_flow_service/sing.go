package work_flow_service

import (
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_run_sign"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
)

//会签操作
func DoSing(req *flowModel.CheckWfSaveReq) error {
	return gerror.New(msgNoAction)
}

//再会签,会签提交，会签回退 操作
func DoSingEnt(req *flowModel.CheckWfSaveReq) error {
	return gerror.New(msgNoAction)
}

func EndSing(id int, con string, tx *gdb.TX) error {
	return wf_run_sign.UpdateSing(id, g.Map{
		"is_agree": 1,
		"content":  con,
		"dateline": gtime.Timestamp(),
	}, tx)
}

func AddSing(req *flowModel.CheckWfSaveReq, tx *gdb.TX) (int64, error) {
	data := g.Map{
		"run_id":           req.RunId,
		"run_flow":         req.FlowId,
		"run_flow_process": req.RunProcess,
		"uid":              req.WfSingFlow,
		"dateline":         gtime.Timestamp(),
	}
	return wf_run_sign.AddSing(data, tx)
}
