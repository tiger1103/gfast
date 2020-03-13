package cms_category

import (
	"gfast/app/service/cache_service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

// Fill with you ideas below.
const (
	ChannelCateType = 1 //频道类型
	PublishCateType = 2 //可发布栏目
	JumpCateType    = 3 //跳转栏目
	SingleCateType  = 4 //单页栏目
)

//列表搜索参数
type ReqSearchList struct {
	Name string `p:"name"`
}

//添加请求参数
type ReqAdd struct {
	ParentId            int64  `p:"parent_id" v:"integer|min:0#父级ID不能为空|父级ID必须为大于等于0的整数"`
	Name                string `p:"name" v:"required#栏目名称不能为空"`
	Alias               string `p:"alias"`
	CateType            uint   `p:"cate_type" v:"required|in:1,2,3,4#请选择栏目类型|栏目类型只能在1-4之间"`
	Description         string `p:"description"`
	Thumbnail           string `p:"thumbnail"`
	InputSeoTitle       string `p:"input_seo_title"`
	InputSeoKeywords    string `p:"input_seo_keywords"`
	InputSeoDescription string `p:"input_seo_description"`
	Status              uint   `p:"status" v:"in:0,1#状态只能包含0或1"`
	CateAddress         string `p:"cate_address"`
	CateContent         string `p:"content"`
}

//修改请求参数
type ReqEdit struct {
	Id int `p:"id" v:"required|min:1#栏目id不能为空|栏目id参数错误"`
	ReqAdd
}

//获取所有菜单列表
func GetList() (list []*Entity, err error) {
	cache := cache_service.New()
	//从缓存获取数据
	iList := cache.Get(cache_service.AdminCmsMenu)
	if iList != nil {
		list = iList.([]*Entity)
		return
	}
	list, err = Model.Order("list_order ASC,id ASC").All()
	if err != nil {
		g.Log().Error()
		err = gerror.New("获取菜单数据失败")
		return
	}
	//缓存数据
	cache.Set(cache_service.AdminCmsMenu, list, 0, cache_service.AdminCmsTag)
	return
}

//保存栏目操作
func AddSave(req *ReqAdd) (id int64, err error) {
	var entity Entity
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

//根据栏目ID获取栏目信息
func GetInfoById(id int) (menu *Entity, err error) {
	menus, err := GetList()
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

//修改栏目操作
func EditSave(req *ReqEdit) (id int64, err error) {
	entity, err := GetInfoById(req.Id)
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
func GetListSearch(req *ReqSearchList) (menus []*Entity, err error) {
	menus, err = GetList()
	if req != nil {
		searchMenus := make([]*Entity, 0, len(menus))
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
