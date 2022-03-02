/*
* @desc:错误处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 14:53
 */

package liberr

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
)

func ErrIsNil(ctx context.Context, err error, msg ...string) {
	if err != nil {
		g.Log().Error(ctx, err.Error())
		if len(msg) > 0 {
			panic(msg[0])
		} else {
			panic(err.Error())
		}
	}
}
