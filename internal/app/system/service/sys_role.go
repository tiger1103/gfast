/*
* @desc:角色处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/9 10:31
 */

package service

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/dao"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IRole interface {
	GetRoleList(ctx context.Context) (list []*entity.SysRole, err error)
}

type roleImpl struct {
}

var role = roleImpl{}

func Role() IRole {
	return IRole(&role)
}

// GetRoleList 获取角色列表
func (s *roleImpl) GetRoleList(ctx context.Context) (list []*entity.SysRole, err error) {
	cache := commonService.Cache(ctx)
	//从缓存获取
	iList := cache.GetOrSetFuncLock(ctx, consts.CacheSysRole, s.getRoleListFromDb, 0, consts.CacheSysAuthTag)
	if iList != nil {
		err = gconv.Struct(iList, &list)
	}
	return
}

// 从数据库获取所有角色
func (s *roleImpl) getRoleListFromDb(ctx context.Context) (value interface{}, err error) {
	err = g.Try(func() {
		var v []*entity.SysRole
		//从数据库获取
		err = dao.SysRole.Ctx(ctx).
			Order(dao.SysRole.Columns().ListOrder + " asc," + dao.SysRole.Columns().Id + " asc").
			Scan(&v)
		liberr.ErrIsNil(ctx, err, "获取角色数据失败")
		value = v
	})
	return
}

// AddRoleRule 添加角色权限
func (s *roleImpl) AddRoleRule(ctx context.Context, iRule interface{}, roleId int64) (err error) {
	err = g.Try(func() {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		rule := gconv.Strings(iRule)
		for _, v := range rule {
			_, err = enforcer.AddPolicy(fmt.Sprintf("%d", roleId), fmt.Sprintf("%s", v), "All")
			liberr.ErrIsNil(ctx, err)
		}
	})
	return
}
