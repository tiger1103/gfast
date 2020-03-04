package cms_service

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/service/cache_service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
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

//获取所有菜单列表
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

//修改栏目操作
func EditSave(req *cms_category.ReqEdit) (id int64, err error) {
	entity, err := GetMenuInfoById(req.Id)
	if err != nil {
		return
	}
	if entity == nil {
		err = gerror.New("栏目信息不存在")
		return
	}
	entity.Id = gconv.Uint64(req.Id)
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
	res, err := entity.Update()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("修改保存失败")
		return
	}
	id, err = res.RowsAffected()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("修改保存失败")
		return
	}
	return
}

//获取搜索栏目结果
func GetMenuListSearch(req *cms_category.ReqSearchList) (menus []*cms_category.Entity, err error) {
	menus, err = GetMenuList()
	if req != nil {
		searchMenus := make([]*cms_category.Entity, 0, len(menus))
		if req.Name != "" {
			for _, entity := range menus {
				if gstr.Contains(entity.Name, req.Name) {
					searchMenus = append(searchMenus, entity)
				}
			}
		}
		menus = searchMenus
	}
	return
}

//根据栏目ID获取栏目信息
func GetMenuInfoById(id int) (menu *cms_category.Entity, err error) {
	menus, err := GetMenuList()
	if err != nil {
		return
	}
	for _, entity := range menus {
		if entity.Id == gconv.Uint64(id) {
			menu = entity
			break
		}
	}
	return
}
