package admin

import (
	"gfast/app/service/user"
	"gfast/library/response"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
	"github.com/mojocn/base64Captcha"
)

type Public struct{}

//Login 用户登陆验证
func (p *Public) Login(r *ghttp.Request) {
	data := r.GetPostMapStrStr()
	rules := map[string]string{
		"passport": "required",
		"password": "required",
	}
	msgs := map[string]interface{}{
		"passport": "账号不能为空",
		"password": "密码不能为空",
	}
	if e := gvalid.CheckMap(data, rules, msgs); e != nil {
		response.Json(r, 1, e.String())
	}
	if err := user.SignIn(data["passport"], data["password"], r.Session); err != nil {
		response.Json(r, 1, err.Error())
	} else {
		response.Json(r, 0, "ok")
	}
}

func (p *Public) Verify(r *ghttp.Request) {
	//字符,公式,验证码配置
	var configC = base64Captcha.ConfigCharacter{
		Height: 60,
		Width:  240,
		//const CaptchaModeNumber:数字,CaptchaModeAlphabet:字母,CaptchaModeArithmetic:算术,CaptchaModeNumberAlphabet:数字字母混合.
		Mode:               base64Captcha.CaptchaModeNumberAlphabet,
		ComplexOfNoiseText: base64Captcha.CaptchaComplexLower,
		ComplexOfNoiseDot:  base64Captcha.CaptchaComplexLower,
		IsShowHollowLine:   false,
		IsShowNoiseDot:     false,
		IsShowNoiseText:    false,
		IsShowSlimeLine:    false,
		IsShowSineLine:     true,
		CaptchaLen:         4,
	}
	//创建字符公式验证码.
	//GenerateCaptcha 第一个参数为空字符串,包会自动在服务器一个随机种子给你产生随机uiid.
	idKeyC, capC := base64Captcha.GenerateCaptcha("8nM77YhE2xOvU6GMQ33A", configC)
	//以base64编码
	base64stringC := base64Captcha.CaptchaWriteToBase64Encoding(capC)
	r.Response.Header().Set("Content-type", "text/html")
	r.Response.Write(idKeyC, "\n", "<img src=\""+base64stringC+"\">")
}

func (p *Public) CheckVerify(r *ghttp.Request) {
	data := r.GetQueryMapStrStr()
	if base64Captcha.VerifyCaptchaAndIsClear(data["key"], data["value"], false) {
		r.Response.Write("验证成功")
	} else {
		r.Response.Write("验证失败")
	}
}
