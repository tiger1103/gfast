package work_flow_service

import (
	"gfast/app/model/admin/user"
	"gfast/app/model/admin/wf_business_checker"
	"gfast/app/model/admin/wf_flow_process"
	"gfast/app/model/admin/wf_run"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

func SetBusinessChecker(fid int, wfType string, runId int64, process *wf_flow_process.Entity, todo string, tx *gdb.TX) error {
	data, err := SetUserDept(fid, wfType, runId, process, todo)
	if err != nil {
		return err
	}
	return wf_business_checker.SaveInfo(data, tx)
}

func SetBusinessCheckers(fid int, wfType string, runId int64, processes []*wf_flow_process.Entity, todo string, tx *gdb.TX) error {
	data := &wf_business_checker.SaveParams{
		FromTable: wfType,
		FromId:    gconv.Uint64(fid),
	}
	for _, process := range processes {
		d, err := SetUserDept(fid, wfType, runId, process, todo)
		if err != nil {
			return err
		}
		if d != nil {
			if data.UserId != "" {
				data.UserId = data.UserId + "," + d.UserId
			} else {
				data.UserId = d.UserId
			}
			if data.DepartmentId != "" {
				data.DepartmentId = data.DepartmentId + "," + d.DepartmentId
			} else {
				data.DepartmentId = d.DepartmentId
			}
		}
	}
	return wf_business_checker.SaveInfo(data, tx)
}

func SetUserDept(fid int, wfType string, runId int64, process *wf_flow_process.Entity, todo string) (*wf_business_checker.SaveParams, error) {
	processData := &ProcessData{
		Entity: process,
	}
	if process.AutoPerson == 6 && process.ProcessType == "is_one" {
		//事务处理人员
		wf, err := wf_run.GetRunById(gconv.Uint(runId))
		if err != nil {
			return nil, err
		}
		userIdBil, err := GetBilValue(wf.FromTable, wf.FromId, process.WorkText)
		if err != nil {
			return nil, err
		}
		userInfo, err := user.GetUserById(gconv.Uint64(userIdBil))
		if err != nil {
			return nil, err
		}
		processData.UserInfo = userInfo
		processData.Todo = g.MapStrAny{"text": userInfo.UserNickname}
	}
	sponsorIds := ""   //用户id
	sponsorDepts := "" //部门id
	//非自由选择
	if todo == "" {
		if process.AutoPerson == 3 {
			//办理人员
			sponsorIds = process.RangeUserIds
		} else if process.AutoPerson == 4 {
			//办理人员
			sponsorIds = process.AutoSponsorIds
		} else if process.AutoPerson == 5 {
			//办理部门
			sponsorDepts = process.AutoRoleIds
		} else if process.AutoPerson == 6 {
			//事务接收
			sponsorIds = gconv.String(processData.UserInfo.Id)
		}
	} else {
		todoArr := gstr.Split(todo, "*%*")
		sponsorIds = todoArr[0]
	}
	data := &wf_business_checker.SaveParams{
		FromTable:    wfType,
		FromId:       gconv.Uint64(fid),
		UserId:       sponsorIds,
		DepartmentId: sponsorDepts,
	}
	return data, nil
}

func DeleteBusinessChecker(fid uint, wfType string, tx *gdb.TX) error {
	_, err := wf_business_checker.Model.TX(tx).Where(g.Map{"from_table": wfType, "from_id": fid}).Delete()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除业务审批人员/部门信息失败")
	}
	return nil
}
