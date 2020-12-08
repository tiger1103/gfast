package system

import (
	"gfast/library/response"
	"gfast/plugin/blog/model/blog_log"
	"gfast/plugin/blog/service/blog_service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

// 简单博客管理-日志管理
type BlogLog struct{}

func (c *BlogLog) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *blog_log.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		// 调用service中的添加函数添加广告
		err = blog_service.AddLogSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功!")
	}
}

func (c *BlogLog) Delete(r *ghttp.Request) {
	ids := r.GetInts("logID")
	if len(ids) == 0 {
		response.FailJson(true, r, "ID获取失败，删除失败")
	}
	err := blog_service.DeleteLogByIDs(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

func (c *BlogLog) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *blog_log.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = blog_service.EditLogSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("logID")
	params, err := blog_service.GetLogByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

func (c *BlogLog) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *blog_log.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	total, page, list, err := blog_service.SelectLogListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "日志列表", result)
}

func (c *BlogLog) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "获取记录id、序号失败")
	}
	var err error
	for k, v := range s {
		_, err = blog_log.Model.Where("log_id=?", k).Data("log_sort", v).Update()
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
	}
	response.SusJson(true, r, "排序成功")
}
