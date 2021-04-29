package dict_service

import (
	"gfast/app/model/admin/sys_dict_data"
	"gfast/app/model/admin/sys_dict_type"
	"gfast/app/service/cache_service"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

//检查字典类型是否唯一
func CheckDictTypeUniqueAll(dictType string) bool {
	return sys_dict_type.CheckDictTypeUniqueAll(dictType)
}

//根据主键判断是否唯一
func CheckDictTypeUnique(dictType *sys_dict_type.EditReq) bool {
	return sys_dict_type.CheckDictTypeUnique(dictType)
}

//添加数据
func AddSave(req *sys_dict_type.AddReq, userId uint64) (int64, error) {
	return sys_dict_type.AddSave(req, userId)
}

//修改保存字典类型
func EditSave(req *sys_dict_type.EditReq, userId uint64) error {
	return g.DB().Transaction(func(tx *gdb.TX) error {
		entity, err := GetDictById(gconv.Int(req.DictId))
		if err != nil || entity == nil {
			return err
		}
		oldType := entity.DictType
		entity.DictType = req.DictType
		entity.DictName = req.DictName
		entity.Status = req.Status
		entity.Remark = req.Remark
		entity.UpdateBy = gconv.Uint(userId)
		entity.UpdateTime = gconv.Uint64(gtime.Timestamp())
		_, err = sys_dict_type.Model.TX(tx).Save(entity)
		if err != nil {
			g.Log().Error(err)
			return gerror.New("更新失败")
		}
		//更新字典数据中的类型
		_, err = sys_dict_data.Model.TX(tx).Data(g.Map{
			sys_dict_data.Columns.DictType: req.DictType,
		}).Where(sys_dict_data.Columns.DictType, oldType).Update()
		if err != nil {
			g.Log().Error(err)
			return gerror.New("更新失败")
		}
		return nil
	})
}

//字典列表查询分页
func SelectListByPage(req *sys_dict_type.SelectPageReq) (total, page int, list []*sys_dict_type.Entity, err error) {
	return sys_dict_type.SelectListByPage(req)
}

//通过id获取字典数据
func GetDictById(id int) (dict *sys_dict_type.Entity, err error) {
	return sys_dict_type.GetDictById(id)
}

//通过字典键类型获取选项
func GetDictWithDataByType(dictType, defaultValue, emptyLabel string) (dict g.Map, err error) {
	return sys_dict_type.GetDictWithDataByType(dictType, defaultValue, emptyLabel)
}

//删除字典
func DeleteDictByIds(ids []int) error {
	return sys_dict_type.DeleteDictByIds(ids)
}

func GetAllDictType() (list []*sys_dict_type.Entity, err error) {
	cache := cache_service.New()
	//从缓存获取
	data := cache.Get(gconv.String(cache_service.AdminConfigDict) + "_dict_type_all")
	if data != nil {
		list = data.([]*sys_dict_type.Entity)
		return
	}
	list, err = sys_dict_type.GetAllDictType()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取字典类型数据出错")
		return
	}
	//缓存
	cache.Set(gconv.String(cache_service.AdminConfigDict)+"_dict_type_all", list, 0, cache_service.AdminSysConfigTag)
	return
}
