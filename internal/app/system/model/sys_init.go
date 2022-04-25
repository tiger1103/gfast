package model

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
