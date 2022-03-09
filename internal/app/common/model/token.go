/*
* @desc:token options
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/8 16:02
 */

package model

import (
	"github.com/gogf/gf/v2/frame/g"
)

type TokenOptions struct {
	//  server name
	ServerName string `json:"serverName"`
	// 缓存key (每创建一个实例CacheKey必须不相同)
	CacheKey string `json:"cacheKey"`
	// 超时时间 默认10天（秒）
	Timeout int64 `json:"timeout"`
	// 缓存刷新时间 默认5天（秒）
	// 处理携带token的请求时当前时间大于超时时间并小于缓存刷新时间时token将自动刷新即重置token存活时间
	// MaxRefresh值为0时,token将不会自动刷新
	MaxRefresh int64 `json:"maxRefresh"`
	// 是否允许多点登录
	MultiLogin bool `json:"multiLogin"`
	// Token加密key 32位
	EncryptKey []byte `json:"encryptKey"`
	// 拦截排除地址
	ExcludePaths g.SliceStr `json:"excludePaths"`
	CacheModel   string     `json:"cacheModel"`
}
