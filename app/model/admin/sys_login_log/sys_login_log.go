package sys_login_log

// Fill with you ideas below.
//查询列表请求参数
type SelectPageReq struct {
	LoginName string `p:"loginName"`     //登陆名
	Status    string `p:"status"`        //状态
	Ipaddr    string `p:"ipaddr"`        //登录地址
	BeginTime string `p:"beginTime"`     //数据范围
	EndTime   string `p:"endTime"`       //开始时间
	PageNum   int    `p:"page"`          //当前页码
	PageSize  int    `p:"pageSize"`      //每页数
	SortName  string `p:"orderByColumn"` //排序字段
	SortOrder string `p:"isAsc"`         //排序方式
}
