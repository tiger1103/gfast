/*
* @desc:配置参数管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/28 9:13
 */

package sysConfig

import (
	"context"
	"errors"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/dao"
	"github.com/tiger1103/gfast/v3/internal/app/common/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/common/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	systemConsts "github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

func init() {
	service.RegisterSysConfig(New())
}

func New() *sSysConfig {
	return &sSysConfig{}
}

type sSysConfig struct {
}

// List 系统参数列表
func (s *sSysConfig) List(ctx context.Context, req *system.ConfigSearchReq) (res *system.ConfigSearchRes, err error) {
	res = new(system.ConfigSearchRes)
	err = g.Try(ctx, func(ctx context.Context) {
		m := dao.SysConfig.Ctx(ctx)
		if req != nil {
			if req.ConfigName != "" {
				m = m.Where("config_name like ?", "%"+req.ConfigName+"%")
			}
			if req.ConfigType != "" {
				m = m.Where("config_type = ", gconv.Int(req.ConfigType))
			}
			if req.ConfigKey != "" {
				m = m.Where("config_key like ?", "%"+req.ConfigKey+"%")
			}
			if len(req.DateRange) > 0 {
				m = m.Where("created_at >= ? AND created_at<=?", req.DateRange[0], req.DateRange[1])
			}
		}
		res.Total, err = m.Count()
		liberr.ErrIsNil(ctx, err, "获取数据失败")
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		res.CurrentPage = req.PageNum
		if req.PageSize == 0 {
			req.PageSize = systemConsts.PageSize
		}
		err = m.Page(req.PageNum, req.PageSize).Order("config_id asc").Scan(&res.List)
		liberr.ErrIsNil(ctx, err, "获取数据失败")
	})
	return
}

func (s *sSysConfig) Add(ctx context.Context, req *system.ConfigAddReq, userId uint64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		err = s.CheckConfigKeyUnique(ctx, req.ConfigKey)
		liberr.ErrIsNil(ctx, err)
		_, err = dao.SysConfig.Ctx(ctx).Insert(do.SysConfig{
			ConfigName:  req.ConfigName,
			ConfigKey:   req.ConfigKey,
			ConfigValue: req.ConfigValue,
			ConfigType:  req.ConfigType,
			CreateBy:    userId,
			Remark:      req.Remark,
		})
		liberr.ErrIsNil(ctx, err, "添加系统参数失败")
		//清除缓存
		service.Cache().RemoveByTag(ctx, consts.CacheSysConfigTag)
	})
	return
}

// CheckConfigKeyUnique 验证参数键名是否存在
func (s *sSysConfig) CheckConfigKeyUnique(ctx context.Context, configKey string, configId ...int64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		data := (*entity.SysConfig)(nil)
		m := dao.SysConfig.Ctx(ctx).Fields(dao.SysConfig.Columns().ConfigId).Where(dao.SysConfig.Columns().ConfigKey, configKey)
		if len(configId) > 0 {
			m = m.Where(dao.SysConfig.Columns().ConfigId+" != ?", configId[0])
		}
		err = m.Scan(&data)
		liberr.ErrIsNil(ctx, err, "校验失败")
		if data != nil {
			liberr.ErrIsNil(ctx, errors.New("参数键名重复"))
		}
	})
	return
}

// Get 获取系统参数
func (s *sSysConfig) Get(ctx context.Context, id int) (res *system.ConfigGetRes, err error) {
	res = new(system.ConfigGetRes)
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.SysConfig.Ctx(ctx).WherePri(id).Scan(&res.Data)
		liberr.ErrIsNil(ctx, err, "获取系统参数失败")
	})
	return
}

// Edit 修改系统参数
func (s *sSysConfig) Edit(ctx context.Context, req *system.ConfigEditReq, userId uint64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		err = s.CheckConfigKeyUnique(ctx, req.ConfigKey, req.ConfigId)
		liberr.ErrIsNil(ctx, err)
		_, err = dao.SysConfig.Ctx(ctx).WherePri(req.ConfigId).Update(do.SysConfig{
			ConfigName:  req.ConfigName,
			ConfigKey:   req.ConfigKey,
			ConfigValue: req.ConfigValue,
			ConfigType:  req.ConfigType,
			UpdateBy:    userId,
			Remark:      req.Remark,
		})
		liberr.ErrIsNil(ctx, err, "修改系统参数失败")
		//清除缓存
		service.Cache().RemoveByTag(ctx, consts.CacheSysConfigTag)
	})
	return
}

// Delete 删除系统参数
func (s *sSysConfig) Delete(ctx context.Context, ids []int) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SysConfig.Ctx(ctx).Delete(dao.SysConfig.Columns().ConfigId+" in (?)", ids)
		liberr.ErrIsNil(ctx, err, "删除失败")
		//清除缓存
		service.Cache().RemoveByTag(ctx, consts.CacheSysConfigTag)
	})
	return
}

// GetConfigByKey 通过key获取参数（从缓存获取）
func (s *sSysConfig) GetConfigByKey(ctx context.Context, key string) (config *entity.SysConfig, err error) {
	if key == "" {
		err = gerror.New("参数key不能为空")
		return
	}
	cache := service.Cache()
	cf := cache.Get(ctx, consts.CacheSysConfigTag+key)
	if cf != nil && !cf.IsEmpty() {
		err = gconv.Struct(cf, &config)
		return
	}
	config, err = s.GetByKey(ctx, key)
	if err != nil {
		return
	}
	if config != nil {
		cache.Set(ctx, consts.CacheSysConfigTag+key, config, 0, consts.CacheSysConfigTag)
	}
	return
}

// GetByKey 通过key获取参数（从数据库获取）
func (s *sSysConfig) GetByKey(ctx context.Context, key string) (config *entity.SysConfig, err error) {
	err = dao.SysConfig.Ctx(ctx).Where("config_key", key).Scan(&config)
	if err != nil {
		g.Log().Error(ctx, err)
		err = gerror.New("获取配置失败")
	}
	return
}
