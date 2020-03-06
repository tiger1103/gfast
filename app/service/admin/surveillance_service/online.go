package surveillance_service

import (
	"gfast/app/model/admin/user_online"
	"gfast/boot"
	"gfast/library/utils"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/util/gconv"
)

//获取在线用户列表
func GetOnlineListPage(req *user_online.ReqListSearch) (total, page int, list []*user_online.Entity, err error) {
	model := user_online.Model
	if req != nil {
		if req.Ip != "" {
			model = model.Where("ip like ?", "%"+req.Ip+"%")
		}
		if req.Username != "" {
			model = model.Where("username like ?", "%"+req.Username+"%")
		}
	}
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = utils.AdminPageNum
	}
	list, err = model.FieldsEx("token").Page(page, req.PageSize).Order("create_time DESC").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
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
