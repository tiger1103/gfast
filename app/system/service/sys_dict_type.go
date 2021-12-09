package service

import (
	"context"
	"gfast/app/common/global"
	comModel "gfast/app/common/model"
	comService "gfast/app/common/service"
	"gfast/app/system/dao"
	"gfast/app/system/model"

	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

type sysDictType struct {
}

var SysDictType = new(sysDictType)

func (s *sysDictType) SelectList(req *model.ListSysDictTypeReq) (total, page int,
	list []*model.SysDictTypeInfoRes, err error) {
	d := dao.SysDictType.Ctx(req.Ctx)
	if req.DictName != "" {
		d = d.Where(dao.SysDictType.Columns.DictName+" like ?", "%"+req.DictName+"%")
	}
	if req.DictType != "" {
		d = d.Where(dao.SysDictType.Columns.DictType+" like ?", "%"+req.DictType+"%")
	}
	if req.Status != "" {
		d = d.Where(dao.SysDictType.Columns.Status+" = ", gconv.Int(req.Status))
	}
	if req.BeginTime != "" {
		d = d.Where(dao.SysDictType.Columns.CreatedAt+" >=?", req.BeginTime)
	}
	if req.EndTime != "" {
		d = d.Where(dao.SysDictType.Columns.CreatedAt+" <=?", req.EndTime)
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
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = comModel.PageSize
	}
	err = d.Fields(model.SysDictTypeInfoRes{}).Page(page, req.PageSize).
		Order(dao.SysDictType.Columns.DictId + " asc").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	return
}

// ExistsDictType 检查类型是否已经存在
func (s *sysDictType) ExistsDictType(dictType string, dictId ...int64) bool {
	d := dao.SysDictType.Fields(dao.SysDictType.Columns.DictId).
		Where(dao.SysDictType.Columns.DictType, dictType)
	if len(dictId) > 0 {
		d = d.And(dao.SysDictType.Columns.DictId+" !=? ", dictId)
	}
	dict, err := d.FindOne()
	if err != nil {
		g.Log().Error(err)
		return false
	}
	if dict != nil {
		return true
	}
	return false
}

func (s *sysDictType) Add(req *model.SysDictTypeAddReq) error {
	_, err := dao.SysDictType.Insert(req)
	if err != nil {
		g.Log().Debug(err)
		err = gerror.New("保存到数据库失败")
	}
	return err
}

func (s *sysDictType) Edit(ctx context.Context, req *model.SysDictTypeEditReq) error {
	err := g.DB().Transaction(ctx, func(ctx context.Context, tx *gdb.TX) error {
		dt, err := dao.SysDictType.Fields(dao.SysDictType.Columns.DictType).FindOne(req.DictId)
		if err != nil {
			return err
		}
		//修改字典类型
		_, err = dao.SysDictType.TX(tx).FieldsEx(dao.SysDictType.Columns.CreateBy,
			dao.SysDictType.Columns.DictId).WherePri(req.DictId).Update(req)
		if err != nil {
			return err
		}
		//修改字段数据的类型
		_, err = dao.SysDictData.TX(tx).Data(g.Map{dao.SysDictData.Columns.DictType: req.DictType}).
			Where(dao.SysDictData.Columns.DictType, dt.DictType).Update()
		return err
	})
	if err != nil {
		g.Log().Debug(err)
		err = gerror.New("保存到数据库失败")
	}
	return err
}

func (s *sysDictType) Delete(ctx context.Context, dictIds []int) (err error) {
	discs := ([]*model.SysDictType)(nil)
	discs, err = dao.SysDictType.Fields(dao.SysDictType.Columns.DictType).
		Where(dao.SysDictType.Columns.DictId+" in (?) ", dictIds).All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("没有要删除的数据")
		return
	}
	types := garray.NewStrArray()
	for _, dt := range discs {
		types.Append(dt.DictType)
	}
	if types.Len() > 0 {
		err = g.DB().Transaction(ctx, func(ctx context.Context, tx *gdb.TX) error {
			_, err = dao.SysDictType.TX(tx).Delete(dao.SysDictType.Columns.DictId+" in (?) ", dictIds)
			if err != nil {
				g.Log().Error(err)
				err = gerror.New("删除类型失败")
				return err
			}
			_, err = dao.SysDictData.TX(tx).Delete(dao.SysDictData.Columns.DictType+" in (?) ", types.Slice())
			if err != nil {
				g.Log().Error(err)
				err = gerror.New("删除字典数据失败")
				return err
			}
			return nil
		})
	}
	return
}

// GetDictById 获取字典类型
func (s *sysDictType) GetDictById(id int) (dict *model.SysDictType, err error) {
	dict, err = dao.SysDictType.FindOne(dao.SysDictType.Columns.DictId, id)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取字典类型失败")
		return
	}
	if dict == nil {
		err = gerror.New("不存在的字典类型")
	}
	return
}

// GetAllDictType 获取所有正常状态下的字典类型
func (s *sysDictType) GetAllDictType() (list []*model.SysDictType, err error) {
	cache := comService.Cache.New()
	//从缓存获取
	data := cache.Get(global.SysDict + "_dict_type_all")
	if data != nil {
		err = gconv.Structs(data, &list)
		return
	}
	err = dao.SysDictType.Where("status", 1).Order("dict_id ASC").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取字典类型数据出错")
		return
	}
	//缓存
	cache.Set(global.SysDict+"_dict_type_all", list, 0, global.SysDictTag)
	return
}
