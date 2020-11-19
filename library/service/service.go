package service

import (
	"database/sql"
	"errors"
	"gfast/app/model/admin/sys_login_log"
	"gfast/app/model/admin/user"
	"gfast/app/model/admin/user_online"
	"gfast/library/utils"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"github.com/mojocn/base64Captcha"
	"github.com/mssola/user_agent"
	"strings"
)

//版本号
const Version = "1.1.03"

//获取数字验证码
func GetVerifyImgDigit() (idKeyC string, base64stringC string) {
	driver := &base64Captcha.DriverDigit{80, 240, 5, 0.7, 5}
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	idKeyC, base64stringC, err := c.Generate()
	if err != nil {
		g.Log().Error(err)
	}
	return
}

//获取字母数字混合验证码
func GetVerifyImgString() (idKeyC string, base64stringC string) {
	driver := &base64Captcha.DriverString{
		Height:          80,
		Width:           240,
		NoiseCount:      50,
		ShowLineOptions: 20,
		Length:          4,
		Source:          "abcdefghjkmnpqrstuvwxyz23456789",
		Fonts:           []string{"chromohv.ttf"},
	}
	driver = driver.ConvertFonts()
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	idKeyC, base64stringC, err := c.Generate()
	if err != nil {
		g.Log().Error(err)
	}
	return
}

//验证输入的验证码是否正确
func VerifyString(id, answer string) bool {
	driver := new(base64Captcha.DriverString)
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	answer = gstr.ToLower(answer)
	return c.Verify(id, answer, true)
}

// 登录返回方法
func LoginAfter(r *ghttp.Request, respData gtoken.Resp) {
	if !respData.Success() {
		r.Response.WriteJson(respData)
	} else {
		token := respData.GetString("token")
		uuid := respData.GetString("uuid")
		var userInfo *user.Entity
		r.GetParamVar("userInfo").Struct(&userInfo)
		//保存用户在线状态token到数据库
		userAgent := r.Header.Get("User-Agent")
		ua := user_agent.New(userAgent)
		os := ua.OS()
		explorer, _ := ua.Browser()
		entity := user_online.Entity{
			Uuid:       uuid,
			Token:      token,
			CreateTime: gconv.Uint64(gtime.Timestamp()),
			UserName:   userInfo.UserName,
			Ip:         utils.GetClientIp(r),
			Explorer:   explorer,
			Os:         os,
		}
		user_online.Model.Save(entity)
		r.Response.WriteJson(gtoken.Succ(g.Map{
			"token": token,
		}))
	}
}

//gtoken验证后返回
func AuthAfterFunc(r *ghttp.Request, respData gtoken.Resp) {
	if r.Method == "OPTIONS" || respData.Success() {
		r.Middleware.Next()
	} else {
		respData.Msg = "用户信息验证失败"
		response := r.Response
		options := response.DefaultCORSOptions()
		response.CORS(options)
		response.WriteJson(respData)
		r.ExitAll()
	}
}

//后台退出登陆
func LoginOut(r *ghttp.Request) bool {
	//删除在线用户状态
	authHeader := r.Header.Get("Authorization")
	if authHeader != "" {
		parts := strings.SplitN(authHeader, " ", 2)
		if len(parts) == 2 && parts[0] == "Bearer" && parts[1] != "" {
			//删除在线用户状态操作
			user_online.Model.Delete("token", parts[1])
		}
	}
	authHeader = r.GetString("token")
	if authHeader != "" {
		//删除在线用户状态操作
		user_online.Model.Delete("token", authHeader)
	}
	return true
}

// 用户登录，成功返回用户信息，否则返回nil
func signIn(username, password string, r *ghttp.Request) (error, *user.Entity) {
	userInfo, err := user.Model.Where("user_name=? and user_password=?", username, password).One()
	if err != nil && err != sql.ErrNoRows {
		return err, nil
	}
	if userInfo == nil {
		return errors.New("账号或密码错误"), nil
	}
	//判断用户状态
	if userInfo.UserStatus == 0 {
		return errors.New("用户已被冻结"), nil
	}
	returnData := *userInfo
	//更新登陆时间及ip
	userInfo.LastLoginTime = gconv.Int(gtime.Timestamp())
	userInfo.LastLoginIp = utils.GetClientIp(r)
	user.Model.Save(userInfo)
	return nil, &returnData
}

//登录日志记录
func loginLog(status int, username, ip, userAgent, msg, module string) {
	var log sys_login_log.Entity
	log.LoginName = username
	log.Ipaddr = ip
	log.LoginLocation = utils.GetCityByIp(log.Ipaddr)
	ua := user_agent.New(userAgent)
	log.Browser, _ = ua.Browser()
	log.Os = ua.OS()
	log.Status = status
	log.Msg = msg
	log.LoginTime = gtime.Timestamp()
	log.Module = module
	sys_login_log.Model.Save(log)
}
