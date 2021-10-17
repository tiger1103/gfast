package service

import (
	comModel "gfast/app/common/model"
	"gfast/app/system/dao"
	"gfast/app/system/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

type sysPost struct{}

var SysPost = new(sysPost)

func (s *sysPost) List(req *dao.SysPostSearchParams) (total, page int, list []*model.SysPost, err error) {
	model := dao.SysPost.M
	if req != nil {
		if req.PostCode != "" {
			model.Where("post_code like ?", "%"+req.PostCode+"%")
		}

		if req.PostName != "" {
			model.Where("post_name like ?", "%"+req.PostName+"%")
		}

		if req.Status != "" {
			model.Where("status", req.Status)
		}
	}

	total, err = model.Count()

	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
	}

	if req.PageNum == 0 {
		req.PageNum = 1
	}

	page = req.PageNum

	if req.PageSize == 0 {
		req.PageSize = comModel.PageSize
	}
	err = model.Page(page, req.PageSize).Order("post_sort asc,post_id asc").Scan(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取数据失败")
	}
	return
}

func (s *sysPost) Add(params *dao.SysPostAddParams) error {
	_, err := dao.SysPost.Insert(params)
	return err
}

func (s *sysPost) GetOneById(id int64) (post *model.SysPost, err error) {
	err = dao.SysPost.WherePri(id).Scan(&post)
	return
}

func (s *sysPost) Edit(params *dao.SysPostEditParams) (err error) {
	_, err = dao.SysPost.FieldsEx(dao.SysPost.C.PostId, dao.SysPost.C.CreatedBy).
		WherePri(params.PostId).Update(params)
	return err
}

func (s *sysPost) Delete(ids []int) error {
	_, err := dao.SysPost.Where(dao.SysPost.C.PostId+" in(?)", ids).Delete()
	return err
}
