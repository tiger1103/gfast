package admin

import (
	"gfast/app/model/admin/gen_table"
	"gfast/app/service/admin/gen_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/encoding/gcompress"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gfile"
	"github.com/gogf/gf/os/gview"
	"github.com/gogf/gf/text/gregex"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/grand"
	"github.com/gogf/gf/util/gvalid"
	"strings"
)

type Gen struct{}

// @Summary 查询数据库列表
// @Description 查询数据库列表
// @Tags 系统工具
// @Param data body gen_table.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/tools/gen/dataList [get]
// @Security
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

// @Summary 表列表
// @Description 表列表
// @Tags 系统工具
// @Param data body gen_table.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/tools/gen/tableList [post]
// @Security
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

// @Summary 导入表结构操作
// @Description 导入表结构操作
// @Tags 系统工具
// @Param tables body string  true "tables"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/tools/gen/importTableSave [post]
// @Security
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

// @Summary 根据表格ID获取表格字段列表数据
// @Description 根据表格ID获取表格字段列表数据
// @Tags 系统工具
// @Param tableId body integer   true "tableId"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/tools/gen/columnList [post]
// @Security
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

// @Summary 编辑表格信息
// @Description 编辑表格信息
// @Tags 系统工具
// @Param data body gen_table.EditReq  true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/tools/gen/editSave [post]
// @Security
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

// @Summary 删除表格数据
// @Description 删除表格数据
// @Tags 系统工具
// @Param ids body integer   true "ids[1,2,3...]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/tools/gen/delete [delete]
// @Security
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

// @Summary 代码生成预览
// @Description 代码生成预览
// @Tags 系统工具
// @Param tableId body integer   true "tableId"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/tools/gen/preview [post]
// @Security
func (c *Gen) Preview(r *ghttp.Request) {
	tableId := r.GetInt64("tableId")
	if tableId == 0 {
		response.FailJson(true, r, "参数错误")
	}
	data, _, err := c.genData(tableId)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", data)
}

//下载生成的代码
func (c *Gen) BatchGenCode(r *ghttp.Request) {
	tableIds := r.GetString("tables")
	if tableIds == "" {
		response.FailJson(true, r, "请选择要生成的表")
	}
	ids := gstr.Split(tableIds, ",")
	dataFilePath := g.Cfg().GetString("adminInfo.dataDir")
	dataFileRange := grand.S(10)
	//生成文件
	for _, id := range ids {
		data, entity, err := c.genData(gconv.Int64(id))
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		pathMap := c.getPath(entity)
		for key, val := range data {
			switch key {
			case "vm/go/" + entity.BusinessName + "_controller.go.vm":
				err = gfile.PutContents(dataFilePath+"/gen/"+dataFileRange+"/go/"+pathMap["controller"], val)
				if err != nil {
					response.FailJson(true, r, err.Error())
				}
			case "vm/go/" + entity.BusinessName + "_service.go.vm":
				err = gfile.PutContents(dataFilePath+"/gen/"+dataFileRange+"/go/"+pathMap["service"], val)
				if err != nil {
					response.FailJson(true, r, err.Error())
				}
			case "vm/go/" + entity.BusinessName + "_model.go.vm":
				err = gfile.PutContents(dataFilePath+"/gen/"+dataFileRange+"/go/"+pathMap["model"], val)
				if err != nil {
					response.FailJson(true, r, err.Error())
				}
			case "vm/html/" + entity.BusinessName + "_api.js.vm":
				err = gfile.PutContents(dataFilePath+"/gen/"+dataFileRange+"/vue/"+pathMap["api"], val)
				if err != nil {
					response.FailJson(true, r, err.Error())
				}
			case "vm/html/" + entity.BusinessName + "_vue.js.vm":
				err = gfile.PutContents(dataFilePath+"/gen/"+dataFileRange+"/vue/"+pathMap["vue"], val)
				if err != nil {
					response.FailJson(true, r, err.Error())
				}
			}
		}
	}
	//打包
	err := gcompress.ZipPathWriter(dataFilePath+"/gen/"+dataFileRange, r.Response.Writer)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	//删除生成的文件
	gfile.Remove(dataFilePath + "/gen/" + dataFileRange)
	//设置下载文件名
	r.Response.Header().Set("Content-Length", gconv.String(r.Response.BufferLength()))
	r.Response.Header().Set("Content-Type", "application/force-download")
	r.Response.Header().Set("Accept-Ranges", "bytes")
	r.Response.Header().Set("Content-Disposition", "attachment; filename=gfast.zip")
	r.Response.Buffer()
}

//获取生成文件的目录
func (c *Gen) getPath(entity *gen_table.EntityExtend) g.MapStrStr {
	controller := "app/controller/" + entity.ModuleName + "/" + entity.ClassName + ".go"
	service := "app/service/" + entity.ModuleName + "/" + entity.BusinessName + "_service/" + entity.ClassName + ".go"
	model := "app/model/" + entity.ModuleName + "/" + entity.BusinessName + "/" + entity.ClassName + ".go"
	vue := "views/" + entity.ModuleName + "/" + entity.BusinessName + "/index.vue"
	api := "api/" + entity.ModuleName + "/" + entity.BusinessName + ".js"
	return g.MapStrStr{
		"controller": controller,
		"service":    service,
		"model":      model,
		"vue":        vue,
		"api":        api,
	}
}

//获取生成数据
func (c *Gen) genData(tableId int64) (data g.MapStrStr, entity *gen_table.EntityExtend, err error) {
	entity, err = gen_service.SelectRecordById(tableId)
	if err != nil {
		return
	}
	if entity == nil {
		err = gerror.New("表格数据不存在")
		return
	}
	gen_service.SetPkColumn(entity, entity.Columns)
	controllerKey := "vm/go/" + entity.BusinessName + "_controller.go.vm"
	controllerValue := ""
	serviceKey := "vm/go/" + entity.BusinessName + "_service.go.vm"
	serviceValue := ""
	modelKey := "vm/go/" + entity.BusinessName + "_model.go.vm"
	modelValue := ""
	apiJsKey := "vm/html/" + entity.BusinessName + "_api.js.vm"
	apiJsValue := ""
	vueKey := "vm/html/" + entity.BusinessName + "_vue.js.vm"
	vueValue := ""

	view := gview.New()
	view.BindFuncMap(g.Map{
		"UcFirst": func(str string) string {
			return gstr.UcFirst(str)
		},
		"add": func(a, b int) int {
			return a + b
		},
	})
	view.SetConfigWithMap(g.Map{
		"Paths":      []string{"template"},
		"Delimiters": []string{"{{", "}}"},
	})
	//树形菜单选项
	var options g.Map
	if entity.TplCategory == "tree" {
		options = gjson.New(entity.Options).ToMap()
	}
	var tmpController string
	if tmpController, err = view.Parse("vm/go/"+entity.TplCategory+"/controller.template", g.Map{"table": entity}); err == nil {
		controllerValue = tmpController
	} else {
		return
	}
	var tmpService string
	if tmpService, err = view.Parse("vm/go/"+entity.TplCategory+"/service.template", g.Map{"table": entity, "options": options}); err == nil {
		serviceValue = tmpService
	} else {
		return
	}
	var tmpModel string
	if tmpModel, err = view.Parse("vm/go/"+entity.TplCategory+"/model.template", g.Map{"table": entity}); err == nil {
		modelValue = tmpModel
		modelValue, err = c.trimBreak(modelValue)
	} else {
		return
	}
	var tmpJs string
	if tmpJs, err = view.Parse("vm/html/js.template", g.Map{"table": entity}); err == nil {
		apiJsValue = tmpJs
	} else {
		return
	}
	var tmpVue string
	if tmpVue, err = view.Parse("vm/html/vue_"+entity.TplCategory+".template", g.Map{"table": entity, "options": options}); err == nil {
		vueValue = tmpVue
		vueValue, err = c.trimBreak(vueValue)
	} else {
		return
	}

	data = g.MapStrStr{
		modelKey:      modelValue,
		serviceKey:    serviceValue,
		controllerKey: controllerValue,
		apiJsKey:      apiJsValue,
		vueKey:        vueValue,
	}
	return
}

//剔除多余的换行
func (c *Gen) trimBreak(str string) (s string, err error) {
	var b []byte
	if b, err = gregex.Replace("(([\\s\t]*)\r?\n){2,}", []byte("$2\n"), []byte(str)); err == nil {
		s = gconv.String(b)
	}
	return
}
