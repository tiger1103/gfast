/*
* @desc:字典数据
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/3/18 11:55
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/model"
	"github.com/tiger1103/gfast/v3/internal/app/common/service/internal/dao"
	"github.com/tiger1103/gfast/v3/internal/app/common/service/internal/do"
	systemConsts "github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IDictData interface {
	GetDictWithDataByType(ctx context.Context, req *system.GetDictReq) (dict *system.GetDictRes, err error)
	List(ctx context.Context, req *system.DictDataSearchReq) (res *system.DictDataSearchRes, err error)
	Add(ctx context.Context, req *system.DictDataAddReq, userId uint64) (err error)
	Get(ctx context.Context, dictCode uint) (res *system.DictDataGetRes, err error)
	Edit(ctx context.Context, req *system.DictDataEditReq, userId uint64) (err error)
	Delete(ctx context.Context, ids []int) (err error)
}

type dictDataImpl struct {
}

var dictData = dictDataImpl{}

func DictData() IDictData {
	return &dictData
}

// GetDictWithDataByType 通过字典键类型获取选项
func (s dictDataImpl) GetDictWithDataByType(ctx context.Context, req *system.GetDictReq) (dict *system.GetDictRes,
	err error) {
	cache := Cache()
	cacheKey := consts.CacheSysDict + "_" + req.DictType
	//从缓存获取
	iDict := cache.GetOrSetFuncLock(ctx, cacheKey, func(ctx context.Context) (value interface{}, err error) {
		err = g.Try(func() {
			//从数据库获取
			dict = &system.GetDictRes{}
			//获取类型数据
			err = dao.SysDictType.Ctx(ctx).Where(dao.SysDictType.Columns().DictType, req.DictType).
				Where(dao.SysDictType.Columns().Status, 1).Fields(model.DictTypeRes{}).Scan(&dict.Info)
			liberr.ErrIsNil(ctx, err, "获取字典类型失败")
			err = dao.SysDictData.Ctx(ctx).Fields(model.DictDataRes{}).
				Where(dao.SysDictData.Columns().DictType, req.DictType).
				Order(dao.SysDictData.Columns().DictSort + " asc," +
					dao.SysDictData.Columns().DictCode + " asc").
				Scan(&dict.Values)
			liberr.ErrIsNil(ctx, err, "获取字典数据失败")
		})
		value = dict
		return
	}, 0, consts.CacheSysDictTag)
	if iDict != nil {
		err = gconv.Struct(iDict, &dict)
		if err != nil {
			return
		}
	}
	//设置给定的默认值
	for _, v := range dict.Values {
		if req.DefaultValue != "" {
			if gstr.Equal(req.DefaultValue, v.DictValue) {
				v.IsDefault = 1
			} else {
				v.IsDefault = 0
			}
		}
	}
	return
}

// List 获取字典数据
func (s dictDataImpl) List(ctx context.Context, req *system.DictDataSearchReq) (res *system.DictDataSearchRes, err error) {
	res = new(system.DictDataSearchRes)
	err = g.Try(func() {
		m := dao.SysDictData.Ctx(ctx)
		if req != nil {
			if req.DictLabel != "" {
				m = m.Where(dao.SysDictData.Columns().DictLabel+" like ?", "%"+req.DictLabel+"%")
			}
			if req.Status != "" {
				m = m.Where(dao.SysDictData.Columns().Status+" = ", gconv.Int(req.Status))
			}
			if req.DictType != "" {
				m = m.Where(dao.SysDictData.Columns().DictType+" = ?", req.DictType)
			}
			res.Total, err = m.Count()
			liberr.ErrIsNil(ctx, err, "获取字典数据失败")
			if req.PageNum == 0 {
				req.PageNum = 1
			}
			res.CurrentPage = req.PageNum
		}
		if req.PageSize == 0 {
			req.PageSize = systemConsts.PageSize
		}
		err = m.Page(req.PageNum, req.PageSize).Order(dao.SysDictData.Columns().DictSort + " asc," +
			dao.SysDictData.Columns().DictCode + " asc").Scan(&res.List)
		liberr.ErrIsNil(ctx, err, "获取字典数据失败")
	})
	return
}

func (s *dictDataImpl) Add(ctx context.Context, req *system.DictDataAddReq, userId uint64) (err error) {
	err = g.Try(func() {
		_, err = dao.SysDictData.Ctx(ctx).Insert(do.SysDictData{
			DictSort:  req.DictSort,
			DictLabel: req.DictLabel,
			DictValue: req.DictValue,
			DictType:  req.DictType,
			CssClass:  req.CssClass,
			ListClass: req.ListClass,
			IsDefault: req.IsDefault,
			Status:    req.Status,
			CreateBy:  userId,
			Remark:    req.Remark,
		})
		liberr.ErrIsNil(ctx, err, "添加字典数据失败")
		//清除缓存
		Cache().RemoveByTag(ctx, consts.CacheSysDictTag)
	})
	return
}

// Get 获取字典数据
func (s *dictDataImpl) Get(ctx context.Context, dictCode uint) (res *system.DictDataGetRes, err error) {
	res = new(system.DictDataGetRes)
	err = g.Try(func() {
		err = dao.SysDictData.Ctx(ctx).WherePri(dictCode).Scan(&res.Dict)
		liberr.ErrIsNil(ctx, err, "获取字典数据失败")
	})
	return
}

// Edit 修改字典数据
func (s *dictDataImpl) Edit(ctx context.Context, req *system.DictDataEditReq, userId uint64) (err error) {
	err = g.Try(func() {
		_, err = dao.SysDictData.Ctx(ctx).WherePri(req.DictCode).Update(do.SysDictData{
			DictSort:  req.DictSort,
			DictLabel: req.DictLabel,
			DictValue: req.DictValue,
			DictType:  req.DictType,
			CssClass:  req.CssClass,
			ListClass: req.ListClass,
			IsDefault: req.IsDefault,
			Status:    req.Status,
			UpdateBy:  userId,
			Remark:    req.Remark,
		})
		liberr.ErrIsNil(ctx, err, "修改字典数据失败")
		//清除缓存
		Cache().RemoveByTag(ctx, consts.CacheSysDictTag)
	})
	return
}

// Delete 删除字典数据
func (s *dictDataImpl) Delete(ctx context.Context, ids []int) (err error) {
	err = g.Try(func() {
		_, err = dao.SysDictData.Ctx(ctx).Where(dao.SysDictData.Columns().DictCode+" in(?)", ids).Delete()
		liberr.ErrIsNil(ctx, err, "删除字典数据失败")
		//清除缓存
		Cache().RemoveByTag(ctx, consts.CacheSysDictTag)
	})
	return
}
