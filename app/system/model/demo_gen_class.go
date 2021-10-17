// ==========================================================================
// GFast自动生成model代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2021-09-19 09:44:19
// 生成路径: gfast/app/system/model/demo_gen_class.go
// 生成人：gfast
// ==========================================================================


package model
// DemoGenClass is the golang structure for table demo_gen_class.
type DemoGenClass struct {	
         Id       uint         `orm:"id,primary" json:"id"`    // 分类id    
         ClassName    string         `orm:"class_name" json:"className"`    // 分类名    
}