package service

import (
	"context"
	"gfast/app/system/dao"
	"github.com/gogf/gf/net/ghttp"
)

// Context 上下文管理服务
var Context = new(contextService)

type contextService struct{}

// Init 初始化上下文对象指针到上下文对象中，以便后续的请求流程中可以修改。
func (s *contextService) Init(r *ghttp.Request, customCtx *dao.Context) {
	r.SetCtxVar(dao.CtxKey, customCtx)
}

// Get 获得上下文变量，如果没有设置，那么返回nil
func (s *contextService) Get(ctx context.Context) *dao.Context {
	value := ctx.Value(dao.CtxKey)
	if value == nil {
		return nil
	}
	if localCtx, ok := value.(*dao.Context); ok {
		return localCtx
	}
	return nil
}

// SetUser 将上下文信息设置到上下文请求中，注意是完整覆盖
func (s *contextService) SetUser(ctx context.Context, ctxUser *dao.CtxUser) {
	s.Get(ctx).User = ctxUser
}
