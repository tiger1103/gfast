/*
* @desc:字典数据
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/4/3 11:52
 */

package api

import (
	"gfast/app/common/global"
	commonService "gfast/app/common/service"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type dictData struct {
	SystemBase
}

var DictData = new(dictData)

// List 字典列表
func (c *dictData) List(r *ghttp.Request) {
	var req *model.SelectDictPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	req.Ctx = r.GetCtx()
	total, page, list, err := service.SysDictData.DictDataList(req)
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

// Add 添加字典数据
func (c *dictData) Add(r *ghttp.Request) {
	var req *model.DictDataAddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	req.CreateBy = c.GetCurrentUser(r.GetCtx()).GetUserId() //获取登陆用户id
	_, err := service.SysDictData.AddSave(req)
	if err != nil {
		g.Log().Error(err.Error())
		c.FailJsonExit(r, "字典数据添加失败")
	}
	//清除tag缓存
	commonService.Cache.New().RemoveByTag(global.SysDictTag)
	c.SusJsonExit(r, "添加字典数据成功")
}

// Get 获取字典数据信息
func (c *dictData) Get(r *ghttp.Request) {
	dictCode := r.GetInt("dictCode")
	data, err := service.SysDictData.GetDictDataById(dictCode)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, data)
}

// Edit 修改字典数据
func (c *dictData) Edit(r *ghttp.Request) {
	var req *model.EditDictDataReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	req.UpdateBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	err := service.SysDictData.EditSaveData(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	//清除tag缓存
	commonService.Cache.New().RemoveByTag(global.SysDictTag)
	c.SusJsonExit(r, "修改字典数据成功")
}

// Delete 删除字典数据
func (c *dictData) Delete(r *ghttp.Request) {
	dictCodes := r.GetInts("ids")
	if len(dictCodes) == 0 {
		c.FailJsonExit(r, "删除失败")
	}
	err := service.SysDictData.DeleteDictDataByIds(dictCodes)
	if err != nil {
		c.FailJsonExit(r, "删除失败")
	}
	//清除tag缓存
	commonService.Cache.New().RemoveByTag(global.SysDictTag)
	c.SusJsonExit(r, "删除成功")
}

// GetDictData 获取字典数据
func (c *dictData) GetDictData(r *ghttp.Request) {
	var req *model.GetDictReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	req.Ctx = r.GetCtx()
	dict, err := service.SysDictData.GetDictWithDataByType(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, dict)
}
