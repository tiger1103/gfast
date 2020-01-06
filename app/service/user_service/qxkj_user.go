package user_service

import (
	"database/sql"
	"errors"
	"gfast/app/model/qxkj_user"
	"github.com/gogf/gf/net/ghttp"
)

// 用户登录，成功返回用户信息，否则返回nil; passport应当会md5值字符串
func SignIn(username, password string, session *ghttp.Session) error {
	qxkjUser, err := qxkj_user.Model.Where("username=? and user_password=?", username, password).One()
	if err != nil && err != sql.ErrNoRows {
		return err
	}
	if qxkjUser == nil {
		return errors.New("账号或密码错误")
	}
	//session.Set(USER_SESSION_MARK, record)
	return nil
}
