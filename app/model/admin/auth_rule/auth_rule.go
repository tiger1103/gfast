package auth_rule

//菜单对象
type MenuReq struct {
	IsMenu    int    `p:"ismenu" c:"ismenu" v:"min:0|max:1#菜单类型最小值为:min|菜单类型最大值为:max"`
	Pid       int    `p:"pid" c:"pid" v:"min:0"`
	Name      string `p:"name" c:"name" v:"required#请填写规则名称"`
	Title     string `p:"title" c:"title" v:"required|length:1,100#请填写标题|标题长度在:min到:max位"`
	Icon      string `p:"icon" c:"icon"`
	Weigh     int    `p:"weigh" c:"weigh"`
	Condition string `p:"condition" c:"condition"`
	Remark    string `p:"remark" c:"remark"`
	Status    int    `p:"status" c:"status"`
}
