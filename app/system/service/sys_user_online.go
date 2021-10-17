/*
* @desc:在线用户管理
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/3/18 14:45
 */

package service

import (
	comModel "gfast/app/common/model"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/grpool"
)

type online struct {
	Pool *grpool.Pool
}

var (
	Online = &online{
		Pool: grpool.New(100),
	}
)

func (s *online) Invoke(data *model.SysUserOnline) {
	s.Pool.Add(func() {
		//写入数据
		SysUser.SaveOnline(data)
	})
}

// DeleteOnlineByToken 删除用户在线状态操作
func (s *online) DeleteOnlineByToken(token string) {
	_, err := dao.SysUserOnline.Delete(dao.SysUserOnline.Columns.Token, token)
	if err != nil {
		g.Log().Error(err)
	}
}

// GetOnlineListPage 搜素在线用户列表
func (s *online) GetOnlineListPage(req *model.SysUserOnlineSearchReq, hasToken ...bool) (total, page int, list []*model.SysUserOnline, err error) {
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	if req.PageSize == 0 {
		req.PageSize = comModel.PageSize
	}
	model := dao.SysUserOnline.M
	if req.Ip != "" {
		model = model.Where("ip like ?", "%"+req.Ip+"%")
	}
	if req.Username != "" {
		model = model.Where("user_name like ?", "%"+req.Username+"%")
	}
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if len(hasToken) == 0 || !hasToken[0] {
		model = model.FieldsEx("token")
	}
	err = model.Page(req.PageNum, req.PageSize).Order("create_time DESC").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	return
}

func (s *online) ForceLogout(ids []int) (tokens []string, err error) {
	var onlineList []*model.SysUserOnline
	onlineList, err = s.GetInfosByIds(ids)
	if err != nil {
		return
	}
	for _, v := range onlineList {
		tokens = append(tokens, v.Token)
	}
	_, err = dao.SysUserOnline.Where(dao.SysUserOnline.Columns.Id+" in(?)", ids).Delete()
	return
}

func (s *online) GetInfosByIds(ids []int) (onlineList []*model.SysUserOnline, err error) {
	err = dao.SysUserOnline.Where(dao.SysUserOnline.Columns.Id+" in(?)", ids).Scan(&onlineList)
	return
}
