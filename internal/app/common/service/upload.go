package service

import (
	"context"
	"errors"
	"fmt"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/text/gregex"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/gogf/gf/v2/util/grand"
	"github.com/tencentyun/cos-go-sdk-v5"
	"github.com/tencentyun/cos-go-sdk-v5/debug"
	"github.com/tiger1103/gfast/v3/api/v1/common"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/model/entity"
	"io"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"
)

type IUpload interface {
	UploadFile(ctx context.Context, file *ghttp.UploadFile, checkFileType string, source int) (result common.UploadResponse, err error)
	UploadFiles(ctx context.Context, files []*ghttp.UploadFile, checkFileType string, source int) (result common.UploadMultipleRes, err error)
}

type uploadTmpl struct{}

func Upload() IUpload {
	return &uploadTmpl{}
}

// 上传多文件
func (s *uploadTmpl) UploadFiles(ctx context.Context, files []*ghttp.UploadFile, checkFileType string, source int) (result common.UploadMultipleRes, err error) {
	for _, item := range files {
		f, e := s.UploadFile(ctx, item, checkFileType, source)
		if e != nil {
			return
		}
		result = append(result, &f)
	}
	return
}

// 上传单文件
func (s *uploadTmpl) UploadFile(ctx context.Context, file *ghttp.UploadFile, checkFileType string, source int) (result common.UploadResponse, err error) {

	// 检查文件类型
	err = s.CheckType(ctx, checkFileType, file)
	if err != nil {
		return
	}

	// 检查文件大小
	err = s.CheckSize(ctx, checkFileType, file)
	if err != nil {
		return
	}

	// 非图片文件只能上传至本地
	if checkFileType == consts.CheckFileTypeFile {
		source = consts.SourceLocal
	}

	switch source {
	// 上传至本地
	case consts.SourceLocal:
		result, err = s.UploadLocal(ctx, file)
	// 上传至腾讯云
	case consts.SourceTencent:
		result, err = s.UploadTencent(ctx, file)
	default:
		err = errors.New("source参数错误!")
	}

	if err != nil {
		return
	}
	return
}

// 上传至腾讯云
func (s *uploadTmpl) UploadTencent(ctx context.Context, file *ghttp.UploadFile) (result common.UploadResponse, err error) {
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
	result = common.UploadResponse{
		Size:     file.Size,
		Path:     rawUrl + path,
		FullPath: rawUrl + path,
		Name:     file.Filename,
		Type:     file.Header.Get("Content-type"),
	}
	return
}

// 上传本地
func (s *uploadTmpl) UploadLocal(ctx context.Context, file *ghttp.UploadFile) (result common.UploadResponse, err error) {
	if file == nil {
		err = errors.New("文件必须!")
		return
	}
	r := g.RequestFromCtx(ctx)
	urlPerfix := fmt.Sprintf("http://%s/", r.Host)
	p := strings.Trim(consts.UploadPath, "/")
	sp := s.getStaticPath(ctx)
	if sp != "" {
		sp = strings.Trim(sp, "/")
	}
	nowData := time.Now().Format("2006-01-02")
	// 包含静态文件夹的路径
	fullDirPath := sp + "/" + p + "/" + nowData
	fileName, err := file.Save(fullDirPath, true)
	if err != nil {
		return
	}
	// 不含静态文件夹的路径
	fullPath := p + "/" + nowData + "/" + fileName

	result = common.UploadResponse{
		Size:     file.Size,
		Path:     fullPath,
		FullPath: urlPerfix + fullPath,
		Name:     file.Filename,
		Type:     file.Header.Get("Content-type"),
	}
	return
}

// 检查上传文件大小
func (s *uploadTmpl) CheckSize(ctx context.Context, checkFileType string, file *ghttp.UploadFile) (err error) {

	var (
		configSize *entity.SysConfig
	)

	if checkFileType == consts.CheckFileTypeFile {

		//获取上传大小配置
		configSize, err = s.getUpConfig(ctx, consts.FileSizeKey)
		if err != nil {
			return
		}
	} else if checkFileType == consts.CheckFileTypeImg {

		//获取上传大小配置
		configSize, err = s.getUpConfig(ctx, consts.ImgSizeKey)
		if err != nil {
			return
		}
	} else {
		return errors.New(fmt.Sprintf("文件检查类型错误:%s|%s", consts.CheckFileTypeFile, consts.CheckFileTypeImg))
	}

	var rightSize bool
	rightSize, err = s.checkSize(configSize.ConfigValue, file.Size)
	if err != nil {
		return
	}
	if !rightSize {
		err = gerror.New("上传文件超过最大尺寸：" + configSize.ConfigValue)
		return
	}
	return
}

// 检查上传文件类型
func (s *uploadTmpl) CheckType(ctx context.Context, checkFileType string, file *ghttp.UploadFile) (err error) {

	var (
		configType *entity.SysConfig
	)

	if checkFileType == consts.CheckFileTypeFile {
		//获取上传类型配置
		configType, err = s.getUpConfig(ctx, consts.FileTypeKey)
		if err != nil {
			return
		}

	} else if checkFileType == consts.CheckFileTypeImg {
		//获取上传类型配置
		configType, err = s.getUpConfig(ctx, consts.ImgTypeKey)
		if err != nil {
			return
		}
	} else {
		return errors.New(fmt.Sprintf("文件检查类型错误:%s|%s", consts.CheckFileTypeFile, consts.CheckFileTypeImg))
	}

	rightType := s.checkFileType(file.Filename, configType.ConfigValue)
	if !rightType {
		err = gerror.New("上传文件类型错误，只能包含后缀为：" + configType.ConfigValue + "的文件。")
		return
	}
	return
}

//获取上传配置
func (s *uploadTmpl) getUpConfig(ctx context.Context, key string) (config *entity.SysConfig, err error) {
	config, err = Config().GetConfigByKey(ctx, key)
	if err != nil {
		return
	}
	if config == nil {
		err = gerror.New("上传文件类型未设置，请在后台配置")
		return
	}
	return
}

//判断上传文件类型是否合法
func (s *uploadTmpl) checkFileType(fileName, typeString string) bool {
	suffix := gstr.SubStrRune(fileName, gstr.PosRRune(fileName, ".")+1, gstr.LenRune(fileName)-1)
	imageType := gstr.Split(typeString, ",")
	rightType := false
	for _, v := range imageType {
		if gstr.Equal(suffix, v) {
			rightType = true
			break
		}
	}
	return rightType
}

//检查文件大小是否合法
func (s *uploadTmpl) checkSize(configSize string, fileSize int64) (bool, error) {
	match, err := gregex.MatchString(`^([0-9]+)(?i:([a-z]*))$`, configSize)
	if err != nil {
		return false, err
	}
	if len(match) == 0 {
		err = gerror.New("上传文件大小未设置，请在后台配置，格式为（30M,30k,30MB）")
		return false, err
	}
	var cfSize int64
	switch gstr.ToUpper(match[2]) {
	case "MB", "M":
		cfSize = gconv.Int64(match[1]) * 1024 * 1024
	case "KB", "K":
		cfSize = gconv.Int64(match[1]) * 1024
	case "":
		cfSize = gconv.Int64(match[1])
	}
	if cfSize == 0 {
		err = gerror.New("上传文件大小未设置，请在后台配置，格式为（30M,30k,30MB），最大单位为MB")
		return false, err
	}
	return cfSize >= fileSize, nil
}

// 静态文件夹目录
func (s *uploadTmpl) getStaticPath(ctx context.Context) string {
	value, _ := g.Cfg().Get(ctx, "server.serverRoot")
	if !value.IsEmpty() {
		return value.String()
	}
	return ""
}
