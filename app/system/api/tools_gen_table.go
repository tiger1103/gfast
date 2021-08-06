/*
* @desc:代码生成
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/22 15:11
 */

package api

import (
	comModel "gfast/app/common/model"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"gfast/app/system/service"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
	"strings"
)

type toolsGenTable struct {
	SystemBase
}

var ToolsGenTable = new(toolsGenTable)

// TableList 代码生成页列表数据
func (c *toolsGenTable) TableList(r *ghttp.Request) {
	var req *dao.ToolsGenTableSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	total, list, err := service.ToolsGenTable.SelectListByPage(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, g.Map{
		"total": total,
		"list":  list,
	})
}

// DataList 导入表格页列表数据
func (c *toolsGenTable) DataList(r *ghttp.Request) {
	var req *dao.ToolsGenTableSearchReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}

	total, list, err := service.ToolsGenTable.SelectDbTableList(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, g.Map{
		"total": total,
		"list":  list,
	})
}

// ImportTableSave 导入表结构操作
func (c *toolsGenTable) ImportTableSave(r *ghttp.Request) {
	tables := r.GetString("tables")
	if tables == "" {
		c.FailJsonExit(r, "请选择要导入的表格")
	}
	tableArr := strings.Split(tables, ",")
	tableList, err := service.ToolsGenTable.SelectDbTableListByNames(tableArr)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	if tableList == nil {
		c.FailJsonExit(r, "表信息不存在")
	}
	err = service.ToolsGenTable.ImportGenTable(tableList)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "导入数据表成功")
}

// ColumnList 表格字段列表数据
func (c *toolsGenTable) ColumnList(r *ghttp.Request) {
	tableId := r.GetInt64("tableId")
	if tableId == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	list, err := service.ToolsGenTableColumn.SelectGenTableColumnListByTableId(tableId)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	var tableInfo *model.ToolsGenTable
	var tableMap g.Map
	tableInfo, err = service.ToolsGenTable.GetTableInfoByTableId(tableId)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	tableMap = gconv.Map(tableInfo)
	//如果是树表则设置树表配置
	if tableInfo != nil && tableInfo.TplCategory == "tree" {
		options := gjson.New(tableInfo.Options)
		tableMap["treeCode"] = options.Get("treeCode")
		tableMap["treeParentCode"] = options.Get("treeParentCode")
		tableMap["treeName"] = options.Get("treeName")
	}
	res := g.Map{
		"rows": list,
		"info": tableMap,
	}
	c.SusJsonExit(r, res)
}

// RelationTable 获取可选的关联表
func (c *toolsGenTable) RelationTable(r *ghttp.Request) {
	//获取表数据列表
	_, tableList, err := service.ToolsGenTable.SelectListByPage(&dao.ToolsGenTableSearchReq{
		PageReq: comModel.PageReq{
			PageSize: 1000,
		},
	})
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	//获取所有字段
	allColumns, err := service.ToolsGenTableColumn.GetAllTableColumns()
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	tableColumns := make([]*dao.ToolsGenTableColumnsRes, len(tableList))
	for k, v := range tableList {
		tableColumns[k] = &dao.ToolsGenTableColumnsRes{
			ToolsGenTable: v,
			Columns:       make([]*model.ToolsGenTableColumn, 0),
		}
		for _, cv := range allColumns {
			if cv.TableId == v.TableId {
				tableColumns[k].Columns = append(tableColumns[k].Columns, cv)
			}
		}
	}
	c.SusJsonExit(r, tableColumns)
}

// EditSave 编辑表格生成信息
func (c *toolsGenTable) EditSave(r *ghttp.Request) {
	var req *dao.ToolsGenTableEditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		c.FailJsonExit(r, err.(gvalid.Error).FirstString())
	}
	err := service.ToolsGenTable.SaveEdit(req)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "设置成功")
}

// Preview 代码预览
func (c *toolsGenTable) Preview(r *ghttp.Request) {
	tableId := r.GetInt64("tableId")
	if tableId == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	data, _, err := service.ToolsGenTable.GenData(tableId, r.GetCtx())
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, data)
}

// BatchGenCode 代码生成
func (c *toolsGenTable) BatchGenCode(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	err := service.ToolsGenTable.GenCode(ids, r.GetCtx())
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "生成成功")
}

// Delete 删除导入的表信息
func (c *toolsGenTable) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		c.FailJsonExit(r, "参数错误")
	}
	err := service.ToolsGenTable.Delete(ids)
	if err != nil {
		c.FailJsonExit(r, err.Error())
	}
	c.SusJsonExit(r, "删除成功")
}
