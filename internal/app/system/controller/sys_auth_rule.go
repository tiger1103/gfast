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
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var Menu = menuController{}

type menuController struct {
	BaseController
}

func (c *menuController) List(ctx context.Context, req *system.RuleSearchReq) (res *system.RuleListRes, err error) {
	var list []*model.SysAuthRuleInfoRes
	res = &system.RuleListRes{
		Rules: make([]*model.SysAuthRuleTreeRes, 0),
	}
	list, err = service.SysAuthRule().GetMenuListSearch(ctx, req)
	if req.Title != "" || req.Component != "" {
		for _, menu := range list {
			res.Rules = append(res.Rules, &model.SysAuthRuleTreeRes{
				SysAuthRuleInfoRes: menu,
			})
		}
	} else {
		res.Rules = service.SysAuthRule().GetMenuListTree(0, list)
	}
	return
}

func (c *menuController) Add(ctx context.Context, req *system.RuleAddReq) (res *system.RuleAddRes, err error) {
	err = service.SysAuthRule().Add(ctx, req)
	return
}

// GetAddParams 获取菜单添加及编辑相关参数
func (c *menuController) GetAddParams(ctx context.Context, req *system.RuleGetParamsReq) (res *system.RuleGetParamsRes, err error) {
	// 获取角色列表
	res = new(system.RuleGetParamsRes)
	res.Roles, err = service.SysRole().GetRoleList(ctx)
	if err != nil {
		return
	}
	res.Menus, err = service.SysAuthRule().GetIsMenuList(ctx)
	return
}

// Get 获取菜单信息
func (c *menuController) Get(ctx context.Context, req *system.RuleInfoReq) (res *system.RuleInfoRes, err error) {
	res = new(system.RuleInfoRes)
	res.Rule, err = service.SysAuthRule().Get(ctx, req.Id)
	if err != nil {
		return
	}
	res.RoleIds, err = service.SysAuthRule().GetMenuRoles(ctx, req.Id)
	return
}

// Update 菜单修改
func (c *menuController) Update(ctx context.Context, req *system.RuleUpdateReq) (res *system.RuleUpdateRes, err error) {
	err = service.SysAuthRule().Update(ctx, req)
	return
}

// Delete 删除菜单
func (c *menuController) Delete(ctx context.Context, req *system.RuleDeleteReq) (res *system.RuleDeleteRes, err error) {
	err = service.SysAuthRule().DeleteMenuByIds(ctx, req.Ids)
	return
}
