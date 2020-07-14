package front

import (
	"gfast/library/response"
	"github.com/gogf/gf/net/ghttp"
)

type Index struct{}

//前台首页
func (c *Index) Index(r *ghttp.Request) {
	response.SusJson(true, r, "登录成功")
}
