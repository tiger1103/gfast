package api

import (
	"gfast/app/common/service"
	"gfast/library"
	// "github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type captcha struct{}

var Captcha = new(captcha)

type Res struct {
	IdKeyC        string	`json:"idKeyC"`     //图片的key
	Base64stringC string 	`json:"base64stringC"`  //动态验证码图片 base64   
}

// Img
// @Summary 获取验证码图片信息
// @Description 获取验证码图片信息
// @Tags 公共
// @Success 0 {object} library.Response{data=Res} "{"code": 200, "data": {idKeyC:" ",base64stringC:"" }}"
// @Router /captcha/get [get]
// @Security
func (c *captcha) Img(r *ghttp.Request) {
	idKeyC, base64stringC := service.Captcha.GetVerifyImgString()
	re := Res{
		idKeyC,
		base64stringC,
	}
	library.SusJson(true, r, "ok", re)
}
