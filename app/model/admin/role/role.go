package role

import (
	"database/sql"
	"errors"
	"fmt"
	"gfast/app/service/cache_service"
	"gfast/app/service/casbin_adapter_service"
	"gfast/library/utils"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//获取用户组(角色)列表
func GetList() (list []*Entity, err error) {
	cache := cache_service.New()
	//从缓存获取
	iList := cache.Get(cache_service.AdminAuthRole)
	if iList != nil {
		list = iList.([]*Entity)
		return
	}
	//从数据库获取
	list, err = Model.OrderBy("list_order asc,id asc").All()
	//缓存数据
	cache.Set(cache_service.AdminAuthRole, list, 0, cache_service.AdminAuthTag)
	return
}

func checkRoleData(params map[string]interface{}) error {
	rules := []string{
		"name@required|length:1,20#请填写角色名称|名称应在:min到:max个字符之间",
		"parent_id@integer|min:0#父级ID必须为整数|父级ID必须大于等于0",
	}

	e := gvalid.CheckMap(params, rules)
	if e != nil {
		return e
	}
	return nil
}

//保存角色信息并返回插入的id
func Add(tx *gdb.TX, data map[string]interface{}) (InsId int64, err error) {
	if e := checkRoleData(data); e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	//保存角色信息
	now := gtime.Timestamp()
	roleMap := gdb.Map{
		"parent_id":   data["parent_id"],
		"status":      data["status"],
		"name":        data["name"],
		"create_time": now,
		"update_time": now,
		"list_order":  data["list_order"],
		"remark":      data["remark"],
	}
	var res sql.Result
	res, err = tx.Table(Table).Data(roleMap).Save()
	if err != nil {
		return
	}
	InsId, _ = res.LastInsertId()
	return
}

//修改角色信息操作
func Edit(tx *gdb.TX, data map[string]interface{}) (err error) {
	if _, k := data["id"]; !k {
		err = errors.New("缺少更新条件Id")
		return
	}
	if e := checkRoleData(data); e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	//保存角色信息
	now := gtime.Timestamp()
	roleMap := gdb.Map{
		"id":          data["id"],
		"parent_id":   data["parent_id"],
		"status":      data["status"],
		"name":        data["name"],
		"update_time": now,
		"list_order":  data["list_order"],
		"remark":      data["remark"],
	}
	_, err = tx.Table(Table).Data(roleMap).Save()
	if err != nil {
		return
	}
	return
}

//删除角色权限操作
func DeleteRoleRule(roleId int) (err error) {
	enforcer, e := casbin_adapter_service.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	//查询当前权限
	gp := enforcer.GetFilteredNamedPolicy("p", 0, fmt.Sprintf("g_%d", roleId))
	//删除旧权限
	for _, v := range gp {
		_, e = enforcer.RemovePolicy(v)
		if e != nil {
			err = e
			return
		}
	}
	return
}

func DeleteByIds(ids []int) (err error) {
	//查询所有子级id
	roleAllEntity, err := GetList()
	if err != nil {
		g.Log().Debug(err)
		err = gerror.New("删除失败，不存在角色信息")
		return
	}
	roleAll := gconv.SliceMap(roleAllEntity)
	sonList := make(g.List, 0, len(roleAll))
	for _, id := range ids {
		sonList = append(sonList, utils.FindSonByParentId(roleAll, id, "parent_id", "id")...)
	}
	for _, role := range sonList {
		ids = append(ids, gconv.Int(role["id"]))
	}
	tx, err := g.DB("default").Begin() //开启事务
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("事务处理失败")
		return
	}
	_, err = tx.Table(Table).Where("id in(?)", ids).Delete()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		err = gerror.New("删除失败")
		return
	}
	//删除角色的权限
	for _, v := range ids {
		err = DeleteRoleRule(v)
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			err = gerror.New("删除失败")
			return
		}
	}
	tx.Commit()
	return
}
