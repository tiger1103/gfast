package test

import (
	"context"
	"fmt"

	"github.com/gogf/gf/v2/os/gfile"
	"github.com/tiger1103/gfast/v3/library/libUtils"

	"testing"
)

func TestGetCityByIp(t *testing.T) {
	// 确保测试从项目test目录运行
	pwd := gfile.Dir(gfile.Pwd())
	fmt.Println(pwd)
	projectRoot := pwd
	if gfile.Exists(gfile.Join(projectRoot, "resource", "data", "ip2region.xdb")) {
		gfile.Chdir(projectRoot)
	}

	ips := []string{
		"182.240.92.100",
		"58.220.229.2",
		"36.48.112.12",
	}
	for _, ip := range ips {
		city := libUtils.GetCityByIp(context.Background(), ip)
		fmt.Printf("IP: %s => %s\n", ip, city)
		if city == "" {
			t.Errorf("GetCityByIp(%s) returned empty string", ip)
		}
	}
}
