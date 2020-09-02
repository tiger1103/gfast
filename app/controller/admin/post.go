package admin

import (
	"gfast/app/model/admin/sys_post"
	"gfast/app/service/admin/post_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type Post struct{}

// @Summary 分页岗位列表数据
// @Description 分页列表
// @Tags 岗位
// @Param data body sys_post.SearchParams true "data"
// @Success 0 {object} response.Response "{"code": 0, "data": [...]}"
// @Router /system/post/list [post]
// @Security
func (c *Post) List(r *ghttp.Request) {
	var req *sys_post.SearchParams

	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}

	total, page, list, err := post_service.List(req)

	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	result := g.Map{
		"total": total,
		"list":  list,
		"page":  page,
	}

	response.SusJson(true, r, "成功", result)
}

// @Summary 添加岗位
// @Description 添加岗位
// @Tags 岗位
// @Accept  application/json
// @Product application/json
// @Param data body sys_post.AddParams true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/post/add [post]
// @Security Bearer
func (c *Post) Add(r *ghttp.Request) {
	if r.Method == "POST" {

		var addParams *sys_post.AddParams

		if err := r.Parse(&addParams); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		addParams.AddUser = user_service.GetLoginID(r)
		if _, err := post_service.Add(addParams); err != nil {
			response.FailJson(true, r, err.Error())
		}

		response.SusJson(true, r, "添加成功")
	}
}

// @Summary 修改岗位
// @Description 获取JSON
// @Tags 岗位
// @Accept  application/json
// @Product application/json
// @Param data body sys_post.EditParams true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "修改成功"}"
// @Router /system/post/edit [post]
// @Security Bearer
func (c *Post) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var editParams *sys_post.EditParams

		if err := r.Parse(&editParams); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		editParams.UpUser = user_service.GetLoginID(r)
		if _, err := post_service.Edit(editParams); err != nil {
			response.FailJson(true, r, err.Error())
		}

		response.SusJson(true, r, "修改成功")
	}

	id := r.GetInt64("id")
	if id == 0 {
		response.FailJson(true, r, "id必须")
	}

	if post, err := post_service.GetOneById(id); err != nil {
		response.FailJson(true, r, err.Error())
	} else {
		response.SusJson(true, r, "success", post)
	}

}

// @Summary 删除岗位
// @Description 删除数据
// @Tags 岗位
// @Param ids path integer true "ids[1,2,3...]"
// @Success 200 {object} response.Response	"{"code": 0, "message": "删除成功"}"
// @Router /system/post/delete [get]
func (c *Post) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := post_service.Delete(ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除信息成功")
}
