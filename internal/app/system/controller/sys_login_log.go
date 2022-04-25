/*
* @desc:登录日志管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/4/24 22:14
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var LoginLog = loginLogController{}

type loginLogController struct {
	BaseController
}

func (c *loginLogController) List(ctx context.Context, req *system.LoginLogSearchReq) (res *system.LoginLogSearchRes, err error) {
	res, err = service.SysLoginLog().List(ctx, req)
	return
}

func (c *loginLogController) Delete(ctx context.Context, req *system.LoginLogDelReq) (res *system.LoginLogDelRes, err error) {
	err = service.SysLoginLog().DeleteLoginLogByIds(ctx, req.Ids)
	return
}

func (c *loginLogController) Clear(ctx context.Context, req *system.LoginLogClearReq) (res *system.LoginLogClearRes, err error) {
	err = service.SysLoginLog().ClearLoginLog(ctx)
	return
}
