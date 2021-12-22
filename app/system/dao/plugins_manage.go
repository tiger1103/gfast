// ==========================================================================
// GFast自动生成dao操作代码，无需手动修改，重新生成不会自动覆盖.
// 生成日期：2021-08-31 17:58:43
// 生成路径: gfast/app/system/dao/plugins_manage.go
// 生成人：gfast
// ==========================================================================

package dao

import (
	comModel "gfast/app/common/model"
	"gfast/app/system/dao/internal"
	"github.com/gogf/gf/os/gtime"
)

// pluginsManageDao is the manager for logic model data accessing and custom defined data operations functions management.
// You can define custom methods on it to extend its functionality as you wish.
type pluginsManageDao struct {
	*internal.PluginsManageDao
}

var (
	// PluginsManage is globally public accessible object for table tools_gen_table operations.
	PluginsManage = pluginsManageDao{
		internal.NewPluginsManageDao(),
	}
)

// Fill with you ideas below.

// PluginsManageSearchReq 分页请求参数
type PluginsManageSearchReq struct {
	PName  string `p:"pName"`  //插件名称英文
	PTitle string `p:"pTitle"` //插件名称
	PAuth  string `p:"pAuth"`  //作者
	Status string `p:"status"` //状态
	comModel.PageReq
}

// PluginsManageAddReq 添加操作请求参数
type PluginsManageAddReq struct {
	StoreId       int    `p:"storeId" `
	PName         string `p:"pName" v:"required#插件名称英文不能为空"`
	PTitle        string `p:"pTitle" `
	PDescription  string `p:"pDescription" `
	PAuth         string `p:"pAuth" `
	Status        int    `p:"status" v:"required#状态不能为空"`
	Version       string `p:"version" `
	Price         uint   `p:"price" v:"required#价格不能为空"`
	DownloadTimes uint   `p:"downloadTimes" v:"required#下载次数不能为空"`
	IsInstall     int    `p:"isInstall" v:"required#是否安装不能为空"`
}

// PluginsManageEditReq 修改操作请求参数
type PluginsManageEditReq struct {
	Id            uint   `p:"id" v:"required#主键ID不能为空"`
	StoreId       int    `p:"storeId" `
	PName         string `p:"pName" v:"required#插件名称英文不能为空"`
	PTitle        string `p:"pTitle" `
	PDescription  string `p:"pDescription" `
	PAuth         string `p:"pAuth" `
	Status        int    `p:"status" v:"required#状态不能为空"`
	Version       string `p:"version" `
	Price         uint   `p:"price" v:"required#价格不能为空"`
	DownloadTimes uint   `p:"downloadTimes" v:"required#下载次数不能为空"`
	IsInstall     int    `p:"isInstall" v:"required#是否安装不能为空"`
}

// PluginsManageStatusReq 设置状态参数
type PluginsManageStatusReq struct {
	PluginId uint `p:"pluginId" v:"required#pluginId不能为空"`
	Status   int  `p:"status" v:"required#状态不能为空"`
}

// PluginsManageListRes 列表返回结果
type PluginsManageListRes struct {
	Id            uint   `json:"id" `
	PName         string `json:"pName" v:"required#插件名称英文不能为空"`
	PTitle        string `json:"pTitle" `
	PDescription  string `json:"pDescription" `
	PAuth         string `json:"pAuth" `
	Status        int    `json:"status" v:"required#状态不能为空"`
	Version       string `json:"version" `
	Price         uint   `json:"price" v:"required#价格不能为空"`
	DownloadTimes uint   `json:"downloadTimes" v:"required#下载次数不能为空"`
}

// PluginsManageInfoRes 数据返回结果
type PluginsManageInfoRes struct {
	Id            uint   `json:"id" `
	StoreId       int    `json:"storeId" `
	PName         string `json:"pName" v:"required#插件名称英文不能为空"`
	PTitle        string `json:"pTitle" `
	PDescription  string `json:"pDescription" `
	PAuth         string `json:"pAuth" `
	IsInstall     int    `json:"isInstall" v:"required#是否安装不能为空"`
	Status        int    `json:"status" v:"required#状态不能为空"`
	Version       string `json:"version" `
	Price         uint   `json:"price" v:"required#价格不能为空"`
	DownloadTimes uint   `json:"downloadTimes" v:"required#下载次数不能为空"`
}

// CsPluginListRes 插件商城获取的插件数据
type CsPluginListRes struct {
	PluginId       uint        `orm:"plugin_id,primary" json:"pluginId"`     // ID
	PluginCateId   uint        `orm:"plugin_cate_id" json:"pluginCateId"`    // 分类ID
	PluginName     string      `orm:"plugin_name" json:"pluginName"`         // 插件名称
	CodeName       string      `orm:"code_name" json:"CodeName"`             // 代码名称
	PluginPrice    uint        `orm:"plugin_price" json:"pluginPrice"`       // 售价
	PluginPriceStr string      `json:"pluginPriceStr"`                       // 售价decimal
	PluginDiscount uint        `orm:"plugin_discount" json:"pluginDiscount"` // 折扣
	PluginCreater  uint        `orm:"plugin_creater" json:"pluginCreater"`   // 开发人员ID
	PublishDate    *gtime.Time `orm:"publish_date" json:"publishDate"`       // 发布日期
	PluginThumb    string      `orm:"plugin_thumb" json:"pluginThumb"`       // 插件封面
	PluginImgs     string      `orm:"plugin_imgs" json:"pluginImgs"`         // 插件预览图
	CreatedBy      uint64      `orm:"created_by" json:"createdBy"`           // 创建人
	CreatedAt      *gtime.Time `orm:"created_at" json:"createdAt"`           // 创建日期
	UpdatedAt      *gtime.Time `orm:"updated_at" json:"updatedAt"`           // 修改日期
	DeletedAt      *gtime.Time `orm:"deleted_at" json:"deletedAt"`           // 删除日期
	DownloadTimes  uint64      `orm:"download_times" json:"downloadTimes"`   //下载次数
	Description    string      `orm:"description" json:"description"`        //插件描述
	PluginInfo     []*struct {
		InfoId      uint   `json:"infoId"`      // ID
		PluginId    uint   `json:"pluginId"`    // 插件ID
		InfoVersion string `json:"infoVersion"` // 版本号
	} `json:"pluginInfo"`
	MemName   string `json:"memName" orm:"mem_name"`
	Status    int    `json:"status"`
	Version   string `json:"version" `
	IsInstall int    `json:"isInstall"`
}

// PluginsManageInstallReq 插件安装操作参数
type PluginsManageInstallReq struct {
	PluginId uint   `p:"pluginId" v:"required#插件ID不能为空"`
	Version  string `p:"version"`
	RToken   string `p:"rToken"`
}

// PluginRLoginFormReq 远端登录请求参数
type PluginRLoginFormReq struct {
	Username   string `p:"username" v:"required#账号必须" json:"username"`
	Password   string `p:"password" v:"required#密码不能为空" json:"password"`
	VerifyCode string `p:"verifyCode" v:"required#验证码不能为空" json:"verifyCode"`
	VerifyKey  string `p:"verifyKey" json:"verifyKey"`
}
