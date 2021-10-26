/*
* @desc:本地上传
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/7 8:47
 */

package adapter

import (
	"gfast/app/common/model"
	"gfast/app/common/service"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gregex"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

func init() {
	var adp UploadAdapter
	if upType == "local" {
		//使用本地上传
		upPath := g.Cfg().GetString("upload.local.UpPath")
		adp = UploadLocalAdapter{
			UpPath:     "/pub_upload/",
			UploadPath: g.Cfg().GetString("server.ServerRoot") + upPath,
		}
		Upload = &upload{
			adapter: adp,
		}
	}
}

type UploadLocalAdapter struct {
	UpPath     string
	UploadPath string
}

// UpImg 上传图片
func (up UploadLocalAdapter) UpImg(file *ghttp.UploadFile) (fileInfo *FileInfo, err error) {
	return up.upByType(file, "img")
}

// UpFile 上传文件
func (up UploadLocalAdapter) UpFile(file *ghttp.UploadFile) (fileInfo *FileInfo, err error) {
	return up.upByType(file, "file")
}

// UpImgs 批量上传图片
func (up UploadLocalAdapter) UpImgs(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error) {
	return up.upBathByType(files, "img")
}

// UpFiles 批量上传文件
func (up UploadLocalAdapter) UpFiles(files []*ghttp.UploadFile) (fileInfos []*FileInfo, err error) {
	return up.upBathByType(files, "file")
}

//文件上传 img|file
func (up UploadLocalAdapter) upByType(file *ghttp.UploadFile, fType string) (fileInfo *FileInfo, err error) {
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
	config, err := up.getUpConfig(typeKey)
	if err != nil {
		return
	}

	//检测文件类型
	rightType := up.checkFileType(file.Filename, config.ConfigValue)
	if !rightType {
		err = gerror.New("上传文件类型错误，只能包含后缀为：" + config.ConfigValue + "的文件。")
		return
	}
	//获取上传大小配置
	config, err = up.getUpConfig(sizeKey)
	if err != nil {
		return
	}
	rightSize, err := up.checkSize(config.ConfigValue, file.Size)
	if err != nil {
		return
	}
	if !rightSize {
		err = gerror.New("上传文件超过最大尺寸：" + config.ConfigValue)
		return
	}
	path := up.getUpPath()
	fileName, err := file.Save(path, true)
	if err != nil {
		return
	}
	fileInfo = &FileInfo{
		FileName: file.Filename,
		FileSize: file.Size,
		FileUrl:  up.getUrl(path, fileName),
		FileType: file.Header.Get("Content-type"),
	}
	return
}

//批量上传 img|file
func (up UploadLocalAdapter) upBathByType(files []*ghttp.UploadFile, fType string) (fileInfos []*FileInfo, err error) {
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
	configType, err := up.getUpConfig(typeKey)
	if err != nil {
		return
	}
	//获取上传大小配置
	configSize, err := up.getUpConfig(sizeKey)
	if err != nil {
		return
	}
	for _, file := range files {
		//检测文件类型
		rightType := up.checkFileType(file.Filename, configType.ConfigValue)
		if !rightType {
			err = gerror.New("上传文件类型错误，只能包含后缀为：" + configType.ConfigValue + "的文件。")
			return
		}
		var rightSize bool
		rightSize, err = up.checkSize(configSize.ConfigValue, file.Size)
		if err != nil {
			return
		}
		if !rightSize {
			err = gerror.New("上传文件超过最大尺寸：" + configSize.ConfigValue)
			return
		}
	}
	path := up.getUpPath()
	for _, file := range files {
		var fileName string
		fileName, err = file.Save(path, true)
		if err != nil {
			return
		}
		fileInfo := &FileInfo{
			FileName: file.Filename,
			FileSize: file.Size,
			FileUrl:  up.getUrl(path, fileName),
			FileType: file.Header.Get("Content-type"),
		}
		fileInfos = append(fileInfos, fileInfo)
	}
	return
}

//检查文件大小是否合法
func (up UploadLocalAdapter) checkSize(configSize string, fileSize int64) (bool, error) {
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
func (up UploadLocalAdapter) getUpConfig(key string) (config *model.SysConfig, err error) {
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
func (up UploadLocalAdapter) checkFileType(fileName, typeString string) bool {
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

func (up UploadLocalAdapter) getUpPath() (upPath string) {
	upPath = up.UploadPath + gtime.Date() + "/"
	return
}

func (up UploadLocalAdapter) getUrl(path, fileName string) string {
	url := gstr.SubStr(path, gstr.Pos(path, up.UpPath)+1) + fileName
	return url
}
