# GFast-V2

## 平台简介
* 基于全新GF(Go Frame)的后台管理系统
* 前端采用ruoyi-ui 、Vue、Element UI。
* 阿里云优惠券：[点我进入](https://www.aliyun.com/minisite/goods?userCode=fcor2omk )，腾讯云优惠券：[点我领取](https://cloud.tencent.com/act/cps/redirect?redirect=1062&cps_key=20b1c3842f74986b2894e2c5fcde7ea2&from=console )
* 本项目由奇讯科技团队开发。

## 特征
* 高生产率：几分钟即可搭建一个后台管理系统
* 模块化：单应用多系统的模式，将一个完整的应用拆分为多个系统，后续扩展更加便捷，增加代码复用性。
* 插件化： 可通过插件的方式扩展系统功能
* 认证机制：采用gtoken的用户状态认证及casbin的权限认证


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

> 项目使用模块化与插件化的方式开发，正在开发中的模块：cms系统、万能模型、微信管理、工单系统、问答系统、工作流引擎...

## 演示地址
[http://v2.g-fast.cn](http://v2.g-fast.cn/)
账号：demo  密码：123456
## 配置
项目数据库文件 /data/db.sql 创建数据库导入后修改配置/config/config.toml

其中gToken配置

```yaml
[gToken]
    [gToken.system]
        CacheMode = 2 #此处若使用了redis配置为2 若没使用redis配置1
        CacheKey = "GToken:"
        Timeout = 3600000 #1个小时
        MaxRefresh = 0
        TokenDelimiter="_"
        EncryptKey = "koi29a83idakguqjq29asd9asd8a7jhq"
        AuthFailMsg = "登录超时，请重新登录"
        MultiLogin = true  #后台是否允许多端同时在线
```

##运行
go run main.go 

账号：demo  密码：123456

项目为前后端分离，前端地址：

github地址：[https://github.com/tiger1103/gfast-ui](https://github.com/tiger1103/gfast-ui)

gitee地址：[https://gitee.com/tiger1103/gfast-ui](https://gitee.com/tiger1103/gfast-ui)

## 文档地址
[http://doc.qjit.cn/docs/gfast-v2/introduce](http://doc.qjit.cn/docs/gfast-v2/introduce)

## 相关视频
[https://space.bilibili.com/254192571/channel/seriesdetail?sid=223204](https://space.bilibili.com/254192571/channel/seriesdetail?sid=223204)


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
>gtoken [https://github.com/goflyfox/gtoken](https://github.com/goflyfox/gtoken)
>
>casbin [https://github.com/casbin/casbin](https://github.com/casbin/casbin)


PHP开源工作流引擎tpflow   [https://gitee.com/ntdgg/tpflow](https://gitee.com/ntdgg/tpflow)

CCflow 国内最优秀的开源流程引擎  [https://gitee.com/opencc/ccflow](https://gitee.com/opencc/ccflow)

### 生成dao
因为我们在开发过程中，goFrame框架的gf-cli 一直在更新功能，如果是修改了表重新生成建议不要直接去覆盖，生成到tmp目录后将需要的文件复制到对应的地方
```
例如： gf gen dao -path ./tmp  -l "mysql:root:123456@tcp(127.0.0.1:3306)/gfast-v2" -t 表名
```
**注意：使用gf-cli 版本最好 >= v1.16.4**

## 交流QQ群

> <img src="https://gitee.com/tiger1103/gfast/raw/master/public/qqcode.png"/>  

> 公司团队精力时间有限，目前Gfast QQ交流群有部分用户进行了捐赠，捐赠后请联系作者进vip用户群，vip群中问题将得到优先解答，同时也会根据您的需求进行分析和优先安排，vip群也会提供Gfast的其它福利。
> 同时您也可以联系我们，雇佣我们团队为您干活，谢谢合作！
>快来加入群聊【Gfast框架交流群】(群号865697297)，发现精彩内容，记得备注加群来意。

## 免责声明：
> 1、Gfast仅限自己学习使用，一切商业行为与Gfast无关。

> 2、用户不得利用Gfast从事非法行为，用户应当合法合规的使用，发现用户在使用产品时有任何的非法行为，Gfast有权配合有关机关进行调查或向政府部门举报，Gfast不承担用户因非法行为造成的任何法律责任，一切法律责任由用户自行承担，如因用户使用造成第三方损害的，用户应当依法予以赔偿。

> 3、所有与使用Gfast相关的资源直接风险均由用户承担。


## 商用说明
> 商用注意事项
如果您将此项目用于商业用途，请遵守Apache2.0协议并保留作者技术支持声明。


## [感谢JetBrains提供的免费GoLand](https://jb.gg/OpenSource)
[![avatar](https://camo.githubusercontent.com/323657c6e81419b8e151e9da4c71f409e3fcc65d630535170c59fe4807dbc905/68747470733a2f2f676f6672616d652e6f72672f646f776e6c6f61642f7468756d626e61696c732f313131343131392f6a6574627261696e732e706e67)](https://jb.gg/OpenSource)
