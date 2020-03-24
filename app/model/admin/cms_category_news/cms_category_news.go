package cms_category_news

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// Fill with you ideas below.

//通过文章id获取栏目关联信息
func GetCategoriesByNewsId(newsId uint64) (cateNews []*Entity, err error) {
	cateNews, err = Model.FindAll("news_id", newsId)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取栏目文章关联信息失败")
	}
	return
}
