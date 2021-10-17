/*
* @desc:个人中心
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/12 22:14
 */

package api

import (
	"gfast/app/common/adapter"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type userProfile struct {
	SystemBase
}

var UserProfile = new(userProfile)

// Profile 获取个人信息
func (c *userProfile) Profile(r *ghttp.Request) {
	//获取用户信息
	user, err := service.SysUser.GetUserInfoById(c.GetCurrentUser(r.GetCtx()).GetUserId())
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	userInfo, err := service.SysUser.GetUserRoleDeptPost(user)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, userInfo)
}

// Avatar 修改头像
func (c *userProfile) Avatar(r *ghttp.Request) {
	upFile := r.GetUploadFile("avatarfile")
	info, err := adapter.Upload.UpImg(upFile)
	if err != nil {
		c.FailJsonExit(r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfo": info,
	}
	userId := c.GetCurrentUser(r.GetCtx()).GetUserId()
	err = service.SysUser.SetAvatar(userId, info.FileUrl)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, res)
}

// Edit 修改个人信息
func (c *userProfile) Edit(r *ghttp.Request) {
	var req *model.ProfileUpReq
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.UserId = c.GetCurrentUser(r.GetCtx()).GetUserId()
	if err := service.SysUser.ProfileEdit(req); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "修改成功")
}

// UpdatePwd 修改密码
func (c *userProfile) UpdatePwd(r *ghttp.Request) {
	var req *model.ProfileUpdatePwdReq
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.UserId = c.GetCurrentUser(r.GetCtx()).GetUserId()
	if err := service.SysUser.ProfileUpdatePwd(req); err != nil {
		c.FailJsonExit(r, err.Error())
	} else {
		c.SusJsonExit(r, "修改成功")
	}
}
