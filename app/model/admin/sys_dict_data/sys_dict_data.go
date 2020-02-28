package sys_dict_data

// Fill with you ideas below.

//新增字典数据页面请求参数
type AddDataReq struct {
	DictLabel string `p:"dictLabel"  v:"required#字典标签不能为空"`
	DictValue string `p:"dictValue"  v:"required#字典键值不能为空"`
	DictType  string `p:"dictType"  v:"required#字典类型不能为空"`
	DictSort  int    `p:"dictSort"  v:"integer#排序只能为整数"`
	CssClass  string `p:"cssClass"`
	ListClass string `p:"listClass" v:"required#回显样式不能为空"`
	IsDefault int    `p:"isDefault" v:"required|in:0,1#系统默认不能为空|默认值只能为0或1"`
	Status    int    `p:"status"    v:"required|in:0,1#状态不能为空|状态只能为0或1"`
	Remark    string `p:"remark"`
}

type EditDataReq struct {
	DictCode int `p:"dictCode" v:"required|min:1#主键ID不能为空|主键ID不能小于1"`
	AddDataReq
}

//分页请求参数
type SelectDataPageReq struct {
	DictType  string `p:"dictType"`  //字典名称
	DictLabel string `p:"dictLabel"` //字典标签
	Status    string `p:"status"`    //状态
	PageNum   int    `p:"page"`      //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
}
