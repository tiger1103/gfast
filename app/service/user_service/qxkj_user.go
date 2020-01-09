package user_service

import (
	"database/sql"
	"errors"
	"gfast/app/model/qxkj_user"
	"github.com/gogf/gf/net/ghttp"
)

// 用户登录，成功返回用户信息，否则返回nil
func SignIn(username, password string, session *ghttp.Session) (error, *qxkj_user.QxkjUser) {
	qxkjUser, err := qxkj_user.Model.Where("user_name=? and user_password=?", username, password).One()
	if err != nil && err != sql.ErrNoRows {
		return err, nil
	}
	if qxkjUser == nil {
		return errors.New("账号或密码错误"), nil
	}
	return nil, qxkjUser
}
