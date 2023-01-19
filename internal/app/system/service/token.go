/*
* @desc:token功能
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/8 15:54
 */

package service

import (
	"context"

	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/tiger1103/gfast-token/gftoken"
)

type IGfToken interface {
	GenerateToken(ctx context.Context, key string, data interface{}) (keys string, err error)
	Middleware(group *ghttp.RouterGroup) error
	ParseToken(r *ghttp.Request) (*gftoken.CustomClaims, error)
	IsLogin(r *ghttp.Request) (b bool, failed *gftoken.AuthFailed)
	GetRequestToken(r *ghttp.Request) (token string)
	RemoveToken(ctx context.Context, token string) (err error)
	GetTokenData(ctx context.Context, token string) (tData *gftoken.TokenData, key string, err error)
}

var gt IGfToken

func RegisterGToken(gtk IGfToken) {
	gt = gtk
}

func GfToken() IGfToken {
	if gt == nil {
		panic("implement not found for interface IGfToken, forgot register?")
	}
	return gt
}
