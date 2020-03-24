package cms_service

import (
	"gfast/app/model/admin/cms_category"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
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
func GetPublishableMenuList(catId ...int) (list g.List, err error) {
	menuList, err := GetMenuList()
	var catIdMap map[int]int
	if len(catId) > 0 {
		catIdMap = make(map[int]int, len(catId))
		for _, v := range catId {
			catIdMap[v] = v
		}
	}
	if err != nil {
		return
	}
	list = make(g.List, 0)
	for _, menu := range menuList {
		if menu.Status == 1 {
			mapMenu := gconv.Map(menu)
			//可发布栏目
			if menu.CateType == cms_category.PublishCateType {
				mapMenu["checkAble"] = true
			} else {
				mapMenu["checkAble"] = false
			}
			if _, ok := catIdMap[gconv.Int(menu.Id)]; ok {
				mapMenu["checked"] = true
			} else {
				mapMenu["checked"] = false
			}
			list = append(list, mapMenu)
		}
	}
	return
}

//获取所有菜单列表
func GetMenuList() (list []*cms_category.Entity, err error) {
	return cms_category.GetList()
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

func DeleteMenuByIds(ids []int) (err error) {
	return cms_category.DeleteByIds(ids)
}
