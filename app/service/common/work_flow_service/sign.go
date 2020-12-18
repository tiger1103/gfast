package work_flow_service

import "gfast/app/model/admin/wf_run_sign"

func GetSignInfoById(id uint) (sign *wf_run_sign.Entity, err error) {
	return wf_run_sign.GetSignInfoById(id)
}
