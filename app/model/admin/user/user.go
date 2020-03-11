package user

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

//验证用户表单数据
func checkUserData(params map[string]interface{}, t string) error {
	rules := []string{
		"id@integer|min:1#管理员id必须为整数|管理员Id必须大于0",
		"user_name@required|length:3,60#请填用户名|用户名应在:min到:max个字符之间",
		"mobile@telephone#手机号码格式不正确",
		"user_nickname@required|length:3,50#请填写姓名|姓名应在:min到:max个字符之间",
		"user_email@email#邮箱格式错误",
	}
	if t == "add" {
		rules = append(rules, "user_password@required|length:6,60#请填写密码|密码应在::min到:max个字符之间")
	} else {
		rules = append(rules, "user_password@length:6,60#密码应在::min到:max个字符之间")
	}
	e := gvalid.CheckMap(params, rules)
	if e != nil {
		return e
	}
	return nil
}

//添加管理员操作
func Add(data map[string]interface{}) (InsertId int64, err error) {
	e := checkUserData(data, "add")
	if e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	if i, _ := Model.Where("user_name=?", data["user_name"]).Count(); i != 0 {
		err = gerror.New("用户名已经存在")
		return
	}
	if i, _ := Model.Where("mobile=?", data["mobile"]).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		return
	}
	//保存管理员信息
	data["create_time"] = gtime.Timestamp()
	res, err := Model.Filter().Data(data).Save()
	if err != nil {
		return
	}
	InsertId, _ = res.LastInsertId()
	return
}

//修改用户信息
func Edit(data map[string]interface{}) (err error) {
	e := checkUserData(data, "edit")
	if e != nil {
		err = gerror.New(e.(*gvalid.Error).FirstString())
		return
	}
	if i, _ := Model.Where("id!=? and user_name=?", data["id"], data["user_name"]).Count(); i != 0 {
		err = gerror.New("用户名已经存在")
		return
	}
	if i, _ := Model.Where("id!=? and mobile=?", data["mobile"]).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		return
	}
	//保存管理员信息
	_, err = Model.Filter().Data(data).Save()
	if err != nil {
		return
	}
	return
}

//获取管理员列表
func GetAdminList(where g.Map, page, pageNum int) (total int, userList []*Entity, err error) {
	userModel := Model
	if v, ok := where["keyWords"]; ok {
		keyWords := gconv.String(v)
		if keyWords != "" {
			keyWords = "%" + keyWords + "%"
			userModel = userModel.Where("user_name like ? or mobile like ? or user_nickname like ?",
				keyWords, keyWords, keyWords)
		}
	}
	total, err = userModel.Count()
	userList, err = userModel.ForPage(page, pageNum).OrderBy("id asc").All()
	return
}
