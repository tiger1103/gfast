// ==========================================================================
// 生成日期：2020-09-17 10:13:16
// 生成人：gfast
// ==========================================================================
package wf_news

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

// AddReq 用于存储新增请求的请求参数
type AddReq struct {
	Title string `p:"title" `
	Uid   uint64
}

// EditReq 用于存储修改请求参数
type EditReq struct {
	Id    int64  `p:"id" v:"required#主键ID不能为空"`
	Title string `p:"title" `
}
type RemoveReq struct {
	Ids []int `p:"ids"` //删除id
}

// SelectPageReq 用于存储分页查询的请求参数
type SelectPageReq struct {
	Title     string `p:"title"`     //标题
	Status    string `p:"status"`    //-1回退修改0 保存中1流程中 2通过
	BeginTime string `p:"beginTime"` //开始时间
	EndTime   string `p:"endTime"`   //结束时间
	PageNum   int64  `p:"pageNum"`   //当前页码
	PageSize  int    `p:"pageSize"`  //每页数
}

//待操作按钮的信息
type InfoBtn struct {
	*Entity
	ActionBtn g.MapStrAny `json:"action_btn"`
}

// GetByID 根据ID查询记录
func GetByID(id int64) (*Entity, error) {
	entity, err := Model.FindOne(id)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据ID查询记录出错")
	}
	if entity == nil {
		return nil, gerror.New("根据ID未能查询到记录")
	}
	return entity, nil
}

// AddSave 添加
func AddSave(req *AddReq) error {
	entity := new(Entity)
	entity.Title = req.Title
	entity.Uid = req.Uid
	result, err := entity.Insert()
	if err != nil {
		return err
	}
	_, err = result.LastInsertId()
	if err != nil {
		return err
	}
	return nil
}

// 删除
func DeleteByIds(Ids []int, tx *gdb.TX) error {
	_, err := Model.TX(tx).Delete("id in(?)", Ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}

// 根据ID来修改信息
func EditSave(req *EditReq) error {
	// 先根据ID来查询要修改的记录
	entity, err := GetByID(req.Id)
	if err != nil {
		return err
	}
	// 修改实体
	entity.Title = req.Title
	entity.UpTime = gconv.Uint64(gtime.Timestamp())
	_, err = Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("修改失败")
	}
	return nil
}

// 分页查询,返回值total总记录数,page当前页
func SelectListByPage(req *SelectPageReq) (total int, page int64, list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.Title != "" {
			model = model.Where("title like ?", "%"+req.Title+"%")
		}
		if req.Status != "" {
			model = model.Where("status", gconv.Int(req.Status))
		}
	}
	// 查询总记录数(总行数)
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总记录数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = 10
	}
	// 分页排序查询
	list, err = model.Page(int(page), int(req.PageSize)).Order("id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询失败")
		return
	}
	return
}

// 获取所有数据
func SelectListAll(req *SelectPageReq) (list []*Entity, err error) {
	model := Model
	if req != nil {
		if req.Title != "" {
			model.Where("title like ?", "%"+req.Title+"%")
		}
	}
	// 查询
	list, err = model.Order("id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("查询失败")
		return
	}
	return
}
