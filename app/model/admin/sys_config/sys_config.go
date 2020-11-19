package sys_config

import (
	"gfast/library/service"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

// Fill with you ideas below.
//新增页面请求参数
type AddReq struct {
	ConfigName  string `p:"configName"  v:"required#参数名称不能为空"`
	ConfigKey   string `p:"configKey"  v:"required#参数键名不能为空"`
	ConfigValue string `p:"configValue"  v:"required#参数键值不能为空"`
	ConfigType  int    `p:"configType"    v:"required|in:0,1#系统内置不能为空|系统内置类型只能为0或1"`
	Remark      string `p:"remark"`
}

//修改页面请求参数
type EditReq struct {
	ConfigId int64 `p:"configId" v:"required|min:1#主键ID不能为空|主键ID参数错误"`
	AddReq
}

//分页请求参数
type SelectPageReq struct {
	ConfigName string `p:"configName"` //参数名称
	ConfigKey  string `p:"configKey"`  //参数键名
	ConfigType string `p:"configType"` //状态
	BeginTime  string `p:"beginTime"`  //开始时间
	EndTime    string `p:"endTime"`    //结束时间
	PageNum    int    `p:"pageNum"`    //当前页码
	PageSize   int    `p:"pageSize"`   //每页数
}

//保存参数
func AddSave(req *AddReq, userId uint64) (id int64, err error) {
	var entity Entity
	entity.ConfigName = req.ConfigName
	entity.ConfigKey = req.ConfigKey
	entity.ConfigType = req.ConfigType
	entity.ConfigValue = req.ConfigValue
	entity.Remark = req.Remark
	time := gconv.Uint64(gtime.Timestamp())
	entity.CreateTime = time
	entity.UpdateTime = time
	entity.CreateBy = gconv.Uint(userId)
	result, err := entity.Insert()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("保存失败")
	}
	id, err = result.LastInsertId()
	if err != nil {
		g.Log().Error()
		err = gerror.New("获取插入的主键ID失败")
	}
	return
}

//修改保存
func EditSave(req *EditReq, userId uint64) (int64, error) {
	entity, err := GetParamsById(gconv.Int(req.ConfigId))
	if err != nil {
		return 0, err
	}
	entity.ConfigName = req.ConfigName
	entity.ConfigKey = req.ConfigKey
	entity.ConfigType = req.ConfigType
	entity.ConfigValue = req.ConfigValue
	entity.Remark = req.Remark
	entity.UpdateTime = gconv.Uint64(gtime.Timestamp())
	entity.UpdateBy = gconv.Uint(userId)
	result, err := Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("修改失败")
	}
	rows, err := result.RowsAffected()
	if err != nil {
		g.Log().Error(err)
		return 0, gerror.New("修改失败")
	}
	return rows, nil
}

//通过id查询参数数据
func GetParamsById(id int) (entity *Entity, err error) {
	entity, err = Model.FindOne("config_id", id)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询参数数据出错")
	}
	if entity == nil {
		err = gerror.New("未查询到参数数据")
	}
	return
}

//验证参数键名是否存在
func CheckConfigKeyUniqueAll(configKey string) error {
	entity, err := Model.FindOne("config_key", configKey)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("校验数据失败")
	}
	if entity != nil {
		return gerror.New("参数键名已经存在")
	}
	return nil
}

//列表分页搜索查询
func SelectListByPage(req *SelectPageReq) (total, page int, list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.ConfigName != "" {
			model = model.Where("config_name like ?", "%"+req.ConfigName+"%")
		}
		if req.ConfigType != "" {
			model = model.Where("config_type = ", gconv.Int(req.ConfigType))
		}
		if req.ConfigKey != "" {
			model = model.Where("config_key like ?", "%"+req.ConfigKey+"%")
		}
		if req.BeginTime != "" {
			model = model.Where("create_time >= ? ", utils.StrToTimestamp(req.BeginTime))
		}

		if req.EndTime != "" {
			model = model.Where("create_time<=?", utils.StrToTimestamp(req.EndTime))
		}
	}
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = service.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("config_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//检查键是否已经存在
func CheckConfigKeyUnique(configKey string, configId int64) error {
	entity, err := Model.FindOne("config_key=? and config_id!=?", configKey, configId)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("校验数据失败")
	}
	if entity != nil {
		return gerror.New("参数键名已经存在")
	}
	return nil
}

//删除参数
func DeleteByIds(ids []int) error {
	_, err := Model.Delete("config_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}

//通过key获取配置信息
func GetByKey(key string) (config *Entity, err error) {
	config, err = Model.FindOne("config_key", key)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取配置失败")
	}
	return
}
