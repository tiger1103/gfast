package cms_service

import (
	"gfast/app/model/admin/cms_category"
	"gfast/app/model/admin/model_fields"
	"gfast/app/service/common/com_model_service"
	"gfast/library/utils"
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gfile"
	"github.com/gogf/gf/text/gstr"
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
func GetPublishableMenuList(catId ...int) (list []*cms_category.Entity, err error) {
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
	for _, menu := range menuList {
		if menu.CateType == cms_category.JumpCateType || menu.CateType == cms_category.SingleCateType {
			continue
		}
		if menu.Status == 1 {
			list = append(list, menu)
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

//通过栏目ID获取子级栏目ID
func GetChildrenIds(ids []int) ([]int, error) {
	//获取所有栏目
	menus, err := GetMenuList()
	if err != nil {
		return nil, err
	}
	menuList := make(g.List, len(menus))
	for k, menu := range menus {
		menuList[k] = gconv.Map(menu)
	}
	for _, id := range ids {
		children := utils.FindSonByParentId(menuList, id, "parent_id", "id")
		for _, cid := range children {
			ids = append(ids, gconv.Int(cid["id"]))
		}
	}
	return ids, nil
}

//删除栏目
func DeleteMenuByIds(ids []int) (err error) {
	ids, err = GetChildrenIds(ids)
	if err != nil {
		return
	}
	return cms_category.DeleteByIds(ids)
}

//获取栏目对应的模型字段规则
func GetModelFieldsByCateIds(r *ghttp.Request, ids []int, newsId int64) (rules []*model_fields.FieldRule, err error) {
	var modelId uint
	modelId, err = GetModelIdByCateIds(ids)
	if err != nil {
		return
	}
	//获取模型字段信息
	rules, err = com_model_service.GetModelRuleByModelId(r, gconv.Int64(modelId), newsId)
	if err != nil {
		return
	}
	return
}

//通过栏目ids获取模型id
func GetModelIdByCateIds(ids []int) (modelId uint, err error) {
	ids, err = GetChildrenIds(ids)
	if err != nil {
		return
	}
	idsArr := garray.NewIntArrayFrom(ids)
	menus, err := GetMenuList()
	if err != nil {
		return
	}
	for _, menu := range menus {
		if idsArr.Contains(gconv.Int(menu.Id)) {
			if modelId == 0 {
				modelId = menu.ModelId
			} else if modelId != menu.ModelId {
				err = gerror.New("所选多个栏目必须为同一模型。")
				return
			}
		}
	}
	//不存在管理的模型
	if modelId == 0 {
		err = gerror.New("未获取到对应模型信息")
		return
	}
	return
}

//获取分类模板
func GetCmsTemplate() ([]string, []string) {
	pathArr := g.Cfg().GetArray("viewer.paths")
	var listTemplates []string
	var contentTemplates []string
	for _, p := range pathArr {
		path := gconv.String(p) + "/cms"
		if gfile.IsDir(path) {
			path = gfile.Abs(path)
			cmsPath, _ := gfile.ScanDirFile(path, "*", true)
			for _, cp := range cmsPath {
				if gstr.ContainsI(cp, "list") {
					listTemplates = append(listTemplates, gstr.TrimLeft(gstr.ReplaceByArray(cp, []string{path, "", "\\", "/"}), "/"))
				} else if gstr.ContainsI(cp, "content") {
					contentTemplates = append(contentTemplates, gstr.TrimLeft(gstr.ReplaceByArray(cp, []string{path, "", "\\", "/"}), "/"))
				}
			}
		}
	}
	return listTemplates, contentTemplates
}
