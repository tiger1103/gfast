package admin

import (
	"gfast/app/service/admin/upload_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gstr"
	"net/url"
)

type Upload struct{}

//CkEditor编辑器上传附件
func (c *Upload) CkEditorUp(r *ghttp.Request) {
	upFile := r.GetUploadFile("upload")
	fType := gstr.ToLower(r.GetString("type"))
	var info *upload_service.FileInfo
	var err error
	if fType == "images" {
		info, err = upload_service.UpImg(upFile)
	} else if fType == "files" {
		info, err = upload_service.UpFile(upFile)
	}
	if err != nil {
		r.Response.WriteJson(g.Map{"error": g.Map{"message": "上传失败，" + err.Error(), "number": 105}})
	} else {
		parseInfo, _ := url.Parse(r.GetUrl())
		r.Response.WriteJson(g.Map{"fileName": info.FileName, "uploaded": 1, "url": parseInfo.Scheme + "://" + parseInfo.Host + "/" + info.FileUrl})
	}
}

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
