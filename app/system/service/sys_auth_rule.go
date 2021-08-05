package service

import (
	"gfast/app/common/global"
	"gfast/app/common/service"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"github.com/gogf/gf/frame/gmvc"
	"github.com/gogf/gf/util/gconv"
)

type rule struct {
}

var Rule = new(rule)

// GetIsMenuStatusList 获取isMenu=0|1且status=1的菜单列表
func (s *rule) GetIsMenuStatusList() ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList()
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if (v.MenuType == 0 || v.MenuType == 1) && v.Status == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

//获取所有菜单
func (s *rule) GetMenuList() (list []*model.SysAuthRuleInfoRes, err error) {
	cache := service.Cache.New()
	//从缓存获取
	iList := cache.Get(global.SysAuthMenu)
	if iList != nil {
		err = gconv.Struct(iList, &list)
		return
	}
	//从数据库获取
	list, err = dao.SysAuthRule.GetMenuList()
	if err != nil || list == nil {
		return
	}
	//缓存菜单
	cache.Set(global.SysAuthMenu, list, 0, global.SysAuthTag)
	return
}

func (s *rule) GetMenuListSearch(req *model.SysAuthRuleReqSearch) (list []*model.SysAuthRuleInfoRes, err error) {
	list, err = dao.SysAuthRule.Scope(func(m gmvc.M) gmvc.M {
		if req != nil && !req.IsEmpty() {
			if req.Title != "" {
				m = m.Where("title like ?", "%"+req.Title+"%")
			}

			if req.Status != "" {
				m = m.Where("status = ?", req.Status)
			}
		}
		return m
	}).GetMenuList()
	if err != nil || list == nil {
		return
	}
	return
}

func (s *rule) GetMenuListTree(pid uint, list []*model.SysAuthRuleInfoRes) []*model.SysAuthRuleTreeRes {
	tree := make([]*model.SysAuthRuleTreeRes, 0, len(list))
	for _, menu := range list {
		if menu.Pid == pid {
			t := &model.SysAuthRuleTreeRes{
				SysAuthRuleInfoRes: menu,
			}
			child := s.GetMenuListTree(menu.Id, list)
			if child != nil {
				t.Children = child
			}
			tree = append(tree, t)
		}
	}
	return tree
}

// GetIsButtonStatusList 获取所有按钮isMenu=2 且status=1的菜单列表
func (s *rule) GetIsButtonStatusList() ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList()
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if v.MenuType == 2 && v.Status == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

// GetIsMenuList 获取MenuType==0,1菜单列表
func (s *rule) GetIsMenuList() ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList()
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if v.MenuType == 0 || v.MenuType == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

// GetMenuIsStatusList 获取status==1的菜单列表
func (s *rule) GetMenuIsStatusList() ([]*model.SysAuthRuleInfoRes, error) {
	list, err := s.GetMenuList()
	if err != nil {
		return nil, err
	}
	var gList = make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if v.Status == 1 {
			gList = append(gList, v)
		}
	}
	return gList, nil
}

//检查菜单规则是否存在
func (s *rule) CheckMenuNameUnique(name string, id int) bool {
	return dao.SysAuthRule.CheckMenuNameUnique(name, id)
}

//检查菜单路由地址是否已经存在
func (s *rule) CheckMenuPathUnique(path string, id int) bool {
	return dao.SysAuthRule.CheckMenuPathUnique(path, id)
}

func (s *rule) AddMenu(req *model.MenuReq) (err error, insertId int64) {
	result, e := dao.SysAuthRule.Save(req)
	if e != nil {
		return e, 0
	}
	lastId, e := result.LastInsertId()
	if e != nil {
		return e, 0
	}
	return nil, lastId
}

//获取分类模型选项
func (s *rule) ModelOptions(module string) (models []*model.SysModelInfo, err error) {
	dictType := ""
	switch module {
	case "gov_work":
		//政务平台
		dictType = "gov_cate_models"
	}

	if dictType != "" {
		//栏目模型分类
		//var modelOptions g.Map
		modelOptions, e := SysDictData.GetDictWithDataByType(&model.GetDictReq{
			DictType: dictType,
		})
		if e != nil {
			err = e
			return
		}
		values := gconv.SliceAny(modelOptions.Values)
		keys := make([]int, len(values))
		for k, val := range values {
			data := gconv.Map(val)
			keys[k] = gconv.Int(data["key"])
		}
		//获取对应模型
		models, err = SysInfo.GetModelsByCateIds(keys)
		if err != nil {
			return
		}
	}
	return
}

func (s *rule) One(id uint64) (*model.SysAuthRule, error) {
	return dao.SysAuthRule.Where("id = ?", id).FindOne()
}

func (s *rule) EditMenu(req *model.MenuReq, id int) (err error, rows int64) {
	result, e := dao.SysAuthRule.Where("id = ?", id).Update(req)
	if e != nil {
		err = e
		return
	}
	r, e := result.RowsAffected()
	if e != nil {
		err = e
		return
	}
	return nil, r
}

func (s *rule) DeleteMenuByIds(ids []int) (err error) {
	var list []*model.SysAuthRuleInfoRes
	list, err = s.GetMenuList()
	if err != nil {
		return
	}
	childrenIds := make([]int, 0, len(list))
	for _, id := range ids {
		rules := s.FindSonByParentId(list, gconv.Uint(id))
		for _, child := range rules {
			childrenIds = append(childrenIds, gconv.Int(child.Id))
		}
	}
	ids = append(ids, childrenIds...)
	_, err = dao.SysAuthRule.Where("id in (?)", ids).Unscoped().Delete() // 硬删除
	return
}

func (s *rule) ParentSonSort(list []*model.SysAuthRuleInfoRes, pid uint) []*model.SysAuthRuleInfoRes {
	newList := make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if pid == v.Pid {
			newList = append(newList, v)
			newList2 := s.ParentSonSort(list, v.Id)
			newList = append(newList, newList2...)
		}
	}
	return newList
}

func (s *rule) FindSonByParentId(list []*model.SysAuthRuleInfoRes, pid uint) []*model.SysAuthRuleInfoRes {
	children := make([]*model.SysAuthRuleInfoRes, 0, len(list))
	for _, v := range list {
		if v.Pid == pid {
			children = append(children, v)
			fChildren := s.FindSonByParentId(list, v.Id)
			children = append(children, fChildren...)
		}
	}
	return children
}
