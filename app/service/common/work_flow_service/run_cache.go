package work_flow_service

import (
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/model/admin/wf_run_cache"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

func AddWorkflowCache(runId int64, flowInfo *flowModel.Entity, process *wf_flow_process.Entity, wfFid int, tx *gdb.TX) error {
	data := &wf_run_cache.AddData{
		RunId:          gconv.Uint(runId),
		FormId:         gconv.Uint(wfFid),
		FlowId:         flowInfo.Id,
		RunForm:        "",
		RunFlow:        gconv.String(flowInfo),
		RunFlowProcess: gconv.String(process),
		Dateline:       gconv.Uint(gtime.Timestamp()),
	}
	return wf_run_cache.Add(data, tx)
}
