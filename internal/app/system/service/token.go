/*
* @desc:后台token处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/8 17:10
 */

package service

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/app/common/model"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/library/liberr"
	"sync"
)

var (
	options *model.TokenOptions
	gT      commonService.IGfToken
	lock    = &sync.Mutex{}
)

func GfToken(ctx context.Context) commonService.IGfToken {
	if gT == nil {
		lock.Lock()
		defer lock.Unlock()
		if gT == nil {
			err := g.Cfg().MustGet(ctx, "gfToken").Struct(&options)
			liberr.ErrIsNil(ctx, err)
			gT = commonService.GfToken(options)
		}
	}
	return gT
}
