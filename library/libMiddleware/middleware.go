/*
* @desc:公用中间件
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 15:16
 */

package libMiddleware

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/text/gstr"
)

// ExceptionHandle 异常处理
func ExceptionHandle(r *ghttp.Request) {
	r.Middleware.Next()
	if err := r.GetError(); err != nil {
		msg := err.Error()
		pos := gstr.Pos(msg, ":")
		if pos > 0 {
			msg = gstr.SubStr(msg, pos+2)
		}
		r.Response.ClearBuffer()
		r.Response.WriteJson(g.Map{"code": 500, "message": msg})
	}
}
