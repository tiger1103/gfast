package admin

import (
	"gfast/app/model/auth_rule"
	"gfast/app/service/auth_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//菜单用户组用户管理
type Auth struct{}

//菜单列表
func (c *Auth) MenuList(r *ghttp.Request) {
	//获取菜单信息
	err, list := auth_service.GetMenuList("")
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	list = utils.PushSonToParent(list)
	response.SusJson(true, r, "成功", g.Map{
		"list": list,
	})
}

//添加菜单
func (c *Auth) AddMenu(r *ghttp.Request) {
	if r.Method == "POST" {
		menu := new(auth_service.MenuReq)
		if err := r.Parse(menu); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		//保存到数据库
		err, _ := auth_service.AddMenu(menu)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "添加菜单失败")
		}
		response.SusJson(true, r, "添加菜单成功")
	}
	//获取父级菜单信息
	err, list := auth_service.GetMenuList("ismenu=?", 1)
	if err != nil {
		response.FailJson(true, r, "获取数据失败")
	}
	list = utils.ParentSonSort(list)
	response.SusJson(true, r, "成功", g.Map{"parentList": list})
}

//修改菜单
func (c *Auth) EditMenu(r *ghttp.Request) {
	id := r.GetRequestInt("id")
	if r.Method == "POST" {
		menu := new(auth_service.MenuReq)
		if err := r.Parse(menu); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		//保存到数据库
		err, _ := auth_service.EditMenu(menu, id)
		if err != nil {
			g.Log().Error(err)
			response.FailJson(true, r, "修改菜单失败")
		}
		response.SusJson(true, r, "修改菜单成功")
	}
	menuEntity, err := auth_rule.Model.Where("id=?", id).One()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "获取数据失败")
	}
	//获取父级菜单信息
	err, list := auth_service.GetMenuList("ismenu=?", 1)
	if err != nil {
		response.FailJson(true, r, "获取数据失败")
	}
	list = utils.ParentSonSort(list)
	response.SusJson(true, r, "成功", g.Map{
		"parentList": list,
		"menu":       menuEntity,
	})
}

//删除菜单
func (c *Auth) DeleteMenu(r *ghttp.Request) {
	ids := r.GetRequestArray("ids")
	idsInterface := make(g.Slice, len(ids))
	for k, v := range ids {
		idsInterface[k] = gconv.Int(v)
	}
	_, err := auth_rule.Model.Where("id in(?)", idsInterface).Delete()
	if err != nil {
		g.Log().Error(err)
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}

//添加用户组
func (c *Auth) AddGroup(r *ghttp.Request) {
	r.Response.Write("添加用户组")
}
