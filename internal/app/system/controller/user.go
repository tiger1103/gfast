package controller

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/os/genv"
	"github.com/tiger1103/gfast/v3/apiv1/system"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var (
	User = UserController{}
)

type UserController struct {
	baseController
}

func (c *UserController) Login(ctx context.Context, req *system.UserLoginReq) (res *system.UserLoginRes, err error) {
	//判断验证码是否正确
	debug := genv.GetWithCmd("gf.debug")
	if debug.Int() != 1 {
		if !commonService.Captcha().VerifyString(req.VerifyKey, req.VerifyCode) {
			err = gerror.New("验证码输入错误")
			return
		}
	}
	//ip := libUtils.GetClientIp(ctx)
	//userAgent := libUtils.GetUserAgent(ctx)
	service.User().GetAdminUserByUsernamePassword(ctx, req)
	return
}
