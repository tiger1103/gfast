/*
* @desc:公用中间件
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 15:16
 */

package libMiddleware

import "github.com/gogf/gf/v2/net/ghttp"

func MiddlewareCORS(r *ghttp.Request) {
	corsOptions := r.Response.DefaultCORSOptions()
	// you can set options
	//corsOptions.AllowDomain = []string{"goframe.org", "baidu.com"}
	r.Response.CORS(corsOptions)
	r.Middleware.Next()
}
