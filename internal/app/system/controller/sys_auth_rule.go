/*
* @desc:菜单
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/16 10:36
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var Menu = menuController{}

type menuController struct {
}

func (c *menuController) Add(ctx context.Context, req *system.RuleAddReq) (res *system.RuleAddRes, err error) {
	err = service.Rule().Add(ctx, req)
	return
}
