package home

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/model/admin/cms_category_news"
	"gfast/app/model/admin/cms_news"
	"gfast/app/service/admin/cms_service"
	"gfast/app/service/home/menu_service"
	"gfast/app/service/home/news_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/container/gvar"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gview"
	"github.com/gogf/gf/util/gconv"
)

type Response struct {
	*response.Response
}

var ResponseInstance Response

func WriteTpl(r *ghttp.Request, tpl string, params ...gview.Params) error {
	return ResponseInstance.WriteTpl(r, tpl, params...)
}

func (res *Response) WriteTpl(r *ghttp.Request, tpl string, params ...gview.Params) error {
	v := g.View()
	v.SetPath("template/cms")
	//绑定模板中需要用到的方法
	v.BindFuncMap(g.Map{
		//获取导航菜单列表
		"GetNav": func(activeId uint64) string {
			nav, err := menu_service.GetNav(activeId)
			if err != nil {
				g.Log().Error(err)
			}
			return nav
		},
		//获取文章调用参数
		"GetNewsParams": func(args interface{}) *cms_news.ReqListSearchParams {
			params := new(cms_news.ReqListSearchParams)
			err := gconv.Struct(args, params)
			if err != nil {
				g.Log().Error(err)
			}
			return params
		},
		//设置文章参数
		"SetNewsParams": func(params g.Map, key string, value interface{}) g.Map {
			data := g.Map{}
			if params != nil {
				for k, v := range params {
					data[k] = v
				}
			}
			data[key] = value
			return data
		},
		//获取文章列表
		"GetNewsList": func(cateId int, pageSize int, attr ...*cms_news.ReqListSearchParams) []*cms_news.NewsList {
			list, err := news_service.GetNewsList(cateId, pageSize, attr...)
			if err != nil {
				g.Log().Error(err)
			}
			return list
		},
		//
		"GetVarsValue": func(val *gvar.Var) map[string]string {
			return val.MapStrStr()
		},
		//获取栏目面包树
		"GetMenuBreadTree": func(menu *cms_category.Entity) g.List {
			// 获取所有栏目
			menus, err := cms_service.GetMenuList()
			if err != nil {
				g.Log().Error(err)
			}
			menuList := make(g.List, len(menus))
			for k, m := range menus {
				menuList[k] = gconv.Map(m)
			}
			breadMenus := utils.FindParentBySonPid(menuList, gconv.Int(menu.Id), "filter", "parent_id", nil, "id")
			//获取最顶级
			var topMenus g.Map
			if menu != nil {
				topMenus = utils.FindTopParent(menuList, gconv.Int64(menu.Id), "parent_id", "id")
			}
			breadMenus = utils.ParentSonSort(breadMenus, topMenus["parent_id"], 1, "parent_id")
			return breadMenus
		},
		"getArticleCateId": func(cateList *gvar.Var) int {
			val := gconv.Map(cateList.Val())
			for index, _ := range val {
				return gconv.Int(index)
			}
			return 0
		},
		"isSon": func(id, menus interface{}) bool {
			i := gconv.Int(id)
			m := gconv.SliceMap(menus)
			for _, v := range m {
				if gconv.Int(v["parent_id"]) == i {
					return true
				}
			}
			return false
		},
		"getThumb": func(more interface{}) string {
			m := gconv.Map(more)
			m1 := gconv.String(m["thumb"])
			return m1
		},
		// 通过文章id获取所属栏目id
		"getCateIdByArticleId": func(articleId interface{}) int {
			aid := gconv.Uint64(articleId)
			cateIds, _ := cms_category_news.GetCheckedCategoryIdByNewsId(aid)
			return cateIds[0]
		},
		// 取出视频格式
		"getVideoFormat": func(videoName interface{}) string {
			data := []byte(gconv.String(videoName))
			var data2 []byte
			for i := len(data) - 3; i < len(data); i++ {
				data2 = append(data2, data[i])
			}
			videoFormat := string(data2)
			return videoFormat
		},
	})
	//文章参数
	params = append(params, g.Map{"newsParams": g.Map{}})
	return res.Response.WriteTpl(r, tpl, v, params...)
}
