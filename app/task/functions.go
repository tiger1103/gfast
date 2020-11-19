package task

import (
	"gfast/app/model/admin/user_online"
	"gfast/boot"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/util/gconv"
)

func init() {
	var task1 Entity
	task1.FuncName = "test1"
	task1.Param = nil
	task1.Run = Test1
	Add(task1)

	var task2 Entity
	task2.FuncName = "test2"
	task2.Param = nil
	task2.Run = Test2
	Add(task2)

	var checkUserOnline Entity
	checkUserOnline.FuncName = "checkUserOnline"
	checkUserOnline.Param = nil
	checkUserOnline.Run = CheckUserOnline
	Add(checkUserOnline)
}

//无参测试
func Test1() {
	println("无参测试")
}

//传参测试
func Test2() {
	//获取参数
	task := GetByName("test2")
	if task == nil {
		return
	}
	for _, v := range task.Param {
		println(v)
	}
}

//检查在线用户
func CheckUserOnline() {
	param := &user_online.ReqListSearch{
		PageNum:  1,
		PageSize: 50,
	}
	var total int
	for {
		var (
			list []*user_online.Entity
			err  error
		)
		total, _, list, err = user_online.GetOnlineListPage(param, true)
		if err != nil {
			g.Log().Error(err)
			break
		}
		if list == nil {
			break
		}
		for _, entity := range list {
			onlineInfo := GetOnlineInfo(entity.Token)
			if onlineInfo == nil {
				user_online.Model.Delete("id", entity.Id)
			}
		}
		param.PageNum++
		if param.PageNum*param.PageSize >= total {
			break
		}
	}

}

//通过token获取登录用户数据
func GetOnlineInfo(token string) g.Map {
	uuid, userKey := GetUuidUserKeyByToken(token)
	cacheKey := boot.AdminGfToken.CacheKey + userKey
	switch boot.AdminGfToken.CacheMode {
	case gtoken.CacheModeCache:
		userCacheValue, _ := gcache.Get(cacheKey)
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
