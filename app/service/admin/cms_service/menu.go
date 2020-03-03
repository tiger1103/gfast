package cms_service

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/service/cache_service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

//获取频道列表
func GetMenuListChannel() (list []*cms_category.Entity, err error) {
	listAll, err := GetMenuList()
	if err != nil {
		return
	}
	list = make([]*cms_category.Entity, 0, len(listAll))
	for _, v := range listAll {
		if v.Status == 1 && v.CateType == cms_category.ChannelCateType {
			list = append(list, v)
		}
	}
	return
}

//获取菜单列表
func GetMenuList() (list []*cms_category.Entity, err error) {
	cache := cache_service.New()
	//从缓存获取数据
	iList := cache.Get(cache_service.AdminCmsMenu)
	if iList != nil {
		list = iList.([]*cms_category.Entity)
		return
	}
	list, err = cms_category.Model.Order("list_order ASC,id ASC").All()
	if err != nil {
		g.Log().Error()
		err = gerror.New("获取菜单数据失败")
	}
	//缓存数据
	cache.Set(cache_service.AdminCmsMenu, list, 0, cache_service.AdminCmsTag)
	return
}

//保存栏目操作
func AddSave(req *cms_category.ReqAdd) (id int64, err error) {
	var entity cms_category.Entity
	entity.ParentId = req.ParentId
	entity.CateType = req.CateType
	entity.Status = req.Status
	entity.Name = req.Name
	entity.Description = req.Description
	entity.SeoTitle = req.InputSeoTitle
	entity.SeoKeywords = req.InputSeoKeywords
	entity.SeoDescription = req.InputSeoDescription
	entity.CateAddress = req.CateAddress
	entity.CateContent = req.CateContent
	res, err := entity.Insert()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("保存失败")
		return
	}
	id, err = res.LastInsertId()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("保存失败")
		return
	}
	return
}
