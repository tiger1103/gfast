package global

const (
	// CachePrefix 缓存前缀
	CachePrefix = "cacheOv2_"

	// SysAuthMenu 缓存菜单KEY
	SysAuthMenu = CachePrefix + "sysAuthMenu"
	// SysDict 字典缓存菜单KEY
	SysDict = CachePrefix + "sysDict"
	// SysRole 角色缓存key
	SysRole = CachePrefix + "sysRole"
	// SysWebSet 站点配置缓存key
	SysWebSet = CachePrefix + "sysWebSet"

	// SysAuthTag 权限缓存TAG标签
	SysAuthTag = CachePrefix + "sysAuthTag"
	// SysDictTag 字典缓存标签
	SysDictTag = CachePrefix + "sysDictTag"
	// SysConfigTag 系统参数配置
	SysConfigTag = CachePrefix + "sysConfigTag"
)
