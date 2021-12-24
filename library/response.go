package library

import (
	"fmt"
	"github.com/gogf/gf/encoding/gurl"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gview"
)

const (
	SuccessCode int = 0
	ErrorCode   int = -1
)

type Response struct {
	// 代码
	Code int `json:"code" example:"200"`
	// 数据集
	Data interface{} `json:"data"`
	// 消息
	Msg string `json:"msg"`
}

var response = new(Response)

func JsonExit(r *ghttp.Request, code int, msg string, data ...interface{}) {
	response.JsonExit(r, code, msg, data...)
}

func RJson(r *ghttp.Request, code int, msg string, data ...interface{}) {
	response.RJson(r, code, msg, data...)
}

func SusJson(isExit bool, r *ghttp.Request, msg string, data ...interface{}) {
	response.SusJson(isExit, r, msg, data...)
}

func FailJson(isExit bool, r *ghttp.Request, msg string, data ...interface{}) {
	response.FailJson(isExit, r, msg, data...)
}

func WriteTpl(r *ghttp.Request, tpl string, view *gview.View, params ...gview.Params) error {
	return response.WriteTpl(r, tpl, view, params...)
}

// 返回JSON数据并退出当前HTTP执行函数。
func (res *Response) JsonExit(r *ghttp.Request, code int, msg string, data ...interface{}) {
	res.RJson(r, code, msg, data...)
	r.Exit()
}

// 标准返回结果数据结构封装。
// 返回固定数据结构的JSON:
// code:  状态码(200:成功,302跳转，和http请求状态码一至);
// msg:  请求结果信息;
// data: 请求结果,根据不同接口返回结果的数据结构不同;
func (res *Response) RJson(r *ghttp.Request, code int, msg string, data ...interface{}) {
	responseData := interface{}(nil)
	if len(data) > 0 {
		responseData = data[0]
	}
	response = &Response{
		Code: code,
		Msg:  msg,
		Data: responseData,
	}
	r.SetParam("apiReturnRes", response)
	r.Response.WriteJson(response)
}

//成功返回JSON
func (res *Response) SusJson(isExit bool, r *ghttp.Request, msg string, data ...interface{}) {
	if isExit {
		res.JsonExit(r, SuccessCode, msg, data...)
	}
	res.RJson(r, SuccessCode, msg, data...)
}

//失败返回JSON
func (res *Response) FailJson(isExit bool, r *ghttp.Request, msg string, data ...interface{}) {
	if isExit {
		res.JsonExit(r, ErrorCode, msg, data...)
	}
	res.RJson(r, ErrorCode, msg, data...)
}

//模板输出
func (res *Response) WriteTpl(r *ghttp.Request, tpl string, view *gview.View, params ...gview.Params) error {
	//设置全局变量
	urlInfo, _ := gurl.ParseURL(r.GetUrl(), -1)
	view.Assign("urlInfo", urlInfo)
	r.SetView(view)
	err := r.Response.WriteTpl(tpl, params...)
	if err != nil {
		fmt.Println(err.Error())
		r.Response.WriteExit(err.Error())
	}
	return nil
}

func (res *Response) Redirect(r *ghttp.Request, location string, code ...int) {
	r.Response.RedirectTo(location, code...)
}
