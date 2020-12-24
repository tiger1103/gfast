// ==========================================================================
// 生成日期：2020-08-24 17:13:46
// 生成人：gfast
// ==========================================================================
package wf_flow

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

// AddReq 用于存储新增请求的请求参数
type AddReq struct {
	Type      string `p:"type" `
	FlowName  string `p:"flowName" v:"required#流程名称不能为空"`
	FlowDesc  string `p:"flowDesc" `
	SortOrder uint   `p:"sortOrder" `
	Status    uint   `p:"status" v:"required#状态不能为空"`
	Uid       uint64
	AddTime   int
}

// EditReq 用于存储修改请求参数
type EditReq struct {
	Id        int64  `p:"id" v:"required#主键ID不能为空"`
	Type      string `p:"type" `
	FlowName  string `p:"flowName" v:"required#流程名称不能为空"`
	FlowDesc  string `p:"flowDesc" `
	SortOrder uint   `p:"sortOrder" `
	Status    uint   `p:"status" v:"required#状态不能为空"`
}
type RemoveReq struct {
	Ids []int `p:"ids"` //删除id
}

type StatusReq struct {
	Id     int  `p:"id" v:"required|min:1#ID不能为空|ID不能为空"`
	Status uint `p:"status" v:"required|in:0,1#状态不能为空|状态不能为空"`
}

// SelectPageReq 用于存储分页查询的请求参数
type SelectPageReq struct {
	Type      string `p:"type"`      //流程类别
	FlowName  string `p:"flowName"`  //流程名称
	Status    string `p:"status"`    //状态
	BeginTime string `p:"beginTime"` //开始时间
	EndTime   string `p:"endTime"`   //结束时间
	PageNum   int64  `p:"pageNum"`   //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
}

//发起工作流参数
type StartFlowReq struct {
	WfType        string `p:"wf_type" v:"required#业务表类型不能为空" json:"wf_type"`
	WfStatusField string `p:"wf_status_field" v:"required#业务表状态字段名称不能为空" json:"wf_status_field"`
	WfTitle       string `p:"wf_title" v:"required#wf_title字段值不能为空" json:"wf_title"`
	WfFid         uint   `p:"wf_fid" v:"required|min:1#业务ID不能为空|业务ID不能为空" json:"wf_fid"`
}

//保存发起信息请求参数
type SaveWfFlowReq struct {
	WfType        string `p:"wfType" v:"required#业务表类型不能为空" json:"wf_type"`
	WfFid         int    `p:"wfFid" v:"required|min:1#业务ID不能为空|业务ID不能为空" json:"wf_fid"`
	WfId          int64  `p:"wfId" v:"required|min:1#工作流ID不能为空|工作流ID不能为空" json:"wf_id"`
	WfTitle       string `p:"WfTitle" v:"required#标题字段名称不能为空"`       //业务表标题字段名称
	WfStatusField string `p:"WfStatusField" v:"required#状态字段名称不能为空"` //业务表状态字段名称
	NewType       uint   `p:"newType"`                               //审批紧急程度
	CheckCon      string `p:"checkCon"`
	RunProcess    uint   `p:"runProcess"`
	RunId         uint   `p:"runId"`
	Art           string `p:"art"`
	UserId        uint64
}

//获取流程审批数据参数
type CheckWfReq struct {
	WfTitle       string `p:"wf_title" json:"wf_title"`
	WfFid         uint   `p:"wf_fid" v:"required|min:1#业务ID不能为空|业务ID不能为空" json:"wf_fid"`
	WfType        string `p:"wf_type" v:"required#业务表类型不能为空" json:"wf_type"`
	WfStatusField string `p:"wf_status_field" v:"required#业务表状态字段名称不能为空" json:"wf_status_field"`
}

//保存流程审批参数
type CheckWfSaveReq struct {
	WfTitle       string `p:"wfTitle" json:"wf_title"`
	WfFid         uint   `p:"wfFid"  json:"wf_fid" v:"required|min:1#业务ID不能为空|业务ID不能为空"`
	WfType        string `p:"wfType" v:"required#业务表类型不能为空"  json:"wf_type"`
	WfStatusField string `p:"WfStatusField" v:"required#状态字段名称不能为空"` //业务表状态字段名称
	FlowId        int64  `p:"flowId" v:"required|min:1#流程Id不能为空|流程Id不能为空"  json:"flow_id"`
	FlowProcess   uint   `p:"flowProcess" v:"required|min:1#流程步骤Id不能为空|流程步骤Id不能为空" json:"flow_process"`
	RunId         uint   `p:"runId" json:"run_id" v:"required|min:1#当前运行流程Id不能为空|当前运行流程Id不能为空"`
	RunProcess    uint   `p:"runProcess" json:"run_process" v:"required|min:1#当前运行流程步骤Id不能为空|当前运行流程步骤Id不能为空"`
	Npid          string `p:"npid" json:"npid"`
	WfMode        uint   `p:"wfMode" json:"wf_mode"`
	CheckCon      string `p:"checkCon" json:"check_con"`
	Art           string `p:"art" json:"art"`
	SingSt        uint   `p:"singSt" json:"sing_st"`
	SubmitToSave  string `p:"submitToSave" json:"submit_to_save" v:"required#审批方式不能为空"`
	UserId        uint64 `json:"user_id"`
	Sup           int    `p:"sup"  json:"sup"`
	Todo          string `p:"todo" json:"todo"`
	WfSingFlow    uint64 `p:"WfSingFlow"` //会签人
	WfBackFlow    uint   `p:"WfBackFlow"` //退回的步骤ID，如果等于0则默认是第一步
	BTodo         string `p:"bTodo"`
}

type BackTodoReq struct {
	Pid   string `p:"backId" v:required#流程步骤ID必须`
	RunId uint   `p:"runId" v:required|min:1#流程运行ID必须|流程步骤ID必须`
}

// GetByID 根据ID查询记录
func GetByID(id int64) (*Entity, error) {
	entity, err := Model.FindOne(id)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据ID查询记录出错")
	}
	if entity == nil {
		return nil, gerror.New("根据ID未能查询到记录")
	}
	return entity, nil
}

// AddSave 添加
func AddSave(req *AddReq) error {
	entity := new(Entity)
	entity.Type = req.Type
	entity.FlowName = req.FlowName
	entity.FlowDesc = req.FlowDesc
	entity.SortOrder = req.SortOrder
	entity.Status = req.Status
	entity.Uid = req.Uid
	entity.AddTime = gconv.Int(gtime.Timestamp())
	result, err := entity.Insert()
	if err != nil {
		return err
	}
	_, err = result.LastInsertId()
	if err != nil {
		return err
	}
	return nil
}

// 删除
func DeleteByIds(Ids []int) error {
	_, err := Model.Where("id in(?)", Ids).Update(g.Map{"is_del": 1})
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}

func SetStatus(req *StatusReq) error {
	entity, err := Model.Where("id", req.Id).One()
	if err != nil {
		g.Log().Debug(err)
		return gerror.New("设置失败")
	}
	if entity != nil {
		entity.Status = req.Status
		_, err := Model.Save(entity)
		if err != nil {
			g.Log().Debug(err)
			return gerror.New("设置失败")
		}
	}
	return nil
}

// 根据ID来修改信息
func EditSave(req *EditReq) error {
	// 先根据ID来查询要修改的记录
	entity, err := GetByID(req.Id)
	if err != nil {
		return err
	}
	// 修改实体
	entity.Type = req.Type
	entity.FlowName = req.FlowName
	entity.FlowDesc = req.FlowDesc
	entity.SortOrder = req.SortOrder
	entity.Status = req.Status
	_, err = Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("修改失败")
	}
	return nil
}

// 分页查询,返回值total总记录数,page当前页
func SelectListByPage(req *SelectPageReq) (total int, page int64, list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.Type != "" {
			model = model.Where("type = ?", req.Type)
		}
		if req.FlowName != "" {
			model = model.Where("flow_name like ?", "%"+req.FlowName+"%")
		}
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
	}
	model = model.Where("is_del", 0)
	// 查询总记录数(总行数)
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总记录数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = 10
	}
	// 分页排序查询
	list, err = model.Page(int(page), int(req.PageSize)).Order("sort_order asc , id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询失败")
		return
	}
	return
}

// 获取所有数据
func SelectListAll(req *SelectPageReq) (list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.Type != "" {
			model.Where("type = ?", req.Type)
		}
		if req.FlowName != "" {
			model.Where("flow_name like ?", "%"+req.FlowName+"%")
		}
	}
	// 查询
	list, err = model.Order("id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询失败")
		return
	}
	return
}

//获取对应类型的工作流
func GetWorkFlowByType(wfType string) (flows []*Entity, err error) {
	flows, err = Model.Where(Columns.Type, wfType).Where(Columns.Status, 1).
		Where(Columns.IsDel, 0).FindAll()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取工作流列表数据失败")
	}
	return
}
