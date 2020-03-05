package admin

import (
	"gfast/app/model/admin/sys_dict_data"
	"gfast/app/model/admin/sys_dict_type"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/user_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type Dict struct{}

//字典列表
func (c *Dict) List(r *ghttp.Request) {
	var req *sys_dict_type.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}

	total, page, list, err := dict_service.SelectListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage":  page,
		"total":        total,
		"list":         list,
		"searchStatus": map[string]string{"": "所有", "0": "停用", "1": "正常"},
	}
	response.SusJson(true, r, "字典列表", result)
}

//添加字典
func (c *Dict) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_dict_type.AddReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		if !dict_service.CheckDictTypeUniqueAll(req.DictType) {
			response.FailJson(true, r, "字典类型已经存在")
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err := dict_service.AddSave(req, userId)
		if err != nil {
			g.Log().Error(err.Error())
			response.FailJson(true, r, "字典类型添加失败")
		}
		response.SusJson(true, r, "添加字典成功")
	}
}

//修改字典
func (c *Dict) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_dict_type.EditReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		if !dict_service.CheckDictTypeUnique(req) {
			response.FailJson(true, r, "字典类型已经存在")
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err := dict_service.EditSave(req, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改成功")
	}
	id := r.GetInt("id")
	entity, err := dict_service.GetDictById(id)
	if err != nil {
		response.FailJson(true, r, "字典类型添加失败")
	}
	response.SusJson(true, r, "ok", g.Map{"dict": entity})
}

//字典数据列表
func (c *Dict) DataList(r *ghttp.Request) {
	var req *sys_dict_data.SelectDataPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}

	total, page, list, err := dict_service.SelectDataListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage":  page,
		"total":        total,
		"list":         list,
		"searchStatus": map[string]string{"": "所有", "0": "停用", "1": "正常"},
	}
	response.SusJson(true, r, "ok", result)
}

//添加数据字典
func (c *Dict) DataAdd(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_dict_data.AddDataReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err := dict_service.AddSaveData(req, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "添加字典数据成功")
	}
	dictType := r.GetQueryString("dictType")
	res := g.Map{
		"listClassSelector": g.Map{"default": "默认", "primary": "主要", "success": "成功", "info": "信息",
			"warning": "警告", "danger": "危险"},
		"dictType": dictType,
	}
	response.SusJson(true, r, "ok", res)
}

//修改字典数据
func (c *Dict) DataEdit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_dict_data.EditDataReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		userId := user_service.GetLoginID(r)
		_, err := dict_service.EditSaveData(req, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "修改字典数据成功")

	}
	dictCode := r.GetInt("dictCode")
	dictData, err := dict_service.GetDictDataById(dictCode)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	res := g.Map{
		"listClassSelector": g.Map{"default": "默认", "primary": "主要", "success": "成功", "info": "信息",
			"warning": "警告", "danger": "危险"},
		"dictType": dictData.DictType,
		"dictData": dictData,
	}
	response.SusJson(true, r, "ok", res)
}

//删除字典
func (c *Dict) Delete(r *ghttp.Request) {
	dictIds := r.GetInts("dictIds")
	if len(dictIds) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := dict_service.DeleteDictByIds(dictIds)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}

//删除字典数据
func (c *Dict) DataDelete(r *ghttp.Request) {
	dictCodes := r.GetInts("dictCode")
	if len(dictCodes) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := dict_service.DeleteDictDataByIds(dictCodes)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	response.SusJson(true, r, "删除成功")
}
