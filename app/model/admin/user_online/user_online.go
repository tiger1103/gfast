package user_online

// Fill with you ideas below.
//列表搜索参数
type ReqListSearch struct {
	Username string `p:"username"`
	Ip       string `p:"ip"`
	PageNum  int    `p:"page"`     //当前页码
	PageSize int    `p:"pageSize"` //每页数
}
