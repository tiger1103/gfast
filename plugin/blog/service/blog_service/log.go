package blog_service

import (
	"gfast/plugin/blog/model/blog_log"
)

// 添加
func AddLogSave(req *blog_log.AddReq) error {
	return blog_log.AddSave(req)
}

// 删除
func DeleteLogByIDs(Ids []int) error {
	return blog_log.DeleteByIDs(Ids)
}

//修改
func EditLogSave(editReq *blog_log.EditReq) error {
	return blog_log.EditSave(editReq)
}

// 根据ID查询
func GetLogByID(id int64) (*blog_log.ListEntity, error) {
	return blog_log.GetLogByID(id)
}

// 分页查询日志
func SelectLogListByPage(req *blog_log.SelectPageReq) (total int, page int64, list []*blog_log.ListEntity, err error) {
	return blog_log.SelectListByPage(req)
}

// 按时间倒序查询size篇标志为sign分类id为typeId,状态为status的文章,标志值0.一般,1.置顶,2.幻灯,3.推荐,typeId等于0时不区分分类
func FindSizeArticleBySign(size int, status int, sign int, typeId int) ([]*blog_log.ListEntity, error) {
	return blog_log.FindSizeArticleBySign(size, status, sign, typeId)
}

// 按时间倒序查询size篇分类id为typeId,状态为status的文章,typeId等于0时不区分分类
func FindSizeArticle(size int, status int, typeId int) (list []*blog_log.ListEntity, err error) {
	return blog_log.FindSizeArticle(size, status, typeId)
}

// 查询size篇文章并根据点击数排序
func FindArticleByHits(size int, status int) ([]*blog_log.Entity, error) {
	return blog_log.FindArticleByHits(size, status)
}
