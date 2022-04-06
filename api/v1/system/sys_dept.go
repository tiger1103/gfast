/*
* @desc:部门管理参数
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/4/6 15:07
 */

package system

import (
	"github.com/gogf/gf/v2/frame/g"
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
	g.Meta    `path:"/dept/add" tags:"部门管理" method:"post" summary:"添加部门"`
	ParentID  int    `p:"parentId"  v:"required#父级不能为空"`
	DeptName  string `p:"deptName"  v:"required#部门名称不能为空"`
	OrderNum  int    `p:"orderNum"  v:"required#排序不能为空"`
	Leader    string `p:"leader"`
	Phone     string `p:"phone"`
	Email     string `p:"email"  v:"email#邮箱格式不正确"`
	Status    uint   `p:"status"  v:"required#状态必须"`
	Ancestors string `p:"ancestors"`
}

type DeptAddRes struct {
}
