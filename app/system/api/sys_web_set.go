/*
* @desc:站点设置
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/6 15:41
 */

package api

import (
	"gfast/app/common/global"
	commonService "gfast/app/common/service"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type sysWebSet struct {
	SystemBase
}

var SysWebSet = new(sysWebSet)

func (c *sysWebSet) Update(r *ghttp.Request) {
	var req *model.SysWebSetUpdateReq
	err := r.Parse(&req)
	if err != nil {
		c.FailJson(true, r, err.(gvalid.Error).FirstString())
	}
	err = service.SysWebSet.UpdateSave(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	commonService.Cache.New().Remove(global.SysWebSet)
	c.SusJsonExit(r, "更新成功!")
}

func (c *sysWebSet) Get(r *ghttp.Request) {
	data, err := service.SysWebSet.Get()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, data)
}
