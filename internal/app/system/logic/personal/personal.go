/*
* @desc:xxxx功能描述
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/11/3 9:55
 */

package personal

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/grand"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	service "github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/library/libUtils"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

func init() {
	service.RegisterPersonal(New())
}

type sPersonal struct {
}

func New() *sPersonal {
	return &sPersonal{}
}

func (s *sPersonal) GetPersonalInfo(ctx context.Context, req *system.PersonalInfoReq) (res *system.PersonalInfoRes, err error) {
	res = new(system.PersonalInfoRes)
	userId := service.Context().GetUserId(ctx)
	res.User, err = service.SysUser().GetUserInfoById(ctx, userId)
	var dept *entity.SysDept
	dept, err = service.SysDept().GetByDeptId(ctx, res.User.DeptId)
	res.DeptName = dept.DeptName
	allRoles, err := service.SysRole().GetRoleList(ctx)
	roles, err := service.SysUser().GetAdminRole(ctx, userId, allRoles)
	name := make([]string, len(roles))
	roleIds := make([]uint, len(roles))
	for k, v := range roles {
		name[k] = v.Name
		roleIds[k] = v.Id
	}
	res.Roles = name
	if err != nil {
		return
	}
	return
}

func (s *sPersonal) EditPersonal(ctx context.Context, req *system.PersonalEditReq) (user *model.LoginUserRes, err error) {
	userId := service.Context().GetUserId(ctx)
	err = service.SysUser().UserNameOrMobileExists(ctx, "", req.Mobile, int64(userId))
	if err != nil {
		return
	}
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = dao.SysUser.Ctx(ctx).TX(tx).WherePri(userId).Update(do.SysUser{
				Mobile:       req.Mobile,
				UserNickname: req.Nickname,
				Remark:       req.Remark,
				Sex:          req.Sex,
				UserEmail:    req.UserEmail,
				Describe:     req.Describe,
				Avatar:       req.Avatar,
			})
			liberr.ErrIsNil(ctx, err, "修改用户信息失败")
			user, err = service.SysUser().GetUserById(ctx, userId)
			liberr.ErrIsNil(ctx, err)
		})
		return err
	})
	return
}

func (s *sPersonal) ResetPwdPersonal(ctx context.Context, req *system.PersonalResetPwdReq) (res *system.PersonalResetPwdRes, err error) {
	userId := service.Context().GetUserId(ctx)
	salt := grand.S(10)
	password := libUtils.EncryptPassword(req.Password, salt)
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SysUser.Ctx(ctx).WherePri(userId).Update(g.Map{
			dao.SysUser.Columns().UserSalt:     salt,
			dao.SysUser.Columns().UserPassword: password,
		})
		liberr.ErrIsNil(ctx, err, "重置用户密码失败")
	})
	return
}
