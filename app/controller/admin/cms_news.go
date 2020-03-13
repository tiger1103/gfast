package admin

import (
	"gfast/library/response"
	"github.com/gogf/gf/net/ghttp"
)

type CmsNews struct{}

func (c *CmsNews) List(r *ghttp.Request) {
	response.SusJson(true, r, "信息列表")
}

//添加信息
func (c *CmsNews) Add(r *ghttp.Request) {
	//获取可选栏目

}
