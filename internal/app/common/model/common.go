/*
* @desc:公用model
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2023/5/11 22:43
 */

package model

// PageReq 公共请求参数
type PageReq struct {
	DateRange []string `p:"dateRange"` //日期范围
	PageNum   int      `p:"pageNum"`   //当前页码
	PageSize  int      `p:"pageSize"`  //每页数
	OrderBy   string   //排序方式
}

// ListRes 列表公共返回
type ListRes struct {
	CurrentPage int         `json:"currentPage"`
	Total       interface{} `json:"total"`
}
