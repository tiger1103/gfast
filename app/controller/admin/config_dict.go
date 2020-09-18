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
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

type Dict struct{}

// @Summary 字典列表
// @Description 字典列表
// @Tags 字典管理
// @Param data body sys_dict_type.SelectPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/list [get]
// @Security
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

// @Summary 添加字典
// @Description 添加字典
// @Tags 字典管理
// @Param data body sys_dict_type.AddReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/add [post]
// @Security
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

// @Summary 修改字典
// @Description 修改字典
// @Tags 字典管理
// @Param data body sys_dict_type.EditReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/edit [post]
// @Security
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

// @Summary 字典数据列表
// @Description 字典数据列表
// @Tags 字典管理
// @Param data body sys_dict_data.SelectDataPageReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/dataList [get]
// @Security
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

// @Summary 添加数据字典
// @Description 添加数据字典
// @Tags 字典管理
// @Param data body sys_dict_data.AddDataReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/dataAdd [post]
// @Security
func (c *Dict) DataAdd(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_dict_data.AddDataReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err := dict_service.AddSaveData(req, gconv.Uint64(userId))
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		//清除tag缓存
		cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
		response.SusJson(true, r, "添加字典数据成功")
	}
}

// @Summary 修改字典数据
// @Description 修改字典数据
// @Tags 字典管理
// @Param data body sys_dict_data.EditDataReq true "data"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/dataEdit [post]
// @Security
func (c *Dict) DataEdit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_dict_data.EditDataReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		userId := user_service.GetLoginID(r)
		_, err := dict_service.EditSaveData(req, gconv.Uint64(userId))
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

// @Summary 删除字典
// @Description 删除字典
// @Tags 字典管理
// @Param dictIds body string true "dictIds[1,2,3]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/delete [delete]
// @Security
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

// @Summary 删除字典数据
// @Description 删除字典数据
// @Tags 字典管理
// @Param ids body integer  true "ids[1,2,3...]"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/dataDelete [delete]
// @Security
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

// @Summary 获取字典对应选项
// @Description 获取字典对应选项
// @Tags 字典管理
// @Param dictType query string true "dictType"
// @Success 0 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /system/config/dict/sysNormalDisable [post]
// @Security
func (c *Dict) GetDicts(r *ghttp.Request) {
	dictType := r.GetString("dictType")
	//菜单正常or停用状态
	statusOptions, err := dict_service.GetDictWithDataByType(dictType, "", "")
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", statusOptions)

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
