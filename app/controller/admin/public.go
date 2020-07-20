package admin

import (
	"gfast/library/response"
	"gfast/library/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type Public struct{}

// @Summary 获取验证码图片信息
// @Description 获取验证码图片信息
// @Tags 公共
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/public/verify [post]
// @Security
func (p *Public) Verify(r *ghttp.Request) {
	idKeyC, base64stringC := service.GetVerifyImgString()
	response.SusJson(true, r, "ok", g.MapStrStr{"idKeyC": idKeyC, "base64stringC": base64stringC})
}
