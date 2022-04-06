/*
* @desc:登录日志处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/8 11:42
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/os/grpool"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
)

type ISysLoginLog interface {
	Invoke(ctx context.Context, data *model.LoginLogParams)
}

type sysLoginLogImpl struct {
	Pool *grpool.Pool
}

var (
	sysLoginLogService = sysLoginLogImpl{
		Pool: grpool.New(100),
	}
)

func SysLoginLog() ISysLoginLog {
	return ISysLoginLog(&sysLoginLogService)
}

func (s *sysLoginLogImpl) Invoke(ctx context.Context, data *model.LoginLogParams) {
	s.Pool.Add(
		ctx,
		func(ctx context.Context) {
			//写入日志数据
			User().LoginLog(ctx, data)
		},
	)
}
