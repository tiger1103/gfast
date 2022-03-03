// ==========================================================================
// GFast自动生成dao操作代码，无需手动修改，重新生成不会自动覆盖.
// 生成日期：2022-03-03 10:11:15
// 生成路径: gfast/app/demo/dao/demo_data_auth.go
// 生成人：gfast
// ==========================================================================

package dao

import (
	comModel "gfast/app/common/model"
	"gfast/app/demo/dao/internal"
	"github.com/gogf/gf/os/gtime"
)

// demoDataAuthDao is the manager for logic model data accessing and custom defined data operations functions management.
// You can define custom methods on it to extend its functionality as you wish.
type demoDataAuthDao struct {
	*internal.DemoDataAuthDao
}

var (
	// DemoDataAuth is globally public accessible object for table tools_gen_table operations.
	DemoDataAuth = demoDataAuthDao{
		internal.NewDemoDataAuthDao(),
	}
)

// Fill with you ideas below.

// DemoDataAuthSearchReq 分页请求参数
type DemoDataAuthSearchReq struct {
	Id        string `p:"id" v:"id@integer#ID需为整数"`                                     //ID
	Title     string `p:"title"`                                                        //标题
	CreatedBy string `p:"createdBy" v:"createdBy@integer#创建人需为整数"`                      //创建人
	CreatedAt string `p:"createdAt" v:"createdAt@datetime#创建时间需为YYYY-MM-DD hh:mm:ss格式"` //创建时间
	comModel.PageReq
}

// DemoDataAuthAddReq 添加操作请求参数
type DemoDataAuthAddReq struct {
	Title     string `p:"title" v:"required#标题不能为空"`
	CreatedBy uint64
}

// DemoDataAuthEditReq 修改操作请求参数
type DemoDataAuthEditReq struct {
	Id        uint   `p:"id" v:"required#主键ID不能为空"`
	Title     string `p:"title" v:"required#标题不能为空"`
	UpdatedBy uint64
}

// DemoDataAuthListRes 列表返回结果
type DemoDataAuthListRes struct {
	Id        uint        `json:"id"`
	Title     string      `json:"title"`
	CreatedBy uint        `json:"createdBy"`
	CreatedAt *gtime.Time `json:"createdAt"`
}

// DemoDataAuthInfoRes 数据返回结果
type DemoDataAuthInfoRes struct {
	Id        uint        `json:"id"`
	Title     string      `json:"title"`
	CreatedBy uint        `json:"createdBy"`
	UpdatedBy uint        `json:"updatedBy"`
	CreatedAt *gtime.Time `json:"createdAt"`
	UpdatedAt *gtime.Time `json:"updatedAt"`
	DeletedAt *gtime.Time `json:"deletedAt"`
}
