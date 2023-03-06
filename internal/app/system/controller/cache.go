/*
* @desc:缓存处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2023/2/1 18:14
 */

package controller

import (
	"context"
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	commonConsts "github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
)

var Cache = new(cacheController)

type cacheController struct {
	BaseController
}

func (c *cacheController) Remove(ctx context.Context, req *system.CacheRemoveReq) (res *system.CacheRemoveRes, err error) {
	service.Cache().RemoveByTag(ctx, commonConsts.CacheSysDictTag)
	service.Cache().RemoveByTag(ctx, commonConsts.CacheSysConfigTag)
	service.Cache().RemoveByTag(ctx, consts.CacheSysAuthTag)
	cacheRedis := g.Cfg().MustGet(ctx, "system.cache.model").String()
	if cacheRedis == commonConsts.CacheModelRedis {
		cursor := 0
		cachePrefix := g.Cfg().MustGet(ctx, "system.cache.prefix").String()
		for {
			var v *gvar.Var
			v, err = g.Redis().Do(ctx, "scan", cursor, "match", cachePrefix+"*", "count", "100")
			if err != nil {
				return
			}
			data := gconv.SliceAny(v)
			var dataSlice []string
			err = gconv.Structs(data[1], &dataSlice)
			if err != nil {
				return
			}
			for _, d := range dataSlice {
				_, err = g.Redis().Do(ctx, "del", d)
				if err != nil {
					return
				}
			}
			cursor = gconv.Int(data[0])
			if cursor == 0 {
				break
			}
		}
	}
	return
}
