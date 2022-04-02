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
	commonConsts "github.com/tiger1103/gfast/v3/internal/app/common/consts"
	commonModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
	commonDao "github.com/tiger1103/gfast/v3/internal/app/common/service/internal/dao"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IDictData interface {
	GetDictWithDataByType(ctx context.Context, req *system.GetDictReq) (dict *system.GetDictRes, err error)
}

type dictDataImpl struct {
}

var dictData = dictDataImpl{}

func DictData() IDictData {
	return IDictData(&dictData)
}

// GetDictWithDataByType 通过字典键类型获取选项
func (s dictDataImpl) GetDictWithDataByType(ctx context.Context, req *system.GetDictReq) (dict *system.GetDictRes,
	err error) {
	cache := Cache()
	cacheKey := commonConsts.CacheSysDict + "_" + req.DictType
	//从缓存获取
	iDict := cache.GetOrSetFuncLock(ctx, cacheKey, func(ctx context.Context) (value interface{}, err error) {
		err = g.Try(func() {
			//从数据库获取
			dict = &system.GetDictRes{}
			//获取类型数据
			err = commonDao.SysDictType.Ctx(ctx).Where(commonDao.SysDictType.Columns().DictType, req.DictType).
				Where(commonDao.SysDictType.Columns().Status, 1).Fields(commonModel.DictTypeRes{}).Scan(&dict.Info)
			liberr.ErrIsNil(ctx, err, "获取字典类型失败")
			err = commonDao.SysDictData.Ctx(ctx).Fields(commonModel.DictDataRes{}).
				Where(commonDao.SysDictData.Columns().DictType, req.DictType).
				Order(commonDao.SysDictData.Columns().DictSort + " asc," +
					commonDao.SysDictData.Columns().DictCode + " asc").
				Scan(&dict.Values)
			liberr.ErrIsNil(ctx, err, "获取字典数据失败")
		})
		value = dict
		return
	}, 0, commonConsts.CacheSysDictTag)
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
