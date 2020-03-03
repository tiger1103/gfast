package test

import (
	"testing"
	"time"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	a := make(chan bool)
	b := make(chan bool)
	defer close(b)
	go func() {
		for {
			select {
			case <-a:
			default:
				<-b
			}
		}

	}()
	time.Sleep(1 * time.Second)
	a <- true
}
