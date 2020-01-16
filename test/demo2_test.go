package test

import (
	"fmt"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	a := []int{1, 2, 3, 4, 5}
	b := []int{6, 7, 8, 9}
	c := make([]int, 0, 9)
	c = append(c, a...)
	c = append(c, b...)
	fmt.Println(c)
}
