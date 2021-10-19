package service

import "gfast/app/system/dao"

type syncTable struct{}

var SyncTable = new(syncTable)

func (s *syncTable) AddSrcTable(params *dao.SyncSrcTableParams) (err error) {
	_, err = dao.SyncSrcTable.Insert(params)
	return
}