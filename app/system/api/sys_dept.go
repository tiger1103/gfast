package api

import (
	"gfast/app/common/global"
	CommService "gfast/app/common/service"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type dept struct {
	SystemBase
}

var Dept = new(dept)

// List 部门列表
func (c *dept) List(r *ghttp.Request) {
	var searchParams *dao.SysDeptSearchParams
	if err := r.Parse(&searchParams); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	if list, err := service.Dept.GetList(searchParams); err != nil {
		c.FailJsonExit(r, err.Error())
	} else {
		if list != nil {
			c.SusJsonExit(r, list)
		} else {
			c.SusJsonExit(r, []*model.SysDept{})
		}
	}
}

func (c *dept) Add(r *ghttp.Request) {
	var addParams *dao.SysDeptAddParams
	if err := r.Parse(&addParams); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	addParams.CreatedBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	if err := service.Dept.AddDept(addParams); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, "添加成功")
}

func (c *dept) Get(r *ghttp.Request) {
	id := r.GetUint64("id")
	if id == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	if dept, err := service.Dept.GetDeptById(id); err != nil {
		c.FailJsonExit(r, err.Error())
	} else {
		c.SusJsonExit(r, dept)
	}
}

func (c *dept) Edit(r *ghttp.Request) {
	var editParams *dao.EditParams
	if err := r.Parse(&editParams); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	editParams.UpdatedBy = c.GetCurrentUser(r.GetCtx()).GetUserId()
	if err := service.Dept.EditDept(editParams); err != nil {
		c.FailJsonExit(r, err.Error())
	}
	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, "编辑成功")
}

func (c *dept) Delete(r *ghttp.Request) {
	id := r.GetInt64("id")
	if id == 0 {
		c.FailJsonExit(r, "删除失败")
	}
	err := service.Dept.DelDept(id)
	if err != nil {
		c.FailJsonExit(r, "删除失败")
	}
	CommService.Cache.New().RemoveByTag(global.SysAuthTag)
	c.SusJsonExit(r, "删除成功")
}

func (c *dept) RoleDeptTreeSelect(r *ghttp.Request) {
	id := r.GetInt64("roleId")
	if id == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	list, err := service.Dept.GetList(&dao.SysDeptSearchParams{
		Status: "1",
	})
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}

	//获取关联的角色数据权限
	checkedKeys, err := service.Dept.GetRoleDepts(id)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	dList := service.Dept.GetDeptListTree(0, list)
	res := g.Map{
		"depts":       dList,
		"checkedKeys": checkedKeys,
	}
	c.SusJsonExit(r, res)
}

func (c *dept) TreeSelect(r *ghttp.Request) {
	//获取正常状态部门数据
	list, err := service.Dept.GetList(&dao.SysDeptSearchParams{Status: "1"})
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	dList := service.Dept.GetDeptListTree(0, list)
	res := g.Map{
		"depts": dList,
	}
	c.SusJsonExit(r, res)
}
