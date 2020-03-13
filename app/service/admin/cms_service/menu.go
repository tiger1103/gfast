package cms_service

import (
	"gfast/app/model/admin/cms_category"
)

//获取频道列表
func GetMenuListChannel() (list []*cms_category.Entity, err error) {
	//获取频道列表
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

//获取可发布文章栏目
func GetPublishableMenuList() (list []*cms_category.Entity, err error) {
	menuList, err := GetMenuList()
	if err != nil {
		return
	}
	list = make([]*cms_category.Entity, 0, len(menuList))
	for _, menu := range menuList {
		if menu.Status == 1 {
			list = append(list, menu)
		}
	}
	return
}

//获取所有菜单列表
func GetMenuList() (list []*cms_category.Entity, err error) {
	return
	//return cms_category.GetList()
}

//保存栏目操作
func AddSave(req *cms_category.ReqAdd) (id int64, err error) {
	return cms_category.AddSave(req)
}

//修改栏目操作
func EditSave(req *cms_category.ReqEdit) (id int64, err error) {
	return cms_category.EditSave(req)
}

//获取搜索栏目结果
func GetMenuListSearch(req *cms_category.ReqSearchList) (menus []*cms_category.Entity, err error) {
	return cms_category.GetListSearch(req)
}

//根据栏目ID获取栏目信息
func GetMenuInfoById(id int) (menu *cms_category.Entity, err error) {
	return cms_category.GetInfoById(id)
}
