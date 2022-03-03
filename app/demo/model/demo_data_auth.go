// ==========================================================================
// GFast自动生成model代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2022-03-03 10:11:15
// 生成路径: gfast/app/demo/model/demo_data_auth.go
// 生成人：gfast
// ==========================================================================

package model

import (
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gmeta"
)

// DemoDataAuth is the golang structure for table demo_data_auth.
type DemoDataAuth struct {
	gmeta.Meta `orm:"table:demo_data_auth"`
	Id         uint        `orm:"id,primary" json:"id"`        // ID
	Title      string      `orm:"title" json:"title"`          // 标题
	CreatedBy  uint        `orm:"created_by" json:"createdBy"` // 创建人
	UpdatedBy  uint        `orm:"updated_by" json:"updatedBy"` // 修改人
	CreatedAt  *gtime.Time `orm:"created_at" json:"createdAt"` // 创建时间
	UpdatedAt  *gtime.Time `orm:"updated_at" json:"updatedAt"` // 修改时间
	DeletedAt  *gtime.Time `orm:"deleted_at" json:"deletedAt"` // 删除时间
}
