/*
* @desc:demo
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 15:25
 */

package demo

import "github.com/gogf/gf/v2/frame/g"

type DmReq struct {
	g.Meta `path:"/demo" tags:"Demo" method:"get" summary:"demo api"`
}
type DmRes struct {
	g.Meta `mime:"text/html"`
	Name   string `json:"name"`
}
