package controller

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/api/v1/common"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
)

var Upload = new(uploadController)

type uploadController struct{}

// 上传单图
func (c *uploadController) SingleImg(ctx context.Context, req *common.UploadSingleImgReq) (res *common.UploadSingleRes, err error) {
	r := g.RequestFromCtx(ctx)
	file := r.GetUploadFile("file")
	if file == nil {
		err = gerror.New("上传文件必须")
		return
	}
	v, _ := g.Cfg().Get(ctx, "upload.default")
	response, err := service.Upload().UploadFile(ctx, file, consts.CheckFileTypeImg, v.Int())
	if err != nil {
		return
	}
	res = &common.UploadSingleRes{
		UploadResponse: response,
	}
	// 上传第三方
	return
}

// 上传多图
func (c *uploadController) MultipleImg(ctx context.Context, req *common.UploadMultipleImgReq) (res *common.UploadMultipleRes, err error) {
	r := g.RequestFromCtx(ctx)
	files := r.GetUploadFiles("file")
	if len(files) == 0 {
		err = gerror.New("上传文件必须")
		return
	}
	v, _ := g.Cfg().Get(ctx, "upload.default")
	mf, err := service.Upload().UploadFiles(ctx, files, consts.CheckFileTypeImg, v.Int())
	if err != nil {
		return
	}
	res = &mf
	return
}

// 上传单文件
func (c *uploadController) SingleFile(ctx context.Context, req *common.UploadSingleFileReq) (res *common.UploadSingleRes, err error) {
	r := g.RequestFromCtx(ctx)
	file := r.GetUploadFile("file")
	if file == nil {
		err = gerror.New("上传文件必须")
		return
	}
	v, _ := g.Cfg().Get(ctx, "upload.default")
	response, err := service.Upload().UploadFile(ctx, file, consts.CheckFileTypeFile, v.Int())
	if err != nil {
		return
	}
	res = &common.UploadSingleRes{
		UploadResponse: response,
	}
	return
}

// 上传多文件
func (c *uploadController) MultipleFile(ctx context.Context, req *common.UploadMultipleFileReq) (res *common.UploadMultipleRes, err error) {
	r := g.RequestFromCtx(ctx)
	files := r.GetUploadFiles("file")
	if len(files) == 0 {
		err = gerror.New("上传文件必须")
		return
	}
	v, _ := g.Cfg().Get(ctx, "upload.default")
	mf, err := service.Upload().UploadFiles(ctx, files, consts.CheckFileTypeFile, v.Int())
	if err != nil {
		return
	}
	res = &mf
	return
}
