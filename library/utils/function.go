package utils

import (
	"database/sql"
	"errors"
	"fmt"
	"gfast/app/model/user"
	"gfast/library/response"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/crypto/gaes"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/encoding/gbase64"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/grand"
	"github.com/gogf/gf/util/gvalid"
	"github.com/mojocn/base64Captcha"
)

const AdminCbcPublicKey = "HqmP1KLMuz09Q0Bu"

var (
	AdminMultiLogin      bool  //是否允许后台管理员多端登陆
	AdminPageNum         = 20  //后台分页长度
	NotCheckAuthAdminIds []int //无需验证权限的用户id
)

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
	idKeyC, capC = base64Captcha.GenerateCaptcha(grand.Str(20), configC)
	//以base64编码
	base64stringC = base64Captcha.CaptchaWriteToBase64Encoding(capC)
	return idKeyC, base64stringC
}

//AdminLogin 后台用户登陆验证
func AdminLogin(r *ghttp.Request) (string, interface{}) {
	data := r.GetFormMapStrStr()
	rules := map[string]string{
		"idValueC": "required",
		"username": "required",
		"password": "required",
	}
	msgs := map[string]interface{}{
		"idValueC": "请输入验证码",
		"username": "账号不能为空",
		"password": "密码不能为空",
	}
	if e := gvalid.CheckMap(data, rules, msgs); e != nil {
		response.JsonExit(r, response.ErrorCode, e.String())
	}
	//判断验证码是否正确
	/*if !base64Captcha.VerifyCaptchaAndIsClear(data["idKeyC"], data["idValueC"], true) {
		response.JsonExit(r, response.ErrorCode, "验证码输入错误")
	}*/
	password := EncryptCBC(data["password"], AdminCbcPublicKey)
	var keys string
	if AdminMultiLogin {
		keys = data["username"] + password + gmd5.MustEncryptString(r.GetClientIp())
	} else {
		keys = data["username"] + password
	}
	if err, user := signIn(data["username"], password, r); err != nil {
		response.JsonExit(r, response.ErrorCode, err.Error())
	} else {
		return keys, user
	}
	return keys, nil
}

//gtoken验证后返回
func AuthAfterFunc(r *ghttp.Request, respData gtoken.Resp) {
	if r.Method == "OPTIONS" || respData.Success() {
		r.Middleware.Next()
	} else {
		params := r.GetRequestMap()
		no := gtime.TimestampMilliStr()
		g.Log().Info(fmt.Sprintf("[AUTH_%s][url:%s][params:%s][data:%s]",
			no, r.URL.Path, params, respData.Json()))
		respData.Msg = "用户信息验证失败"
		response := r.Response
		options := response.DefaultCORSOptions()
		response.CORS(options)
		response.WriteJson(respData)
		r.ExitAll()
	}
}

//后台退出登陆
func AdminLoginOut(r *ghttp.Request) bool {
	return true
}

//字符串加密
func EncryptCBC(plainText, publicKey string) string {
	key := []byte(publicKey)
	b, e := gaes.EncryptCBC([]byte(plainText), key, key)
	if e != nil {
		g.Log().Error(e.Error())
		return ""
	}
	return gbase64.EncodeToString(b)
}

//字符串解密
func DecryptCBC(plainText, publicKey string) string {
	key := []byte(publicKey)
	plainTextByte, e := gbase64.DecodeString(plainText)
	if e != nil {
		g.Log().Error(e.Error())
		return ""
	}
	b, e := gaes.DecryptCBC(plainTextByte, key, key)
	if e != nil {
		g.Log().Error(e.Error())
		return ""
	}
	return gbase64.EncodeToString(b)
}

// 用户登录，成功返回用户信息，否则返回nil
func signIn(username, password string, r *ghttp.Request) (error, *user.QxkjUser) {
	qxkjUser, err := user.Model.Where("user_name=? and user_password=?", username, password).One()
	if err != nil && err != sql.ErrNoRows {
		return err, nil
	}
	if qxkjUser == nil {
		return errors.New("账号或密码错误"), nil
	}
	returnData := *qxkjUser
	//更新登陆时间及ip
	qxkjUser.LastLoginTime = gconv.Int(gtime.Timestamp())
	qxkjUser.LastLoginIp = r.GetClientIp()
	qxkjUser.Update()
	return nil, &returnData
}
