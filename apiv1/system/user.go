package system

import (
	"github.com/gogf/gf/v2/frame/g"
)

type UserLoginReq struct {
	g.Meta     `path:"/hello" tags:"Hello" method:"get" summary:"You first hello api"`
	Username   string `p:"username" v:"required#用户名不能为空"`
	Password   string `p:"password" v:"required#密码不能为空"`
	VerifyCode string `p:"verifyCode" v:"required#验证码不能为空"`
	VerifyKey  string `p:"verifyKey"`
}
type UserLoginRes struct {
	g.Meta `mime:"text/html" example:"string"`
	Data   g.Map `json:"data"`
}
