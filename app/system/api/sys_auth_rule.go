package api

import (
	"gfast/app/common/global"
	CommService "gfast/app/common/service"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type authRule struct {
	SystemBase
}

var AuthRule = new(authRule)

func (c *authRule) MenuList(r *ghttp.Request) {

	var (
		req          *model.SysAuthRuleReqSearch
		listEntities []*model.SysAuthRuleInfoRes
		err          error
	)

	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.Error())
	}

	listEntities, err = service.Rule.GetMenuListSearch(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}

	list := make([]*model.SysAuthRuleTreeRes, 0, len(listEntities))
	if !req.IsEmpty() {
		for _, menu := range listEntities {
			list = append(list, &model.SysAuthRuleTreeRes{
				SysAuthRuleInfoRes: menu,
			})
		}
	} else {
		list = service.Rule.GetMenuListTree(0, listEntities)
	}
	c.SusJsonExit(r, g.Map{
		"list": list,
	})
}

func (c *authRule) GetMenus(r *ghttp.Request) {
	listEntities, err := service.Rule.GetIsMenuList()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, g.Map{
		"parentList": listEntities,
	})
}

func (c *authRule) AddMenuPost(r *ghttp.Request) {
	var menu *model.MenuReq
	if err := r.Parse(&menu); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	//判断菜单规则是否存在
	if !service.Rule.CheckMenuNameUnique(menu.Name, 0) {
		c.FailJsonExit(r, "菜单规则名称已经存在")
	}

	//判断路由是否已经存在
	if !service.Rule.CheckMenuPathUnique(menu.Path, 0) {
		c.FailJsonExit(r, "路由地址已经存在")
	}
	err, _ := service.Rule.AddMenu(menu)
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, "添加菜单失败")
	}
	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, "添加菜单成功")
}

func (c *authRule) ModelOptions(r *ghttp.Request) {
	module := r.GetString("module")
	models, err := service.Rule.ModelOptions(module)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}

	c.SusJsonExit(r, models)
}

func (c *authRule) GetMenu(r *ghttp.Request) {
	id := r.GetUint64("menuId")
	menuEntity, err := service.Rule.One(id)
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, err.Error())
	}
	listEntities, err := service.Rule.GetIsMenuList()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	list := service.Rule.ParentSonSort(listEntities, 0)
	var models []*model.SysModelInfo
	if menuEntity.ModuleType != "" {
		models, err = service.Rule.ModelOptions(menuEntity.ModuleType)
		if err != nil {
			c.FailJsonExit(r, err.Error())
		}
	}
	c.SusJsonExit(r, g.Map{
		"parentList":   list,
		"menu":         menuEntity,
		"modelOptions": models,
	})
}

func (c *authRule) EditPost(r *ghttp.Request) {
	id := r.GetInt("menuId")
	menu := new(model.MenuReq)
	if err := r.Parse(menu); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	//判断菜单规则是否存在
	if !service.Rule.CheckMenuNameUnique(menu.Name, id) {
		c.FailJsonExit(r, "菜单规则名称已经存在")
	}

	//判断路由是否已经存在
	if !service.Rule.CheckMenuPathUnique(menu.Path, id) {
		c.FailJsonExit(r, "路由地址已经存在")
	}

	err, _ := service.Rule.EditMenu(menu, id)
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, "修改菜单失败")
	}

	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, "修改菜单成功")
}

func (c *authRule) DeleteMenu(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		c.FailJsonExit(r, "删除失败，参数错误")
	}
	err := service.Rule.DeleteMenuByIds(ids)
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, "删除失败")
	}
	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, "删除成功")
}
