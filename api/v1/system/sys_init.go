package system

import (
	"fmt"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
)

type DbInitIsInitReq struct {
	g.Meta `path:"/dbInit/isInit" tags:"系统初始化" method:"get" summary:"系统初始化"`
}

type DbInitIsInitRes bool

type DbInitGetEnvInfoReq struct {
	g.Meta `path:"/dbInit/getEnvInfo" tags:"系统初始化" method:"get" summary:"获取环境信息"`
}

type DbInitGetEnvInfoRes g.Map

type DbInitCreateDbReq struct {
	g.Meta       `path:"/dbInit/createDb" tags:"系统初始化" method:"post" summary:"创建配置文件"`
	DbHost       string `json:"dbHost" p:"dbHost" v:"required#数据库地址必须"`
	DbPort       int    `json:"dbPort" p:"dbPort" v:"required#数据库端口必须"`
	DbUser       string `json:"dbUser" p:"dbUser" v:"required#数据库用户名称必须"`
	DbPass       string `json:"dbPass"`
	DbName       string `json:"dbName" p:"dbName" v:"required#数据库名称必须"`
	DbCharset    string `json:"dbCharset" p:"dbCharset" v:"required#数据库编码必须"`
	RedisAddress string `json:"redisAddress" p:"redisAddress" v:"required#Redis地址必须"`
	RedisPort    int    `json:"redisPort" p:"redisPort" v:"required#Redis端口必须"`
	RedisDb      int    `json:"redisDb" p:"redisDb" v:"required#Redis索引必须"`
	RedisPass    string `json:"redisPass"`
}

type DbInitCreateDbRes bool

func (req *DbInitCreateDbReq) ToDbInitConfig() *model.DbInitConfig {
	return &model.DbInitConfig{
		Database: model.Database{
			Default: model.DbDefault{
				Host:        req.DbHost,
				Port:        req.DbPort,
				User:        req.DbUser,
				Pass:        req.DbPass,
				Name:        req.DbName,
				Type:        "mysql",
				Role:        "master",
				Debug:       true,
				Charset:     req.DbCharset,
				DryRun:      false,
				MaxIdle:     10,
				MaxOpen:     10,
				MaxLifetime: 10,
			},
		},
		Redis: model.Redis{
			Default: model.RedisDefault{
				Address:     fmt.Sprintf("%s:%d", req.RedisAddress, req.RedisPort),
				Db:          req.RedisDb,
				Pass:        req.RedisPass,
				IdleTimeout: 600,
				MaxActive:   100,
			},
		},
	}
}
