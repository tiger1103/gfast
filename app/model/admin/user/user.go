package user

import (
	"gfast/library/utils"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
)

//设置用户状态参数
type StatusReq struct {
	Id         uint64 `p:"userId" v:"required#用户id不能为空"`
	UserStatus uint   `p:"status" v:"required#用户状态不能为空"`
}

//重置用户密码状态参数
type ResetPwdReq struct {
	Id       uint64 `p:"userId" v:"required#用户id不能为空"`
	Password string `p:"password" v:"required|password#密码不能为空|密码以字母开头，只能包含字母、数字和下划线，长度在6~18之间"`
}

//用户搜索请求参数
type SearchReq struct {
	DeptId      string `p:deptId` //部门id
	DeptIds     []int  //所属部门id数据
	BeginTime   string `p:"beginTime`
	EndTime     string `p:"endTime"`
	Phonenumber string `p:"phonenumber"`
	Status      string `p:"status"`
	KeyWords    string `p:"userName"`
	PageNum     int    `p:"page"`     //当前页码
	PageSize    int    `p:"pageSize"` //每页数
}

//添加修改用户公用请求字段
type SetUserReq struct {
	DeptId      uint64  `p:"deptId" v:"required#用户部门不能为空"` //所属部门
	Email       string  `p:"email" v:"email#邮箱格式错误"`       //邮箱
	NickName    string  `p:"nickName" v:"required#用户昵称不能为空"`
	Phonenumber string  `p:"phonenumber" v:"required|phone#手机号不能为空|手机号格式错误"`
	PostIds     []int64 `p:"postIds"`
	Remark      string  `p:"remark"`
	RoleIds     []int64 `p:"roleIds"`
	Sex         int     `p:"sex"`
	Status      uint    `p:"status"`
	IsAdmin     int     `p:"is_admin"` // 是否后台管理员 1 是  0   否
}

//添加用户请求
type AddUserReq struct {
	SetUserReq
	UserName string `p:"userName" v:"required#用户账号不能为空"`
	Password string `p:"password" v:"required|password#密码不能为空|密码以字母开头，只能包含字母、数字和下划线，长度在6~18之间"`
}

//修改用户请求
type EditUserReq struct {
	SetUserReq
	UserId int `p:"userId" v:"required#用户id不能为空"`
}

func GetUserById(id uint64) (*Entity, error) {
	return Model.Where("id", id).One()
}

//添加管理员操作
func Add(req *AddUserReq) (InsertId int64, err error) {
	if i, _ := Model.Where("user_name=?", req.UserName).Count(); i != 0 {
		err = gerror.New("用户名已经存在")
		return
	}
	if i, _ := Model.Where("mobile=?", req.Phonenumber).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		return
	}
	//保存管理员信息
	entity := new(Entity)
	entity.UserName = req.UserName
	entity.DeptId = req.DeptId
	entity.UserStatus = req.Status
	entity.CreateTime = gconv.Int(gtime.Timestamp())
	entity.Mobile = req.Phonenumber
	entity.Sex = req.Sex
	entity.UserEmail = req.Email
	entity.UserNickname = req.NickName
	entity.UserPassword = req.Password
	entity.Remark = req.Remark
	entity.IsAdmin = req.IsAdmin
	res, err := Model.Save(entity)
	if err != nil {
		return
	}
	InsertId, _ = res.LastInsertId()
	return
}

//修改用户信息
func Edit(req *EditUserReq) (err error) {
	if i, _ := Model.Where("id!=? and mobile=?", req.UserId, req.Phonenumber).Count(); i != 0 {
		err = gerror.New("手机号已经存在")
		return
	}
	//保存管理员信息
	var entity *Entity
	entity, err = Model.Where("id", req.UserId).One()
	if err != nil || entity == nil {
		g.Log().Error(err)
		err = gerror.New("获取用户信息失败")
		return
	}
	entity.DeptId = req.DeptId
	entity.UserStatus = req.Status
	entity.Mobile = req.Phonenumber
	entity.Sex = req.Sex
	entity.UserEmail = req.Email
	entity.UserNickname = req.NickName
	entity.Remark = req.Remark
	entity.IsAdmin = req.IsAdmin
	_, err = Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("修改用户信息失败")
	}
	return
}

//获取管理员列表
func GetAdminList(req *SearchReq) (total, page int, userList []*Entity, err error) {
	userModel := Model
	if req != nil {
		if req.KeyWords != "" {
			keyWords := "%" + req.KeyWords + "%"
			userModel = userModel.Where("user_name like ? or  user_nickname like ?",
				keyWords, keyWords)
		}
		if len(req.DeptIds) != 0 {
			userModel = userModel.Where("dept_id in (?)", req.DeptIds)
		}
		if req.Status != "" {
			userModel = userModel.Where("user_status", gconv.Int(req.Status))
		}
		if req.Phonenumber != "" {
			userModel = userModel.Where("mobile like ?", "%"+req.Phonenumber+"%")
		}
		if req.BeginTime != "" {
			userModel = userModel.Where("create_time >=?", utils.StrToTimestamp(req.BeginTime))
		}
		if req.EndTime != "" {
			userModel = userModel.Where("create_time <=?", utils.StrToTimestamp(req.EndTime))
		}
	}
	total, err = userModel.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总行数失败")
		return
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	userList, err = userModel.Page(page, req.PageSize).Order("id asc").All()
	return
}

//修改用户状态
func ChangeUserStatus(req *StatusReq) error {
	user, err := Model.Where("id", req.Id).One()
	if err != nil || user == nil {
		g.Log().Error(err)
		return gerror.New("用户不存在")
	}
	user.UserStatus = req.UserStatus
	_, err = Model.Save(user)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("修改用户状态失败")
	}
	return nil
}

//重置用户密码
func ResetUserPwd(req *ResetPwdReq) error {
	user, err := Model.Where("id", req.Id).One()
	if err != nil || user == nil {
		g.Log().Error(err)
		return gerror.New("用户不存在")
	}
	user.UserPassword = req.Password
	_, err = Model.Save(user)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("修改用户密码失败")
	}
	return nil
}
