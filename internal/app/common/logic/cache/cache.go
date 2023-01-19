/*
* @desc:缓存处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/27 16:33
 */

package cache

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/tiger1103/gfast-cache/cache"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
)

func init() {
	service.RegisterCache(New())
}

func New() *sCache {
	var (
		ctx            = gctx.New()
		cacheContainer *cache.GfCache
	)
	prefix := g.Cfg().MustGet(ctx, "system.cache.prefix").String()
	model := g.Cfg().MustGet(ctx, "system.cache.model").String()
	if model == consts.CacheModelRedis {
		// redis
		cacheContainer = cache.NewRedis(prefix)
	} else {
		// memory
		cacheContainer = cache.New(prefix)
	}
	return &sCache{
		GfCache: cacheContainer,
		prefix:  prefix,
	}
}

type sCache struct {
	*cache.GfCache
	prefix string
}
