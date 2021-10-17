package service

import (
	"database/sql"
	"errors"
	"fmt"
	"gfast/app/common/global"
	comModel "gfast/app/common/model"
	"gfast/app/common/service"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"gfast/library"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

type sysRole struct{}

var SysRole = new(sysRole)

func (s *sysRole) DeleteByIds(ids []int) (err error) {
	tx, err := g.DB("default").Begin() //开启事务
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("事务处理失败")
		return
	}

	_, err = tx.Model(model.SysRole{}).Where("id in(?)", ids).Delete()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		err = gerror.New("删除失败")
		return
	}
	//删除角色的权限和管理的部门数据权限
	enforcer, e := service.Casbin.GetEnforcer()
	if e != nil {
		tx.Rollback()
		return e
	}
	for _, v := range ids {
		_, err = enforcer.RemoveFilteredPolicy(0, fmt.Sprintf("%d", v))
		if err != nil {
			tx.Rollback()
			return err
		}
		_, err = tx.Model(model.SysRoleDept{}).Delete("role_id", v)
		if err != nil {
			tx.Rollback()
			return err
		}
	}
	tx.Commit()
	//清除TAG缓存
	service.Cache.New().RemoveByTag(global.SysAuthTag)
	return nil
}

func (s *sysRole) One(id int) (*model.SysRole, error) {
	return dao.SysRole.Where("id = ?", id).FindOne()
}

// GetRoleList 获取角色列表
func (s *sysRole) GetRoleList() (list []*model.SysRole, err error) {
	cache := service.Cache.New()
	//从缓存获取
	iList := cache.Get(global.SysRole)
	if iList != nil {
		err = gconv.Struct(iList, &list)
		return
	}
	//从数据库获取
	list, err = dao.SysRole.Order(dao.SysRole.Columns.ListOrder + " asc," + dao.SysRole.Columns.Id + " asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取角色数据失败")
	}
	//缓存数据
	cache.Set(global.SysRole, list, 0, global.SysAuthTag)
	iList = cache.Get(global.SysRole)
	return
}

func (s *sysRole) GetRoleListSearch(req *model.SelectPageReq) (total, page int, list []*model.SysRole, err error) {
	model := dao.SysRole.M
	if req.RoleName != "" {
		model = model.Where("name like ?", "%"+req.RoleName+"%")
	}
	if req.Status != "" {
		model = model.Where("status", gconv.Int(req.Status))
	}
	if req.BeginTime != "" {

		model = model.Where("create_time >= ? ", library.StrToTimestamp(req.BeginTime))
	}

	if req.EndTime != "" {
		model = model.Where("create_time<=?", library.StrToTimestamp(req.EndTime))
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
		req.PageSize = comModel.PageSize
	}
	err = model.Page(page, req.PageSize).Order("id asc").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//获取角色关联的菜单规则
func (s *sysRole) GetFilteredNamedPolicy(id int) ([]int, error) {
	enforcer, err := service.Casbin.GetEnforcer()
	if err != nil {
		g.Log().Error(err)
		return nil, err
	}
	gp := enforcer.GetFilteredNamedPolicy("p", 0, fmt.Sprintf("%d", id))
	gpSlice := make([]int, len(gp))
	for k, v := range gp {
		gpSlice[k] = gconv.Int(v[1])
	}

	return gpSlice, nil
}

func (s *sysRole) AddRolePost(m map[string]interface{}) error {
	tx, err := g.DB("default").Begin() //开启事务

	if err != nil {
		return err
	}
	//插入角色
	insertId, err := s.AddRole(tx, m)
	if err != nil {
		tx.Rollback() //回滚
		return err
	}
	//添加角色权限
	err = s.AddRoleRule(m["menuIds"], insertId)

	if err != nil {
		tx.Rollback() //回滚
		g.Log().Error(err.Error())
		return err
	}

	tx.Commit()
	//清除TAG缓存
	service.Cache.New().RemoveByTag(global.SysAuthTag)
	return nil
}

// AddRoleRule 添加角色权限
func (s *sysRole) AddRoleRule(iRule interface{}, roleId int64) (err error) {
	enforcer, e := service.Casbin.GetEnforcer()
	if e != nil {
		err = e
		return
	}
	rule := gconv.Strings(iRule)
	for _, v := range rule {
		_, err = enforcer.AddPolicy(fmt.Sprintf("%d", roleId), fmt.Sprintf("%s", v), "All")
		if err != nil {
			break
		}
	}
	return
}

//插入角色
func (s *sysRole) AddRole(tx *gdb.TX, data map[string]interface{}) (InsId int64, err error) {
	if e := s.checkRoleData(data); e != nil {
		err = e.(gvalid.Error).Current()
		return
	}
	//保存角色信息
	roleMap := gdb.Map{
		"status":     data["status"],
		"name":       data["roleName"],
		"list_order": data["roleSort"],
		"remark":     data["remark"],
	}
	var res sql.Result
	res, err = tx.Model(model.SysRole{}).Data(roleMap).Save()
	if err != nil {
		return
	}
	InsId, _ = res.LastInsertId()
	return
}

func (s *sysRole) checkRoleData(params map[string]interface{}) error {
	rules := []string{
		"roleName@required|length:1,20#请填写角色名称|名称应在:min到:max个字符之间",
	}

	e := gvalid.CheckMap(nil, params, rules)
	if e != nil {
		return e
	}
	return nil
}

// 修改角色信息
func (s *sysRole) EditRole(tx *gdb.TX, data map[string]interface{}) error {
	if _, k := data["roleId"]; !k {
		return errors.New("缺少更新条件Id")
	}

	if e := s.checkRoleData(data); e != nil {
		return e.(gvalid.Error).Current()
	}

	//保存角色信息
	roleMap := gdb.Map{
		"id":         data["roleId"],
		"status":     data["status"],
		"name":       data["roleName"],
		"list_order": data["roleSort"],
		"remark":     data["remark"],
	}
	_, err := tx.Model(model.SysRole{}).Data(roleMap).Save()
	if err != nil {
		return err
	}
	return nil
}

//修改角色的授权规则
func (s *sysRole) EditRoleRule(iRule interface{}, roleId int64) (err error) {
	enforcer, e := service.Casbin.GetEnforcer()
	if e != nil {
		return e
	}

	//删除旧权限
	_, err = enforcer.RemoveFilteredPolicy(0, fmt.Sprintf("%d", roleId))
	if err != nil {
		return
	}
	// 添加新权限
	rule := gconv.Strings(iRule)
	for _, v := range rule {
		_, err = enforcer.AddPolicy(fmt.Sprintf("%d", roleId), fmt.Sprintf("%s", v), "All")
		if err != nil {
			break
		}
	}

	return

}

func (s *sysRole) EditRolePost(m map[string]interface{}, id int) error {
	tx, err := g.DB("default").Begin() //开启事务
	if err != nil {
		return err
	}
	err = s.EditRole(tx, m)
	if err != nil {
		tx.Rollback()
		return err
	}
	err = s.EditRoleRule(m["menuIds"], int64(id))
	if err != nil {
		tx.Rollback() //回滚
		return err
	}
	tx.Commit()
	//清除TAG缓存
	service.Cache.New().RemoveByTag(global.SysAuthTag)
	return nil
}

func (s *sysRole) StatusSetRole(req *model.StatusSetReq) error {
	_, err := dao.SysRole.Where(dao.SysRole.Columns.Id, req.RoleId).Data(dao.SysRole.Columns.Status, req.Status).
		Update()
	if err == nil {
		//清除TAG缓存
		service.Cache.New().RemoveByTag(global.SysAuthTag)
	}
	return err
}

//设置角色数据权限
func (s *sysRole) RoleDataScope(req *model.DataScopeReq) error {
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("设置失败")
	}
	_, err = tx.Model(model.SysRole{}).Where("id", req.RoleId).Data(g.Map{"data_scope": req.DataScope}).Update()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		return gerror.New("设置失败")
	}
	if req.DataScope == 2 {
		_, err := tx.Model(model.SysRoleDept{}).Where("role_id", req.RoleId).Delete()
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			return gerror.New("设置失败")
		}
		data := g.List{}
		for _, deptId := range req.DeptIds {
			data = append(data, g.Map{"role_id": req.RoleId, "dept_id": deptId})
		}
		_, err = tx.Model(model.SysRoleDept{}).Data(data).Insert()
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			return gerror.New("设置失败")
		}
	}
	tx.Commit()
	return nil
}
