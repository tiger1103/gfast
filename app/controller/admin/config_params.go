package admin

import (
	"gfast/app/model/admin/sys_config"
	"gfast/app/service/admin/params_service"
	"gfast/app/service/admin/user_service"
	"gfast/app/service/cache_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type Params struct{}

//参数列表
func (c *Params) List(r *ghttp.Request) {
	var req *sys_config.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.FailJson(true, r, err.(*gvalid.Error).FirstString())
	}
	total, page, list, err := params_service.SelectListByPage(req)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	result := g.Map{
		"currentPage": page,
		"total":       total,
		"list":        list,
		"searchTypes": map[string]string{"": "所有", "0": "否", "1": "是"},
	}
	response.SusJson(true, r, "字典列表", result)
}

//添加参数
func (c *Params) Add(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_config.AddReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err := params_service.CheckConfigKeyUniqueAll(req.ConfigKey)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err = params_service.AddSave(req, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		cache_service.New().Remove(req.ConfigKey)
		response.SusJson(true, r, "添加参数成功")
	}
}

//修改参数
func (c *Params) Edit(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *sys_config.EditReq
		//获取参数
		if err := r.Parse(&req); err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err := params_service.CheckConfigKeyUnique(req.ConfigKey, req.ConfigId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		userId := user_service.GetLoginID(r) //获取登陆用户id
		_, err = params_service.EditSave(req, userId)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		cache_service.New().Remove(req.ConfigKey)
		response.SusJson(true, r, "修改参数成功")
	}
	id := r.GetInt("id")
	params, err := params_service.GetParamsById(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", g.Map{"params": params})
}

//删除参数
func (c *Params) Delete(r *ghttp.Request) {
	ids := r.GetInts("ids")
	if len(ids) == 0 {
		response.FailJson(true, r, "删除失败")
	}
	err := params_service.DeleteByIds(ids)
	if err != nil {
		response.FailJson(true, r, "删除失败")
	}
	cache_service.New().RemoveByTag(cache_service.AdminSysConfigTag)
	response.SusJson(true, r, "删除成功")
}
