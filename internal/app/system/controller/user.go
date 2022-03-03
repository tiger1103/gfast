package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/apiv1/system"
)

var (
	User = cUser{}
)

type cUser struct{}

func (h *cUser) Login(ctx context.Context, req *system.UserLoginReq) (res *system.UserLoginRes, err error) {
	return
}
