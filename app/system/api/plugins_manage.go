// ==========================================================================
// GFast自动生成控制器相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2021-08-31 17:58:43
// 生成路径: gfast/app/system/api/plugins_manage.go
// 生成人：gfast
// ==========================================================================

package api

import (
	"gfast/app/system/dao"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gvalid"
)

type pluginsManage struct {
	SystemBase
}

var PluginsManage = new(pluginsManage)

// List 列表
func (c *pluginsManage) List(r *ghttp.Request) {
	var req *dao.PluginsManageSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.Ctx = r.GetCtx()
	total, page, list, err := service.PluginsManage.GetList(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	c.SusJsonExit(r, result)
}

// Get 获取
func (c *pluginsManage) Get(r *ghttp.Request) {
	id := r.GetInt64("id")
	info, err := service.PluginsManage.GetInfoById(r.GetCtx(), id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, info)
}

// ChangeStatus 修改状态
func (c *pluginsManage) ChangeStatus(r *ghttp.Request) {
	var req *dao.PluginsManageStatusReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	if err := service.PluginsManage.ChangeStatus(r.GetCtx(), req); err != nil {
		c.FailJsonExit(r, err.Error())
	} else {
		c.SusJsonExit(r, "状态设置成功")
	}
}

// Install 插件安装
func (c *pluginsManage) Install(r *ghttp.Request) {
	var req *dao.PluginsManageInstallReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	if req.RToken == "" {
		c.SusJsonExit(r, g.Map{
			"code": -401,
			"msg":  "请登录",
		})
	}
	err := service.PluginsManage.Install(r.GetCtx(), req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "安装成功")
}

// Captcha 获取验证码
func (c *pluginsManage) Captcha(r *ghttp.Request) {
	idKeyC, base64stringC, err := service.PluginsManage.GetCaptcha(r.GetCtx())
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, g.Map{
		"base64stringC": base64stringC,
		"idKeyC":        idKeyC,
	})
}

// LoginR 登录插件服务
func (c *pluginsManage) LoginR(r *ghttp.Request) {
	var req *dao.PluginRLoginFormReq
	// 通过Parse方法解析获取参数
	err := r.Parse(&req)
	if err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	var userInfo g.Map
	userInfo, err = service.PluginsManage.LoginR(r.GetCtx(), req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, userInfo)
}

// InstallOffLine 离线安装
func (c *pluginsManage) InstallOffLine(r *ghttp.Request) {
	upFile := r.GetUploadFile("file")
	f, err := upFile.Open()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	defer f.Close()
	d := make([]byte, upFile.Size)
	_, err = f.Read(d)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	fileName := upFile.Filename
	fileName = gstr.SubStr(fileName, gstr.PosR(fileName, "=")+1,
		gstr.PosR(fileName, ".")-gstr.PosR(fileName, "=")-1)
	err = service.PluginsManage.PluginIsExists(r.GetCtx(), fileName)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	err = service.PluginsManage.InstallFile(r.GetCtx(), d, fileName)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r)
}
