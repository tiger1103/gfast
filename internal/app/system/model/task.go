/*
* @desc:定时任务
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2023/1/13 17:47
 */

package model

import "context"

type TimeTask struct {
	FuncName string
	Param    []string
	Run      func(ctx context.Context)
}
