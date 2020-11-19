package sys_oper_log

import (
	"gfast/app/model/admin/auth_rule"
	"gfast/app/model/admin/user"
	"gfast/library/service"
	"gfast/library/utils"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"net/url"
)

// Fill with you ideas below.

//查询列表请求参数
type SelectPageReq struct {
	Title     string `p:"title"`         //系统模块
	OperName  string `p:"operName"`      //操作人员
	Status    string `p:"status"`        //操作状态
	BeginTime string `p:"beginTime"`     //数据范围
	EndTime   string `p:"endTime"`       //开始时间
	PageNum   int    `p:"pageNum"`       //当前页码
	PageSize  int    `p:"pageSize"`      //每页数
	SortName  string `p:"orderByColumn"` //排序字段
	SortOrder string `p:"isAsc"`         //排序方式
}

//新增操作日志记录
func Add(user *user.Entity, menu *auth_rule.Entity, url *url.URL,
	param g.Map, method, clientIp string) {
	var operLog Entity
	if menu != nil {
		operLog.Title = menu.Title
	}
	operLog.Method = url.Path
	operLog.RequestMethod = method
	operLog.OperatorType = 1
	operLog.OperName = user.UserName
	rawQuery := url.RawQuery
	if rawQuery != "" {
		rawQuery = "?" + rawQuery
	}
	operLog.OperUrl = url.Path + rawQuery
	operLog.OperIp = clientIp
	operLog.OperLocation = utils.GetCityByIp(operLog.OperIp)
	operLog.OperTime = gtime.Timestamp()
	if param != nil {
		if v, ok := param["apiReturnRes"]; ok {
			res := gconv.Map(v)
			if gconv.Int(res["code"]) == 0 {
				operLog.Status = 1
			} else {
				operLog.Status = 0
			}
			if _, ok = res["data"]; ok {
				delete(res, "data")
			}
			b, _ := gjson.Encode(res)
			if len(b) > 0 {
				operLog.JsonResult = string(b)
			}
			delete(param, "apiReturnRes")
		}
		b, _ := gjson.Encode(param)
		if len(b) > 0 {
			operLog.OperParam = string(b)
		}
	}
	Model.Save(operLog)
}

//操作日志列表
func ListByPage(req *SelectPageReq) (total, page int, list []*Entity, err error) {
	model := Model
	order := "oper_id DESC"
	if req != nil {
		if req.OperName != "" {
			model = model.Where("oper_name like ?", "%"+req.OperName+"%")
		}
		if req.Title != "" {
			model = model.Where("title like ?", "%"+req.Title+"%")
		}
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
		if req.BeginTime != "" {
			model = model.Where("oper_time >=", utils.StrToTimestamp(req.BeginTime))
		}
		if req.EndTime != "" {
			model = model.Where("oper_time <=", utils.StrToTimestamp(req.EndTime))
		}
		if req.SortName != "" {
			if req.SortOrder != "" {
				order = req.SortName + " " + req.SortOrder
			} else {
				order = req.SortName + " DESC"
			}
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
		req.PageSize = service.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order(order).All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//通过id获取操作日志
func GetById(id int64) (log *Entity, err error) {
	if id == 0 {
		err = gerror.New("参数错误")
		return
	}
	log, err = Model.FindOne("oper_id", id)
	if err != nil {
		g.Log().Error(err)
	}
	if err != nil || log == nil {
		err = gerror.New("获取操作日志失败")
	}
	return
}

//删除
func DeleteByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}
	_, err = Model.Delete("oper_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}

//清空
func ClearLog() (err error) {
	_, err = g.DB().Exec("truncate " + Table)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("清除失败")
	}
	return
}
