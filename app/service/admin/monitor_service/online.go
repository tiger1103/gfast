package monitor_service

import (
	"gfast/app/model/admin/user_online"
	"gfast/boot"
	"gfast/library/service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

//获取在线用户列表
func GetOnlineListPage(req *user_online.ReqListSearch) (total, page int, list []*user_online.Entity, err error) {
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}
	return user_online.GetOnlineListPage(req, false)
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
		user_online.Model.Where("id", entity.Id).Delete()
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
