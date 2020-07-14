package admin

import (
	"gfast/app/model/admin/gen_table"
	"gfast/app/service/admin/gen_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
	"strings"
)

type Gen struct{}

//查询数据库列表
func (c *Gen) DataList(r *ghttp.Request) {
	var req *gen_table.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}

	total, list, err := gen_service.SelectDbTableList(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", g.Map{
		"total": total,
		"list":  list,
	})
}

//表列表
func (c *Gen) TableList(r *ghttp.Request) {
	var req *gen_table.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, list, err := gen_service.SelectListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", g.Map{
		"total": total,
		"list":  list,
	})
}

//导入表结构操作
func (c *Gen) ImportTableSave(r *ghttp.Request) {
	tables := r.GetString("tables")
	if tables == "" {
		response.FailJson(true, r, "请选择要导入的表格")
	}
	user := user_service.GetLoginAdminInfo(r)
	operName := user.UserName
	tableArr := strings.Split(tables, ",")
	tableList, err := gen_service.SelectDbTableListByNames(tableArr)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	if tableList == nil {
		response.FailJson(true, r, "表信息不存在")
	}
	err = gen_service.ImportGenTable(tableList, operName)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "导入数据表成功")
}

//根据表格ID获取表格字段列表数据
func (c *Gen) ColumnList(r *ghttp.Request) {
	tableId := r.GetInt64("tableId")
	if tableId == 0 {
		response.FailJson(true, r, "参数错误")
	}
	list, err := gen_service.SelectGenTableColumnListByTableId(tableId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	var tableInfo *gen_table.Entity
	var tableMap g.Map
	tableInfo, err = gen_service.GetTableInfoByTableId(tableId)
	tableMap = gconv.Map(tableInfo)
	//如果是树表则设置树表配置
	if tableInfo != nil && tableInfo.TplCategory == "tree" {
		options := gjson.New(tableInfo.Options)
		tableMap["tree_code"] = options.Get("tree_code")
		tableMap["tree_parent_code"] = options.Get("tree_parent_code")
		tableMap["tree_name"] = options.Get("tree_name")
	}

	res := g.Map{
		"rows": list,
		"info": tableMap,
	}
	response.SusJson(true, r, "ok", res)
}

//编辑表格信息
func (c *Gen) EditSave(r *ghttp.Request) {
	var req *gen_table.EditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	userInfo := user_service.GetLoginAdminInfo(r)
	req.UserName = userInfo.UserName
	err := gen_service.SaveEdit(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "设置成功")
}

//删除表格数据
func (c *Gen) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "参数错误")
	}
	err := gen_service.Delete(ids)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "删除成功")
}

//代码生成预览
func (c *Gen) Preview(r *ghttp.Request) {
	tableId := r.GetInt64("tableId")
	if tableId == 0 {
		response.FailJson(true, r, "参数错误")
	}
	entity, err := gen_service.SelectRecordById(tableId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	if entity == nil {
		response.FailJson(true, r, "表格数据不存在")
	}
	gen_service.SetPkColumn(entity, entity.Columns)

	controllerKey := "vm/go/" + entity.BusinessName + "_controller.go.vm"
	controllerValue := ""
	serviceKey := "vm/go/" + entity.BusinessName + "_service.go.vm"
	serviceValue := ""
	extendKey := "vm/go/" + entity.BusinessName + "_extend.go.vm"
	extendValue := ""
	apiJsKey := "vm/html/" + entity.BusinessName + "_api.js.vm"
	apiJsValue := ""
	vueKey := "vm/html/" + entity.BusinessName + "_vue.js.vm"
	vueValue := ""

	g.View().BindFuncMap(g.Map{
		"UcFirst": func(str string) string {
			return gstr.UcFirst(str)
		},
	})
	if tmpController, err := r.Response.ParseTpl("vm/go/controller.template", g.Map{"table": entity}); err == nil {
		controllerValue = tmpController
	}
	if tmpService, err := r.Response.ParseTpl("vm/go/service.template", g.Map{"table": entity}); err == nil {
		serviceValue = tmpService
	}
	if tmpExtend, err := r.Response.ParseTpl("vm/go/extend.template", g.Map{"table": entity}); err == nil {
		extendValue = tmpExtend
	}
	if tmpExtend, err := r.Response.ParseTpl("vm/html/js.template", g.Map{"table": entity}); err == nil {
		apiJsValue = tmpExtend
	}
	if tmpExtend, err := r.Response.ParseTpl("vm/html/vue.template", g.Map{"table": entity}); err == nil {
		vueValue = tmpExtend
	}

	response.SusJson(true, r, "ok", g.Map{
		extendKey:     extendValue,
		serviceKey:    serviceValue,
		controllerKey: controllerValue,
		apiJsKey:      apiJsValue,
		vueKey:        vueValue,
	})
}
