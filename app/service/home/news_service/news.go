package news_service

import (
	"gfast/app/model/admin/cms_news"
	"gfast/app/service/admin/cms_service"
	"github.com/gogf/gf/frame/g"
)

func GetNewsList(cateId int, pageSize int, attr ...*cms_news.ReqListSearchParams) (list []*cms_news.NewsList, err error) {
	var cateIds []int
	if cateId != 0 {
		cateIds = append(cateIds, cateId)
	}
	var req *cms_news.ReqListSearchParams
	if len(attr) > 0 {
		req = attr[0]
	} else {
		req = &cms_news.ReqListSearchParams{}
	}
	req.CateId = cateIds
	req.PageSize = pageSize
	req.NewsStatus = "1"
	_, _, list, err = cms_service.NewsListByPage(req)
	if err != nil {
		g.Log().Error(err)
	}
	return list, err
}
