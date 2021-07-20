/*
* @desc:操作日志处理
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/19 14:58
 */

package service

import (
	comModel "gfast/app/common/model"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"gfast/library"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/grpool"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

type sysOperLog struct {
	Pool *grpool.Pool
}

var SysOperLog = &sysOperLog{
	Pool: grpool.New(100),
}

func (s *sysOperLog) Invoke(data *dao.SysOperLogAdd) {
	s.Pool.Add(func() {
		//写入日志数据
		s.OperationLogAdd(data)
	})
}

// OperationLogAdd 添加操作日志
func (s sysOperLog) OperationLogAdd(data *dao.SysOperLogAdd) {
	menuTitle := ""
	if data.Menu != nil {
		menuTitle = data.Menu.Title
	}
	err, dept := data.User.GetDept()
	if err != nil {
		g.Log().Error(err)
		return
	}
	insertData := g.Map{
		dao.SysOperLog.C.Title:         menuTitle,
		dao.SysOperLog.C.Method:        data.Url.Path,
		dao.SysOperLog.C.RequestMethod: data.Method,
		dao.SysOperLog.C.OperatorType:  data.OperatorType,
		dao.SysOperLog.C.OperName:      data.User.UserName,
		dao.SysOperLog.C.DeptName:      dept.DeptName,
		dao.SysOperLog.C.OperIp:        data.ClientIp,
		dao.SysOperLog.C.OperLocation:  library.GetCityByIp(data.ClientIp),
		dao.SysOperLog.C.OperTime:      gtime.Now(),
	}
	rawQuery := data.Url.RawQuery
	if rawQuery != "" {
		rawQuery = "?" + rawQuery
	}
	insertData[dao.SysOperLog.C.OperUrl] = data.Url.Path + rawQuery
	if data.Params != nil {
		if v, ok := data.Params["apiReturnRes"]; ok {
			res := gconv.Map(v)
			if gconv.Int(res["code"]) == 0 {
				insertData[dao.SysOperLog.C.Status] = 1
			} else {
				insertData[dao.SysOperLog.C.Status] = 0
			}
			if _, ok = res["data"]; ok {
				delete(res, "data")
			}
			b, _ := gjson.Encode(res)
			if len(b) > 0 {
				insertData[dao.SysOperLog.C.JsonResult] = string(b)
			}
			delete(data.Params, "apiReturnRes")
		}
		b, _ := gjson.Encode(data.Params)
		if len(b) > 0 {
			insertData[dao.SysOperLog.C.OperParam] = string(b)
		}
	}
	_, err = dao.SysOperLog.Insert(insertData)
	if err != nil {
		g.Log().Error(err)
	}
}

func (s *sysOperLog) OperationLogListByPage(req *dao.SysOperLogSearchReq) (total, page int, list []*model.SysOperLog, err error) {
	model := dao.SysOperLog.M
	order := "oper_id DESC"
	if req != nil {
		if req.OperName != "" {
			model = model.Where("oper_name like ?", "%"+req.OperName+"%")
		}
		if req.Title != "" {
			model = model.Where("title like ?", "%"+req.Title+"%")
		}
		if req.RequestMethod != "" {
			model = model.Where("request_method = ?", req.RequestMethod)
		}
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
		if req.BeginTime != "" {
			model = model.Where("oper_time >=", req.BeginTime)
		}
		if req.EndTime != "" {
			model = model.Where("oper_time <=", req.EndTime)
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
		req.PageSize = comModel.PageSize
	}
	err = model.Page(page, req.PageSize).Order(order).Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	return
}

func (s *sysOperLog) DeleteOperationLogByIds(ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}
	_, err = dao.SysOperLog.Delete("oper_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}

func (s *sysOperLog) GetOperationLogById(id int64) (log *model.SysOperLog, err error) {
	if id == 0 {
		err = gerror.New("参数错误")
		return
	}
	err = dao.SysOperLog.Where("oper_id", id).Scan(&log)
	if err != nil {
		g.Log().Error(err)
	}
	if err != nil || log == nil {
		err = gerror.New("获取操作日志失败")
	}
	return
}

func (s *sysOperLog) ClearOperationLog() (err error) {
	_, err = g.DB().Exec("truncate " + dao.SysOperLog.Table)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("清除失败")
	}
	return
}
