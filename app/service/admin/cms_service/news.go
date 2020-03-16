package cms_service

import (
	"gfast/app/model/admin/cms_news"
)

//添加文章操作
func AddNews(req *cms_news.ReqAddParams, cateIds []int, userId int) (insId []int64, err error) {
	return cms_news.AddNews(req, cateIds, userId)
}
