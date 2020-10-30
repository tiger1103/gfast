## 平台简介
* 基于GF(Go Frame)的后台管理系统
* 前端采用ruoyi-ui 、Vue、Element UI。
* 后端采用GO语言 框架 GF(Go Frame)。
* 阿里云优惠券：[点我进入](https://www.aliyun.com/minisite/goods?userCode=fcor2omk )，腾讯云优惠券：[点我领取](https://cloud.tencent.com/act/cps/redirect?redirect=1062&cps_key=20b1c3842f74986b2894e2c5fcde7ea2&from=console )  
* 本项目由奇讯科技团队开发。

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
9. 登录日志：系统登录日志记录查询包含登录异常。
10. 在线用户：当前系统中活跃用户状态监控。
11. 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
12. 代码生成：前后端代码的生成。
13. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
14. 在线构建器：拖动表单元素生成相应的HTML代码。
15. 文件上传,缓存标签等。
16. 正在开发中的功能：cms管理、模型管理、工作流引擎

## 演示地址
[http://demo.g-fast.cn](http://demo.g-fast.cn/)
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

项目为前后端分离，前端地址：

github地址：[https://github.com/tiger1103/gfast-ui](https://github.com/tiger1103/gfast-ui)

gitee地址：[https://gitee.com/tiger1103/gfast-ui](https://gitee.com/tiger1103/gfast-ui)


## 演示图

<table>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/cd1f90be5f2684f4560c9519c0f2a232ee8.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/1cbcf0e6f257c7d3a063c0e3f2ff989e4b3.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/707825ad3f29de74a8d6d02fbd73ad631ea.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/46be40cc6f01aa300eed53a19b5012bf484.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/4284796d4cea240d181b8f2201813dda710.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/3ecfac87a049f7fe36abbcaafb2c40d36cf.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/71c2d48905221a09a728df4aff4160b8607.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/c14c1ee9a64a6a9c2c22f67d43198767dbe.jpg"/></td>
    </tr>	 
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/5e8c387724954459291aafd5eb52b456f53.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/644e78da53c2e92a95dfda4f76e6d117c4b.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/fdea1d8bb8625c27bf964176a2c8ebc6945.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/509d2708cfd762b6e6339364cac1cc1970c.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-f1fd681cc9d295db74e85ad6d2fe4389454.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-c195234bbcd30be6927f037a6755e6ab69c.png"/></td>
    </tr>
</table>

## 感谢(排名不分先后)
> gf框架 [https://github.com/gogf/gf](https://github.com/gogf/gf) 
>
> RuoYi-Vue [https://gitee.com/y_project/RuoYi-Vue](https://gitee.com/y_project/RuoYi-Vue)
>
> swaggo [https://github.com/swaggo/swag](https://github.com/swaggo/swag)
>
>tpflow [https://gitee.com/ntdgg/tpflow](https://gitee.com/ntdgg/tpflow)
>
>gtoken [https://github.com/goflyfox/gtoken](https://github.com/goflyfox/gtoken)
>
>casbin [https://github.com/casbin/casbin](https://github.com/casbin/casbin)
>
>云捷go [https://gitee.com/yunjieg/yjgo](https://gitee.com/yunjieg/yjgo)
## 交流QQ群  

> <img src="https://gitee.com/tiger1103/gfast/raw/master/public/qqcode.png"/>  

> 快来加入群聊【Gfast框架交流群】(群号865697297)，发现精彩内容。  
