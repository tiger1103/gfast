package monitor_service

import (
	"gfast/app/model/admin/user_online"
	"gfast/boot"
	"gfast/library/service"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/util/gconv"
)

//获取在线用户列表
func GetOnlineListPage(req *user_online.ReqListSearch) (total, page int, list []*user_online.Entity, err error) {
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}
	return user_online.GetOnlineListPage(req)
}

//通过token获取登录用户数据
func GetOnlineInfo(token string) g.Map {
	uuid, userKey := GetUuidUserKeyByToken(token)
	cacheKey := boot.AdminGfToken.CacheKey + userKey
	switch boot.AdminGfToken.CacheMode {
	case gtoken.CacheModeCache:
		userCacheValue := gcache.Get(cacheKey)
		if userCacheValue == nil {
			return nil
		}
		return gconv.Map(userCacheValue)
	case gtoken.CacheModeRedis:
		var userCache g.Map
		userCacheJson, err := g.Redis().Do("GET", cacheKey)
		if err != nil {
			g.Log().Error("[GToken]cache get error", err)
			return nil
		}
		if userCacheJson == nil {
			return nil
		}
		err = gjson.DecodeTo(userCacheJson, &userCache)
		if err != nil {
			g.Log().Error("[GToken]cache get json error", err)
			return nil
		}
		if uuid != userCache["uuid"] {
			return nil
		}
		return userCache
	}
	return nil
}

//通过token获取uuid和userKey
func GetUuidUserKeyByToken(token string) (uuid, userKey string) {
	decryptToken := boot.AdminGfToken.DecryptToken(token)
	if !decryptToken.Success() {
		return
	}
	userKey = decryptToken.GetString("userKey")
	uuid = decryptToken.GetString("uuid")
	return
}

//强制退出操作
func ForceLogout(ids []int) error {
	for _, id := range ids {
		entity, err := user_online.GetInfoById(id)
		if err != nil {
			g.Log().Error(err)
			return gerror.New("获取在线用户信息失败")
		}
		if entity == nil {
			continue
		}
		entity.Delete()
		_, userKey := GetUuidUserKeyByToken(entity.Token)
		if userKey == "" {
			continue
		}
		userKey = boot.AdminGfToken.CacheKey + userKey
		_, err = g.Redis().Do("DEL", userKey)
		if err != nil {
			return err
		}
	}
	return nil
}
