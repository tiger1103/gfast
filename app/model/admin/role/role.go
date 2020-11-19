package role

import (
	"database/sql"
	"errors"
	"fmt"
	"gfast/app/model/admin/role_dept"
	"gfast/app/service/cache_service"
	"gfast/app/service/casbin_adapter_service"
	"gfast/library/service"
	"gfast/library/utils"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//分页请求参数
type SelectPageReq struct {
	RoleName  string `p:"roleName"`  //参数名称
	BeginTime string `p:"beginTime"` //开始时间
	EndTime   string `p:"endTime"`   //结束时间
	Status    string `p:"status"`    //状态
	PageNum   int    `p:"pageNum"`   //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
}

//修改状态参数
type StatusSetReq struct {
	RoleId uint `p:"roleId" v:"required#角色ID不能为空"`
	Status uint `p:"status" v:"required#状态不能为空"`
}

//角色数据授权参数
type DataScopeReq struct {
	RoleId    uint   `p:"roleId" v:"required#角色ID不能为空"`
	DataScope uint   `p:"dataScope" v:"required#权限范围不能为空"`
	DeptIds   []uint `p:"deptIds"`
}

func GetRoleListSearch(req *SelectPageReq) (total, page int, list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.RoleName != "" {
			model = model.Where("name like ?", "%"+req.RoleName+"%")
		}
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
		if req.BeginTime != "" {
			model = model.Where("create_time >= ? ", utils.StrToTimestamp(req.BeginTime))
		}

		if req.EndTime != "" {
			model = model.Where("create_time<=?", utils.StrToTimestamp(req.EndTime))
		}
	}
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}

	list, err = model.Page(page, req.PageSize).Order("id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

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
	list, err = Model.Order("list_order asc,id asc").All()
	//缓存数据
	cache.Set(cache_service.AdminAuthRole, list, 0, cache_service.AdminAuthTag)
	return
}

func checkRoleData(params map[string]interface{}) error {
	rules := []string{
		"roleName@required|length:1,20#请填写角色名称|名称应在:min到:max个字符之间",
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
		"status":      data["status"],
		"name":        data["roleName"],
		"create_time": now,
		"update_time": now,
		"list_order":  data["roleSort"],
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
	if _, k := data["roleId"]; !k {
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
		"id":          data["roleId"],
		"status":      data["status"],
		"name":        data["roleName"],
		"update_time": now,
		"list_order":  data["roleSort"],
		"remark":      data["remark"],
	}
	_, err = tx.Table(Table).Data(roleMap).Save()
	if err != nil {
		return
	}
	return
}

//设置角色状态
func StatusSetRole(req *StatusSetReq) error {
	if req != nil {
		entity, err := Model.Where("id", req.RoleId).One()
		if err != nil {
			g.Log().Error(err)
			return gerror.New("获取角色信息失败")
		}
		entity.Status = req.Status
		_, err = Model.Save(entity)
		if err != nil {
			g.Log().Error(err)
			return gerror.New("设置状态失败")
		}
	}
	return nil
}

//设置角色数据权限
func DataScope(req *DataScopeReq) error {
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("设置失败")
		return err
	}
	_, err = tx.Table(Table).Where("id", req.RoleId).Data(g.Map{"data_scope": req.DataScope}).Update()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		return gerror.New("设置失败")
	}
	if req.DataScope == 2 {
		_, err := tx.Table(role_dept.Table).Delete(role_dept.Columns.RoleId, req.RoleId)
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			return gerror.New("设置失败")
		}
		//自定义数据权限
		data := g.List{}
		for _, deptId := range req.DeptIds {
			data = append(data, g.Map{role_dept.Columns.RoleId: req.RoleId, role_dept.Columns.DeptId: deptId})
		}
		_, err = tx.Table(role_dept.Table).Data(data).Insert()
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			return gerror.New("设置失败")
		}
	}
	tx.Commit()
	return nil
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
	//删除角色的权限和管理的部门数据权限
	for _, v := range ids {
		err = DeleteRoleRule(v)
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			err = gerror.New("删除失败")
			return
		}
		_, err = tx.Table(role_dept.Table).Delete(role_dept.Columns.RoleId, v)
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
