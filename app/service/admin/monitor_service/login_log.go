package monitor_service

import (
	"gfast/app/model/admin/sys_login_log"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

func LoginLogListByPage(req *sys_login_log.SelectPageReq) (total, page int, list []*sys_login_log.Entity, err error) {
	model := sys_login_log.Model
	order := "login_time DESC"
	if req != nil {
		if req.LoginName != "" {
			model = model.Where("login_name like ?", "%"+req.LoginName+"%")
		}
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
		if req.Ipaddr != "" {
			model = model.Where("ipaddr like ?", "%"+req.Ipaddr+"%")
		}
		if req.BeginTime != "" {
			model = model.Where("login_time >=", utils.StrToTimestamp(req.BeginTime))
		}
		if req.EndTime != "" {
			model = model.Where("login_time <=", utils.StrToTimestamp(req.EndTime))
		}
		if req.SortName != "" {
			if req.SortOrder != "" {
				order = req.SortName + " " + req.SortOrder
			} else {
				order = req.SortName + " DESC"
			}
		}
	}
	total, err = model.Count()
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
		req.PageSize = utils.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order(order).All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//删除登录日志
func DeleteLoginLogByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}
	_, err = sys_login_log.Model.Delete("info_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}

//清空日志
func ClearLoginLog() (err error) {
	_, err = g.DB().Exec("truncate " + sys_login_log.Table)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("清除失败")
	}
	return
}
