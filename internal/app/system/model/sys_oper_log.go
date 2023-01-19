/*
* @desc:操作日志模型对象
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/21 16:34
 */

package model

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gmeta"
	"net/url"
)

// SysOperLogAdd 添加操作日志参数
type SysOperLogAdd struct {
	User         *ContextUser
	Menu         *SysAuthRuleInfoRes
	Url          *url.URL
	Params       g.Map
	Method       string
	ClientIp     string
	OperatorType int
}

// SysOperLogInfoRes is the golang structure for table sys_oper_log.
type SysOperLogInfoRes struct {
	gmeta.Meta     `orm:"table:sys_oper_log"`
	OperId         uint64                   `orm:"oper_id,primary" json:"operId"`       // 日志编号
	Title          string                   `orm:"title" json:"title"`                  // 系统模块
	BusinessType   int                      `orm:"business_type" json:"businessType"`   // 操作类型
	Method         string                   `orm:"method" json:"method"`                // 操作方法
	RequestMethod  string                   `orm:"request_method" json:"requestMethod"` // 请求方式
	OperatorType   int                      `orm:"operator_type" json:"operatorType"`   // 操作类别
	OperName       string                   `orm:"oper_name" json:"operName"`           // 操作人员
	DeptName       string                   `orm:"dept_name" json:"deptName"`           // 部门名称
	LinkedDeptName *LinkedSysOperLogSysDept `orm:"with:dept_id=dept_name" json:"linkedDeptName"`
	OperUrl        string                   `orm:"oper_url" json:"operUrl"`           // 请求URL
	OperIp         string                   `orm:"oper_ip" json:"operIp"`             // 主机地址
	OperLocation   string                   `orm:"oper_location" json:"operLocation"` // 操作地点
	OperParam      string                   `orm:"oper_param" json:"operParam"`       // 请求参数
	ErrorMsg       string                   `orm:"error_msg" json:"errorMsg"`         // 错误消息
	OperTime       *gtime.Time              `orm:"oper_time" json:"operTime"`         // 操作时间
}

type LinkedSysOperLogSysDept struct {
	gmeta.Meta `orm:"table:sys_dept"`
	DeptId     int64  `orm:"dept_id" json:"deptId"`     // 部门id
	DeptName   string `orm:"dept_name" json:"deptName"` // 部门名称
}

type SysOperLogListRes struct {
	OperId         uint64                   `json:"operId"`
	Title          string                   `json:"title"`
	RequestMethod  string                   `json:"requestMethod"`
	OperName       string                   `json:"operName"`
	DeptName       string                   `json:"deptName"`
	LinkedDeptName *LinkedSysOperLogSysDept `orm:"with:dept_id=dept_name" json:"linkedDeptName"`
	OperUrl        string                   `json:"operUrl"`
	OperIp         string                   `json:"operIp"`
	OperLocation   string                   `json:"operLocation"`
	OperParam      string                   `json:"operParam"`
	OperTime       *gtime.Time              `json:"operTime"`
}
