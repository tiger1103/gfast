package upload

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/grand"
	"github.com/tencentyun/cos-go-sdk-v5"
	"github.com/tencentyun/cos-go-sdk-v5/debug"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"io"
	"net/http"
	"net/url"
	"strconv"
	"strings"
)

type Tencent struct {
}

func (s *Tencent) Upload(ctx context.Context, file *ghttp.UploadFile) (result system.UploadResponse, err error) {
	v, err := g.Cfg().Get(ctx, "upload.tencentCOS")
	if err != nil {
		return
	}
	m := v.MapStrVar()
	var (
		upPath    = m["upPath"].String()
		rawUrl    = m["rawUrl"].String()
		secretID  = m["secretID"].String()
		secretKey = m["secretKey"].String()
	)
	name := gfile.Basename(file.Filename)
	name = strings.ToLower(strconv.FormatInt(gtime.TimestampNano(), 36) + grand.S(6))
	name = name + gfile.Ext(file.Filename)

	path := upPath + name

	url, _ := url.Parse(rawUrl)
	b := &cos.BaseURL{BucketURL: url}
	client := cos.NewClient(b, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  secretID,
			SecretKey: secretKey,
			Transport: &debug.DebugRequestTransport{
				RequestHeader:  false,
				RequestBody:    false,
				ResponseHeader: false,
				ResponseBody:   false,
			},
		},
	})
	opt := &cos.ObjectPutOptions{
		ObjectPutHeaderOptions: &cos.ObjectPutHeaderOptions{
			ContentLength: int64(file.Size),
		},
	}
	var f io.ReadCloser
	f, err = file.Open()
	if err != nil {
		return
	}
	defer f.Close()
	_, err = client.Object.Put(context.Background(), path, f, opt)
	result = system.UploadResponse{
		Size:     file.Size,
		Path:     rawUrl + path,
		FullPath: rawUrl + path,
		Name:     file.Filename,
		Type:     file.Header.Get("Content-type"),
	}
	return
}
