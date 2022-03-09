/*
* @desc:demo
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 15:24
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/demo"
)

var Demo = cDemo{}

type cDemo struct {
}

func (c *cDemo) Demo(ctx context.Context, req *demo.DmReq) (res *demo.DmRes, err error) {
	res = &demo.DmRes{Name: "赵四"}
	panic("demo wrong")
	return
}
