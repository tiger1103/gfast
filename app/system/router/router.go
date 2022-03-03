/*
* @desc: admin router
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/3/11 10:55
 */

package router

import (
	"gfast/app/system/api"
	"gfast/middleware"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func init() {
	s := g.Server()
	s.Group("/", func(group *ghttp.RouterGroup) {
		group.Group("/system", func(group *ghttp.RouterGroup) {
			//gToken拦截器
			api.GfToken.Middleware(group)
			//context拦截器
			group.Middleware(middleware.Ctx, middleware.Auth)
			//后台操作日志记录
			group.Hook("/*", ghttp.HookAfterOutput, api.SysOperLog.OperationLog)
			//后台上传
			group.Group("/upload", func(group *ghttp.RouterGroup) {
				//单图上传
				group.POST("/upImg", api.Upload.UpImg)
				group.POST("/ckEditorUp", api.Upload.CkEditorUp)
				group.POST("/upImgs", api.Upload.UpImgs)
				group.POST("/upFile", api.Upload.UpFile)
				group.POST("/upFiles", api.Upload.UpFiles)
			})
			//清除缓存
			group.Group("/cache", func(group *ghttp.RouterGroup) {
				group.DELETE("/clear", api.Cache.Clear)
			})
			//用户相关
			group.Group("/user", func(group *ghttp.RouterGroup) {
				//获取用户信息
				group.GET("/getInfo", api.User.GetInfo)
				//获取用户菜单
				group.GET("/getRouters", api.User.GetRouters)
				//个人中心
				group.GET("/profile", api.UserProfile.Profile)
				//头像上传
				group.POST("/avatar", api.UserProfile.Avatar)
				//修改用户信息
				group.PUT("/edit", api.UserProfile.Edit)
				//修改密码
				group.PUT("/updatePwd", api.UserProfile.UpdatePwd)
			})
			//配置相关
			group.Group("/config", func(group *ghttp.RouterGroup) {
				//获取字典分类列表
				group.GET("/dict/type/list", api.DictType.List)
				group.POST("/dict/type/add", api.DictType.Add)
				group.GET("/dict/type/one", api.DictType.Get)
				group.PUT("/dict/type/edit", api.DictType.Edit)
				group.DELETE("/dict/type/delete", api.DictType.Delete)
				group.GET("/dict/type/optionSelect", api.DictType.OptionSelect)
				//字典数据
				group.GET("/dict/data/GetDictData", api.DictData.GetDictData)
				group.GET("/dict/data/list", api.DictData.List)
				group.POST("/dict/data/add", api.DictData.Add)
				group.GET("/dict/data/one", api.DictData.Get)
				group.PUT("/dict/data/edit", api.DictData.Edit)
				group.DELETE("/dict/data/delete", api.DictData.Delete)
				//系统参数管理
				group.GET("/sysConfig/list", api.SysConfig.List)
				group.POST("/sysConfig/add", api.SysConfig.Add)
				group.GET("/sysConfig/one", api.SysConfig.Get)
				group.PUT("/sysConfig/edit", api.SysConfig.Edit)
				group.DELETE("/sysConfig/delete", api.SysConfig.Delete)
				//站点设置
				group.GET("/sysWebSet", api.SysWebSet.Get)
				group.POST("/sysWebSet/update", api.SysWebSet.Update)
			})
			// 权限管理
			group.Group("/auth", func(group *ghttp.RouterGroup) {
				//菜单管理
				group.GET("menuList", api.AuthRule.MenuList)
				group.GET("getMenus", api.AuthRule.GetMenus)
				group.POST("addMenu", api.AuthRule.AddMenuPost)
				group.GET("modelOptions", api.AuthRule.ModelOptions)
				group.GET("menu", api.AuthRule.GetMenu)
				group.PUT("editMenu", api.AuthRule.EditPost)
				group.DELETE("deleteMenu", api.AuthRule.DeleteMenu)
				//角色管理
				group.GET("roleList", api.SysRole.RoleList)
				group.GET("addRole", api.SysRole.GetRoleMenu)
				group.POST("addRole", api.SysRole.AddRole)
				group.GET("editRole", api.SysRole.GetRole)
				group.PUT("editRole", api.SysRole.EditRole)
				group.PUT("statusSetRole", api.SysRole.StatusSetRole)
				group.PUT("roleDataScope", api.SysRole.RoleDataScope)
				group.DELETE("deleteRole", api.SysRole.DeleteRole)
				// 部门管理
				group.GET("deptList", api.Dept.List)
				group.POST("deptAdd", api.Dept.Add)
				group.GET("deptGet", api.Dept.Get)
				group.PUT("deptEdit", api.Dept.Edit)
				group.DELETE("deptDelete", api.Dept.Delete)
				group.GET("deptTreeSelect", api.Dept.TreeSelect)
				group.GET("roleDeptTreeSelect", api.Dept.RoleDeptTreeSelect)
				//岗位管理
				group.GET("postList", api.SysPost.List)
				group.GET("postGet", api.SysPost.Get)
				group.POST("postAdd", api.SysPost.Add)
				group.PUT("postEdit", api.SysPost.Edit)
				group.DELETE("postDelete", api.SysPost.Delete)
				//用户管理
				group.GET("userList", api.User.UserList)
				group.GET("userGet", api.User.Get)
				group.GET("usersGet", api.User.UsersGet)
				group.POST("addUser", api.User.AddUser)
				group.GET("getEditUser", api.User.GetEditUser)
				group.PUT("editUser", api.User.EditUser)
				group.PUT("resetUserPwd", api.User.ResetUserPwd)
				group.PUT("changeUserStatus", api.User.ChangeUserStatus)
				group.DELETE("deleteUser", api.User.DeleteUser)
			})
			//系统监控
			group.Group("/monitor", func(group *ghttp.RouterGroup) {
				//在线用户管理
				group.Group("/online", func(group *ghttp.RouterGroup) {
					group.GET("list", api.SysUserOnline.List)
					group.PUT("forceLogout", api.SysUserOnline.ForceLogout)
				})
				//定时任务管理
				group.Group("/job", func(group *ghttp.RouterGroup) {
					group.GET("list", api.SysJob.List)
					group.POST("add", api.SysJob.Add)
					group.GET("get", api.SysJob.Get)
					group.PUT("edit", api.SysJob.Edit)
					group.PUT("start", api.SysJob.Start)
					group.PUT("stop", api.SysJob.Stop)
					group.PUT("run", api.SysJob.Run)
					group.DELETE("delete", api.SysJob.Delete)
				})
				//服务监控
				group.Group("/server", func(group *ghttp.RouterGroup) {
					group.GET("info", api.SysMonitor.Info)
				})
				//登录日志
				group.Group("/loginLog", func(group *ghttp.RouterGroup) {
					group.GET("list", api.SysLoginLog.List)
					group.DELETE("delete", api.SysLoginLog.Delete)
					group.DELETE("clear", api.SysLoginLog.Clear)
				})
				//操作日志
				group.Group("/operLog", func(group *ghttp.RouterGroup) {
					group.GET("list", api.SysOperLog.List)
					group.GET("detail", api.SysOperLog.Detail)
					group.DELETE("delete", api.SysOperLog.Delete)
					group.DELETE("clear", api.SysOperLog.Clear)
				})
			})
			//开发工具
			group.Group("/tools", func(group *ghttp.RouterGroup) {
				//代码生成
				group.Group("/gen", func(group *ghttp.RouterGroup) {
					group.GET("tableList", api.ToolsGenTable.TableList)
					group.GET("dataList", api.ToolsGenTable.DataList)
					group.POST("importTableSave", api.ToolsGenTable.ImportTableSave)
					group.DELETE("delete", api.ToolsGenTable.Delete)
					group.GET("columnList", api.ToolsGenTable.ColumnList)
					group.GET("relationTable", api.ToolsGenTable.RelationTable)
					group.PUT("editSave", api.ToolsGenTable.EditSave)
					group.GET("preview", api.ToolsGenTable.Preview)
					group.PUT("batchGenCode", api.ToolsGenTable.BatchGenCode)
				})
			})
		})
	})
}
