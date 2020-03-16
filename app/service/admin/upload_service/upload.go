package upload_service

import (
	"gfast/app/model/admin/sys_config"
	"gfast/app/service/admin/params_service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gregex"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

var uploadPath string

//上传得文件信息
type FileInfo struct {
	FileName string
	FileSize int64
	FileUrl  string
	fileType string
}

func init() {
	uploadPath = g.Cfg().GetString("server.ServerRoot") + "/pub_upload/"
}

//上传图片
func UpImg(file *ghttp.UploadFile) (fileInfo *FileInfo, err error) {
	if file == nil {
		err = gerror.New("未上传任何文件")
		return
	}
	//获取上传类型配置
	config, err := getUpConfig("sys.uploadFile.imageType")
	if err != nil {
		return
	}
	//检测文件类型
	rightType := checkFileType(file.Filename, config.ConfigValue)
	if !rightType {
		err = gerror.New("上传文件类型错误，只能包含后缀为：" + config.ConfigValue + "的文件。")
		return
	}
	//获取上传大小配置
	config, err = getUpConfig("sys.uploadFile.imageSize")
	if err != nil {
		return
	}
	rightSize, err := checkSize(config.ConfigValue, file.Size)
	if err != nil {
		return
	}
	if !rightSize {
		gerror.New("上传文件超过最大尺寸：" + config.ConfigValue)
		return
	}
	path := getUpPath()
	fileName, err := file.Save(path, true)
	if err != nil {
		return
	}
	fileInfo = &FileInfo{
		FileName: file.Filename,
		FileSize: file.Size,
		FileUrl:  getUrl(path, fileName),
		fileType: file.Header.Get("Content-type"),
	}
	return
}

//检查文件大小是否合法
func checkSize(configSize string, fileSize int64) (bool, error) {
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

//获取上传配置
func getUpConfig(key string) (config *sys_config.Entity, err error) {
	config, err = params_service.GetConfigByKey(key)
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
func checkFileType(fileName, typeString string) bool {
	suffix := gstr.SubStr(fileName, gstr.Pos(fileName, ".")+1)
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

func getUpPath() (upPath string) {
	upPath = uploadPath + gtime.Date() + "/"
	return
}

func getUrl(path, fileName string) string {
	url := gstr.SubStr(path, gstr.Pos(path, "/pub_upload/")+1) + fileName
	return url
}
