## 平台简介
基于GF(Go Frame)的后台管理系统
参考后台模板[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
3.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
4.  参数管理：对系统动态配置常用参数。
5.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
6. 登录日志：系统登录日志记录查询包含登录异常。
7. 在线用户：当前系统中活跃用户状态监控。
8. 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
9. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
10. 栏目信息发布,文件上传,缓存标签等

## 演示地址
[http://47.107.158.252:8200/](http://47.107.158.252:8200/)
账号：demo  密码：123456
## 配置
项目数据库文件 /data/db.sql 创建数据库导入后修改配置/config/config.toml

其中jwt配置

[gToken]

    CacheMode = 2 此处若使用了redis配置为2 若没使用redis配置1
    CacheKey = "GToken:"
    Timeout = 0
    MaxRefresh = 0
    TokenDelimiter="_"
    EncryptKey = "koi29a83idakguqjq29asd9asd8a7jhq"
    AuthFailMsg = "登录超时，请重新登录"
    MultiLogin = true

##运行
go run main.go 直接访问http://localhost:8200

账号：demo  密码：123456

项目为前后端分离，前端地址：[vue-gfast-admin](https://gitee.com/tiger1103/vue-gfast-admin)

##接口文件
gfast.postman_collection.json 导入postman

## 演示图

<table>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2020/0331/155731_5194c2c1_142572.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2020/0331/155825_773ca447_142572.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2020/0331/155850_783d7f42_142572.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2020/0331/155912_0ec85d71_142572.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2020/0331/155931_72589aa0_142572.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2020/0331/155943_e3f15335_142572.png"/></td>
    </tr>
</table>
