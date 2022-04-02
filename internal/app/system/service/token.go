/*
* @desc:后台token处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/8 17:10
 */

package service

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/tiger1103/gfast/v3/internal/app/common/model"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/library/liberr"
	"sync"
)

type gft struct {
	options *model.TokenOptions
	gT      commonService.IGfToken
	lock    *sync.Mutex
}

var gftService = &gft{
	options: nil,
	gT:      nil,
	lock:    &sync.Mutex{},
}

func GfToken() commonService.IGfToken {
	if gftService.gT == nil {
		gftService.lock.Lock()
		defer gftService.lock.Unlock()
		if gftService.gT == nil {
			ctx := gctx.New()
			err := g.Cfg().MustGet(ctx, "gfToken").Struct(&gftService.options)
			liberr.ErrIsNil(ctx, err)
			gftService.gT = commonService.GfToken(gftService.options)
		}
	}
	return gftService.gT
}
