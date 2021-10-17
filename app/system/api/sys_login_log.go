/*
* @desc:登录日志
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/19 10:21
 */

package api

import (
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type sysLoginLog struct {
	SystemBase
}

var SysLoginLog = new(sysLoginLog)

// List 获取日志列表
func (c sysLoginLog) List(r *ghttp.Request) {
	var req *model.SysLoginLogSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	total, page, list, err := service.SysLoginLog.LoginLogListByPage(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	c.SusJsonExit(r, result)
}

// Delete 删除日志
func (c *sysLoginLog) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := service.SysLoginLog.DeleteLoginLogByIds(ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "删除成功")
}

// Clear 清空日志
func (c *sysLoginLog) Clear(r *ghttp.Request) {
	err := service.SysLoginLog.ClearLoginLog()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "清除成功")
}
