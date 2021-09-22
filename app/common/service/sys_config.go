/*
* @desc:系统参数设置
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/5 18:00
 */

package service

import (
	"gfast/app/common/dao"
	"gfast/app/common/global"
	"gfast/app/common/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

type sysConfig struct {
}

var SysConfig = new(sysConfig)

func (s *sysConfig) SelectListByPage(req *model.SysConfigSearchReq) (total, page int, list []*model.SysConfig, err error) {
	m := dao.SysConfig.Ctx(req.Ctx)
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
		if req.BeginTime != "" {
			m = m.Where("create_time >= ? ", req.BeginTime)
		}

		if req.EndTime != "" {
			m = m.Where("create_time<=?", req.EndTime)
		}
	}
	total, err = m.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = model.PageSize
	}
	err = m.Page(page, req.PageSize).Order("config_id asc").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

// CheckConfigKeyUniqueAll 验证参数键名是否存在
func (s *sysConfig) CheckConfigKeyUniqueAll(configKey string) error {
	entity, err := dao.SysConfig.Fields(dao.SysConfig.C.ConfigId).FindOne(dao.SysConfig.C.ConfigKey, configKey)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("校验数据失败")
	}
	if entity != nil {
		return gerror.New("参数键名已经存在")
	}
	return nil
}

// AddSave 添加操作
func (s *sysConfig) AddSave(req *model.SysConfigAddReq) (err error) {
	_, err = dao.SysConfig.Insert(req)
	return
}

func (s *sysConfig) GetById(id int) (data *model.SysConfig, err error) {
	err = dao.SysConfig.WherePri(id).Scan(&data)
	return
}

// CheckConfigKeyUnique 检查键是否已经存在
func (s *sysConfig) CheckConfigKeyUnique(configKey string, configId int64) error {
	entity, err := dao.SysConfig.Fields(dao.SysConfig.C.ConfigId).
		FindOne(dao.SysConfig.C.ConfigKey+"=? and "+dao.SysConfig.C.ConfigId+"!=?",
			configKey, configId)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("校验数据失败")
	}
	if entity != nil {
		return gerror.New("参数键名已经存在")
	}
	return nil
}

// EditSave 修改系统参数
func (s *sysConfig) EditSave(req *model.SysConfigEditReq) (err error) {
	_, err = dao.SysConfig.FieldsEx(dao.SysConfig.C.ConfigId, dao.SysConfig.C.CreateBy).
		WherePri(req.ConfigId).Data(req).Update()
	return
}

// DeleteByIds 删除
func (s *sysConfig) DeleteByIds(ids []int) error {
	_, err := dao.SysConfig.Delete(dao.SysConfig.C.ConfigId+" in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}

// GetConfigByKey 通过key获取参数（从缓存获取）
func (s *sysConfig) GetConfigByKey(key string) (config *model.SysConfig, err error) {
	if key == "" {
		err = gerror.New("参数key不能为空")
		return
	}
	cache := Cache.New()
	cf := cache.Get(global.SysConfigTag + key)
	if cf != nil {
		err = gconv.Struct(cf, &config)
		return
	}
	config, err = s.GetByKey(key)
	if err != nil {
		return
	}
	if config != nil {
		cache.Set(global.SysConfigTag+key, config, 0, global.SysConfigTag)
	}
	return
}

// GetByKey 通过key获取参数（从数据库获取）
func (s *sysConfig) GetByKey(key string) (config *model.SysConfig, err error) {
	err = dao.SysConfig.Where("config_key", key).Scan(&config)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取配置失败")
	}
	return
}
