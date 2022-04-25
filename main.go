package main

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/gogf/gf/v2/os/glog"
	_ "github.com/tiger1103/gfast/v3/internal/app/system/packed"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/internal/cmd"
)

func init() {
	ctx := gctx.New()
	if service.SysInitConfig["autoInit"].Bool() && service.SysInit().IsCreateConfigFile() {
		// 加载配置文件
		err := service.SysInit().LoadConfigFile()
		if err != nil {
			g.Log().Panic(ctx, err)
		}
	}
}

func main() {
	g.Log().SetFlags(glog.F_ASYNC | glog.F_TIME_DATE | glog.F_TIME_TIME | glog.F_FILE_LONG)
	cmd.Main.Run(gctx.New())
}
