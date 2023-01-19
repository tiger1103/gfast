/*
* @desc:字典数据api
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/3/18 11:59
 */

package system

import (
	"github.com/gogf/gf/v2/frame/g"
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	commonModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
	commonEntity "github.com/tiger1103/gfast/v3/internal/app/common/model/entity"
)

// GetDictReq 获取字典信息请求参数
type GetDictReq struct {
	g.Meta `path:"/dict/data/getDictData" tags:"字典管理" method:"get" summary:"获取字典数据公共方法"`
	commonApi.Author
	DictType     string `p:"dictType" v:"required#字典类型不能为空"`
	DefaultValue string `p:"defaultValue"`
}

// GetDictRes 完整的一个字典信息
type GetDictRes struct {
	g.Meta `mime:"application/json"`
	Info   *commonModel.DictTypeRes   `json:"info"`
	Values []*commonModel.DictDataRes `json:"values"`
}

// DictDataSearchReq 分页请求参数
type DictDataSearchReq struct {
	g.Meta    `path:"/dict/data/list" tags:"字典管理" method:"get" summary:"字典数据列表"`
	DictType  string `p:"dictType"`  //字典类型
	DictLabel string `p:"dictLabel"` //字典标签
	Status    string `p:"status"`    //状态
	commonApi.PageReq
}

// DictDataSearchRes 字典数据结果
type DictDataSearchRes struct {
	g.Meta `mime:"application/json"`
	List   []*commonEntity.SysDictData `json:"list"`
	commonApi.ListRes
}

type DictDataReq struct {
	DictLabel string `p:"dictLabel"  v:"required#字典标签不能为空"`
	DictValue string `p:"dictValue"  v:"required#字典键值不能为空"`
	DictType  string `p:"dictType"  v:"required#字典类型不能为空"`
	DictSort  int    `p:"dictSort"  v:"integer#排序只能为整数"`
	CssClass  string `p:"cssClass"`
	ListClass string `p:"listClass"`
	IsDefault int    `p:"isDefault" v:"required|in:0,1#系统默认不能为空|默认值只能为0或1"`
	Status    int    `p:"status"    v:"required|in:0,1#状态不能为空|状态只能为0或1"`
	Remark    string `p:"remark"`
}

type DictDataAddReq struct {
	g.Meta `path:"/dict/data/add" tags:"字典管理" method:"post" summary:"添加字典数据"`
	*DictDataReq
}

type DictDataAddRes struct {
}

type DictDataGetReq struct {
	g.Meta   `path:"/dict/data/get" tags:"字典管理" method:"get" summary:"获取字典数据"`
	DictCode uint `p:"dictCode"`
}

type DictDataGetRes struct {
	g.Meta `mime:"application/json"`
	Dict   *commonEntity.SysDictData `json:"dict"`
}

type DictDataEditReq struct {
	g.Meta   `path:"/dict/data/edit" tags:"字典管理" method:"put" summary:"修改字典数据"`
	DictCode int `p:"dictCode" v:"required|min:1#主键ID不能为空|主键ID不能小于1"`
	*DictDataReq
}

type DictDataEditRes struct {
}

type DictDataDeleteReq struct {
	g.Meta `path:"/dict/data/delete" tags:"字典管理" method:"delete" summary:"删除字典数据"`
	Ids    []int `p:"ids"`
}

type DictDataDeleteRes struct {
}
