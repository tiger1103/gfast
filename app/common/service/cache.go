package service

import (
	"context"
	"fmt"
	"gfast/app/common/global"
	"github.com/gogf/gcache-adapter/adapter"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/util/gconv"
	"reflect"
	"sync"
	"time"
)

type cache struct {
}

type cacheTagService struct {
	tagKey    interface{}
	cache     *gcache.Cache
	tagSetMux *sync.Mutex
}

var (
	Cache     = new(cache)
	userRedis = g.Cfg().GetBool("redis.open")
	gChe      = gcache.New()
)

func (s *cache) New() *cacheTagService {
	gChe.Ctx(context.Background())
	if userRedis {
		adapter := adapter.NewRedis(g.Redis())
		gChe.SetAdapter(adapter)
	}
	return &cacheTagService{
		cache:     gChe,
		tagSetMux: new(sync.Mutex),
	}
}

//设置tag缓存的keys
func (c *cacheTagService) cacheTagKey(key interface{}, tag interface{}) {
	c.setTagKey(tag)
	if c.tagKey != nil {
		tagValue := []interface{}{key}
		value, _ := c.cache.Get(c.tagKey)
		if value != nil {
			var keyValue []interface{}
			//若是字符串
			if kStr, ok := value.(string); ok {
				js, err := gjson.DecodeToJson(kStr)
				if err != nil {
					g.Log().Error(err)
					return
				}
				keyValue = gconv.SliceAny(js.Value())
			} else {
				keyValue = gconv.SliceAny(value)
			}
			for _, v := range keyValue {
				if !reflect.DeepEqual(key, v) {
					tagValue = append(tagValue, v)
				}
			}
		}
		c.cache.Set(c.tagKey, tagValue, 0)
	}
}

//获取带标签的键名
func (c *cacheTagService) setTagKey(tag interface{}) {
	if tag != nil {
		c.tagKey = interface{}(fmt.Sprintf("%s_tag_%s", global.CachePrefix, gmd5.MustEncryptString(gconv.String(tag))))
	}
}

// Set sets cache with <tagKey>-<value> pair, which is expired after <duration>.
// It does not expire if <duration> <= 0.
func (c *cacheTagService) Set(key interface{}, value interface{}, duration time.Duration, tag ...interface{}) {
	c.tagSetMux.Lock()
	if len(tag) > 0 {
		c.cacheTagKey(key, tag[0])
	}
	err := c.cache.Set(key, value, duration)
	if err != nil {
		g.Log().Error(err)
	}
	c.tagSetMux.Unlock()
}

// SetIfNotExist sets cache with <tagKey>-<value> pair if <tagKey> does not exist in the cache,
// which is expired after <duration>. It does not expire if <duration> <= 0.
func (c *cacheTagService) SetIfNotExist(key interface{}, value interface{}, duration time.Duration, tag interface{}) bool {
	c.tagSetMux.Lock()
	defer c.tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := c.cache.SetIfNotExist(key, value, duration)
	return v
}

// Sets batch sets cache with tagKey-value pairs by <data>, which is expired after <duration>.
//
// It does not expire if <duration> <= 0.
func (c *cacheTagService) Sets(data map[interface{}]interface{}, duration time.Duration, tag interface{}) {
	c.tagSetMux.Lock()
	if tag != nil {
		for k, _ := range data {
			c.cacheTagKey(k, tag)
		}
		c.cache.Sets(data, duration)
	} else {
		c.cache.Sets(data, duration)
	}
	c.tagSetMux.Unlock()
}

// Get returns the value of <tagKey>.
// It returns nil if it does not exist or its value is nil.
func (c *cacheTagService) Get(key interface{}) interface{} {
	v, err := c.cache.Get(key)
	if err != nil {
		g.Log().Error(err)
	}
	return v
}

// GetOrSet returns the value of <tagKey>,
// or sets <tagKey>-<value> pair and returns <value> if <tagKey> does not exist in the cache.
// The tagKey-value pair expires after <duration>.
//
// It does not expire if <duration> <= 0.
func (c *cacheTagService) GetOrSet(key interface{}, value interface{}, duration time.Duration, tag interface{}) interface{} {
	c.tagSetMux.Lock()
	defer c.tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := c.cache.GetOrSet(key, value, duration)
	return v
}

// GetOrSetFunc returns the value of <tagKey>, or sets <tagKey> with result of function <f>
// and returns its result if <tagKey> does not exist in the cache. The tagKey-value pair expires
// after <duration>. It does not expire if <duration> <= 0.
func (c *cacheTagService) GetOrSetFunc(key interface{}, f func() (interface{}, error), duration time.Duration, tag interface{}) interface{} {
	c.tagSetMux.Lock()
	defer c.tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := c.cache.GetOrSetFunc(key, f, duration)
	return v
}

// GetOrSetFuncLock returns the value of <tagKey>, or sets <tagKey> with result of function <f>
// and returns its result if <tagKey> does not exist in the cache. The tagKey-value pair expires
// after <duration>. It does not expire if <duration> <= 0.
//
// Note that the function <f> is executed within writing mutex lock.
func (c *cacheTagService) GetOrSetFuncLock(key interface{}, f func() (interface{}, error), duration time.Duration, tag interface{}) interface{} {
	c.tagSetMux.Lock()
	defer c.tagSetMux.Unlock()
	c.cacheTagKey(key, tag)
	v, _ := c.cache.GetOrSetFuncLock(key, f, duration)
	return v
}

// Contains returns true if <tagKey> exists in the cache, or else returns false.
func (c *cacheTagService) Contains(key interface{}) bool {
	v, _ := c.cache.Contains(key)
	return v
}

// Remove deletes the <tagKey> in the cache, and returns its value.
func (c *cacheTagService) Remove(key interface{}) interface{} {
	v, _ := c.cache.Remove(key)
	return v
}

// Removes deletes <keys> in the cache.
func (c *cacheTagService) Removes(keys []interface{}) {
	c.cache.Remove(keys...)
}

// Remove deletes the <tag> in the cache, and returns its value.
func (c *cacheTagService) RemoveByTag(tag interface{}) {
	c.tagSetMux.Lock()
	c.setTagKey(tag)
	//删除tagKey 对应的 key和值
	keys := c.Get(c.tagKey)
	if keys != nil {
		//如果是字符串
		if kStr, ok := keys.(string); ok {
			js, err := gjson.DecodeToJson(kStr)
			if err != nil {
				g.Log().Error(err)
				return
			}
			ks := gconv.SliceAny(js.Value())
			c.Removes(ks)
		} else {
			ks := gconv.SliceAny(keys)
			c.Removes(ks)
		}
	}
	c.Remove(c.tagKey)
	c.tagSetMux.Unlock()
}

// Removes deletes <tags> in the cache.
func (c *cacheTagService) RemoveByTags(tag []interface{}) {
	for _, v := range tag {
		c.RemoveByTag(v)
	}
}

// Data returns a copy of all tagKey-value pairs in the cache as map type.
func (c *cacheTagService) Data() map[interface{}]interface{} {
	v, _ := c.cache.Data()
	return v
}

// Keys returns all keys in the cache as slice.
func (c *cacheTagService) Keys() []interface{} {
	v, _ := c.cache.Keys()
	return v
}

// KeyStrings returns all keys in the cache as string slice.
func (c *cacheTagService) KeyStrings() []string {
	v, _ := c.cache.KeyStrings()
	return v
}

// Values returns all values in the cache as slice.
func (c *cacheTagService) Values() []interface{} {
	v, _ := c.cache.Values()
	return v
}

// Size returns the size of the cache.
func (c *cacheTagService) Size() int {
	v, _ := c.cache.Size()
	return v
}
