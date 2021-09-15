/*
* @desc:缓存处理
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/9/13 14:33
 */

package api

import (
	"gfast/app/common/api"
	"gfast/app/common/global"
	commService "gfast/app/common/service"
	"github.com/gogf/gf/net/ghttp"
)

type cache struct {
	api.CommonBase
}

var Cache = new(cache)

// Clear 清除缓存
func (c *cache) Clear(r *ghttp.Request) {
	cs := commService.Cache.New()
	cs.RemoveByTag(global.SysAuthTag)
	cs.RemoveByTag(global.SysDictTag)
	cs.RemoveByTag(global.SysConfigTag)
	c.SusJsonExit(r, "缓存清除成功")
}
