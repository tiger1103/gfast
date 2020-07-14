package admin

import (
	"gfast/app/model/admin/user"
	"gfast/app/service/admin/upload_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type User struct{}

//头像上传上传
func (c *User) Avatar(r *ghttp.Request) {
	upFile := r.GetUploadFile("avatarfile")
	info, err := upload_service.UpImg(upFile)
	if err != nil {
		response.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfo": info,
	}
	id := user_service.GetLoginID(r)
	if _, err := user.Model.Where("id", id).Data(g.Map{
		"avatar": info.FileUrl,
	}).Update(); err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "上传成功", res)
}

/**
获取当前登录用户详情
*/
func (c *User) Profile(r *ghttp.Request) {
	//获取用户信息
	userInfo, err := user_service.GetCurrentUserInfo(r)

	if err != nil {
		g.Log().Println(err.Error())
		response.FailJson(true, r, err.Error())
	}

	delete(userInfo, "user_password")
	response.SusJson(true, r, "ok", userInfo)
}

/**
修改用户信息
*/
func (c *User) Edit(r *ghttp.Request) {

	if r.Method == "POST" {

		var req *user_service.EditParams
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}

		if _, err := user_service.Edit(req); err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改成功")
	}

}

/**
修改密码
*/
func (c *User) UpdatePwd(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *user_service.UpdatePwdReq
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		if err := user_service.UpdatePwd(r, req); err != nil {
			response.FailJson(true, r, err.Error())
		} else {
			response.SusJson(true, r, "修改成功")
		}

	}
}
