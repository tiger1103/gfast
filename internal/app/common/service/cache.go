/*
* @desc:缓存处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/9 11:15
 */

package service

import (
	"github.com/tiger1103/gfast-cache/cache"
)

type ICache interface {
	cache.IGCache
}

var c ICache

func Cache() ICache {
	if c == nil {
		panic("implement not found for interface ICache, forgot register?")
	}
	return c
}

func RegisterCache(che ICache) {
	c = che
}
