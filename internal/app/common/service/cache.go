/*
* @desc:缓存处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/9 11:15
 */

package service

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/tiger1103/gfast-cache/cache"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"sync"
)

type ICache interface {
	cache.IGCache
}

type cacheImpl struct {
	*cache.GfCache
	prefix string
}

var (
	c              = cacheImpl{}
	cacheContainer *cache.GfCache
	lock           = &sync.Mutex{}
)

func Cache() ICache {
	var (
		ch  = c
		ctx = gctx.New()
	)
	prefix := g.Cfg().MustGet(ctx, "system.cache.prefix").String()
	model := g.Cfg().MustGet(ctx, "system.cache.model").String()
	if cacheContainer == nil {
		lock.Lock()
		if cacheContainer == nil {
			if model == consts.CacheModelRedis {
				// redis
				cacheContainer = cache.NewRedis(prefix)
			} else {
				// memory
				cacheContainer = cache.New(prefix)
			}
		}
		lock.Unlock()
	}
	ch.GfCache = cacheContainer
	return &ch
}
