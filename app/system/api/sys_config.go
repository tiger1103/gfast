/*
* @desc:系统配置
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/5 17:46
 */

package api

import (
	"gfast/app/common/global"
	"gfast/app/common/model"
	"gfast/app/common/service"
	commonService "gfast/app/common/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type sysConfig struct {
	SystemBase
}

var SysConfig = new(sysConfig)

// List 系统参数配置列表
func (c *sysConfig) List(r *ghttp.Request) {
	var req *model.SysConfigSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	req.Ctx = r.GetCtx()
	total, page, list, err := service.SysConfig.SelectListByPage(req)
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

// Add 添加
func (c *sysConfig) Add(r *ghttp.Request) {
	var req *model.SysConfigAddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	err := service.SysConfig.CheckConfigKeyUniqueAll(req.ConfigKey)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	req.CreateBy = c.GetCurrentUser(r.GetCtx()).GetUserId() //获取登陆用户id
	err = service.SysConfig.AddSave(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	commonService.Cache.New().Remove(global.SysConfigTag + req.ConfigKey)
	c.SusJsonExit(r, "添加参数成功")
}

// Get 获取参数信息
func (c *sysConfig) Get(r *ghttp.Request) {
	id := r.GetInt("id")
	params, err := service.SysConfig.GetById(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, params)
}

// Edit 修改系统参数
func (c *sysConfig) Edit(r *ghttp.Request) {
	var req *model.SysConfigEditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	err := service.SysConfig.CheckConfigKeyUnique(req.ConfigKey, req.ConfigId)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	req.UpdateBy = c.GetCurrentUser(r.Context()).GetUserId()
	err = service.SysConfig.EditSave(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	commonService.Cache.New().Remove(global.SysConfigTag + req.ConfigKey)
	c.SusJsonExit(r, "修改参数成功")
}

// Delete 删除参数
func (c *sysConfig) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		c.FailJsonExit(r, "删除失败")
	}
	err := service.SysConfig.DeleteByIds(ids)
	if err != nil {
		c.FailJsonExit(r, "删除失败")
	}
	commonService.Cache.New().RemoveByTag(global.SysConfigTag)
	c.SusJsonExit(r, "删除成功")
}
