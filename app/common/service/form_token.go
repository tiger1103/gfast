/**
 * 表单令牌
 * @Company: 云南奇讯科技有限公司
 * @Author: yxf
 * @Description:
 * @Version: 1.0.0
 * @Date: 2021/9/15 17:47
 */

package service

import (
	"github.com/gogf/gf/util/guid"
	"time"
)

type formTokenService struct{}

var FormToken = new(formTokenService)

func (s *formTokenService) New(action string) (key string) {
	key = guid.S()
	cache := Cache.New()
	cache.Set(key, action, time.Hour)
	return key
}

func (s *formTokenService) Verify(key string, action string) bool {
	cache := Cache.New()
	value := cache.Get(key)
	if value != nil && value == action {
		return true
	}
	return false
}

func (s *formTokenService) Remove(key string) interface{} {
	cache := Cache.New()
	return cache.Remove(key)
}
