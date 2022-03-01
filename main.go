package main

import (
	_ "github.com/tiger1103/gfast/v3/internal/system/packed"

	"github.com/gogf/gf/v2/os/gctx"
	"github.com/tiger1103/gfast/v3/internal/system/cmd"
)

func main() {
	cmd.Main.Run(gctx.New())
}
