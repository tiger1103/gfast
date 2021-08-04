package dao

import (
	"gfast/app/system/model"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

const (
	// CtxKey 上下文变量存储键名，前后端系统共享
	CtxKey = "GFastContext"
)

// Context 请求上下文结构
type Context struct {
	Session *ghttp.Session // 当前Session管理对象
	User    *CtxUser       // 上下文用户信息
	Data    g.Map          // 自定KV变量，业务模块根据需要设置，不固定
}

// CtxUser 请求上下文中的用户信息
type CtxUser struct {
	Id           uint64 `json:"id"`           // 用户id
	UserName     string `json:"userName"`     // 用户名
	DeptId       uint64 `json:"deptId"`       // 部门id
	UserNickname string `json:"userNickname"` // 用户昵称
	UserStatus   uint   `json:"userStatus"`   // 用户状态;0:禁用,1:正常,2:未验证
	IsAdmin      int    `json:"isAdmin"`      // 是否后台管理员 1 是  0   否
	Avatar       string `json:"avatar"`       //头像
}

// GetUserId 获取登录用户id
func (ctxUser *CtxUser) GetUserId() (id uint64) {
	return ctxUser.Id
}

// GetDept 获取登录用户所属部门
func (ctxUser *CtxUser) GetDept() (err error, dept *model.SysDept) {
	err = g.DB().Model(SysDept.Table).Fields(SysDept.C.DeptId, SysDept.C.DeptName).WherePri(ctxUser.DeptId).Scan(&dept)
	if dept == nil {
		dept = &model.SysDept{}
	}
	return
}
