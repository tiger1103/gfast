package sys_config

// Fill with you ideas below.
//新增页面请求参数
type AddReq struct {
	ConfigName  string `p:"configName"  v:"required#参数名称不能为空"`
	ConfigKey   string `p:"configKey"  v:"required#参数键名不能为空"`
	ConfigValue string `p:"configValue"  v:"required#参数键值不能为空"`
	ConfigType  int    `p:"configType"    v:"required|in:0,1#系统内置不能为空|系统内置类型只能为0或1"`
	Remark      string `p:"remark"`
}

//修改页面请求参数
type EditReq struct {
	ConfigId int64 `p:"configId" v:"required|min:1#主键ID不能为空|主键ID参数错误"`
	AddReq
}

//分页请求参数
type SelectPageReq struct {
	ConfigName string `p:"configName"` //参数名称
	ConfigKey  string `p:"configKey"`  //参数键名
	ConfigType string `p:"configType"` //状态
	BeginTime  string `p:"beginTime"`  //开始时间
	EndTime    string `p:"endTime"`    //结束时间
	PageNum    int    `p:"page"`       //当前页码
	PageSize   int    `p:"pageSize"`   //每页数
}
