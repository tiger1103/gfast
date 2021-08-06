/*
* @desc:岗位管理
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/12 10:32
 */

package api

import (
	"gfast/app/system/dao"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type sysPost struct {
	SystemBase
}

var SysPost = new(sysPost)

func (c *sysPost) List(r *ghttp.Request) {
	var req *dao.SysPostSearchParams

	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	total, page, list, err := service.SysPost.List(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	result := g.Map{
		"total": total,
		"list":  list,
		"page":  page,
	}
	c.SusJsonExit(r, result)
}

func (c *sysPost) Add(r *ghttp.Request) {
	var addParams *dao.SysPostAddParams
	if err := r.Parse(&addParams); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	addParams.CreatedBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	if err := service.SysPost.Add(addParams); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "添加成功")
}

func (c *sysPost) Get(r *ghttp.Request) {
	id := r.GetInt64("id")
	if id == 0 {
		c.FailJsonExit(r, "id必须")
	}
	if post, err := service.SysPost.GetOneById(id); err != nil {
		c.FailJsonExit(r, err.Error())
	} else {
		c.SusJsonExit(r, post)
	}
}

func (c *sysPost) Edit(r *ghttp.Request) {
	var editParams *dao.SysPostEditParams
	if err := r.Parse(&editParams); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	editParams.UpdatedBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	if err := service.SysPost.Edit(editParams); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "修改成功")
}

func (c *sysPost) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		c.FailJsonExit(r, "删除失败")
	}
	err := service.SysPost.Delete(ids)
	if err != nil {
		c.FailJsonExit(r, "删除失败")
	}
	c.SusJsonExit(r, "删除信息成功")
}
