package admin

import (
	"gfast/app/model/admin/sys_post"
	"gfast/app/service/admin/post_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type Post struct{}

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

func (c *Post) Add(r *ghttp.Request) {
	if r.Method == "POST" {

		var addParams *sys_post.AddParams

		if err := r.Parse(&addParams); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}

		if _, err := post_service.Add(addParams); err != nil {
			response.FailJson(true, r, err.Error())
		}

		response.SusJson(true, r, "添加成功")
	}
}

func (c *Post) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var editParams *sys_post.EditParams

		if err := r.Parse(&editParams); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}

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
