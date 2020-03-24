package cms_service

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/model/admin/cms_category_news"
	"gfast/app/model/admin/cms_news"
	"gfast/library/utils"
	"github.com/gogf/gf/container/gvar"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/util/gconv"
)

//添加文章操作
func AddNews(req *cms_news.ReqAddParams, cateIds []int, userId int) (insId int64, err error) {
	return cms_news.AddNews(req, cateIds, userId)
}

//修改文章操作
func EditNews(req *cms_news.ReqEditParams, cateIds []int) (err error) {
	return cms_news.EditNews(req, cateIds)
}

//文章列表查询
func NewsListByPage(req *cms_news.ReqListSearchParams) (total, page int, list gdb.Result, err error) {
	var menuList []*cms_category.Entity
	//获取所有栏目
	menuList, err = GetMenuList()
	if err != nil {
		return
	}
	if len(req.CateId) > 0 {
		//查询可发布栏目id
		menuListSlice := gconv.SliceMap(menuList)
		cateIds := req.CateId
		for _, cid := range cateIds {
			mList := make([]*cms_category.Entity, 0)
			sonList := utils.FindSonByParentId(menuListSlice, cid, "parent_id", "id")
			gconv.Structs(sonList, &mList)
			for _, v := range mList {
				if v.CateType == cms_category.PublishCateType {
					req.CateId = append(req.CateId, gconv.Int(v.Id))
				}
			}
		}
	}
	total, page, list, err = cms_news.ListByPage(req)
	if err != nil || len(list) == 0 {
		return
	}
	//匹配文章所属栏目
	var cateIds []int
	for _, v := range list {
		cateIds, err = GetCheckedCategoryIdByNewsId(gconv.Uint64(v["id"]))
		if err != nil {
			return
		}
		cateNameList := make(map[int]string)
		for _, menu := range menuList {
			for _, cateId := range cateIds {
				if menu.Id == gconv.Uint64(cateId) {
					cateNameList[cateId] = menu.Name
				}
			}
		}
		cateVal := new(gvar.Var)
		if len(cateNameList) > 0 {
			cateVal.Set(cateNameList)
		}
		v["cateList"] = cateVal
	}
	return
}

//通过id获取文章信息
func GetNewsById(id int) (news *cms_news.Entity, err error) {
	return cms_news.GetById(id)
}

//通过文章id获取关联的栏目id
func GetCheckedCategoryIdByNewsId(newsId uint64) (catIds []int, err error) {
	categories, err := GetCategoriesByNewsId(newsId)
	if err != nil {
		return
	}
	catIds = make([]int, len(categories))
	for k, v := range categories {
		catIds[k] = gconv.Int(v.CategoryId)
	}
	return
}

//通过文章id获取关联栏目信息
func GetCategoriesByNewsId(newsId uint64) (categories []*cms_category_news.Entity, err error) {
	return cms_category_news.GetCategoriesByNewsId(newsId)
}

func DeleteCmsByIds(ids []int) (err error) {
	return cms_news.DeleteByIds(ids)
}
