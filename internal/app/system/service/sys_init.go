package service

import (
	"bufio"
	"bytes"
	"context"
	"fmt"
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/database/gredis"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/library/libUtils"
	"gopkg.in/yaml.v2"
	"io"
	"os"
	"strings"
	"time"
)

type ISysInit interface {
	// 生成配置文件
	CreateConfigFile(ctx context.Context, req *system.DbInitCreateDbReq) (err error)
	// 生成数据库
	CreateDataBase(ctx context.Context, dbName string) (err error)
	// 加载配置文件
	LoadConfigFile() (err error)

	// 是否已生成配置文件
	IsCreateConfigFile() bool

	//创建数据库
	CreateDataBaseByName(ctx context.Context, req *system.DbInitCreateDbReq) (err error)
}

func SysInit() ISysInit {
	return &sysInit{}
}

type sysInit struct{}

var SysInitConfig map[string]*gvar.Var

func init() {
	ctx := context.TODO()
	c, err := g.Cfg("initialize").Get(ctx, "initialize")
	if err != nil {
		g.Log().Panic(ctx, err)
	}
	SysInitConfig = make(map[string]*gvar.Var)
	SysInitConfig = c.MapStrVar()
}

// 创建数据库
func (s *sysInit) CreateDataBaseByName(ctx context.Context, req *system.DbInitCreateDbReq) (err error) {
	db, err := gdb.New(gdb.ConfigNode{
		Type: "mysql",
		Host: req.DbHost,
		Port: fmt.Sprintf("%d", req.DbPort),
		User: req.DbUser,
		Pass: req.DbPass,
	})
	if err != nil {
		return
	}
	defer db.Close(ctx)

	_, err = db.Exec(ctx, fmt.Sprintf("CREATE DATABASE IF NOT EXISTS  `%s` DEFAULT CHARSET utf8mb4  COLLATE utf8mb4_general_ci", req.DbName))
	if err != nil {
		return
	}

	return
}

// 是否已经生成配置文件
func (s *sysInit) IsCreateConfigFile() bool {
	return libUtils.FileIsExisted(SysInitConfig["configPath"].String())
}

// 加载配置文件
func (s *sysInit) LoadConfigFile() (err error) {
	var (
		ctx = context.TODO()
	)
	fileName, _ := libUtils.ParseFilePath(SysInitConfig["configPath"].String())
	// 加载数据库配置
	c1, err := g.Cfg(fileName).Get(ctx, "database.default")
	if err != nil {
		return
	}
	dbConfig := c1.MapStrVar()
	gdb.SetConfig(gdb.Config{
		"default": gdb.ConfigGroup{
			gdb.ConfigNode{
				Host:             dbConfig["host"].String(),
				Port:             dbConfig["port"].String(),
				User:             dbConfig["user"].String(),
				Pass:             dbConfig["pass"].String(),
				Name:             dbConfig["name"].String(),
				Type:             dbConfig["type"].String(),
				Role:             dbConfig["role"].String(),
				Debug:            dbConfig["debug"].Bool(),
				Charset:          dbConfig["charset"].String(),
				DryRun:           dbConfig["dryRun"].Bool(),
				MaxIdleConnCount: dbConfig["maxIdle"].Int(),
				MaxOpenConnCount: dbConfig["maxOpen"].Int(),
				MaxConnLifeTime:  dbConfig["maxLifetime"].Duration() * time.Second,
			},
		},
	})

	// 加载redis配置
	c2, err := g.Cfg(fileName).Get(ctx, "redis.default")
	if err != nil {
		return
	}
	redisConfig := c2.Map()
	err = gredis.SetConfigByMap(redisConfig)
	if err != nil {
		return
	}
	return
}

// 创建配置文件
func (s *sysInit) CreateConfigFile(ctx context.Context, req *system.DbInitCreateDbReq) (err error) {
	yamlConfig := req.ToDbInitConfig()
	b, err := yaml.Marshal(yamlConfig)
	if err != nil {
		return
	}
	err = libUtils.WriteToFile(SysInitConfig["configPath"].String(), string(b))
	return
}

// 读取sql文件
func (s *sysInit) ReadSqlFile(path string) (sqlArr []string, err error) {

	inputFile, inputError := os.Open(path)
	if inputError != nil {
		return nil, inputError
	}
	defer inputFile.Close()
	inputReader := bufio.NewReader(inputFile)
	var (
		flag   bool = true
		buffer bytes.Buffer
	)

	for {
		inputString, readerError := inputReader.ReadString('\n')
		inputString = strings.TrimSpace(inputString)
		if strings.HasPrefix(inputString, "--") {
			flag = false
		}
		if strings.HasPrefix(inputString, "/*") {
			flag = false
		}

		if flag && inputString != "" {
			if strings.HasSuffix(inputString, ";") {
				if buffer.Len() == 0 {
					sqlArr = append(sqlArr, inputString)
				} else {
					buffer.WriteString(inputString)
					sqlArr = append(sqlArr, buffer.String())
					buffer.Reset()
				}
			} else {
				buffer.WriteString(inputString + " ")
			}
		}

		if !flag && strings.HasPrefix(inputString, "*/") {
			flag = true
		}

		if !flag && strings.HasPrefix(inputString, "--") {
			flag = true
		}

		if readerError == io.EOF {
			break
		}
	}
	return
}

// 创建数据库表
func (s *sysInit) CreateDataBase(ctx context.Context, dbName string) (err error) {
	sqlArr, err := s.ReadSqlFile(SysInitConfig["sqlFilePath"].String())
	if err != nil {
		return
	}

	if len(sqlArr) == 0 {
		return
	}
	// newSqlArr := SqlArr(sqlArr).Split(10)
	db := g.DB()
	for _, item := range sqlArr {
		_, err = db.Exec(ctx, item)
		if err != nil {
			return
		}
	}

	return
}

type SqlArr []string

func (arr SqlArr) Split(num int) (result SqlArr) {
	if len(arr) == 0 {
		return
	}
	var (
		buffer bytes.Buffer
		i      int
	)

	for _, item := range arr {
		buffer.WriteString(item)
		i++
		if i == num {
			result = append(result, buffer.String())
			buffer.Reset()
			i = 0
		}
	}

	if buffer.Len() > 0 {
		result = append(result, buffer.String())
	}

	return

}
