// ==========================================================================
// GFast自动生成dao internal操作代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2021-07-26 11:07:30
// 生成路径: gfast/app/system/dao/internal/demo_gen_class.go
// 生成人：gfast
// ==========================================================================

package internal

import (
	"context"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
)

// DemoGenClassDao is the manager for logic model data accessing and custom defined data operations functions management.
type DemoGenClassDao struct {
	Table   string              // Table is the underlying table name of the DAO.
	Group   string              // Group is the database configuration group name of current DAO.
	Columns DemoGenClassColumns // Columns is the short type for Columns, which contains all the column names of Table for convenient usage.
}

// DemoGenClassColumns defines and stores column names for table demo_gen_class.
type DemoGenClassColumns struct {
	Id        string // 分类id
	ClassName string // 分类名
}

var demoGenClassColumns = DemoGenClassColumns{
	Id:        "id",
	ClassName: "class_name",
}

// NewDemoGenClassDao creates and returns a new DAO object for table data access.
func NewDemoGenClassDao() *DemoGenClassDao {
	return &DemoGenClassDao{
		Group:   "default",
		Table:   "demo_gen_class",
		Columns: demoGenClassColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *DemoGenClassDao) DB() gdb.DB {
	return g.DB(dao.Group)
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *DemoGenClassDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.Table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *DemoGenClassDao) Transaction(ctx context.Context, f func(ctx context.Context, tx *gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
