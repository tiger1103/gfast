/*
* @desc:验证码参数
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 17:47
 */

package common

import "github.com/gogf/gf/v2/frame/g"

type CaptchaReq struct {
	g.Meta `path:"/get" tags:"get captcha" method:"get" summary:"获取验证码"`
}
type CaptchaRes struct {
	g.Meta `mime:"application/json" example:"string"`
	Key    string `json:"key"`
	Img    string `json:"img"`
}
