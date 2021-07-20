package global

const (
	//缓存前缀
	cachePrefix = "cache_"

	// SysAuthMenu 缓存菜单KEY
	SysAuthMenu = cachePrefix + "sysAuthMenu"
	// SysDict 字典缓存菜单KEY
	SysDict = cachePrefix + "sysDict"
	// SysRole 角色缓存key
	SysRole = cachePrefix + "sysRole"
	// SysWebSet 站点配置缓存key
	SysWebSet = cachePrefix + "sysWebSet"

	// SysAuthTag 权限缓存TAG标签
	SysAuthTag = cachePrefix + "sysAuthTag"
	// SysDictTag 字典缓存标签
	SysDictTag = cachePrefix + "sysDictTag"
	// SysConfigTag 系统参数配置
	SysConfigTag = cachePrefix + "sysConfigTag"
)
