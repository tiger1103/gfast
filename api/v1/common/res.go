/*
* @desc:返回响应公共参数
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/10/27 16:30
 */

package common

import "github.com/gogf/gf/v2/frame/g"

// EmptyRes 不响应任何数据
type EmptyRes struct {
	g.Meta `mime:"application/json"`
}

// ListRes 列表公共返回
type ListRes struct {
	CurrentPage int         `json:"currentPage"`
	Total       interface{} `json:"total"`
}
