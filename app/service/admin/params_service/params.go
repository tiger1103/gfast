package params_service

import (
	"gfast/app/model/admin/sys_config"
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

//保存参数
func AddSave(req *sys_config.AddReq, userId int) (id int64, err error) {
	var entity sys_config.Entity
	entity.ConfigName = req.ConfigName
	entity.ConfigKey = req.ConfigKey
	entity.ConfigType = req.ConfigType
	entity.ConfigValue = req.ConfigValue
	entity.Remark = req.Remark
	entity.CreateTime = gconv.Uint64(gtime.Timestamp())
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
func EditSave(req *sys_config.EditReq, userId int) (int64, error) {
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
	result, err := entity.Update()
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

//验证参数键名是否存在
func CheckConfigKeyUniqueAll(configKey string) error {
	entity, err := sys_config.Model.FindOne("config_key", configKey)
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
func SelectListByPage(req *sys_config.SelectPageReq) (total, page int, list []*sys_config.Entity, err error) {
	model := sys_config.Model
	if req != nil {
		if req.ConfigName != "" {
			model = model.Where("config_name like ?", "%"+req.ConfigName+"%")
		}
		if req.ConfigType != "" {
			model.Where("status = ", gconv.Int(req.ConfigType))
		}
		if req.ConfigKey != "" {
			model.Where("config_key like ?", "%"+req.ConfigKey+"%")
		}
		if req.BeginTime != "" {
			model = model.Where("create_time >= ? ", utils.StrToTimestamp(req.BeginTime))
		}

		if req.EndTime != "" {
			model = model.Where("create_time<=？", utils.StrToTimestamp(req.EndTime))
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
		req.PageSize = utils.AdminPageNum
	}
	list, err = model.Page(page, req.PageSize).Order("config_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

//通过id查询参数数据
func GetParamsById(id int) (entity *sys_config.Entity, err error) {
	entity, err = sys_config.Model.FindOne("config_id", id)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询参数数据出错")
	}
	if entity == nil {
		err = gerror.New("未查询到参数数据")
	}
	return
}

//检查键是否已经存在
func CheckConfigKeyUnique(configKey string, configId int64) error {
	entity, err := sys_config.Model.FindOne("config_key=? and config_id!=?", configKey, configId)
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
	_, err := sys_config.Model.Delete("config_id in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}
