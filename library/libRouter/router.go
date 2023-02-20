/*
* @desc:路由处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/11/16 11:09
 */

package libRouter

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/text/gregex"
	"reflect"
)

// RouterAutoBind 收集需要被绑定的控制器,自动绑定
// 路由的方法命名规则必须为：BindXXXController
func RouterAutoBind(ctx context.Context, R interface{}, group *ghttp.RouterGroup) (err error) {
	//TypeOf会返回目标数据的类型，比如int/float/struct/指针等
	typ := reflect.TypeOf(R)
	//ValueOf返回目标数据的的值
	val := reflect.ValueOf(R)
	if val.Elem().Kind() != reflect.Struct {
		err = gerror.New("expect struct but a " + val.Elem().Kind().String())
		return
	}
	for i := 0; i < typ.NumMethod(); i++ {
		if match := gregex.IsMatchString(`^Bind(.+)Controller$`, typ.Method(i).Name); match {
			//调用绑定方法
			val.Method(i).Call([]reflect.Value{reflect.ValueOf(ctx), reflect.ValueOf(group)})
		}
	}
	return
}
