package plugins

type ICommonSmsWyyx interface {
	SendSMSTemplate(params IWyyxReq) (string, error)
}

// 网易云信
var CommonSmsWyyx ICommonSmsWyyx

// 入参
type IWyyxReq struct {
	Mobiles []string `v:"required#电话号码不能为空"`
	Params  []string `v:"required#短信参数不能为空"`
}
