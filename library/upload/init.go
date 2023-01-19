package upload

import (
	"context"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/tiger1103/gfast/v3/api/v1/system"
)

const (
	SourceLocal   UploaderType = iota //  上传到本地
	SourceTencent                     //  上传至腾讯云
	SourceQiniu                       //  上传到七牛云
)

type UploaderType int

type IUpload interface {
	Upload(ctx context.Context, file *ghttp.UploadFile) (result system.UploadResponse, err error)
}

var uploadCollection map[UploaderType]IUpload

// 注册上传接口
func RegisterUploader(key UploaderType, value IUpload) {
	if uploadCollection == nil {
		uploadCollection = make(map[UploaderType]IUpload)
	}
	uploadCollection[key] = value
}

// 获取上传接口
func GetUploader(key UploaderType) IUpload {
	if uploadCollection == nil {
		return nil
	}
	if v, ok := uploadCollection[key]; ok {
		return v
	}
	return nil
}

func init() {

	RegisterUploader(SourceLocal, &Local{})
	RegisterUploader(SourceTencent, &Tencent{})
	RegisterUploader(SourceQiniu, &Qiniou{})
}
