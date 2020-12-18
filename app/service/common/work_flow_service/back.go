package work_flow_service

import (
	flowModel "gfast/app/model/admin/wf_flow"
	"github.com/gogf/gf/errors/gerror"
)

func DoBack(req *flowModel.CheckWfSaveReq) error {
	return gerror.New(msgNoAction)
}
