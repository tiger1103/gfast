package test

import (
	"fmt"
	"github.com/gogf/gf/util/grand"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	for i := 0; i < 10; i++ {
		fmt.Println(grand.Letters(10))
	}
}
