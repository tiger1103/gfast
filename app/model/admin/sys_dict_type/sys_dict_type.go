package sys_dict_type

// Fill with you ideas below.

//新增操作请求参数
type AddReq struct {
	DictName string `p:"dictName"  v:"required#字典名称不能为空"`
	DictType string `p:"dictType"  v:"required#字典类型不能为空"`
	Status   uint   `p:"status"  v:"required|in:0,1#状态不能为空|状态只能为0或1"`
	Remark   string `p:"remark"`
}

//修改操作请求参数
type EditReq struct {
	DictId int64 `p:"dictId" v:"required|min:1#主键ID不能为空|主键ID必须为大于0的值"`
	AddReq
}

//分页请求参数
type SelectPageReq struct {
	DictName  string `p:"dictName"`  //字典名称
	DictType  string `p:"dictType"`  //字典类型
	Status    string `p:"status"`    //字典状态
	BeginTime string `p:"beginTime"` //开始时间
	EndTime   string `p:"endTime"`   //结束时间
	PageNum   int    `p:"page"`      //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
}
