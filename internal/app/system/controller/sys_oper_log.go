/*
* @desc:系统后台操作日志
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/21 16:10
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var OperLog = new(operateLogController)

type operateLogController struct {
	BaseController
}

// List 列表
func (c *operateLogController) List(ctx context.Context, req *system.SysOperLogSearchReq) (res *system.SysOperLogSearchRes, err error) {
	res, err = service.OperateLog().List(ctx, req)
	return
}

// Get 获取操作日志
func (c *operateLogController) Get(ctx context.Context, req *system.SysOperLogGetReq) (res *system.SysOperLogGetRes, err error) {
	res = new(system.SysOperLogGetRes)
	res.SysOperLogInfoRes, err = service.OperateLog().GetByOperId(ctx, req.OperId)
	return
}

func (c *operateLogController) Delete(ctx context.Context, req *system.SysOperLogDeleteReq) (res *system.SysOperLogDeleteRes, err error) {
	err = service.OperateLog().DeleteByIds(ctx, req.OperIds)
	return
}

func (c *operateLogController) Clear(ctx context.Context, req *system.SysOperLogClearReq) (res *system.SysOperLogClearRes, err error) {
	err = service.OperateLog().ClearLog(ctx)
	return
}
