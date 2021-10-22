

package task

import (
	"fmt"
	"gfast/app/system/service"
)

func Test1() {
	fmt.Printf("Test1()参数 ")
}

func Test2() {
	//获取参数
	t := service.TimeTaskList.GetByName("test2")
	if t == nil {
		return
	}

	for _, v := range t.Param {
		fmt.Printf("Test2()参数:%s;  ", v)
		fmt.Println()
	}

}
