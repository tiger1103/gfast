/*
* @desc:上传适配器
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/7 8:54
 */

package adapter

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

// FileInfo 上传的文件信息
type FileInfo struct {
	FileName string `json:"fileName"`
	FileSize int64  `json:"fileSize"`
	FileUrl  string `json:"fileUrl"`
	FileType string `json:"fileType"`
}

type UploadAdapter interface {
	UpImg(file *ghttp.UploadFile) (fileInfo *FileInfo, err error)
	UpFile(file *ghttp.UploadFile) (fileInfo *FileInfo, err error)
	UpImgs(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error)
	UpFiles(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error)
}

type upload struct {
	adapter UploadAdapter
}

var (
	upType = g.Cfg().GetString("upload.type")
	Upload *upload
)

func (u upload) UpImg(file *ghttp.UploadFile) (fileInfo *FileInfo, err error) {
	return u.adapter.UpImg(file)
}

func (u upload) UpFile(file *ghttp.UploadFile) (fileInfo *FileInfo, err error) {
	return u.adapter.UpFile(file)
}

func (u upload) UpImgs(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error) {
	return u.adapter.UpImgs(files)
}

func (u upload) UpFiles(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error) {
	return u.adapter.UpFiles(files)
}
