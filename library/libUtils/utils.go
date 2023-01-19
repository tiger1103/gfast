/*
* @desc:工具
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/4 22:16
 */

package libUtils

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/crypto/gmd5"
	"github.com/gogf/gf/v2/encoding/gcharset"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/encoding/gurl"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"net"
	"net/http"
	"os"
	"path"
	"strings"
)

// EncryptPassword 密码加密
func EncryptPassword(password, salt string) string {
	return gmd5.MustEncryptString(gmd5.MustEncryptString(password) + gmd5.MustEncryptString(salt))
}

// GetDomain 获取当前请求接口域名
func GetDomain(ctx context.Context) string {
	r := g.RequestFromCtx(ctx)
	pathInfo, err := gurl.ParseURL(r.GetUrl(), -1)
	if err != nil {
		g.Log().Error(ctx, err)
		return ""
	}
	return fmt.Sprintf("%s://%s:%s/", pathInfo["scheme"], pathInfo["host"], pathInfo["port"])
}

// GetClientIp 获取客户端IP
func GetClientIp(ctx context.Context) string {
	return g.RequestFromCtx(ctx).GetClientIp()
}

// GetUserAgent 获取user-agent
func GetUserAgent(ctx context.Context) string {
	return ghttp.RequestFromCtx(ctx).Header.Get("User-Agent")
}

// GetLocalIP 服务端ip
func GetLocalIP() (ip string, err error) {
	var addrs []net.Addr
	addrs, err = net.InterfaceAddrs()
	if err != nil {
		return
	}
	for _, addr := range addrs {
		ipAddr, ok := addr.(*net.IPNet)
		if !ok {
			continue
		}
		if ipAddr.IP.IsLoopback() {
			continue
		}
		if !ipAddr.IP.IsGlobalUnicast() {
			continue
		}
		return ipAddr.IP.String(), nil
	}
	return
}

// GetCityByIp 获取ip所属城市
func GetCityByIp(ip string) string {
	if ip == "" {
		return ""
	}
	if ip == "::1" || ip == "127.0.0.1" {
		return "内网IP"
	}
	url := "http://whois.pconline.com.cn/ipJson.jsp?json=true&ip=" + ip
	bytes := g.Client().GetBytes(context.TODO(), url)
	src := string(bytes)
	srcCharset := "GBK"
	tmp, _ := gcharset.ToUTF8(srcCharset, src)
	json, err := gjson.DecodeToJson(tmp)
	if err != nil {
		return ""
	}
	if json.Get("code").Int() == 0 {
		city := fmt.Sprintf("%s %s", json.Get("pro").String(), json.Get("city").String())
		return city
	} else {
		return ""
	}
}

// 写入文件
func WriteToFile(fileName string, content string) error {
	f, err := os.OpenFile(fileName, os.O_WRONLY|os.O_TRUNC|os.O_CREATE, 0644)
	if err != nil {
		return err
	}
	n, _ := f.Seek(0, os.SEEK_END)
	_, err = f.WriteAt([]byte(content), n)
	defer f.Close()
	return err
}

// 文件或文件夹是否存在
func FileIsExisted(filename string) bool {
	existed := true
	if _, err := os.Stat(filename); os.IsNotExist(err) {
		existed = false
	}
	return existed
}

// 解析路径获取文件名称及后缀
func ParseFilePath(pathStr string) (fileName string, fileType string) {
	fileNameWithSuffix := path.Base(pathStr)
	fileType = path.Ext(fileNameWithSuffix)
	fileName = strings.TrimSuffix(fileNameWithSuffix, fileType)
	return
}

// IsNotExistMkDir 检查文件夹是否存在
// 如果不存在则新建文件夹
func IsNotExistMkDir(src string) error {
	if exist := !FileIsExisted(src); exist == false {
		if err := MkDir(src); err != nil {
			return err
		}
	}

	return nil
}

// MkDir 新建文件夹
func MkDir(src string) error {
	err := os.MkdirAll(src, os.ModePerm)
	if err != nil {
		return err
	}

	return nil
}

// 获取文件后缀
func GetExt(fileName string) string {
	return path.Ext(fileName)
}

// GetType 获取文件类型
func GetType(p string) (result string, err error) {
	file, err := os.Open(p)
	if err != nil {
		g.Log().Error(context.TODO(), err)
		return
	}
	buff := make([]byte, 512)

	_, err = file.Read(buff)

	if err != nil {
		g.Log().Error(context.TODO(), err)
		return
	}
	filetype := http.DetectContentType(buff)
	return filetype, nil
}

// GetFilesPath 获取附件相对路径
func GetFilesPath(ctx context.Context, fileUrl string) (path string, err error) {
	upType := g.Cfg().MustGet(ctx, "upload.default").Int()
	if upType != 0 || (upType == 0 && !gstr.ContainsI(fileUrl, consts.UploadPath)) {
		path = fileUrl
		return
	}
	pathInfo, err := gurl.ParseURL(fileUrl, 32)
	if err != nil {
		g.Log().Error(ctx, err)
		err = gerror.New("解析附件路径失败")
		return
	}
	pos := gstr.PosI(pathInfo["path"], consts.UploadPath)
	if pos >= 0 {
		path = gstr.SubStr(pathInfo["path"], pos)
	}
	return
}
