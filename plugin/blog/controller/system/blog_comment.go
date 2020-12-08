package system

import (
	"gfast/library/response"
	"gfast/plugin/blog/model/blog_comment"
	"gfast/plugin/blog/service/blog_service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

// 简单博客管理-评论管理
type BlogComment struct{}

func (c *BlogComment) Delete(r *ghttp.Request) {
	ids := r.GetInts("commentId")
	if len(ids) == 0 {
		response.FailJson(true, r, "ID获取失败，删除失败")
	}
	err := blog_service.DeleteCommentByIDs(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

func (c *BlogComment) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *blog_comment.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = blog_service.EditCommentSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("commentId")
	params, err := blog_service.GetCommentByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

func (c *BlogComment) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *blog_comment.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	total, page, list, err := blog_service.SelectCommentListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "评论列表", result)
}
