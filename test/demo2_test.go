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
	fmt.Println(gtime.Date())
}
