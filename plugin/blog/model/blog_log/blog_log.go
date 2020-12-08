package blog_log

import (
	"gfast/plugin/blog/model/blog_classification"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
)

// AddReq 用于存储新增请求的请求参数
type AddReq struct {
	LogType      int    `p:"logType" v:"required#名称不能为空"`    // 所属分类
	LogSign      int    `p:"logSign"`                        // 0.一般 1.置顶，2.幻灯，3.推荐
	LogTitle     string `p:"logTitle" v:"required#标题不能为空"`   // 日志标题
	LogAuthor    string `p:"logAuthor"`                      // 作者名
	LogUrl       string `p:"logUrl"`                         // 跳转地址
	LogThumbnail string `p:"logThumbnail"`                   // 缩略图
	LogStatus    uint   `p:"logStatus"`                      // 状态：1发布,0未发布
	LogSort      int    `P:"logSort"`                        // 排序
	LogContent   string `p:"logContent" v:"required#内容不能为空"` // 内容
}

// EditReq 用于存储修改请求参数
type EditReq struct {
	LogId int64 `p:"logId" v:"required|min:1#日志ID不能为空|日志ID错误"`
	AddReq
}

// SelectPageReq 用于存储分页查询的请求参数
type SelectPageReq struct {
	LogTitle   string `p:"logTitle"` // 日志标题
	PageNum    int64  `p:"pageNum"`  // 当前页
	PageSize   int64  `p:"pageSize"` // 每页显示记录数
	CateTypeId int    `p:"cateId"`   // 分类类型id
	Status     int    // 状态
}

// 用于存储联合查询的数据
type ListEntity struct {
	Entity
	ClassificationName string `orm:"classification_name"      json:"classification_name" ` // 所属分类名
}

// GetLogByID 根据ID查询记录
func GetLogByID(id int64) (entity *ListEntity, err error) {
	entity = new(ListEntity)
	model := g.DB().Table(Table + " log")
	model = model.Where("log_id = ?", id)
	model = model.LeftJoin(blog_classification.Table+" cf", "cf.classification_id = log.log_type")
	var res gdb.Record
	res, err = model.Fields("log.*,cf.classification_name").FindOne()
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据ID查询记录出错!")
	}
	err = res.Struct(entity)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据ID查询转换时出错")
	}
	if entity == nil {
		return nil, gerror.New("根据ID未能查询到记录")
	}
	return entity, nil
}

// AddSave 添加的方法
func AddSave(req *AddReq) error {
	var entity Entity
	entity.LogType = req.LogType
	entity.LogSign = req.LogSign
	entity.LogTitle = req.LogTitle
	entity.LogAuthor = req.LogAuthor
	entity.LogUrl = req.LogUrl
	entity.LogThumbnail = req.LogThumbnail
	entity.CreatTime = uint(gtime.Timestamp())
	entity.LogStatus = req.LogStatus
	entity.LogSort = req.LogSort
	entity.LogContent = req.LogContent
	// 保存实体
	_, err := entity.Insert()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("添加记录入库失败!")
	}
	return nil
}

// 批量删除记录
func DeleteByIDs(ids []int) error {
	_, err := Model.Delete("log_id in(?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除记录失败!")
	}
	return nil
}

// 根据ID修改记录
func EditSave(req *EditReq) error {
	// 先根据ID来查询要修改的记录
	entity, err := GetLogByID(req.LogId)
	if err != nil {
		return err
	}
	// 修改实体
	entity.LogType = req.LogType
	entity.LogSign = req.LogSign
	entity.LogTitle = req.LogTitle
	entity.LogAuthor = req.LogAuthor
	entity.LogUrl = req.LogUrl
	entity.LogThumbnail = req.LogThumbnail
	entity.LogStatus = req.LogStatus
	entity.LogSort = req.LogSort
	entity.LogContent = req.LogContent
	_, err = Model.Filter().Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("修改记录失败!")
	}
	return nil
}

// 分页查询,返回值total总记录数,page当前页
func SelectListByPage(req *SelectPageReq) (total int, page int64, list []*ListEntity, err error) {
	model := g.DB().Table(Table + " log")
	if req != nil {
		if req.LogTitle != "" {
			model.Where("log.log_title like ?", "%"+req.LogTitle+"%")
		}
		if req.Status == 1 {
			model.Where("log.log_status = 1")
		}
		if req.CateTypeId != 0 {
			model.Where("log_type = ?", req.CateTypeId)
		}
	}
	model = model.LeftJoin(blog_classification.Table+" cf", "cf.classification_id=log.log_type")
	// 查询广告位总记录数(总行数)
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总记录数失败")
		return 0, 0, nil, err
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = 10
	}
	// 分页排序查询
	var res gdb.Result
	res, err = model.Fields("log.*,cf.classification_name").
		Page(int(page), int(req.PageSize)).Order("log.log_sort asc,log.log_id desc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询失败")
		return 0, 0, nil, err
	}
	err = res.Structs(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询失败")
		return 0, 0, nil, err
	}
	return total, page, list, nil
}

// 按时间倒序查询size篇标志为sign分类id为typeId,状态为status的文章,标志值0.一般,1.置顶,2.幻灯,3.推荐,typeId等于0时不区分分类
func FindSizeArticleBySign(size int, status int, sign int, typeId int) (list []*ListEntity, err error) {
	model := g.DB().Table(Table + " log")
	if status == 1 {
		model = model.Where("log.log_status = ?", 1)
	}
	if status == 0 {
		model = model.Where("log.log_status = ?", 0)
	}
	if sign == 0 {
		model = model.Where("log.log_sign = 0")
	}
	if sign == 1 {
		model = model.Where("log.log_sign = 1")
	}
	if sign == 2 {
		model = model.Where("log.log_sign = 2")
	}
	if sign == 3 {
		model = model.Where("log.log_sign = 3")
	}
	if typeId != 0 {
		model = model.Where("log_type = ?", typeId)
	}
	model = model.LeftJoin(blog_classification.Table+" cf", "cf.classification_id=log.log_type")
	// 分页排序查询
	var res gdb.Result
	res, err = model.Fields("log.*,cf.classification_name").
		Order("log.log_sort asc,log.creat_time desc").Limit(size).All()
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据标志查询出错")
	}
	err = res.Structs(&list)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据标志查询出错")
	}
	return
}

// 按时间倒序查询size篇分类id为typeId,状态为status的文章,typeId等于0时不区分分类
func FindSizeArticle(size int, status int, typeId int) (list []*ListEntity, err error) {
	model := g.DB().Table(Table + " log")
	if status == 1 {
		model = model.Where("log.log_status = ?", 1)
	}
	if status == 0 {
		model = model.Where("log.log_status = ?", 0)
	}
	if typeId != 0 {
		model = model.Where("log_type = ?", typeId)
	}
	model = model.LeftJoin(blog_classification.Table+" cf", "cf.classification_id=log.log_type")
	// 分页排序查询
	var res gdb.Result
	res, err = model.Fields("log.*,cf.classification_name").Order("log.log_sort asc,log.creat_time desc").Limit(size).All()
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据标志查询出错")
	}
	err = res.Structs(&list)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据标志查询出错")
	}
	return
}

// 查询size篇文章并根据点击数排序
func FindArticleByHits(size int, status int) (list []*Entity, err error) {
	model := Model
	if status == 1 {
		model.Where("log_status = 1")
	}
	list, err = model.Order("log_hits desc").FindAll()
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据点击数排序查询失败")
	}
	return
}
