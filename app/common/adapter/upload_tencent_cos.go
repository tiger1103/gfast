/*
* @desc:腾讯oss
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/7 15:51
 */

package adapter

import (
	"context"
	"gfast/app/common/model"
	"gfast/app/common/service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gfile"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gregex"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/grand"
	"github.com/tencentyun/cos-go-sdk-v5"
	"github.com/tencentyun/cos-go-sdk-v5/debug"
	"io"
	"net/http"
	"net/url"
	"strconv"
	"strings"
)

func init() {
	var adp UploadAdapter
	if upType == "tencentCOS" {
		//使用腾讯云COS上传
		adp = UploadTencentCOSAdapter{
			UpPath:    g.Cfg().GetString("upload.tencentCOS.UpPath"),
			RawUrl:    g.Cfg().GetString("upload.tencentCOS.RawUrl"),
			SecretID:  g.Cfg().GetString("upload.tencentCOS.SecretID"),
			SecretKey: g.Cfg().GetString("upload.tencentCOS.SecretKey"),
		}
		Upload = &upload{
			adapter: adp,
		}
	}
}

type UploadTencentCOSAdapter struct {
	UpPath    string
	SecretID  string
	SecretKey string
	RawUrl    string
}

func (u UploadTencentCOSAdapter) UpImg(file *ghttp.UploadFile) (fileInfo *FileInfo, err error) {
	return u.upByType(file, "img")
}

func (u UploadTencentCOSAdapter) UpFile(file *ghttp.UploadFile) (fileInfo *FileInfo, err error) {
	return u.upByType(file, "file")
}

func (u UploadTencentCOSAdapter) UpImgs(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error) {
	return u.upBathByType(files, "img")
}

func (u UploadTencentCOSAdapter) UpFiles(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error) {
	return u.upBathByType(files, "file")
}

//文件上传 img|file
func (u UploadTencentCOSAdapter) upByType(file *ghttp.UploadFile, fType string) (fileInfo *FileInfo, err error) {
	if file == nil {
		err = gerror.New("未上传任何文件")
		return
	}
	var (
		typeKey string
		sizeKey string
	)
	if fType == "img" {
		typeKey = "sys.uploadFile.imageType"
		sizeKey = "sys.uploadFile.imageSize"
	} else if fType == "file" {
		typeKey = "sys.uploadFile.fileType"
		sizeKey = "sys.uploadFile.fileSize"
	}
	//获取上传类型配置
	config, err := u.getUpConfig(typeKey)
	if err != nil {
		return
	}

	//检测文件类型
	rightType := u.checkFileType(file.Filename, config.ConfigValue)
	if !rightType {
		err = gerror.New("上传文件类型错误，只能包含后缀为：" + config.ConfigValue + "的文件。")
		return
	}
	//获取上传大小配置
	config, err = u.getUpConfig(sizeKey)
	if err != nil {
		return
	}
	rightSize, err := u.checkSize(config.ConfigValue, file.Size)
	if err != nil {
		return
	}
	if !rightSize {
		err = gerror.New("上传文件超过最大尺寸：" + config.ConfigValue)
		return
	}
	var path string
	path, err = u.upAction(file)
	if err != nil {
		return
	}
	fileInfo = &FileInfo{
		FileName: file.Filename,
		FileSize: file.Size,
		FileUrl:  u.getUrl(path),
		FileType: file.Header.Get("Content-type"),
	}
	return
}

//批量上传 img|file
func (u UploadTencentCOSAdapter) upBathByType(files []*ghttp.UploadFile, fType string) (fileInfos []*FileInfo, err error) {
	if len(files) == 0 {
		err = gerror.New("未上传任何文件")
		return
	}
	var (
		typeKey string
		sizeKey string
	)
	if fType == "img" {
		typeKey = "sys.uploadFile.imageType"
		sizeKey = "sys.uploadFile.imageSize"
	} else if fType == "file" {
		typeKey = "sys.uploadFile.fileType"
		sizeKey = "sys.uploadFile.fileSize"
	}
	//获取上传类型配置
	configType, err := u.getUpConfig(typeKey)
	if err != nil {
		return
	}
	//获取上传大小配置
	configSize, err := u.getUpConfig(sizeKey)
	if err != nil {
		return
	}
	for _, file := range files {
		//检测文件类型
		rightType := u.checkFileType(file.Filename, configType.ConfigValue)
		if !rightType {
			err = gerror.New("上传文件类型错误，只能包含后缀为：" + configType.ConfigValue + "的文件。")
			return
		}
		var rightSize bool
		rightSize, err = u.checkSize(configSize.ConfigValue, file.Size)
		if err != nil {
			return
		}
		if !rightSize {
			err = gerror.New("上传文件超过最大尺寸：" + configSize.ConfigValue)
			return
		}
	}
	for _, file := range files {
		var path string
		path, err = u.upAction(file)
		if err != nil {
			return
		}
		fileInfo := &FileInfo{
			FileName: file.Filename,
			FileSize: file.Size,
			FileUrl:  u.getUrl(path),
			FileType: file.Header.Get("Content-type"),
		}
		fileInfos = append(fileInfos, fileInfo)
	}
	return
}

// 上传到腾讯cos操作
func (u UploadTencentCOSAdapter) upAction(file *ghttp.UploadFile) (path string, err error) {
	name := gfile.Basename(file.Filename)
	name = strings.ToLower(strconv.FormatInt(gtime.TimestampNano(), 36) + grand.S(6))
	name = name + gfile.Ext(file.Filename)

	path = u.getUpPath() + name
	url, _ := url.Parse(u.RawUrl)
	b := &cos.BaseURL{BucketURL: url}
	c := cos.NewClient(b, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  u.SecretID,
			SecretKey: u.SecretKey,
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
	_, err = c.Object.Put(context.Background(), path, f, opt)
	return
}

//获取上传配置
func (u UploadTencentCOSAdapter) getUpConfig(key string) (config *model.SysConfig, err error) {
	config, err = service.SysConfig.GetConfigByKey(key)
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
func (u UploadTencentCOSAdapter) checkFileType(fileName, typeString string) bool {
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
func (u UploadTencentCOSAdapter) checkSize(configSize string, fileSize int64) (bool, error) {
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

func (u UploadTencentCOSAdapter) getUpPath() (upPath string) {
	upPath = u.UpPath + gtime.Date() + "/"
	return
}

func (u UploadTencentCOSAdapter) getUrl(path string) string {
	url := u.RawUrl + path
	return url
}
