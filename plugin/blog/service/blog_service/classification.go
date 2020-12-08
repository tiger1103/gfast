package blog_service

import (
	"gfast/plugin/blog/model/blog_classification"
)

//获取频道列表
func GetMenuListChannel() (list []*blog_classification.Entity, err error) {
	//获取频道列表
	listAll, err := GetMenuList()
	if err != nil {
		return
	}
	list = make([]*blog_classification.Entity, 0, len(listAll))
	for _, v := range listAll {
		list = append(list, v)
	}
	return
}

//获取所有菜单列表
func GetMenuList() (list []*blog_classification.Entity, err error) {
	return blog_classification.GetList()
}

// 添加
func AddClassificationSave(req *blog_classification.AddReq) (err error) {
	// 判断名称是否已存在
	err = blog_classification.CheakClassificationNameUnique(req.ClassificationName, 0)
	if err != nil {
		return err
	}
	// 不存在则调用AddSave()函数添加
	err = blog_classification.AddSave(req)
	if err != nil {
		return err
	}
	return nil
}

// 批量删除
func DeleteClassificationByIds(ids []int) error {
	return blog_classification.DeleteClassificationByIds(ids)
}

// 修改
func EditClassificationSave(editReq *blog_classification.EditReq) error {
	// 判断修改后的名称的唯一性
	err := blog_classification.CheakClassificationNameUnique(editReq.ClassificationName, editReq.ClassificationId)
	if err != nil {
		return err
	}
	err = blog_classification.EditSave(editReq)
	if err != nil {
		return err
	}
	return nil
}

// 根据ID查询
func GetClassificationByID(id int64) (*blog_classification.Entity, error) {
	return blog_classification.GetClassificationByID(id)
}

// 分页查询
func SelectClassificationListByPage(req *blog_classification.SelectPageReq) (total int, page int64, list []*blog_classification.Entity, err error) {
	return blog_classification.SelectListByPage(req)
}

// 查询所有状态为正常的分类
func FindAllList() (list []*blog_classification.Entity, err error) {
	return blog_classification.FindAllList()
}
