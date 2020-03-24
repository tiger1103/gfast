package test

import (
	"github.com/gogf/gf/database/gdb"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	gdb.Instance()
}
