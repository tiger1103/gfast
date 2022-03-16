/*
* @desc:路由绑定
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/2/18 16:23
 */

package router

import (
	"github.com/gogf/gf/v2/net/ghttp"
	commonRouter "github.com/tiger1103/gfast/v3/internal/app/common/router"
	demoRouter "github.com/tiger1103/gfast/v3/internal/app/demo/router"
	systemRouter "github.com/tiger1103/gfast/v3/internal/app/system/router"
)

func BindController(group *ghttp.RouterGroup) {
	group.Group("/api/v1", func(group *ghttp.RouterGroup) {
		group.Middleware(ghttp.MiddlewareHandlerResponse)
		// 绑定后台路由
		systemRouter.BindController(group)
		// 绑定测试路由
		demoRouter.BindController(group)
		// 绑定公共路由
		commonRouter.BindController(group)
	})

}
