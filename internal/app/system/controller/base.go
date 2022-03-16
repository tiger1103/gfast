/*
* @desc:system base controller
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/4 18:12
 */

package controller

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast-token/gftoken"
	commonController "github.com/tiger1103/gfast/v3/internal/app/common/controller"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/library/libResponse"
)

type baseController struct {
	commonController.BaseController
}

// Init 自动执行的初始化方法
func (c *baseController) Init(r *ghttp.Request) {
	c.BaseController.Init(r)
	b, failed := c.setLoginUser(r)
	if !b {
		libResponse.JsonExit(r, failed.Code, failed.Message)
	}
}

//判断登录并设置用户信息
func (c *baseController) setLoginUser(r *ghttp.Request) (b bool, failed *gftoken.AuthFailed) {
	ctx := r.GetCtx()
	b = true
	// 验证用户是否登录
	b, failed = service.GfToken(ctx).IsLogin(r)
	if !b {
		return
	}
	// 初始化登录用户信息
	data, err := service.GfToken(ctx).ParseToken(r)
	if err != nil {
		return
	}
	if data != nil {
		context := new(model.Context)
		err = gconv.Struct(data.Data, &context.User)
		if err != nil {
			g.Log().Error(ctx, err)
			return
		}
		service.Context().Init(r, context)
	}
	return
}
