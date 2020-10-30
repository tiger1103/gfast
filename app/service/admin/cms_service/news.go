package cms_service

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/model/admin/cms_category_news"
	"gfast/app/model/admin/cms_news"
	"gfast/app/service/common/com_model_service"
	"gfast/library/utils"
	"github.com/gogf/gf/container/gvar"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

//添加文章操作
func AddNews(req *cms_news.ReqAddParams, cateIds []int, userId uint64) (insId int64, err error) {
	cateIds, err = getPubCateIds(cateIds)
	if err != nil {
		return
	}
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("添加事务开启失败")
		return
	}
	insId, err = cms_news.AddNews(req, cateIds, userId, tx)
	if err != nil {
		tx.Rollback()
		return
	}
	//保存文章模型字段数据
	err = handlePostData(cateIds, insId, req.ModelForm, tx, false)
	if err != nil {
		tx.Rollback()
		return
	}
	tx.Commit()
	return
}

//修改文章操作
func EditNews(req *cms_news.ReqEditParams, cateIds []int) (err error) {
	cateIds, err = getPubCateIds(cateIds)
	if err != nil {
		return
	}
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("开启事务失败")
		return
	}
	err = cms_news.EditNews(req, cateIds, tx)
	if err != nil {
		tx.Rollback()
		return
	}
	//保存模型字段数据
	err = handlePostData(cateIds, gconv.Int64(req.Id), req.ModelForm, tx, true)
	if err != nil {
		tx.Rollback()
		return
	}
	tx.Commit()
	return
}

func getPubCateIds(cateIds []int) ([]int, error) {
	//获取所有栏目
	menuList, err := GetMenuList()
	if err != nil {
		return nil, err
	}
	pubCateIds := make([]int, 0, len(menuList))
	if len(cateIds) > 0 {
		//查询可发布栏目id
		menuListSlice := gconv.SliceMap(menuList)
		for _, cid := range cateIds {
			for _, entity := range menuList {
				if gconv.Int(entity.Id) == cid && entity.CateType == cms_category.PublishCateType {
					pubCateIds = append(pubCateIds, cid)
				}
			}
			mList := make([]*cms_category.Entity, 0)
			sonList := utils.FindSonByParentId(menuListSlice, cid, "parent_id", "id")
			gconv.Structs(sonList, &mList)
			for _, v := range mList {
				if v.CateType == cms_category.PublishCateType {
					pubCateIds = append(pubCateIds, gconv.Int(v.Id))
				}
			}
		}
		if len(pubCateIds) == 0 {
			return nil, gerror.New("所选栏目不存在可发布文章的栏目")
		}
		return pubCateIds, nil
	} else {
		return nil, gerror.New("所属栏目不能为空")
	}
}

//文章列表查询
func NewsListByPage(req *cms_news.ReqListSearchParams) (total, page int, list []*cms_news.NewsList, err error) {
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
		cateIds, err = GetCheckedCategoryIdByNewsId(gconv.Uint64(v.Id))
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
		v.CateList = cateVal
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

//删除文章数据
func DeleteCmsByIds(ids []int) (err error) {
	var tx *gdb.TX
	tx, err = g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("开启事务失败")
		return
	}
	//获取对应文章模型ID
	for _, id := range ids {
		var cateNews []*cms_category_news.Entity
		cateNews, err = GetCategoriesByNewsId(gconv.Uint64(id))
		if err != nil {
			return
		}
		for _, cn := range cateNews {
			var cateInfo *cms_category.Entity
			cateInfo, err = GetMenuInfoById(gconv.Int(cn.CategoryId))
			if err != nil {
				return
			}
			//删除模型字段数据
			err = com_model_service.DeleteModelFieldData(gconv.Int64(cateInfo.ModelId), gconv.Int64(id), tx)
			if err != nil {
				tx.Rollback()
				return
			}
		}
	}
	err = cms_news.DeleteByIds(ids, tx)
	if err != nil {
		tx.Rollback()
	}
	tx.Commit()
	return
}

//处理模型数据
func handlePostData(cateIds []int, insId int64, modelForm g.Map, tx *gdb.TX, isUpdate bool) error {
	modelId, err := GetModelIdByCateIds(cateIds)
	if err != nil {
		return err
	}
	//保存模型数据
	return com_model_service.HandlePostData(gconv.Int64(modelId), modelForm, insId, tx, isUpdate)
}
