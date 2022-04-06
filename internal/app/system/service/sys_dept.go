/*
* @desc:部门管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/4/6 15:19
 */

package service

import (
	"context"
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

type IDept interface {
	GetList(ctx context.Context, req *system.DeptSearchReq) (list []*entity.SysDept, err error)
	Add(ctx context.Context, req *system.DeptAddReq) (err error)
}

var deptService = deptImpl{}

func Dept() IDept {
	return IDept(&deptService)
}

type deptImpl struct {
}

func (s *deptImpl) GetList(ctx context.Context, req *system.DeptSearchReq) (list []*entity.SysDept, err error) {
	err = g.Try(func() {
		m := dao.SysDept.Ctx(ctx)
		if req.DeptName != "" {
			m = m.Where("dept_name like ?", "%"+req.DeptName+"%")
		}
		if req.Status != "" {
			m = m.Where("status", gconv.Int(req.Status))
		}
		err = m.Scan(&list)
		liberr.ErrIsNil(ctx, err, "获取角色列表失败")
	})
	return
}

// Add 添加部门
func (s *deptImpl) Add(ctx context.Context, req *system.DeptAddReq) (err error) {
	err = g.Try(func() {
		_, err = dao.SysDept.Ctx(ctx).Insert(do.SysDept{
			ParentId:  req.ParentID,
			Ancestors: req.Ancestors,
			DeptName:  req.DeptName,
			OrderNum:  req.OrderNum,
			Leader:    req.Leader,
			Phone:     req.Phone,
			Email:     req.Email,
			Status:    req.Status,
			CreatedBy: Context().GetUserId(ctx),
		})
		liberr.ErrIsNil(ctx, err, "添加部门失败")
		// 删除缓存
		commonService.Cache().RemoveByTag(ctx, consts.CacheSysAuthTag)
	})
	return
}
