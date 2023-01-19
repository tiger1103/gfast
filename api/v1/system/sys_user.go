package system

import (
	"github.com/gogf/gf/v2/frame/g"
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
)

type UserMenusReq struct {
	g.Meta `path:"/user/getUserMenus" tags:"用户管理" method:"get" summary:"获取用户菜单"`
	commonApi.Author
}

type UserMenusRes struct {
	g.Meta      `mime:"application/json"`
	MenuList    []*model.UserMenus `json:"menuList"`
	Permissions []string           `json:"permissions"`
}

// UserSearchReq 用户搜索请求参数
type UserSearchReq struct {
	g.Meta   `path:"/user/list" tags:"用户管理" method:"get" summary:"用户列表"`
	DeptId   string `p:"deptId"` //部门id
	Mobile   string `p:"mobile"`
	Status   string `p:"status"`
	KeyWords string `p:"keyWords"`
	commonApi.PageReq
	commonApi.Author
}

type UserSearchRes struct {
	g.Meta   `mime:"application/json"`
	UserList []*model.SysUserRoleDeptRes `json:"userList"`
	commonApi.ListRes
}

type UserGetParamsReq struct {
	g.Meta `path:"/user/params" tags:"用户管理" method:"get" summary:"用户维护参数获取"`
}

type UserGetParamsRes struct {
	g.Meta   `mime:"application/json"`
	RoleList []*entity.SysRole `json:"roleList"`
	Posts    []*entity.SysPost `json:"posts"`
}

// SetUserReq 添加修改用户公用请求字段
type SetUserReq struct {
	DeptId   uint64  `p:"deptId" v:"required#用户部门不能为空"` //所属部门
	Email    string  `p:"email" v:"email#邮箱格式错误"`       //邮箱
	NickName string  `p:"nickName" v:"required#用户昵称不能为空"`
	Mobile   string  `p:"mobile" v:"required|phone#手机号不能为空|手机号格式错误"`
	PostIds  []int64 `p:"postIds"`
	Remark   string  `p:"remark"`
	RoleIds  []int64 `p:"roleIds"`
	Sex      int     `p:"sex"`
	Status   uint    `p:"status"`
	IsAdmin  int     `p:"isAdmin"` // 是否后台管理员 1 是  0   否
}

// UserAddReq 添加用户参数
type UserAddReq struct {
	g.Meta `path:"/user/add" tags:"用户管理" method:"post" summary:"添加用户"`
	*SetUserReq
	UserName string `p:"userName" v:"required#用户账号不能为空"`
	Password string `p:"password" v:"required|password#密码不能为空|密码以字母开头，只能包含字母、数字和下划线，长度在6~18之间"`
	UserSalt string
}

type UserAddRes struct {
}

// UserEditReq 修改用户参数
type UserEditReq struct {
	g.Meta `path:"/user/edit" tags:"用户管理" method:"put" summary:"修改用户"`
	*SetUserReq
	UserId int64 `p:"userId" v:"required#用户id不能为空"`
}

type UserEditRes struct {
}

type UserGetEditReq struct {
	g.Meta `path:"/user/getEdit" tags:"用户管理" method:"get" summary:"获取用户信息"`
	Id     uint64 `p:"id"`
}

type UserGetEditRes struct {
	g.Meta         `mime:"application/json"`
	User           *entity.SysUser `json:"user"`
	CheckedRoleIds []uint          `json:"checkedRoleIds"`
	CheckedPosts   []int64         `json:"checkedPosts"`
}

// UserResetPwdReq 重置用户密码状态参数
type UserResetPwdReq struct {
	g.Meta   `path:"/user/resetPwd" tags:"用户管理" method:"put" summary:"重置用户密码"`
	Id       uint64 `p:"userId" v:"required#用户id不能为空"`
	Password string `p:"password" v:"required|password#密码不能为空|密码以字母开头，只能包含字母、数字和下划线，长度在6~18之间"`
}

type UserResetPwdRes struct {
}

// UserStatusReq 设置用户状态参数
type UserStatusReq struct {
	g.Meta     `path:"/user/setStatus" tags:"用户管理" method:"put" summary:"设置用户状态"`
	Id         uint64 `p:"userId" v:"required#用户id不能为空"`
	UserStatus uint   `p:"status" v:"required#用户状态不能为空"`
}

type UserStatusRes struct {
}

type UserDeleteReq struct {
	g.Meta `path:"/user/delete" tags:"用户管理" method:"delete" summary:"删除用户"`
	Ids    []int `p:"ids"  v:"required#ids不能为空"`
}

type UserDeleteRes struct {
}

type UserGetByIdsReq struct {
	g.Meta `path:"/user/getUsers" tags:"用户管理" method:"get" summary:"同时获取多个用户"`
	commonApi.Author
	Ids []int `p:"ids" v:"required#ids不能为空"`
}

type UserGetByIdsRes struct {
	g.Meta `mime:"application/json"`
	List   []*model.SysUserSimpleRes `json:"list"`
}
