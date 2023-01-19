/*
* @desc:部门管理参数
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/4/6 15:07
 */

package system

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
)

type DeptSearchReq struct {
	g.Meta   `path:"/dept/list" tags:"部门管理" method:"get" summary:"部门列表"`
	DeptName string `p:"deptName"`
	Status   string `p:"status"`
}

type DeptSearchRes struct {
	g.Meta   `mime:"application/json"`
	DeptList []*entity.SysDept `json:"deptList"`
}

type DeptAddReq struct {
	g.Meta   `path:"/dept/add" tags:"部门管理" method:"post" summary:"添加部门"`
	ParentID int    `p:"parentId"  v:"required#父级不能为空"`
	DeptName string `p:"deptName"  v:"required#部门名称不能为空"`
	OrderNum int    `p:"orderNum"  v:"required#排序不能为空"`
	Leader   string `p:"leader"`
	Phone    string `p:"phone"`
	Email    string `p:"email"  v:"email#邮箱格式不正确"`
	Status   uint   `p:"status"  v:"required#状态必须"`
}

type DeptAddRes struct {
}

type DeptEditReq struct {
	g.Meta   `path:"/dept/edit" tags:"部门管理" method:"put" summary:"修改部门"`
	DeptId   int    `p:"deptId" v:"required#deptId不能为空"`
	ParentID int    `p:"parentId"  v:"required#父级不能为空"`
	DeptName string `p:"deptName"  v:"required#部门名称不能为空"`
	OrderNum int    `p:"orderNum"  v:"required#排序不能为空"`
	Leader   string `p:"leader"`
	Phone    string `p:"phone"`
	Email    string `p:"email"  v:"email#邮箱格式不正确"`
	Status   uint   `p:"status"  v:"required#状态必须"`
}

type DeptEditRes struct {
}

type DeptDeleteReq struct {
	g.Meta `path:"/dept/delete" tags:"部门管理" method:"delete" summary:"删除部门"`
	Id     uint64 `p:"id" v:"required#id不能为空"`
}

type DeptDeleteRes struct {
}

type DeptTreeSelectReq struct {
	g.Meta `path:"/dept/treeSelect" tags:"部门管理" method:"get" summary:"获取部门树形菜单"`
}

type DeptTreeSelectRes struct {
	g.Meta `mime:"application/json"`
	Deps   []*model.SysDeptTreeRes `json:"deps"`
}
