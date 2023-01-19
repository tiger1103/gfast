/*
* @desc:context-model
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/16 14:45
 */

package model

type Context struct {
	User *ContextUser // User in context.
}

type ContextUser struct {
	*LoginUserRes
}
