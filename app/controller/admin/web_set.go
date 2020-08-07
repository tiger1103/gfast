package admin

import (
	"gfast/app/model/admin/web_set"
	"gfast/app/service/admin/web_set_service"
	"gfast/library/response"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
)

type WebSet struct{}

func (c *WebSet) Update(r *ghttp.Request) {
	if r.Method == "POST" {
		var req *web_set.UpdateReq
		err := r.Parse(&req)
		if err != nil {
			response.FailJson(true, r, err.(*gvalid.Error).FirstString())
		}
		err = web_set_service.UpdateSave(req)
		if err != nil {
			response.FailJson(true, r, err.Error())
		}
		response.SusJson(true, r, "更新成功!")
	}
	// 不是post提交的请求就到修改页面后查询出要修改的记录
	id := r.GetInt("webId")
	params, err := web_set_service.GetInfoByID(id)
	if err != nil {
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "ok", params)
}

// 查询站点信息
func (c *WebSet) GetInfo(r *ghttp.Request) {
	res, err := web_set.Model.FindOne()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询站点信息失败!")
		response.FailJson(true, r, err.Error())
	}
	response.SusJson(true, r, "站点信息", g.Map{
		"web_id":      res.WebId,
		"web_content": gjson.New(res.WebContent),
	})
}
