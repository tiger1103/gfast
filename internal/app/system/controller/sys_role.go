/*
* @desc:角色管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/3/30 9:08
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var Role = roleController{}

type roleController struct {
	BaseController
}

// List 角色列表
func (c *roleController) List(ctx context.Context, req *system.RoleListReq) (res *system.RoleListRes, err error) {
	res, err = service.Role().GetRoleListSearch(ctx, req)
	return
}
