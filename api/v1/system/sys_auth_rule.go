/*
* @desc:菜单api
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/3/18 10:27
 */

package system

import "github.com/gogf/gf/v2/frame/g"

type RuleAddReq struct {
	g.Meta        `path:"/menu/add" tags:"menu add" method:"post" summary:"添加菜单"`
	Authorization string `p:"Authorization" in:"header" dc:"Bearer {{token}}"`
	MenuType      uint   `p:"menuType"  v:"min:0|max:2#菜单类型最小值为:min|菜单类型最大值为:max"`
	Pid           uint   `p:"parentId"  v:"min:0"`
	Name          string `p:"name" v:"required#请填写规则名称"`
	Title         string `p:"menuName" v:"required|length:1,100#请填写标题|标题长度在:min到:max位"`
	Icon          string `p:"icon"`
	Weigh         int    `p:"orderNum" `
	Condition     string `p:"condition" `
	Remark        string `p:"remark" `
	Status        uint   `p:"status" `
	AlwaysShow    uint   `p:"visible"`
	Path          string `p:"path"`
	Component     string `p:"component" v:"required-if:menuType,1#组件路径不能为空"`
	IsLink        uint   `p:"isLink"`
	IsIframe      uint   `p:"isIframe"`
	IsCached      uint   `p:"isCached"`
	ModuleType    string `p:"moduleType"`
	ModelId       uint   `p:"modelId"`
}

type RuleAddRes struct {
}
