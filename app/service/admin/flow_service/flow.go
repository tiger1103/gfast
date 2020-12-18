// ==========================================================================
// 生成日期：2020-08-24 17:13:46
// 生成人：gfast
// ==========================================================================
package flow_service

import (
	flowModel "gfast/app/model/admin/wf_flow"
	"gfast/app/model/admin/wf_run"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

// 添加
func AddSave(req *flowModel.AddReq) error {
	return flowModel.AddSave(req)
}

// 删除
func DeleteByIds(Ids []int) error {
	return flowModel.DeleteByIds(Ids)
}

func SetStatus(req *flowModel.StatusReq) error {
	return flowModel.SetStatus(req)
}

//修改
func EditSave(editReq *flowModel.EditReq) error {
	return flowModel.EditSave(editReq)
}

// 根据ID查询
func GetByID(id int64) (*flowModel.Entity, error) {
	return flowModel.GetByID(id)
}

// 分页查询
func SelectListByPage(req *flowModel.SelectPageReq) (total int, page int64, list []*flowModel.Entity, err error) {
	return flowModel.SelectListByPage(req)
}

func GetRunningStatus(flowList []*flowModel.Entity) (g.List, error) {
	//获取流程Id
	flowIds := make([]uint, len(flowList))
	for k, v := range flowList {
		flowIds[k] = v.Id
	}
	runs, err := wf_run.GetRuns("flow_id in(?) and status = ?", flowIds, 0)
	if err != nil {
		return nil, err
	}
	rdata := make(g.List, len(flowList))
	for k, v := range flowList {
		rdata[k] = gconv.Map(v)
		for _, run := range runs {
			if run.FlowId == v.Id {
				rdata[k]["running"] = true
				break
			}
		}
	}
	return rdata, nil
}
