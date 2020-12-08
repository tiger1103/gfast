package home

import (
	"gfast/app/model/admin/plug_link"
	"gfast/app/service/admin/plug_link_service"
	"gfast/app/service/admin/plug_service"
	"gfast/library/response"
	"gfast/library/response/plugin/blog"
	"gfast/plugin/blog/model/blog_classification"
	"gfast/plugin/blog/model/blog_comment"
	"gfast/plugin/blog/model/blog_log"
	"gfast/plugin/blog/service/blog_service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type Index struct{}

type Classification struct {
	*blog_classification.Entity
	Children []*Classification
}

// 首页
func (c *Index) Index(r *ghttp.Request) {
	// 查询文章列表
	var req = new(blog_log.SelectPageReq)
	req.PageSize = 8
	req.Status = 1
	_, _, logList, err := blog_service.SelectLogListByPage(req)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询3篇置顶文章列表
	topList, err := blog_service.FindSizeArticleBySign(3, 1, 1, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询3篇幻灯
	slideList, err := blog_service.FindSizeArticleBySign(3, 1, 2, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询10篇根据点击数排序的文章用于排行榜
	hitsList, err := blog_service.FindArticleByHits(10, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询友情链接
	linkList, err := plug_link_service.ListByTypeId(13, 6, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询赞助分类
	coffeeArticle, err := plug_service.GetSizeAd(2, 1, 21)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询推荐文章
	recommendList, err := blog_service.FindSizeArticleBySign(4, 1, 3, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询最新文章
	newList, err := blog_service.FindSizeArticleBySign(4, 1, 0, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询所有状态为正常的分类
	classificationList, err := blog_service.FindAllList()
	if err != nil {
		g.Log().Error(err)
	}
	classifications := getClassificationgList(classificationList, 0)
	blog.Response(r, "homePage.html", g.Map{
		"logList":            logList,
		"topList":            topList,
		"slideList":          slideList,
		"hitsList":           hitsList,
		"linkList":           linkList,
		"coffeeArticle":      coffeeArticle,
		"recommendList":      recommendList,
		"newList":            newList,
		"classificationList": classifications,
	})
}

func getClassificationgList(classificationList []*blog_classification.Entity, pid uint) (cList []*Classification) {
	cList = make([]*Classification, 0, len(classificationList))
	for _, c1 := range classificationList {
		var cl *Classification
		if c1.ClassificationPid == pid {
			cl = &Classification{Entity: c1}
			cl.Children = getClassificationgList(classificationList, c1.ClassificationId)
			cList = append(cList, cl)
		}
	}
	return
}

// 分类、搜索
func (c *Index) BlogList(r *ghttp.Request) {
	// 根据条件查询当前分类下的文章
	var req = new(blog_log.SelectPageReq)
	req.PageNum = r.GetInt64("page")
	pageSize := 10
	req.PageSize = int64(pageSize)
	req.LogTitle = r.GetString("keyboard")
	req.Status = 1
	cateId := r.GetInt("cateId")
	req.CateTypeId = cateId
	total, _, list, err := blog_service.SelectLogListByPage(req)
	if err != nil {
		g.Log().Error(err)
	}
	// 根据分类id查询分类(分类名用于导航)
	classification, err := blog_service.GetClassificationByID(int64(cateId))
	if err != nil {
		g.Log().Error(err)
	}
	// 以下为右边侧栏所需数据
	// 查询10篇根据点击数排序的文章用于排行榜
	hitsList, err := blog_service.FindArticleByHits(10, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询友情链接
	linkList, err := plug_link_service.ListByTypeId(13, 6, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询赞助分类
	coffeeArticle, err := plug_service.GetSizeAd(2, 1, 21)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询推荐文章
	recommendList, err := blog_service.FindSizeArticleBySign(4, 1, 3, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询最新文章
	newList, err := blog_service.FindSizeArticleBySign(4, 1, 0, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询所有状态为正常的分类
	classificationList, err := blog_service.FindAllList()
	if err != nil {
		g.Log().Error(err)
	}
	classifications := getClassificationgList(classificationList, 0)
	tplData := g.Map{
		"list":               list,
		"pageStyle":          r.GetPage(total, pageSize).GetContent(3),
		"classificationList": classifications,
		"hitsList":           hitsList,
		"linkList":           linkList,
		"coffeeArticle":      coffeeArticle,
		"recommendList":      recommendList,
		"newList":            newList,
		"classification":     classification,
	}
	if classification != nil && classification.ClassificationType == 4 {
		//单页
		blog.Response(r, "content.html", tplData)
	} else {
		blog.Response(r, "blogList.html", tplData)
	}
}

// 内容页面(关于博主)
func (c *Index) Content(r *ghttp.Request) {
	logId := r.GetInt("logId")
	// 根据id查询对应博客日志
	log, err := blog_service.GetLogByID(int64(logId))
	if err != nil {
		g.Log().Error(err)
	}
	// 更新点击数
	log.LogHits += 1
	blog_log.Model.Save(log)
	if log.LogUrl != "" {
		//跳转连接
		r.Response.RedirectTo(log.LogUrl)
		r.Exit()
	}
	// 查询4篇相关文章(同一分类下最新的4篇)
	relevantList, err := blog_service.FindSizeArticle(4, 1, log.LogType)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询10篇根据点击数排序的文章用于排行榜
	hitsList, err := blog_service.FindArticleByHits(10, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询友情链接
	linkList, err := plug_link_service.ListByTypeId(13, 6, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询赞助分类
	coffeeArticle, err := plug_service.GetSizeAd(2, 1, 21)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询推荐文章
	recommendList, err := blog_service.FindSizeArticleBySign(4, 1, 3, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询最新文章
	newList, err := blog_service.FindSizeArticleBySign(4, 1, 0, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询所有状态为正常的分类
	classificationList, err := blog_service.FindAllList()
	if err != nil {
		g.Log().Error(err)
	}
	classifications := getClassificationgList(classificationList, 0)
	// 查询当前日志的未停用评论
	req := new(blog_comment.SelectPageReq)
	req.Status = "1"
	req.PageSize = 5
	req.Flag = 1
	req.PageNum = r.GetInt64("page")
	req.CommentLogIds = append(req.CommentLogIds, logId)
	total, _, commentList, err := blog_service.SelectCommentListByPage(req) // 分页查询一级评论
	commentList, err = blog_service.GetChildren(commentList)                // 查出二级评论(回复)
	blog.Response(r, "content.html", g.Map{
		"classificationList": classifications,
		"log":                log,
		"hitsList":           hitsList,
		"linkList":           linkList,
		"coffeeArticle":      coffeeArticle,
		"recommendList":      recommendList,
		"newList":            newList,
		"pageStyle":          r.GetPage(total, int(req.PageSize)).GetContent(3),
		"commentList":        commentList,
		"relevantList":       relevantList,
	})
}

// 新增评论
func (c *Index) AddComment(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *blog_comment.AddReq
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = blog_service.AddCommentSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功")
	}
}

// 友情链接申请
func (c *Index) Link(r *ghttp.Request) {
	// 查询10篇根据点击数排序的文章用于排行榜
	hitsList, err := blog_service.FindArticleByHits(10, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询友情链接
	linkList, err := plug_link_service.ListByTypeId(13, 6, 1)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询赞助分类
	coffeeArticle, err := plug_service.GetSizeAd(2, 1, 21)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询推荐文章
	recommendList, err := blog_service.FindSizeArticleBySign(4, 1, 3, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询最新文章
	newList, err := blog_service.FindSizeArticleBySign(4, 1, 0, 0)
	if err != nil {
		g.Log().Error(err)
	}
	// 查询所有状态为正常的分类
	classificationList, err := blog_service.FindAllList()
	if err != nil {
		g.Log().Error(err)
	}
	classifications := getClassificationgList(classificationList, 0)
	blog.Response(r, "link.html", g.Map{
		"classificationList": classifications,
		"hitsList":           hitsList,
		"linkList":           linkList,
		"coffeeArticle":      coffeeArticle,
		"recommendList":      recommendList,
		"newList":            newList,
	})
}

// 添加申请友情链接
func (c *Index) AddLink(r *ghttp.Request) {
	if r.Method == "POST" {
		var req = new(plug_link.AddReq)
		err := r.Parse(req)
		req.LinkOpen = 0
		req.LinkTarget = "_blank"
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = plug_link_service.AddSavePlugLink(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "提交成功")
	}
}
