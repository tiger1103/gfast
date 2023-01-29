# GFast-V3
<div align="center">
	<img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/gfastlogo.png">
    <p>
        <h1>GFast V3.2</h1>
    </p>
    <p align="center">
        <a href="https://goframe.org/pages/viewpage.action?pageId=1114119" target="_blank">
	        <img src="https://img.shields.io/badge/goframe-2.0-green" alt="goframe">
	    </a>
	    <a href="https://v3.vuejs.org/" target="_blank">
	        <img src="https://img.shields.io/badge/vue.js-vue3.x-green" alt="vue">
	    </a>
	    <a href="https://element-plus.gitee.io/#/zh-CN/component/changelog" target="_blank">
	        <img src="https://img.shields.io/badge/element--plus-%3E1.0.0-blue" alt="element plus">
	    </a>
		<a href="https://www.tslang.cn/" target="_blank">
	        <img src="https://img.shields.io/badge/typescript-%3E4.0.0-blue" alt="typescript">
	    </a>
		<a href="https://vitejs.dev/" target="_blank">
		    <img src="https://img.shields.io/badge/vite-%3E2.0.0-yellow" alt="vite">
		</a>
		<a href="https://gitee.com/lyt-top/vue-next-admin/blob/master/LICENSE" target="_blank">
		    <img src="https://img.shields.io/badge/license-MIT-success" alt="license">
		</a>
	</p>
</div>



## 平台简介
* 基于全新Go Frame 2.3+Vue3+Element Plus开发的全栈前后端分离的管理系统
* 前端采用vue-next-admin 、Vue、Element UI。
* 本项目由<a href="http://www.qjit.cn/" target="_blank"><b>奇讯科技</b></a>团队开发。
* 如您想购买云服务器请先领取阿里云优惠券：[点我进入](https://www.aliyun.com/minisite/goods?userCode=fcor2omk )，腾讯云优惠券：[点我领取](https://cloud.tencent.com/act/cps/redirect?redirect=1062&cps_key=20b1c3842f74986b2894e2c5fcde7ea2&from=console )
* 目前我们基于gfast开发了：吸vo(￣▽￣)ｄ毒人员风控平台、政府数据化招商平台、档案资源普查信息系统、扶贫资产管理系统、厂房消防安全风控平台、重点项目督办平台等。

## 特征
* 高生产率：几分钟即可搭建一个后台管理系统
* 模块化：单应用多系统的模式，将一个完整的应用拆分为多个系统，后续扩展更加便捷，增加代码复用性。
* 插件化： 可通过插件的方式扩展系统功能
* 认证机制：采用gtoken的用户状态认证及casbin的权限认证
* 路由模式：得利于goframe2.0提供了规范化的路由注册方式,无需注解自动生成api文档 
* 面向接口开发 


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

> 项目使用模块化与插件化的方式开发，目前正在升级的插件有：cms系统、万能模型、微信管理、工单系统、问答系统、工作流引擎...，同时也欢迎大家把写好的插件上传到商城，我们来帮您实现技术变现，获取收益！

> GFast开源以来得到了大家的很多支持，如果您愿意为GFast贡献代码或提供建议，请加微信：qixun007(备注：gfast)

## 演示地址
[http://v3.g-fast.cn/sys](http://v3.g-fast.cn/sys)
账号：demo  密码：123456
## 配置
项目数据库文件 `resource/data/db.sql` 创建数据库导入后修改配置 `manifest/config/config.yaml.bak` 复制改为`manifest/config/config.yaml`  

其中gfToken配置
```yaml
gfToken:
  cacheKey: "gfToken_"   #缓存前缀
  timeOut: 10800         #token超时时间（秒）
  maxRefresh: 5400       #token自动刷新时间（秒）
  multiLogin: true       #是否允许一个账号多人同时登录
  encryptKey: "49c54195e750b04e74a8429b17896586"    #加密key (32位)
  cacheModel: "redis"    #存储引擎 （memory使用内存|redis使用redis）
  excludePaths:          #排除不做登录验证的路由地址
    - "/api/v1/system/login"
```

项目为前后端分离，前端地址：

github地址：[https://github.com/tiger1103/gfast-ui](https://github.com/tiger1103/gfast-ui)

gitee地址：[https://gitee.com/tiger1103/gfast-ui](https://gitee.com/tiger1103/gfast-ui)

## 文档地址
> [http://doc.g-fast.cn/docs/gfast32](http://doc.g-fast.cn/docs/gfast32)

## 相关视频
[https://space.bilibili.com/254192571/channel/seriesdetail?sid=223204](https://space.bilibili.com/254192571/channel/seriesdetail?sid=223204)

## 演示图

<table>
    <tr>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01e1blsg80hagzj.png"/></td>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01gckl91kjetl0d.png"/></td>
    </tr>
    <tr>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01gckl91ky1lm3d.png"/></td>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01kkmk7sc1txfvz.png"/></td>
    </tr>
    <tr>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01kkmkfi4syoydw.png"/></td>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01s04zq2470mx3r.png"/></td>
    </tr>
	<tr>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01kkmkfi4tquojj.png"/></td>
        <td><img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/cje01s04zq245k17ta.png"/></td>
    </tr>
</table>

## 感谢(排名不分先后)
> gf框架 [https://github.com/gogf/gf](https://github.com/gogf/gf)
>
> vue-next-admin [https://gitee.com/lyt-top/vue-next-admin](https://gitee.com/lyt-top/vue-next-admin)
>
> swaggo [https://github.com/swaggo/swag](https://github.com/swaggo/swag)
>
>gtoken [https://github.com/goflyfox/gtoken](https://github.com/goflyfox/gtoken)
>
>casbin [https://github.com/casbin/casbin](https://github.com/casbin/casbin)


PHP开源工作流引擎tpflow   [https://gitee.com/ntdgg/tpflow](https://gitee.com/ntdgg/tpflow)

CCflow 国内最优秀的开源流程引擎  [https://gitee.com/opencc/ccflow](https://gitee.com/opencc/ccflow)

## 交流QQ群

> <img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/qqcode.png"/>  

> 感谢你使用GFast,公司团队精力时间有限，因此我们不再提供免费的技术服务，目前Gfast QQ交流群有部分用户进行了捐赠，捐赠后请联系作者进vip用户群，vip群中问题将得到优先解答，同时也会根据您的需求进行分析和优先安排，vip群也会提供Gfast的其它福利。
> 同时您也可以联系我们，雇佣我们团队为您干活，谢谢合作！
>快来加入群聊【Gfast框架交流群】(1群：865697297-已满，2群：444129379)，发现精彩内容，记得备注加群来意。

## 免责声明：
> 1、Gfast仅限自己学习使用，一切商业行为与Gfast无关。

> 2、用户不得利用Gfast从事非法行为，用户应当合法合规的使用，发现用户在使用产品时有任何的非法行为，Gfast有权配合有关机关进行调查或向政府部门举报，Gfast不承担用户因非法行为造成的任何法律责任，一切法律责任由用户自行承担，如因用户使用造成第三方损害的，用户应当依法予以赔偿。

> 3、所有与使用Gfast相关的资源直接风险均由用户承担。


## 商用说明
> 商用注意事项
如果您将此项目用于商业用途，请遵守Apache2.0协议并保留作者技术支持声明。

* GFast快速开发平台采用Apache-2.0技术协议
* 二次开发如用于商业性质或开源竞品请不要删除和修改GFast源码头部的版权与作者声明及出处
* 允许进行商用，但是不允许二次开源出来并进行收费
* 我们已经申请了相关的软件著作权和相关登记（证书号:软著登字第7511736号）
* 如果您在自己的项目中使用了我们项目中的扩展或模块，请在项目介绍中进行明确说明

## 支持开源
如果您喜爱gfast，请给常熬夜的作者来杯咖啡吧！<a href="https://ys0abw.yuque.com/ys0abw/ephcr9/zo38ua" target="_blank"> 点我送咖啡</a>

## [感谢JetBrains提供的免费GoLand](https://jb.gg/OpenSource)
[![avatar](https://camo.githubusercontent.com/323657c6e81419b8e151e9da4c71f409e3fcc65d630535170c59fe4807dbc905/68747470733a2f2f676f6672616d652e6f72672f646f776e6c6f61642f7468756d626e61696c732f313131343131392f6a6574627261696e732e706e67)](https://jb.gg/OpenSource)
