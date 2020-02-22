package test

import (
	"fmt"
	"gfast/app/service/cache_service"
	"testing"
)

func TestDemo2(t *testing.T) {
	t.Run("Adapters_test", test21)
}

func test21(t *testing.T) {
	cache_service.New().Set("wang", "老王", 0, "person")
	cache_service.New().Set("zs", "张三", 0, "person")
	cache_service.New().Set("ls", "李四", 0, "person")
	cache_service.New().Set("dog", "狗狗", 0, "animal")
	cache_service.New().Set("cat", "猫猫", 0, "animal")
	fmt.Println(cache_service.New().Keys())

	cache_service.New().RemoveByTag("animal") //删除动物标签
	fmt.Println(cache_service.New().Keys())

	fmt.Println(cache_service.New().Get("dog"))
}
