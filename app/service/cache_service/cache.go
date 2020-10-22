package cache_service

import (
	"fmt"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/util/gconv"
	"reflect"
	"sync"
	"time"
)

var tagSetMux sync.Mutex

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
		value, _ := gcache.Get(c.tagKey)
		if value != nil {
			keyValue := gconv.SliceAny(value)
			for _, v := range keyValue {
				if !reflect.DeepEqual(key, v) {
					tagValue = append(tagValue, v)
				}
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
	tagSetMux.Lock()
	c.cacheTagKey(key, tag)
	gcache.Set(key, value, duration)
	tagSetMux.Unlock()
}

// SetIfNotExist sets cache with <tagKey>-<value> pair if <tagKey> does not exist in the cache,
// which is expired after <duration>. It does not expire if <duration> <= 0.
func (c *CacheTagService) SetIfNotExist(key interface{}, value interface{}, duration time.Duration, tag interface{}) bool {
	tagSetMux.Lock()
	defer tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := gcache.SetIfNotExist(key, value, duration)
	return v
}

// Sets batch sets cache with tagKey-value pairs by <data>, which is expired after <duration>.
//
// It does not expire if <duration> <= 0.
func (c *CacheTagService) Sets(data map[interface{}]interface{}, duration time.Duration, tag interface{}) {
	tagSetMux.Lock()
	if tag != nil {
		for k, _ := range data {
			c.cacheTagKey(k, tag)
		}
		gcache.Sets(data, duration)
	} else {
		gcache.Sets(data, duration)
	}
	tagSetMux.Unlock()
}

// Get returns the value of <tagKey>.
// It returns nil if it does not exist or its value is nil.
func (c *CacheTagService) Get(key interface{}) interface{} {
	v, _ := gcache.Get(key)
	return v
}

// GetOrSet returns the value of <tagKey>,
// or sets <tagKey>-<value> pair and returns <value> if <tagKey> does not exist in the cache.
// The tagKey-value pair expires after <duration>.
//
// It does not expire if <duration> <= 0.
func (c *CacheTagService) GetOrSet(key interface{}, value interface{}, duration time.Duration, tag interface{}) interface{} {
	tagSetMux.Lock()
	defer tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := gcache.GetOrSet(key, value, duration)
	return v
}

// GetOrSetFunc returns the value of <tagKey>, or sets <tagKey> with result of function <f>
// and returns its result if <tagKey> does not exist in the cache. The tagKey-value pair expires
// after <duration>. It does not expire if <duration> <= 0.
func (c *CacheTagService) GetOrSetFunc(key interface{}, f func() (interface{}, error), duration time.Duration, tag interface{}) interface{} {
	tagSetMux.Lock()
	defer tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := gcache.GetOrSetFunc(key, f, duration)
	return v
}

// GetOrSetFuncLock returns the value of <tagKey>, or sets <tagKey> with result of function <f>
// and returns its result if <tagKey> does not exist in the cache. The tagKey-value pair expires
// after <duration>. It does not expire if <duration> <= 0.
//
// Note that the function <f> is executed within writing mutex lock.
func (c *CacheTagService) GetOrSetFuncLock(key interface{}, f func() (interface{}, error), duration time.Duration, tag interface{}) interface{} {
	tagSetMux.Lock()
	defer tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := gcache.GetOrSetFuncLock(key, f, duration)
	return v
}

// Contains returns true if <tagKey> exists in the cache, or else returns false.
func (c *CacheTagService) Contains(key interface{}) bool {
	v, _ := gcache.Contains(key)
	return v
}

// Remove deletes the <tagKey> in the cache, and returns its value.
func (c *CacheTagService) Remove(key interface{}) interface{} {
	v, _ := gcache.Remove(key)
	return v
}

// Removes deletes <keys> in the cache.
func (c *CacheTagService) Removes(keys []interface{}) {
	gcache.Remove(keys...)
}

// Remove deletes the <tag> in the cache, and returns its value.
func (c *CacheTagService) RemoveByTag(tag interface{}) {
	tagSetMux.Lock()
	c.setTagKey(tag)
	//删除tagKey 对应的 key和值
	keys := c.Get(c.tagKey)
	if keys != nil {
		ks := gconv.SliceAny(keys)
		c.Removes(ks)
	}
	c.Remove(c.tagKey)
	tagSetMux.Unlock()
}

// Removes deletes <tags> in the cache.
func (c *CacheTagService) RemoveByTags(tag []interface{}) {
	for _, v := range tag {
		c.RemoveByTag(v)
	}
}

// Data returns a copy of all tagKey-value pairs in the cache as map type.
func (c *CacheTagService) Data() map[interface{}]interface{} {
	v, _ := gcache.Data()
	return v
}

// Keys returns all keys in the cache as slice.
func (c *CacheTagService) Keys() []interface{} {
	v, _ := gcache.Keys()
	return v
}

// KeyStrings returns all keys in the cache as string slice.
func (c *CacheTagService) KeyStrings() []string {
	v, _ := gcache.KeyStrings()
	return v
}

// Values returns all values in the cache as slice.
func (c *CacheTagService) Values() []interface{} {
	v, _ := gcache.Values()
	return v
}

// Size returns the size of the cache.
func (c *CacheTagService) Size() int {
	v, _ := gcache.Size()
	return v
}
