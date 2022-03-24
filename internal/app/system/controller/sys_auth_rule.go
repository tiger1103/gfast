/*
* @desc:菜单
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/16 10:36
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var Menu = menuController{}

type menuController struct {
}

func (c *menuController) Add(ctx context.Context, req *system.RuleAddReq) (res *system.RuleAddRes, err error) {
	err = service.Rule().Add(ctx, req)
	return
}

// GetAddParams 获取菜单添加及编辑相关参数
func (c *menuController) GetAddParams(ctx context.Context, req *system.RuleGetParamsReq) (res *system.RuleGetParamsRes, err error) {
	// 获取角色列表
	res = new(system.RuleGetParamsRes)
	res.Roles, err = service.Role().GetRoleList(ctx)
	if err != nil {
		return
	}
	res.Menus, err = service.Rule().GetIsMenuList(ctx)
	return
}
