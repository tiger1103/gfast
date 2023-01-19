/*
* @desc:登录日志
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/26 15:20
 */

package sysLoginLog

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/grpool"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

func init() {
	service.RegisterSysLoginLog(New())
}

func New() *sSysLoginLog {
	return &sSysLoginLog{
		Pool: grpool.New(100),
	}
}

type sSysLoginLog struct {
	Pool *grpool.Pool
}

func (s *sSysLoginLog) Invoke(ctx context.Context, data *model.LoginLogParams) {
	s.Pool.Add(
		ctx,
		func(ctx context.Context) {
			//写入日志数据
			service.SysUser().LoginLog(ctx, data)
		},
	)
}

func (s *sSysLoginLog) List(ctx context.Context, req *system.LoginLogSearchReq) (res *system.LoginLogSearchRes, err error) {
	res = new(system.LoginLogSearchRes)
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	res.CurrentPage = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = consts.PageSize
	}
	m := dao.SysLoginLog.Ctx(ctx)
	order := "info_id DESC"
	if req.LoginName != "" {
		m = m.Where("login_name like ?", "%"+req.LoginName+"%")
	}
	if req.Status != "" {
		m = m.Where("status", gconv.Int(req.Status))
	}
	if req.Ipaddr != "" {
		m = m.Where("ipaddr like ?", "%"+req.Ipaddr+"%")
	}
	if req.LoginLocation != "" {
		m = m.Where("login_location like ?", "%"+req.LoginLocation+"%")
	}
	if len(req.DateRange) != 0 {
		m = m.Where("login_time >=? AND login_time <=?", req.DateRange[0], req.DateRange[1])
	}
	if req.SortName != "" {
		if req.SortOrder != "" {
			order = req.SortName + " " + req.SortOrder
		} else {
			order = req.SortName + " DESC"
		}
	}
	err = g.Try(ctx, func(ctx context.Context) {
		res.Total, err = m.Count()
		liberr.ErrIsNil(ctx, err, "获取日志失败")
		err = m.Page(req.PageNum, req.PageSize).Order(order).Scan(&res.List)
		liberr.ErrIsNil(ctx, err, "获取日志数据失败")
	})
	return
}

func (s *sSysLoginLog) DeleteLoginLogByIds(ctx context.Context, ids []int) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SysLoginLog.Ctx(ctx).Delete("info_id in (?)", ids)
		liberr.ErrIsNil(ctx, err, "删除失败")
	})
	return
}

func (s *sSysLoginLog) ClearLoginLog(ctx context.Context) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = g.DB().Ctx(ctx).Exec(ctx, "truncate "+dao.SysLoginLog.Table())
		liberr.ErrIsNil(ctx, err, "清除失败")
	})
	return
}
