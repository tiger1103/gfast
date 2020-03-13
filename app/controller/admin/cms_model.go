package admin

import (
	"gfast/library/response"
	"github.com/gogf/gf/net/ghttp"
)

type CmsModel struct{}

func (c *CmsModel) List(r *ghttp.Request) {
	response.FailJson(true, r, "功能开发中...")
}

//添加模型
func (c *CmsModel) Add(r *ghttp.Request) {
	response.FailJson(true, r, "功能开发中...")
}
