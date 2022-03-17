/*
* @desc:用户处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/7 9:50
 */

package service

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/container/gset"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/mssola/user_agent"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/do"
	"github.com/tiger1103/gfast/v3/library/libUtils"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IUser interface {
	GetAdminUserByUsernamePassword(ctx context.Context, req *system.UserLoginReq) (user *model.LoginUserRes, err error)
	LoginLog(ctx context.Context, params *model.LoginLogParams)
	UpdateLoginInfo(ctx context.Context, id uint64, ip string) (err error)
	NotCheckAuthAdminIds(ctx context.Context) *gset.Set
	GetAdminRules(ctx context.Context, userId uint64) (menuList []*model.UserMenus, permissions []string, err error)
}

type userImpl struct{}

var (
	notCheckAuthAdminIds *gset.Set //无需验证权限的用户id
	user                 = userImpl{}
)

func User() IUser {
	return IUser(&user)
}

func (s *userImpl) NotCheckAuthAdminIds(ctx context.Context) *gset.Set {
	ids := g.Cfg().MustGet(ctx, "system.notCheckAuthAdminIds")
	if !g.IsNil(ids) {
		notCheckAuthAdminIds = gset.NewFrom(ids)
	}
	return notCheckAuthAdminIds
}

func (s *userImpl) GetAdminUserByUsernamePassword(ctx context.Context, req *system.UserLoginReq) (user *model.LoginUserRes, err error) {
	err = g.Try(func() {
		user, err = s.GetUserByUsername(ctx, req.Username)
		liberr.ErrIsNil(ctx, err)
		liberr.ValueIsNil(user, "账号密码错误")
		//验证密码
		if libUtils.EncryptPassword(req.Password, user.UserSalt) != user.UserPassword {
			liberr.ErrIsNil(ctx, gerror.New("账号密码错误"))
		}
		//账号状态
		if user.UserStatus == 0 {
			liberr.ErrIsNil(ctx, gerror.New("账号已被冻结"))
		}
	})
	return
}

// GetUserByUsername 通过用户名获取用户信息
func (s *userImpl) GetUserByUsername(ctx context.Context, userName string) (user *model.LoginUserRes, err error) {
	err = g.Try(func() {
		user = &model.LoginUserRes{}
		err = dao.SysUser.Ctx(ctx).Fields(user).Where(dao.SysUser.Columns().UserName, userName).Scan(user)
		liberr.ErrIsNil(ctx, err, "账号密码错误")
	})
	return
}

// LoginLog 记录登录日志
func (s *userImpl) LoginLog(ctx context.Context, params *model.LoginLogParams) {
	ua := user_agent.New(params.UserAgent)
	browser, _ := ua.Browser()
	loginData := &do.SysLoginLog{
		LoginName:     params.Username,
		Ipaddr:        params.Ip,
		LoginLocation: libUtils.GetCityByIp(params.Ip),
		Browser:       browser,
		Os:            ua.OS(),
		Status:        params.Status,
		Msg:           params.Msg,
		LoginTime:     gtime.Now(),
		Module:        params.Module,
	}
	_, err := dao.SysLoginLog.Ctx(ctx).Insert(loginData)
	if err != nil {
		g.Log().Error(ctx, err)
	}
}

func (s *userImpl) UpdateLoginInfo(ctx context.Context, id uint64, ip string) (err error) {
	g.Try(func() {
		_, err = dao.SysUser.Ctx(ctx).WherePri(id).Update(g.Map{
			dao.SysUser.Columns().LastLoginIp:   ip,
			dao.SysUser.Columns().LastLoginTime: gtime.Now(),
		})
		liberr.ErrIsNil(ctx, err, "更新用户登录信息失败")
	})
	return
}

// GetAdminRules 获取用户菜单数据
func (s *userImpl) GetAdminRules(ctx context.Context, userId uint64) (menuList []*model.UserMenus, permissions []string, err error) {
	err = g.Try(func() {
		//是否超管
		isSuperAdmin := false
		//获取无需验证权限的用户id
		s.NotCheckAuthAdminIds(ctx).Iterator(func(v interface{}) bool {
			if gconv.Uint64(v) == userId {
				isSuperAdmin = true
				return false
			}
			return true
		})
		//获取用户菜单数据
		allRoles, err := Role().GetRoleList(ctx)
		liberr.ErrIsNil(ctx, err)
		roles, err := s.GetAdminRole(ctx, userId, allRoles)
		liberr.ErrIsNil(ctx, err)
		name := make([]string, len(roles))
		roleIds := make([]uint, len(roles))
		for k, v := range roles {
			name[k] = v.Name
			roleIds[k] = v.Id
		}
		//获取菜单信息
		if isSuperAdmin {
			//超管获取所有菜单
			permissions = []string{"*/*/*"}
			menuList, err = s.GetAllMenus(ctx)
			liberr.ErrIsNil(ctx, err)
		} else {
			menuList, err = s.GetAdminMenusByRoleIds(ctx, roleIds)
			liberr.ErrIsNil(ctx, err)
			permissions, err = s.GetPermissions(ctx, roleIds)
			liberr.ErrIsNil(ctx, err)
		}
	})
	return
}

// GetAdminRole 获取用户角色
func (s *userImpl) GetAdminRole(ctx context.Context, userId uint64, allRoleList []*entity.SysRole) (roles []*entity.SysRole, err error) {
	var roleIds []uint
	roleIds, err = s.GetAdminRoleIds(ctx, userId)
	if err != nil {
		return
	}
	roles = make([]*entity.SysRole, 0, len(allRoleList))
	for _, v := range allRoleList {
		for _, id := range roleIds {
			if id == v.Id {
				roles = append(roles, v)
			}
		}
		if len(roles) == len(roleIds) {
			break
		}
	}
	return
}

// GetAdminRoleIds 获取用户角色ids
func (s *userImpl) GetAdminRoleIds(ctx context.Context, userId uint64) (roleIds []uint, err error) {
	enforcer, e := service.CasbinEnforcer(ctx)
	if e != nil {
		err = e
		return
	}
	//查询关联角色规则
	groupPolicy := enforcer.GetFilteredGroupingPolicy(0, gconv.String(userId))
	if len(groupPolicy) > 0 {
		roleIds = make([]uint, len(groupPolicy))
		//得到角色id的切片
		for k, v := range groupPolicy {
			roleIds[k] = gconv.Uint(v[1])
		}
	}
	return
}

func (s *userImpl) GetAllMenus(ctx context.Context) (menus []*model.UserMenus, err error) {
	//获取所有开启的菜单
	var allMenus []*model.SysAuthRuleInfoRes
	allMenus, err = Rule().GetIsMenuStatusList(ctx)
	if err != nil {
		return
	}
	menus = make([]*model.UserMenus, len(allMenus))
	for k, v := range allMenus {
		var menu *model.UserMenu
		menu = s.setMenuData(menu, v)
		menus[k] = &model.UserMenus{UserMenu: menu}
	}
	menus = s.GetMenusTree(menus, 0)
	return
}

func (s *userImpl) GetAdminMenusByRoleIds(ctx context.Context, roleIds []uint) (menus []*model.UserMenus, err error) {
	//获取角色对应的菜单id
	err = g.Try(func() {
		enforcer, e := service.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		menuIds := map[int64]int64{}
		for _, roleId := range roleIds {
			//查询当前权限
			gp := enforcer.GetFilteredPolicy(0, fmt.Sprintf("%d", roleId))
			for _, p := range gp {
				mid := gconv.Int64(p[1])
				menuIds[mid] = mid
			}
		}
		//获取所有开启的菜单
		allMenus, err := Rule().GetIsMenuStatusList(ctx)
		liberr.ErrIsNil(ctx, err)
		menus = make([]*model.UserMenus, 0, len(allMenus))
		for _, v := range allMenus {
			if _, ok := menuIds[gconv.Int64(v.Id)]; gstr.Equal(v.Condition, "nocheck") || ok {
				var roleMenu *model.UserMenu
				roleMenu = s.setMenuData(roleMenu, v)
				menus = append(menus, &model.UserMenus{UserMenu: roleMenu})
			}
		}
		menus = s.GetMenusTree(menus, 0)
	})
	return
}

func (s *userImpl) GetMenusTree(menus []*model.UserMenus, pid uint) []*model.UserMenus {
	returnList := make([]*model.UserMenus, 0, len(menus))
	for _, menu := range menus {
		if menu.Pid == pid {
			menu.Children = s.GetMenusTree(menus, menu.Id)
			returnList = append(returnList, menu)
		}
	}
	return returnList
}

func (s *userImpl) setMenuData(menu *model.UserMenu, entity *model.SysAuthRuleInfoRes) *model.UserMenu {
	menu = &model.UserMenu{
		Id:   entity.Id,
		Pid:  entity.Pid,
		Name: gstr.CaseCamelLower(gstr.Replace(entity.Name, "/", "_")),
		MenuMeta: &model.MenuMeta{
			Icon:        entity.Icon,
			Title:       entity.Title,
			IsLink:      "",
			IsHide:      false,
			IsKeepAlive: false,
			IsAffix:     false,
			IsIframe:    false,
		},
	}
	if entity.MenuType != 0 {
		menu.Component = entity.Component
		menu.Path = entity.Path
	} else {
		menu.Component = "layout/routerView/parent"
		menu.Path = "/" + entity.Path
	}
	if entity.AlwaysShow == 1 {
		menu.MenuMeta.IsHide = false
	} else {
		menu.MenuMeta.IsHide = true
	}
	return menu
}

func (s *userImpl) GetPermissions(ctx context.Context, roleIds []uint) (userButtons []string, err error) {
	err = g.Try(func() {
		//获取角色对应的菜单id
		enforcer, err := service.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, err)
		menuIds := map[int64]int64{}
		for _, roleId := range roleIds {
			//查询当前权限
			gp := enforcer.GetFilteredPolicy(0, gconv.String(roleId))
			for _, p := range gp {
				mid := gconv.Int64(p[1])
				menuIds[mid] = mid
			}
		}
		//获取所有开启的按钮
		allButtons, err := Rule().GetIsButtonStatusList(ctx)
		liberr.ErrIsNil(ctx, err)
		userButtons = make([]string, 0, len(allButtons))
		for _, button := range allButtons {
			if _, ok := menuIds[gconv.Int64(button.Id)]; gstr.Equal(button.Condition, "nocheck") || ok {
				userButtons = append(userButtons, button.Name)
			}
		}
	})
	return
}
