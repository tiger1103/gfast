package utils

import (
	"gfast/app/service/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/crypto/gaes"
	"github.com/gogf/gf/encoding/gbase64"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gvalid"
	"github.com/mojocn/base64Captcha"
)

const AESPublicKey = "HqmP1KLMuz09Q0Bu"

//获取验证码
func GetVerifyImg() (idKeyC string, base64stringC string) {
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
	var capC base64Captcha.CaptchaInterface
	idKeyC, capC = base64Captcha.GenerateCaptcha("8nM77YhE2xOvU6GMQ33A", configC)
	//以base64编码
	base64stringC = base64Captcha.CaptchaWriteToBase64Encoding(capC)
	return idKeyC, base64stringC
}

//AdminLogin 后台用户登陆验证
func AdminLogin(r *ghttp.Request) (string, interface{}) {
	data := r.GetPostMapStrStr()
	//判断验证码是否正确
	/*if !base64Captcha.VerifyCaptchaAndIsClear(data["idKeyC"], data["idValueC"], true) {
		response.JsonExit(r, response.ErrorCode, "验证码输入错误")
	}*/
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
	if err, user := user_service.SignIn(data["username"], EncryptCBC(data["password"]), r.Session); err != nil {
		response.JsonExit(r, response.NotAcceptableCode, err.Error())
	} else {
		return data["username"], user
	}
	return data["username"], nil
}

//后台退出登陆
func AdminLoginOut(r *ghttp.Request) bool {
	return true
}

//字符串加密
func EncryptCBC(plainText string) string {
	key := []byte(AESPublicKey)
	b, e := gaes.EncryptCBC([]byte(plainText), key, key)
	if e != nil {
		glog.Error(e.Error())
		return ""
	}
	return gbase64.EncodeToString(b)
}
