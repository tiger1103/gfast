/*
* @desc:测试定时任务
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/16 15:52
 */

package task

import (
	"fmt"
	"gfast/app/system/service"
)

func Test1() {
	fmt.Println("无参测试")
}

func Test2() {
	//获取参数
	t := service.TimeTaskList.GetByName("test2")
	if t == nil {
		return
	}
	for _, v := range t.Param {
		fmt.Printf("参数:%s;  ", v)
	}
	fmt.Println()
}
