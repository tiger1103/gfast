package test

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	c := make(chan bool)
	for i := 0; i < 10000; i++ {
		go func() {
			i, e := g.Redis().Do("get", "GToken:adminIJ1xz+Wve+ZONVMFfXJQMw==50607842719694a7380dc72aacc4a0b4")
			if e != nil {
				fmt.Println(e)
			}
			fmt.Println(string(i.([]byte)))
		}()
	}
	<-c
}
