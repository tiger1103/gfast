package response

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

const (
	SuccessCode int = 0
	ErrorCode   int = -1
)

// 返回JSON数据并退出当前HTTP执行函数。
func JsonExit(r *ghttp.Request, code int, msg string, data ...interface{}) {
	RJson(r, code, msg, data...)
	r.Exit()
}

// 标准返回结果数据结构封装。
// 返回固定数据结构的JSON:
// code:  状态码(200:成功,302跳转，和http请求状态码一至);
// msg:  请求结果信息;
// data: 请求结果,根据不同接口返回结果的数据结构不同;
func RJson(r *ghttp.Request, code int, msg string, data ...interface{}) {
	responseData := interface{}(nil)
	responseData = data
	r.Response.WriteJson(g.Map{
		"code": code,
		"msg":  msg,
		"data": responseData,
	})
}

//成功返回JSON
func SusJson(isExit bool, r *ghttp.Request, msg string, data ...interface{}) {
	if isExit {
		JsonExit(r, SuccessCode, msg, data...)
	}
	RJson(r, SuccessCode, msg, data...)
}

//失败返回JSON
func FailJson(isExit bool, r *ghttp.Request, msg string, data ...interface{}) {
	if isExit {
		JsonExit(r, ErrorCode, msg, data...)
	}
	RJson(r, ErrorCode, msg, data...)
}
