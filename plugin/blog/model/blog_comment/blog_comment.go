package blog_comment

import (
	"gfast/app/model/admin/user"
	"gfast/plugin/blog/model/blog_log"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
)

// AddReq 用于存储新增请求的请求参数
type AddReq struct {
	CommentLogId    uint   `p:"commentLogId" v:"required|min:1#评论所属日志ID不能为空|评论所属日志ID错误"` // 当前评论所属日志id
	CommentNickname string `p:"commentNickname" v:"required#评论用户昵称不能为空"`                 // 评论用户的用户昵称
	CommentContent  string `p:"commentContent" v:"required#评论内容不能为空"`                    // 评论内容
	CommentPid      uint   `p:"commentPid"`                                              // 父评论id
	ReplyName       string `p:"replyName"`                                               // 当前回复对象的昵称
	ReplyId         uint   `p:"replyId"`                                                 // 当前回复对象的id
}

// EditReq 用于存储修改请求参数
type EditReq struct {
	CommentId      int64  `p:"commentId" v:"required|min:1#评论ID不能为空|评论ID错误"`
	CommentStatus  uint   `p:"commentStatus"`                        // 此评论的状态，0隐藏，1发布
	CommentContent string `p:"commentContent" v:"required#评论内容不能为空"` // 评论内容
}

// SelectPageReq 用于存储分页查询的请求参数
type SelectPageReq struct {
	CommentNickname string `p:"commentNickname"` // 评论用户昵称
	LogTitle        string `p:"logTitle"`        // 日志标题
	CommentLogIds   []int  // 存储根据日志标题查出来的日志id
	PageNum         int64  `p:"pageNum"`  // 当前页
	PageSize        int64  `p:"pageSize"` // 每页显示记录数
	Status          string // 状态:用于控制查询相应状态的评论,0停用,1正常
	// 评论在博客页面回复中分两级一级是没有父评论的,二级是有父评论的,一条一级评论下的二级评论的父id值相同,均为该一级评论的id
	Flag int // 用于判断查询模式,0:查询不区分评论等级(查询所有),1:只查询一级评论(父id为0的评论)
}

// 用于存储分页查询的数据
type ListEntity struct {
	Entity
	LogTitle string `orm:"log_title"      json:"log_title" ` // 所属日志标题
	UserName string `orm:"user_name"      json:"user_name" ` // 所属用户的用户名
	Children []*Entity
}

// GetChildren 将分页查出的实体切片中每一个元素的子评论查出来并添加进去
func GetChildren(listEntity []*ListEntity) ([]*ListEntity, error) {
	for i, v := range listEntity {
		children, err := GetChildrenByCommentId(v.CommentId)
		if err != nil {
			return nil, err
		}
		listEntity[i].Children = children
	}
	return listEntity, nil
}

// GetChildrenByCommentId 根据评论id查询该评论所有已审核的回复
func GetChildrenByCommentId(id uint) ([]*Entity, error) {
	list, err := Model.Where("comment_pid = ?", id).And("comment_status = ?", 1).All()
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据评论id查询回复评论出错")
	}
	return list, nil
}

// GetCommentByID 根据ID查询记录
func GetCommentByID(id int64) (*Entity, error) {
	entity, err := Model.FindOne("comment_id", id)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据ID查询记录出错!")
	}
	if entity == nil {
		return nil, gerror.New("根据ID未能查询到记录")
	}
	return entity, nil
}

// 查询并更新回复数
func FindSonCommentCount(id int) error {
	i, err := Model.Where("reply_id = ?", id).Count()
	if err != nil {
		g.Log().Debug(err)
		return gerror.New("查询回复数出错")
	}
	entity, err := GetCommentByID(int64(id))
	if err != nil {
		return err
	}
	entity.CommentNum = uint(i)
	Model.Save(entity)
	return nil
}

// AddSave 添加的方法
func AddSave(req *AddReq) error {
	var entity Entity
	entity.CommentLogId = req.CommentLogId       // 所属日志
	entity.CommentNickname = req.CommentNickname // 评论用户昵称
	entity.CommentContent = req.CommentContent   // 评论内容
	entity.CommentPid = req.CommentPid           // 父评论id,没有父则为0
	entity.ReplyName = req.ReplyName
	entity.ReplyId = req.ReplyId
	entity.CreateTime = uint(gtime.Timestamp()) // 评论时间
	// 保存实体
	_, err := entity.Insert()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("添加记录入库失败!")
	}
	return nil
}

// 批量删除记录
func DeleteByIDs(ids []int) error {
	_, err := Model.Delete("comment_id in(?)", ids)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除记录失败!")
	}
	return nil
}

// 根据ID修改记录
func EditSave(req *EditReq) error {
	// 先根据ID来查询要修改的记录
	entity, err := GetCommentByID(req.CommentId)
	if err != nil {
		return err
	}
	// 修改实体
	entity.CommentContent = req.CommentContent
	entity.CommentStatus = req.CommentStatus
	_, err = Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("修改记录失败!")
	}
	return nil
}

// 根据日志标题查询对应的日志id切片(因为评论中只存有日志id没有日志标题)
func FindUserAndLogIds(req *SelectPageReq) (*SelectPageReq, error) {
	if req.LogTitle != "" {
		logList, err := blog_log.Model.Where("log_title like ?", "%"+req.LogTitle+"%").Fields("log_id").All()
		if err != nil {
			g.Log().Error(err)
			return req, gerror.New("根据日志标题查询日志id时出错")
		}
		for _, v := range logList {
			req.CommentLogIds = append(req.CommentLogIds, v.LogId)
		}
	}
	return req, nil
}

// 分页查询,返回值total总记录数,page当前页
func SelectListByPage(req *SelectPageReq) (total int, page int64, list []*ListEntity, err error) {
	model := g.DB().Table(Table + " comment")
	if req != nil {
		if req.Flag == 1 {
			model.Where("comment_pid = ?", 0)
		}
		if req.Status == "0" {
			model.Where("comment.comment_status = ?", 0)
		}
		if req.Status == "1" {
			model.Where("comment.comment_status = ?", 1)
		}
		if req.CommentNickname != "" {
			model.Where("comment.comment_nickname like ?", "%"+req.CommentNickname+"%")
		}
		if req.CommentLogIds != nil {
			model.Where("comment.comment_log_id in(?)", req.CommentLogIds)
		}
	}
	model = model.LeftJoin(blog_log.Table+" log", "log.log_id=comment.comment_log_id")
	model = model.LeftJoin(user.Table+" u", "u.id=comment.comment_user_id")
	// 查询广告位总记录数(总行数)
	total, err = model.Count()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("获取总记录数失败")
		return 0, 0, nil, err
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	page = req.PageNum
	if req.PageSize == 0 {
		req.PageSize = 10
	}
	// 分页排序查询
	var res gdb.Result
	res, err = model.Fields("comment.*,log.log_title,u.user_name").Page(int(page), int(req.PageSize)).Order("comment.create_time desc,comment.comment_id asc").All()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询失败")
		return 0, 0, nil, err
	}

	err = res.Structs(&list)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("分页查询失败")
		return 0, 0, nil, err
	}
	return total, page, list, nil
}
