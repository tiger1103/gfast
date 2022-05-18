package common

import "github.com/gogf/gf/v2/frame/g"

// 单图上传
type UploadSingleImgReq struct {
	g.Meta `path:"/singleImg" tags:"上传图片" method:"post" summary:"上传图片"`
}

// 单文件上传
type UploadSingleFileReq struct {
	g.Meta `path:"/singleFile" tags:"上传文件" method:"post" summary:"上传文件"`
}

type UploadSingleRes struct {
	g.Meta `mime:"application/json"`
	UploadResponse
}

// 多图上传
type UploadMultipleImgReq struct {
	g.Meta `path:"/multipleImg" tags:"上传多图片" method:"post" summary:"上传多图片"`
}

// 多文件上传
type UploadMultipleFileReq struct {
	g.Meta `path:"/multipleFile" tags:"上传多文件" method:"post" summary:"上传多文件"`
}

type UploadMultipleRes []*UploadResponse

type UploadResponse struct {
	Size     int64  `json:"size"`
	Path     string `json:"path"`
	FullPath string `json:"full_path"`
	Name     string `json:"name"`
	Type     string `json:"type"`
}
