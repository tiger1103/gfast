// ==========================================================================
// GFast自动生成控制器相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2022-03-03 10:11:15
// 生成路径: gfast/app/demo/api/demo_data_auth.go
// 生成人：gfast
// ==========================================================================

package api

import (
	"gfast/app/demo/dao"
	"gfast/app/demo/model"
	"gfast/app/demo/service"
	sysApi "gfast/app/system/api"
	systemService "gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type demoDataAuth struct {
	sysApi.SystemBase
}

var DemoDataAuth = new(demoDataAuth)

// List 列表
func (c *demoDataAuth) List(r *ghttp.Request) {
	var req *dao.DemoDataAuthSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.Ctx = r.GetCtx()
	userInfo := c.GetCurrentUser(req.Ctx)
	where, err := systemService.SysUser.GetDataWhere(userInfo, &model.DemoDataAuth{})
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	total, page, list, err := service.DemoDataAuth.GetList(req, where)
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

// Add 添加
func (c *demoDataAuth) Add(r *ghttp.Request) {
	var req *dao.DemoDataAuthAddReq
	//获取参数
	err := r.Parse(&req)
	if err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.CreatedBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	err = service.DemoDataAuth.Add(r.GetCtx(), req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "添加成功")
}

// Get 获取
func (c *demoDataAuth) Get(r *ghttp.Request) {
	id := r.GetUint("id")
	info, err := service.DemoDataAuth.GetInfoById(r.GetCtx(), id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, info)
}

// Edit 修改
func (c *demoDataAuth) Edit(r *ghttp.Request) {
	var req *dao.DemoDataAuthEditReq
	//获取参数
	err := r.Parse(&req)
	if err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.UpdatedBy = c.GetCurrentUser(r.GetCtx()).GetUserId() //获取登陆用户id
	err = service.DemoDataAuth.Edit(r.GetCtx(), req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "修改成功")
}

// Delete 删除
func (c *demoDataAuth) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := service.DemoDataAuth.DeleteByIds(r.GetCtx(), ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "删除成功")
}
