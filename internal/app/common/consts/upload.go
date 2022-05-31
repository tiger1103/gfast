package consts

const (
	UploadPath        = "upload_file"
	ImgTypeKey        = "sys.uploadFile.imageType"
	ImgSizeKey        = "sys.uploadFile.imageSize"
	FileTypeKey       = "sys.uploadFile.fileType"
	FileSizeKey       = "sys.uploadFile.fileSize"
	CheckFileTypeImg  = "img"  // 文件类型(图片)
	CheckFileTypeFile = "file" // 文件类型(任意)
)

const (
	SourceLocal   = iota //  上传到本地
	SourceTencent        //  上传至腾讯云
	SourceAli            //  上传到阿里云
	SourceQiniu          //  上传到七牛云
	//...................
)
