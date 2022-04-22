package controller

import (
	"context"
	"github.com/shirou/gopsutil/host"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
	"runtime"
)

var DbInit = sysDbInitController{}

type sysDbInitController struct {
	BaseController
}

// 系统是否已经初始化
func (c *sysDbInitController) IsInit(ctx context.Context, req *system.DbInitIsInitReq) (res *system.DbInitIsInitRes, err error) {
	res = new(system.DbInitIsInitRes)
	// autoInit=false则前端将不走自动初始化的流程
	if service.SysInitConfig["autoInit"].Bool() == false {
		*res = system.DbInitIsInitRes(true)
		return
	}
	// 判断是否已经生成配置文件
	*res = system.DbInitIsInitRes(service.SysInit().IsCreateConfigFile())
	return
}

// 获取环境检测信息
func (c *sysDbInitController) GetEnvInfo(ctx context.Context, req *system.DbInitGetEnvInfoReq) (res *system.DbInitGetEnvInfoRes, err error) {
	sysInfo, err := host.Info()
	if err != nil {
		return
	}
	res = new(system.DbInitGetEnvInfoRes)
	*res = system.DbInitGetEnvInfoRes{
		"sysOsName": sysInfo.OS,
		"goVersion": runtime.Version(),
	}
	return
}

// 创建配置文件及数据库等
func (c *sysDbInitController) CreateDb(ctx context.Context, req *system.DbInitCreateDbReq) (res *system.DbInitCreateDbRes, err error) {
	// 生成数据库
	err = service.SysInit().CreateDataBaseByName(ctx, req)
	if err != nil {
		return
	}

	// 生成配置文件
	err = service.SysInit().CreateConfigFile(ctx, req)
	if err != nil {
		return
	}

	// 加载配置文件
	err = service.SysInit().LoadConfigFile()
	if err != nil {
		return
	}

	// 生成数据库表机构及数据
	err = service.SysInit().CreateDataBase(ctx, req.DbName)
	if err != nil {
		return
	}

	res = new(system.DbInitCreateDbRes)
	*res = true
	return
}
