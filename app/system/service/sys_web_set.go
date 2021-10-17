/*
* @desc:站点配置
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/6 15:48
 */

package service

import (
	"gfast/app/common/global"
	commonService "gfast/app/common/service"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"github.com/gogf/gf/util/gconv"
)

type sysWebSet struct {
}

var SysWebSet = new(sysWebSet)

func (s *sysWebSet) Get() (data *model.SysWebSet, err error) {
	cache := commonService.Cache.New()
	d := cache.Get(global.SysWebSet)
	if d != nil {
		err = gconv.Struct(d, &data)
		return
	}
	err = dao.SysWebSet.Page(1, 1).Scan(&data)
	if err != nil {
		return
	}
	cache.Set(global.SysWebSet, data, 0)
	return
}

func (s *sysWebSet) UpdateSave(req *model.SysWebSetUpdateReq) (err error) {
	if req.WebId != 0 {
		_, err = dao.SysWebSet.FieldsEx(dao.SysWebSet.C.WebId).WherePri(req.WebId).Update(req)
	} else {
		_, err = dao.SysWebSet.FieldsEx(dao.SysWebSet.C.WebId).Insert(req)
	}
	return
}
