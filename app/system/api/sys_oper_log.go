/*
* @desc:操作日志管理
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/19 14:50
 */

package api

import (
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"gfast/library"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gvalid"
)

type sysOperLog struct {
	SystemBase
}

var SysOperLog = new(sysOperLog)

// List 操作日志列表
func (c *sysOperLog) List(r *ghttp.Request) {
	var req *dao.SysOperLogSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	total, page, list, err := service.SysOperLog.OperationLogListByPage(req)
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

// Detail 日志详细
func (c *sysOperLog) Detail(r *ghttp.Request) {
	id := r.GetInt64("id")
	log, err := service.SysOperLog.GetOperationLogById(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, g.Map{
		"info": log,
	})
}

// Delete 删除
func (c *sysOperLog) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := service.SysOperLog.DeleteOperationLogByIds(ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "删除成功")
}

// Clear 清空
func (c *sysOperLog) Clear(r *ghttp.Request) {
	err := service.SysOperLog.ClearOperationLog()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "清除成功")
}

// OperationLog 操作日志记录
func (c *sysOperLog) OperationLog(r *ghttp.Request) {
	userInfo := c.GetCurrentUser(r.GetCtx())
	if userInfo == nil {
		return
	}
	url := r.Request.URL //请求地址
	//获取菜单
	//获取地址对应的菜单id
	menuList, err := service.Rule.GetMenuList()
	if err != nil {
		g.Log().Error(err)
		return
	}
	var menu *model.SysAuthRuleInfoRes
	path := gstr.TrimLeft(url.Path, "/")
	for _, m := range menuList {
		if gstr.Equal(m.Name, path) {
			menu = m
			break
		}
	}

	data := &dao.SysOperLogAdd{
		User:         userInfo,
		Menu:         menu,
		Url:          url,
		Params:       r.GetMap(),
		Method:       r.Method,
		ClientIp:     library.GetClientIp(r),
		OperatorType: 1,
	}
	service.SysOperLog.Invoke(data)
}
