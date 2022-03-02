package service

import (
	"context"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/mojocn/base64Captcha"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type captcha struct{}

var Captcha = new(captcha)

// GetVerifyImgString 获取字母数字混合验证码
func (s *captcha) GetVerifyImgString(ctx context.Context) (idKeyC string, base64stringC string) {
	driver := &base64Captcha.DriverString{
		Height:          80,
		Width:           240,
		NoiseCount:      50,
		ShowLineOptions: 20,
		Length:          4,
		Source:          "abcdefghjkmnpqrstuvwxyz23456789",
		Fonts:           []string{"chromohv.ttf"},
	}
	driver = driver.ConvertFonts()
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	idKeyC, base64stringC, err := c.Generate()
	liberr.ErrIsNil(ctx, err)
	return
}

// VerifyString 验证输入的验证码是否正确
func (s *captcha) VerifyString(id, answer string) bool {
	driver := new(base64Captcha.DriverString)
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	answer = gstr.ToLower(answer)
	return c.Verify(id, answer, true)
}
