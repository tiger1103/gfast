/*
* @desc:字典数据
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/4/3 12:00
 */

package service

import (
	"database/sql"
	"gfast/app/common/global"
	comModel "gfast/app/common/model"
	comService "gfast/app/common/service"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

type sysDictData struct{}

var SysDictData = new(sysDictData)

func (s sysDictData) DictDataList(req *model.SelectDictPageReq) (total, page int, list []*model.SysDictData, err error) {
	d := dao.SysDictData.Ctx(req.Ctx)
	if req != nil {
		if req.DictLabel != "" {
			d = d.Where(dao.SysDictData.Columns.DictLabel+" like ?", "%"+req.DictLabel+"%")
		}
		if req.Status != "" {
			d = d.Where(dao.SysDictData.Columns.Status+" = ", gconv.Int(req.Status))
		}
		if req.DictType != "" {
			d = d.Where(dao.SysDictData.Columns.DictType+" = ?", req.DictType)
		}
		total, err = d.Count()
		if err != nil {
			g.Log().Error(err)
			err = gerror.New("获取总行数失败")
			return
		}
		if req.PageNum == 0 {
			req.PageNum = 1
		}
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = comModel.PageSize
	}
	list, err = d.Page(page, req.PageSize).Order(dao.SysDictData.Columns.DictSort + " asc," +
		dao.SysDictData.Columns.DictCode + " asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
		return
	}
	return
}

// GetDictWithDataByType 通过字典键类型获取选项
func (s sysDictData) GetDictWithDataByType(req *model.GetDictReq) (dict *model.DictRes,
	err error) {
	cache := comService.Cache.New()
	cacheKey := global.SysDict + "_" + req.DictType
	//从缓存获取
	iDict := cache.Get(cacheKey)
	if iDict != nil {
		err = gconv.Struct(iDict, &dict)
		if err != nil {
			return
		}
	} else {
		//从数据库获取
		dict = &model.DictRes{}
		//获取类型数据
		err = dao.SysDictType.Ctx(req.Ctx).Where(dao.SysDictType.Columns.DictType, req.DictType).
			And(dao.SysDictType.Columns.Status, 1).Fields(model.DictTypeRes{}).Scan(&dict.Info)
		if err != nil {
			g.Log().Error(err)
			err = gerror.New("获取字典类型失败")
		}
		err = dao.SysDictData.Ctx(req.Ctx).Fields(model.DictDataRes{}).
			Where(dao.SysDictData.Columns.DictType, req.DictType).
			Order(dao.SysDictData.Columns.DictSort + " asc," +
				dao.SysDictData.Columns.DictCode + " asc").
			Scan(&dict.Values)
		if err != nil {
			g.Log().Error(err)
			err = gerror.New("获取字典数据失败")
		}
		//缓存菜单
		if dict.Info != nil && dict.Values != nil {
			cache.Set(cacheKey, dict, 0, global.SysDictTag)
		}
	}
	//设置给定的默认值
	for _, v := range dict.Values {
		if req.DefaultValue != "" {
			if gstr.Equal(req.DefaultValue, v.DictValue) {
				v.IsDefault = 1
			} else {
				v.IsDefault = 0
			}
		}
	}
	return
}

// CheckDictTypeUniqueAll 检查字典类型是否唯一
func (s *sysDictData) CheckDictTypeUniqueAll(dictType string) bool {
	dict, err := dao.SysDictData.FindOne(dao.SysDictData.Columns.DictType+"=?", dictType)
	if err != nil {
		g.Log().Error(err)
		return false
	}
	if dict != nil {
		return false
	}
	return true
}

// AddSave 添加保存字典数据
func (s *sysDictData) AddSave(req *model.DictDataAddReq) (id int64, err error) {
	var res sql.Result
	res, err = dao.SysDictData.Data(req).Insert()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("添加字典数据失败")
		return
	}
	id, err = res.LastInsertId()
	return
}

// GetDictDataById 通过字典数据id获取字典数据
func (s sysDictData) GetDictDataById(id int) (data *model.SysDictData, err error) {
	data, err = dao.SysDictData.FindOne(dao.SysDictData.Columns.DictCode, id)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取字典数据失败")
		return
	}
	if data == nil {
		err = gerror.New("获取字典数据失败")
	}
	return
}

// EditSaveData 修改字典数据
func (s sysDictData) EditSaveData(req *model.EditDictDataReq) (err error) {
	_, err = dao.SysDictData.FieldsEx(dao.SysDictData.Columns.DictCode, dao.SysDictData.Columns.CreateBy).
		WherePri(req.DictCode).Update(req)
	return
}

// DeleteDictDataByIds 删除字典数据
func (s sysDictData) DeleteDictDataByIds(ids []int) error {
	_, err := dao.SysDictData.Where(dao.SysDictData.Columns.DictCode+" in(?)", ids).Delete()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}
