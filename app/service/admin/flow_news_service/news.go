// ==========================================================================
// 生成日期：2020-09-17 10:13:16
// 生成人：gfast
// ==========================================================================
package wf_news_service

import (
	wfNewsModel "gfast/app/model/admin/wf_news"
	"gfast/app/model/admin/wf_run"
	"gfast/app/service/common/work_flow_service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// 添加
func AddSave(req *wfNewsModel.AddReq) error {
	return wfNewsModel.AddSave(req)
}

// 删除
func DeleteByIds(Ids []int) error {
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("事务开启失败")
	}
	//删除业务
	err = wfNewsModel.DeleteByIds(Ids, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	//删除运行流程信息
	runList, err := wf_run.Model.Fields("id").Where("from_id in (?) and from_table=?", Ids, "wf_news").FindAll()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		return gerror.New("获取流程信息失败")
	}
	runIds := make([]uint, len(runList))
	for key, run := range runList {
		runIds[key] = run.Id
	}
	_, err = wf_run.Model.TX(tx).Delete("id in (?)", runIds)
	if err != nil {
		tx.Rollback()
		g.Log().Error(err)
		return gerror.New("删除流程运行信息失败")
	}
	tx.Commit()
	return nil
}

//修改
func EditSave(editReq *wfNewsModel.EditReq) error {
	return wfNewsModel.EditSave(editReq)
}

// 根据ID查询
func GetByID(id int64) (*wfNewsModel.Entity, error) {
	return wfNewsModel.GetByID(id)
}

// 分页查询
func SelectListByPage(req *wfNewsModel.SelectPageReq, userId uint64, departmentId uint64) (total int,
	page int64, listBtn []*wfNewsModel.InfoBtn, err error) {
	var list []*wfNewsModel.Entity
	total, page, list, err = wfNewsModel.SelectListByPage(req)
	if err != nil {
		return
	}
	listBtn = make([]*wfNewsModel.InfoBtn, len(list))
	//获取处理按钮
	for k, v := range list {
		var btn g.MapStrAny
		btn, err = work_flow_service.SetBtn(v.Id, "wf_news", "title", "status", v.Status, userId, departmentId)
		if err != nil {
			btn = g.MapStrAny{
				"title": "提示：" + err.Error(),
				"type":  "alert",
			}
		}
		listBtn[k] = &wfNewsModel.InfoBtn{
			Entity:    v,
			ActionBtn: btn,
		}
	}
	return
}
