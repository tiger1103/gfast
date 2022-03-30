/*
* @desc:公共接口相关
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/3/30 9:28
 */

package common

//
type PageReq struct {
	BeginTime string `p:"beginTime"` //开始时间
	EndTime   string `p:"endTime"`   //结束时间
	PageNum   int    `p:"pageNum"`   //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
	OrderBy   string //排序方式
}

// ListRes 列表公共返回
type ListRes struct {
	CurrentPage int `json:"currentPage"`
	Total       int `json:"total"`
}
