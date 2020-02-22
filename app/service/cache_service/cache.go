package cache_service

import (
	"fmt"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/util/gconv"
	"reflect"
	"time"
)

type CacheTagService struct {
	tagKey interface{}
}

func New() *CacheTagService {
	return &CacheTagService{}
}

//设置tag缓存的keys
func (c *CacheTagService) cacheTagKey(key interface{}, tag interface{}) {
	c.setTagKey(tag)
	if c.tagKey != nil {
		tagValue := []interface{}{key}
		value := gcache.Get(c.tagKey)
		if value != nil {
			keyValue := gconv.SliceAny(value)
			hasKey := false
			for _, v := range keyValue {
				if reflect.DeepEqual(key, v) {
					hasKey = true
					break
				}
			}
			if !hasKey {
				tagValue = append(tagValue, gconv.SliceAny(value)...)
			}
		}
		gcache.Set(c.tagKey, tagValue, 0)
	}
}

//获取带标签的键名
func (c *CacheTagService) setTagKey(tag interface{}) {
	if tag != nil {
		c.tagKey = interface{}(fmt.Sprintf("tag_%s", gmd5.MustEncryptString(gconv.String(tag))))
	}
}

// Set sets cache with <tagKey>-<value> pair, which is expired after <duration>.
// It does not expire if <duration> <= 0.
func (c *CacheTagService) Set(key interface{}, value interface{}, duration time.Duration, tag interface{}) {
	c.cacheTagKey(key, tag)
	gcache.Set(key, value, duration)
}

// SetIfNotExist sets cache with <tagKey>-<value> pair if <tagKey> does not exist in the cache,
// which is expired after <duration>. It does not expire if <duration> <= 0.
func (c *CacheTagService) SetIfNotExist(key interface{}, value interface{}, duration time.Duration, tag interface{}) bool {
	c.cacheTagKey(key, tag)
	return gcache.SetIfNotExist(key, value, duration)
}

// Sets batch sets cache with tagKey-value pairs by <data>, which is expired after <duration>.
//
// It does not expire if <duration> <= 0.
func (c *CacheTagService) Sets(data map[interface{}]interface{}, duration time.Duration, tag interface{}) {
	if tag != nil {
		for k, _ := range data {
			c.cacheTagKey(k, tag)
		}
		gcache.Sets(data, duration)
	} else {
		gcache.Sets(data, duration)
	}
}

// Get returns the value of <tagKey>.
// It returns nil if it does not exist or its value is nil.
func (c *CacheTagService) Get(key interface{}) interface{} {
	return gcache.Get(key)
}

// GetOrSet returns the value of <tagKey>,
// or sets <tagKey>-<value> pair and returns <value> if <tagKey> does not exist in the cache.
// The tagKey-value pair expires after <duration>.
//
// It does not expire if <duration> <= 0.
func (c *CacheTagService) GetOrSet(key interface{}, value interface{}, duration time.Duration, tag interface{}) interface{} {
	c.cacheTagKey(key, tag)
	return gcache.GetOrSet(key, value, duration)
}

// GetOrSetFunc returns the value of <tagKey>, or sets <tagKey> with result of function <f>
// and returns its result if <tagKey> does not exist in the cache. The tagKey-value pair expires
// after <duration>. It does not expire if <duration> <= 0.
func (c *CacheTagService) GetOrSetFunc(key interface{}, f func() interface{}, duration time.Duration, tag interface{}) interface{} {
	c.cacheTagKey(key, tag)
	return gcache.GetOrSetFunc(key, f, duration)
}

// GetOrSetFuncLock returns the value of <tagKey>, or sets <tagKey> with result of function <f>
// and returns its result if <tagKey> does not exist in the cache. The tagKey-value pair expires
// after <duration>. It does not expire if <duration> <= 0.
//
// Note that the function <f> is executed within writing mutex lock.
func (c *CacheTagService) GetOrSetFuncLock(key interface{}, f func() interface{}, duration time.Duration, tag interface{}) interface{} {
	c.cacheTagKey(key, tag)
	return gcache.GetOrSetFuncLock(key, f, duration)
}

// Contains returns true if <tagKey> exists in the cache, or else returns false.
func (c *CacheTagService) Contains(key interface{}) bool {
	return gcache.Contains(key)
}

// Remove deletes the <tagKey> in the cache, and returns its value.
func (c *CacheTagService) Remove(key interface{}) interface{} {
	return gcache.Remove(key)
}

// Removes deletes <keys> in the cache.
func (c *CacheTagService) Removes(keys []interface{}) {
	gcache.Removes(keys)
}

// Remove deletes the <tag> in the cache, and returns its value.
func (c *CacheTagService) RemoveByTag(tag interface{}) {
	c.setTagKey(tag)
	//删除tagKey 对应的 key和值
	keys := c.Get(c.tagKey)
	if keys != nil {
		ks := gconv.SliceAny(keys)
		c.Removes(ks)
	}
	c.Remove(c.tagKey)
}

// Removes deletes <tags> in the cache.
func (c *CacheTagService) RemoveByTags(tag []interface{}) {
	for _, v := range tag {
		c.RemoveByTag(v)
	}
}

// Data returns a copy of all tagKey-value pairs in the cache as map type.
func (c *CacheTagService) Data() map[interface{}]interface{} {
	return gcache.Data()
}

// Keys returns all keys in the cache as slice.
func (c *CacheTagService) Keys() []interface{} {
	return gcache.Keys()
}

// KeyStrings returns all keys in the cache as string slice.
func (c *CacheTagService) KeyStrings() []string {
	return gcache.KeyStrings()
}

// Values returns all values in the cache as slice.
func (c *CacheTagService) Values() []interface{} {
	return gcache.Values()
}

// Size returns the size of the cache.
func (c *CacheTagService) Size() int {
	return gcache.Size()
}
