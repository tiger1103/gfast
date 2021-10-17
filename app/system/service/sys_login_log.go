/*
* @desc:登录日志
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/13 17:23
 */

package service

import (
	comModel "gfast/app/common/model"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/grpool"
	"github.com/gogf/gf/util/gconv"
)

type sysLoginLog struct {
	Pool *grpool.Pool
}

var (
	SysLoginLog = &sysLoginLog{
		Pool: grpool.New(100),
	}
)

func (s *sysLoginLog) Invoke(data *model.LoginLogParams) {
	s.Pool.Add(func() {
		//写入日志数据
		SysUser.LoginLog(data)
	})
}

func (s *sysLoginLog) LoginLogListByPage(req *model.SysLoginLogSearchReq) (total, page int, list []*model.SysLoginLog, err error) {
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	if req.PageSize == 0 {
		req.PageSize = comModel.PageSize
	}
	model := dao.SysLoginLog.M
	page = req.PageNum
	order := "info_id DESC"
	if req.LoginName != "" {
		model = model.Where("login_name like ?", "%"+req.LoginName+"%")
	}
	if req.Status != "" {
		model = model.Where("status", gconv.Int(req.Status))
	}
	if req.Ipaddr != "" {
		model = model.Where("ipaddr like ?", "%"+req.Ipaddr+"%")
	}
	if req.LoginLocation != "" {
		model = model.Where("login_location like ?", "%"+req.LoginLocation+"%")
	}
	if req.BeginTime != "" {
		model = model.Where("login_time >=", req.BeginTime)
	}
	if req.EndTime != "" {
		model = model.Where("login_time <=", req.EndTime)
	}
	if req.SortName != "" {
		if req.SortOrder != "" {
			order = req.SortName + " " + req.SortOrder
		} else {
			order = req.SortName + " DESC"
		}
	}

	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	err = model.Page(page, req.PageSize).Order(order).Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	return
}

func (s *sysLoginLog) DeleteLoginLogByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}
	_, err = dao.SysLoginLog.Delete("info_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}

func (s *sysLoginLog) ClearLoginLog() (err error) {
	_, err = g.DB().Exec("truncate " + dao.SysLoginLog.Table)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("清除失败")
	}
	return
}
