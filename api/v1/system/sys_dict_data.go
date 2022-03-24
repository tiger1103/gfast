/*
* @desc:字典数据api
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/3/18 11:59
 */

package system

import (
	"github.com/gogf/gf/v2/frame/g"
	commonModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
)

// GetDictReq 获取字典信息请求参数
type GetDictReq struct {
	g.Meta        `path:"/dict/data/getDictData" tags:"字典管理" method:"get" summary:"获取字典数据公共方法"`
	Authorization string `p:"Authorization" in:"header" dc:"Bearer {{token}}"`
	DictType      string `p:"dictType" v:"required#字典类型不能为空"`
	DefaultValue  string `p:"defaultValue"`
}

// GetDictRes 完整的一个字典信息
type GetDictRes struct {
	g.Meta `mime:"application/json"`
	Info   *commonModel.DictTypeRes   `json:"info"`
	Values []*commonModel.DictDataRes `json:"values"`
}
