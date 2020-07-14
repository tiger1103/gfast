package admin

import (
	"gfast/app/model/admin/sys_dict_data"
	"gfast/app/model/admin/sys_dict_type"
	"gfast/app/service/admin/dict_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/cache_service"
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
	//菜单正常or停用状态
	statusOptions, err := dict_service.GetDictWithDataByType("sys_normal_disable", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage":  page,
		"total":        total,
		"list":         list,
		"searchStatus": statusOptions,
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
		//清除tag缓存
		cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
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
		//清除tag缓存
		cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
		response.SusJson(true, r, "修改成功")
	}
	id := r.GetInt("dictId")
	entity, err := dict_service.GetDictById(id)
	if err != nil {
		response.FailJson(true, r, "字典数据获取失败")
	}
	response.SusJson(true, r, "ok", entity)
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

	//菜单正常or停用状态
	statusOptions, err := dict_service.GetDictWithDataByType("sys_normal_disable", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	result := g.Map{
		"currentPage":  page,
		"total":        total,
		"list":         list,
		"searchStatus": statusOptions,
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
		//清除tag缓存
		cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
		response.SusJson(true, r, "添加字典数据成功")
	}
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
		//清除tag缓存
		cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
		response.SusJson(true, r, "修改字典数据成功")
	}
	dictCode := r.GetInt("dictCode")
	dictData, err := dict_service.GetDictDataById(dictCode)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	response.SusJson(true, r, "ok", dictData)
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
	//清除tag缓存
	cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
	response.SusJson(true, r, "删除成功")
}

//删除字典数据
func (c *Dict) DataDelete(r *ghttp.Request) {
	dictCodes := r.GetInts("ids")
	if len(dictCodes) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := dict_service.DeleteDictDataByIds(dictCodes)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	//清除tag缓存
	cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
	response.SusJson(true, r, "删除成功")
}

/**
状态
*/
func (c *Dict) SysNormalDisable(r *ghttp.Request) {
	//菜单正常or停用状态
	statusOptions, err := dict_service.GetDictWithDataByType("sys_normal_disable", "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "", statusOptions)

}

func (c *Dict) SysCommonStatus(r *ghttp.Request) {
	//获取相关选项
	logStatus, err := dict_service.GetDictWithDataByType("sys_oper_log_status", "", "全部")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}

	response.SusJson(true, r, "ok", logStatus)
}

// 获取字典选择框列表
func (c *Dict) OptionSelect(r *ghttp.Request) {
	//获取所有字典类型列表
	list, err := dict_service.GetAllDictType()
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", list)
}
