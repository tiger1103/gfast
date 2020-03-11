package auth_rule

import (
	"gfast/app/service/cache_service"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

//菜单对象
type MenuReq struct {
	IsMenu    int    `p:"ismenu" c:"ismenu" v:"min:0|max:1#菜单类型最小值为:min|菜单类型最大值为:max"`
	Pid       int    `p:"pid" c:"pid" v:"min:0"`
	Name      string `p:"name" c:"name" v:"required#请填写规则名称"`
	Title     string `p:"title" c:"title" v:"required|length:1,100#请填写标题|标题长度在:min到:max位"`
	Icon      string `p:"icon" c:"icon"`
	Weigh     int    `p:"weigh" c:"weigh"`
	Condition string `p:"condition" c:"condition"`
	Remark    string `p:"remark" c:"remark"`
	Status    int    `p:"status" c:"status"`
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

// 添加菜单操作
func Add(req *MenuReq) (err error, insertId int64) {
	menuMap := gconv.Map(req)
	now := gtime.Timestamp()
	menuMap["createtime"] = now
	menuMap["updatetime"] = now
	res, e := Model.Insert(menuMap)
	err = e
	insertId, _ = res.LastInsertId()
	return
}

//修改菜单操作
func Edit(req *MenuReq, id int) (err error, rows int64) {
	menuMap := gconv.Map(req)
	now := gtime.Timestamp()
	menuMap["updatetime"] = now
	res, e := Model.Where("id=?", id).Update(menuMap)
	err = e
	rows, _ = res.RowsAffected()
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
