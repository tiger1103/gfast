// ==========================================================================
// GFast自动生成控制器相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2021-09-19 09:44:19
// 生成路径: gfast/app/system/api/demo_gen_class.go
// 生成人：gfast
// ==========================================================================


package api
import (    
    "gfast/app/system/dao"
    "gfast/app/system/service"
    "github.com/gogf/gf/frame/g"
    "github.com/gogf/gf/net/ghttp"
    "github.com/gogf/gf/util/gvalid"    
)
type demoGenClass struct {    
    SystemBase    
}
var DemoGenClass = new(demoGenClass)


func (c *demoGenClass) List(r *ghttp.Request) {
	var req *dao.DemoGenClassSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	req.Ctx = r.GetCtx()
	total, page, list, err := service.DemoGenClass.GetList(req)
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

func (c *demoGenClass) Add(r *ghttp.Request) {
    var req *dao.DemoGenClassAddReq
    //获取参数
    if err := r.Parse(&req); err != nil {
        c.FailJsonExit(r, err.(gvalid.Error).FirstString())
    }    
    err := service.DemoGenClass.Add(r.GetCtx(),req)
    if err != nil {
        c.FailJsonExit(r, err.Error())
    }
    c.SusJsonExit(r, "添加成功")
}
// Get 获取
func (c *demoGenClass) Get(r *ghttp.Request) {
	id := r.GetInt64("id")
	info, err := service.DemoGenClass.GetInfoById(r.GetCtx(),id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, info)
}
// Edit 修改
func (c *demoGenClass) Edit(r *ghttp.Request) {
    var req *dao.DemoGenClassEditReq
    //获取参数
    if err := r.Parse(&req); err != nil {
        c.FailJsonExit(r, err.(gvalid.Error).FirstString())
    }    
    err := service.DemoGenClass.Edit(r.GetCtx(),req)
    if err != nil {
        c.FailJsonExit(r, err.Error())
    }
    c.SusJsonExit(r, "修改成功")
}

func (c *demoGenClass) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	err := service.DemoGenClass.DeleteByIds(r.GetCtx(),ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "删除成功")
}
