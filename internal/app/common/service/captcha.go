package service

import (
	"context"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/mojocn/base64Captcha"
)

type ICaptcha interface {
	GetVerifyImgString(ctx context.Context) (idKeyC string, base64stringC string, err error)
	VerifyString(id, answer string) bool
}

type captchaImpl struct {
	driver *base64Captcha.DriverString
	store  base64Captcha.Store
}

var (
	captcha = captchaImpl{
		driver: &base64Captcha.DriverString{
			Height:          80,
			Width:           240,
			NoiseCount:      50,
			ShowLineOptions: 20,
			Length:          4,
			Source:          "abcdefghjkmnpqrstuvwxyz23456789",
			Fonts:           []string{"chromohv.ttf"},
		},
		store: base64Captcha.DefaultMemStore,
	}
)

func Captcha() ICaptcha {
	return &captcha
}

// GetVerifyImgString 获取字母数字混合验证码
func (s *captchaImpl) GetVerifyImgString(ctx context.Context) (idKeyC string, base64stringC string, err error) {
	driver := s.driver.ConvertFonts()
	c := base64Captcha.NewCaptcha(driver, s.store)
	idKeyC, base64stringC, err = c.Generate()
	return
}

// VerifyString 验证输入的验证码是否正确
func (s *captchaImpl) VerifyString(id, answer string) bool {
	c := base64Captcha.NewCaptcha(s.driver, s.store)
	answer = gstr.ToLower(answer)
	return c.Verify(id, answer, true)
}
