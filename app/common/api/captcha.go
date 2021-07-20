package api

import (
	"gfast/app/common/service"
	"gfast/library"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type captcha struct{}

var Captcha = new(captcha)

// Img
// @Summary 获取验证码图片信息
// @Description 获取验证码图片信息
// @Tags 公共
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/public/verify [post]
// @Security
func (c *captcha) Img(r *ghttp.Request) {
	idKeyC, base64stringC := service.Captcha.GetVerifyImgString()
	library.SusJson(true, r, "ok", g.MapStrStr{"idKeyC": idKeyC, "base64stringC": base64stringC})
}
