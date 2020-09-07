package cache_service

//缓存前缀KEY
const (
	AdminAuthMenu = iota
	AdminAuthRole
	AdminCmsMenu
	AdminConfigDict
	GovProject
)

//缓存TAG标签
const (
	AdminAuthTag = iota
	AdminCmsTag
	AdminSysConfigTag
	AdminModelTag
	AdminDeptUserTag
	GovProjectCateTag
)
