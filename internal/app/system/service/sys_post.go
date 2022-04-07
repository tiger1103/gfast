/*
* @desc:岗位处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/4/7 23:18
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/service/internal/dao"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type IPost interface {
	List(ctx context.Context, req *system.PostSearchReq) (res *system.PostSearchRes, err error)
}

type postImpl struct {
}

var postService = postImpl{}

func Post() IPost {
	return IPost(&postService)
}

// List 岗位列表
func (s *postImpl) List(ctx context.Context, req *system.PostSearchReq) (res *system.PostSearchRes, err error) {
	err = g.Try(func() {
		m := dao.SysPost.Ctx(ctx)
		if req != nil {
			if req.PostCode != "" {
				m = m.Where("post_code like ?", "%"+req.PostCode+"%")
			}
			if req.PostName != "" {
				m = m.Where("post_name like ?", "%"+req.PostName+"%")
			}
			if req.Status != "" {
				m = m.Where("status", gconv.Uint(req.Status))
			}
		}
		res.Total, err = m.Count()
		liberr.ErrIsNil(ctx, err, "获取岗位失败")
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		if req.PageSize == 0 {
			req.PageSize = consts.PageSize
		}
		res = new(system.PostSearchRes)
		err = m.Page(req.PageNum, req.PageSize).Order("post_sort asc,post_id asc").Scan(&res.PostList)
		liberr.ErrIsNil(ctx, err, "获取岗位失败")
	})
	return
}
