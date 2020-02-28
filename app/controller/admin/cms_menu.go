package admin

import (
	"gfast/library/response"
	"github.com/gogf/gf/net/ghttp"
)

//cms栏目管理
type CmsMenu struct{}

func (c *CmsMenu) MenuList(r *ghttp.Request) {
	response.SusJson(true, r, "栏目列表")
}
