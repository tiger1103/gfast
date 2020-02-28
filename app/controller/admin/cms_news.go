package admin

import (
	"gfast/library/response"
	"github.com/gogf/gf/net/ghttp"
)

type CmsNews struct{}

func (c CmsNews) NewsList(r *ghttp.Request) {
	response.SusJson(true, r, "信息列表")
}
