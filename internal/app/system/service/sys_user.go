/*
* @desc:用户处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/7 9:50
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/container/gset"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/mssola/user_agent"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
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
