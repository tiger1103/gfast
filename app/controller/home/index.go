package home

import (
	"gfast/app/model/admin/cms_news"
	"gfast/app/service/admin/cms_service"
	"gfast/library/response/home"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type Index struct{}

// 首页
func (c *Index) Index(r *ghttp.Request) {
	home.WriteTpl(r, "index.html")
}

// 列表页
func (c *Index) List(r *ghttp.Request) {
	c.listInfo(r)
}

func (c *Index) listInfo(r *ghttp.Request, args ...interface{}) {
	keyWords := r.GetString("keyWords")
	cateId := r.GetInt("cateId")
	pageNum := r.GetInt("page")
	var pageSize int = 6
	total, _, list, err := cms_service.NewsListByPage(&cms_news.ReqListSearchParams{
		CateId:     []int{cateId},
		NewsStatus: "1",
		PageSize:   pageSize,
		PageNum:    pageNum,
		KeyWords:   keyWords,
	})
	if err != nil {
		g.Log().Error(err)
	}
	// 获取当前栏目
	menu, _ := cms_service.GetMenuInfoById(cateId)
	tmp := ""
	if len(args) == 0 {
		tmp = menu.ListTemplate
	} else {
		tmp = "list/list.html"
	}
	home.WriteTpl(r, tmp, g.Map{
		"list":      list,
		"pageStyle": r.GetPage(total, pageSize).GetContent(4),
		"menu":      menu,
		"showPage":  total > pageSize,
		"keyWords":  keyWords,
	})
}

// 内容页
func (c *Index) Show(r *ghttp.Request) {
	//获取栏目ID
	cateIds := r.GetInts("cateIds")
	//文章id
	newsId := r.GetInt64("newsId")
	// 查询文章内容
	res, err := cms_service.GetModelFieldsByCateIds(r, cateIds, newsId) //文章附加字段
	if err != nil {
		g.Log().Error(err)
	}
	// 查询文章信息
	newsInfo, _ := cms_service.GetNewsById(int(newsId))
	newsInfo.NewsHits++
	cms_news.Model.Save(newsInfo)
	if newsInfo.IsJump == 1 {
		//跳转连接
		home.ResponseInstance.Redirect(r, newsInfo.JumpUrl)
		r.Exit()
	}
	cateId := cateIds[0]
	// 获取当前栏目
	menu, _ := cms_service.GetMenuInfoById(cateId)

	home.WriteTpl(r, menu.ContentTemplate, g.Map{
		"content":  res[0],
		"author":   res[1],
		"newsInfo": newsInfo,
		"menu":     menu,
	})
}

func (c *Index) Search(r *ghttp.Request) {
	c.listInfo(r, "search")
}
