/*
* @desc:字典数据管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/28 9:22
 */

package sysDictData

import (
	"context"
	"errors"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/dao"
	"github.com/tiger1103/gfast/v3/internal/app/common/model"
	"github.com/tiger1103/gfast/v3/internal/app/common/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/common/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	systemConsts "github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

func init() {
	service.RegisterSysDictData(New())
}

func New() *sSysDictData {
	return &sSysDictData{}
}

type sSysDictData struct {
}

// GetDictWithDataByType 通过字典键类型获取选项
func (s *sSysDictData) GetDictWithDataByType(ctx context.Context, dictType, defaultValue string) (dict *system.GetDictRes,
	err error) {
	cache := service.Cache()
	cacheKey := consts.CacheSysDict + "_" + dictType
	//从缓存获取
	iDict := cache.GetOrSetFuncLock(ctx, cacheKey, func(ctx context.Context) (value interface{}, err error) {
		err = g.Try(ctx, func(ctx context.Context) {
			//从数据库获取
			dict = &system.GetDictRes{}
			//获取类型数据
			err = dao.SysDictType.Ctx(ctx).Where(dao.SysDictType.Columns().DictType, dictType).
				Where(dao.SysDictType.Columns().Status, 1).Fields(model.DictTypeRes{}).Scan(&dict.Info)
			liberr.ErrIsNil(ctx, err, "获取字典类型失败")
			if dict.Info == nil {
				return
			}
			err = dao.SysDictData.Ctx(ctx).Fields(model.DictDataRes{}).
				Where(dao.SysDictData.Columns().DictType, dictType).
				Where(dao.SysDictData.Columns().Status, 1).
				Order(dao.SysDictData.Columns().DictSort + " asc," +
					dao.SysDictData.Columns().DictCode + " asc").
				Scan(&dict.Values)
			liberr.ErrIsNil(ctx, err, "获取字典数据失败")
		})
		value = dict
		return
	}, 0, consts.CacheSysDictTag)
	if !iDict.IsEmpty() {
		err = gconv.Struct(iDict, &dict)
		if err != nil {
			return
		}
	}
	//设置给定的默认值
	for _, v := range dict.Values {
		if defaultValue != "" {
			if gstr.Equal(defaultValue, v.DictValue) {
				v.IsDefault = 1
			} else {
				v.IsDefault = 0
			}
		}
	}
	return
}

// List 获取字典数据
func (s *sSysDictData) List(ctx context.Context, req *system.DictDataSearchReq) (res *system.DictDataSearchRes, err error) {
	res = new(system.DictDataSearchRes)
	err = g.Try(ctx, func(ctx context.Context) {
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

// IsExists 判断同一类型下字典名次和字典键值是否存在
func (s *sSysDictData) IsExists(ctx context.Context, dictType, dictLabel, dictValue string, dictCode ...int64) error {
	return g.Try(ctx, func(ctx context.Context) {
		var dictData []*entity.SysDictData
		err := dao.SysDictData.Ctx(ctx).Where(dao.SysDictData.Columns().DictType, dictType).
			Fields(dao.SysDictData.Columns().DictCode, dao.SysDictData.Columns().DictLabel, dao.SysDictData.Columns().DictValue).
			Scan(&dictData)
		liberr.ErrIsNil(ctx, err, "获取字典数据失败")
		if dictData == nil {
			return
		}
		if len(dictCode) > 0 {
			for _, v := range dictData {
				if v.DictLabel == gstr.Trim(dictLabel) && v.DictCode != dictCode[0] {
					liberr.ErrIsNil(ctx, errors.New("字典名称已存在"))
				}
				if v.DictValue == dictValue && v.DictCode != dictCode[0] {
					liberr.ErrIsNil(ctx, errors.New("字典键值已存在"))
				}
			}
		} else {
			for _, v := range dictData {
				if v.DictLabel == gstr.Trim(dictLabel) {
					liberr.ErrIsNil(ctx, errors.New("字典名称已存在"))
				}
				if v.DictValue == dictValue {
					liberr.ErrIsNil(ctx, errors.New("字典键值已存在"))
				}
			}
		}
	})
}

func (s *sSysDictData) Add(ctx context.Context, req *system.DictDataAddReq, userId uint64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		err = s.IsExists(ctx, req.DictType, req.DictLabel, req.DictValue)
		liberr.ErrIsNil(ctx, err)
		_, err = dao.SysDictData.Ctx(ctx).Insert(do.SysDictData{
			DictSort:  req.DictSort,
			DictLabel: gstr.Trim(req.DictLabel),
			DictValue: gstr.Trim(req.DictValue),
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
		service.Cache().RemoveByTag(ctx, consts.CacheSysDictTag)
	})
	return
}

// Get 获取字典数据
func (s *sSysDictData) Get(ctx context.Context, dictCode uint) (res *system.DictDataGetRes, err error) {
	res = new(system.DictDataGetRes)
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.SysDictData.Ctx(ctx).WherePri(dictCode).Scan(&res.Dict)
		liberr.ErrIsNil(ctx, err, "获取字典数据失败")
	})
	return
}

// Edit 修改字典数据
func (s *sSysDictData) Edit(ctx context.Context, req *system.DictDataEditReq, userId uint64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		err = s.IsExists(ctx, req.DictType, req.DictLabel, req.DictValue, req.DictCode)
		liberr.ErrIsNil(ctx, err)
		_, err = dao.SysDictData.Ctx(ctx).WherePri(req.DictCode).Update(do.SysDictData{
			DictSort:  req.DictSort,
			DictLabel: gstr.Trim(req.DictLabel),
			DictValue: gstr.Trim(req.DictValue),
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
		service.Cache().RemoveByTag(ctx, consts.CacheSysDictTag)
	})
	return
}

// Delete 删除字典数据
func (s *sSysDictData) Delete(ctx context.Context, ids []int) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SysDictData.Ctx(ctx).Where(dao.SysDictData.Columns().DictCode+" in(?)", ids).Delete()
		liberr.ErrIsNil(ctx, err, "删除字典数据失败")
		//清除缓存
		service.Cache().RemoveByTag(ctx, consts.CacheSysDictTag)
	})
	return
}
