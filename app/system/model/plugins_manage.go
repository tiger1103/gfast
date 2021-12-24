// ==========================================================================
// GFast自动生成model代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2021-08-31 17:58:43
// 生成路径: gfast/app/system/model/plugins_manage.go
// 生成人：gfast
// ==========================================================================

package model

// PluginsManage is the golang structure for table plugins_manage.
type PluginsManage struct {
	Id            uint   `orm:"id,primary" json:"id"`                // ID
	StoreId       int    `orm:"store_id" json:"storeId"`             // 插件在商城中的id
	PName         string `orm:"p_name" json:"pName"`                 // 插件名称英文
	PTitle        string `orm:"p_title" json:"pTitle"`               // 插件名称
	PDescription  string `orm:"p_description" json:"pDescription"`   // 插件介绍
	PAuth         string `orm:"p_auth" json:"pAuth"`                 // 作者
	IsInstall     int    `orm:"is_install" json:"isInstall"`         // 是否安装
	Status        int    `orm:"status" json:"status"`                // 状态
	Version       string `orm:"version" json:"version"`              // 当前版本
	Price         uint   `orm:"price" json:"price"`                  // 价格
	DownloadTimes uint   `orm:"download_times" json:"downloadTimes"` // 下载次数
	InstallPath   string `orm:"install_oath" json:"installPath"`     // 安装路径
}
