/*
* @desc:菜单model
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/11 14:53
 */

package model

type SysAuthRuleInfoRes struct {
	Id         uint   `orm:"id,primary"  json:"id"`         //
	Pid        uint   `orm:"pid"         json:"pid"`        // 父ID
	Name       string `orm:"name,unique" json:"name"`       // 规则名称
	Title      string `orm:"title"       json:"title"`      // 规则名称
	Icon       string `orm:"icon"        json:"icon"`       // 图标
	Condition  string `orm:"condition"   json:"condition"`  // 条件
	Remark     string `orm:"remark"      json:"remark"`     // 备注
	MenuType   uint   `orm:"menu_type"   json:"menuType"`   // 类型 0目录 1菜单 2按钮
	Weigh      int    `orm:"weigh"       json:"weigh"`      // 权重
	Status     uint   `orm:"status"      json:"status"`     // 状态
	AlwaysShow uint   `orm:"always_show" json:"alwaysShow"` // 显示状态
	Path       string `orm:"path"        json:"path"`       // 路由地址
	JumpPath   string `orm:"jump_path"   json:"jumpPath"`   // 跳转路由
	Component  string `orm:"component"   json:"component"`  // 组件路径
	IsFrame    uint   `orm:"is_frame"    json:"isFrame"`    // 是否外链 1是 0否
	ModuleType string `orm:"module_type" json:"moduleType"` // 所属模块
	ModelId    uint   `orm:"model_id"    json:"modelId"`    // 模型ID
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
