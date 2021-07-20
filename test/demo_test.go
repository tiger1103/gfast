package test

import (
	"fmt"
	"gfast/app/system/dao"
	_ "gfast/boot"
	"gfast/library"
	"github.com/gogf/gf/os/glog"
	"testing"
)

func TestDemo(t *testing.T) {
	//t.Run("testEncryptPassword", testEncryptPassword)
	//t.Run("testIpToAddr", testIpToAddr)
	//t.Run("testDb", testDb)
	t.Run("test2", test2)
}

//测试加密函数
func testEncryptPassword(t *testing.T) {
	fmt.Println(library.EncryptPassword("yxh402063397", "OoFtPv"))
}

func testIpToAddr(t *testing.T) {
	fmt.Println(library.GetCityByIp("223.210.17.184"))
}

func testDb(t *testing.T) {
	d := dao.SysUser.Fields("id,user_name,user_nickname")
	d = d.Where("user_name", "admin")
	d = d.Or("user_name", "zs")
	data, _ := d.All()
	glog.Debug(data)
}

func test2(t *testing.T) {

}
