package admin

import (
	"gfast/app/service/admin/upload_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type Upload struct{}

//单图片上传
func (c *Upload) UpImg(r *ghttp.Request) {
	upFile := r.GetUploadFile("file")
	info, err := upload_service.UpImg(upFile)
	if err != nil {
		response.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfo": info,
	}
	response.SusJson(true, r, "上传成功", res)
}

//批量上传图片
func (c *Upload) UpImgs(r *ghttp.Request) {
	upFiles := r.GetUploadFiles("file")
	infos, err := upload_service.UpImgs(upFiles)
	if err != nil {
		response.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfos": infos,
	}
	response.SusJson(true, r, "上传成功", res)
}

//单文件上传
func (c *Upload) UpFile(r *ghttp.Request) {
	upFile := r.GetUploadFile("file")
	info, err := upload_service.UpFile(upFile)
	if err != nil {
		response.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfo": info,
	}
	response.SusJson(true, r, "上传成功", res)
}

//批量上传文件
func (c *Upload) UpFiles(r *ghttp.Request) {
	upFiles := r.GetUploadFiles("file")
	infos, err := upload_service.UpFiles(upFiles)
	if err != nil {
		response.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfos": infos,
	}
	response.SusJson(true, r, "上传成功", res)
}
