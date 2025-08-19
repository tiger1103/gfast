/*
* @desc:错误处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 14:53
 */

package liberr

import (
	"context"

	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/consts"
)

func ErrIsNil(ctx context.Context, err error, msg ...string) {
	if !g.IsNil(err) {
		if len(msg) > 0 {
			g.Log().Error(ctx, err.Error())
			panic(NewCode(consts.CodeError, msg[0]))
		} else {
			panic(NewCode(consts.CodeError, err.Error()))
		}
	}
}

func ValueIsNil(value interface{}, msg string) {
	if g.IsNil(value) {
		panic(msg)
	}
}

func NewCode(code int, msg string) error {
	return gerror.NewCode(gcode.New(code, msg, nil))
}

func ErrIsNilCode(ctx context.Context, err error, code int, msg ...string) {
	if !g.IsNil(err) {
		if len(msg) > 0 {
			g.Log().Error(ctx, err.Error())
			panic(NewCode(code, msg[0]))
		} else {
			panic(NewCode(code, err.Error()))
		}
	}
}
