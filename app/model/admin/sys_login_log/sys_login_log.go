package sys_login_log

import (
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

// Fill with you ideas below.
//查询列表请求参数
type SelectPageReq struct {
	LoginName string `p:"userName"`      //登陆名
	Status    string `p:"status"`        //状态
	Ipaddr    string `p:"ipaddr"`        //登录地址
	BeginTime string `p:"beginTime"`     //数据范围
	EndTime   string `p:"endTime"`       //开始时间
	PageNum   int    `p:"pageNum"`       //当前页码
	PageSize  int    `p:"pageSize"`      //每页数
	SortName  string `p:"orderByColumn"` //排序字段
	SortOrder string `p:"isAsc"`         //排序方式
}

func LoginLogListByPage(req *SelectPageReq) (total, page int, list []*Entity, err error) {
	model := Model
	page = req.PageNum
	order := "info_id DESC"

	if req.LoginName != "" {
		model = model.Where("login_name like ?", "%"+req.LoginName+"%")
	}
	if req.Status != "" {
		model = model.Where("status", gconv.Int(req.Status))
	}
	if req.Ipaddr != "" {
		model = model.Where("ipaddr like ?", "%"+req.Ipaddr+"%")
	}
	if req.BeginTime != "" {
		model = model.Where("login_time >=", utils.StrToTimestamp(req.BeginTime))
	}
	if req.EndTime != "" {
		model = model.Where("login_time <=", utils.StrToTimestamp(req.EndTime))
	}
	if req.SortName != "" {
		if req.SortOrder != "" {
			order = req.SortName + " " + req.SortOrder
		} else {
			order = req.SortName + " DESC"
		}
	}

	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	list, err = model.Page(page, req.PageSize).Order(order).All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//删除登录日志
func DeleteLoginLogByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}
	_, err = Model.Delete("info_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}

//清空日志
func ClearLoginLog() (err error) {
	_, err = g.DB().Exec("truncate " + Table)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("清除失败")
	}
	return
}
