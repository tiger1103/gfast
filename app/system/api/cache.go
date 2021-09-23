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
	"github.com/gogf/gf/encoding/gbase64"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
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
	cacheRedis := g.Cfg().GetBool("redis.open")
	if cacheRedis {
		cursor := 0
		for {
			v, err := g.Redis().DoVar("scan", cursor, "match", global.CachePrefix+"*", "count", "100")
			if err != nil {
				c.FailJsonExit(r, err.Error())
			}
			data := gconv.SliceAny(v)
			var dataSlice []string
			err = gconv.Structs(data[1], &dataSlice)
			if err != nil {
				c.FailJsonExit(r, err.Error())
			}
			for _, d := range dataSlice {
				dk := gbase64.MustDecodeToString(d)
				_, err = g.Redis().DoVar("del", dk)
				if err != nil {
					c.FailJsonExit(r, err.Error())
				}
			}
			cursor = gconv.Int(data[0])
			if cursor == 0 {
				break
			}
		}
	}
	c.SusJsonExit(r, "缓存清除成功")
}
