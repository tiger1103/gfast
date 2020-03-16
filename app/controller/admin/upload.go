package admin

import (
	"gfast/app/service/admin/upload_service"
	"gfast/library/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type Upload struct{}

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
