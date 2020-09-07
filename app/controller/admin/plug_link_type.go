package admin

import (
	"gfast/app/model/admin/plug_linktype"
	"gfast/app/service/admin/plug_link_service"
	"gfast/library/response"
	"github.com/gogf/gf/errors/gerror"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

type LinkType struct{}

// 添加栏目
func (c *LinkType) Add(r *ghttp.Request) {
	// 判断提交方式
	if r.Method == "POST" {
		// 定义req来保存请求参数
		var req *plug_linktype.AddReq
		// 解析req获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		// 调用添加的方法添加栏目
		err = plug_link_service.AddSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功!")
	}
}

// 删除栏目
func (c *LinkType) Delete(r *ghttp.Request) {
	// 获取要删除的栏目ID切片
	ids := r.GetInts("linkTypeID")
	if len(ids) == 0 {
		response.FailJson(true, r, "ID获取失败,删除失败")
	}
	err := plug_link_service.DeleteLinkTypeByID(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

// 修改栏目
func (c *LinkType) Edit(r *ghttp.Request) {
	// 如果不是POST提交的请求,则说明是第一次发送修改请求,需到修改页面查出要修改记录信息
	if r.Method == "POST" {
		var req *plug_linktype.EditReq
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = plug_link_service.EditSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改栏目成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("linkTypeID")
	params, err := plug_link_service.GetLinkTypeByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// 友情链接栏目列表
func (c *LinkType) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *plug_linktype.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	total, page, list, err := plug_link_service.SelectListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "栏目列表", result)
}

//栏目排序
func (c *LinkType) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "排序失败")
	}
	var err error
	for k, v := range s {
		_, err = plug_linktype.Model.Where("linktype_id=?", k).Data("linktype_order", v).Update()
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
	}
	response.SusJson(true, r, "排序成功")
}

// 查询所有分类名和对应id
func (c *LinkType) Type(r *ghttp.Request) {
	res, err := plug_linktype.Model.FindAll()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询所有分类列表失败!")
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "分类列表", res)
}
