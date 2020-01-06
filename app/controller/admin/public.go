package admin

import (
	"gfast/app/service/user_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
	"github.com/mojocn/base64Captcha"
)

type Public struct{}

//Login 用户登陆验证
func (p *Public) Login(r *ghttp.Request) {
	data := r.GetPostMapStrStr()
	//判断验证码是否正确
	if !base64Captcha.VerifyCaptchaAndIsClear(data["idKeyC"], data["idValueC"], true) {
		response.JsonExit(r, response.ErrorCode, "验证失败")
	}
	rules := map[string]string{
		"username": "required",
		"password": "required",
	}
	msgs := map[string]interface{}{
		"username": "账号不能为空",
		"password": "密码不能为空",
	}
	if e := gvalid.CheckMap(data, rules, msgs); e != nil {
		response.JsonExit(r, response.ErrorCode, e.String())
	}
	if err := user_service.SignIn(data["username"], data["password"], r.Session); err != nil {
		response.RJson(r, response.NotAcceptableCode, err.Error())
	} else {
		response.SusJson(false, r, "ok")
	}
}

func (p *Public) Verify(r *ghttp.Request) {
	idKeyC, base64stringC := utils.GetVerifyImg()
	response.RJson(r, 200, "ok", g.MapStrStr{"idKeyC": idKeyC, "base64stringC": base64stringC})
}
