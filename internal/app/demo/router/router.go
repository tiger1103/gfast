/*
* @desc:demo
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 15:28
 */

package router

import (
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/tiger1103/gfast/v3/internal/app/demo/controller"
	"github.com/tiger1103/gfast/v3/library/libMiddleware"
)

func BindController(group *ghttp.RouterGroup) {
	group.Group("/demo", func(group *ghttp.RouterGroup) {
		group.Middleware(libMiddleware.ExceptionHandle)
		group.Bind(
			controller.Demo,
		)
	})

}
