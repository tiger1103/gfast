// ==========================================================================
// GFast自动生成dao操作代码。
// 生成日期：2023-01-12 17:43:50
// 生成路径: internal/app/system/dao/sys_job.go
// 生成人：gfast
// desc:定时任务
// company:云南奇讯科技有限公司
// ==========================================================================

package dao

import (
	"github.com/tiger1103/gfast/v3/internal/app/system/dao/internal"
)

// sysJobDao is the manager for logic model data accessing and custom defined data operations functions management.
// You can define custom methods on it to extend its functionality as you wish.
type sysJobDao struct {
	*internal.SysJobDao
}

var (
	// SysJob is globally public accessible object for table tools_gen_table operations.
	SysJob = sysJobDao{
		internal.NewSysJobDao(),
	}
)

// Fill with you ideas below.
