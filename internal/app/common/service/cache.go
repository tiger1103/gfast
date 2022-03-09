/*
* @desc:缓存处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/9 11:15
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast-cache/cache"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
)

type ICache interface {
	cache.IGCache
}

type cacheImpl struct {
	*cache.GfCache
	prefix string
}

var c = cacheImpl{}

func Cache(ctx context.Context) ICache {
	ch := c
	prefix := g.Cfg().MustGet(ctx, "system.cache.prefix").String()
	model := g.Cfg().MustGet(ctx, "system.cache.model").String()
	if model == consts.CacheModelRedis {
		// redis
		ch.GfCache = cache.NewRedis(prefix)
	} else {
		ch.GfCache = cache.New(prefix)
	}
	return ICache(&ch)
}
