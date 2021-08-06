/*
* @desc:在线用户管理
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/13 15:10
 */

package api

import (
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type sysUserOnline struct {
	SystemBase
}

var SysUserOnline = new(sysUserOnline)

// List 在线用户列表
func (c *sysUserOnline) List(r *ghttp.Request) {
	var req *model.SysUserOnlineSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	total, page, list, err := service.Online.GetOnlineListPage(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
	}
	c.SusJsonExit(r, result)
}

// ForceLogout 强退用户
func (c *sysUserOnline) ForceLogout(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	tokens, err := service.Online.ForceLogout(ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	for _, token := range tokens {
		GfToken.RemoveToken(token)
	}
	c.SusJsonExit(r, "用户已退出")
}
