package user_online

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// Fill with you ideas below.
//列表搜索参数
type ReqListSearch struct {
	Username string `p:"userName"`
	Ip       string `p:"ipaddr"`
	PageNum  int    `p:"page"`     //当前页码
	PageSize int    `p:"pageSize"` //每页数
}

//获取在线用户列表
func GetOnlineListPage(req *ReqListSearch, hasToken bool) (total, page int, list []*Entity, err error) {
	page = req.PageNum
	model := Model
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
	if !hasToken {
		list, err = model.FieldsEx("token").Page(page, req.PageSize).Order("create_time DESC").All()
	} else {
		list, err = model.Page(page, req.PageSize).Order("create_time DESC").All()
	}
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

func GetInfoById(id int) (entity *Entity, err error) {
	entity, err = Model.FindOne("id", id)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取在线用户信息失败")
	}
	return
}
