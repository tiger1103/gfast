package test

import (
	"fmt"
	"github.com/gogf/gf/os/gtime"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	str := "2018.02.09 20:46:17"
	tm, err := gtime.StrToTime(str)
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println(tm.Timestamp())
}
