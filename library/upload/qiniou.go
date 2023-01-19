package upload

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/util/guid"
	"github.com/qiniu/go-sdk/v7/auth/qbox"
	"github.com/qiniu/go-sdk/v7/storage"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"path"
)

type Qiniou struct{}

func (s *Qiniou) Upload(ctx context.Context, file *ghttp.UploadFile) (result system.UploadResponse, err error) {

	url, err := s.toQiniou(ctx, file)
	if err != nil {
		return
	}
	result = system.UploadResponse{
		Size:     file.Size,
		Path:     url,
		FullPath: url,
		Name:     file.Filename,
		Type:     file.Header.Get("Content-type"),
	}

	return
}

func (s *Qiniou) toQiniou(ctx context.Context, f *ghttp.UploadFile) (url string, err error) {
	file, err := f.Open()
	if err != nil {
		return
	}
	defer file.Close()
	v, err := g.Cfg().Get(ctx, "upload.qiniou")
	if err != nil {
		return
	}
	m := v.MapStrVar()
	var AccessKey = m["accessKey"].String()
	var SerectKey = m["sercetKey"].String()
	var Bucket = m["bucket"].String()
	var ImgUrl = m["qiniuServer"].String()

	putPlicy := storage.PutPolicy{
		Scope: Bucket,
	}
	mac := qbox.NewMac(AccessKey, SerectKey)
	upToken := putPlicy.UploadToken(mac)
	cfg := storage.Config{
		Zone:          &storage.ZoneHuanan,
		UseCdnDomains: false,
		UseHTTPS:      false,
	}
	putExtra := storage.PutExtra{
		MimeType: f.Header.Get("Content-type"),
	}
	formUploader := storage.NewFormUploader(&cfg)
	ret := storage.PutRet{}
	filename := guid.S() + path.Ext(f.Filename)
	fileSize := f.Size
	//err = formUploader.PutWithoutKey(context.Background(), &ret, upToken, file, fileSize, &putExtra)
	err = formUploader.Put(context.Background(), &ret, upToken, filename, file, fileSize, &putExtra)
	if err != nil {
		return
	}

	url = ImgUrl + "/" + filename
	return url, nil

}
