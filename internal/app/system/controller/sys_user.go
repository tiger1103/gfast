package controller

import (
	"context"

	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var (
	User = userController{}
)

type userController struct {
	BaseController
}

// GetUserMenus 获取用户菜单及按钮权限
func (c *userController) GetUserMenus(ctx context.Context, req *system.UserMenusReq) (res *system.UserMenusRes, err error) {
	var (
		permissions []string
		menuList    []*model.UserMenus
	)
	userId := service.Context().GetUserId(ctx)
	menuList, permissions, err = service.User().GetAdminRules(ctx, userId)
	res = &system.UserMenusRes{
		MenuList:    menuList,
		Permissions: permissions,
	}
	return
}

// List 用户列表
func (c *userController) List(ctx context.Context, req *system.UserSearchReq) (res *system.UserSearchRes, err error) {
	var (
		total    int64
		userList []*entity.SysUser
	)
	res = new(system.UserSearchRes)
	total, userList, err = service.User().List(ctx, req)
	if err != nil || total == 0 {
		return
	}
	res.Total = total
	res.UserList, err = service.User().GetUsersRoleDept(ctx, userList)
	return
}

// GetParams 获取用户维护相关参数
func (c *userController) GetParams(ctx context.Context, req *system.UserGetParamsReq) (res *system.UserGetParamsRes, err error) {
	res = new(system.UserGetParamsRes)
	res.RoleList, err = service.Role().GetRoleList(ctx)
	if err != nil {
		return
	}
	res.Posts, err = service.Post().GetUsedPost(ctx)
	return
}

// Add 添加用户
func (c *userController) Add(ctx context.Context, req *system.UserAddReq) (res *system.UserAddRes, err error) {
	err = service.User().Add(ctx, req)
	return
}

// GetEditUser 获取修改用户信息
func (c *userController) GetEditUser(ctx context.Context, req *system.UserGetEditReq) (res *system.UserGetEditRes, err error) {
	res, err = service.User().GetEditUser(ctx, req.Id)
	return
}

// Edit 修改用户
func (c *userController) Edit(ctx context.Context, req *system.UserEditReq) (res *system.UserEditRes, err error) {
	err = service.User().Edit(ctx, req)
	return
}

// ResetPwd 重置密码
func (c *userController) ResetPwd(ctx context.Context, req *system.UserResetPwdReq) (res *system.UserResetPwdRes, err error) {
	err = service.User().ResetUserPwd(ctx, req)
	return
}

// SetStatus 修改用户状态
func (c *userController) SetStatus(ctx context.Context, req *system.UserStatusReq) (res *system.UserStatusRes, err error) {
	err = service.User().ChangeUserStatus(ctx, req)
	return
}

// Delete 删除用户
func (c *userController) Delete(ctx context.Context, req *system.UserDeleteReq) (res *system.UserDeleteRes, err error) {
	err = service.User().Delete(ctx, req.Ids)
	return
}
