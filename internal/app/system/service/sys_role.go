/*
* @desc:角色处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/9 10:31
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/do"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IRole interface {
	GetRoleList(ctx context.Context) (list []*entity.SysRole, err error)
	GetRoleListSearch(ctx context.Context, req *system.RoleListReq) (res *system.RoleListRes, err error)
	AddRole(ctx context.Context, req *system.RoleAddReq) (err error)
	Get(ctx context.Context, id uint) (res *entity.SysRole, err error)
	GetFilteredNamedPolicy(ctx context.Context, id uint) (gpSlice []int, err error)
	EditRole(ctx context.Context, req *system.RoleEditReq) error
	DeleteByIds(ctx context.Context, ids []int64) (err error)
}

type roleImpl struct {
}

var roleService = roleImpl{}

func Role() IRole {
	return &roleService
}

func (s *roleImpl) GetRoleListSearch(ctx context.Context, req *system.RoleListReq) (res *system.RoleListRes, err error) {
	res = new(system.RoleListRes)
	g.Try(func() {
		model := dao.SysRole.Ctx(ctx)
		if req.RoleName != "" {
			model = model.Where("name like ?", "%"+req.RoleName+"%")
		}
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
		res.Total, err = model.Count()
		liberr.ErrIsNil(ctx, err, "获取角色数据失败")
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		res.CurrentPage = req.PageNum
		if req.PageSize == 0 {
			req.PageSize = consts.PageSize
		}
		err = model.Page(res.CurrentPage, req.PageSize).Order("id asc").Scan(&res.List)
		liberr.ErrIsNil(ctx, err, "获取数据失败")
	})
	return
}

// GetRoleList 获取角色列表
func (s *roleImpl) GetRoleList(ctx context.Context) (list []*entity.SysRole, err error) {
	cache := commonService.Cache()
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
func (s *roleImpl) AddRoleRule(ctx context.Context, ruleIds []uint, roleId int64) (err error) {
	err = g.Try(func() {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		ruleIdsStr := gconv.Strings(ruleIds)
		for _, v := range ruleIdsStr {
			_, err = enforcer.AddPolicy(gconv.String(roleId), v, "All")
			liberr.ErrIsNil(ctx, err)
		}
	})
	return
}

// DelRoleRule 删除角色权限
func (s *roleImpl) DelRoleRule(ctx context.Context, roleId int64) (err error) {
	err = g.Try(func() {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		_, err = enforcer.RemoveFilteredPolicy(0, gconv.String(roleId))
		liberr.ErrIsNil(ctx, e)
	})
	return
}

func (s *roleImpl) AddRole(ctx context.Context, req *system.RoleAddReq) (err error) {
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx *gdb.TX) error {
		err = g.Try(func() {
			roleId, e := dao.SysRole.Ctx(ctx).TX(tx).InsertAndGetId(req)
			liberr.ErrIsNil(ctx, e, "添加角色失败")
			//添加角色权限
			e = s.AddRoleRule(ctx, req.MenuIds, roleId)
			liberr.ErrIsNil(ctx, e)
			//清除缓存
			commonService.Cache().Remove(ctx, consts.CacheSysRole)
		})
		return err
	})
	return
}

func (s *roleImpl) Get(ctx context.Context, id uint) (res *entity.SysRole, err error) {
	err = g.Try(func() {
		err = dao.SysRole.Ctx(ctx).WherePri(id).Scan(&res)
		liberr.ErrIsNil(ctx, err, "获取角色信息失败")
	})
	return
}

// GetFilteredNamedPolicy 获取角色关联的菜单规则
func (s *roleImpl) GetFilteredNamedPolicy(ctx context.Context, id uint) (gpSlice []int, err error) {
	err = g.Try(func() {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		gp := enforcer.GetFilteredNamedPolicy("p", 0, gconv.String(id))
		gpSlice = make([]int, len(gp))
		for k, v := range gp {
			gpSlice[k] = gconv.Int(v[1])
		}
	})
	return
}

// EditRole 修改角色
func (s *roleImpl) EditRole(ctx context.Context, req *system.RoleEditReq) (err error) {
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx *gdb.TX) error {
		err = g.Try(func() {
			_, e := dao.SysRole.Ctx(ctx).TX(tx).WherePri(req.Id).Data(&do.SysRole{
				Status:    req.Status,
				ListOrder: req.ListOrder,
				Name:      req.Name,
				Remark:    req.Remark,
			}).Update()
			liberr.ErrIsNil(ctx, e, "修改角色失败")
			//删除角色权限
			e = s.DelRoleRule(ctx, req.Id)
			liberr.ErrIsNil(ctx, e)
			//添加角色权限
			e = s.AddRoleRule(ctx, req.MenuIds, req.Id)
			liberr.ErrIsNil(ctx, e)
			//清除缓存
			commonService.Cache().Remove(ctx, consts.CacheSysRole)
		})
		return err
	})
	return
}

// DeleteByIds 删除角色
func (s *roleImpl) DeleteByIds(ctx context.Context, ids []int64) (err error) {
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx *gdb.TX) error {
		err = g.Try(func() {
			_, err = dao.SysRole.Ctx(ctx).TX(tx).Where(dao.SysRole.Columns().Id+" in(?)", ids).Delete()
			liberr.ErrIsNil(ctx, err, "删除角色失败")
			//删除角色权限
			for _, v := range ids {
				err = s.DelRoleRule(ctx, v)
				liberr.ErrIsNil(ctx, err)
			}
			//清除缓存
			commonService.Cache().Remove(ctx, consts.CacheSysRole)
		})
		return err
	})
	return
}
