package cms_category

// Fill with you ideas below.
const (
	ChannelCateType = 1 //频道类型
	PublishCateType = 2 //可发布栏目
	JumpCateType    = 3 //跳转栏目
	SingleCateType  = 4 //单页栏目
)

//列表搜索参数
type ReqSearchList struct {
	Name string `p:"name"`
}

//添加请求参数
type ReqAdd struct {
	ParentId            uint64 `p:"parent_id" v:"integer|min:0#父级ID不能为空|父级ID必须为大于等于0的整数"`
	Name                string `p:"name" v:"required#栏目名称不能为空"`
	Alias               string `p:"alias"`
	CateType            uint   `p:"cate_type" v:"required|in:1,2,3,4#请选择栏目类型|栏目类型只能在1-4之间"`
	Description         string `p:"description"`
	Thumbnail           string `p:"thumbnail"`
	InputSeoTitle       string `p:"input_seo_title"`
	InputSeoKeywords    string `p:"input_seo_keywords"`
	InputSeoDescription string `p:"input_seo_description"`
	Status              uint   `p:"status" v:"in:0,1#状态只能包含0或1"`
	CateAddress         string `p:"cate_address"`
	CateContent         string `p:"content"`
}

//修改请求参数
type ReqEdit struct {
	Id int `p:"id" v:"required|min:1#栏目id不能为空|栏目id参数错误"`
	ReqAdd
}
