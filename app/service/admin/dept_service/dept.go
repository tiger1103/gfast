package dept_service

import (
	"database/sql"
	"gfast/app/model/admin/role_dept"
	"gfast/app/model/admin/sys_dept"
)

/**
获取列表数据
*/
func GetList(searchParams *sys_dept.SearchParams) ([]*sys_dept.Dept, error) {
	if list, err := sys_dept.GetList(searchParams); err != nil {
		return nil, err
	} else {
		return list, nil
	}
}

func GetRoleDepts(roleId int64) ([]int64, error) {
	return role_dept.GetRoleDepts(roleId)
}

func AddDept(data *sys_dept.AddParams) (sql.Result, error) {
	return sys_dept.AddDept(data)
}

func EditDept(data *sys_dept.EditParams) error {
	return sys_dept.EditDept(data)
}

func GetDeptById(id int64) (*sys_dept.Dept, error) {
	return sys_dept.GetDeptById(id)
}

/**
查询部门排除节点
*/
func Exclude(id int64) ([]*sys_dept.Dept, error) {
	return sys_dept.Exclude(id)
}

/**
删除
*/
func DelDept(id int64) error {
	return sys_dept.DelDept(id)
}
