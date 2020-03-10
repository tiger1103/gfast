package test

import (
	"fmt"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	s := []int{1, 2, 3}
	s1 := []int{0}
	s1 = append(s1, s...)
	fmt.Println(s1)
}
