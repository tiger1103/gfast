package utils

import "github.com/mojocn/base64Captcha"

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
