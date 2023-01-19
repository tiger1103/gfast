/*
* @desc:部门管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/26 15:14
 */

package sysDept

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

func init() {
	service.RegisterSysDept(New())
}

func New() *sSysDept {
	return &sSysDept{}
}

type sSysDept struct {
}

func (s *sSysDept) GetList(ctx context.Context, req *system.DeptSearchReq) (list []*entity.SysDept, err error) {
	list, err = s.GetFromCache(ctx)
	if err != nil {
		return
	}
	rList := make([]*entity.SysDept, 0, len(list))
	if req.DeptName != "" || req.Status != "" {
		for _, v := range list {
			if req.DeptName != "" && !gstr.ContainsI(v.DeptName, req.DeptName) {
				continue
			}
			if req.Status != "" && v.Status != gconv.Uint(req.Status) {
				continue
			}
			rList = append(rList, v)
		}
		list = rList
	}
	return
}

func (s *sSysDept) GetFromCache(ctx context.Context) (list []*entity.SysDept, err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		cache := commonService.Cache()
		//从缓存获取
		iList := cache.GetOrSetFuncLock(ctx, consts.CacheSysDept, func(ctx context.Context) (value interface{}, err error) {
			err = dao.SysDept.Ctx(ctx).Scan(&list)
			liberr.ErrIsNil(ctx, err, "获取部门列表失败")
			value = list
			return
		}, 0, consts.CacheSysAuthTag)
		if iList != nil {
			err = gconv.Struct(iList, &list)
			liberr.ErrIsNil(ctx, err)
		}
	})
	return
}

// Add 添加部门
func (s *sSysDept) Add(ctx context.Context, req *system.DeptAddReq) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SysDept.Ctx(ctx).Insert(do.SysDept{
			ParentId:  req.ParentID,
			DeptName:  req.DeptName,
			OrderNum:  req.OrderNum,
			Leader:    req.Leader,
			Phone:     req.Phone,
			Email:     req.Email,
			Status:    req.Status,
			CreatedBy: service.Context().GetUserId(ctx),
		})
		liberr.ErrIsNil(ctx, err, "添加部门失败")
		// 删除缓存
		commonService.Cache().Remove(ctx, consts.CacheSysDept)
	})
	return
}

// Edit 部门修改
func (s *sSysDept) Edit(ctx context.Context, req *system.DeptEditReq) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SysDept.Ctx(ctx).WherePri(req.DeptId).Update(do.SysDept{
			ParentId:  req.ParentID,
			DeptName:  req.DeptName,
			OrderNum:  req.OrderNum,
			Leader:    req.Leader,
			Phone:     req.Phone,
			Email:     req.Email,
			Status:    req.Status,
			UpdatedBy: service.Context().GetUserId(ctx),
		})
		liberr.ErrIsNil(ctx, err, "修改部门失败")
		// 删除缓存
		commonService.Cache().Remove(ctx, consts.CacheSysDept)
	})
	return
}

func (s *sSysDept) Delete(ctx context.Context, id uint64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		var list []*entity.SysDept
		err = dao.SysDept.Ctx(ctx).Scan(&list)
		liberr.ErrIsNil(ctx, err, "不存在部门信息")
		children := s.FindSonByParentId(list, id)
		ids := make([]uint64, 0, len(list))
		for _, v := range children {
			ids = append(ids, v.DeptId)
		}
		ids = append(ids, id)
		_, err = dao.SysDept.Ctx(ctx).Where(dao.SysDept.Columns().DeptId+" in (?)", ids).Delete()
		liberr.ErrIsNil(ctx, err, "删除部门失败")
		// 删除缓存
		commonService.Cache().Remove(ctx, consts.CacheSysDept)
	})
	return
}

func (s *sSysDept) FindSonByParentId(deptList []*entity.SysDept, deptId uint64) []*entity.SysDept {
	children := make([]*entity.SysDept, 0, len(deptList))
	for _, v := range deptList {
		if v.ParentId == deptId {
			children = append(children, v)
			fChildren := s.FindSonByParentId(deptList, v.DeptId)
			children = append(children, fChildren...)
		}
	}
	return children
}

// GetListTree 部门树形菜单
func (s *sSysDept) GetListTree(pid uint64, list []*entity.SysDept) (deptTree []*model.SysDeptTreeRes) {
	deptTree = make([]*model.SysDeptTreeRes, 0, len(list))
	for _, v := range list {
		if v.ParentId == pid {
			t := &model.SysDeptTreeRes{
				SysDept: v,
			}
			child := s.GetListTree(v.DeptId, list)
			if len(child) > 0 {
				t.Children = child
			}
			deptTree = append(deptTree, t)
		}
	}
	return
}

// GetByDeptId 通过部门id获取部门信息
func (s *sSysDept) GetByDeptId(ctx context.Context, deptId uint64) (dept *entity.SysDept, err error) {
	var depts []*entity.SysDept
	depts, err = s.GetFromCache(ctx)
	if err != nil {
		return
	}
	for _, v := range depts {
		if v.DeptId == deptId {
			dept = v
			break
		}
	}
	return
}
