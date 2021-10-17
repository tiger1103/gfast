// ==========================================================================
// GFast自动生成dao操作代码，无需手动修改，重新生成不会自动覆盖.
// 生成日期：2021-09-19 09:44:19
// 生成路径: gfast/app/system/dao/demo_gen_class.go
// 生成人：gfast
// ==========================================================================


package dao
import (
    comModel "gfast/app/common/model"
    "gfast/app/system/dao/internal"    
)
// demoGenClassDao is the manager for logic model data accessing and custom defined data operations functions management.
// You can define custom methods on it to extend its functionality as you wish.
type demoGenClassDao struct {
	*internal.DemoGenClassDao
}
var (
    // DemoGenClass is globally public accessible object for table tools_gen_table operations.
    DemoGenClass = demoGenClassDao{
        internal.NewDemoGenClassDao(),
    }
)


// Fill with you ideas below.


// DemoGenClassSearchReq 分页请求参数
type DemoGenClassSearchReq struct {    
    ClassName  string `p:"className"` //分类名    
    comModel.PageReq
}
// DemoGenClassAddReq 添加操作请求参数
type DemoGenClassAddReq struct {    
    ClassName  string   `p:"className" v:"required#分类名不能为空"`    
}
// DemoGenClassEditReq 修改操作请求参数
type DemoGenClassEditReq struct {
    Id    uint  `p:"id" v:"required#主键ID不能为空"`    
    ClassName  string `p:"className" v:"required#分类名不能为空"`    
}
