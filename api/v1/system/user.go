package system

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
)

type UserLoginReq struct {
	g.Meta     `path:"/login" tags:"login" method:"post" summary:"用户登录"`
	Username   string `p:"username" v:"required#用户名不能为空"`
	Password   string `p:"password" v:"required#密码不能为空"`
	VerifyCode string `p:"verifyCode" v:"required#验证码不能为空"`
	VerifyKey  string `p:"verifyKey"`
}
type UserLoginRes struct {
	g.Meta   `mime:"application/json" example:""`
	UserInfo *model.LoginUserRes `json:"userInfo"`
	Token    string              `json:"token"`
	MenuList []*model.UserMenus  `json:"menuList"`
}
