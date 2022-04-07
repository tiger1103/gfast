/*
* @desc:岗位相关参数
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/4/7 23:09
 */

package system

import (
	"github.com/gogf/gf/v2/frame/g"
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
)

type PostSearchReq struct {
	g.Meta   `path:"/post/list" tags:"岗位管理" method:"get" summary:"岗位列表"`
	PostCode string `p:"postCode"` //岗位编码
	PostName string `p:"postName"` //岗位名称
	Status   string `p:"status"`   //状态
	commonApi.PageReq
}

type PostSearchRes struct {
	g.Meta `mime:"application/json"`
	commonApi.ListRes
	PostList []*entity.SysPost `json:"postList"`
}
