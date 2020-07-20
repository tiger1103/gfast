package admin

import (
	"gfast/app/model/admin/sys_dept"
	"gfast/app/service/admin/dept_service"
	"gfast/library/response"
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

//菜单用户组用户管理
type Dept struct{}

// @Summary 分页部门列表数据
// @Description 分页列表
// @Tags 部门
// @Param data body sys_dept.SearchParams true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/dept/list [get]
// @Security
func (c *Dept) List(r *ghttp.Request) {

	var searchParams *sys_dept.SearchParams

	if err := r.Parse(&searchParams); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}

	if list, err := dept_service.GetList(searchParams); err != nil {
		response.FailJson(true, r, err.Error())
	} else {
		if list != nil {
			response.SusJson(true, r, "成功", list)
		} else {
			response.SusJson(true, r, "成功", g.Slice{})
		}

	}

}

// @Summary 添加部门
// @Description 获取JSON
// @Tags 部门
// @Accept  application/json
// @Product application/json
// @Param data body sys_dept.AddParams true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "添加成功"}"
// @Router /system/dept/addDept [post]
// @Security Bearer
func (c *Dept) AddDept(r *ghttp.Request) {
	if r.Method == "POST" {
		var addParams *sys_dept.AddParams

		if err := r.Parse(&addParams); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		//g.Log().Println(AddParams)
		if _, err := dept_service.AddDept(addParams); err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加成功")
	}
}

// @Summary 修改部门
// @Description 获取JSON
// @Tags 部门
// @Accept  application/json
// @Product application/json
// @Param data body sys_dept.EditParams true "data"
// @Success 200 {object} response.Response	"{"code": 0, "message": "修改成功"}"
// @Router /system/dept/editDept [post]
// @Security Bearer
func (c *Dept) EditDept(r *ghttp.Request) {
	if r.Method == "POST" {
		var editParams *sys_dept.EditParams
		if err := r.Parse(&editParams); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}

		if err := dept_service.EditDept(editParams); err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "编辑成功")

	}
	id := r.GetInt64("id")
	if id == 0 {
		response.FailJson(true, r, "参数错误")
	}
	if dept, err := dept_service.GetDeptById(id); err != nil {
		response.FailJson(true, r, err.Error())
	} else {
		response.SusJson(true, r, "success", dept)
	}
}

/**
查询部门排除节点
*/
func (c *Dept) Exclude(r *ghttp.Request) {
	id := r.GetInt64("id")
	if id == 0 {
		response.FailJson(true, r, "参数错误")
	}

	if depts, err := dept_service.Exclude(id); err != nil {
		response.FailJson(true, r, err.Error())
	} else {
		response.SusJson(true, r, "success", depts)
	}
}

// @Summary 删除部门
// @Description 删除数据
// @Tags 部门
// @Param id path int true "id"
// @Success 200 {object} response.Response	"{"code": 0, "message": "删除成功"}"
// @Router /system/dept/delDept/{id} [delete]
func (c *Dept) DelDept(r *ghttp.Request) {
	id := r.GetInt64("id")
	if id == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := dept_service.DelDept(id)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除信息成功")
}

func (c *Dept) TreeSelect(r *ghttp.Request) {
	//获取正常状态部门数据
	list, err := dept_service.GetList(&sys_dept.SearchParams{Status: "1"})
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	var dList g.ListStrAny
	for _, entity := range list {
		m := g.Map{
			"id":    entity.DeptID,
			"pid":   entity.ParentID,
			"label": entity.DeptName,
		}
		dList = append(dList, m)
	}
	dList = utils.PushSonToParent(dList, 0, "pid", "id", "children", "", nil, false)
	res := g.Map{
		"depts": dList,
	}
	response.SusJson(true, r, "ok", res)
}

//获取角色部门
func (c *Dept) RoleDeptTreeSelect(r *ghttp.Request) {
	id := r.GetInt64("roleId")
	if id == 0 {
		response.FailJson(true, r, "参数错误")
	}
	//获取正常状态部门数据
	list, err := dept_service.GetList(&sys_dept.SearchParams{Status: "1"})
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	var dList g.ListStrAny
	for _, entity := range list {
		m := g.Map{
			"id":    entity.DeptID,
			"pid":   entity.ParentID,
			"label": entity.DeptName,
		}
		dList = append(dList, m)
	}
	//获取关联的角色数据权限
	checkedKeys, err := dept_service.GetRoleDepts(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	dList = utils.PushSonToParent(dList)
	res := g.Map{
		"depts":       dList,
		"checkedKeys": checkedKeys,
	}
	response.SusJson(true, r, "ok", res)
}
