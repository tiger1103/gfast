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

type sysRole struct {
	SystemBase
}

var SysRole = new(sysRole)

// RoleList 角色列表
func (c *sysRole) RoleList(r *ghttp.Request) {
	var req *model.SelectPageReq
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	total, page, list, err := service.SysRole.GetRoleListSearch(req)
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, "获取数据失败")
	}
	c.SusJsonExit(r, g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	})
}

// GetRoleMenu GetRole 新增角色
func (c *sysRole) GetRoleMenu(r *ghttp.Request) {
	mListEntities, err := service.Rule.GetMenuList()
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, "获取数据失败")
	}
	mList := service.Rule.GetMenuListTree(0, mListEntities)
	res := g.Map{
		"menuList": mList,
	}
	c.SusJsonExit(r, res)
}

// AddRole 新增角色提交
func (c *sysRole) AddRole(r *ghttp.Request) {
	res := r.GetFormMap()
	if err := service.SysRole.AddRolePost(res); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "添加角色成功")
}

// 获取修改的角色
func (c *sysRole) GetRole(r *ghttp.Request) {
	id := r.GetRequestInt("roleId")
	//获取角色信息
	role, err := service.SysRole.One(id)
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, "获取角色数据失败")
	}
	//获取菜单信息
	mListEntities, err := service.Rule.GetMenuList()
	if err != nil {
		g.Log().Error(err)
		c.FailJsonExit(r, "获取菜单数据失败")
	}
	mList := service.Rule.GetMenuListTree(0, mListEntities)
	//获取角色关联的菜单规则
	gpSlice, err := service.SysRole.GetFilteredNamedPolicy(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, g.Map{
		"menuList":     mList,
		"role":         role,
		"checkedRules": gpSlice,
	})
}

// EditRole 编辑角色提交
func (c *sysRole) EditRole(r *ghttp.Request) {
	id := r.GetRequestInt("roleId")
	res := r.GetFormMap()
	if err := service.SysRole.EditRolePost(res, id); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "修改角色成功")
}

// StatusSetRole 设置角色状态
func (c *sysRole) StatusSetRole(r *ghttp.Request) {
	var req *model.StatusSetReq
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	err := service.SysRole.StatusSetRole(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "状态设置成功")
}

// RoleDataScope 角色数据权限分配
func (c *sysRole) RoleDataScope(r *ghttp.Request) {
	var req *model.DataScopeReq
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).Current().Error())
	}
	err := service.SysRole.RoleDataScope(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, req)
}

// DeleteRole 删除角色
func (c *sysRole) DeleteRole(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		c.FailJsonExit(r, "删除失败，参数错误")
	}
	err := service.SysRole.DeleteByIds(ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, "删除成功")

}
