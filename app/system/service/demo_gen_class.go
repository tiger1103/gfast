// ==========================================================================
// GFast自动生成业务逻辑层相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2021-09-19 09:44:19
// 生成路径: gfast/app/system/service/demo_gen_class.go
// 生成人：gfast
// ==========================================================================


package service
import (
    "context"
	comModel "gfast/app/common/model"
	"gfast/app/system/dao"
	"gfast/app/system/model"	
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)
type demoGenClass struct {
}
var DemoGenClass = new(demoGenClass)
// GetList 获取任务列表
func (s *demoGenClass) GetList(req *dao.DemoGenClassSearchReq) (total, page int, list []*model.DemoGenClass, err error) {
	m := dao.DemoGenClass.Ctx(req.Ctx)    
        if req.ClassName != "" {
            m = m.Where(dao.DemoGenClass.Columns.ClassName+" like ?", "%"+req.ClassName+"%")
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
    order:= "id asc"
    if req.OrderBy!=""{
        order = req.OrderBy
    }
    err = m.Page(page, req.PageSize).Order(order).Scan(&list)    
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	return
}
// GetInfoById 通过id获取
func (s *demoGenClass) GetInfoById(ctx context.Context,id int64) (info *model.DemoGenClass, err error) {
	if id == 0 {
		err = gerror.New("参数错误")
		return
	}
	err = dao.DemoGenClass.Ctx(ctx).Where(dao.DemoGenClass.Columns.Id, id).Scan(&info)
	if err != nil {
		g.Log().Error(err)
	}
	if info == nil || err != nil {
		err = gerror.New("获取信息失败")
	}
	return
}
// Add 添加
func (s *demoGenClass) Add(ctx context.Context,req *dao.DemoGenClassAddReq) (err error) {
	_, err = dao.DemoGenClass.Ctx(ctx).Insert(req)
	return
}
// Edit 修改
func (s *demoGenClass) Edit(ctx context.Context,req *dao.DemoGenClassEditReq) error {    
	_, err := dao.DemoGenClass.Ctx(ctx).FieldsEx(dao.DemoGenClass.Columns.Id).Where(dao.DemoGenClass.Columns.Id, req.Id).
		Update(req)
	return err
}
// DeleteByIds 删除
func (s *demoGenClass) DeleteByIds(ctx context.Context,ids []int) (err error) {
	if len(ids) == 0 {
		err = gerror.New("参数错误")
		return
	}	
	_, err = dao.DemoGenClass.Ctx(ctx).Delete(dao.DemoGenClass.Columns.Id+" in (?)", ids)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除失败")
	}
	return
}
