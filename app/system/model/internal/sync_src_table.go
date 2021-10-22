// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
    "github.com/gogf/gf/os/gtime"
)

// SyncSrcTable is the golang structure for table sync_src_table.
type SyncSrcTable struct {
    Id         int64       `orm:"id"          json:"id"`         //   
    CreateDate *gtime.Time `orm:"create_date" json:"createDate"` //   
    WriteDate  *gtime.Time `orm:"write_date"  json:"writeDate"`  //   
    TaskId     int64       `orm:"task_id"     json:"taskId"`     //   
    DbType     string      `orm:"db_type"     json:"dbType"`     //   
    DbName     string      `orm:"db_name"     json:"dbName"`     //   
    TableName  string      `orm:"table_name"  json:"tableName"`  //   
    PkFiled    string      `orm:"pk_filed"    json:"pkFiled"`    //   
}