/*
* @desc:后台上传
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/7 15:10
 */

package api

import (
	"gfast/app/common/adapter"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/text/gregex"
	"github.com/gogf/gf/text/gstr"
	"net/url"
)

type upload struct {
	SystemBase
}

var Upload = new(upload)

// UpImg 单图上传
func (c *upload) UpImg(r *ghttp.Request) {
	upFile := r.GetUploadFile("file")
	info, err := adapter.Upload.UpImg(upFile)
	if err != nil {
		c.FailJsonExit(r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfo": info,
	}
	c.SusJsonExit(r, res)
}

// CkEditorUp
// @Summary CkEditor编辑器上传附件
// @Description CkEditor编辑器上传附件
// @Tags 公共
// @Param upFile body string  true "upFile"
// @Success 0 {object} library.Response "{"code": 200, "data": [...]}"
// @Router /system/upload/ckEditorUp [post]
// @Security
func (c *upload) CkEditorUp(r *ghttp.Request) {
	upFile := r.GetUploadFile("upload")
	fType := gstr.ToLower(r.GetString("type"))
	var info *adapter.FileInfo
	var err error
	if fType == "images" {
		info, err = adapter.Upload.UpImg(upFile)
	} else if fType == "files" {
		info, err = adapter.Upload.UpFile(upFile)
	}
	if err != nil {
		r.Response.WriteJson(g.Map{"error": g.Map{"message": "上传失败，" + err.Error(), "number": 105}})
	} else {
		parseInfo, _ := url.Parse(r.GetUrl())
		var fileUrl = info.FileUrl
		if !gregex.IsMatchString("^http", info.FileUrl) {
			fileUrl = parseInfo.Scheme + "://" + parseInfo.Host + "/" + info.FileUrl
		}
		r.Response.WriteJson(g.Map{"fileName": info.FileName, "uploaded": 1, "url": fileUrl})
	}
}

// UpImgs
// @Summary 批量上传图片
// @Description 批量上传图片
// @Tags 公共
// @Param file body string  true "file"
// @Success 0 {object} library.Response "{"code": 200, "data": [...]}"
// @Router /system/upload/upImgs [post]
// @Security
func (c *upload) UpImgs(r *ghttp.Request) {
	upFiles := r.GetUploadFiles("file")
	infos, err := adapter.Upload.UpImgs(upFiles)
	if err != nil {
		c.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfos": infos,
	}
	c.SusJson(true, r, "上传成功", res)
}

// UpFile
// @Summary 单文件上传
// @Description 单文件上传
// @Tags 公共
// @Param file body string  true "file"
// @Success 0 {object} library.Response "{"code": 200, "data": [...]}"
// @Router /system/upload/upFile [post]
// @Security
func (c *upload) UpFile(r *ghttp.Request) {
	upFile := r.GetUploadFile("file")
	info, err := adapter.Upload.UpFile(upFile)
	if err != nil {
		c.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfo": info,
	}
	c.SusJson(true, r, "上传成功", res)
}

// UpFiles
// @Summary 批量上传文件
// @Description 批量上传文件
// @Tags 公共
// @Param file body string  true "file"
// @Success 0 {object} library.Response "{"code": 200, "data": [...]}"
// @Router /system/upload/upFiles [post]
// @Security
func (c *upload) UpFiles(r *ghttp.Request) {
	upFiles := r.GetUploadFiles("file")
	infos, err := adapter.Upload.UpFiles(upFiles)
	if err != nil {
		c.FailJson(true, r, "上传失败，"+err.Error())
	}
	res := g.Map{
		"fileInfos": infos,
	}
	c.SusJson(true, r, "上传成功", res)
}
