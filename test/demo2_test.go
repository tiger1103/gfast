package test

import (
	"fmt"
	"github.com/gogf/gf/text/gstr"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	str := "字s符s串.中文测试"
	fmt.Println(gstr.SearchArray(gstr.Split(str, ""), "."))
	fmt.Println(gstr.SubStr(str, gstr.SearchArray(gstr.Split(str, ""), ".")+1))
}
