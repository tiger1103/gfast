package system

import (
	"fmt"
	"github.com/gogf/gf/v2/frame/g"
)

type DbInitIsInitReq struct {
	g.Meta `path:"/dbInit/isInit" tags:"系统初始化" method:"get" summary:"系统初始化"`
}

type DbInitIsInitRes bool

type DbInitGetEnvInfoReq struct {
	g.Meta `path:"/dbInit/getEnvInfo" tags:"获取环境信息" method:"get" summary:"获取环境信息"`
}

type DbInitGetEnvInfoRes g.Map

type DbInitCreateDbReq struct {
	g.Meta       `path:"/dbInit/createDb" tags:"创建配置文件" method:"post" summary:"创建配置文件"`
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

func (req *DbInitCreateDbReq) ToDbInitConfig() *DbInitConfig {
	return &DbInitConfig{
		Database: Database{
			Default: DbDefault{
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
		Redis: Redis{
			Default: RedisDefault{
				Address:     fmt.Sprintf("%s:%d", req.RedisAddress, req.RedisPort),
				Db:          req.RedisDb,
				Pass:        req.RedisPass,
				IdleTimeout: 600,
				MaxActive:   100,
			},
		},
	}
}

// 程序初始化yaml配置文件
type DbInitConfig struct {
	Database Database `json:"database" yaml:"database"`
	Redis    Redis    `json:"redis" yaml:"redis"`
}

type Database struct {
	Default DbDefault `json:"default" yaml:"default"`
}

type DbDefault struct {
	Host        string `json:"host"  yaml:"host"`
	Port        int    `json:"port"  yaml:"port"`
	User        string `json:"user"  yaml:"user"`
	Pass        string `json:"pass"  yaml:"pass"`
	Name        string `json:"name"  yaml:"name"`
	Type        string `json:"type"  yaml:"type"`
	Role        string `json:"role"  yaml:"role"`
	Debug       bool   `json:"debug"  yaml:"debug"`
	Charset     string `json:"charset"  yaml:"charset"`
	DryRun      bool   `json:"dryRun"  yaml:"dryRun"`
	MaxIdle     int    `json:"maxIdle"  yaml:"maxIdle"`
	MaxOpen     int    `json:"maxOpen"  yaml:"maxOpen"`
	MaxLifetime int    `json:"maxLifetime"  yaml:"maxLifetime"`
}

type Redis struct {
	Default RedisDefault `json:"default" yaml:"default"`
}

type RedisDefault struct {
	Address     string `json:"address" yaml:"address"`
	Db          int    `json:"db" yaml:"db"`
	Pass        string `json:"pass" yaml:"pass"`
	IdleTimeout int    `json:"idleTimeout" yaml:"idleTimeout"`
	MaxActive   int    `json:"maxActive" yaml:"maxActive"`
}
