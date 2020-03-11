package monitor_service

import (
	"gfast/app/model/admin/sys_login_log"
	"gfast/library/service"
)

func LoginLogListByPage(req *sys_login_log.SelectPageReq) (total, page int, list []*sys_login_log.Entity, err error) {
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}
	return sys_login_log.LoginLogListByPage(req)
}

//删除登录日志
func DeleteLoginLogByIds(ids []int) (err error) {
	return sys_login_log.DeleteLoginLogByIds(ids)
}

//清空日志
func ClearLoginLog() (err error) {
	return sys_login_log.ClearLoginLog()
}
