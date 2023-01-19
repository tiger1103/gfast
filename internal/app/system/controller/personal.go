/*
* @desc:xxxx功能描述
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/11/3 10:32
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var Personal = new(personalController)

type personalController struct {
}

func (c *personalController) GetPersonal(ctx context.Context, req *system.PersonalInfoReq) (res *system.PersonalInfoRes, err error) {
	res, err = service.Personal().GetPersonalInfo(ctx, req)
	return
}

func (c *personalController) EditPersonal(ctx context.Context, req *system.PersonalEditReq) (res *system.PersonalEditRes, err error) {
	res, err = service.Personal().EditPersonal(ctx, req)
	return
}

func (c *personalController) ResetPwdPersonal(ctx context.Context, req *system.PersonalResetPwdReq) (res *system.PersonalResetPwdRes, err error) {
	res, err = service.Personal().ResetPwdPersonal(ctx, req)
	return
}
