/*
* @desc:字典类型
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/3/18 11:55
 */

package service

import "C"
import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	commonConsts "github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/model"
	"github.com/tiger1103/gfast/v3/internal/app/common/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/common/service/internal/dao"
	"github.com/tiger1103/gfast/v3/internal/app/common/service/internal/do"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IDictType interface {
	List(ctx context.Context, req *system.DictTypeSearchReq) (res *system.DictTypeSearchRes, err error)
	Add(ctx context.Context, req *system.DictTypeAddReq, userId uint64) (err error)
	Get(ctx context.Context, req *system.DictTypeGetReq) (dictType *entity.SysDictType, err error)
}

type dictTypeImpl struct {
}

var dictTypeService = dictTypeImpl{}

func DictType() IDictType {
	return IDictType(&dictTypeService)
}

// List 字典类型列表
func (s *dictTypeImpl) List(ctx context.Context, req *system.DictTypeSearchReq) (res *system.DictTypeSearchRes, err error) {
	res = new(system.DictTypeSearchRes)
	err = g.Try(func() {
		m := dao.SysDictType.Ctx(ctx)
		if req.DictName != "" {
			m = m.Where(dao.SysDictType.Columns().DictName+" like ?", "%"+req.DictName+"%")
		}
		if req.DictType != "" {
			m = m.Where(dao.SysDictType.Columns().DictType+" like ?", "%"+req.DictType+"%")
		}
		if req.Status != "" {
			m = m.Where(dao.SysDictType.Columns().Status+" = ", gconv.Int(req.Status))
		}
		res.Total, err = m.Count()
		liberr.ErrIsNil(ctx, err, "获取字典类型失败")
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		res.CurrentPage = req.PageNum
		if req.PageSize == 0 {
			req.PageSize = consts.PageSize
		}
		err = m.Fields(model.SysDictTypeInfoRes{}).Page(req.PageNum, req.PageSize).
			Order(dao.SysDictType.Columns().DictId + " asc").Scan(&res.DictTypeList)
		liberr.ErrIsNil(ctx, err, "获取字典类型失败")
	})
	return
}

// Add 添加字典类型
func (s *dictTypeImpl) Add(ctx context.Context, req *system.DictTypeAddReq, userId uint64) (err error) {
	err = g.Try(func() {
		err = s.ExistsDictType(ctx, req.DictType)
		liberr.ErrIsNil(ctx, err)
		_, err = dao.SysDictType.Ctx(ctx).Insert(do.SysDictType{
			DictName: req.DictName,
			DictType: req.DictType,
			Status:   req.Status,
			CreateBy: userId,
			Remark:   req.Remark,
		})
		liberr.ErrIsNil(ctx, err, "添加字典类型失败")
		//清除缓存
		Cache().RemoveByTag(ctx, commonConsts.CacheSysDictTag)
	})
	return
}

func (s *dictTypeImpl) Get(ctx context.Context, req *system.DictTypeGetReq) (dictType *entity.SysDictType, err error) {
	err = g.Try(func() {
		err = dao.SysDictType.Ctx(ctx).Where(dao.SysDictType.Columns().DictId, req.DictId).Scan(&dictType)
		liberr.ErrIsNil(ctx, err, "获取字典类型失败")
	})
	return
}

// ExistsDictType 检查类型是否已经存在
func (s *dictTypeImpl) ExistsDictType(ctx context.Context, dictType string, dictId ...int64) (err error) {
	err = g.Try(func() {
		m := dao.SysDictType.Ctx(ctx).Fields(dao.SysDictType.Columns().DictId).
			Where(dao.SysDictType.Columns().DictType, dictType)
		if len(dictId) > 0 {
			m = m.Where(dao.SysDictType.Columns().DictId+" !=? ", dictId[0])
		}
		res, e := m.One()
		liberr.ErrIsNil(ctx, e, "sql err")
		if !res.IsEmpty() {
			liberr.ErrIsNil(ctx, gerror.New("字典类型已存在"))
		}
	})
	return
}
