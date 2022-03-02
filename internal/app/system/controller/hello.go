package controller

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/apiv1/system"
)

var (
	Hello = cHello{}
)

type cHello struct{}

func (h *cHello) Hello(ctx context.Context, req *system.HelloReq) (res *system.HelloRes, err error) {
	g.Log().Debug(ctx, "demo test")
	//g.RequestFromCtx(ctx).Response.Writeln("Hello World!")
	res = &system.HelloRes{
		Data: g.Map{"name": "zhangsang", "age": 18},
	}
	return
}
