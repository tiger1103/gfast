-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gfast
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
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='菜单节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES (5,'file',0,'/system/auth','权限管理','fa fa-users','','',1,1497429920,1582706271,80,1),(9,'file',5,'/system/auth/user-list','管理员管理','fa fa-user','','Admin tips',1,1497429920,1497430320,118,1),(10,'file',5,'/system/auth/adminlog','管理员日志','fa fa-list-alt','','Admin log tips',1,1497429920,1582731276,113,1),(11,'file',5,'/system/auth/role-list','角色组','fa fa-group','','Group tips',1,1497429920,1582706904,109,1),(12,'file',5,'/system/auth/menu-list','菜单规则','fa fa-bars','','Rule tips',1,1497429920,1582731459,104,1),(43,'file',9,'/system/auth/delete-admin','删除','fa fa-circle-o','','',0,1497429920,1582706783,1,1),(42,'file',9,'/system/auth/edit-user','修改','fa fa-circle-o','','',0,1497429920,1582706817,2,1),(41,'file',9,'/system/auth/add-user','添加','fa fa-circle-o','','',0,1497429920,1582726029,3,1),(47,'file',11,'/system/auth/add-role','添加角色','el-icon-document-add','','',0,1582706959,1582706959,50,1),(50,'file',12,'/system/auth/add-menu','添加菜单','el-icon-document-add','','',0,1582726105,1582726105,50,1),(46,'file',0,'/system/index/index','系统首页','el-icon-s-grid','noCheck','',1,1582704520,1582726295,100,1),(48,'file',11,'/system/auth/edit-role','修改角色','fa fa-pencil','','',0,1582706999,1582726035,50,1),(49,'file',11,'/system/auth/delete-role','删除角色','fa fa-institution','','',0,1582707051,1582726040,50,1),(51,'file',12,'/system/auth/edit-menu','修改菜单','fa fa-pencil','','',0,1582726145,1582726145,50,1),(52,'file',12,'/system/auth/delete-menu','删除菜单','fa fa-institution','','',0,1582726194,1582726194,50,1),(53,'file',12,'/system/auth/menu-sort','菜单排序','fa fa-list-ul','','',0,1582726229,1582726229,50,1),(57,'file',0,'/system/cms','CMS管理','fa fa-list','','',1,1582731636,1582731636,70,1),(58,'file',57,'/system/cms/menu-list','栏目管理','fa fa-list-ul','','',1,1582731762,1582732995,50,1),(59,'file',57,'/system/cms/news-list','内容管理','fa fa-th-list','','',1,1582731800,1582733003,50,1),(60,'file',57,'/system/cms/mode-list','模型管理','fa fa-codepen','','',1,1582731832,1582733011,50,1),(61,'file',57,'/system/cms/special-list','专题管理','fa fa-hand-pointer-o','','',1,1582732334,1582733018,50,1),(62,'file',57,'/system/cms/single-list','单页管理','fa fa-file-o','','',1,1582732373,1582733025,50,1),(63,'file',0,'/system/config','系统配置','fa fa-wrench','','',1,1582773590,1582773600,90,1),(64,'file',63,'/system/config/dict/list','字典管理','fa fa-sitemap','','',1,1582773640,1583457951,50,1),(65,'file',63,'/system/config/params/list','参数管理','fa fa-list-ul','','',1,1582773725,1583457960,50,1),(66,'file',0,'/system/monitor','系统监控','fa fa-video-camera','','',1,1583745179,1583745179,75,1),(67,'file',66,'/system/monitor/online/list','在线用户','fa fa-list-ul','','',1,1583745243,1583745243,50,1),(68,'file',67,'/system/monitor/online/force-logout','强退用户','fa fa-chevron-right','','',0,1583745300,1583745300,50,1);
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
INSERT INTO `casbin_rule` VALUES ('p','g_2','r_5','All','','',''),('p','g_2','r_9','All','','',''),('p','g_2','r_41','All','','',''),('p','g_2','r_42','All','','',''),('p','g_2','r_43','All','','',''),('p','g_2','r_10','All','','',''),('p','g_2','r_11','All','','',''),('p','g_2','r_47','All','','',''),('p','g_2','r_48','All','','',''),('p','g_2','r_49','All','','',''),('p','g_2','r_12','All','','',''),('p','g_2','r_50','All','','',''),('p','g_2','r_51','All','','',''),('p','g_2','r_52','All','','',''),('p','g_2','r_53','All','','',''),('p','g_2','r_57','All','','',''),('p','g_2','r_58','All','','',''),('p','g_2','r_59','All','','',''),('p','g_2','r_60','All','','',''),('p','g_2','r_61','All','','',''),('p','g_2','r_62','All','','',''),('g','u_31','g_1','','','',''),('g','u_31','g_2','','','',''),('p','g_1','r_46','All','','',''),('p','g_1','r_63','All','','',''),('p','g_1','r_64','All','','',''),('p','g_1','r_65','All','','',''),('p','g_1','r_5','All','','',''),('p','g_1','r_9','All','','',''),('p','g_1','r_41','All','','',''),('p','g_1','r_42','All','','',''),('p','g_1','r_43','All','','',''),('p','g_1','r_10','All','','',''),('p','g_1','r_11','All','','',''),('p','g_1','r_47','All','','',''),('p','g_1','r_48','All','','',''),('p','g_1','r_49','All','','',''),('p','g_1','r_12','All','','',''),('p','g_1','r_50','All','','',''),('p','g_1','r_51','All','','',''),('p','g_1','r_52','All','','',''),('p','g_1','r_53','All','','',''),('p','g_1','r_57','All','','',''),('p','g_1','r_58','All','','',''),('p','g_1','r_59','All','','',''),('p','g_1','r_60','All','','',''),('p','g_1','r_61','All','','',''),('p','g_1','r_62','All','','',''),('p','g_8','r_46','All','','','');
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
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES (1,0,1,0,0,'最新发布','最新发布','最新发布','最新发布','最新发布','','','',1,'',''),(2,1,1,0,0,'云南主要指标数据','云南主要指标数据','云南主要指标数据','云南主要指标数据','云南主要指标数据','','','',1,'',''),(3,2,1,0,0,'综合数据','综合数据','综合数据','综合数据','综合数据','','','',2,'',''),(4,0,1,0,0,'决策部署','决策部署','决策部署','决策部署','决策部署','','','',1,'',''),(5,0,1,0,0,'决策参考','决策参考','决策参考','决策参考','决策参考','','','',1,'',''),(6,0,1,0,0,'热点名词','热点名词','热点名词','热点名词','热点名词','','','',2,'',''),(7,0,1,0,0,'统计分析','统计分析','统计分析','统计分析','统计分析','','','',1,'','');
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,0,1,1329633709,1582773740,0,'超级管理员','备注'),(2,0,1,1329633709,1582732392,0,'普通管理员','备注'),(3,0,1,0,0,0,'站点管理员','站点管理人员'),(4,0,1,0,0,0,'初级管理员','初级管理员'),(5,0,1,0,0,0,'高级管理员','高级管理员'),(8,3,1,0,1582860212,0,'区级管理员','');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (6,3,4),(8,2,5),(10,2,6),(20,4,7),(21,7,2),(23,2,10),(27,2,14),(28,2,15),(29,2,16),(47,2,20),(48,7,3),(49,2,3),(50,2,23),(51,7,22),(52,2,24),(53,5,8);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'文件上传-文件大小','sys.uploadFile.fileSize','50M',1,31,1582968376,0,0,'文件上传大小限制'),(2,'文件上传-文件类型','sys.uploadFile.fileType','doc,docx,zip,xls,xlsx,rar',1,31,1582968465,0,0,'文件上传后缀类型限制'),(3,'图片上传-图片类型','sys.uploadFile.imageType','jpg,jpeg,gif,npm,png',1,31,1582968519,0,0,'图片上传后缀类型限制'),(4,'图片上传-图片大小','sys.uploadFile.imageSize','50M',1,31,1582968538,31,1582991905,'图片上传大小限制');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
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
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,0,'男','0','sys_user_sex','','default',1,1,31,1582884113,0,0,'备注信息'),(2,0,'女','0','sys_user_sex','','default',1,1,31,1582884125,31,1582885784,'备注信息'),(3,0,'保密','0','sys_user_sex','','default',1,1,31,1582884871,31,1582885799,'备注信息'),(4,0,'男','0','sys_user_sex','','default',1,1,31,1582899746,0,0,'备注信息'),(5,0,'男','0','sys_user_sex','','default',1,1,31,1582899747,0,0,'备注信息'),(6,0,'男','0','sys_user_sex','','default',1,1,31,1582899748,0,0,'备注信息'),(7,0,'男','0','sys_user_sex','','default',1,1,31,1582899748,0,0,'备注信息'),(8,0,'男','0','sys_user_sex','','default',1,1,31,1582899749,0,0,'备注信息'),(9,0,'男','0','sys_user_sex','','default',1,1,31,1582899750,0,0,'备注信息'),(10,0,'男','0','sys_user_sex','','default',1,1,31,1582899751,0,0,'备注信息'),(11,0,'男','0','sys_user_sex','','default',1,1,31,1582899752,0,0,'备注信息'),(12,0,'男','0','sys_user_sex','','default',1,1,31,1582899752,0,0,'备注信息'),(24,0,'作为频道页，不可作为栏目发布文章，可添加下级分类','1','cms_category_type','','default',1,1,31,1583131942,0,0,'作为频道页，不可作为栏目发布文章，可添加下级分类'),(25,0,'作为发布栏目，可添加文章','2','cms_category_type','','default',0,1,31,1583132032,0,0,'作为发布栏目，可添加文章'),(26,0,'不直接发布内容，用于跳转页面','3','cms_category_type','','default',0,1,31,1583132125,0,0,'不直接发布内容，用于跳转页面'),(27,0,'单页面模式，分类直接显示为文章','4','cms_category_type','','default',0,1,31,1583132145,0,0,'单页面模式，分类直接显示为文章');
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
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex',1,31,1582789177,0,0,'用于选择用户性别'),(2,'分类类型','cms_category_type',1,31,1582789253,31,1583131577,'文章分类类型'),(3,'菜单状态2','sys_show_hide2',1,31,1582789296,0,0,'菜单状态列表'),(4,'菜单状态3','sys_show_hide3',1,31,1582789303,0,0,'菜单状态列表'),(5,'菜单状态4','sys_show_hide4',1,31,1582789307,0,0,'菜单状态列表'),(6,'菜单状态5','sys_show_hide5',1,31,1582789313,0,0,'菜单状态列表'),(7,'菜单状态6','sys_show_hide6',1,31,1582789321,0,0,'菜单状态列表'),(8,'菜单状态7','sys_show_hide7',1,31,1582789326,0,0,'菜单状态列表'),(9,'菜单状态8','sys_show_hide8',1,31,1582789332,0,0,'菜单状态列表'),(10,'菜单状态9','sys_show_hide9',1,31,1582789337,0,0,'菜单状态列表'),(11,'菜单状态10','sys_show_hide10',1,31,1582789344,0,0,'菜单状态列表'),(12,'菜单状态11','sys_show_hide11',1,31,1582789349,0,0,'菜单状态列表');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login` (`user_name`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','18687460581','超级管理员',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh669@qq.com',0,'',1583744648,'[::1]'),(2,'yixiaohu','13699885599','易小虎',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh@qq.com',1,'',1583479226,'[::1]'),(3,'zs','16399669855','张三',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'zs@qq.com',0,'',1559293160,'127.0.0.1'),(4,'qlgl','13758596696','测试c',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'qlgl@qq.com',0,'',1559293134,'127.0.0.1'),(5,'test','13845696696','测试2',0,0,'9OFlt5qzzvCiZWhe7ilcLA==',1,'123@qq.com',0,'',0,''),(6,'18999998889','13755866654','刘大大',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'1223@qq.com',0,'',0,''),(7,'zmm','13788566696','张明明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'11123@qq.com',0,'',0,''),(8,'lxx','13756566696','李小小',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'123333@qq.com',0,'',1571729563,'127.0.0.1'),(10,'xmm','13588999969','小秘密',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(14,'cd_19','123154564','看金利科技',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(15,'lmm','135877545454','刘敏敏',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(16,'ldn','13899658874','李大牛',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(20,'dbc','13877555566','大百词',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(22,'yxfmlbb','15969423326','袁学飞',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh6691@qq.com',0,'',1565059554,'127.0.0.1'),(23,'wangming','13699888855','王明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(24,'zhk','13699885591','综合科',0,0,'IZNU7Pn91/++830Pi6HAWA==',1,'',0,'',1569288069,'192.168.0.146'),(28,'demo3','18699888855','测试账号1',0,1581314035,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(31,'demo','18699888856','测试账号1',0,1581314770,'9OFlt5qzzvCiZWhe7ilcLA==',1,'56@qq.com',0,'',1583745118,'192.168.0.212'),(32,'demo100','18699888859','测试账号1',0,1582103659,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(33,'demo110','18699888853','测试账号1',0,1582109337,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(34,'demo101','13855774455','测试账号1',0,1582110232,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(38,'demo103','18699888833','测试账号103',0,1582188923,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',1582188938,'[::1]');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='用户在线状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_online`
--

LOCK TABLES `user_online` WRITE;
/*!40000 ALTER TABLE `user_online` DISABLE KEYS */;
INSERT INTO `user_online` VALUES (19,'974f72669e489d89abdf929c9d8fa288','fCLUxFpxP3QqVAezWSiqJ7D3QYZ7jkylPshqw8BVzfJJfAHAbwsSFhjrTyqHZEnzCXkFfQFo/9my2rcE0RSDdkAUap/un1TfxQqAcAX8O6d+ASrLuMl8lgceLxtdiihe',1583745118,'demo','192.168.0.212','Chrome','Windows 10'),(17,'70965993534b37da57ba93e952a8f7b7','lpe0YG9uqSN+sc8zL1tF+9Wcdo668H3tXJxqoKs0sIpULsmmu8SNCn4Y7lyrWhX9MxGyhMP0ksnUkaC1HHCvEPkUIHqjarQw70N/9E8CebISLbUvwzZTcQygi/ruaJIa',1583744649,'admin','[::1]','PostmanRuntime','');
/*!40000 ALTER TABLE `user_online` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-09 18:15:55
