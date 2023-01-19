/*
* @desc:字典类型
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/4/14 21:30
 */

package system

import (
	"github.com/gogf/gf/v2/frame/g"
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	commonModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
	commonEntity "github.com/tiger1103/gfast/v3/internal/app/common/model/entity"
)

type DictTypeSearchReq struct {
	g.Meta   `path:"/dict/type/list" tags:"字典管理" method:"get" summary:"字典类型列表"`
	DictName string `p:"dictName"` //字典名称
	DictType string `p:"dictType"` //字典类型
	Status   string `p:"status"`   //字典状态
	commonApi.PageReq
}

type DictTypeSearchRes struct {
	g.Meta       `mime:"application/json"`
	DictTypeList []*commonModel.SysDictTypeInfoRes `json:"dictTypeList"`
	commonApi.ListRes
}

type DictTypeAddReq struct {
	g.Meta   `path:"/dict/type/add" tags:"字典管理" method:"post" summary:"添加字典类型"`
	DictName string `p:"dictName"  v:"required#字典名称不能为空"`
	DictType string `p:"dictType"  v:"required#字典类型不能为空"`
	Status   uint   `p:"status"  v:"required|in:0,1#状态不能为空|状态只能为0或1"`
	Remark   string `p:"remark"`
}

type DictTypeAddRes struct {
}

type DictTypeGetReq struct {
	g.Meta `path:"/dict/type/get" tags:"字典管理" method:"get" summary:"获取字典类型"`
	DictId uint `p:"dictId" v:"required#类型id不能为空"`
}

type DictTypeGetRes struct {
	g.Meta   `mime:"application/json"`
	DictType *commonEntity.SysDictType `json:"dictType"`
}

type DictTypeEditReq struct {
	g.Meta   `path:"/dict/type/edit" tags:"字典管理" method:"put" summary:"修改字典类型"`
	DictId   int64  `p:"dictId" v:"required|min:1#主键ID不能为空|主键ID必须为大于0的值"`
	DictName string `p:"dictName"  v:"required#字典名称不能为空"`
	DictType string `p:"dictType"  v:"required#字典类型不能为空"`
	Status   uint   `p:"status"  v:"required|in:0,1#状态不能为空|状态只能为0或1"`
	Remark   string `p:"remark"`
}

type DictTypeEditRes struct {
}

type DictTypeDeleteReq struct {
	g.Meta  `path:"/dict/type/delete" tags:"字典管理" method:"delete" summary:"删除字典类型"`
	DictIds []int `p:"dictIds" v:"required#字典类型id不能为空"`
}

type DictTypeDeleteRes struct {
}

type DictTypeAllReq struct {
	g.Meta `path:"/dict/type/optionSelect" tags:"字典管理" method:"get" summary:"获取字典选择框列表"`
}

type DictTYpeAllRes struct {
	g.Meta   `mime:"application/json"`
	DictType []*commonEntity.SysDictType `json:"dictType"`
}
