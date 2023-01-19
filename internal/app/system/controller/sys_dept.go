/*
* @desc:部门管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/4/6 15:15
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var Dept = sysDeptController{}

type sysDeptController struct {
	BaseController
}

// List 部门列表
func (c *sysDeptController) List(ctx context.Context, req *system.DeptSearchReq) (res *system.DeptSearchRes, err error) {
	res = new(system.DeptSearchRes)
	res.DeptList, err = service.SysDept().GetList(ctx, req)
	return
}

// Add 添加部门
func (c *sysDeptController) Add(ctx context.Context, req *system.DeptAddReq) (res *system.DeptAddRes, err error) {
	err = service.SysDept().Add(ctx, req)
	return
}

// Edit 修改部门
func (c *sysDeptController) Edit(ctx context.Context, req *system.DeptEditReq) (res *system.DeptEditRes, err error) {
	err = service.SysDept().Edit(ctx, req)
	return
}

// Delete 删除部门
func (c *sysDeptController) Delete(ctx context.Context, req *system.DeptDeleteReq) (res *system.DeptDeleteRes, err error) {
	err = service.SysDept().Delete(ctx, req.Id)
	return
}

// TreeSelect 获取部门数据结构数据
func (c *sysDeptController) TreeSelect(ctx context.Context, req *system.DeptTreeSelectReq) (res *system.DeptTreeSelectRes, err error) {
	var deptList []*entity.SysDept
	deptList, err = service.SysDept().GetList(ctx, &system.DeptSearchReq{
		Status: "1", //正常状态数据
	})
	if err != nil {
		return
	}
	res = new(system.DeptTreeSelectRes)
	res.Deps = service.SysDept().GetListTree(0, deptList)
	return
}
