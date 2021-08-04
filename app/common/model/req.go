package model

import "context"

const PageSize = 10

type PageReq struct {
	BeginTime string `p:"beginTime"` //开始时间
	EndTime   string `p:"endTime"`   //结束时间
	PageNum   int    `p:"PageNum"`   //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
	Ctx       context.Context
	OrderBy   string //排序方式
}
