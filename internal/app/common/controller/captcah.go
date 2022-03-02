/*
* @desc:验证码获取
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 17:45
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/apiv1/common"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
)

var Captcha = cCaptcha{}

type cCaptcha struct {
}

// Get 获取验证码
func (c *cCaptcha) Get(ctx context.Context, req *common.CaptchaReq) (res *common.CaptchaRes, err error) {
	idKeyC, base64stringC := service.Captcha.GetVerifyImgString(ctx)
	res = &common.CaptchaRes{
		Key: idKeyC,
		Img: base64stringC,
	}
	return
}
