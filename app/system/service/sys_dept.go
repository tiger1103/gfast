package service

import (
	"gfast/app/system/dao"
	"gfast/app/system/model"
)

type dept struct {
}

var Dept = new(dept)

func (s *dept) GetList(searchParams *dao.SysDeptSearchParams) ([]*model.SysDept, error) {
	deptModel := dao.SysDept.M
	if searchParams.DeptName != "" {
		deptModel = deptModel.Where("dept_name like ?", "%"+searchParams.DeptName+"%")
	}
	if searchParams.Status != "" {
		deptModel = deptModel.Where("status", searchParams.Status)
	}
	depts := ([]*model.SysDept)(nil)
	if err := deptModel.Scan(&depts); err != nil {
		return nil, err
	}
	list := make([]*model.SysDept, 0, len(depts))
	if searchParams.ExcludeId != 0 {
		for _, v := range depts {
			if searchParams.ExcludeId != v.DeptId {
				list = append(list, v)
			}
		}
		return list, nil
	} else {
		return depts, nil
	}
}

func (s *dept) GetRoleDepts(roleId int64) ([]int64, error) {
	var entitys []*model.SysRoleDept
	err := dao.SysRoleDept.Where("role_id", roleId).Scan(&entitys)
	if err != nil {
		return nil, err
	}
	result := make([]int64, 0)
	for _, v := range entitys {
		result = append(result, v.DeptId)
	}
	return result, nil
}

func (s *dept) FindSonByParentId(depts []*model.SysDept, deptId int64) []*model.SysDept {
	children := make([]*model.SysDept, 0, len(depts))
	for _, v := range depts {
		if v.ParentId == deptId {
			children = append(children, v)
			fChildren := s.FindSonByParentId(depts, v.DeptId)
			children = append(children, fChildren...)
		}
	}
	return children
}

func (s *dept) GetDeptListTree(pid int64, list []*model.SysDept) []*dao.SysDeptTreeRes {
	tree := make([]*dao.SysDeptTreeRes, 0, len(list))
	for _, v := range list {
		if v.ParentId == pid {
			t := &dao.SysDeptTreeRes{
				SysDept: v,
			}
			child := s.GetDeptListTree(v.DeptId, list)
			if len(child) > 0 {
				t.Children = child
			}
			tree = append(tree, t)
		}
	}
	return tree
}

func (s *dept) AddDept(params *dao.SysDeptAddParams) (err error) {
	_, err = dao.SysDept.Insert(params)
	return
}

func (s *dept) GetDeptById(id uint64) (dept *model.SysDept, err error) {
	err = dao.SysDept.Where("dept_id", id).Scan(&dept)
	return
}

func (s *dept) EditDept(params *dao.EditParams) error {
	_, err := dao.SysDept.FieldsEx(dao.SysDept.C.DeptId, dao.SysDept.C.CreatedBy).WherePri(params.DeptID).
		Update(params)
	return err
}

func (s *dept) DelDept(id int64) error {
	var list []*model.SysDept
	err := dao.SysDept.Scan(&list)
	if err != nil {
		return err
	}
	children := s.FindSonByParentId(list, id)
	ids := make([]int64, 0, len(list))
	for _, v := range children {
		ids = append(ids, v.DeptId)
	}
	ids = append(ids, id)
	_, err = dao.SysDept.Where(dao.SysDept.C.DeptId+" in (?)", ids).Delete()
	return err
}
