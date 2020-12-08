package blog_service

import (
	"gfast/plugin/blog/model/blog_comment"
)

// 添加
func AddCommentSave(req *blog_comment.AddReq) error {
	err := blog_comment.AddSave(req)
	if err != nil {
		return err
	}
	if req.CommentPid != 0 {
		err = blog_comment.FindSonCommentCount(int(req.ReplyId)) // 每次添加评论都要更新所回复评论的回复数
		if err != nil {
			return err
		}
	}
	return nil
}

// 删除
func DeleteCommentByIDs(Ids []int) error {
	return blog_comment.DeleteByIDs(Ids)
}

//修改
func EditCommentSave(editReq *blog_comment.EditReq) error {
	return blog_comment.EditSave(editReq)
}

// 根据ID查询
func GetCommentByID(id int64) (*blog_comment.Entity, error) {
	return blog_comment.GetCommentByID(id)
}

// 分页查询
func SelectCommentListByPage(req *blog_comment.SelectPageReq) (total int, page int64, list []*blog_comment.ListEntity, err error) {
	blog_comment.FindUserAndLogIds(req)
	return blog_comment.SelectListByPage(req)
}

// GetChildren 将分页查出的实体切片中每一个元素的子评论查出来并添加进去
func GetChildren(listEntity []*blog_comment.ListEntity) ([]*blog_comment.ListEntity, error) {
	return blog_comment.GetChildren(listEntity)
}
