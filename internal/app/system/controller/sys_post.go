/*
* @desc:岗位管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/4/7 23:12
 */

package controller

import (
	"context"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var Post = postController{}

type postController struct {
	BaseController
}

// List 岗位列表
func (c *postController) List(ctx context.Context, req *system.PostSearchReq) (res *system.PostSearchRes, err error) {
	res, err = service.SysPost().List(ctx, req)
	return
}

// Add 添加岗位
func (c *postController) Add(ctx context.Context, req *system.PostAddReq) (res *system.PostAddRes, err error) {
	err = service.SysPost().Add(ctx, req)
	return
}

// Edit 修改岗位
func (c *postController) Edit(ctx context.Context, req *system.PostEditReq) (res *system.PostEditRes, err error) {
	err = service.SysPost().Edit(ctx, req)
	return
}

// Delete 删除岗位
func (c *postController) Delete(ctx context.Context, req *system.PostDeleteReq) (res *system.PostDeleteRes, err error) {
	err = service.SysPost().Delete(ctx, req.Ids)
	return
}
