package monitor_service

import (
	"gfast/app/model/admin/auth_rule"
	"gfast/app/model/admin/sys_oper_log"
	"gfast/app/model/admin/user"
	"github.com/gogf/gf/frame/g"
	"net/url"
)

//新增操作日志记录
func OperationLogAdd(user *user.Entity, menu *auth_rule.Entity, url *url.URL,
	param g.Map, method, clientIp string) {
	sys_oper_log.Add(user, menu, url, param, method, clientIp)
}

//操作日志列表
func OperationLogListByPage(req *sys_oper_log.SelectPageReq) (total, page int, list []*sys_oper_log.Entity, err error) {
	return sys_oper_log.ListByPage(req)
}

//通过id获取操作日志
func GetOperationLogById(id int64) (log *sys_oper_log.Entity, err error) {
	return sys_oper_log.GetById(id)
}

//批量删除
func DeleteOperationLogByIds(ids []int) (err error) {
	return sys_oper_log.DeleteByIds(ids)
}

//清空
func ClearOperationLog() (err error) {
	return sys_oper_log.ClearLog()
}
