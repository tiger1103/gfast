// ==========================================================================
// GFast自动生成dao internal操作代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2021-08-31 17:58:43
// 生成路径: gfast/app/system/dao/internal/plugins_manage.go
// 生成人：gfast
// ==========================================================================

package internal

import (
	"context"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
)

// PluginsManageDao is the manager for logic model data accessing and custom defined data operations functions management.
type PluginsManageDao struct {
	Table   string               // Table is the underlying table name of the DAO.
	Group   string               // Group is the database configuration group name of current DAO.
	Columns PluginsManageColumns // Columns is the short type for Columns, which contains all the column names of Table for convenient usage.
}

// PluginsManageColumns defines and stores column names for table plugins_manage.
type PluginsManageColumns struct {
	Id            string // ID
	StoreId       string // 插件在商城中的id
	PName         string // 插件名称英文
	PTitle        string // 插件名称
	PDescription  string // 插件介绍
	PAuth         string // 作者
	IsInstall     string // 是否安装
	Status        string // 状态
	Version       string // 当前版本
	Price         string // 价格
	DownloadTimes string // 下载次数
	InstallPath   string // 安装路径
}

var pluginsManageColumns = PluginsManageColumns{
	Id:            "id",
	StoreId:       "store_id",
	PName:         "p_name",
	PTitle:        "p_title",
	PDescription:  "p_description",
	PAuth:         "p_auth",
	IsInstall:     "is_install",
	Status:        "status",
	Version:       "version",
	Price:         "price",
	DownloadTimes: "download_times",
	InstallPath:   "install_path",
}

// NewPluginsManageDao creates and returns a new DAO object for table data access.
func NewPluginsManageDao() *PluginsManageDao {
	return &PluginsManageDao{
		Group:   "default",
		Table:   "plugins_manage",
		Columns: pluginsManageColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *PluginsManageDao) DB() gdb.DB {
	return g.DB(dao.Group)
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *PluginsManageDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.Table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *PluginsManageDao) Transaction(ctx context.Context, f func(ctx context.Context, tx *gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
