package menu_service

import (
	"fmt"
	"gfast/app/model/admin/cms_category"
	"gfast/library/utils"
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

type Menus struct {
	*cms_category.Entity
	Children []*Menus `json:"children"`
}

//获取导出菜单
func GetNav(activeId uint64) (nav string, err error) {
	var menuList []*cms_category.Entity
	menuList, err = cms_category.GetList()
	if err != nil {
		return
	}
	if menuList != nil {
		//剔除隐藏的菜单
		menus := make([]*cms_category.Entity, 0, len(menuList))
		for _, v := range menuList {
			if v.Status == 1 {
				menus = append(menus, v)
			}
		}
		topIds := GetTopPidList(menus)
		topIds.Iterator(func(k int, v int) bool {
			nav += SetTreeMenu(menus, v, activeId, "sf-menu sf-arrows")
			return true
		})
	}
	return
}

//获取菜单树形结构
func SetTreeMenu(menuList []*cms_category.Entity, pid int, activeId uint64, class string) string {
	parentId := gconv.Int64(pid)
	html := fmt.Sprintf(`<ul class="%s">`, class)
	//获取最顶级
	var topMenus g.Map
	menuListMap := make(g.List, len(menuList))
	for k, m := range menuList {
		menuListMap[k] = gconv.Map(m)
	}
	if activeId != 0 {
		topMenus = utils.FindTopParent(menuListMap, gconv.Int64(activeId), "parent_id", "id")
	}
	for k, v := range menuList {
		if v.ParentId == parentId {
			class := ""
			if topMenus != nil && topMenus["id"] == v.Id {
				class = "active"
			} else if activeId == v.Id {
				class = "active"
			} else if activeId == 0 && k == 0 {
				class = "active"
			}
			for _, vv := range menuList {
				if gconv.Uint64(vv.ParentId) == v.Id {
					class += " sf-with-ul"
					break
				}
			}
			url := fmt.Sprintf("/cms/list/%d", v.Id)
			if v.CateType == 3 {
				url = v.CateAddress
			}
			html += fmt.Sprintf(`<li><a href="%s" class="%s">%s</a>`, url, class, v.Name)
			html += SetTreeMenu(menuList, gconv.Int(v.Id), activeId, "sub-menu")
			html += "</li>"
		}
	}
	if html == "<ul>" {
		return ""
	}
	html += "</ul>"
	return html
}

//获取顶级菜单ID
func GetTopPidList(menuList []*cms_category.Entity) (ids *garray.IntArray) {
	ids = garray.NewIntArray()
	for _, v1 := range menuList {
		tag := true
		for _, v2 := range menuList {
			if gconv.Uint64(v1.ParentId) == v2.Id {
				tag = false
				break
			}
		}
		if tag {
			ids.PushRight(gconv.Int(v1.ParentId))
		}
	}
	ids = ids.Unique()
	return
}
