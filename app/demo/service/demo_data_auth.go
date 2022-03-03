// ==========================================================================
// GFast自动生成业务逻辑层相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2022-03-03 10:11:15
// 生成路径: gfast/app/demo/service/demo_data_auth.go
// 生成人：gfast
// ==========================================================================

package service

import (
	"context"
	comModel "gfast/app/common/model"
	"gfast/app/demo/dao"
	"gfast/app/demo/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

type demoDataAuth struct {
}

var DemoDataAuth = new(demoDataAuth)

// GetList 获取列表
func (s *demoDataAuth) GetList(req *dao.DemoDataAuthSearchReq, where ...g.Map) (total, page int, list []*dao.DemoDataAuthListRes, err error) {
	m := dao.DemoDataAuth.Ctx(req.Ctx).WithAll().As("demo").
		Unscoped().
		LeftJoin("sys_user user", "demo.created_by=user.id").
		Where("demo.deleted_at is null")
	if req.Id != "" {
		m = m.Where("demo."+dao.DemoDataAuth.Columns.Id+" = ?", gconv.Uint(req.Id))
	}
	if req.Title != "" {
		m = m.Where("demo."+dao.DemoDataAuth.Columns.Title+" = ?", req.Title)
	}
	if req.CreatedBy != "" {
		m = m.Where("demo."+dao.DemoDataAuth.Columns.CreatedBy+" = ?", gconv.Uint(req.CreatedBy))
	}
	if req.BeginTime != "" {
		m = m.Where("demo."+dao.DemoDataAuth.Columns.CreatedAt+" >=", req.BeginTime)
	}
	if req.EndTime != "" {
		m = m.Where("demo."+dao.DemoDataAuth.Columns.CreatedAt+" <", req.EndTime)
	}
	if len(where) > 0 {
		m = m.Where(where[0])
	}
	total, err = m.Count()
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
	order := "demo.id asc"
	if req.OrderBy != "" {
		order = req.OrderBy
	}
	var res []*model.DemoDataAuth
	err = m.Fields("demo.*").Page(page, req.PageSize).Order(order).Scan(&res)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	list = make([]*dao.DemoDataAuthListRes, len(res))
	for k, v := range res {
		list[k] = &dao.DemoDataAuthListRes{
			Id:        v.Id,
			Title:     v.Title,
			CreatedBy: v.CreatedBy,
			CreatedAt: v.CreatedAt,
		}
	}
	return
}

// GetInfoById 通过id获取
func (s *demoDataAuth) GetInfoById(ctx context.Context, id uint) (info *dao.DemoDataAuthInfoRes, err error) {
	if id == 0 {
		err = gerror.New("参数错误")
		return
	}
	var data *model.DemoDataAuth
	err = dao.DemoDataAuth.Ctx(ctx).WithAll().Where(dao.DemoDataAuth.Columns.Id, id).Scan(&data)
	if err != nil {
		g.Log().Error(err)
	}
	if data == nil || err != nil {
		err = gerror.New("获取信息失败")
		return
	}
	info = &dao.DemoDataAuthInfoRes{
		Id:        data.Id,
		Title:     data.Title,
		CreatedBy: data.CreatedBy,
		UpdatedBy: data.UpdatedBy,
		CreatedAt: data.CreatedAt,
		UpdatedAt: data.UpdatedAt,
		DeletedAt: data.DeletedAt,
	}
	return
}

// Add 添加
func (s *demoDataAuth) Add(ctx context.Context, req *dao.DemoDataAuthAddReq) (err error) {
	_, err = dao.DemoDataAuth.Ctx(ctx).Insert(req)
	return
}

// Edit 修改
func (s *demoDataAuth) Edit(ctx context.Context, req *dao.DemoDataAuthEditReq) error {
	_, err := dao.DemoDataAuth.Ctx(ctx).FieldsEx(dao.DemoDataAuth.Columns.Id, dao.DemoDataAuth.Columns.CreatedAt).Where(dao.DemoDataAuth.Columns.Id, req.Id).
		Update(req)
	return err
}

// DeleteByIds 删除
func (s *demoDataAuth) DeleteByIds(ctx context.Context, ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}
	_, err = dao.DemoDataAuth.Ctx(ctx).Delete(dao.DemoDataAuth.Columns.Id+" in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}
