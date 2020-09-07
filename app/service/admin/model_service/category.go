package model_service

import (
	"gfast/app/model/admin/model_category"
	"gfast/app/service/cache_service"
)

func GetCategoryList(req *model_category.SearchReq) (total int, list []*model_category.Entity, err error) {
	return model_category.GetList(req)
}

func AddCategory(req *model_category.AddReq) error {
	return model_category.Add(req)
}

func EditCategory(req *model_category.EditReq) error {
	return model_category.Edit(req)
}

func GetCategoryById(id int64) (entity *model_category.Entity, err error) {
	return model_category.GetById(id)
}

func DeleteCategoryByIds(ids []int) error {
	return model_category.DeleteByIds(ids)
}

//获取所有状态正常的模型分类
func GetCategoryAll() (entity []*model_category.Entity, err error) {
	cache := cache_service.New()
	ch := cache.Get("model_category_all")
	if ch != nil {
		entity = ch.([]*model_category.Entity)
		return
	}
	entity, err = model_category.GetCategoryAll()
	if err != nil {
		return
	}
	if entity != nil {
		cache.Set("model_category_all", entity, 0, cache_service.AdminModelTag)
	}
	return
}
