package post_service

import (
	"database/sql"
	"gfast/app/model/admin/sys_post"
	"github.com/gogf/gf/database/gdb"
)

func List(req *sys_post.SearchParams) (total, page int, list gdb.Result, err error) {
	return sys_post.List(req)
}

//获取正常状态的岗位
func GetUsedPost() (list []*sys_post.Entity, err error) {
	return sys_post.GetUsedPost()
}

func Add(addParams *sys_post.AddParams) (result sql.Result, err error) {
	return sys_post.Add(addParams)
}

func Edit(editParams *sys_post.EditParams) (result sql.Result, err error) {
	return sys_post.Edit(editParams)
}

func GetOneById(id int64) (*sys_post.Entity, error) {
	return sys_post.GetOneById(id)
}

func Delete(ids []int) error {
	return sys_post.DeleteByIds(ids)
}
