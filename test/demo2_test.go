package test

import (
	"fmt"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	c := "AB"
	r := []rune(c)
	num := 0
	for k, v := range r {
		num += int(v) - 65 + k*26
	}
	fmt.Println(num)
}
