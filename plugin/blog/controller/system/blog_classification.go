package system

import (
	"gfast/app/service/cache_service"
	"gfast/library/response"
	"gfast/plugin/blog/model/blog_classification"
	"gfast/plugin/blog/service/blog_service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

// 简单博客管理-分类管理
type BlogClassification struct{}

func (c *BlogClassification) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *blog_classification.AddReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		// 调用service中的添加函数添加广告位
		err = blog_service.AddClassificationSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		cache_service.New().RemoveByTag(cache_service.AdminBlogTag)
		response.SusJson(true, r, "添加成功!")
	}
	//获取上级分类(频道)
	menus, err := blog_service.GetMenuListChannel()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"parentList": menus,
	}
	response.SusJson(true, r, "添加栏目", res)
}

func (c *BlogClassification) Delete(r *ghttp.Request) {
	// 从页面获取要删除记录的 ID int切片
	ids := r.GetInts("classificationId")
	if len(ids) == 0 {
		response.FailJson(true, r, "ID获取失败，删除失败")
	}
	err := blog_service.DeleteClassificationByIds(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	cache_service.New().RemoveByTag(cache_service.AdminBlogTag)
	response.SusJson(true, r, "删除成功")
}

func (c *BlogClassification) Edit(r *ghttp.Request) {
	// 如果是post提交的请求就执行修改操作
	if r.Method == "POST" {
		var editReq *blog_classification.EditReq
		// 通过Parse方法解析获取参数
		err := r.Parse(&editReq)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = blog_service.EditClassificationSave(editReq)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		cache_service.New().RemoveByTag(cache_service.AdminBlogTag)
		response.SusJson(true, r, "修改参数成功")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("classificationId")
	params, err := blog_service.GetClassificationByID(int64(id))
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//获取上级分类(频道)
	menus, err := blog_service.GetMenuListChannel()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"params":     params,
		"parentList": menus,
	}
	response.SusJson(true, r, "ok", res)
}

func (c *BlogClassification) List(r *ghttp.Request) {
	// 定义一个结构体存储请求参数
	var req *blog_classification.SelectPageReq
	// 获取参数
	err := r.Parse(&req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	total, page, list, err := blog_service.SelectClassificationListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	response.SusJson(true, r, "日志分类列表", result)
}

func (c *BlogClassification) Sort(r *ghttp.Request) {
	sorts := r.Get("sorts")
	s := gconv.Map(sorts)
	if s == nil {
		response.FailJson(true, r, "获取记录id、序号失败")
	}
	var err error
	for k, v := range s {
		_, err = blog_classification.Model.Where("classification_id=?", k).Data("classification_sort", v).Update()
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
	}
	cache_service.New().RemoveByTag(cache_service.AdminBlogTag)
	response.SusJson(true, r, "排序成功")
}

// 查询所有分类名称和对应id
func (c *BlogClassification) Type(r *ghttp.Request) {
	res, err := blog_classification.Model.FindAll()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询所有分类名称失败!")
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "分类名称列表", res)
}
