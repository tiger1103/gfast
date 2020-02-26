package admin

import (
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type Public struct{}

//获取验证码图片信息
func (p *Public) Verify(r *ghttp.Request) {
	idKeyC, base64stringC := utils.GetVerifyImgString()
	response.SusJson(true, r, "ok", g.MapStrStr{"idKeyC": idKeyC, "base64stringC": base64stringC})
}
