/*
* @desc:菜单处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/11 15:07
 */

package service

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/do"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IRule interface {
	GetIsMenuList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error)
	GetMenuList(ctx context.Context) (list []*model.SysAuthRuleInfoRes, err error)
	GetIsButtonList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error)
	Add(ctx context.Context, req *system.RuleAddReq) (err error)
}

type ruleImpl struct {
}

var rule = ruleImpl{}

func Rule() IRule {
	return IRule(&rule)
}

// GetIsMenuList 获取isMenu=0|1
func (s *ruleImpl) GetIsMenuList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList(ctx)
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if v.MenuType == 0 || v.MenuType == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

// GetMenuList 获取所有菜单
func (s *ruleImpl) GetMenuList(ctx context.Context) (list []*model.SysAuthRuleInfoRes, err error) {
	cache := service.Cache(ctx)
	//从缓存获取
	iList := cache.GetOrSetFuncLock(ctx, consts.CacheSysAuthMenu, s.getMenuListFromDb, 0, consts.CacheSysAuthTag)
	if iList != nil {
		err = gconv.Struct(iList, &list)
	}
	return
}

// 从数据库获取所有菜单
func (s *ruleImpl) getMenuListFromDb(ctx context.Context) (value interface{}, err error) {
	err = g.Try(func() {
		var v []*model.SysAuthRuleInfoRes
		//从数据库获取
		err = dao.SysAuthRule.Ctx(ctx).
			Fields(model.SysAuthRuleInfoRes{}).Order("weigh desc,id asc").Scan(&v)
		liberr.ErrIsNil(ctx, err, "获取菜单数据失败")
		value = v
	})
	return
}

// GetIsButtonList 获取所有按钮isMenu=2 菜单列表
func (s *ruleImpl) GetIsButtonList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList(ctx)
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if v.MenuType == 2 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

// Add 添加菜单
func (s *ruleImpl) Add(ctx context.Context, req *system.RuleAddReq) (err error) {
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx *gdb.TX) error {
		err = g.Try(func() {
			//菜单数据
			data := do.SysAuthRule{
				Pid:       req.Pid,
				Name:      req.Name,
				Title:     req.Title,
				Icon:      req.Icon,
				Condition: req.Condition,
				Remark:    req.Remark,
				MenuType:  req.MenuType,
				Weigh:     req.Weigh,
				IsHide:    req.IsHide,
				Path:      req.Path,
				Component: req.Component,
				IsLink:    req.IsLink,
				IsIframe:  req.IsIframe,
				IsCached:  req.IsCached,
				Redirect:  req.Redirect,
				IsAffix:   req.IsAffix,
				LinkUrl:   req.LinkUrl,
			}
			ruleId, e := dao.SysAuthRule.Ctx(ctx).TX(tx).InsertAndGetId(data)
			liberr.ErrIsNil(ctx, e, "添加菜单失败")
			e = s.BindRoleRule(ctx, ruleId, req.Roles)
			liberr.ErrIsNil(ctx, e, "添加菜单失败")
		})
		return err
	})
	return
}

// BindRoleRule 绑定角色权限
func (s *ruleImpl) BindRoleRule(ctx context.Context, ruleId interface{}, roleIds []uint) (err error) {
	err = g.Try(func() {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		for _, roleId := range roleIds {
			_, err = enforcer.AddPolicy(fmt.Sprintf("%d", roleId), fmt.Sprintf("%d", ruleId), "All")
			liberr.ErrIsNil(ctx, err)
		}
	})
	return
}
