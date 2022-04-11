package system

import (
	"github.com/gogf/gf/v2/frame/g"
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
)

type UserLoginReq struct {
	g.Meta     `path:"/login" tags:"登录" method:"post" summary:"用户登录"`
	Username   string `p:"username" v:"required#用户名不能为空"`
	Password   string `p:"password" v:"required#密码不能为空"`
	VerifyCode string `p:"verifyCode" v:"required#验证码不能为空"`
	VerifyKey  string `p:"verifyKey"`
}

type UserLoginRes struct {
	g.Meta      `mime:"application/json"`
	UserInfo    *model.LoginUserRes `json:"userInfo"`
	Token       string              `json:"token"`
	MenuList    []*model.UserMenus  `json:"menuList"`
	Permissions []string            `json:"permissions"`
}

type UserMenusReq struct {
	g.Meta        `path:"/user/getUserMenus" tags:"登录" method:"get" summary:"获取用户菜单"`
	Authorization string `p:"Authorization" in:"header" dc:"Bearer {{token}}"`
}

type UserMenusRes struct {
	g.Meta      `mime:"application/json"`
	MenuList    []*model.UserMenus `json:"menuList"`
	Permissions []string           `json:"permissions"`
}

// UserSearchReq 用户搜索请求参数
type UserSearchReq struct {
	g.Meta   `path:"/user/list" tags:"用户管理" method:"get" summary:"用户列表"`
	DeptIds  []int64 //所属部门id数据
	Mobile   string  `p:"mobile"`
	Status   string  `p:"status"`
	KeyWords string  `p:"keyWords"`
	commonApi.PageReq
}

type UserSearchRes struct {
	g.Meta   `mime:"application/json"`
	UserList []*model.SysUserRoleDeptRes `json:"userList"`
	commonApi.ListRes
}
