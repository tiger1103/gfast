// ==========================================================================
// GFast自动生成dao internal操作代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2022-03-03 10:11:15
// 生成路径: gfast/app/demo/dao/internal/demo_data_auth.go
// 生成人：gfast
// ==========================================================================

package internal

import (
	"context"
	"gfast/app/demo/model"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
)

// DemoDataAuthDao is the manager for logic model data accessing and custom defined data operations functions management.
type DemoDataAuthDao struct {
	Table   string              // Table is the underlying table name of the DAO.
	Group   string              // Group is the database configuration group name of current DAO.
	Columns DemoDataAuthColumns // Columns is the short type for Columns, which contains all the column names of Table for convenient usage.
}

// DemoDataAuthColumns defines and stores column names for table demo_data_auth.
type DemoDataAuthColumns struct {
	Id        string // ID
	Title     string // 标题
	CreatedBy string // 创建人
	UpdatedBy string // 修改人
	CreatedAt string // 创建时间
	UpdatedAt string // 修改时间
	DeletedAt string // 删除时间
}

var demoDataAuthColumns = DemoDataAuthColumns{
	Id:        "id",
	Title:     "title",
	CreatedBy: "created_by",
	UpdatedBy: "updated_by",
	CreatedAt: "created_at",
	UpdatedAt: "updated_at",
	DeletedAt: "deleted_at",
}

// NewDemoDataAuthDao creates and returns a new DAO object for table data access.
func NewDemoDataAuthDao() *DemoDataAuthDao {
	return &DemoDataAuthDao{
		Group:   "default",
		Table:   "demo_data_auth",
		Columns: demoDataAuthColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *DemoDataAuthDao) DB() gdb.DB {
	return g.DB(dao.Group)
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *DemoDataAuthDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(model.DemoDataAuth{}).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *DemoDataAuthDao) Transaction(ctx context.Context, f func(ctx context.Context, tx *gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
