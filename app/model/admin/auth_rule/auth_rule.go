package auth_rule

import (
	"gfast/app/service/cache_service"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

//菜单对象
type MenuReq struct {
	MenuType   uint   `p:"menuType"  v:"min:0|max:2#菜单类型最小值为:min|菜单类型最大值为:max"`
	Pid        uint   `p:"parentId"  v:"min:0"`
	Name       string `p:"name" v:"required#请填写规则名称"`
	Title      string `p:"menuName"  v:"required|length:1,100#请填写标题|标题长度在:min到:max位"`
	Icon       string `p:"icon"`
	Weigh      int    `p:"orderNum" `
	Condition  string `p:"condition" `
	Remark     string `p:"remark" `
	Status     uint   `p:"status" `
	AlwaysShow uint   `p:"visible"`
	Path       string `p:"path"`
	Component  string `p:"component" v:"required-if:menuType,1#组件路径不能为空"`
	IsFrame    uint   `p:"is_frame"`
}

//获取所有菜单
func GetMenuList() (list []*Entity, err error) {
	cache := cache_service.New()
	//从缓存获取
	iList := cache.Get(cache_service.AdminAuthMenu)
	if iList != nil {
		list = iList.([]*Entity)
		return
	}
	//从数据库获取
	list, err = Model.Order("weigh desc,id asc").FindAll()
	if err != nil {
		return
	}
	//缓存菜单
	cache.Set(cache_service.AdminAuthMenu, list, 0, cache_service.AdminAuthTag)
	return
}

//检查菜单规则是否存在
func CheckMenuNameUnique(name string, id int) bool {
	model := Model.Where("name=?", name)
	if id != 0 {
		model = model.And("id!=?", id)
	}
	c, err := model.Count()
	if err != nil {
		g.Log().Error(err)
		return false
	}
	return c == 0
}

//检查菜单路由地址是否已经存在
func CheckMenuPathUnique(path string, id int) bool {
	model := Model.Where("path=?", path).Where("menu_type<>?", 2)
	if id != 0 {
		model = model.And("id!=?", id)
	}
	c, err := model.Count()
	if err != nil {
		g.Log().Error(err)
		return false
	}
	return c == 0
}

// 添加菜单操作
func Add(req *MenuReq) (err error, insertId int64) {
	if req == nil {
		err = gerror.New("参数错误")
		return
	}
	now := gtime.Timestamp()
	entity := new(Entity)
	entity.Title = req.Title
	entity.Status = req.Status
	entity.MenuType = req.MenuType
	entity.Path = req.Path
	entity.Component = req.Component
	entity.AlwaysShow = req.AlwaysShow
	entity.Icon = req.Icon
	entity.Name = req.Name
	entity.IsFrame = req.IsFrame
	entity.Pid = req.Pid
	entity.Createtime = gconv.Uint(now)
	entity.Updatetime = gconv.Uint(now)
	entity.Weigh = req.Weigh

	res, e := entity.Insert()
	err = e
	if err != nil {
		return
	}
	insertId, err = res.LastInsertId()
	return
}

//修改菜单操作
func Edit(req *MenuReq, id int) (err error, rows int64) {
	var entity *Entity
	entity, err = Model.FindOne(id)
	if err != nil {
		return
	}
	now := gtime.Timestamp()
	entity.Updatetime = gconv.Uint(now)
	entity.Title = req.Title
	entity.Status = req.Status
	entity.MenuType = req.MenuType
	entity.Path = req.Path
	entity.Component = req.Component
	entity.AlwaysShow = req.AlwaysShow
	entity.Icon = req.Icon
	entity.Name = req.Name
	entity.IsFrame = req.IsFrame
	entity.Pid = req.Pid
	entity.Weigh = req.Weigh
	res, e := Model.Save(entity)
	err = e
	if err != nil {
		return
	}
	rows, err = res.RowsAffected()
	return
}

//删除菜单
func DeleteByIds(ids []int) (err error) {
	//获取菜单数据
	menus, err := GetMenuList()
	if err != nil {
		return
	}
	menuList := gconv.SliceMap(menus)
	son := make(g.List, 0, len(menuList))
	for _, id := range ids {
		son = append(son, utils.FindSonByParentId(menuList, id, "pid", "id")...)
	}
	for _, v := range son {
		ids = append(ids, gconv.Int(v["id"]))
	}
	_, err = Model.Where("id in (?)", ids).Delete()
	return
}

type ReqSearch struct {
	Status string `p:"status" `
	Title  string `p:"menuName" `
}
