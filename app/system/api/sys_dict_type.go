package api

import (
	"gfast/app/common/global"
	comService "gfast/app/common/service"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type dictType struct {
	SystemBase
}

var DictType = new(dictType)

func (c *dictType) List(r *ghttp.Request) {
	var req *model.ListSysDictTypeReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	req.Ctx = r.GetCtx()
	total, page, list, err := service.SysDictType.SelectList(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, g.Map{
		"total": total,
		"page":  page,
		"list":  list,
	})
}

func (c *dictType) Get(r *ghttp.Request) {
	id := r.GetInt("dictId")
	entity, err := service.SysDictType.GetDictById(id)
	if err != nil {
		c.FailJsonExit(r, "字典数据获取失败")
	}
	c.SusJsonExit(r, entity)
}

func (c *dictType) Add(r *ghttp.Request) {
	var req *model.SysDictTypeAddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	if service.SysDictType.ExistsDictType(req.DictType) {
		c.FailJsonExit(r, "字典类型已经存在")
	}
	req.CreateBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	err := service.SysDictType.Add(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	//清除缓存
	comService.Cache.New().RemoveByTag(global.SysDictTag)
	c.SusJsonExit(r)
}

func (c *dictType) Edit(r *ghttp.Request) {
	var req *model.SysDictTypeEditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	if service.SysDictType.ExistsDictType(req.DictType, req.DictId) {
		c.FailJsonExit(r, "字典类型已经存在")
	}
	ctx := r.GetCtx()
	req.UpdateBy = c.GetCurrentUser(ctx).Id
	err := service.SysDictType.Edit(ctx, req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	//清除缓存
	comService.Cache.New().RemoveByTag(global.SysDictTag)
	c.SusJsonExit(r)
}

func (c *dictType) Delete(r *ghttp.Request) {
	dictIds := r.GetInts("dictIds")
	if len(dictIds) == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	if err := service.SysDictType.Delete(r.GetCtx(), dictIds); err != nil {
		c.FailJsonExit(r, "删除失败")
	}
	//清除缓存
	comService.Cache.New().RemoveByTag(global.SysDictTag)
	c.SusJsonExit(r)
}

// OptionSelect 获取字典选择框列表
func (c *dictType) OptionSelect(r *ghttp.Request) {
	//获取所有字典类型列表
	list, err := service.SysDictType.GetAllDictType()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, list)
}
