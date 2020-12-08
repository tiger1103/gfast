package blog_classification

import (
	"gfast/app/service/cache_service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// AddReq 用于存储新增记录请求参数
type AddReq struct {
	ClassificationName     string `p:"classificationName" v:"required#名称不能为空"`     // 名称
	ClassificationSort     uint   `p:"classificationSort" v:"required#排序不能为空"`     // 排序
	ClassificationDescribe string `p:"classificationDescribe"`                     // 分类描述
	ClassificationPid      uint   `p:"classificationPid"`                          // 父id
	ClassificationType     uint   `p:"classificationType"`                         // 分类类型1.频道页/2.发布栏目/3.跳转栏目/4.单页栏目
	ClassificationStatus   uint   `p:"classificationStatus" v:"required#分类状态不能为空"` // 状态
	ClassificationAddress  string `p:"classificationAddress"`
	ClassificationContent  string `p:"classificationContent"`
}

// EditReq 用于存储修改广告位请求参数
type EditReq struct {
	ClassificationId int64 `p:"classificationId" v:"required|min:1#主键ID不能为空|主键ID值错误"`
	AddReq
}

// SelectPageReq 用于存储分页查询的请求参数
type SelectPageReq struct {
	ClassificationName string `p:"classificationName"` // 名称
	PageNum            int64  `p:"pageNum"`            // 当前页
	PageSize           int64  `p:"pageSize"`           // 每页显示记录数
}

// GetClassificationByID 根据ID查询记录
func GetClassificationByID(id int64) (*Entity, error) {
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

// 根据名称和ID来判断是否已存在相同名称的分类
func CheakClassificationNameUnique(classificationName string, classificationId int64) error {
	var (
		entity *Entity
		err    error
	)
	if classificationId == 0 {
		entity, err = Model.FindOne(Columns.ClassificationName, classificationName)
	} else {
		entity, err = Model.Where(Columns.ClassificationName, classificationName).And(Columns.ClassificationId+"!=?", classificationId).FindOne()
	}
	if err != nil {
		g.Log().Error(err)
		return gerror.New("校验名称唯一性失败")
	}
	if entity != nil {
		return gerror.New("名称已经存在!")
	}
	return nil
}

// AddSave 添加
func AddSave(req *AddReq) error {
	var entity Entity
	entity.ClassificationName = req.ClassificationName
	entity.ClassificationSort = req.ClassificationSort
	entity.ClassificationDescribe = req.ClassificationDescribe
	entity.ClassificationPid = req.ClassificationPid
	entity.ClassificationType = req.ClassificationType
	entity.ClassificationStatus = req.ClassificationStatus
	entity.ClassificationAddress = req.ClassificationAddress
	entity.ClassificationContent = req.ClassificationContent
	_, err := Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("添加失败")
	}
	return nil
}

// 批量删除
func DeleteClassificationByIds(ids []int) error {
	_, err := Model.Where("classification_id in(?)", ids).Delete()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除失败")
	}
	return nil
}

// 根据ID修改信息
func EditSave(editReq *EditReq) error {
	// 先根据ID来查询要修改的记录
	entity, err := GetClassificationByID(editReq.ClassificationId)
	if err != nil {
		return err
	}
	// 修改实体
	entity.ClassificationName = editReq.ClassificationName
	entity.ClassificationSort = editReq.ClassificationSort
	entity.ClassificationStatus = editReq.ClassificationStatus
	entity.ClassificationType = editReq.ClassificationType
	entity.ClassificationPid = editReq.ClassificationPid
	entity.ClassificationDescribe = editReq.ClassificationDescribe
	entity.ClassificationAddress = editReq.ClassificationAddress
	entity.ClassificationContent = editReq.ClassificationContent
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
		if req.ClassificationName != "" {
			model = model.Where("classification_name like ?", "%"+req.ClassificationName+"%")
		}
	}
	// 查询总记录数(总行数)
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
	list, err = model.Page(int(page), int(req.PageSize)).Order("classification_sort asc,classification_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询失败")
		return 0, 0, nil, err
	}
	return total, page, list, nil
}

//获取所有菜单列表
func GetList() (list []*Entity, err error) {
	cache := cache_service.New()
	//从缓存获取数据
	iList := cache.Get(cache_service.AdminBlogClassification)
	if iList != nil {
		list = iList.([]*Entity)
		return
	}
	list, err = Model.Order("classification_sort ASC,classification_id ASC").All()
	if err != nil {
		g.Log().Error()
		err = gerror.New("获取菜单数据失败")
		return
	}
	//缓存数据
	cache.Set(cache_service.AdminBlogClassification, list, 0, cache_service.AdminBlogTag)
	return
}

// 查询所有状态为正常的分类
func FindAllList() (list []*Entity, err error) {
	list, err = Model.Where("classification_status = ?", 1).Order("classification_sort asc,classification_id asc").All()
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("查询博客分类列表出错")
	}
	return list, nil
}
