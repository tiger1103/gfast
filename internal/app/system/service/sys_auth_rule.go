/*
* @desc:菜单处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/11 15:07
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/dao"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IRule interface {
	GetIsMenuStatusList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error)
	GetMenuList(ctx context.Context) (list []*model.SysAuthRuleInfoRes, err error)
	GetIsButtonStatusList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error)
	Add(ctx context.Context, req *system.RuleAddReq) (err error)
}

type ruleImpl struct {
}

var rule = ruleImpl{}

func Rule() IRule {
	return IRule(&rule)
}

// GetIsMenuStatusList 获取isMenu=0|1且status=1的菜单列表
func (s *ruleImpl) GetIsMenuStatusList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList(ctx)
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if (v.MenuType == 0 || v.MenuType == 1) && v.Status == 1 {
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

// GetIsButtonStatusList 获取所有按钮isMenu=2 且status=1的菜单列表
func (s *ruleImpl) GetIsButtonStatusList(ctx context.Context) ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList(ctx)
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if v.MenuType == 2 && v.Status == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

// Add 添加菜单
func (s *ruleImpl) Add(ctx context.Context, req *system.RuleAddReq) (err error) {
	err = g.Try(func() {
		_, err = dao.SysAuthRule.Ctx(ctx).Insert(req)
		liberr.ErrIsNil(ctx, err, "添加菜单失败")
	})
	return
}
