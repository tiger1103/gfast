-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gfast_open
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型 0目录 1菜单 2按钮',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `always_show` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示状态',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_frame` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES (1,0,'system/config','系统配置','system','','Admin tips',0,1497429920,1497430320,0,1,1,'config','',0,'sys_admin',0),(2,0,'system/auth','权限管理','peoples','','',0,1497429920,1592380524,0,1,1,'system/auth','',0,'sys_admin',0),(3,0,'system/monitor','系统监控','monitor','','',0,1497429920,1592380560,0,1,1,'monitor','',0,'sys_admin',0),(4,0,'system/cms','cms管理','form','','',0,1497429920,1592380573,0,1,1,'cms','',0,'sys_admin',0),(5,1,'system/config/dict/list','字典管理','dict','','',1,1497429920,1592380469,0,1,1,'dict/list','system/config/dict/list',0,'sys_admin',0),(6,1,'system/config/params/list','参数管理','date-range','','',1,1497429920,1592380510,0,1,1,'params/list','system/config/params/list',0,'sys_admin',0),(8,2,'system/auth/menuList','菜单管理','nested','','',1,1497429920,1592380548,0,1,1,'menuList','system/auth/menuList',0,'sys_admin',0),(21,5,'system/config/dict/delete','删除字典','','','',2,1592363629,1592363629,0,1,1,'','',0,'sys_admin',0),(16,8,'system/auth/addMenu','添加菜单','','','',2,1592357208,1600396699,0,1,0,'','',0,'sys_admin',0),(17,8,'system/auth/editMenu','修改菜单','','','',2,1592357231,1592357274,0,1,1,'','',0,'sys_admin',0),(18,8,'system/auth/deleteMenu','删除菜单','','','',2,1592357268,1592357268,0,1,1,'','',0,'sys_admin',0),(19,5,'system/config/dict/add','添加字典','','','',2,1592363585,1592363585,0,1,1,'','',0,'sys_admin',0),(20,5,'system/config/dict/edit','修改字典','','','',2,1592363604,1592363604,0,1,1,'','',0,'sys_admin',0),(22,5,'system/config/dict/dataList','字典数据管理','','','',2,1592363790,1592365455,0,1,1,'dataList','',0,'sys_admin',0),(23,5,'system/config/dict/dataAdd','添加字典数据','','','',2,1592380398,1593411393,0,1,1,'','',0,'sys_admin',0),(24,5,'system/config/dict/dataEdit','修改字典数据','','','',2,1592380417,1593411398,0,1,1,'','',0,'sys_admin',0),(25,5,'system/config/dict/dataDelete','删除字典数据','','','',2,1592380449,1593411403,0,1,1,'','',0,'sys_admin',0),(26,2,'system/auth/roleList','角色管理','logininfor','','',1,1592385260,1592385291,0,1,1,'role','system/auth/roleList',0,'sys_admin',0),(27,26,'system/auth/addRole','添加角色','','','',2,1592389821,1592389821,0,1,1,'','',0,'sys_admin',0),(28,2,'system/auth/dept','部门管理','peoples','','',1,1592449845,1592449845,0,1,1,'dept','system/auth/dept',0,'sys_admin',0),(29,26,'system/auth/editRole','修改角色','','','',2,1592469153,1592469153,0,1,1,'','',0,'sys_admin',0),(30,26,'system/auth/statusSetRole','设置角色状态','','','',2,1592469201,1592469201,0,1,1,'','',0,'sys_admin',0),(31,26,'system/auth/deleteRole','删除角色','','','',2,1592469234,1592469234,0,1,1,'','',0,'sys_admin',0),(32,4,'system/cms/menu/list','栏目管理','tree-table','','',1,1592469318,1592469318,0,1,1,'menu','system/cms/menu/list',0,'sys_admin',0),(33,2,'system/auth/post','岗位管理','tab','','',1,1592558968,1592558968,0,1,1,'post','system/auth/post',0,'sys_admin',0),(34,3,'system/monitor/online/list','在线用户','cascader','','',1,1593328511,1593328511,0,1,1,'online','system/monitor/online/list',0,'sys_admin',0),(35,4,'system/cms/news/list','文章管理','log','','',1,1593331969,1593331991,0,1,1,'news','system/cms/news/list',0,'sys_admin',0),(36,3,'system/monitor/job','定时任务','clipboard','','',1,1593332305,1593332434,0,1,1,'job','system/monitor/job',0,'sys_admin',0),(37,3,'system/monitor/server','服务监控','dict','','',1,1593419394,1593419394,0,1,1,'server','system/monitor/server',0,'sys_admin',0),(38,3,'system/monitor/logininfor','登录日志','chart','','',1,1593423378,1593423505,0,1,1,'logininfor','system/monitor/logininfor',0,'sys_admin',0),(39,3,'system/monitor/operlog','操作日志','dashboard','','',1,1593485097,1593485097,0,1,1,'operlog','system/monitor/operlog',0,'sys_admin',0),(40,2,'system/auth/userList','用户管理','user','','',1,1593572523,1593572523,0,1,1,'user','system/auth/userList',0,'sys_admin',0),(41,6,'system/config/params/add','添加参数','','','',2,1593684331,1593684331,0,1,1,'','',0,'sys_admin',0),(42,6,'system/config/params/edit','修改参数','','','',2,1593684351,1593684351,0,1,1,'','',0,'sys_admin',0),(43,6,'system/config/params/delete','删除参数','','','',2,1593684470,1593684470,0,1,1,'','',0,'sys_admin',0),(44,28,'system/dept/addDept','添加部门','','','',2,1593738070,1593738070,0,1,1,'','',0,'sys_admin',0),(45,28,'system/dept/editDept','修改部门','','','',2,1593738097,1593738097,0,1,1,'','',0,'sys_admin',0),(46,28,'system/dept/delDept','删除部门','','','',2,1593738125,1593738125,0,1,1,'','',0,'sys_admin',0),(47,33,'system/post/add','添加岗位','','','',2,1593738444,1593738444,0,1,1,'','',0,'sys_admin',0),(48,33,'system/post/edit','修改岗位','','','',2,1593738567,1593738567,0,1,1,'','',0,'sys_admin',0),(49,33,'system/post/delete','删除岗位','','','',2,1593738590,1593738590,0,1,1,'','',0,'sys_admin',0),(50,40,'system/auth/addUser','添加用户','','','',2,1593738798,1593738798,0,1,1,'','',0,'sys_admin',0),(51,40,'system/auth/editUser','修改用户','','','',2,1593738950,1593738950,0,1,1,'','',0,'sys_admin',0),(52,40,'system/auth/resetUserPwd','密码重置','','','',2,1593739001,1593739001,0,1,1,'','',0,'sys_admin',0),(53,40,'system/auth/changeUserStatus','状态设置','','','',2,1593739079,1593739079,0,1,1,'','',0,'sys_admin',0),(54,40,'system/auth/deleteAdmin','删除用户','','','',2,1593739113,1593739113,0,1,1,'','',0,'sys_admin',0),(55,34,'system/monitor/online/forceLogout','强制退出','','','',2,1593739201,1593739201,0,1,1,'','',0,'sys_admin',0),(56,36,'system/monitor/job/add','添加任务','','','',2,1593740041,1593740041,0,1,1,'','',0,'sys_admin',0),(57,36,'system/monitor/job/edit','修改任务','','','',2,1593740062,1593740062,0,1,1,'','',0,'sys_admin',0),(58,36,'system/monitor/job/start','开启任务','','','',2,1593740105,1593740105,0,1,1,'','',0,'sys_admin',0),(59,36,'system/monitor/job/stop','停止任务','','','',2,1593740139,1593740139,0,1,1,'','',0,'sys_admin',0),(60,36,'system/monitor/job/delete','删除任务','','','',2,1593740165,1593740165,0,1,1,'','',0,'sys_admin',0),(61,38,'system/monitor/loginlog/delete','删除','','','',2,1593740342,1593740342,0,1,1,'','',0,'sys_admin',0),(62,38,'system/monitor/loginlog/clear','清空','','','',2,1593740359,1593740359,0,1,1,'','',0,'sys_admin',0),(63,39,'system/monitor/operlog/delete','删除','','','',2,1593740422,1593740422,0,1,1,'','',0,'sys_admin',0),(64,39,'system/monitor/operlog/clear','清空','','','',2,1593740434,1593740434,0,1,1,'','',0,'sys_admin',0),(65,32,'system/cms/menu/add','添加栏目','','','',2,1593740504,1593740504,0,1,1,'','',0,'sys_admin',0),(66,32,'system/cms/menu/edit','修改栏目','','','',2,1593740521,1593740521,0,1,1,'','',0,'sys_admin',0),(67,32,'system/cms/menu/sort','栏目排序','','','',2,1593740549,1593740549,0,1,1,'','',0,'sys_admin',0),(68,32,'system/cms/menu/delete','删除栏目','','','',2,1593740568,1593740568,0,1,1,'','',0,'sys_admin',0),(69,35,'system/cms/news/add','添加文章','','','',2,1593740691,1593740691,0,1,1,'','',0,'sys_admin',0),(70,35,'system/cms/news/edit','修改文章','','','',2,1593740711,1593740711,0,1,1,'','',0,'sys_admin',0),(71,35,'system/cms/news/delete','删除文章','','','',2,1593740730,1593740730,0,1,1,'','',0,'sys_admin',0),(72,0,'system/model','模型管理','table','','',0,1593742999,1593742999,0,1,1,'model','',0,'sys_admin',0),(73,72,'system/model/category/list','模型分类','tree-table','','',1,1593743065,1593743065,0,1,1,'category','system/model/category/list',0,'sys_admin',0),(74,72,'system/model/info/list','模型列表','list','','',1,1593743131,1594781057,0,1,1,'list','system/model/info/list',0,'sys_admin',0),(75,0,'system/tools','系统工具','server','','',0,1594016328,1594016328,0,1,1,'system/tools','',0,'sys_admin',0),(76,75,'system/tools/build','表单构建','build','','',1,1594016392,1594016808,0,1,1,'build','system/tools/build',0,'sys_admin',0),(77,75,'system/tools/gen','代码生成','code','','',1,1594016637,1594016637,0,1,1,'gen','system/tools/gen',0,'sys_admin',0),(78,0,'system/plug','扩展管理','logininfor','','',0,1594169636,1594169636,0,1,1,'system/plug','',0,'sys_admin',0),(79,78,'system/plug/ad','广告管理','color','','',0,1594169691,1595410089,0,1,1,'adManage','',0,'sys_admin',0),(80,79,'system/plug/ad/type/list','广告位管理','nested','','',1,1594169783,1595405904,0,1,1,'adtype','system/plug/ad/type/list',0,'sys_admin',0),(81,79,'system/plug/ad/info/list','广告列表','list','','',1,1594169949,1596418803,0,1,1,'adlist','system/plug/ad/info/list',0,'sys_admin',0),(82,75,'system/tools/api','系统接口','guide','','',1,1594951684,1594951684,0,1,1,'api','system/tools/api',0,'sys_admin',0),(83,78,'system/plug/link','友情链接','cascader','','',0,1595381634,1595403122,0,1,1,'link','',0,'sys_admin',0),(84,83,'system/plug/link/type/list','分类管理','component','','',1,1595381717,1595381717,0,1,1,'type','system/plug/link/type/list',0,'sys_admin',0),(85,83,'system/plug/link/info/list','链接管理','list','','',1,1595381754,1595381754,0,1,1,'info','system/plug/link/info/list',0,'sys_admin',0),(86,1,'system/config/webSet','站点设置','system','','',1,1596420340,1596420340,0,1,1,'/webSet','system/config/webSet',0,'sys_admin',0),(106,4,'cms','cms前端展示','education','','',1,1604040725,1604040798,0,1,1,'http://localhost:8200/cms','system/cms/news/list',1,'',0);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casbin_rule` (
  `ptype` varchar(10) DEFAULT NULL,
  `v0` varchar(256) DEFAULT NULL,
  `v1` varchar(256) DEFAULT NULL,
  `v2` varchar(256) DEFAULT NULL,
  `v3` varchar(256) DEFAULT NULL,
  `v4` varchar(256) DEFAULT NULL,
  `v5` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES ('p','g_8','r_1','All','','',''),('p','g_8','r_5','All','','',''),('p','g_8','r_19','All','','',''),('p','g_8','r_20','All','','',''),('p','g_8','r_21','All','','',''),('p','g_8','r_22','All','','',''),('p','g_8','r_23','All','','',''),('p','g_8','r_24','All','','',''),('p','g_8','r_25','All','','',''),('p','g_8','r_6','All','','',''),('p','g_1','r_1','All','','',''),('p','g_1','r_5','All','','',''),('p','g_1','r_19','All','','',''),('p','g_1','r_20','All','','',''),('p','g_1','r_21','All','','',''),('p','g_1','r_22','All','','',''),('p','g_1','r_23','All','','',''),('p','g_1','r_24','All','','',''),('p','g_1','r_25','All','','',''),('p','g_1','r_6','All','','',''),('p','g_1','r_2','All','','',''),('p','g_1','r_8','All','','',''),('p','g_1','r_16','All','','',''),('p','g_1','r_17','All','','',''),('p','g_1','r_18','All','','',''),('p','g_1','r_26','All','','',''),('p','g_1','r_27','All','','',''),('p','g_1','r_29','All','','',''),('p','g_1','r_30','All','','',''),('p','g_1','r_31','All','','',''),('p','g_1','r_28','All','','',''),('p','g_1','r_33','All','','',''),('p','g_1','r_40','All','','',''),('p','g_1','r_3','All','','',''),('p','g_1','r_34','All','','',''),('p','g_1','r_36','All','','',''),('p','g_1','r_37','All','','',''),('p','g_1','r_38','All','','',''),('p','g_1','r_39','All','','',''),('p','g_1','r_4','All','','',''),('p','g_1','r_32','All','','',''),('p','g_1','r_35','All','','',''),('g','u_2','g_2','','','',''),('p','g_2','r_1','All','','',''),('p','g_2','r_5','All','','',''),('p','g_2','r_19','All','','',''),('p','g_2','r_20','All','','',''),('p','g_2','r_21','All','','',''),('p','g_2','r_22','All','','',''),('p','g_2','r_23','All','','',''),('p','g_2','r_24','All','','',''),('p','g_2','r_25','All','','',''),('p','g_2','r_6','All','','',''),('p','g_2','r_41','All','','',''),('p','g_2','r_42','All','','',''),('p','g_2','r_43','All','','',''),('p','g_2','r_2','All','','',''),('p','g_2','r_8','All','','',''),('p','g_2','r_16','All','','',''),('p','g_2','r_17','All','','',''),('p','g_2','r_18','All','','',''),('p','g_2','r_26','All','','',''),('p','g_2','r_27','All','','',''),('p','g_2','r_29','All','','',''),('p','g_2','r_30','All','','',''),('p','g_2','r_31','All','','',''),('p','g_2','r_28','All','','',''),('p','g_2','r_33','All','','',''),('p','g_2','r_40','All','','',''),('p','g_2','r_3','All','','',''),('p','g_2','r_34','All','','',''),('p','g_2','r_36','All','','',''),('p','g_2','r_37','All','','',''),('p','g_2','r_38','All','','',''),('p','g_2','r_39','All','','',''),('p','g_2','r_4','All','','',''),('p','g_2','r_32','All','','',''),('p','g_2','r_35','All','','',''),('g','u_1','g_1','','','',''),('g','u_1','g_3','','','',''),('g','u_22','g_2','','','',''),('g','u_22','g_1','','','',''),('g','u_31','g_1','','','',''),('g','u_31','g_2','','','',''),('g','u_15','g_2','','','',''),('g','u_16','g_3','','','',''),('g','u_3','g_2','','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分类父id',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目别名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  `cate_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '分类类型',
  `cate_address` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `cate_content` text COMMENT '单页内容',
  `list_template` varchar(150) DEFAULT NULL COMMENT '列表页模板',
  `content_template` varchar(150) DEFAULT NULL COMMENT '内容页模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES (16,0,9,1,0,0,'最新推荐','','','','','','','','',3,'/cms','','list/list.html','content/show.html'),(17,0,9,1,0,0,'新闻快报','','','','','','','','',1,'','','list/list.html','content/show.html'),(18,0,9,1,0,0,'科技创新','','','','','','','','',1,'','','list/list.html','content/show.html'),(19,0,9,1,0,0,'房产家居','','','','','','','','',1,'','','list/list.html','content/show.html'),(20,0,9,1,0,0,'汽车资讯','','','','','','','','',1,'','','list/list.html','content/show.html'),(21,0,9,1,0,0,'旅游攻略','','','','','','','','',2,'','','list/list.html','content/show.html'),(22,0,9,1,0,0,'体育视界','','','','','','','','',2,'','','list/list.html','content/show.html'),(23,0,9,1,0,0,'财经股票','','','','','','','','',2,'','','list/list.html','content/show.html'),(24,0,9,1,0,0,'美食天地','','','','','','','','',2,'','','list/list.html','content/show.html'),(25,0,9,1,0,0,'教育公益','','','','','','','','',2,'','','list/list.html','content/show.html'),(26,17,9,1,0,0,'国内新闻','','','','','','','','',1,'','','list/list.html','content/show.html'),(27,17,9,1,0,0,'国际新闻','','','','','','','','',1,'','','list/list.html','content/show.html'),(28,26,9,1,0,0,'时政新闻','','','','','','','','',2,'','','list/list.html','content/show.html'),(29,26,9,1,0,0,'趣文概要','','','','','','','','',2,'','','list/list.html','content/show.html'),(30,18,9,1,0,0,'创业俱乐部','','','','','','','','',2,'','','list/list.html','content/show.html'),(31,18,9,1,0,0,'区块链','','','','','','','','',2,'','','list/list.html','content/show.html'),(32,18,9,1,0,0,'互联网','','','','','','','','',2,'','','list/list.html','content/show.html'),(33,19,9,1,0,0,'新房','','','','','','','','',2,'','','list/list.html','content/show.html'),(34,19,9,1,0,0,'二手房','','','','','','','','',1,'','','list/list.html','content/show.html'),(35,20,9,1,0,0,'上市新车','','','','','','','','',2,'','','list/list.html','content/show.html'),(36,20,9,1,0,0,'用车小百科','','','','','','','','',2,'','','list/list.html','content/show.html'),(37,27,9,1,0,0,'国际时政','','','','','','','','',2,'','','list/list.html','content/show.html'),(38,27,9,1,0,0,'人文风景','','','','','','','','',2,'','','list/list.html','content/show.html');
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category_news`
--

DROP TABLE IF EXISTS `cms_category_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cid_nid_unique` (`news_id`,`category_id`) USING BTREE,
  KEY `term_taxonomy_id` (`news_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='cms应用 分类文章对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category_news`
--

LOCK TABLES `cms_category_news` WRITE;
/*!40000 ALTER TABLE `cms_category_news` DISABLE KEYS */;
INSERT INTO `cms_category_news` VALUES (242,111,24),(241,113,24),(256,115,21),(257,115,24),(244,116,24),(246,118,24),(248,119,24),(251,120,24),(255,121,23),(259,122,37),(260,123,29),(262,124,32),(268,125,33),(264,126,35),(265,127,22),(274,128,25),(271,129,21),(272,129,38),(273,130,28);
/*!40000 ALTER TABLE `cms_category_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_news`
--

DROP TABLE IF EXISTS `cms_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `news_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `is_slide` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否幻灯 1是 0否',
  `news_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `news_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `news_title` varchar(150) NOT NULL DEFAULT '' COMMENT 'post标题',
  `news_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `news_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `news_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` text COMMENT '缩略图',
  `is_jump` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否跳转地址',
  `jump_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL COMMENT '跳转地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='cms信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_news`
--

LOCK TABLES `cms_news` WRITE;
/*!40000 ALTER TABLE `cms_news` DISABLE KEYS */;
INSERT INTO `cms_news` VALUES (111,2,1,1,1,1,22,0,1603786563,1603960985,1603786513,0,' 炒面多做这一步会特香，吃一碗根本不够','','炒面是我家的日常早餐之一，也没有为什么，主要是比较耐饿，记得少时妈妈在炒面的时候，总放点咱仨姐弟喜欢的配菜，虽然说是普普通通的，但不知为啥特别香，有时想来，也不失为一种让人怀念惦记的家常美味，也可以说是家的味道','','pub_upload/2020-10-27/c6niwywhjvjcjgde1s.jpeg',0,''),(113,2,1,1,1,1,3,0,1603875574,1603960967,1603875523,0,'夏天这样做馒头，比酵母馒头省事又好吃','','饮食常常能体现一个地方的特色。北方夏天吃馒头是常事，早上一碗稀饭几个馒头，搭配适量的咸菜是北方人常吃的早餐，这样简易又营养的早餐，足以体现北方人对面食的热爱，而山西人吃面食也是全国有名的，而这边人吃馒头大都是老面发酵的方式，老面馒头吃起来劲道、麦香、柔软、又白又大，吃过的人都知道这样的老式发酵的面食才地道好吃！','','pub_upload/2020-10-28/c6oegkcicda8ecbjfl.jpg',0,''),(115,2,1,1,1,1,12,0,1603937779,1604026571,1603937711,0,'超美的三亚,5天4晚全五星酒店高大上自由行','','海南，简称“琼”，中华人民共和国省级行政区，省会海口。海南省位于中国最南端，北以琼州海峡与广东省划界，西临北部湾与广西壮族自治区和越南相对，东濒南海与台湾省对望， 东南和南边在南海中与菲律宾、文莱和马来西亚为邻。省内的三沙市是中国地理位置最南、总面积最大（含海域面积）、陆地面积最小且人口最少的地级区划。海南省下辖4个地级市，5个县级市，4个县，6个自治县；截至2017年末，全省常住人口925.76万人。','','pub_upload/2020-10-29/c6p0haeubqqsnlhejw.jpg',0,''),(116,2,1,0,1,1,1,0,1603961187,1603961253,1603961115,0,'菜市场的这4种猪肉，再便宜也不能买，主妇必看','','现如今，越来越多的小伙伴加入到无肉不欢的队伍中来，可见肉是多么勾人胃口。今天发哥要说的，是最常见的猪肉，菜场的猪肉五花八门，怎么挑选才最好呢？值得注意的是，下面这4种猪肉，再便宜也不能买。','','pub_upload/2020-10-29/c6p8s7uup7x4xymfea.jpg',0,''),(118,2,1,0,1,1,3,0,1603961393,1603961393,1603961317,0,'家常豆腐这样做，非常下饭，简单易学','','来到青海出差，吃到了好多当地的美食啊，味道正宗不说，服务还很好。其中有这样一道菜，是由肉丸、豆腐和肉块炖成的，味道很小，这边的朋友说这是当地最有特色的食物之一。遗憾的是，我实在是没有记住是什么菜名，所以大概只能吃到这一次了，一想到这里，我就觉得莫名的有些难过。','','pub_upload/2020-10-29/c6p8uohyl7kg6caoxf.jpg',0,''),(119,2,1,0,1,0,2,0,1603961644,1603961653,1603961440,0,'人莫不能饮食也，鲜能知味也','','时下，流行一种说法：懂得生活的人，是不会亏待自己的胃的；热爱生活的人，是不会让自己的心灵寂寞的。因为人最原始的需求就是由温饱而求舌尖美味，继而寻找精神上的愉悦。品味美食，总能让人得到心理上的满足，是一种让自己快乐的生活方式，是真实自然的慰藉；是一种向生命表达善意的举动，是水到渠成的升华。','','pub_upload/2020-10-29/c6p8xz30dbhcxzygv6.png',0,''),(120,2,1,0,1,1,1,0,1603961750,1604020305,1603961685,0,'超好吃的成都美食，这是一篇有味道的文章','','中国地广物博，各地饮食更是五花八门，各具持色...其中就有这样一座城市，让你来了就不想走...不是因为太美的风景驻足，而是它牢牢地拴住了一个吃货的心，如果说，在这么多城市中选择一座一定要去的城市，那肯定是吃货的天堂“天府之国”的成都啦~下面就来简单的盘点一下，成都必吃的美食吧','','pub_upload/2020-10-29/c6p8za2ovxxgp3vejs.jpg',0,''),(121,2,1,0,0,0,3,0,1604020316,1604020440,1604020308,0,'14部门联合发文 19条措施力挺扩内需促消费','','10月29日，国家发展改革委发布通知指出，国家发展改革委等14个部门共同研究制定了《近期扩内需促消费的工作方案》（以下简称《方案》）。《方案》从推动线下服务消费加速“触网”、开辟服务消费新模式、实施促进实物消费政策、加大对制造业企业支持力度等四个方面推出19条措施。','','',0,''),(122,2,1,0,1,0,0,0,1604028550,1604028655,1604028490,0,'特朗普发推提主张：美国和欧盟同时取消所有关税','','特朗普在推文中称，“欧盟明天将前往华盛顿商讨贸易协议。我有个主张，美国和欧盟同时取消所有关税、壁垒以及补贴。那样最终会被视为自由市场和公平贸易！希望他们能做到，我们是已经做好了准备——但他们不会。”','','pub_upload/2020-10-30/c6pwno8goau0ukjg3q.jpg',0,''),(123,2,1,0,0,0,1,0,1604028769,1604028769,1604028668,0,'徐峥最满意的影片,《药神》火爆背后的主创故事','','2017年3月，南京，深夜，驻组宾馆，《我不是药神》的主要演员，徐峥、周一围、王传君、谭卓、章宇、杨新鸣、李乃文围读剧本以后，开始一场场地排戏。像在话剧舞台上，演员们都十分投入，随着语气时而高昂，时而低沉，幽默、温馨、凝重等气氛在简单的小会议室里轮番上演。','','pub_upload/2020-10-30/c6pwqm121lnoncnkvs.jpg',0,''),(124,2,1,0,1,1,0,0,1604028843,1604028862,1604028801,0,'最全汇总：iPhone X Plus的传闻都在这儿了','','外界普遍预计，苹果将在两个月以后发布三款新 iPhone，包括 5.8 英寸 iPhone X 的继任者、尺寸更大的 iPhone X Plus 以及一款价格较低的 LCD iPhone 机型。我们暂且将较大英寸的 OLED 机型称为 iPhone X Plus，到目前为止，关于这款机型的传闻有很多，今天我们就来汇总一下。','','pub_upload/2020-10-30/c6pwrxducjwol7kb2q.jpeg',0,''),(125,2,1,0,1,0,2,0,1604028929,1604029262,1604028885,0,'百城住宅库存连跌35个月 三四线库存创10年新低','','随着三、四线城市楼市交易量的提升，全国百城住宅库存再次降低。截至6月底，全国百城住宅库存已经连续35个月减少。','','pub_upload/2020-10-30/c6pwsqcu6mi85nxf0g.png',0,''),(126,2,1,0,1,0,0,0,1604029060,1604029060,1604028980,0,'特斯拉Model 3高清官图公布:设计极简 配15英寸大号iPad','','特斯拉Model 3是是特斯拉Model X系列的新品，北京时间2016年4月1日11点30分在美国发布，基础售价35000美元。在开放官网预定之前，仅靠门店排队预定，Model 3的订单数量已经超过11.5万辆。','','pub_upload/2020-10-30/c6pwuapknpacaljqm5.jpg',0,''),(127,2,1,0,1,1,3,0,1604029132,1604029132,1604029092,0,'世界杯最大牌女球迷，一举动令人钦佩','','要说世界杯最大牌的女球迷，一定就是克罗地亚总统格拉巴尔·基塔罗维奇，为了支持球队，她没有像其他国家元首那样坐在VIP包厢，而是和球迷出现在看台上，这样的亲民让人钦佩。如今，克罗地亚杀入8强，接下来四分之一决赛对阵俄罗斯，格拉巴尔·基塔罗维奇也将赴现场为球队加油打气。','','pub_upload/2020-10-30/c6pwvdddc9kolqpyvu.jpg',0,''),(128,2,1,0,0,0,0,0,1604029202,1604041385,1604029162,0,'百胜中国“捐一元”开启第十一年爱心之旅','','对于贵州省三都水族自治县都江镇甲找村甲找小学的师生而言，7月24日是个美好的日子。学校里来了许多和善的叔叔阿姨，他们带着满满的爱心，为孩子们送上用心准备的礼物：精美的图书、崭新的体育用品……中国扶贫基金会执行副理事长王行最','','pub_upload/2020-10-30/c6pww9dkku60m8yrpv.jpg',0,''),(129,2,1,0,0,1,1,0,1604029355,1604029380,1604029313,0,'摩洛哥撒哈拉攻略干货，解锁网红拍照点','','撒哈拉之于我，除了三毛还有地理书上学到的世界上最大的沙漠。我想亲近沙子，想去看看这个世界上最大的猫砂盆到底长啥样。\n进撒哈拉有三种方式。一种是自驾，但是有些路段不建议自驾，且摩洛哥警察真的很坑啊啊，随便就是几百上千罚款不见了。第二种是三天两夜散拼团，一般十几个人以上，可以结识世界各地的朋友，但是拼团的住宿条件和车况不太好，听说晚上都是睡大通铺，而且不能洗澡充电。第三种是三天两夜私人团，沙漠里有独立房间，可以洗澡且是白帐篷，好看的多且是4驱越野车。私人团还有四天三夜，行程会更放松，有时间的强烈建议4天3夜。','','pub_upload/2020-10-30/c6pwy5wn1398e93sjy.jpg',0,''),(130,2,1,0,0,0,4,0,1604029504,1604029504,1604029434,0,'时政新闻眼丨五中全会公报这些新提法，即将走进你我生活','','“全面促进消费”“扎实推动共同富裕”“新型工农城乡关系”“实施乡村建设行动”“促进经济社会发展全面绿色转型”“确保二〇二七年实现建军百年奋斗目标”……这些新提法、新部署体现了鲜明的问题导向，彰显了以人民为中心的发展思想。','','pub_upload/2020-10-30/c6pwzxde4qkkciir2g.jpeg',0,'');
/*!40000 ALTER TABLE `cms_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_news_attr`
--

DROP TABLE IF EXISTS `cms_news_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_news_attr` (
  `art_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_content` text COMMENT '文章内容',
  `thumbnail` varchar(200) DEFAULT '' COMMENT '缩略图',
  `news_files` text COMMENT '附件',
  `news_file` varchar(200) DEFAULT '' COMMENT '单附件',
  `news_imgs` text COMMENT '多图片',
  `news_title` int(11) NOT NULL DEFAULT '0' COMMENT '文章标题',
  `news_info` varchar(200) NOT NULL DEFAULT '1' COMMENT '多选测试',
  `time_demo` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '时间测试',
  PRIMARY KEY (`art_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_news_attr`
--

LOCK TABLES `cms_news_attr` WRITE;
/*!40000 ALTER TABLE `cms_news_attr` DISABLE KEYS */;
INSERT INTO `cms_news_attr` VALUES (111,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b56-800x400.jpeg\" style=\"height:400px; width:800px\" /></p>\n\n<p>炒面是我家的日常早餐之一，也没有为什么，主要是比较耐饿，记得少时妈妈在炒面的时候，总放点咱仨姐弟喜欢的配菜，虽然说是普普通通的，但不知为啥特别香，有时想来，也不失为一种让人怀念惦记的家常美味，也可以说是家的味道</p>\n\n<p>犹自记得我曾问老妈为啥她炒的面那么香，她就说这有什么难，只要花小许时间和耐性，把面条煎得有点焦脆，再做后面的步骤，这样炒出的面条肯定会特别香，配点肉丝、榨菜、鸡蛋&hellip;就非常美味，后来我每逢炒面也会照着做，儿子吃了一碗肯定是不够的，还不断追问有吗？有吗？</p>\n\n<p>材料：鸡蛋面（干） 1块，肉丝 50克，榨菜 15克，鸡蛋 1个，韭菜花30克，胡萝卜 10克，蒜 5克，小葱 5克</p>\n\n<p>辅料：亚麻籽油 15克，麻油 5克</p>\n\n<p>调味：蚝油 1匙，生抽 1匙，胡椒粉 1克</p>\n\n<p>各材料，肉丝用小许盐、糖、胡椒粉腌过，韭菜花、胡萝卜切段、切丝</p>\n\n<p>鸡蛋面用沸水焯1分钟</p>\n\n<p>焯过的面条再用冷水冲过，滤去水分</p>\n\n<p>鸡蛋煎好后切小段，待用</p>\n\n<p>热锅，爆香蒜后下肉丝炒熟，再放榨菜拌一下，盛起待用</p>\n\n<p>再加点油，下面条煎至有点焦脆。加入蚝油与生抽</p>\n\n<p>调味料与面炒均匀后，再下韭菜花</p>\n\n<p>韭菜花炒至转绿后加入鸡、肉丝、榨菜、小葱</p>\n\n<p>全部材料炒透</p>\n\n<p>淋入麻油拌好，关火</p>\n\n<p>上碟即可，吃早餐啦！</p>\n','','','','',0,'1,2',1603786516),(113,'<h1><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b57-800x400.jpg\" style=\"height:400px; width:800px\" /></h1>\n\n<p>饮食常常能体现一个地方的特色。北方夏天吃馒头是常事，早上一碗稀饭几个馒头，搭配适量的咸菜是北方人常吃的早餐，这样简易又营养的早餐，足以体现北方人对面食的热爱，而山西人吃面食也是全国有名的，而这边人吃馒头大都是老面发酵的方式，老面馒头吃起来劲道、麦香、柔软、又白又大，吃过的人都知道这样的老式发酵的面食才地道好吃！</p>\n\n<p>回老家就是能吃地道的面食。老妈经常给我们做各种各样的面食，花卷、馒头、各种菜馅儿包子、面条&hellip;&hellip;凡是常吃的老妈都要做一遍。今天做了孩子最喜欢吃的奶香馒头，这样的馒头特别适合孩子吃，营养翻倍，口感柔软香甜，孩子特别喜欢吃！</p>\n\n<p>制作配料：面粉300克 食用碱适量 小苏打适量 温水适量 奶粉20克</p>\n\n<p>制作方法：</p>\n\n<p>1、面粉用温水和成面团，放在温暖的地方发酵成蜂窝状；</p>\n\n<p>2、发酵好的面团放入适量食用碱、小苏打；</p>\n\n<p>3、直到面团变得蓬松又紧致，再加入奶粉揉均匀；</p>\n\n<p>4、切开面团看有很多细小的空洞；</p>\n\n<p>5、面团确定好碱水量，搓成长条，切成大小一致的小剂子；</p>\n\n<p>6、均匀地摆放在蒸笼屉上；</p>\n\n<p>7、开水上锅蒸15分钟左右即可；</p>\n\n<p>【注意事项】</p>\n\n<p>老面发酵的馒头最重要就是碱水量的控制，碱水量大了发黄，碱水量小了就发酵不起来，如果新手做，就要上锅测试碱水量是否合适；</p>\n','','[{\"name\":\"b57-800x400.jpg\",\"status\":\"success\",\"uid\":1603875652444,\"url\":\"pub_upload/2020-10-28/c6oeguxwjjv4rm8zja.jpg\"}]','','',0,'1',1603875527),(115,'<p><img alt=\"\" src=\"http://localhost:8200/pub_upload/2020-10-29/c6p0hgixeelomzqqt5.jpg\" style=\"height:400px; width:800px\" /></p>\n\n<p>海南，简称&ldquo;琼&rdquo;，中华人民共和国省级行政区，省会海口。海南省位于中国最南端，北以琼州海峡与广东省划界，西临北部湾与广西壮族自治区和越南相对，东濒南海与台湾省对望， 东南和南边在南海中与菲律宾、文莱和马来西亚为邻。省内的三沙市是中国地理位置最南、总面积最大（含海域面积）、陆地面积最小且人口最少的地级区划。海南省下辖4个地级市，5个县级市，4个县，6个自治县；截至2017年末，全省常住人口925.76万人。</p>\n\n<p>海南省陆地（主要包括海南岛和西沙群岛、中沙群岛、南沙群岛）总面积3.54万平方公里， 海域面积约200万平方公里。海南岛是仅次于台湾岛的中国第二大岛，海南省是中国国土面积（含海域）第一大省。 海南别称琼崖、琼州，西元前110年，中央政府在海南岛设置珠崖郡、儋耳郡，属交州刺史管辖，标志着海南正式纳入中国版图。1988年4月13日，海南行政区从广东省划出，独立建省，海南省和海南经济特区正式成立。海南经济特区是中国最大的，也是唯一的省级经济特区。</p>\n\n<p>2018年4月13日，党中央决定支持海南全岛建设自由贸易试验区，支持海南逐步探索、稳步推进中国特色自由贸易港建设，分步骤、分阶段建立自由贸易港政策和制度体系。</p>\n\n<p>2018年6月3日，经海南省委、省政府深入调研、统筹规划，决定设立海口江东新区，将其作为建设中国（海南）自由贸易试验区的重点先行区域。</p>\n\n<p>三亚北靠高山，南临大海，地势自北向南逐渐倾斜，形成一个狭长状的多角形。境内海岸线长258.65千米，有大小港湾19个。主要港口有三亚港、榆林港、南山港、铁炉港、六道港等。主要海湾有三亚湾、海棠湾、亚龙湾、崖州湾、大东海湾、月亮湾等。有大小岛屿40个，主要岛屿10个。</p>\n\n<p>三亚拥有200万平方千米的南海，自己的海岸线长度是209千米，管辖的海域面积5000平方千米，拥有土地面积是1919.6平方千米。</p>\n\n<p>三亚市区三面环山，北有抱坡岭，东有大会岭、虎豹岭和海拔393米的高岭（狗岭），南有南边岭，形成环抱之势，山岭绵延起伏、层次分明；同时，山脉的延伸将市区分成若干青山围成的空间，为城市不同地区提供了各具特色的空间景观环境。三亚面临南海，海湾较多，众多海湾各有佳景。处于市区的大东海、小东海、三亚湾与市民生活的关系最为密切。</p>\n','','','','',0,'1',1603937714),(116,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b54-800x400.jpg\" style=\"height:400px; width:800px\" /></p>\n\n<p>现如今，越来越多的小伙伴加入到无肉不欢的队伍中来，可见肉是多么勾人胃口。今天发哥要说的，是最常见的猪肉，菜场的猪肉五花八门，怎么挑选才最好呢？值得注意的是，下面这4种猪肉，再便宜也不能买。</p>\n\n<p>1.按压无弹性</p>\n\n<p>新鲜的猪肉质地紧密而富有弹性，宝宝们买的时候用手指按压一下，凹陷会立刻复原。如果猪肉贮藏时间过长或被注水，其中的蛋白质和脂肪会逐渐分解，从而使肌纤维被破坏，这将导致猪肉表面失去弹性。</p>\n\n<p>2.摸起来黏手</p>\n\n<p>注意啦，新鲜的猪肉外表应是微干或湿润的，其切面会有点潮湿，摸起来有油质感，但不黏手。如果摸起来黏手，是猪肉变质的标志。</p>\n\n<p>3.表面没光泽</p>\n\n<p>看起来没有光泽，表面或面呈灰色或暗红色，表皮脂肪有部分淡绿色的污秽，这样的猪肉是很不新鲜的。新鲜猪肉为淡红色或淡粉色，表皮肥肉部分呈有光泽的白色。</p>\n\n<p>4.肥肉层太薄</p>\n\n<p>一般来讲，普通品种的猪肉肥膘较厚，而杂交品种的猪肉肥膘较薄。需要注意的是，含瘦肉精的猪肉除了异常鲜艳外，其皮下肥肉层也较薄，通常不足1厘米，肌纤维比较疏松，对于这种肉，要谨慎购买。</p>\n\n<p>最近有很多粉丝在群里问发哥，不同的排骨怎么烹饪。其实排骨是猪肋骨的统称，包含了肋排、脊骨、大排、前排等，每一种适合的烹饪方式也有不同，下面发哥就带你来详细了解一下，厨房小白看过来！</p>\n\n<p>1.大排大排也叫中排，因地域差别各个地方有各个地方的叫法。大排在猪身上的腹腔部位，也就是到三线肉那点，大排肉质鲜嫩，无论是煲汤、蒸制，还是做糖醋排骨、粉蒸排骨都很适合。</p>\n\n<p>2.前排前排也称小排，同时也分无颈前排和带颈前排。最佳用处：因为前排身处猪靠颈部，骨骼相对粗大些，肉质还是很细嫩的所有建议煲汤、红烧等。</p>\n\n<p>3.精肋排</p>\n\n<p>精肋排是猪身上最好的排骨，精肋排的特点是除去了多余的大骨，排骨上面的肉包裹均匀饱满，所以这样的排骨通称精肋排，很适合用来做糖醋排骨，香酥排骨等。</p>\n\n<p>4.子排子排是指腹腔连接背脊的部位，呈三角形斜切片状。子排的肉层很厚。适合炸、烤、红烧，长度以5～7厘米为宜。</p>\n','','','','',0,'1',1603961145),(118,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b55-800x400.jpg\" style=\"height:400px; width:800px\" /></p>\n\n<p>来到青海出差，吃到了好多当地的美食啊，味道正宗不说，服务还很好。其中有这样一道菜，是由肉丸、豆腐和肉块炖成的，味道很小，这边的朋友说这是当地最有特色的食物之一。遗憾的是，我实在是没有记住是什么菜名，所以大概只能吃到这一次了，一想到这里，我就觉得莫名的有些难过。</p>\n\n<p>这道菜中最好吃的就是豆腐了，所以为了表达我的深切怀念，我决定要做一个常做的菜，那就是家常豆腐。</p>\n\n<p>准备食材：豆腐、木耳、青椒、葱末、蒜末等。</p>\n\n<p>1、将豆腐切成薄的三角片状，留以备用。</p>\n\n<p>2、起锅烧油，将豆腐放在锅中煎炸。</p>\n\n<p>3、在豆腐呈现金黄色的时候，翻面继续煎炸，双面呈现金黄色之后捞出。</p>\n\n<p>4、将准备好的辣椒切成块状。</p>\n\n<p>5、另起锅烧油，将准备好的葱末、蒜末放在锅中进行爆香。</p>\n\n<p>6、郫县豆瓣酱来一勺子，放在锅中。</p>\n\n<p>7、将煎炸过的豆腐放进锅中，进行翻炒。</p>\n\n<p>8、将泡发的木耳放在锅中，进行翻炒。</p>\n\n<p>9、再在锅中放入适当的清水。</p>\n\n<p>10、加入一点点的白糖。</p>\n\n<p>11、将切好的辣椒放在锅中，进行翻炒。</p>\n\n<p>12、搞点水淀粉放在锅中，大火收锅就可以盛出来了。</p>\n\n<p>这道菜就做好了！这个形状的豆腐特别的好吃，大概是因为豆腐很少做成这个形状的吧！</p>\n','','','','',0,'1',1603961319),(119,'<p>时下，流行一种说法：懂得生活的人，是不会亏待自己的胃的；热爱生活的人，是不会让自己的心灵寂寞的。因为人最原始的需求就是由温饱而求舌尖美味，继而寻找精神上的愉悦。品味美食，总能让人得到心理上的满足，是一种让自己快乐的生活方式，是真实自然的慰藉；是一种向生命表达善意的举动，是水到渠成的升华。</p>\n\n<p>美食可以是一种习惯，能让生活变得怡然自乐，称心快意。在我看来，食物的美，既有食物本身带给味蕾的美妙，又有源自生活中的点滴快乐。拥有美食和享受美食的快乐，是构成幸福生活的重要部分。</p>\n\n<p>在那个物质极度匮乏的年代，为了果腹，偷桃摘李，摸瓜挖薯；为了满足舌尖的刺激，遇上有亲戚朋友办喜事，不管是否方便，要么眼泪一行鼻涕一把地哭求，要么在地上撒泼打滚，都要跟着大人去，蹭鱼蹭肉蹭好吃的。</p>\n\n<p>车尔尼雪夫斯基说&ldquo;美是生活&rdquo;。在我眼里，美食是精致的生活。喜欢美食，就像人要吃喝拉撒一样自然，那是浸润在骨子里的一种基因、一种传承。可以不喝酒、不抽烟、不打牌，但对于美食，会想方设法去吃、去品。</p>\n\n<p><img alt=\"\" src=\"https://inews.gtimg.com/newsapp_bt/0/11457249193/641\" /></p>\n\n<p>生活的山城不大，口袋上不殷实，却喜欢走大街钻小巷，追寻各种美食。家乡的酸、辣刺激，外来的香、甜可口，夜市摊点的惬意、街边小吃的欢畅、酒店佳肴的舒适，&ldquo;吃&rdquo;味道，注重吃的艺术，早已与生活融为一体。</p>\n\n<p>出差在外，同样沉迷于遍尝不同地方特色美食，川菜的麻辣、 粤菜的鲜嫩、 苏菜的精细、 浙菜的花样、湘菜的熏辣、 徽菜的醇厚&hellip;&hellip;时间长了，尝过的美食大都已有些模糊，但每当想起北京的烤鸭、炒肝、爆肚，上海的生煎包、五香豆、松饼，广州的肠粉、老火靓汤、叉烧包，南京的盐水鸭、梅花糕、茴香豆，依然口舌生津。</p>\n\n<p>关于食的境界 ，《中庸》有言：&ldquo;人莫不能饮食也，鲜能知味也。&rdquo;食是件容易的事，但能食好的人不多。</p>\n\n<p>有人说，家是美味。要留住一个人，就要留住他（她）的心；要留住他（她）的心，不妨留住他（她）的胃。</p>\n\n<p><img alt=\"\" src=\"https://inews.gtimg.com/newsapp_bt/0/11457250797/641\" /></p>\n\n<p>习惯了家里的锅碗瓢盆、油盐酱醋，也许是春天增强胃动力的人参叶，也许是仲夏口舌生香的石螺，也许是深秋醇香浓郁的酿豆腐，也许是寒冬酣畅淋漓的酸酒鸭，还有很多童年的、曾经的味道。这是来自家的浓情和爱意，是非比寻常的滋味。当这一切充盈心胃的时候，作为家庭的一份子，我能找到一份心灵的平静，在某个角落里慢慢咀嚼，轻轻回味静谧美好的岁月。</p>\n\n<p>回望过去，我看过很多好书，读过很多美文。在看过的这些书中，尤爱有关美食的美文。</p>\n\n<p>写美食，很容易落人口实，有炫耀之嫌。但汪曾祺先生写美食，平淡中充满了力量的智慧光芒。他真心爱生活，真情过日子，是润物细无声的那种爱和情，看似像房前屋后的溪流一样平静，却又是律动的，温馨、隽永、唯美、崇尚自然，又有绵延悠长的神韵。</p>\n\n<p>汪老先生写美食的美文，都是日常小菜，经他的妙笔，不但没有了油腻的柴火味，还成了诱人的美文，特别有味道。品读他的文字就像在审美，会觉得连纸张的味道都变得清香。在《家常酒菜》中，写了六道凉拌菜、四道热菜。他把老家江苏高邮拌枸杞头拌荠菜的方法，用来拌菠菜，十几道工序娓娓道来，写得生动有趣又井然有序，几乎可以当作菜谱。粗粗浏览一遍，就已食欲蠢蠢，垂涎欲滴。还有《故乡的食物》、《故乡的元宵》、《故乡的野菜》、《鱼我所欲也》、《萝卜》、《豆腐》、《蚕豆》等等，这些，都已成为我深深的记忆，就像镌刻在脑海中儿时吃过的美食。</p>\n\n<p><img alt=\"\" src=\"https://inews.gtimg.com/newsapp_bt/0/11457252297/641\" /></p>\n\n<p>很多时候，都期盼着这么一种情景：在如诗如画的田园中，置一小桌，品着家乡的美食，在古筝的弹奏声中，捧美文在手，或激情朗诵，或无声阅读。即使筚路蓝缕，余生繁琐，清贫如洗，也会甘之如饴。</p>\n\n<p>美食，爱其成瘾，遍寻无方，常令我左支右绌。当人生经历了诸多不顺，当嗜书赏文成了生命中的典藏，我懂得了挫折会来也会远去，眼泪会流也会止住。就如手中的掌纹，无论多么曲折，却掌握在自己的手里。</p>\n\n<p>品读美文让我变得纯真朴实，善良如初。走自己的路，看自己的景，唱自己的歌，纵然自己还做不到清新寡欢，但有美食美文相伴的日子，同样活色生香，有滋有味；开始书写文字的日子，时光不再孤寂，岁月不再寒冷，生命变得淡然优雅。</p>\n\n<p>&ldquo;文章千古事，得失寸心间。&rdquo;文字很浅，人生很深；人生短暂，文字悠长。思我所思，写我所想，期冀自己的文字，像冬日暖阳，能给人以温暖。</p>\n\n<p>&ldquo;一夕懂珍馐，一生恋其味&rdquo;。美食，让我经历，让我珍惜，也让我学会；美文，让我思考，让我懂得，更让我沉淀。</p>\n\n<p>美食如文，美文如食，二者可皆得，二者都不可负。</p>\n','','','','',0,'1',1603961590),(121,'<p>10月29日，国家发展改革委发布通知指出，国家发展改革委等14个部门共同研究制定了《近期扩内需促消费的工作方案》（以下简称《方案》）。《方案》从推动线下服务消费加速&ldquo;触网&rdquo;、开辟服务消费新模式、实施促进实物消费政策、加大对制造业企业支持力度等四个方面推出19条措施。</p>\n\n<p>　　《方案》提出，积极支持餐饮恢复发展。鼓励有条件的地方在做好常态化疫情防控、不影响周边居民正常生活的前提下，有序恢复酒吧、 咖啡店、餐饮店等经营，因地制宜，放宽临时外摆限制。</p>\n\n<p>　　《方案》指出，加大对城镇老旧小区改造的支持。加快落实支持城镇老旧小区居民提取住房公积金，用于加装电梯等自住住房改造个人支付部分的政策。鼓励各地对城镇老旧小区有条件的楼栋加装电梯。</p>\n\n<p>　　《方案》要求，开展&ldquo;大家电安全使用年限提醒&rdquo;活动。鼓励相关社会团体制定家用电器安全使用和更新换代的团体标准，开展&ldquo;大家电安全使用年限提醒&rdquo;活动，促进相关标准有效实施，推动超龄大家电更新换代。</p>\n\n<p>　　《方案》提出，加快推进5G网络基站建设。通过进一步扩大电力市场化交易、推动转供电改直供电、加强转供电环节价格监管等措施，进一步降低5G基站运行电费成本。支持各地在站址资源获取、资金补贴等方面加大对5G网络建设的支持力度。</p>\n\n<p>　　《方案》还明确，进一步扩大&ldquo;同线同标同质&rdquo;实施范围。将内外销产品&ldquo;同线同标同质&rdquo;实施范围扩大到一般消费品和工业品，促进出口企业的优质产品在国内市场竞争中开拓局面。</p>\n','','','','',0,'1',1604020310),(122,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b40-800x400.jpg\" style=\"height:400px; width:800px\" /></p>\n\n<p>当地时间周二（24日），美国总统特朗普发布推文，主张美国和欧盟同时取消所有关税、壁垒以及补贴。</p>\n\n<p>特朗普在推文中称，&ldquo;欧盟明天将前往华盛顿商讨贸易协议。我有个主张，美国和欧盟同时取消所有关税、壁垒以及补贴。那样最终会被视为自由市场和公平贸易！希望他们能做到，我们是已经做好了准备&mdash;&mdash;但他们不会。&rdquo;</p>\n\n<p>美国6月1日起向欧盟、加拿大和墨西哥的钢铝产品加征高关税，同时正在考虑向这三方的汽车及其零配件加征关税。美国政府还对其他国家采取关税制裁。</p>\n\n<p>对此，欧盟经济和金融事务委员皮埃尔&middot;莫斯科维奇22日说，美国政府对欧盟的贸易制裁&ldquo;不合适&rdquo;，陷入贸易争端的欧美本应&ldquo;像盟友一样&rdquo;行事。</p>\n\n<p>容克定于25日访问美国，会见美国总统特朗普。在美国政府挑起对欧贸易争端的背景下，容克此行能否缓和局势，防止对峙升级，成为国际舆论关注焦点。</p>\n\n<p>有媒体分析指出，面对公开把欧盟称为&ldquo;敌人&rdquo;的特朗普，容克这次也是有备而来，一方面坚持强硬立场和做好反制准备，另一方面表示愿意通过谈判解决争端。但欧盟&ldquo;软硬兼施&rdquo;的策略能否奏效，仍存变数。</p>\n\n<p>欧盟方面多次表示，如果美欧会谈不利，则也已备好后手：美方若执意出台汽车税，欧盟已在考虑反制清单，其中将考虑对美产煤炭、药品和化学产品等征收报复性关税。此前，欧盟已经警告美国，如对全球实施汽车税，将引发全面贸易战，全球反制措施将涉及3000亿美元的美国产品，即涵盖美国对外出口19%的产品。</p>\n','','','','',0,'1',1604028497),(123,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/12.jpg\" style=\"height:345px; width:550px\" /></p>\n\n<p>2017年3月，南京，深夜，驻组宾馆，《我不是药神》的主要演员，徐峥、周一围、王传君、谭卓、章宇、杨新鸣、李乃文围读剧本以后，开始一场场地排戏。像在话剧舞台上，演员们都十分投入，随着语气时而高昂，时而低沉，幽默、温馨、凝重等气氛在简单的小会议室里轮番上演。</p>\n\n<p>&ldquo;做制片人10多年，现在别说排戏了，有些剧演员能给足拍摄时间就不错了，药神的情况很珍贵，特别久违，这个口碑我一点都不意外，拍不好我才意外呢。&rdquo;制片人王易冰说。</p>\n\n<p>他点了根烟，靠向沙发，身后的白板上写满《我不是药神》的点映场次，几点，在哪，几号厅。</p>\n\n<p>近来主创们都忙得够呛，虽然对口碑很有信心，但其传播速度和影响层次还是出乎意料。事实上，影片的前期宣传声量并不大，数据也相当平淡，团队都暗暗着急。</p>\n\n<p>但点映以后《我不是药神》口碑爆发，&ldquo;自来水&rdquo;灌满朋友圈，豆瓣评分高达9分，上一部&ldquo;9分华语片&rdquo;还是16年前的《无间道》。</p>\n\n<p>有业内人士预测《药神》票房将破40亿，甚至挑战《战狼2》。而王易冰和宁浩都坦言，这部电影的上映，就是最大的成功。</p>\n\n<p>《药神》的投资在1亿多，团队此前预期的票房是4到5亿。截止首映日目前，药神收获了3亿票房，猫眼专业版预测票房33.6亿。</p>\n\n<p>毫无疑问的是，今年这个暑期档，《我不是药神》抢先掀起了一波热潮，药神现象初显。对此，娱乐资本论策划了一系列稿件，试图从制作幕后、创作考量、幕后资本，乃至社会话题角度剖析这部现象级影片火爆的根源。</p>\n\n<p>先上制作篇。</p>\n\n<p>&ldquo;我们舍弃了更大牌，但不给足够时间的演员&rdquo;</p>\n\n<p>徐峥：&ldquo;这是我演艺生涯迄今为止最满意的影片。&rdquo;王易冰：&ldquo;这是我从业18年做过的最好的电影之一。&rdquo;</p>\n\n<p>被两位资深从业者用这样的话形容，我们不禁好奇，纵使外界赞誉很多，参与了内部创作的人也能够如此放言吗？从他们的视角看，《我不是药神》究竟好在哪？</p>\n\n<p>王易冰用了一个词&mdash;&mdash;非常团结。</p>\n\n<p>&ldquo;这很难得， 老实说我拍了这么多年，各种各样的剧组状况都碰到，闹矛盾的，争利益的，所以药神这个剧组的团结尤为珍贵。&rdquo;</p>\n\n<p>能够凑齐一个向心力强的团队，首当其冲是选角考量。他们建议导演舍弃了一些可能更大牌，但不愿意给出时间的演员。</p>\n\n<p>&ldquo;我不相信演员下了飞机到现场穿上衣服就知道怎么演这场戏，那些拍两天又走的，能有好的创作吗？&rdquo;剧组要求主要演员提前两个星期进组观察磨合。</p>\n\n<p><strong>&ldquo;做有尊严的电影&rdquo;</strong></p>\n\n<p>　　&ldquo;这个片子能够出来太难了。&rdquo;团队内外都有人向河豚君感慨。</p>\n\n<p>　　&ldquo;中国只有一种病，穷病。&rdquo;&ldquo; 他才只有二十岁，他只是想活着，他有什么罪！&rdquo;《我不是药神》中的几句台词引发了巨大的讨论和共鸣。这样现实主义题材的出现，聚焦慢粒白血病，关乎社会民生，涉及国家公检法机关，让影迷们激动地说中国终于出现了一部可以在拍出《出租车司机》《熔炉》的韩国面前挺直腰杆儿的电影，人们开始期待药神的出现能推动现实层面的进步。</p>\n\n<p>　　王易冰则谈了一个让他颇有感触的评论，有影评人看完药神后写道：&ldquo;找回尊严，做电影的尊严！&rdquo;</p>\n\n<p>　　他的感触在于：&ldquo;最近这几年大家对于拍电影这件事有各种各样的声音，觉得挺乱的，烂片、骗钱、泡沫&hellip;&hellip;有时候会觉得你自己在干的这个事是不是有点&hellip;&hellip;没劲。所以看到&lsquo;尊严&rsquo;这个词印象就比较深，其实就是尊重&mdash;&mdash;这个事你做完以后能得到其他人的尊重，你会觉得这是个有意义的事。&rdquo;</p>\n\n<p>　　进一步解读这句&ldquo;意义&rdquo;，回顾这次《我不是药神》的制作和宣发，是一场从制片人、导演、监制、演员、宣发，到全团队的通力合作。背后透露的是一份实打实的对电影的诚意和观众的尊重。《药神》的现象化，也给中国认真做电影的人带去了鼓励，在当下，专注去做一部尊重创作和观众的电影依然是必经之路，没有捷径。</p>\n','','','','',0,'1',1604028722),(124,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/36.jpeg\" style=\"height:316px; width:474px\" /></p>\n\n<p>外界普遍预计，苹果将在两个月以后发布三款新 iPhone，包括 5.8 英寸 iPhone X 的继任者、尺寸更大的 iPhone X Plus 以及一款价格较低的 LCD iPhone 机型。我们暂且将较大英寸的 OLED 机型称为 iPhone X Plus，到目前为止，关于这款机型的传闻有很多，今天我们就来汇总一下。</p>\n\n<p><strong>尺寸和设计</strong></p>\n\n<p>iPhone X Plus 很可能采用与现有 iPhone X 相同的设计，只是尺寸更大。它同样采用无边框设计，没有 Home 键，顶部有一个用于存放人脸识别组件的凹槽。</p>\n\n<p>之前供应链的设计图显示，该设备的尺寸为 157.53mm x 77.44mm x 7.85mm。作为比较，目前 iPhone 8 Plus 的尺寸为 158.4mm x 78.1mm x 7.5mm。这意味着 iPhone X Plus 可能会更短、更窄，但会更厚一点。</p>\n\n<p>在其他方面，我们预计 iPhone X Plus 将采用与当前 iPhone X 相同的玻璃背面和不锈钢边框。一份报告还暗示，它可能会提供新的金色配色，并且支持双卡双待。</p>\n\n<p><strong>显示屏幕</strong></p>\n\n<p>iPhone X Plus 预计将搭载 6.4 英寸的 OLED 显示屏，ppi 在 480-500 之间，分辨率约为 1242 x 2688。相比之下，目前的 iPhone X 和 iPhone 8 Plus 分别为 458ppi 和 401ppi。与 iPhone 8 Plus 的 LCD 屏幕相比，OLED 屏幕在色彩显示方面会有更好的表现。</p>\n\n<p>虽然早些时候的一些报道称，iPhone X Plus将采用 6.5 英寸的屏幕，但最新的设计图显示，实际可用的屏幕尺寸为 6.4 英寸。不论如何，iPhone X Plus 的显示屏都将明显大于 iPhone 8 Plus，但其机身尺寸几乎相同。</p>\n\n<p><strong>性能</strong></p>\n\n<p>台积电最近开始大规模生产一款 7 纳米处理器，该处理器将用于今年的 iPhone 系列。这款处理器很可能会被苹果公司命名为 A12。目前，iPhone X 使用的是 A11 仿生处理器。</p>\n\n<p>值得注意的是，A12 是苹果首款基于 7 纳米设计的处理器，比过去的 10 纳米处理器更快、更小、更高效。另外，iPhone X Plus 的运行内存可能会比 iPhone X 和 iPhone 8 Plus 的 3GB 更大一些，达到 4GB。</p>\n\n<p>虽然有传言说 2018 年的 iPhone 机型将完全转向 USB-C，但最近的一份报告显示，苹果今年还会继续使用 Lightning 接口，不过该报告还暗示，苹果将在盒子里提供 USB-C 至 Lightning 充电线缆，以及 USB-C 充电器。</p>\n\n<p><strong>相机</strong></p>\n\n<p>据说，iPhone X Plus 将搭载与目前的 iPhone X 相同的双摄像头设置，这意味着新机将获得一个广角镜头和一个长焦镜头，用于人像模式等功能。虽然一些人最初认为今年将是 iPhone 进入三摄像头设计的年份，但事实似乎并非如此。</p>\n\n<p>不过，目前仍不清楚的是，这款双摄像头设备将采用何种技术。iPhone X 的摄像头像素达到 1200 万，而我们无法确定 iPhone X Plus 是否会在这方面做出任何改进。</p>\n\n<p><strong>价格</strong></p>\n\n<p>对于许多对 iPhone X Plus 满怀希望的用户来说，最可怕的事情之一就是价格。2017 年的 iPhone X 起售价为 999 美元，很多人担心 iPhone X Plus 的价格会高得吓人。</p>\n\n<p>然而，分析师们似乎并不这么认为。一位分析师表示，由于去年发布的 iPhone X 并没有带来真正的&ldquo;超级周期&rdquo;，因此苹果今年将把 5.8 英寸的 iPhone X 继任者降价至 899 美元，iPhone X Plus 的起售价则为 999 美元。</p>\n\n<p>值得注意的是，苹果在产品的定价方面通常会出人意料，无法提前预测。虽然硬件配置可以通过供应链进行追踪，但是定价仍无法确定。另外还有一份报告称，苹果预计 iPhone X Plus 将是今年最受欢迎的机型，甚至超过了更便宜的 LCD 机型。</p>\n\n<p><strong>发售日期</strong></p>\n\n<p>与过去几年一样，人们普遍预计苹果将在 9 月份的发布会上宣布推出 iPhone X Plus 以及其他新款 iPhone，然后在接下来的几个星期内将新机推入市场。</p>\n','','','','',0,'1',1604028805),(125,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b49-800x400.png\" style=\"height:400px; width:800px\" /></p>\n\n<p>随着三、四线城市楼市交易量的提升，全国百城住宅库存再次降低。截至6月底，全国百城住宅库存已经连续35个月减少。</p>\n\n<p>截至2018年6月底，易居研究院监测的100个城市新建商品住宅库存总量为42643万平方米，环比减少0.2%，同比减少8.0%。观察历史数据，2015年以来全国100城库存规模就呈现出持续性的下跌态势，充分体现出近三年全国去库存&ldquo;战役&rdquo;取得了较好的效果。当前全国100城库存规模相当于2012年3月份的水平，即库存规模回落到了6年前的水平。</p>\n\n<p>值得一提的是，在100个城市中，有74个城市的库存出现了同比下滑态势，其中大连、杭州和金华的同比跌幅较大，跌幅分别为56%、48%和46%。总体上说，库存同比下跌的城市数量更多，这也带动了百城库存规模出现下跌。</p>\n\n<p>住宅库存的下跌，意味着消化周期的缩短，导致有些城市可能出现供小于求的楼市供需关系。</p>\n\n<p>另一组数据显示，截至2018年5月份，100个城市新建商品住宅&ldquo;存销比&rdquo;，即库存去化周期为9.8个月，这也意味着市场仅需9.8个月的时间就能消化完这些库存，该数值与5月份持平。</p>\n\n<p>易居研究院智库中心研究总监严跃进表示，鉴于房地产行业的特性，一般来说，库存去化周期合理区间为12个月-16个月。由此可见，百城住宅库存规模偏小，不足10个月就可以卖完。</p>\n\n<p>具体来看，一线城市、二线城市、三、四线城市新建商品住宅存销比分别为13.4个月、9.7个月和9.6个月，与5月份相比，一、二线城市存销比有所反弹，而三、四线城市继续收窄。</p>\n\n<p>更重要的是，三、四线城市的存销比下跌较为明显。当前数值是2009年以来的月度最低值，即最近10年中，三、四线城市的去化周期达到了最低值。在存销比小于6个月的24个城市中，17个城市为三、四线城市。</p>\n\n<p>具体来看，在100个城市中，有19个城市的存销比大于16个月，此类城市去库存压力依然较大；有21个城市的存销比位于12个月-16个月之间，此类城市的去库存周期相对适中；有60个城市的存销比小于12个月，此类城市的去库存周期相对偏小。</p>\n\n<p>严跃进表示，2018年上半年，全国百城库存水平继续下跌，这与房屋销售行情总体不错有关系。库存规模正步入到&ldquo;缺货&rdquo;的阶段，这也可以解释今年上半年房价持续上涨的现象。</p>\n\n<p>他进一步称，2018年下半年，相关城市需要继续调整供求关系，进而稳定房价。若开发商下半年稳定不移地推进补库存战略，包括加大拿地力度和加快开工节奏，那么相关城市将有更多可售房源或库存。但是客观来说，考虑到存销比目前依然处于历史低位，要想反弹、回归到均衡值或合理值水平，仅靠半年时间其实还是略有压力的。</p>\n','','','','',0,'1',1604028889),(126,'<p><img alt=\"\" src=\"http://localhost:8200/pub_upload/2020-10-30/c6pwu12qs27obwzcfg.jpg\" style=\"height:400px; width:800px\" /></p>\n\n<p>特斯拉Model 3是是特斯拉Model X系列的新品，北京时间2016年4月1日11点30分在美国发布，基础售价35000美元。在开放官网预定之前，仅靠门店排队预定，Model 3的订单数量已经超过11.5万辆。</p>\n\n<p>2017年7月，特斯拉宣布，首批30辆Model3将在2017年7月28日举办的庆典上交付给顾客。</p>\n\n<p>截至2018年5月28日，该款车型只在美国和加拿大实现交付，特斯拉推迟Model 3的欧亚洲交付时间至2019年。 [1] 2018年6月5日 特斯拉对Model 3车型进行了升级，提升了驾驶舒适度。公司不仅升级了车辆的悬架系统，还升级了后座的配置。</p>\n\n<p><img alt=\"\" src=\"http://localhost:8200/pub_upload/2020-10-30/c6pwu61nfmk8gqwwnw.jpg\" style=\"height:400px; width:800px\" /></p>\n','','','','',0,'1',1604028986),(127,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/18-800x400.jpg\" style=\"height:400px; width:800px\" /></p>\n\n<p>要说世界杯最大牌的女球迷，一定就是克罗地亚总统格拉巴尔&middot;基塔罗维奇，为了支持球队，她没有像其他国家元首那样坐在VIP包厢，而是和球迷出现在看台上，这样的亲民让人钦佩。如今，克罗地亚杀入8强，接下来四分之一决赛对阵俄罗斯，格拉巴尔&middot;基塔罗维奇也将赴现场为球队加油打气。</p>\n\n<p>格拉巴尔&middot;基塔罗维奇今年50岁，俄罗斯世界杯期间，她关注了克罗地亚的每一场比赛，此前，她就曾出现在球迷看台上，和克罗地亚球迷一起，为自己的祖国球队加油。</p>\n\n<p>谈到克罗地亚的表现，格拉巴尔&middot;基塔罗维奇可谓是眉飞色舞，她最满意克罗地亚在对阵阿根廷时的表现，那场比赛，克罗地亚3比0大胜。此外，克罗地亚在八分之一决赛中苦战点球击败丹麦，格拉巴尔&middot;基塔罗维奇赛后还去到更衣室，对球员们表示了祝贺。</p>\n\n<p>事实上，作为一国总统，她完全可以坐在VIP包厢里，舒服的观看比赛，但是格拉巴尔&middot;基塔罗维奇没有这么做，她和球迷坐在一起，并称自己是拉拉队队长。</p>\n\n<p>接下来的四分之一决赛，格拉巴尔&middot;基塔罗维奇将确定现场观战，对阵东道主俄罗斯，克罗地亚难有必胜把握，但有了总统现场助威，相信球员们会信心倍增。</p>\n','','','','',0,'1',1604029096),(128,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b46-800x398.jpg\" style=\"height:398px; width:800px\" /></p>\n\n<p>对于贵州省三都水族自治县都江镇甲找村甲找小学的师生而言，7月24日是个美好的日子。学校里来了许多和善的叔叔阿姨，他们带着满满的爱心，为孩子们送上用心准备的礼物：精美的图书、崭新的体育用品&hellip;&hellip;中国扶贫基金会执行副理事长王行最、百胜中国首席公共事务官王立志（Alice Wang）、百胜中国首席供应链官兼塔可贝尔总经理陈玟瑞（Danny Tan）等领导，与百胜中国员工代表，全国媒体代表、志愿者们一起来到了这所位于黔南山区的乡村小学，将凝聚着千万消费者与百胜中国员工爱心的营养加餐和礼物分发到全校100多名小学生手里。</p>\n\n<p><strong>十一年的坚持，捐一元汇集大爱</strong></p>\n\n<p>&ldquo;捐一元?献爱心?送营养&rdquo;公益项目（下简称：&ldquo;捐一元&rdquo; ）项目于2008年由中国扶贫基金会携手百胜中国共同发起，向全社会号召一人捐出一元钱，为贫困地区孩子提供营养加餐，并为孩子们进行营养知识普及。目前，该项目已是百胜中国标志性企业社会责任项目，并通过百胜中国旗下遍布全国约8000家餐厅和相关的网络订餐系统向社会募捐，搭建了一个&ldquo;全民公益&rdquo;的捐款平台。甲找小学距离贵阳220公里，位于三都水族自治县县城东南，离县城45公里，但因为山路弯曲狭窄，这45公里开车就要开一个半小时以上。学校覆盖周边五个村落，其中最远的离学校有12公里，所以住校的学生占了90%以上。这意味着学校不但负责教育，也承担起孩子们的食宿照顾。2016年， &ldquo;捐一元&rdquo;公益项目进入了甲找小学，除了为孩子们提供牛奶和鸡蛋的营养加餐，也为该校捐赠了全新&ldquo;爱心厨房&rdquo;。从此，孩子们可以在学校吃上更营养更健康的餐食。截至2018年6月，&ldquo;捐一元&rdquo;项目已为贵州三都县累计投入超过320万元，受益学生约1.7万人次，为学生提供了92万份营养加餐，并为17所小学配备爱心厨房设备。活动当天，百胜中国和中国扶贫基金会的代表们为孩子们带来了精心准备的礼品，包括体育用品和优质儿童图书。百胜中国首席执行官屈翠容（Joey Wat）虽然无法亲临现场，专门委托同事为孩子们带去崭新的书包。中午，大家一起为孩子们发放营养加餐。</p>\n\n<p>中国扶贫基金会执行副理事长王行最表示：&ldquo;今年是捐一元项目的第十一年。感谢百胜中国十一年来的坚持，捐一元可以说是推动&ldquo;全民公益&rdquo;的典范，赢得了社会公众的高度认可和积极参与，累计参与公众超过一亿人次，已成为参与人数最多的全民公益项目之一。&rdquo;</p>\n\n<p>看着孩子们的笑脸，百胜中国首席公共事务官王立志女士欣慰地表示：&ldquo;我非常高兴地看到，在过去十年内，&lsquo;捐一元&rsquo;项目为数十万贫困地区的小学生提供每日营养加餐，持续改善他们的营养状况。同时这个项目也提升了45万百胜中国员工的公益意识和参与公益的主动性。更重要的是，我们通过十年的探索和努力，传播了&lsquo;人人公益&rsquo;的理念，一元钱的力量虽小，汇集起来便是大爱。就能为孩子创造更健康、更美好的未来。&rdquo;</p>\n','','','','',0,'1',1604029165),(129,'<p><img alt=\"\" src=\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/27.jpg\" style=\"height:309px; width:550px\" /></p>\n\n<p>撒哈拉之于我，除了三毛还有地理书上学到的世界上最大的沙漠。我想亲近沙子，想去看看这个世界上最大的猫砂盆到底长啥样。</p>\n\n<p>进撒哈拉有三种方式。一种是自驾，但是有些路段不建议自驾，且摩洛哥警察真的很坑啊啊，随便就是几百上千罚款不见了。第二种是三天两夜散拼团，一般十几个人以上，可以结识世界各地的朋友，但是拼团的住宿条件和车况不太好，听说晚上都是睡大通铺，而且不能洗澡充电。第三种是三天两夜私人团，沙漠里有独立房间，可以洗澡且是白帐篷，好看的多且是4驱越野车。私人团还有四天三夜，行程会更放松，有时间的强烈建议4天3夜。</p>\n\n<p>对于我这种一天不洗头就会死星人且时间不够，那必须选择可以洗澡的三天两夜私人团。经过一番对比最后选择的是心享游。私人团一般是2-6人，一般是200欧-490欧不等。可以选择每晚要住的酒店和帐篷。至于酒店我们选的是网红XALUCADADES酒店，帐篷有豪华帐篷和顶级帐篷两种，都能充电，都能洗澡，都有独立卫生间，所以我们就选择了豪华帐篷。顶级帐篷是林志玲同款，需要➕80欧一人。4个人最好，6个人最多。人不够可以跟客服要求拼人。我们三个人，就拼了一对非常非常可爱的姐弟，一路有说有笑非常有趣。</p>\n\n<p>在沙漠里可以住上这样的带卫生间有热水，还能充电的房间我已经非常满意了。</p>\n\n<p>在沙漠营地的中间，一般都会有篝火。一个高机位的构图，把远处的帐篷、沙漠，近处的篝火，营地等都拍进去。最好的状态就是两个人自然的瘫在垫子上，有一搭没一搭的聊天。或者单人照的话像我第一张图上的一个纯粹的背影也可以</p>\n\n<p>我们跟传统线路是反着来的。一般从马拉喀什出发三天两夜到非斯结束的人比较多。可是我们几个却不约而同的选择了非斯出发到马拉喀什结束。</p>\n\n<p>同行的两姐弟一个在美国留学，一个在英国留学，他们在暑假开始前相约一起来摩洛哥旅行。大家都是年轻人，所以分分钟打成了一片，谁叫我们都爱喝酒呢！</p>\n\n<p>第一天的行程基本上是在赶路，从非斯到沙漠腹地，中间会路过沙漠绿洲和沙漠中的湖泊。大概下午4点左右我们便达到了集合点。行李会有越野车带进营地，而我们可以在夕阳下骑着骆驼大约一个小时进入到沙漠营地。</p>\n\n<p>晚餐在最大的帐篷里面吃的，吃的东西非常的丰富。但是我实在是对摩洛哥饭菜不感冒，幸亏自己带了泡面和辣椒面。这简直是中国胃的福音啊。</p>\n\n<p>也不知道谁是雨神，在进沙漠的途中，天空被乌云笼罩，到了营地居然下起了大雨。什么日落？什么银河？一个都没看到！原本天气好的时候在室外开的篝火晚会唱歌什么的改成了在室内的唱歌舞蹈。。。。</p>\n\n<p>天气好的话，这里大概就是银河了吧。</p>\n\n<p>第二天一早看见外面晴空万里果断的立即换上美美的衣服来两张。撒哈拉的沙子非常的细，踩上去没有一点的扎脚。注意要拍美美的照片一定要早起！！早上太阳斜斜的光影才好看呢。</p>\n\n<p>拍沙漠一定要选择亮色的衣服，红色我个人觉得太俗。所以选择的是白色的花裙子。一定要在日出或者日落的时候拍，光打在沙上有对比的层次。站在沙丘的最边缘，踩出一条脚步也能给画面带来延伸感。可以走路或者奔跑。</p>\n\n<p>每想你一次，天上飘落一粒沙，从此形成了撒哈拉。</p>\n\n<p>一路向瓦尔扎扎特行进，沿途上可以经过很多这样的绿洲边上的城市，一边是苍凉，一边是希望。</p>\n\n<p>在沙漠绿洲的地方选择的还是那条白色底花纹的白裙子，戴的一顶白色的帽子。用的是一张竖构图，上面天空留少少，远处是沙漠，中间是城市，最近的是绿洲。</p>\n\n<p>途中会经过托德拉山谷，听说这里有个喝了可以怀孕的泉水非常的有名。有想法的宝宝可以去哦。不过这里不要离山谷太近，要注意有落石！</p>\n\n<p>第二天住的是瓦尔扎扎特的网红酒店XALUCADADES，一下车就会有人在门口唱歌迎接，在房间可以看到城市的全景，有个网红游泳池，房间也非常的有洞穴风情。</p>\n\n<p>这个酒店最有名的就是这个游泳池了，在一些房间里可以拍到沙漠里的游泳池的景色。我就是被这个游泳池吸引来的！</p>\n\n<p>除了撒哈拉，最让我期待的就是第三天的行程了。摩洛哥最美的古村落AIT BENHADDOU（阿伊特。本。杜哈筑垒村）这里在世界有名。这里是《盗墓迷城》、《星球大战》、《权利的游戏》、《红海行动》等等等等影视作品的取景地。</p>\n\n<p>在这个城里，还有一个网红拍摄点。可是去到一看，这必须得爬上隔壁的屋顶才能拍下下面这张图。不得不说的是，本来晴空万里的天空，在我要拍照的那一秒就下起了雨。。。下面都是苦笑（微笑脸）</p>\n\n<p>高机位才能把近处的人和远处的风景框在一张照片中。这张是爬上了旁边的屋顶拍摄的，这时需要的是朋友几个聊点有趣的事情，可以进行抓拍，拍最自然的时刻。这里比较难找，找当地向导，给他看图，会带你去，事先记得谈好价格。</p>\n\n<p>从城里下来可以走到河道上拍摄一个全景的大景。选的是一个露背的蓝色大裙摆裙子。大景的地方裙摆大点总是会好看的多。选好位置以后，直直往前走，让同伴多拍几张，选出一张最自然裙摆最好看的就好。</p>\n\n<p>最后一点tips：</p>\n\n<p>由于路程比较遥远，记得多多配备零食和水。路程中会有吃饭的点，但是中国胃记得备好吃的！比如辣椒面、老干妈或者方便面什么的。</p>\n\n<p>沙漠水电是限量的，所以到了沙漠记得先洗澡充电。不过我们好像没有遇到没有热水和充电的情况。请节约用水用电。</p>\n\n<p>在艾特本哈杜筑垒村请向导的话记得提前谈好价格，把照片给他看，他会带你去你想去的点。</p>\n\n<p>在托德拉山谷一定一定一定要注意山上掉下来的落石，我们在拍照的时候山上有掉下落石在朋友旁边，幸亏没有伤到人。一定要注意。</p>\n','','','','',0,'1',1604029322),(130,'<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980379506_278_1080x1622.jpeg\" /></p>\n\n<p>10月29日，党的十九届五中全会在北京闭幕。会议发表6000余字的公报，透露了丰富信息。&ldquo;四个全面&rdquo;中的第一个&ldquo;全面&rdquo;要改为&ldquo;全面建设社会主义现代化国家&rdquo;了。中等收入群体要显著扩大了。我国要实施&ldquo;乡村建设行动&rdquo;了&hellip;&hellip;公报中的许多新提法，即将走进我们的生活。</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>△联播视频丨中国共产党第十九届中央委员会第五次全体会议公报</p>\n\n<p><strong>&nbsp;新成果：勾画&ldquo;十四五&rdquo;发展蓝图&nbsp;</strong></p>\n\n<p>五中全会审议五年规划建议，近年来已成惯例。五年前的同一天，2015年10月29日，党的十八届五中全会审议通过了《中共中央关于制定国民经济和社会发展第十三个五年规划的建议》。</p>\n\n<p>今年的十九届五中全会审议通过了《中共中央关于制定国民经济和社会发展第十四个五年规划和二〇三五年远景目标的建议》。这份文件不仅谋划未来5年发展，还勾画未来15年蓝图。在此之前，1995年召开的十四届五中全会曾审议通过《中共中央关于制定国民经济和社会发展&ldquo;九五&rdquo;计划和2010年远景目标的建议》。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980438512_417_1000x750.jpg\" /></p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980449175_855_1000x750.jpg\" /></p>\n\n<p>△第三届中国国际进口博览会即将在上海举办，会展中心已准备就绪。</p>\n\n<p>五年规划建议，重在宏观性、战略性、指导性。五年规划建议通过之后，还要根据建议制定五年规划纲要，重在规定具体的工作部署。五年前，十八届五中全会审议通过&ldquo;十三五&rdquo;规划建议后，次年3月，十二届全国人大四次会议审议通过了&ldquo;十三五&rdquo;规划纲要。</p>\n\n<p>审议通过&ldquo;十四五&rdquo;规划建议，是十九届五中全会的最重要成果。明年即将开启的&ldquo;十四五&rdquo;时期，是中国向第二个百年奋斗目标进军的第一个五年。&ldquo;十四五&rdquo;规划建议将为今后一个时期中国经济社会发展指明方向、勾画蓝图。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980473822_641_1000x1335.jpeg\" /></p>\n\n<p>△10月26日，我国在西昌卫星发射中心使用长征二号丙运载火箭成功将遥感30号07组卫星送入预定轨道。这是壮观的火箭尾焰特写。</p>\n\n<p>按照惯例，在五中全会闭幕几天之后，五年规划建议将全文公布。五中全会闭幕当天发布的公报，是外界提前了解五年规划建议的重要窗口。</p>\n\n<p><strong>&nbsp;新论断：我国发展仍然处于重要战略机遇期&nbsp;</strong></p>\n\n<p>十九届五中全会公报指出，全会深入分析了我国发展环境面临的深刻复杂变化。</p>\n\n<p>今年7月30日召开的中央政治局会议，作出了今年10月在北京召开十九届五中全会的决定。那次会议作出论断：当前和今后一个时期，我国发展仍然处于战略机遇期，但机遇和挑战都有新的发展变化。此次五中全会公报把前半句修改为：我国发展仍然处于<strong>重要</strong>战略机遇期。新增的&ldquo;重要&rdquo;两字，是十分重要的判断。</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603981028451_425_1000x563.jpeg\" /></p>\n\n<p>△汽车产业是大连自贸片区的八大产业项目之一，现已形成集整车生产、零部件加工、销售、运输、平行进口汽车等全链条的汽车产业。</p>\n\n<p>另一个新提法，7月30日的政治局会议提出&ldquo;善于在危机中育新机、于变局中开新局&rdquo;，十九届五中全会公报则提出&ldquo;善于在危机中<strong>育先机</strong>、于变局中开新局&rdquo;。从&ldquo;育新机&rdquo;到&ldquo;育先机&rdquo;，强化了要下先手棋、抢抓机遇。</p>\n\n<p>《时政新闻眼》发现，在五中全会召开十多天前的中央党校（国家行政学院）中青年干部培训班开班式上，习近平总书记就开始用了&ldquo;要在危机中育先机、于变局中开新局&rdquo;这一新提法。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980535104_698_1000x563.jpeg\" /></p>\n\n<p>△中央党校校园内名为&ldquo;一大代表&rdquo;的主题雕塑</p>\n\n<p>分析环境变化，是为了作出科学决策。今年以来，习近平多次强调，<strong>必须在一个更加不稳定不确定的世界中谋求我国发展</strong>。十九届五中全会审议通过的&ldquo;十四五&rdquo;规划建议，就是要为不确定性的世界注入确定性，为中国人民瞻望可以预期的未来。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603981406951_3_1000x563.jpeg\" /></p>\n\n<p>△上海洋山港</p>\n\n<p><strong>&nbsp;新目标：国力强、人民富、底气足&nbsp;</strong></p>\n\n<p>5年之后，中国将发展到哪一步？15年之后，我们将过上什么样的生活？从十九届五中全会公报中都可以找到答案和线索。</p>\n\n<p>全会提出了&ldquo;十四五&rdquo;时期经济社会发展主要目标，主要体现在六个方面：经济发展取得新成效，改革开放迈出新步伐，社会文明程度得到新提高，生态文明建设实现新进步，民生福祉达到新水平，国家治理效能得到新提升。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980601826_832_1000x563.jpg\" /></p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980611596_692_1000x563.jpg\" /></p>\n\n<p>△国家实施长江流域禁捕退捕政策后，江苏宿迁泗洪县启动洪泽湖水域禁捕退捕和住家船整治工作。这是聚集在渔港等待拆解的渔船。</p>\n\n<p>全会提出了&ldquo;十四五&rdquo;时期经济社会发展指导思想和必须遵循的原则。全面建成小康社会胜利在望，&ldquo;四个全面&rdquo;战略布局中的第一个&ldquo;全面&rdquo;也相应修改为&ldquo;<strong>全面建设社会主义现代化国家</strong>&rdquo;。全会还鲜明提出了发展的&ldquo;主题主线&rdquo;和&ldquo;两个根本&rdquo;：以推动高质量发展为主题，以深化供给侧结构性改革为主线，以改革创新为根本动力，以满足人民日益增长的美好生活需要为根本目的。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980641183_751_1000x750.jpg\" /></p>\n\n<p>△江西吉安黄岗村，供电公司工人正在检修&ldquo;光伏+取暖&rdquo;设备，保障村民温暖过冬。</p>\n\n<p>全会还提出了到2035年基本实现社会主义现代化远景目标。三年前，习近平总书记在党的十九大曾展望了到2035年的发展目标。两相对比，新风扑面。党的十九大报告中提出的目标是&ldquo;我国经济实力、科技实力将大幅跃升&rdquo;，此次的提法是&ldquo;我国经济实力、科技实力、<strong>综合国力</strong>将大幅跃升&rdquo;。坚实的综合国力，是中国的深厚底气。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980664079_585_1000x563.jpg\" /></p>\n\n<p>△位于河套地区的深港科技创新合作区</p>\n\n<p>十九大报告提出的2035年发展目标之一是&ldquo;人民生活更为宽裕，中等收入群体比例明显提高&rdquo;，此次表述为：&ldquo;人均国内生产总值达到中等发达国家水平，中等收入群体显著扩大&rdquo;，&ldquo;全体人民共同富裕取得更为明显的实质性进展&rdquo;。从脱贫到共富，主题悄然变迁。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603980689605_787_1000x750.jpg\" /></p>\n\n<p>△山东枣庄市山亭区因地制宜发展花卉培育，带动贫困村民多渠道增收。</p>\n\n<p><strong>&nbsp;新部署：</strong><strong>人民对美好生活的向往就是我们的奋斗目标&nbsp;</strong></p>\n\n<p>&ldquo;十四五&rdquo;规划建议除了确立发展理念、方向思路，还明确了发展的重点任务、重大举措。十九届五中全会公报指出，从坚持创新在我国现代化建设全局中的核心地位，到坚持党的全面领导，全会在十几个领域作出了全面部署。许多新提法，令人瞩目。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603983661339_401_1000x563.jpeg\" /></p>\n\n<p>△江西于都，中央红军长征出发渡口</p>\n\n<p>十九届五中全会继续把创新作为推动发展的第一动力。全会首次提出，&ldquo;<strong>把科技自立自强作为国家发展的战略支撑</strong>&rdquo;。今年7月，在吉林一汽集团考察时，习近平总书记就曾强调，&ldquo;必须加强关键核心技术和关键零部件的自主研发，实现技术自立自强，做强做大民族品牌。&rdquo;面对&ldquo;卡脖子&rdquo;问题，中国科技必当自立自强。</p>\n\n<p>在加快发展现代产业体系领域，全会提出，要坚定不移建设制造强国、质量强国、网络强国、数字中国。把<strong>制造强国</strong>摆在第一位，重点体现了坚持把发展经济着力点放在实体经济上的理念。在构建新发展格局领域，全会提出，要坚持扩大内需这个战略基点，加快培育完整内需体系。<strong>培育完整内需体系</strong>，这是以国内大循环为主体的必然要求。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603982614968_851_1000x563.jpeg\" /></p>\n\n<p>△浙江长兴制造基地生产的全新一代7DCT双离合自动变速器，拥有完全自主知识产权。</p>\n\n<p>&ldquo;全面促进消费&rdquo;&ldquo;扎实推动共同富裕&rdquo;&ldquo;新型工农城乡关系&rdquo;&ldquo;实施乡村建设行动&rdquo;&ldquo;促进经济社会发展全面绿色转型&rdquo;&ldquo;确保二〇二七年实现建军百年奋斗目标&rdquo;&hellip;&hellip;这些新提法、新部署体现了鲜明的问题导向，彰显了以人民为中心的发展思想。</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"http://p1.img.cctvpic.com/cportal/cnews-yz/img/2020/10/29/1603982015006_333_1000x563.jpeg\" /></p>\n\n<p>△天安门广场，国庆大花篮</p>\n\n<p>&ldquo;好的方针政策和发展规划都应该顺应人民意愿、符合人民所思所盼，从群众中来、到群众中去。&rdquo;习近平总书记今年9月在基层代表座谈会上强调的这一理念，已经鲜明体现到了&ldquo;十四五&rdquo;规划建议之中，也将随着规划实施走进每个中国人的生活之中。</p>\n','','','','',0,'1',1604029437);
/*!40000 ALTER TABLE `cms_news_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_yjf_attr`
--

DROP TABLE IF EXISTS `cms_yjf_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_yjf_attr` (
  `art_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_content` text COMMENT '文章内容',
  PRIMARY KEY (`art_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_yjf_attr`
--

LOCK TABLES `cms_yjf_attr` WRITE;
/*!40000 ALTER TABLE `cms_yjf_attr` DISABLE KEYS */;
INSERT INTO `cms_yjf_attr` VALUES (106,'<p><img src=\"http://localhost:8200/pub_upload/2020-08-11/c4u2nxwu69iggkulk2.png\" style=\"height:2365px; width:1701px\" /></p>\n\n<p>&nbsp;</p>\n'),(107,'<p>dasdasfasfsa</p>\n\n<p>sadsadaf<img src=\"http://localhost:8200/pub_upload/2020-08-11/c4tzqrorcgmg1bqifr.png\" style=\"height:356px; width:1710px\" />ss</p>\n\n<p>safasfasf</p>\n'),(108,'<p>aaaaaaaaaaaaaaaaaaaaaaassss</p>\n'),(109,'<p>456465456456</p>\n'),(110,'<p>新闻动态第一条的具体内容在这里</p>\n');
/*!40000 ALTER TABLE `cms_yjf_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (33,'sys_dept','部门表','dept','tree','gfast','module','dept','部门','yunjie','{\"tree_code\":\"config_id\",\"tree_name\":\"config_key\",\"tree_parent_code\":\"config_name\"}','admin','2020-02-16 20:58:20','',NULL,''),(34,'model_category','模型分类表','model_category','tree','gfast','module','category','模型分类','gfast','{\"tree_code\":\"c_id\",\"tree_name\":\"create_time\",\"tree_parent_code\":\"c_name\"}','admin','2020-07-09 11:17:04','admin','2020-07-10 11:25:07',''),(35,'user','用户表','user','crud','gfast','module','user','用户','gfast','','admin','2020-07-09 11:17:04','',NULL,''),(37,'model_category','模型分类表','model_category','crud','gfast','module','category','模型分类','gfast','','admin','2020-07-09 11:44:12','',NULL,''),(38,'user','用户表','user','crud','gfast','module','user','用户','gfast','','admin','2020-07-09 11:44:13','admin','2020-07-10 11:42:07',''),(39,'model_category','模型分类表','model_category','crud','gfast','module','category','模型分类','gfast','','admin','2020-07-09 15:11:08','',NULL,''),(40,'user','用户表','user','crud','gfast','module','user','用户','gfast','','admin','2020-07-09 15:11:08','admin','2020-07-13 17:18:31','');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(500) DEFAULT NULL COMMENT 'Go类型',
  `go_field` varchar(200) DEFAULT NULL COMMENT 'Go字段名',
  `html_field` varchar(200) DEFAULT NULL COMMENT 'html字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (355,33,'dept_id','部门id','bigint(20)','int64','DeptId','deptId','1','1','0','1','0','1','1','EQ','input','',1,'admin',NULL,'',NULL),(356,33,'parent_id','父部门id','bigint(20)','int64','ParentId','parentId','0','0','0','1','1','1','1','EQ','input','',2,'admin',NULL,'',NULL),(357,33,'ancestors','祖级列表','varchar(50)','string','Ancestors','ancestors','0','0','0','1','1','1','1','EQ','input','',3,'admin',NULL,'',NULL),(358,33,'dept_name','部门名称','varchar(30)','string','DeptName','deptName','0','0','1','1','1','1','1','LIKE','input','',4,'admin',NULL,'',NULL),(359,33,'order_num','显示顺序','int(4)','int','OrderNum','orderNum','0','0','0','1','1','1','1','EQ','input','',5,'admin',NULL,'',NULL),(360,33,'leader','负责人','varchar(20)','string','Leader','leader','0','0','0','1','1','1','1','EQ','input','',6,'admin',NULL,'',NULL),(361,33,'phone','联系电话','varchar(11)','string','Phone','phone','0','0','0','1','1','1','1','EQ','input','',7,'admin',NULL,'',NULL),(362,33,'email','邮箱','varchar(50)','string','Email','email','0','0','0','1','1','1','1','EQ','input','',8,'admin',NULL,'',NULL),(363,33,'status','部门状态（0正常 1停用）','char(1)','string','Status','status','0','0','1','1','1','1','1','EQ','radio','',9,'admin',NULL,'',NULL),(364,33,'del_flag','删除标志（0代表存在 2代表删除）','char(1)','string','DelFlag','delFlag','0','0','0','1','0','0','0','EQ','input','',10,'admin',NULL,'',NULL),(365,33,'create_by','创建者','varchar(64)','string','CreateBy','createBy','0','0','0','0','0','0','0','EQ','input','',11,'admin',NULL,'',NULL),(366,33,'create_time','创建时间','datetime','Time','CreateTime','createTime','0','0','0','0','0','0','0','EQ','datatime','',12,'admin',NULL,'',NULL),(367,33,'update_by','更新者','varchar(64)','string','UpdateBy','updateBy','0','0','0','0','0','0','0','EQ','input','',13,'admin',NULL,'',NULL),(368,33,'update_time','更新时间','datetime','Time','UpdateTime','updateTime','0','0','0','0','0','0','0','EQ','datatime','',14,'admin',NULL,'',NULL),(369,34,'c_id','主键','int(10) unsigned','int','CId','cId','1','1','0','1','0','1','1','EQ','input','',1,'admin',NULL,'',NULL),(370,34,'c_name','模型分类名称','varchar(60)','string','CName','cName','0','0','1','1','1','1','1','LIKE','input','',2,'admin',NULL,'',NULL),(371,34,'c_sort','排序','int(11)','int64','CSort','cSort','0','0','0','1','1','1','1','EQ','input','',3,'admin',NULL,'',NULL),(372,34,'create_by','创建人','int(10) unsigned','int','CreateBy','createBy','0','0','0','0','0','0','0','EQ','input','',4,'admin',NULL,'',NULL),(373,34,'create_time','创建时间','bigint(20) unsigned','int64','CreateTime','createTime','0','0','0','0','0','0','0','EQ','input','',5,'admin',NULL,'',NULL),(374,34,'update_by','修改人','int(10) unsigned','int','UpdateBy','updateBy','0','0','0','0','0','0','0','EQ','input','',6,'admin',NULL,'',NULL),(375,34,'update_time','修改时间','bigint(20) unsigned','int64','UpdateTime','updateTime','0','0','0','0','0','0','0','EQ','input','',7,'admin',NULL,'',NULL),(376,34,'c_status','状态','tinyint(3) unsigned','int','CStatus','cStatus','0','0','1','1','1','1','1','EQ','radio','',8,'admin',NULL,'',NULL),(377,35,'id','','bigint(20) unsigned','int64','Id','id','1','1','0','1','0','0','0','EQ','input','',1,'admin',NULL,'',NULL),(378,35,'user_name','用户名','varchar(60)','string','UserName','userName','0','0','1','1','1','1','1','LIKE','input','',2,'admin',NULL,'',NULL),(379,35,'mobile','中国手机不带国家代码，国际手机号格式为：国家代码-手机号','varchar(20)','string','Mobile','mobile','0','0','0','1','1','1','1','EQ','input','',3,'admin',NULL,'',NULL),(380,35,'user_nickname','用户昵称','varchar(50)','string','UserNickname','userNickname','0','0','1','1','1','1','1','LIKE','input','',4,'admin',NULL,'',NULL),(381,35,'birthday','生日','int(11)','int64','Birthday','birthday','0','0','0','1','1','1','1','EQ','input','',5,'admin',NULL,'',NULL),(382,35,'create_time','注册时间','int(11)','int64','CreateTime','createTime','0','0','0','0','0','0','0','EQ','input','',6,'admin',NULL,'',NULL),(383,35,'user_password','登录密码;cmf_password加密','varchar(255)','string','UserPassword','userPassword','0','0','0','1','1','1','1','EQ','input','',7,'admin',NULL,'',NULL),(384,35,'user_status','用户状态;0:禁用,1:正常,2:未验证','tinyint(3) unsigned','int','UserStatus','userStatus','0','0','1','1','1','1','1','EQ','radio','',8,'admin',NULL,'',NULL),(385,35,'user_email','用户登录邮箱','varchar(100)','string','UserEmail','userEmail','0','0','0','1','1','1','1','EQ','input','',9,'admin',NULL,'',NULL),(386,35,'sex','性别;0:保密,1:男,2:女','tinyint(2)','int','Sex','sex','0','0','0','1','1','1','1','EQ','select','',10,'admin',NULL,'',NULL),(387,35,'avatar','用户头像','varchar(255)','string','Avatar','avatar','0','0','0','1','1','1','1','EQ','input','',11,'admin',NULL,'',NULL),(388,35,'last_login_time','最后登录时间','int(11)','int64','LastLoginTime','lastLoginTime','0','0','0','1','1','1','1','EQ','input','',12,'admin',NULL,'',NULL),(389,35,'last_login_ip','最后登录ip','varchar(15)','string','LastLoginIp','lastLoginIp','0','0','0','1','1','1','1','EQ','input','',13,'admin',NULL,'',NULL),(390,35,'dept_id','部门id','bigint(20) unsigned','int64','DeptId','deptId','0','0','0','1','1','1','1','EQ','input','',14,'admin',NULL,'',NULL),(391,35,'remark','备注','varchar(255)','string','Remark','remark','0','0','0','1','1','1','0','EQ','input','',15,'admin',NULL,'',NULL),(392,35,'is_admin','是否后台管理员 1 是  0   否','tinyint(4)','int','IsAdmin','isAdmin','0','0','0','1','1','1','1','EQ','input','',16,'admin',NULL,'',NULL),(393,37,'c_id','主键','int(10) unsigned','int','CId','cId','1','1','0','1','0','1','1','EQ','input','',1,'admin',NULL,'',NULL),(394,37,'c_name','模型分类名称','varchar(60)','string','CName','cName','0','0','1','1','1','1','1','LIKE','input','',2,'admin',NULL,'',NULL),(395,37,'c_sort','排序','int(11)','int64','CSort','cSort','0','0','0','1','1','1','1','EQ','input','',3,'admin',NULL,'',NULL),(396,37,'create_by','创建人','int(10) unsigned','int','CreateBy','createBy','0','0','0','0','0','0','0','EQ','input','',4,'admin',NULL,'',NULL),(397,37,'create_time','创建时间','bigint(20) unsigned','int64','CreateTime','createTime','0','0','0','0','0','0','0','EQ','input','',5,'admin',NULL,'',NULL),(398,37,'update_by','修改人','int(10) unsigned','int','UpdateBy','updateBy','0','0','0','0','0','0','0','EQ','input','',6,'admin',NULL,'',NULL),(399,37,'update_time','修改时间','bigint(20) unsigned','int64','UpdateTime','updateTime','0','0','0','0','0','0','0','EQ','input','',7,'admin',NULL,'',NULL),(400,37,'c_status','状态','tinyint(3) unsigned','int','CStatus','cStatus','0','0','1','1','1','1','1','EQ','radio','',8,'admin',NULL,'',NULL),(401,38,'id','','bigint(20) unsigned','int64','Id','id','1','1','0','1','0','0','0','EQ','input','',1,'admin',NULL,'',NULL),(402,38,'user_name','用户名','varchar(60)','string','UserName','userName','0','0','1','1','1','1','1','LIKE','input','',2,'admin',NULL,'',NULL),(403,38,'mobile','中国手机不带国家代码，国际手机号格式为：国家代码-手机号','varchar(20)','string','Mobile','mobile','0','0','0','1','1','1','1','EQ','input','',3,'admin',NULL,'',NULL),(404,38,'user_nickname','用户昵称','varchar(50)','string','UserNickname','userNickname','0','0','1','1','1','1','1','LIKE','input','',4,'admin',NULL,'',NULL),(405,38,'birthday','生日','int(11)','int64','Birthday','birthday','0','0','0','1','1','1','1','EQ','input','',5,'admin',NULL,'',NULL),(406,38,'create_time','注册时间','int(11)','int64','CreateTime','createTime','0','0','0','0','0','0','0','EQ','input','',6,'admin',NULL,'',NULL),(407,38,'user_password','登录密码;cmf_password加密','varchar(255)','string','UserPassword','userPassword','0','0','0','1','1','1','1','EQ','input','',7,'admin',NULL,'',NULL),(408,38,'user_status','用户状态;0:禁用,1:正常,2:未验证','tinyint(3) unsigned','int','UserStatus','userStatus','0','0','1','1','1','1','1','EQ','radio','',8,'admin',NULL,'',NULL),(409,38,'user_email','用户登录邮箱','varchar(100)','string','UserEmail','userEmail','0','0','0','1','1','1','1','EQ','input','',9,'admin',NULL,'',NULL),(410,38,'sex','性别;0:保密,1:男,2:女','tinyint(2)','int','Sex','sex','0','0','0','1','1','1','1','EQ','select','sys_user_sex',10,'admin',NULL,'',NULL),(411,38,'avatar','用户头像','varchar(255)','string','Avatar','avatar','0','0','0','1','1','1','1','EQ','input','',11,'admin',NULL,'',NULL),(412,38,'last_login_time','最后登录时间','int(11)','int64','LastLoginTime','lastLoginTime','0','0','0','1','1','1','1','EQ','input','',12,'admin',NULL,'',NULL),(413,38,'last_login_ip','最后登录ip','varchar(15)','string','LastLoginIp','lastLoginIp','0','0','0','1','1','1','1','EQ','input','',13,'admin',NULL,'',NULL),(414,38,'dept_id','部门id','bigint(20) unsigned','int64','DeptId','deptId','0','0','0','1','1','1','1','EQ','input','',14,'admin',NULL,'',NULL),(415,38,'remark','备注','varchar(255)','string','Remark','remark','0','0','0','1','1','1','0','EQ','input','',15,'admin',NULL,'',NULL),(416,38,'is_admin','是否后台管理员 1 是  0   否','tinyint(4)','int','IsAdmin','isAdmin','0','0','0','1','1','1','1','EQ','input','',16,'admin',NULL,'',NULL),(417,39,'c_id','主键','int(10) unsigned','int','CId','cId','1','1','0','1','0','1','1','EQ','input','',1,'admin',NULL,'',NULL),(418,39,'c_name','模型分类名称','varchar(60)','string','CName','cName','0','0','1','1','1','1','1','LIKE','input','',2,'admin',NULL,'',NULL),(419,39,'c_sort','排序','int(11)','int64','CSort','cSort','0','0','0','1','1','1','1','EQ','input','',3,'admin',NULL,'',NULL),(420,39,'create_by','创建人','int(10) unsigned','int','CreateBy','createBy','0','0','0','0','0','0','0','EQ','input','',4,'admin',NULL,'',NULL),(421,39,'create_time','创建时间','bigint(20) unsigned','int64','CreateTime','createTime','0','0','0','0','0','0','0','EQ','input','',5,'admin',NULL,'',NULL),(422,39,'update_by','修改人','int(10) unsigned','int','UpdateBy','updateBy','0','0','0','0','0','0','0','EQ','input','',6,'admin',NULL,'',NULL),(423,39,'update_time','修改时间','bigint(20) unsigned','int64','UpdateTime','updateTime','0','0','0','0','0','0','0','EQ','input','',7,'admin',NULL,'',NULL),(424,39,'c_status','状态','tinyint(3) unsigned','int','CStatus','cStatus','0','0','1','1','1','1','1','EQ','radio','',8,'admin',NULL,'',NULL),(425,40,'id','','bigint(20) unsigned','int64','Id','id','1','1','0','1','0','0','0','EQ','input','',1,'admin',NULL,'',NULL),(426,40,'user_name','用户名','varchar(60)','string','UserName','userName','0','0','1','1','1','1','1','LIKE','input','',2,'admin',NULL,'',NULL),(427,40,'mobile','中国手机不带国家代码，国际手机号格式为：国家代码-手机号','varchar(20)','string','Mobile','mobile','0','0','0','1','1','1','1','EQ','input','',3,'admin',NULL,'',NULL),(428,40,'user_nickname','用户昵称','varchar(50)','string','UserNickname','userNickname','0','0','1','1','1','1','1','LIKE','input','',4,'admin',NULL,'',NULL),(429,40,'birthday','生日','int(11)','int64','Birthday','birthday','0','0','0','1','1','1','','EQ','input','',5,'admin',NULL,'',NULL),(430,40,'create_time','注册时间','int(11)','int64','CreateTime','createTime','0','0','0','0','0','0','0','EQ','input','',6,'admin',NULL,'',NULL),(431,40,'user_password','登录密码;cmf_password加密','varchar(255)','string','UserPassword','userPassword','0','0','0','1','1','1','','EQ','input','',7,'admin',NULL,'',NULL),(432,40,'user_status','用户状态;0:禁用,1:正常,2:未验证','tinyint(3) unsigned','int','UserStatus','userStatus','0','0','1','1','1','1','','EQ','radio','',8,'admin',NULL,'',NULL),(433,40,'user_email','用户登录邮箱','varchar(100)','string','UserEmail','userEmail','0','0','0','1','1','1','','EQ','input','',9,'admin',NULL,'',NULL),(434,40,'sex','性别;0:保密,1:男,2:女','tinyint(2)','int','Sex','sex','0','0','0','1','1','1','','EQ','select','sys_user_sex',10,'admin',NULL,'',NULL),(435,40,'avatar','用户头像','varchar(255)','string','Avatar','avatar','0','0','0','1','1','1','','EQ','input','',11,'admin',NULL,'',NULL),(436,40,'last_login_time','最后登录时间','int(11)','int64','LastLoginTime','lastLoginTime','0','0','0','1','1','1','','EQ','input','',12,'admin',NULL,'',NULL),(437,40,'last_login_ip','最后登录ip','varchar(15)','string','LastLoginIp','lastLoginIp','0','0','0','1','1','1','','EQ','input','',13,'admin',NULL,'',NULL),(438,40,'dept_id','部门id','bigint(20) unsigned','int64','DeptId','deptId','0','0','0','1','1','1','','EQ','input','',14,'admin',NULL,'',NULL),(439,40,'remark','备注','varchar(255)','string','Remark','remark','0','0','0','1','1','1','0','EQ','input','',15,'admin',NULL,'',NULL),(440,40,'is_admin','是否后台管理员 1 是  0   否','tinyint(4)','int','IsAdmin','isAdmin','0','0','0','1','1','1','','EQ','input','',16,'admin',NULL,'',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_category`
--

DROP TABLE IF EXISTS `model_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_category` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `c_name` varchar(60) NOT NULL DEFAULT '' COMMENT '模型分类名称',
  `c_sort` int(11) NOT NULL COMMENT '排序',
  `create_by` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_by` int(10) unsigned NOT NULL COMMENT '修改人',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `c_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='模型分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_category`
--

LOCK TABLES `model_category` WRITE;
/*!40000 ALTER TABLE `model_category` DISABLE KEYS */;
INSERT INTO `model_category` VALUES (1,'政府工作目标管理',0,1,1594000376,2,1596530619,1),(5,'测试分类',0,1,1594016237,2,1596530640,1),(6,'cms',0,1,1595316172,1,1595316184,1);
/*!40000 ALTER TABLE `model_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_fields`
--

DROP TABLE IF EXISTS `model_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_fields` (
  `field_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型字段ID',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `field_name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名称',
  `field_title` varchar(60) NOT NULL DEFAULT '' COMMENT '字段标题',
  `field_type` varchar(30) NOT NULL DEFAULT '' COMMENT '字段类型',
  `field_length` varchar(50) NOT NULL DEFAULT '' COMMENT '字段长度',
  `field_default` varchar(150) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `field_data` varchar(255) NOT NULL DEFAULT '' COMMENT '字段数据',
  `field_desc` varchar(150) NOT NULL DEFAULT '' COMMENT '字段描述',
  `field_rules` varchar(150) NOT NULL DEFAULT '' COMMENT '字段规则',
  `field_sort` bigint(20) NOT NULL DEFAULT '1000' COMMENT '字段排序',
  `field_width` varchar(30) NOT NULL DEFAULT '' COMMENT '字段列表显示宽度',
  `field_align` varchar(30) NOT NULL DEFAULT '' COMMENT '字段列表显示对齐',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='模型字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_fields`
--

LOCK TABLES `model_fields` WRITE;
/*!40000 ALTER TABLE `model_fields` DISABLE KEYS */;
INSERT INTO `model_fields` VALUES (5,6,'id','用户id','number','','','','','unsigned',0,'','',1,0,1595237473,1595237473),(6,6,'username','用户名','text','10','','','用户名','required,unique',1,'','',1,1,1595237518,1595493630),(7,6,'nickname','用户昵称','text','30','张三','','用户昵称','required',2,'','',1,1,1595237549,1595493589),(8,6,'age','年龄','number','','18','','年龄','unsigned',3,'','',1,1,1595300537,1595493575),(12,1,'house_id','房屋ID','number','','','','','unsigned',0,'','',1,0,1595322614,1595322614),(13,1,'belong_houses','所属楼盘','selectnumber','','0','houses|h_id|h_name|h_order','','required,unsigned',1,'','',1,31,1595322665,1599465550),(14,1,'belong_house_type','所属房型','selectnumber','','0','house_type|ht_id|ht_name|ht_order','','required,unsigned,ajax_select_change',2,'','',1,0,1595322728,1595322728),(15,1,'door_number','门牌号','text','10','','','','required,unique',3,'','',1,0,1595322849,1595322849),(16,9,'news_title','文章标题','selectnumber','150','',':cms_news_type','文章标题','required',6,'','',31,31,1595917601,1596415769),(17,9,'news_file','单附件','file','200','','','','',4,'','',31,31,1595917633,1596183979),(18,9,'news_imgs','多图片','images','30','','1:新浪,2:百度,3:腾讯','文章相册','',5,'','',31,31,1595917776,1596184646),(19,9,'art_id','附加表主键','large_number','','0','','','unsigned',0,'','',31,0,1595917830,1595917830),(20,9,'thumbnail','缩略图','imagefile','','','','缩略图','',2,'','',31,31,1596004062,1596095953),(21,9,'news_files','附件','files','','','plug_adtype|adtype_id|adtype_name|adtype_id asc|adtype_id>13','','',3,'','',31,31,1596016878,1596159484),(24,9,'news_content','文章内容','richtext','','','','','',1,'','',31,31,1596095070,1596095912),(25,9,'news_info','多选测试','checkbox','','1','1:张三,2:李四,3:王五','','required',7,'','',31,0,1596420410,1596420410),(27,9,'time_demo','时间测试','datetime','','','','','',8,'','',31,0,1596443050,1596443050),(28,10,'project_id','项目主键','large_number','','','','','unsigned',0,'','',2,2,1596528913,1596530964),(29,10,'project_pid','父级ID','large_number','50','0','','','unsigned',2,'','',2,2,1596528959,1596530741),(30,10,'project_title','项目标题','text','150','','','','',3,'','',2,0,1596530780,1596530780),(31,10,'project_no','项目编号','text','50','','','','unique',1,'','',2,0,1596530990,1596530990),(32,10,'project_status','项目状态','switch','','0','','','',4,'','',2,0,1596531263,1596531263),(33,10,'project_report_status','汇报状态','switch','','0','','','',5,'','',2,0,1596531294,1596531294),(34,11,'art_id','附加表主键','large_number','','0','','','unsigned',0,'','',31,0,1595917830,1595917830),(35,11,'news_content','文章内容','richtext','','','','','',1,'','',31,31,1596095070,1596095912);
/*!40000 ALTER TABLE `model_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_info`
--

DROP TABLE IF EXISTS `model_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_info` (
  `model_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `model_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板分类id',
  `model_name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `model_title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `model_pk` char(30) NOT NULL DEFAULT '' COMMENT '主键字段',
  `model_order` char(30) NOT NULL DEFAULT '' COMMENT '默认排序字段',
  `model_sort` varchar(255) DEFAULT NULL COMMENT '表单字段排序',
  `model_list` varchar(255) DEFAULT NULL COMMENT '列表显示字段，为空显示全部',
  `model_edit` varchar(255) DEFAULT '' COMMENT '可编辑字段，为空则除主键外均可以编辑',
  `model_indexes` varchar(255) DEFAULT NULL COMMENT '索引字段',
  `search_list` varchar(255) DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `model_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `model_engine` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE KEY `name_uni` (`model_name`) USING BTREE COMMENT '模型名唯一'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='文档模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_info`
--

LOCK TABLES `model_info` WRITE;
/*!40000 ALTER TABLE `model_info` DISABLE KEYS */;
INSERT INTO `model_info` VALUES (1,5,'house_info','房屋信息','house_id','hi_order','house_id','house_id,belong_houses,belong_house_type,door_number','belong_houses,belong_house_type,door_number','door_number','belong_houses,belong_house_type,door_number',1498101800,1514193091,1,'MyISAM',0,0),(6,1,'demo','测试','id','','id,username,nickname','id,username,nickname,age','username,nickname,age','username,nickname','username,nickname,age',0,1595299599,1,'MyISAM',0,1),(7,5,'demo2','测试2','','','','','','','',1594803649,1594803649,1,'InnoDB',1,0),(8,1,'demo3','测试3','','','','','','','',1594861449,1595583462,1,'InnoDB',1,1),(9,6,'cms_news_attr','文章模型','art_id','','art_id','news_info','news_content,thumbnail,news_files,news_file,news_imgs,news_title,news_info,time_demo','','news_info',1595316217,1596095352,1,'InnoDB',1,31),(10,1,'work_report','政府工作报告','project_id','','','','project_pid,project_title,project_status,project_report_status','','',1596528880,1596530597,1,'InnoDB',2,2),(11,6,'cms_yjf_attr','圆角方','art_id','','art_id','','news_content','','',1595316217,1597128476,1,'InnoDB',1,31);
/*!40000 ALTER TABLE `model_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plug_ad`
--

DROP TABLE IF EXISTS `plug_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_adtypeid` tinyint(5) NOT NULL COMMENT '所属位置',
  `ad_checkid` tinyint(2) NOT NULL COMMENT '1=图片 2=JS',
  `ad_js` varchar(255) NOT NULL COMMENT 'JS代码',
  `ad_pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `ad_url` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `ad_content` text COMMENT '广告文字内容',
  `ad_addtime` int(11) NOT NULL COMMENT '添加时间',
  `ad_sort` int(11) NOT NULL COMMENT '排序',
  `ad_open` tinyint(2) NOT NULL COMMENT '1=审核  0=未审核',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plug_ad`
--

LOCK TABLES `plug_ad` WRITE;
/*!40000 ALTER TABLE `plug_ad` DISABLE KEYS */;
INSERT INTO `plug_ad` VALUES (8,'dasfdsf',3,2,'asdasfagsgasdvb','','','fgfdbfd士大夫',1595930069,6,0),(26,'2222',3,1,'asdafasf','pub_upload/2020-07-31/c4kijvnpspakoibsdr.png','sss','ss',1596168625,2,0),(10,'dfgbsdfsd',10,2,'//:www.baiu.ocm','','','fgfdbfd士大夫',1595930194,4,1),(7,'1111',2,1,'','pub_upload/2020-07-31/c4kihqy0j2vczkexag.png','111','11111',1595929955,2,0),(11,'fdgb电风扇',11,1,'','pub_upload/2020-07-31/c4ki6c4v8y0g5kivt6.png','https://wsww.sadf.asvb','fgfdb案发时fd',1595930243,5,1),(27,'121',3,1,'','pub_upload/2020-07-31/c4klu06r1xlk1bnmct.jpg','sdss','cssssssssssssssssssssss',1596177749,2,1),(28,'gfast赞助',21,1,'','pub_upload/2020-10-16/c6e4fmhrpwewesaaia.png','','',1602831749,1,1);
/*!40000 ALTER TABLE `plug_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plug_adtype`
--

DROP TABLE IF EXISTS `plug_adtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_adtype` (
  `adtype_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `adtype_name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `adtype_sort` int(11) NOT NULL COMMENT '广告位排序',
  PRIMARY KEY (`adtype_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plug_adtype`
--

LOCK TABLES `plug_adtype` WRITE;
/*!40000 ALTER TABLE `plug_adtype` DISABLE KEYS */;
INSERT INTO `plug_adtype` VALUES (3,'fgfghsss',4),(2,'aaaaaa',50),(8,'新增广告位',12),(9,'新增2',23),(10,'asfasfa',34),(11,'345',23),(12,'342342',13),(14,'asdasfa',2),(15,'asdfx',2),(20,'新增3',2),(21,'gfast赞助',0);
/*!40000 ALTER TABLE `plug_adtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plug_link`
--

DROP TABLE IF EXISTS `plug_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_link` (
  `link_id` int(5) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(50) NOT NULL COMMENT '链接名称',
  `link_url` varchar(200) NOT NULL COMMENT '链接URL',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '打开方式',
  `link_typeid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属栏目ID',
  `link_qq` varchar(20) NOT NULL COMMENT '联系QQ',
  `link_order` bigint(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `link_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `link_open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0禁用1启用',
  `link_username` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '申请友情链接的联系人',
  `link_email` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `link_remark` text CHARACTER SET utf8mb4 NOT NULL COMMENT '申请友情链接时的备注',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plug_link`
--

LOCK TABLES `plug_link` WRITE;
/*!40000 ALTER TABLE `plug_link` DISABLE KEYS */;
INSERT INTO `plug_link` VALUES (2,'asssssssssssssssssasa','/system/plug/linkType/add','_blank',1,'4512335',7,1594689455,1,'','',''),(3,'第一名23','/system/plug/linkType/add','_blank',5,'4512335',4,1594689460,1,'','',''),(5,'梵蒂冈地方11','/system/plug/linkType/add','_blank',3,'4512335',1,1594689469,1,'','',''),(6,'爱的速递撒','/system/plug/linkType/add','_self',4,'4512335',5,1594689473,1,'','',''),(9,'text123','safasga','_blank',1,'4534543',6,1595990353,0,'','',''),(11,'testssssss','safasfasfasd11','_self',3,'3243242',2,1596016372,1,'','',''),(18,'asdas','asf','_blank',1,'11111',3,1596080931,0,'','',''),(19,'百度','https://www.baidu.com/','新标签页打开',13,'177852',1,1601194070,1,'老李','11312','dasfasfaf'),(20,'百度翻译','https://fanyi.baidu.com/#en/zh/','本窗口打开',13,'123124',1,1602325353,1,'asdasf','2134@qq.com','通过一下'),(21,'h','hjgjh','_blank',0,'45646',1,1602747055,0,'4','6546@qq.com','jhgj'),(23,'asdsa','http://www.baidu.com','_blank',0,'12312312',0,1602830363,0,'萨达所所多','asdas@qq','fasd'),(24,'asd','https://fanyi.baidu.com/#en/zh/','_blank',0,'21312312',0,1602830396,0,'asd ','sadq@qq','sadsad ');
/*!40000 ALTER TABLE `plug_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plug_linktype`
--

DROP TABLE IF EXISTS `plug_linktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_linktype` (
  `linktype_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `linktype_name` varchar(30) NOT NULL COMMENT '所属栏目名称',
  `linktype_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`linktype_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plug_linktype`
--

LOCK TABLES `plug_linktype` WRITE;
/*!40000 ALTER TABLE `plug_linktype` DISABLE KEYS */;
INSERT INTO `plug_linktype` VALUES (1,'我的',5),(2,'fasf',4),(3,'fvcc',3),(4,'gfdgd',3),(5,'fdvcc',6),(8,'dsfg',3),(13,'博客友情链接',3);
/*!40000 ALTER TABLE `plug_linktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,1,1582773740,1593680183,0,'超级管理员','备注',3),(2,1,1582773740,1593684627,0,'普通管理员','备注',3),(3,1,1582773740,0,0,'站点管理员','站点管理人员',3),(4,1,1582773740,0,0,'初级管理员','初级管理员',3),(5,1,1582773740,0,0,'高级管理员','高级管理员',3),(8,1,1582773740,1593506004,0,'区级管理员','',2);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_dept`
--

DROP TABLE IF EXISTS `role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_dept`
--

LOCK TABLES `role_dept` WRITE;
/*!40000 ALTER TABLE `role_dept` DISABLE KEYS */;
INSERT INTO `role_dept` VALUES (8,109),(8,200),(8,201);
/*!40000 ALTER TABLE `role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) DEFAULT '0' COMMENT '系统内置（Y是 N否）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `uni_config_key` (`config_key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'文件上传-文件大小','sys.uploadFile.fileSize','50M',1,31,1582968376,0,0,'文件上传大小限制'),(2,'文件上传-文件类型','sys.uploadFile.fileType','doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png',1,31,1582968465,31,1592963888,'文件上传后缀类型限制'),(3,'图片上传-图片类型','sys.uploadFile.imageType','jpg,jpeg,gif,npm,png',1,31,1582968519,0,0,'图片上传后缀类型限制'),(4,'图片上传-图片大小','sys.uploadFile.imageSize','50M',1,31,1582968538,31,1582991905,'图片上传大小限制');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:54:39'),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:54:45'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:55:08'),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:54:49'),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:54:53'),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:54:57'),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:55:00'),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:55:04'),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:55:12'),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','1','0','admin','2018-03-16 11:33:00','','2020-06-30 14:55:18'),(200,100,'','大数据',1,'小刘','18888888888','liou@qq.com','1','0','',NULL,'',NULL),(201,100,'','开发',1,'老李','18888888888','li@qq.com','1','0','admin','2020-06-19 10:14:06','','2020-06-30 14:55:22'),(202,108,'','外勤',1,'小a','18888888888','aa@qq.com','1','0','','2020-06-19 14:59:44','','2020-06-30 14:55:15'),(203,108,'','行政',0,'aa','18888888888','aa@qq.com','0','0','','2020-07-03 11:44:57','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint(64) unsigned DEFAULT '0' COMMENT '创建者',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_by` bigint(64) unsigned DEFAULT '0' COMMENT '更新者',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,0,'男','1','sys_user_sex','','',0,1,31,1582884113,31,1593656868,'备注信息'),(2,0,'女','2','sys_user_sex','','',0,1,31,1582884125,31,1593656871,'备注信息'),(3,0,'保密','0','sys_user_sex','','',1,1,31,1582884871,31,1593656875,'备注信息'),(24,0,'频道页','1','cms_category_type','','',0,1,31,1583131942,31,1592532634,'作为频道页，不可作为栏目发布文章，可添加下级分类'),(25,0,'发布栏目','2','cms_category_type','','',0,1,31,1583132032,31,1592532724,'作为发布栏目，可添加文章'),(26,0,'跳转栏目','3','cms_category_type','','',0,1,31,1583132125,31,1592532737,'不直接发布内容，用于跳转页面'),(27,0,'单页栏目','4','cms_category_type','','',0,1,31,1583132145,31,1592532755,'单页面模式，分类直接显示为文章'),(28,0,'正常','0','sys_job_status','','default',1,1,31,1583762727,0,0,''),(29,0,'暂停','1','sys_job_status','','default',0,1,31,1583762751,31,1583763095,''),(30,0,'默认','DEFAULT','sys_job_group','','default',1,1,31,1583762854,0,0,''),(31,0,'系统','SYSTEM','sys_job_group','','default',0,1,31,1583762889,0,0,''),(32,0,'成功','1','admin_login_status','','default',0,1,31,1583891238,31,1583891244,''),(33,0,'失败','0','admin_login_status','','default',0,1,31,1583891262,0,0,''),(34,0,'成功','1','sys_oper_log_status','','default',0,1,31,1583917929,0,0,''),(35,0,'失败','0','sys_oper_log_status','','default',0,1,31,1583917942,0,0,''),(36,0,'重复执行','1','sys_job_policy','','default',1,1,31,1584687209,0,0,''),(37,0,'执行一次','2','sys_job_policy','','default',1,1,31,1584687226,0,0,''),(38,0,'显示','1','sys_show_hide',NULL,'default',1,1,31,1584687226,0,0,NULL),(39,0,'隐藏','0','sys_show_hide',NULL,'default',0,1,31,1584687226,0,0,NULL),(40,0,'正常','1','sys_normal_disable','','default',1,1,31,1592214217,0,0,''),(41,0,'停用','0','sys_normal_disable','','default',0,1,31,1592214239,0,0,''),(49,0,'是','1','sys_yes_no','','',1,1,31,1592381742,0,1592381742,''),(50,0,'否','0','sys_yes_no','','',0,1,31,1592381753,0,1592381753,''),(51,0,'已发布','1','cms_news_pub_type','','',1,1,31,1593336428,31,1593393871,''),(54,0,'未发布','0','cms_news_pub_type','','',0,1,31,1593393852,0,1593393852,''),(55,0,'置顶','1','cms_news_attr','','',0,1,31,1593394753,0,1593394753,''),(56,0,'推荐','2','cms_news_attr','','',0,1,31,1593394762,0,1593394762,''),(57,0,'普通文章','0','cms_news_type','','',0,1,31,1593397458,31,1593399098,''),(58,0,'跳转链接','1','cms_news_type','','',0,1,31,1593397468,31,1593399105,''),(59,0,'cms模型','6','cms_cate_models','','',0,1,1,1595495461,1,1595580310,''),(64,0,'幻灯','3','cms_news_attr','','',0,1,31,1597648857,0,1597648857,'');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex',1,31,1582789177,31,1593596901,'用于选择用户性别'),(2,'分类类型','cms_category_type',1,31,1582789253,31,1583131577,'文章分类类型'),(3,'任务状态','sys_job_status',1,31,1582789296,31,1583762542,'任务状态列表'),(13,'任务分组','sys_job_group',1,31,1583762785,0,0,''),(14,'管理员登录状态','admin_login_status',1,31,1583891209,0,0,''),(15,'操作日志状态','sys_oper_log_status',1,31,1583917888,0,0,''),(16,'任务策略','sys_job_policy',1,31,1584687171,0,0,''),(17,'菜单状态','sys_show_hide',1,31,1584687171,0,1584687171,'菜单状态'),(18,'系统开关','sys_normal_disable',1,31,1592214147,31,1592362799,'系统开关'),(24,'系统内置','sys_yes_no',1,31,1592381722,0,0,''),(25,'文章发布状态','cms_news_pub_type',1,31,1593336396,0,0,''),(26,'文章附加状态','cms_news_attr',1,31,1593394729,0,0,''),(27,'文章类型','cms_news_type',1,31,1593397441,0,0,''),(28,'文章栏目模型分类','cms_cate_models',1,1,1595495428,0,0,'');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_params` varchar(200) DEFAULT '' COMMENT '参数',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(4) DEFAULT '1' COMMENT '计划执行策略（1多次执行 2执行一次）',
  `concurrent` tinyint(4) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` bigint(64) unsigned DEFAULT '0' COMMENT '创建者',
  `create_time` bigint(20) unsigned DEFAULT '1' COMMENT '创建时间',
  `update_by` bigint(64) unsigned DEFAULT '0' COMMENT '更新者',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'测试任务1','','DEFAULT','test1','* * * * * *',1,0,1,1,1583805259,31,1593566793,''),(2,'测试任务2','hello|gfast','DEFAULT','test2','* * * * * *',1,0,1,1,1583805312,1,1583809723,'备注'),(6,'测试任务3','hello|gfast','DEFAULT','test2','* * * * * *',1,0,1,1,1583811085,31,1593398575,'备注'),(8,'在线用户定时更新','','DEFAULT','checkUserOnline','5 */10 * * * *',1,0,0,2,1596763977,2,1596768044,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_log`
--

DROP TABLE IF EXISTS `sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_login_log` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` bigint(20) DEFAULT '0' COMMENT '访问时间',
  `module` varchar(30) DEFAULT NULL COMMENT '登录模块',
  PRIMARY KEY (`info_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_log`
--

LOCK TABLES `sys_login_log` WRITE;
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
INSERT INTO `sys_login_log` VALUES (1,'demo','[::1]','内网IP','Chrome','Windows 10',1,'登录成功',1604040961,'系统后台');
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` text COMMENT '请求参数',
  `json_result` text COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` bigint(20) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'清空',0,'/system/monitor/operlog/clear','DELETE',1,'demo','','/system/monitor/operlog/clear','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"清除成功\"}',1,'',1603359067),(2,'',0,'/system/monitor/operlog/list','GET',1,'demo','','/system/monitor/operlog/list?pageNum=1&pageSize=10&beginTime=&endTime=','[::1]','内网IP','{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"操作日志列表\"}',1,'',1603359067),(3,'文章管理',0,'/system/cms/news/list','GET',1,'demo','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1603359073),(4,'栏目管理',0,'/system/cms/menu/list','GET',1,'demo','','/system/cms/menu/list','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359074),(5,'',0,'/system/cms/menu/modelOptions','GET',1,'demo','','/system/cms/menu/modelOptions','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359074),(6,'文章管理',0,'/system/cms/news/list','GET',1,'demo','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1603359393),(7,'',0,'/system/index/getInfo','GET',1,'demo','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359395),(8,'',0,'/system/index/getRouters','GET',1,'demo','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359395),(9,'栏目管理',0,'/system/cms/menu/list','GET',1,'demo','','/system/cms/menu/list','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359395),(10,'',0,'/system/cms/menu/modelOptions','GET',1,'demo','','/system/cms/menu/modelOptions','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359395),(11,'添加栏目',0,'/system/cms/menu/add','GET',1,'demo','','/system/cms/menu/add','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"添加栏目\"}',1,'',1603359397),(12,'',0,'/system/index/getInfo','GET',1,'demo','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359404),(13,'',0,'/system/index/getRouters','GET',1,'demo','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359404),(14,'栏目管理',0,'/system/cms/menu/list','GET',1,'demo','','/system/cms/menu/list','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359405),(15,'',0,'/system/cms/menu/modelOptions','GET',1,'demo','','/system/cms/menu/modelOptions','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359405),(16,'修改栏目',0,'/system/cms/menu/edit','GET',1,'demo','','/system/cms/menu/edit?id=14','[::1]','内网IP','{\"id\":\"14\"}','{\"code\":0,\"msg\":\"修改栏目\"}',1,'',1603359406),(17,'修改栏目',0,'/system/cms/menu/edit','POST',1,'demo','','/system/cms/menu/edit','[::1]','内网IP','{\"alias\":\"\",\"cate_address\":\"\",\"cate_content\":\"\",\"cate_type\":\"2\",\"content_template\":\"content/show.html\",\"description\":\"\",\"id\":14,\"input_seo_description\":\"\",\"input_seo_keywords\":\"\",\"input_seo_title\":\"\",\"list_template\":\"list/list.html\",\"model_id\":11,\"name\":\"专题专栏\",\"parent_id\":0,\"status\":\"1\",\"thumbnail\":\"\"}','{\"code\":0,\"msg\":\"栏目修改成功\"}',1,'',1603359411),(18,'栏目管理',0,'/system/cms/menu/list','GET',1,'demo','','/system/cms/menu/list','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359411),(19,'修改栏目',0,'/system/cms/menu/edit','GET',1,'demo','','/system/cms/menu/edit?id=14','[::1]','内网IP','{\"id\":\"14\"}','{\"code\":0,\"msg\":\"修改栏目\"}',1,'',1603359412),(20,'',0,'/system/index/getInfo','GET',1,'demo','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359415),(21,'',0,'/system/index/getRouters','GET',1,'demo','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359415),(22,'栏目管理',0,'/system/cms/menu/list','GET',1,'demo','','/system/cms/menu/list','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359415),(23,'',0,'/system/cms/menu/modelOptions','GET',1,'demo','','/system/cms/menu/modelOptions','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1603359415),(24,'修改栏目',0,'/system/cms/menu/edit','GET',1,'demo','','/system/cms/menu/edit?id=14','[::1]','内网IP','{\"id\":\"14\"}','{\"code\":0,\"msg\":\"修改栏目\"}',1,'',1603359416),(25,'',0,'/system/index/getRouters','GET',1,'yixiaohu','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040642),(26,'',0,'/system/index/getInfo','GET',1,'yixiaohu','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040642),(27,'文章管理',0,'/system/cms/news/list','GET',1,'yixiaohu','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604040643),(28,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040681),(29,'添加菜单',0,'/system/auth/addMenu','GET',1,'yixiaohu','','/system/auth/addMenu','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040685),(30,'添加菜单',0,'/system/auth/addMenu','POST',1,'yixiaohu','','/system/auth/addMenu','[::1]','内网IP','{\"component\":\"cms\",\"icon\":\"education\",\"isFrame\":\"1\",\"menuName\":\"cms前端展示\",\"menuType\":\"1\",\"name\":\"cms\",\"orderNum\":0,\"parentId\":4,\"path\":\"http://localhost:8200/cms\",\"status\":\"1\",\"visible\":\"1\"}','{\"code\":0,\"msg\":\"添加菜单成功\"}',1,'',1604040725),(31,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040725),(32,'修改菜单',0,'/system/auth/editMenu','GET',1,'yixiaohu','','/system/auth/editMenu?menuId=106','[::1]','内网IP','{\"menuId\":\"106\"}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040729),(33,'修改菜单',0,'/system/auth/editMenu','POST',1,'yixiaohu','','/system/auth/editMenu','[::1]','内网IP','{\"component\":\"system/cms/news/list\",\"icon\":\"education\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"cms前端展示\",\"menuType\":\"1\",\"name\":\"cms\",\"orderNum\":0,\"parentId\":4,\"path\":\"http://localhost:8200/cms\",\"status\":\"1\",\"visible\":\"1\"}','{\"code\":0,\"msg\":\"修改菜单成功\"}',1,'',1604040735),(34,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040735),(35,'',0,'/system/index/getInfo','GET',1,'yixiaohu','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040739),(36,'',0,'/system/index/getRouters','GET',1,'yixiaohu','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040739),(37,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040740),(38,'文章管理',0,'/system/cms/news/list','GET',1,'yixiaohu','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604040745),(39,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040750),(40,'修改菜单',0,'/system/auth/editMenu','GET',1,'yixiaohu','','/system/auth/editMenu?menuId=106','[::1]','内网IP','{\"menuId\":\"106\"}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040754),(41,'修改菜单',0,'/system/auth/editMenu','GET',1,'yixiaohu','','/system/auth/editMenu?menuId=106','[::1]','内网IP','{\"menuId\":\"106\"}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040788),(42,'修改菜单',0,'/system/auth/editMenu','POST',1,'yixiaohu','','/system/auth/editMenu','[::1]','内网IP','{\"component\":\"system/cms/news/list\",\"icon\":\"education\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"cms前端展示\",\"menuType\":\"1\",\"name\":\"cms\",\"orderNum\":0,\"parentId\":4,\"path\":\"http://localhost:8200/cms\",\"status\":\"1\",\"visible\":\"1\"}','{\"code\":0,\"msg\":\"修改菜单成功\"}',1,'',1604040798),(43,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040798),(44,'',0,'/system/index/getInfo','GET',1,'yixiaohu','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040802),(45,'',0,'/system/index/getRouters','GET',1,'yixiaohu','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040802),(46,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040803),(47,'文章管理',0,'/system/cms/news/list','GET',1,'yixiaohu','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604040806),(48,'栏目管理',0,'/system/cms/menu/list','GET',1,'yixiaohu','','/system/cms/menu/list','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040808),(49,'',0,'/system/cms/menu/modelOptions','GET',1,'yixiaohu','','/system/cms/menu/modelOptions','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040808),(50,'文章管理',0,'/system/cms/news/list','GET',1,'yixiaohu','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604040810),(51,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040814),(52,'',0,'/system/index/getInfo','GET',1,'yixiaohu','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040829),(53,'',0,'/system/index/getRouters','GET',1,'yixiaohu','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040829),(54,'菜单管理',0,'/system/auth/menuList','GET',1,'yixiaohu','','/system/auth/menuList','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040829),(55,'修改菜单',0,'/system/auth/editMenu','GET',1,'yixiaohu','','/system/auth/editMenu?menuId=78','[::1]','内网IP','{\"menuId\":\"78\"}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040862),(56,'',0,'/system/dept/treeSelect','GET',1,'yixiaohu','','/system/dept/treeSelect','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040914),(57,'用户管理',0,'/system/auth/userList','GET',1,'yixiaohu','','/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=','[::1]','内网IP','{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"成功\"}',1,'',1604040914),(58,'',0,'/system/user/profile','GET',1,'yixiaohu','','/system/user/profile','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040925),(59,'',0,'/system/index/getInfo','GET',1,'demo','','/system/index/getInfo','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040961),(60,'',0,'/system/index/getRouters','GET',1,'demo','','/system/index/getRouters','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040961),(61,'',0,'/system/user/profile','GET',1,'demo','','/system/user/profile','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604040962),(62,'广告位管理',0,'/system/plug/ad/type/list','GET',1,'demo','','/system/plug/ad/type/list?pageNum=1&pageSize=10','[::1]','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"广告位列表\"}',1,'',1604040967),(63,'文章管理',0,'/system/cms/news/list','GET',1,'demo','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604041087),(64,'修改文章',0,'/system/cms/news/edit','GET',1,'demo','','/system/cms/news/edit?id=128','[::1]','内网IP','{\"id\":\"128\"}','{\"code\":0,\"msg\":\"添加信息\"}',1,'',1604041089),(65,'',0,'/system/cms/news/getModelFields','GET',1,'demo','','/system/cms/news/getModelFields?cateIds[]=25&newsId=128','[::1]','内网IP','{\"cateIds\":[\"25\"],\"newsId\":\"128\"}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041089),(66,'模型列表',0,'/system/model/info/list','GET',1,'demo','','/system/model/info/list?pageNum=1&pageSize=10','[::1]','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"获取列表数据成功\"}',1,'',1604041100),(67,'',0,'/system/config/dict/getDicts','GET',1,'demo','','/system/config/dict/getDicts?dictType=sys_normal_disable','[::1]','内网IP','{\"dictType\":\"sys_normal_disable\"}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041100),(68,'',0,'/system/model/category/all','GET',1,'demo','','/system/model/category/all','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041100),(69,'',0,'/system/model/fields/list','GET',1,'demo','','/system/model/fields/list?modelId=9','[::1]','内网IP','{\"modelId\":\"9\"}','{\"code\":0,\"msg\":\"获取列表数据成功\"}',1,'',1604041107),(70,'',0,'/system/model/fields/delete','DELETE',1,'demo','','/system/model/fields/delete','[::1]','内网IP','{\"ids\":[26]}','{\"code\":0,\"msg\":\"删除成功\"}',1,'',1604041110),(71,'',0,'/system/model/fields/list','GET',1,'demo','','/system/model/fields/list?modelId=9','[::1]','内网IP','{\"modelId\":\"9\"}','{\"code\":0,\"msg\":\"获取列表数据成功\"}',1,'',1604041110),(72,'',0,'/system/model/fields/setFieldsAttr','POST',1,'demo','','/system/model/fields/setFieldsAttr','[::1]','内网IP','{\"fieldsList\":[{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"0\",\"field_desc\":\"\",\"field_id\":19,\"field_length\":\"\",\"field_name\":\"art_id\",\"field_rules\":\"unsigned\",\"field_sort\":0,\"field_title\":\"附加表主键\",\"field_type\":\"large_number\",\"field_width\":\"\",\"model_edit\":\"\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"1\",\"model_sort\":\"1\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"\",\"field_desc\":\"\",\"field_id\":24,\"field_length\":\"\",\"field_name\":\"news_content\",\"field_rules\":\"\",\"field_sort\":0,\"field_title\":\"文章内容\",\"field_type\":\"richtext\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"\",\"field_desc\":\"\",\"field_id\":20,\"field_length\":\"\",\"field_name\":\"thumbnail\",\"field_rules\":\"\",\"field_sort\":0,\"field_title\":\"缩略图\",\"field_type\":\"imagefile\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"\",\"field_desc\":\"\",\"field_id\":21,\"field_length\":\"\",\"field_name\":\"news_files\",\"field_rules\":\"\",\"field_sort\":0,\"field_title\":\"附件\",\"field_type\":\"files\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"\",\"field_desc\":\"\",\"field_id\":17,\"field_length\":\"\",\"field_name\":\"news_file\",\"field_rules\":\"\",\"field_sort\":0,\"field_title\":\"单附件\",\"field_type\":\"file\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"\",\"field_desc\":\"\",\"field_id\":18,\"field_length\":\"\",\"field_name\":\"news_imgs\",\"field_rules\":\"\",\"field_sort\":0,\"field_title\":\"多图片\",\"field_type\":\"images\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"\",\"field_desc\":\"\",\"field_id\":16,\"field_length\":\"\",\"field_name\":\"news_title\",\"field_rules\":\"required\",\"field_sort\":0,\"field_title\":\"文章标题\",\"field_type\":\"selectnumber\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"1\",\"field_desc\":\"\",\"field_id\":25,\"field_length\":\"\",\"field_name\":\"news_info\",\"field_rules\":\"required\",\"field_sort\":0,\"field_title\":\"多选测试\",\"field_type\":\"checkbox\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"1\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"1\",\"update_by\":0,\"update_time\":0},{\"create_by\":0,\"create_time\":0,\"field_align\":\"\",\"field_data\":\"\",\"field_default\":\"\",\"field_desc\":\"\",\"field_id\":27,\"field_length\":\"\",\"field_name\":\"time_demo\",\"field_rules\":\"\",\"field_sort\":0,\"field_title\":\"时间测试\",\"field_type\":\"datetime\",\"field_width\":\"\",\"model_edit\":\"1\",\"model_id\":9,\"model_indexes\":\"\",\"model_list\":\"\",\"model_order\":\"\",\"model_pk\":\"\",\"model_sort\":\"\",\"search_list\":\"\",\"update_by\":0,\"update_time\":0}],\"modelId\":9,\"pkId\":19}','{\"code\":0,\"msg\":\"修改成功\"}',1,'',1604041112),(73,'',0,'/system/model/fields/list','GET',1,'demo','','/system/model/fields/list?modelId=9','[::1]','内网IP','{\"modelId\":\"9\"}','{\"code\":0,\"msg\":\"获取列表数据成功\"}',1,'',1604041112),(74,'',0,'/system/config/dict/getDicts','GET',1,'demo','','/system/config/dict/getDicts?dictType=sys_normal_disable','[::1]','内网IP','{\"dictType\":\"sys_normal_disable\"}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041113),(75,'',0,'/system/model/category/all','GET',1,'demo','','/system/model/category/all','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041113),(76,'模型列表',0,'/system/model/info/list','GET',1,'demo','','/system/model/info/list?pageNum=1&pageSize=10','[::1]','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"获取列表数据成功\"}',1,'',1604041113),(77,'文章管理',0,'/system/cms/news/list','GET',1,'demo','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604041117),(78,'修改文章',0,'/system/cms/news/edit','GET',1,'demo','','/system/cms/news/edit?id=127','[::1]','内网IP','{\"id\":\"127\"}','{\"code\":0,\"msg\":\"添加信息\"}',1,'',1604041118),(79,'',0,'/system/cms/news/getModelFields','GET',1,'demo','','/system/cms/news/getModelFields?cateIds[]=22&newsId=127','[::1]','内网IP','{\"cateIds\":[\"22\"],\"newsId\":\"127\"}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041118),(80,'',0,'/system/cms/menu/modelOptions','GET',1,'demo','','/system/cms/menu/modelOptions','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041130),(81,'栏目管理',0,'/system/cms/menu/list','GET',1,'demo','','/system/cms/menu/list','[::1]','内网IP','{}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041130),(82,'文章管理',0,'/system/cms/news/list','GET',1,'demo','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604041381),(83,'修改文章',0,'/system/cms/news/edit','GET',1,'demo','','/system/cms/news/edit?id=128','[::1]','内网IP','{\"id\":\"128\"}','{\"code\":0,\"msg\":\"添加信息\"}',1,'',1604041382),(84,'',0,'/system/cms/news/getModelFields','GET',1,'demo','','/system/cms/news/getModelFields?cateIds[]=25&newsId=128','[::1]','内网IP','{\"cateIds\":[\"25\"],\"newsId\":\"128\"}','{\"code\":0,\"msg\":\"ok\"}',1,'',1604041382),(85,'修改文章',0,'/system/cms/news/edit','POST',1,'demo','','/system/cms/news/edit','[::1]','内网IP','{\"attr\":[],\"cateIds\":[25],\"excerpt\":\"对于贵州省三都水族自治县都江镇甲找村甲找小学的师生而言，7月24日是个美好的日子。学校里来了许多和善的叔叔阿姨，他们带着满满的爱心，为孩子们送上用心准备的礼物：精美的图书、崭新的体育用品……中国扶贫基金会执行副理事长王行最\",\"id\":128,\"isJump\":\"0\",\"jumpUrl\":\"\",\"keywords\":\"\",\"modelForm\":{\"news_content\":\"\\u003cp\\u003e\\u003cimg alt=\\\"\\\" src=\\\"https://www.zhutibaba.com/demo/zimeiti2/wp-content/uploads/sites/5/2018/07/b46-800x398.jpg\\\" style=\\\"height:398px; width:800px\\\" /\\u003e\\u003c/p\\u003e\\n\\n\\u003cp\\u003e对于贵州省三都水族自治县都江镇甲找村甲找小学的师生而言，7月24日是个美好的日子。学校里来了许多和善的叔叔阿姨，他们带着满满的爱心，为孩子们送上用心准备的礼物：精美的图书、崭新的体育用品\\u0026hellip;\\u0026hellip;中国扶贫基金会执行副理事长王行最、百胜中国首席公共事务官王立志（Alice Wang）、百胜中国首席供应链官兼塔可贝尔总经理陈玟瑞（Danny Tan）等领导，与百胜中国员工代表，全国媒体代表、志愿者们一起来到了这所位于黔南山区的乡村小学，将凝聚着千万消费者与百胜中国员工爱心的营养加餐和礼物分发到全校100多名小学生手里。\\u003c/p\\u003e\\n\\n\\u003cp\\u003e\\u003cstrong\\u003e十一年的坚持，捐一元汇集大爱\\u003c/strong\\u003e\\u003c/p\\u003e\\n\\n\\u003cp\\u003e\\u0026ldquo;捐一元?献爱心?送营养\\u0026rdquo;公益项目（下简称：\\u0026ldquo;捐一元\\u0026rdquo; ）项目于2008年由中国扶贫基金会携手百胜中国共同发起，向全社会号召一人捐出一元钱，为贫困地区孩子提供营养加餐，并为孩子们进行营养知识普及。目前，该项目已是百胜中国标志性企业社会责任项目，并通过百胜中国旗下遍布全国约8000家餐厅和相关的网络订餐系统向社会募捐，搭建了一个\\u0026ldquo;全民公益\\u0026rdquo;的捐款平台。甲找小学距离贵阳220公里，位于三都水族自治县县城东南，离县城45公里，但因为山路弯曲狭窄，这45公里开车就要开一个半小时以上。学校覆盖周边五个村落，其中最远的离学校有12公里，所以住校的学生占了90%以上。这意味着学校不但负责教育，也承担起孩子们的食宿照顾。2016年， \\u0026ldquo;捐一元\\u0026rdquo;公益项目进入了甲找小学，除了为孩子们提供牛奶和鸡蛋的营养加餐，也为该校捐赠了全新\\u0026ldquo;爱心厨房\\u0026rdquo;。从此，孩子们可以在学校吃上更营养更健康的餐食。截至2018年6月，\\u0026ldquo;捐一元\\u0026rdquo;项目已为贵州三都县累计投入超过320万元，受益学生约1.7万人次，为学生提供了92万份营养加餐，并为17所小学配备爱心厨房设备。活动当天，百胜中国和中国扶贫基金会的代表们为孩子们带来了精心准备的礼品，包括体育用品和优质儿童图书。百胜中国首席执行官屈翠容（Joey Wat）虽然无法亲临现场，专门委托同事为孩子们带去崭新的书包。中午，大家一起为孩子们发放营养加餐。\\u003c/p\\u003e\\n\\n\\u003cp\\u003e中国扶贫基金会执行副理事长王行最表示：\\u0026ldquo;今年是捐一元项目的第十一年。感谢百胜中国十一年来的坚持，捐一元可以说是推动\\u0026ldquo;全民公益\\u0026rdquo;的典范，赢得了社会公众的高度认可和积极参与，累计参与公众超过一亿人次，已成为参与人数最多的全民公益项目之一。\\u0026rdquo;\\u003c/p\\u003e\\n\\n\\u003cp\\u003e看着孩子们的笑脸，百胜中国首席公共事务官王立志女士欣慰地表示：\\u0026ldquo;我非常高兴地看到，在过去十年内，\\u0026lsquo;捐一元\\u0026rsquo;项目为数十万贫困地区的小学生提供每日营养加餐，持续改善他们的营养状况。同时这个项目也提升了45万百胜中国员工的公益意识和参与公益的主动性。更重要的是，我们通过十年的探索和努力，传播了\\u0026lsquo;人人公益\\u0026rsquo;的理念，一元钱的力量虽小，汇集起来便是大爱。就能为孩子创造更健康、更美好的未来。\\u0026rdquo;\\u003c/p\\u003e\\n\",\"news_file\":null,\"news_files\":null,\"news_imgs\":[],\"news_info\":[\"1\"],\"news_title\":\"0\",\"thumbnail\":\"\",\"time_demo\":\"2020-10-30 11:39:25\"},\"publishedTime\":\"2020-10-30 11:39:22\",\"source\":\"\",\"status\":\"1\",\"thumbnail\":\"pub_upload/2020-10-30/c6pww9dkku60m8yrpv.jpg\",\"title\":\"百胜中国“捐一元”开启第十一年爱心之旅\"}','{\"code\":0,\"msg\":\"修改信息成功\"}',1,'',1604041385),(86,'文章管理',0,'/system/cms/news/list','GET',1,'demo','','/system/cms/news/list?pageNum=1&pageSize=10&keyWords=','[::1]','内网IP','{\"keyWords\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}','{\"code\":0,\"msg\":\"信息列表\"}',1,'',1604041385);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'1','',NULL,'','2020-07-02 10:09:11',''),(2,'se','项目经理',2,'1','',NULL,'','2020-07-02 10:09:14',''),(3,'hr','人力资源',3,'1','',NULL,'','2020-07-02 10:09:18',''),(4,'user','普通员工',4,'1','',NULL,'','2020-07-02 10:09:22','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `dept_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否后台管理员 1 是  0   否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login` (`user_name`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','18687455555','超级管理员',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh669@qq.com',1,'pub_upload/2020-07-06/c3z4ly6gknispnpjea.jpeg',1595208583,'[::1]',101,'',1),(2,'yixiaohu','13699885599','奈斯',0,0,'9OFlt5qzzvCiZWhe7ilcLA==',1,'yxh@qq.com',1,'',1597310548,'[::1]',102,'备注',1),(3,'zs','16399669855','张三',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'zs@qq.com',0,'',1559293160,'127.0.0.1',101,'',1),(4,'qlgl','13758596696','测试c',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',0,'qlgl@qq.com',0,'',1559293134,'127.0.0.1',102,'',1),(5,'test','13845696696','测试2',0,0,'9OFlt5qzzvCiZWhe7ilcLA==',0,'123@qq.com',0,'',0,'',101,'',0),(6,'18999998889','13755866654','刘大大',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'1223@qq.com',0,'',0,'',103,'',1),(7,'zmm','13788566696','张明明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'11123@qq.com',0,'',0,'',104,'',1),(8,'lxx','13756566696','李小小',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'123333@qq.com',0,'',1571729563,'127.0.0.1',101,'',1),(10,'xmm','13588999969','小秘密',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,'',101,'',1),(14,'cd_19','123154564','看金利科技',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,'',0,'',1),(15,'lmm','13587754545','刘敏敏',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'a@coc.com',0,'',0,'',201,'',1),(16,'ldn','13899658874','李大牛',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'a@ll.con',0,'',0,'',102,'',1),(20,'dbc','13877555566','大百词',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,'',0,'',1),(22,'yxfmlbb','15969423326','yxf',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh6691@qq.com',0,'',1565059554,'127.0.0.1',200,'',1),(23,'wangming','13699888855','王明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,'',0,'',1),(24,'zhk','13699885591','综合科',0,0,'IZNU7Pn91/++830Pi6HAWA==',1,'',0,'',1569288069,'192.168.0.146',0,'',1),(28,'demo3','18699888855','测试账号1',0,1581314035,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,'',0,'',1),(31,'demo','18699888856','测试账号',0,1581314770,'9OFlt5qzzvCiZWhe7ilcLA==',1,'223@qq.com',2,'pub_upload/2020-09-03/c5disauti1wogasemy.jpeg',1604040961,'[::1]',109,'',1),(32,'demo100','18699888859','测试账号1',0,1582103659,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,'',0,'',1),(33,'demo110','18699888853','测试账号1',0,1582109337,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,'',0,'',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_online`
--

DROP TABLE IF EXISTS `user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `ip` varchar(120) NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(30) NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_token` (`token`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16362 DEFAULT CHARSET=utf8mb4 COMMENT='用户在线状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_online`
--

LOCK TABLES `user_online` WRITE;
/*!40000 ALTER TABLE `user_online` DISABLE KEYS */;
INSERT INTO `user_online` VALUES (16361,'804b7db859cf41e45a44dc68748d7dc1','fCLUxFpxP3QqVAezWSiqJ34BRz5YTp2qDGmH5L5jiv7IuTjnVwU1hMxIMAIJawrfGYKZJfvmvPqdwUsUbBxLy1tz9PbrrtozjlNSB/Ey69svUykYyIncd5uFBkvbFPc2',1604040961,'demo','[::1]','Chrome','Windows 10');
/*!40000 ALTER TABLE `user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
INSERT INTO `user_post` VALUES (1,2),(1,3),(2,1),(2,2),(3,1),(5,2),(15,4),(16,2),(22,1),(22,2),(31,2);
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_set`
--

DROP TABLE IF EXISTS `web_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_set` (
  `web_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `web_content` text CHARACTER SET utf8 COMMENT '站点信息',
  PRIMARY KEY (`web_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_set`
--

LOCK TABLES `web_set` WRITE;
/*!40000 ALTER TABLE `web_set` DISABLE KEYS */;
INSERT INTO `web_set` VALUES (2,'{\"webLogo\":\"pub_upload/2020-08-07/c4qgtm9okus0lbku6g.jpg\",\"webName\":\"gfast\",\"webSite\":\"localhost\"}');
/*!40000 ALTER TABLE `web_set` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-30 15:04:34
