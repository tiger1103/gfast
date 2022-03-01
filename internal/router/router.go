/*
* @desc:路由绑定
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/2/18 16:23
 */

package router

import (
	"github.com/gogf/gf/v2/net/ghttp"
	systemRouter "github.com/tiger1103/gfast/v3/internal/system/router"
)

func BindController(group *ghttp.RouterGroup) {
	// 绑定后台路由
	systemRouter.BindController(group)
}
