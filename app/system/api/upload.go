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
