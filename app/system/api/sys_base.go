package api

import (
	"context"
	"gfast/app/common/api"
	"gfast/app/system/dao"
	"gfast/app/system/service"
)

type systemBase struct {
	api.CommonBase
}

// GetCurrentUser 获取当前登陆用户信息
func (c *systemBase) GetCurrentUser(ctx context.Context) *dao.CtxUser {
	context := service.Context.Get(ctx)
	return context.User
}
