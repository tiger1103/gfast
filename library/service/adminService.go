package service

import (
	"gfast/library/utils"

	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

var (
	AdminMultiLogin      bool   //是否允许后台管理员多端登陆
	AdminPageNum         = 20   //后台分页长度
	NotCheckAuthAdminIds []int  //无需验证权限的用户id
	AdminEncryptKey      string //后台数据加密密钥
) //AdminLogin 后台用户登陆验证
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
		r.Response.WriteJsonExit(gtoken.Fail(e.String()))
	}
	//判断验证码是否正确
	if !VerifyString(data["idKeyC"], data["idValueC"]) {
		r.Response.WriteJsonExit(gtoken.Fail("验证码输入错误"))
	}
	password := EncryptData(data["password"])
	var keys string
	if AdminMultiLogin {
		keys = gmd5.MustEncryptString(data["username"]) + gmd5.MustEncryptString(password+utils.GetClientIp(r))
	} else {
		keys = gmd5.MustEncryptString(data["username"]) + gmd5.MustEncryptString(password)
	}
	ip := utils.GetClientIp(r)
	userAgent := r.Header.Get("User-Agent")
	if err, user := signIn(data["username"], password, r); err != nil {
		go loginLog(0, data["username"], ip, userAgent, err.Error(), "系统后台")
		r.Response.WriteJsonExit(gtoken.Fail(err.Error()))
	} else {
		//判断是否后台用户
		if user.IsAdmin != 1 {
			r.Response.WriteJsonExit(gtoken.Fail("抱歉!此用户不属于后台管理员!"))
		}
		r.SetParam("userInfo", user)
		go loginLog(1, data["username"], ip, userAgent, "登录成功", "系统后台")
		return keys, user
	}
	return keys, nil
}

// EncryptData 数据加密方法
func EncryptData(plainText string) string {
	return utils.EncryptCBC(plainText, AdminEncryptKey)
}

// DecryptData 数据解密方法
func DecryptData(plainText string) string {
	return utils.DecryptCBC(plainText, AdminEncryptKey)
}
