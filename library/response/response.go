package response

import (
	"gfast/library/utils"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gview"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
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

var response *Response

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
	//绑定模板中需要用到的方法
	view.BindFuncMap(g.Map{
		// 根据长度i来切割字符串
		"subStr": func(str interface{}, i int) (s string) {
			s1 := gconv.String(str)
			if gstr.LenRune(s1) > i {
				s = gstr.SubStrRune(s1, 0, i) + "..."
				return s
			}
			return s1
		},
		// 格式化时间戳 年月日
		"timeFormatYear": func(time interface{}) string {
			return utils.TimeStampToDate(gconv.Int64(time))
		},
		// 格式化时间戳 年月日时分秒
		"timeFormatDateTime": func(time interface{}) string {
			return utils.TimeStampToDateTime(gconv.Int64(time))
		},
		// 判断是否有子菜单
		"isSon": func(id, menus interface{}) bool {
			i := gconv.Int(id)
			m := gconv.SliceMap(menus)
			for _, v := range m {
				if gconv.Int(v["classification_pid"]) == i {
					return true
				}
			}
			return false
		},
		"add": func(a, b interface{}) int {
			return gconv.Int(a) + gconv.Int(b)
		},
	})
	//设置全局变量
	domain, _ := utils.GetDomain(r)
	view.Assigns(g.Map{
		"domain": domain,
	})
	return r.Response.WriteTpl(tpl, params...)
}

func (res *Response) Redirect(r *ghttp.Request, location string, code ...int) {
	r.Response.RedirectTo(location, code...)
}
