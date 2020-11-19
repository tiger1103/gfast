package plug_ad

import (
	"gfast/app/model/admin/plug_adtype"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
)

// AddReq 用于存储新增广告请求的请求参数
type AddReq struct {
	AdName     string `p:"adName" v:"required#名称不能为空"` // 广告名称
	AdAdtypeid int    `p:"adAdtypeid"`                 // 所属位置
	AdCheckid  int    `p:"adCheckid"`                  // 1=图片 2=JS
	AdJs       string `p:"adJs"`                       // JS代码
	AdPic      string `p:"adPic"`                      // 广告图片URL
	AdUrl      string `p:"adUrl"`                      // 广告链接
	AdContent  string `p:"adContent"`                  // 广告文字内容
	AdSort     int    `p:"adSort"`                     // 排序
	AdOpen     int    `p:"adOpen"`                     // 1=审核  0=未审核
}

// EditReq 用于存储修改广告请求参数
type EditReq struct {
	PlugAdID int64 `p:"plugAdID" v:"required|min:1#广告id不能为空|广告id参数错误"`
	AddReq
}

// SelectPageReq 用于存储分页查询广告的请求参数
type SelectPageReq struct {
	AdName   string `p:"adName"`   // 广告名称
	PageNo   int64  `p:"pageNum"`  // 当前页
	PageSize int64  `p:"pageSize"` // 每页显示记录数
}

// 用于存储分页查询的数据
type ListEntity struct {
	Entity
	AdTypeName string `orm:"adtype_name"      json:"adtype_name" ` // 广告所属位置
}

// GetPlugAdByID 根据ID查询广告记录
func GetPlugAdByID(id int64) (*Entity, error) {
	entity, err := Model.FindOne("ad_id", id)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据ID查询广告记录出错")
	}
	if entity == nil {
		return nil, gerror.New("根据ID未能查询到广告记录")
	}
	return entity, nil
}

// AddSave 添加广告
func AddSave(req *AddReq) error {
	var entity Entity
	entity.AdName = req.AdName                // 名称
	entity.AdAdtypeid = req.AdAdtypeid        // 位置
	entity.AdCheckid = req.AdCheckid          // 1=图片 2=JS
	entity.AdJs = req.AdJs                    // JS代码
	entity.AdPic = req.AdPic                  // 广告图片URL
	entity.AdUrl = req.AdUrl                  // 广告链接
	entity.AdContent = req.AdContent          // 广告文字内容
	entity.AdAddtime = int(gtime.Timestamp()) // 时间戳
	entity.AdSort = req.AdSort                // 排序
	entity.AdOpen = req.AdOpen                // 1=审核  0=未审核
	// 保存实体
	_, err := entity.Insert()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("添加广告记录入库失败")
	}
	return nil
}

// 批量删除广告记录
func DeleteByIDs(ids []int) error {
	_, err := Model.Delete("ad_id in(?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除广告失败")
	}
	return nil
}

// 根据广告ID来修改广告信息
func EditSave(editReq *EditReq) error {
	// 先根据ID来查询要修改的广告记录
	entity, err := GetPlugAdByID(editReq.PlugAdID)
	if err != nil {
		return err
	}
	// 修改实体
	entity.AdName = editReq.AdName
	entity.AdAdtypeid = editReq.AdAdtypeid
	entity.AdCheckid = editReq.AdCheckid
	entity.AdJs = editReq.AdJs
	entity.AdPic = editReq.AdPic
	entity.AdUrl = editReq.AdUrl
	entity.AdContent = editReq.AdContent
	entity.AdSort = editReq.AdSort
	entity.AdOpen = editReq.AdOpen
	_, err = Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("修改广告失败")
	}
	return nil
}

// 分页查询,返回值total总记录数,page当前页
func SelectListByPage(req *SelectPageReq) (total int, page int64, list []*ListEntity, err error) {
	model := g.DB().Table(Table + " ad")
	if req != nil {
		if req.AdName != "" {
			model.Where("ad.ad_name like ?", "%"+req.AdName+"%")
		}
	}
	model = model.LeftJoin(plug_adtype.Table+" type", "type.adtype_id=ad.ad_adtypeid")
	// 查询广告位总记录数(总行数)
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总记录数失败")
		return 0, 0, nil, err
	}
	if req.PageNo == 0 {
		req.PageNo = 1
	}
	page = req.PageNo
	if req.PageSize == 0 {
		req.PageSize = 10
	}
	// 分页排序查询
	var res gdb.Result
	res, err = model.Fields("ad.*,type.adtype_name").Page(int(page), int(req.PageSize)).Order("ad.ad_sort asc,ad.ad_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询广告失败")
		return 0, 0, nil, err
	}

	err = res.Structs(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询广告失败")
		return 0, 0, nil, err
	}
	return total, page, list, nil
}

// 获取size条状态为status的广告信息,优先按排序序号排序,其次按时间倒序(status 0停用 1正常)
func GetSizeAd(size int, status int, typeId int) ([]*Entity, error) {
	model := Model
	model = model.Where("ad_open = ?", status)
	if typeId != 0 {
		model = model.Where("ad_adtypeid = ?", typeId)
	}
	entity, err := model.Order("ad_sort asc,ad_addtime desc").Limit(size).All()
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("查询广告信息失败")
	}
	return entity, nil
}
