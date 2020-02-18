package test

import (
	"fmt"
	"strings"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	fmt.Println(strings.Repeat("yxh", 2))
}
