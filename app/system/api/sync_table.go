package api

import (
	"gfast/app/system/dao"
	"gfast/app/system/service"

	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
)

type syncTable struct {
	SystemBase
}

var SyncTable = new(syncTable)

func (s *syncTable) FunSyncTable(r *ghttp.Request) {
	var param dao.SyncSrcTableParams
	r.Parse(&param)
	param.CreateDate = gtime.Now()
	param.WriteDate = gtime.Now()
	service.SyncTable.AddSrcTable(&param)
	s.SusJsonExit(r, "添加成功")
}