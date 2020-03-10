package sys_job

// Fill with you ideas below.

//添加操作请求参数
type ReqAdd struct {
	JobName        string `p:"jobName" v:"required#任务名称不能为空"`
	JobParams      string `p:"jobParams"` // 任务参数
	JobGroup       string `p:"jobGroup" `
	InvokeTarget   string `p:"invokeTarget" v:"required#执行方法不能为空"`
	CronExpression string `p:"cronExpression" v:"required#任务表达式不能为空"`
	MisfirePolicy  int    `p:"misfirePolicy"`
	Concurrent     int    `p:"concurrent" `
	Status         int    `p:"status" v:"required#状态（0正常 1暂停）不能为空"`
	Remark         string `p:"remark" `
}

//修改操作请求参数
type ReqEdit struct {
	JobId int64 `p:"jobId" v:"min:1#任务id不能为空"`
	ReqAdd
}

//分页请求参数
type SelectPageReq struct {
	JobName  string `p:"jobName"`  //任务名称
	JobGroup string `p:"jobGroup"` //任务组名
	Status   string `p:"status"`   //状态（0正常 1暂停）
	PageNum  int    `p:"page"`     //当前页码
	PageSize int    `p:"pageSize"` //每页数
}
