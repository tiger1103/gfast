/*
* @desc:菜单model
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/11 14:53
 */

package model

type SysAuthRuleInfoRes struct {
	Id        uint   `orm:"id,primary"  json:"id"`        //
	Pid       uint   `orm:"pid"         json:"pid"`       // 父ID
	Name      string `orm:"name,unique" json:"name"`      // 规则名称
	Title     string `orm:"title"       json:"title"`     // 规则名称
	Icon      string `orm:"icon"        json:"icon"`      // 图标
	Condition string `orm:"condition"   json:"condition"` // 条件
	Remark    string `orm:"remark"      json:"remark"`    // 备注
	MenuType  uint   `orm:"menu_type"   json:"menuType"`  // 类型 0目录 1菜单 2按钮
	Weigh     int    `orm:"weigh"       json:"weigh"`     // 权重
	IsHide    uint   `orm:"is_hide" json:"isHide"`        // 显示状态
	IsCached  uint   `orm:"is_cached"  json:"isCached"`   // 是否缓存
	IsAffix   uint   `orm:"is_affix" json:"isAffix"`      //是否固定
	Path      string `orm:"path"        json:"path"`      // 路由地址
	Redirect  string `orm:"redirect"   json:"redirect"`   // 跳转路由
	Component string `orm:"component"   json:"component"` // 组件路径
	IsIframe  uint   `orm:"is_iframe"    json:"isIframe"` // 是否iframe
	IsLink    uint   `orm:"is_link" json:"isLink"`        // 是否外链 1是 0否
	LinkUrl   string `orm:"link_url" json:"linkUrl"`      //链接地址
}

// SysAuthRuleTreeRes 菜单树形结构
type SysAuthRuleTreeRes struct {
	*SysAuthRuleInfoRes
	Children []*SysAuthRuleTreeRes `json:"children"`
}

type UserMenu struct {
	Id        uint   `json:"id"`
	Pid       uint   `json:"pid"`
	Name      string `json:"name"`
	Component string `json:"component"`
	Path      string `json:"path"`
	*MenuMeta `json:"meta"`
}

type UserMenus struct {
	*UserMenu `json:""`
	Children  []*UserMenus `json:"children"`
}

type MenuMeta struct {
	Icon        string `json:"icon"`
	Title       string `json:"title"`
	IsLink      string `json:"isLink"`
	IsHide      bool   `json:"isHide"`
	IsKeepAlive bool   `json:"isKeepAlive"`
	IsAffix     bool   `json:"isAffix"`
	IsIframe    bool   `json:"isIframe"`
}
