package service

import (
	"context"
	"errors"
	"fmt"
	comModel "gfast/app/common/model"
	"gfast/app/common/service"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"gfast/library"
	"github.com/gogf/gf/container/gset"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/grand"
	"github.com/mssola/user_agent"
)

type sysUser struct {
	NotCheckAuthAdminIds *gset.Set //无需验证权限的用户id
}

type UserMenu struct {
	*model.SysAuthRuleInfoRes
	Index     string `json:"index"`
	Name      string `json:"name"`
	MenuName  string `json:"menuName"`
	Component string `json:"component"`
	Path      string `json:"path"`
	Meta      struct {
		Icon  string `json:"icon"`
		Title string `json:"title"`
	} `json:"meta"`
	Hidden     bool `json:"hidden"`
	AlwaysShow bool `json:"alwaysShow"`
}

type UserMenus struct {
	UserMenu
	Children []UserMenus `json:"children"`
}

var (
	notCheckAuthAdminIds = g.Cfg().GetInterfaces("system.notCheckAuthAdminIds")
	SysUser              = &sysUser{
		NotCheckAuthAdminIds: gset.NewFrom(notCheckAuthAdminIds),
	}
)

// GetAdminUserByUsernamePassword 后台登陆验证
func (s *sysUser) GetAdminUserByUsernamePassword(ctx context.Context, req *model.LoginParamsReq) (user *model.LoginUserRes, err error) {
	user, err = s.GetUserByUsernamePassword(ctx, req)
	if err != nil {
		return
	}
	//判断是否后台用户
	if user.IsAdmin != 1 {
		return nil, gerror.New("抱歉!您不属于后台管理员!")
	}
	return
}

// GetUserByUsernamePassword 登陆验证
func (s *sysUser) GetUserByUsernamePassword(ctx context.Context, req *model.LoginParamsReq) (user *model.LoginUserRes, err error) {
	user, err = s.GetUserByUsername(ctx, req.Username)
	if err != nil {
		return
	}
	if user == nil {
		return nil, gerror.New("账号密码错误")
	}
	//验证密码
	if library.EncryptPassword(req.Password, user.UserSalt) != user.UserPassword {
		return nil, gerror.New("账号密码错误")
	}
	//账号状态
	if user.UserStatus == 0 {
		return nil, gerror.New("账号已被冻结")
	}
	return
}

// GetUserByUsername 通过用户名获取用户信息
func (s *sysUser) GetUserByUsername(ctx context.Context, userName string) (user *model.LoginUserRes, err error) {
	return dao.SysUser.FindByUsername(ctx, userName)
}

// UpdateLoginInfo 更新用户登录信息 保存登录日志
func (s *sysUser) UpdateLoginInfo(id uint64, username, ip, userAgent, msg, module string) {
	status := 0 //登录状态 0失败 1成功
	if id != 0 {
		//说明登录成功更新登录信息
		status = 1
		dao.SysUser.UpLoginInfo(id, ip)
	}
	//保存登录日志（异步）
	SysLoginLog.Invoke(&model.LoginLogParams{
		Status:    status,
		Username:  username,
		Ip:        ip,
		UserAgent: userAgent,
		Msg:       msg,
		Module:    module,
	})
}

// LoginLog 记录登录日志
func (s *sysUser) LoginLog(params *model.LoginLogParams) {
	ua := user_agent.New(params.UserAgent)
	browser, _ := ua.Browser()
	loginData := &model.SysLoginLog{
		LoginName:     params.Username,
		Ipaddr:        params.Ip,
		LoginLocation: library.GetCityByIp(params.Ip),
		Browser:       browser,
		Os:            ua.OS(),
		Status:        params.Status,
		Msg:           params.Msg,
		LoginTime:     gtime.Now(),
		Module:        params.Module,
	}
	dao.SysLoginLog.SaveLog(loginData)
}

// SaveOnline 保存用户登录在线状态信息
func (s *sysUser) SaveOnline(params *model.SysUserOnline) {
	dao.SysUserOnline.SaveOnline(params)
}

// GetAdminRole 获取用户角色
func (s *sysUser) GetAdminRole(userId uint64, allRoleList []*model.SysRole) (roles []*model.SysRole, err error) {
	var roleIds []uint
	roleIds, err = s.GetAdminRoleIds(userId)
	if err != nil {
		return
	}
	roles = make([]*model.SysRole, 0, len(allRoleList))
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
func (s *sysUser) GetAdminRoleIds(userId uint64) (roleIds []uint, err error) {
	enforcer, e := service.Casbin.GetEnforcer()
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

func (s *sysUser) GetPermissions(roleIds []uint) ([]string, error) {
	//获取角色对应的菜单id
	enforcer, err := service.Casbin.GetEnforcer()
	if err != nil {
		return nil, err
	}
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
	allButtons, err := Rule.GetIsButtonStatusList()
	userButtons := make([]string, 0, len(allButtons))
	for _, button := range allButtons {
		if _, ok := menuIds[gconv.Int64(button.Id)]; gstr.Equal(button.Condition, "nocheck") || ok {
			userButtons = append(userButtons, button.Name)
		}
	}
	return userButtons, nil
}

func (s *sysUser) GetAllMenus() (menus []UserMenus, err error) {
	//获取所有开启的菜单
	var allMenus []*model.SysAuthRuleInfoRes
	allMenus, err = Rule.GetIsMenuStatusList()
	if err != nil {
		return
	}
	menus = make([]UserMenus, len(allMenus))
	for k, v := range allMenus {
		var menu UserMenu
		menu = s.setMenuData(menu, v)
		menus[k] = UserMenus{UserMenu: menu}
	}
	menus = s.GetMenusTree(menus, 0)
	return
}

func (s *sysUser) GetAdminMenusByRoleIds(roleIds []uint) (menus []UserMenus, err error) {
	//获取角色对应的菜单id
	enforcer, e := service.Casbin.GetEnforcer()
	if e != nil {
		err = e
		return
	}
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
	allMenus, err := Rule.GetIsMenuStatusList()
	if err != nil {
		return
	}
	menus = make([]UserMenus, 0, len(allMenus))
	for _, v := range allMenus {
		if _, ok := menuIds[gconv.Int64(v.Id)]; gstr.Equal(v.Condition, "nocheck") || ok {
			var roleMenu UserMenu
			roleMenu = s.setMenuData(roleMenu, v)
			menus = append(menus, UserMenus{UserMenu: roleMenu})
		}
	}
	menus = s.GetMenusTree(menus, 0)
	return
}

func (s *sysUser) GetMenusTree(menus []UserMenus, pid uint) []UserMenus {
	returnList := make([]UserMenus, 0, len(menus))
	for _, menu := range menus {
		if menu.Pid == pid {
			menu.Children = s.GetMenusTree(menus, menu.Id)
			returnList = append(returnList, menu)
		}
	}
	return returnList
}

func (s *sysUser) setMenuData(menu UserMenu, entity *model.SysAuthRuleInfoRes) UserMenu {
	menu = UserMenu{
		SysAuthRuleInfoRes: entity,
		Index:              entity.Name,
		Name:               gstr.UcFirst(entity.Path),
		MenuName:           entity.Title,
		Meta: struct {
			Icon  string `json:"icon"`
			Title string `json:"title"`
		}(struct {
			Icon  string
			Title string
		}{Icon: entity.Icon, Title: entity.Title}),
	}
	if entity.MenuType != 0 {
		menu.Component = entity.Component
		menu.Path = entity.Path
	} else {
		menu.Component = "Layout"
		menu.Path = "/" + entity.Path
	}
	if entity.AlwaysShow == 1 {
		menu.Hidden = false
	} else {
		menu.Hidden = true
	}
	if entity.AlwaysShow == 1 && entity.MenuType == 0 {
		menu.AlwaysShow = true
	} else {
		menu.AlwaysShow = false
	}
	return menu
}

func (s *sysUser) WriteDeptIdsOfSearchReq(req *model.SysUserSearchReq) error {
	if req.DeptId == "" {
		return nil
	}
	depts, e := Dept.GetList(&dao.SysDeptSearchParams{
		Status: "1",
	})
	if e != nil {
		return e
	}
	deptId := gconv.Int64(req.DeptId)
	req.DeptIds = append(req.DeptIds, deptId)
	children := Dept.FindSonByParentId(depts, deptId)
	for _, d := range children {
		req.DeptIds = append(req.DeptIds, d.DeptId)
	}
	return nil
}

// GetUsersRoleDept 获取多个用户角色 部门信息
func (s *sysUser) GetUsersRoleDept(userList []*model.SysUser) ([]*model.SysUserRoleDeptRes, error) {
	allRoles, err := SysRole.GetRoleList()
	if err != nil {
		g.Log().Error(err)
		return nil, err
	}
	depts, err := Dept.GetList(&dao.SysDeptSearchParams{})
	if err != nil {
		g.Log().Error(err)
		return nil, err
	}
	users := make([]*model.SysUserRoleDeptRes, len(userList))
	for k, u := range userList {
		var dept *model.SysDept
		users[k] = &model.SysUserRoleDeptRes{
			SysUser: u,
		}
		for _, d := range depts {
			if u.DeptId == uint64(d.DeptId) {
				dept = d
			}
		}
		users[k].Dept = dept
		roles, err := s.GetAdminRole(u.Id, allRoles)
		if err != nil {
			g.Log().Error(err)
			return nil, err
		}
		for _, r := range roles {
			users[k].RoleInfo = append(users[k].RoleInfo, &struct {
				RoleId uint   `json:"roleId"`
				Name   string `json:"name"`
			}{RoleId: r.Id, Name: r.Name})
		}
	}
	return users, nil
}

// GetUserRoleDeptPost 获取某个用户对应的部门、岗位、角色信息
func (s *sysUser) GetUserRoleDeptPost(user *model.SysUser) (*model.SysUserRoleDeptRes, error) {
	allRoles, err := SysRole.GetRoleList()
	if err != nil {
		g.Log().Error(err)
		return nil, err
	}
	//部门
	depts, err := Dept.GetList(&dao.SysDeptSearchParams{})
	if err != nil {
		g.Log().Error(err)
		return nil, err
	}
	userData := &model.SysUserRoleDeptRes{
		SysUser: user,
	}
	for _, d := range depts {
		if user.DeptId == uint64(d.DeptId) {
			userData.Dept = d
		}
	}
	//角色
	roles, err := s.GetAdminRole(user.Id, allRoles)
	if err != nil {
		g.Log().Error(err)
		return nil, err
	}
	for _, r := range roles {
		userData.RoleInfo = append(userData.RoleInfo, &struct {
			RoleId uint   `json:"roleId"`
			Name   string `json:"name"`
		}{RoleId: r.Id, Name: r.Name})
	}
	//岗位
	posts, err := s.GetPostsByUserId(user.Id)
	if err != nil {
		return nil, err
	}

	for _, v := range posts {
		userData.Post = append(userData.Post, &struct {
			PostId   int64  `json:"postId"`
			PostName string `json:"postName"`
		}{PostId: v.PostId, PostName: v.PostName})
	}
	return userData, nil
}

func (s *sysUser) GetUserList(req *model.SysUserSearchReq) (total, page int, userList []*model.SysUser, err error) {
	if req.PageSize == 0 {
		req.PageSize = comModel.PageSize
	}
	userModel := dao.SysUser.M
	if req.KeyWords != "" {
		keyWords := "%" + req.KeyWords + "%"
		userModel = userModel.Where("user_name like ? or  user_nickname like ?", keyWords, keyWords)
	}
	if len(req.DeptIds) != 0 {
		userModel = userModel.Where("dept_id in (?)", req.DeptIds)
	}
	if req.Status != "" {
		userModel = userModel.Where("user_status", gconv.Int(req.Status))
	}
	if req.Phonenumber != "" {
		userModel = userModel.Where("mobile like ?", "%"+req.Phonenumber+"%")
	}
	if req.BeginTime != "" {
		userModel = userModel.Where("created_at >=?", req.BeginTime)
	}
	if req.EndTime != "" {
		userModel = userModel.Where("created_at <=?", req.EndTime)
	}
	total, err = userModel.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	err = userModel.FieldsEx(dao.SysUser.Columns.UserPassword, dao.SysUser.Columns.UserSalt).
		Page(page, req.PageSize).Order("id asc").Scan(&userList)
	return
}

func (s *sysUser) AddUser(req *model.AddUserReq) (err error) {
	req.UserSalt = grand.S(10)
	req.Password = library.EncryptPassword(req.Password, req.UserSalt)
	var tx *gdb.TX
	tx, err = g.DB().Begin()
	if err != nil {
		err = gerror.New("事务开启失败")
		return
	}
	Model := dao.SysUser.TX(tx)
	if i, _ := Model.Where("user_name=?", req.UserName).Count(); i != 0 {
		err = gerror.New("用户名已经存在")
		tx.Rollback()
		return
	}
	if i, _ := Model.Where("mobile=?", req.Phonenumber).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		tx.Rollback()
		return
	}
	userData := new(model.SysUser)
	userData.UserName = req.UserName
	userData.DeptId = req.DeptId
	userData.UserStatus = req.Status
	userData.Mobile = req.Phonenumber
	userData.Sex = req.Sex
	userData.UserEmail = req.Email
	userData.UserNickname = req.NickName
	userData.UserSalt = req.UserSalt
	userData.UserPassword = req.Password
	userData.Remark = req.Remark
	userData.IsAdmin = req.IsAdmin
	res, err := Model.Insert(userData)
	if err != nil {
		tx.Rollback()
		return
	}
	InsertId, _ := res.LastInsertId()
	err = s.AddUserRole(req.RoleIds, InsertId)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("设置用户权限失败")
		tx.Rollback()
		return
	}
	err = s.AddUserPost(req.PostIds, InsertId, tx)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("设置用户岗位信息失败")
		tx.Rollback()
		return
	}
	tx.Commit()
	return
}

// AddUserRole 添加用户角色信息
func (s *sysUser) AddUserRole(roleIds interface{}, userId int64) (err error) {
	enforcer, e := service.Casbin.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	rule := gconv.Ints(roleIds)
	for _, v := range rule {
		_, err = enforcer.AddGroupingPolicy(fmt.Sprintf("%d", userId), fmt.Sprintf("%d", v))
		if err != nil {
			return
		}
	}
	return
}

// AddUserPost 添加用户岗位信息
func (s *sysUser) AddUserPost(postIds []int64, userId int64, tx *gdb.TX) (err error) {
	//删除旧岗位信息
	_, err = dao.SysUserPost.TX(tx).Where(dao.SysUserPost.Columns.UserId, userId).Delete()
	if err != nil {
		g.Log().Error(err)
		return
	}
	if len(postIds) == 0 {
		return
	}
	//添加用户岗位信息
	data := g.List{}
	for _, v := range postIds {
		data = append(data, g.Map{
			dao.SysUserPost.Columns.UserId: userId,
			dao.SysUserPost.Columns.PostId: v,
		})
	}
	_, err = dao.SysUserPost.TX(tx).Data(data).Insert()
	if err != nil {
		g.Log().Error(err)
		return
	}
	return
}

// GetUserInfoById 通过Id获取用户信息
func (s *sysUser) GetUserInfoById(id uint64, withPwd ...bool) (user *model.SysUser, err error) {
	if len(withPwd) > 0 && withPwd[0] {
		//用户用户信息
		err = dao.SysUser.Where(dao.SysUser.Columns.Id, id).Scan(&user)
	} else {
		//用户用户信息
		err = dao.SysUser.Where(dao.SysUser.Columns.Id, id).
			FieldsEx(dao.SysUser.Columns.UserPassword, dao.SysUser.Columns.UserSalt).Scan(&user)
	}
	if err != nil {
		g.Log().Error(err)
		return nil, errors.New("获取用户数据失败")
	}
	return
}

// GetEditUser 获取要修改的用户信息
func (s *sysUser) GetEditUser(id uint64) (g.Map, error) {
	userData, err := s.GetUserInfoById(id)
	//获取角色信息
	roleList, err := SysRole.GetRoleList()
	if err != nil {
		g.Log().Error(err)
		return nil, errors.New("获取角色数据失败")
	}
	//获取已选择的角色信息
	checkedRoleIds, err := SysUser.GetAdminRoleIds(id)
	if err != nil {
		g.Log().Error(err)
		return nil, errors.New("获取用户角色数据失败")
	}
	if checkedRoleIds == nil {
		checkedRoleIds = []uint{}
	}
	//获取岗位信息
	posts, err := s.GetUsedPost()
	if err != nil {
		return nil, err
	}
	checkedPosts, err := s.GetUserPostIds(id)
	if err != nil {
		return nil, err
	}

	if checkedPosts == nil {
		checkedPosts = []int64{}
	}

	res := g.Map{
		"roleList":       roleList,
		"userInfo":       userData,
		"checkedRoleIds": checkedRoleIds,
		"posts":          posts,
		"checkedPosts":   checkedPosts,
	}

	return res, nil
}

// GetUsedPost 获取正常状态的岗位
func (s *sysUser) GetUsedPost() (list []*model.SysPost, err error) {
	err = dao.SysPost.Where(dao.SysPost.C.Status, 1).
		Order(dao.SysPost.C.PostSort + " ASC, " + dao.SysPost.C.PostId + " ASC ").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取岗位数据失败")
	}
	return
}

// GetUserPostIds 获取用户岗位
func (s *sysUser) GetUserPostIds(userId uint64) (postIds []int64, err error) {
	var list []*model.SysUserPost
	err = dao.SysUserPost.Where(dao.SysUserPost.Columns.UserId, userId).Scan(&list)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("获取用户岗位信息失败")
	}
	postIds = make([]int64, 0)
	for _, entity := range list {
		postIds = append(postIds, entity.PostId)
	}
	return
}

// GetPostsByUserId 根据用户id获取岗位信息详情
func (s *sysUser) GetPostsByUserId(userId uint64) ([]*model.SysPost, error) {
	postIds, err := s.GetUserPostIds(userId)
	if err != nil {
		return nil, err
	}
	var posts []*model.SysPost
	err = dao.SysPost.Where(dao.SysPost.C.PostId+" in (?)", postIds).Scan(&posts)
	return posts, err
}

// EditUser 修改用户
func (s *sysUser) EditUser(req *model.EditUserReq) (err error) {
	if i, _ := dao.SysUser.Where("id!=? and mobile=?", req.UserId, req.Phonenumber).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		return
	}
	var tx *gdb.TX
	tx, err = g.DB().Begin()
	//保存管理员信息
	var userData *model.SysUser
	err = dao.SysUser.Where("id", req.UserId).Scan(&userData)
	if err != nil || userData == nil {
		g.Log().Error(err)
		err = gerror.New("获取用户信息失败")
		return
	}
	userData.DeptId = req.DeptId
	userData.UserStatus = req.Status
	userData.Mobile = req.Phonenumber
	userData.Sex = req.Sex
	userData.UserEmail = req.Email
	userData.UserNickname = req.NickName
	userData.Remark = req.Remark
	userData.IsAdmin = req.IsAdmin
	_, err = dao.SysUser.TX(tx).FieldsEx(dao.SysUser.Columns.Id, dao.SysUser.Columns.CreatedAt,
		dao.SysUser.Columns.DeletedAt, dao.SysUser.Columns.LastLoginTime).
		WherePri(userData.Id).Update(userData)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("修改用户信息失败")
		tx.Rollback()
		return
	}
	//设置用户所属角色信息
	err = s.EditUserRole(req.RoleIds, req.UserId)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("设置用户权限失败")
		tx.Rollback()
		return
	}
	//设置用户岗位数据
	err = s.AddUserPost(req.PostIds, gconv.Int64(req.UserId), tx)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("设置用户岗位信息失败")
		tx.Rollback()
		return
	}
	tx.Commit()
	return
}

// EditUserRole 修改用户角色信息
func (s *sysUser) EditUserRole(roleIds interface{}, userId int) (err error) {
	enforcer, e := service.Casbin.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	rule := gconv.Ints(roleIds)
	//删除用户旧角色信息
	enforcer.RemoveFilteredGroupingPolicy(0, fmt.Sprintf("%d", userId))
	for _, v := range rule {
		_, err = enforcer.AddGroupingPolicy(fmt.Sprintf("%d", userId), fmt.Sprintf("%d", v))
		if err != nil {
			return
		}
	}
	return
}

// ResetUserPwd 重置用户密码
func (s *sysUser) ResetUserPwd(req *model.SysUserResetPwdReq) error {
	salt := grand.S(10)
	password := library.EncryptPassword(req.Password, salt)
	_, err := dao.SysUser.WherePri(req.Id).Update(g.Map{
		dao.SysUser.Columns.UserSalt:     salt,
		dao.SysUser.Columns.UserPassword: password,
	})
	return err
}

func (s *sysUser) ChangeUserStatus(req *model.SysUserStatusReq) error {
	_, err := dao.SysUser.WherePri(req.Id).Update(g.Map{
		dao.SysUser.Columns.UserStatus: req.UserStatus,
	})
	return err
}

// DeleteUser 删除用户信息
func (s *sysUser) DeleteUser(ctx context.Context, ids []int) error {
	return g.DB().Transaction(ctx, func(ctx context.Context, tx *gdb.TX) error {
		_, err := dao.SysUser.Ctx(ctx).TX(tx).Where(dao.SysUser.Columns.Id+" in(?)", ids).Delete()
		//删除对应权限
		enforcer, err := service.Casbin.GetEnforcer()
		if err == nil {
			for _, v := range ids {
				enforcer.RemoveFilteredGroupingPolicy(0, fmt.Sprintf("%d", v))
			}
		}
		//删除用户对应的岗位
		_, err = dao.SysUserPost.Ctx(ctx).TX(tx).Delete(dao.SysUserPost.Columns.UserId+" in (?)", ids)
		return err
	})
}

// SetAvatar 修改用户头像
func (s *sysUser) SetAvatar(userId uint64, avatarUrl string) error {
	_, err := dao.SysUser.WherePri(userId).Unscoped().Update(g.Map{
		dao.SysUser.Columns.Avatar: avatarUrl,
	})
	return err
}

// ProfileEdit 修改个人资料
func (s *sysUser) ProfileEdit(req *model.ProfileUpReq) error {
	_, err := dao.SysUser.WherePri(req.UserId).Unscoped().Update(req)
	return err
}

// ProfileUpdatePwd 修改个人密码
func (s *sysUser) ProfileUpdatePwd(req *model.ProfileUpdatePwdReq) error {
	userInfo, err := s.GetUserInfoById(req.UserId, true)
	if err != nil {
		return err
	}
	oldPassword := library.EncryptPassword(req.OldPassword, userInfo.UserSalt)
	if oldPassword != userInfo.UserPassword {
		return errors.New("原始密码错误!")
	}
	salt := grand.S(10)
	newPassword := library.EncryptPassword(req.NewPassword, salt)
	_, err = dao.SysUser.WherePri(req.UserId).Unscoped().Update(g.Map{
		dao.SysUser.Columns.UserSalt:     salt,
		dao.SysUser.Columns.UserPassword: newPassword,
	})
	return err
}
