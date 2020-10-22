package admin

import (
	"gfast/app/model/admin/plug_link"
	"gfast/app/service/admin/plug_link_service"
	"gfast/library/response"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

type PlugLink struct{}

// 添加链接
func (c *PlugLink) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *plug_link.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		// 调用service中的添加函数添加链接
		err = plug_link_service.AddSavePlugLink(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功!")
	}
}

// 批量删除链接
func (c *PlugLink) Delete(r *ghttp.Request) {
	ids := r.GetInts("plugLinkID")
	if len(ids) == 0 {
		response.FailJson(true, r, "ID获取失败，删除失败")
	}
	err := plug_link_service.DeleteByIDs(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

// 修改链接
func (c *PlugLink) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *plug_link.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = plug_link_service.EditPlugLinkSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改链接成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("plugLinkID")
	params, err := plug_link_service.GetPlugLinkByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// 友情链接列表
func (c *PlugLink) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *plug_link.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	total, page, list, err := plug_link_service.SelectPlugLinkListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "链接列表", result)
}

// 链接排序
func (c *PlugLink) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "获取记录id、序号失败")
	}
	var err error
	for k, v := range s {
		_, err = plug_link.Model.Where("link_id=?", k).Data("link_order", v).Update()
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
	}
	response.SusJson(true, r, "排序成功")
}
