package middleware

import (
	comService "gfast/app/common/service"
	"gfast/app/system/api"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"gfast/library"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

// Ctx 自定义上下文对象
func Ctx(r *ghttp.Request) {
	// 初始化，务必最开始执行
	customCtx := &dao.Context{
		Session: r.Session,
		Data:    make(g.Map),
	}
	service.Context.Init(r, customCtx)
	user := new(model.LoginUserRes)
	resp := api.GfToken.GetTokenData(r)
	err := gconv.Struct(resp.Get("data"), &user)
	if err != nil {
		g.Log().Error(err.Error())
	}
	if user != nil {
		customCtx.User = &dao.CtxUser{
			Id:           user.Id,
			UserName:     user.UserName,
			UserNickname: user.UserNickname,
			DeptId:       user.DeptId,
			UserStatus:   user.UserStatus,
			IsAdmin:      user.IsAdmin,
			Avatar:       user.Avatar,
		}
	}
	// 将自定义的上下文对象传递到模板变量中使用
	r.Assigns(g.Map{
		"Context": customCtx,
	})
	// 执行下一步请求逻辑
	r.Middleware.Next()
}

// Auth 权限判断处理中间件
func Auth(r *ghttp.Request) {
	userInfo := service.Context.Get(r.GetCtx()).User
	//获取登陆用户id
	adminId := userInfo.Id
	/*if r.Method != "GET" && adminId!=1{
		library.FailJson(true, r, "演示系统禁止操作")
	}*/
	accessParams := r.GetStrings("accessParams")
	accessParamsStr := ""
	if len(accessParams) > 0 && accessParams[0] != "undefined" {
		accessParamsStr = "?" + gstr.Join(accessParams, "&")
	}
	//获取无需验证权限的用户id
	tagSuperAdmin := false
	service.SysUser.NotCheckAuthAdminIds.Iterator(func(v interface{}) bool {
		if gconv.Uint64(v) == adminId {
			tagSuperAdmin = true
			return false
		}
		return true
	})
	if tagSuperAdmin {
		r.Middleware.Next()
		//不要再往后面执行
		return
	}
	url := gstr.TrimLeft(r.Request.URL.Path, "/") + accessParamsStr
	//获取地址对应的菜单id
	menuList, err := service.Rule.GetMenuIsStatusList()
	if err != nil {
		g.Log().Error(err)
		library.FailJson(true, r, "请求数据失败")
	}
	var menu *model.SysAuthRuleInfoRes
	for _, m := range menuList {
		ms := gstr.SubStr(m.Name, 0, gstr.Pos(m.Name, "?"))
		if m.Name == url || ms == url {
			menu = m
			break
		}
	}
	//只验证存在数据库中的规则
	if menu != nil {
		//若存在不需要验证的条件则跳过
		if gstr.Equal(menu.Condition, "nocheck") {
			r.Middleware.Next()
			return
		}
		menuId := menu.Id
		//菜单没存数据库不验证权限
		if menuId != 0 {
			//判断权限操作
			enforcer, err := comService.Casbin.GetEnforcer()
			if err != nil {
				g.Log().Error(err)
				library.FailJson(true, r, "获取权限失败")
			}
			groupPolicy := enforcer.GetFilteredGroupingPolicy(0,
				gconv.String(adminId))
			if len(groupPolicy) == 0 {
				library.FailJson(true, r, "没有访问权限")
			}
			hasAccess := false
			for _, v := range groupPolicy {
				if enforcer.HasPolicy(v[1], gconv.String(menuId), "All") {
					hasAccess = true
					break
				}
			}
			if !hasAccess {
				library.FailJson(true, r, "没有访问权限")
			}
		}
	} else if menu == nil && accessParamsStr != "" {
		library.FailJson(true, r, "没有访问权限")
	}
	r.Middleware.Next()
}
