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
INSERT INTO `casbin_rule` VALUES ('p','g_2','r_5','All','','',''),('p','g_2','r_9','All','','',''),('p','g_2','r_41','All','','',''),('p','g_2','r_42','All','','',''),('p','g_2','r_43','All','','',''),('p','g_2','r_10','All','','',''),('p','g_2','r_11','All','','',''),('p','g_2','r_47','All','','',''),('p','g_2','r_48','All','','',''),('p','g_2','r_49','All','','',''),('p','g_2','r_12','All','','',''),('p','g_2','r_50','All','','',''),('p','g_2','r_51','All','','',''),('p','g_2','r_52','All','','',''),('p','g_2','r_53','All','','',''),('p','g_2','r_57','All','','',''),('p','g_2','r_58','All','','',''),('p','g_2','r_59','All','','',''),('p','g_2','r_60','All','','',''),('p','g_2','r_61','All','','',''),('p','g_2','r_62','All','','',''),('g','u_31','g_1','','','',''),('g','u_31','g_2','','','',''),('p','g_1','r_46','All','','',''),('p','g_1','r_63','All','','',''),('p','g_1','r_64','All','','',''),('p','g_1','r_65','All','','',''),('p','g_1','r_5','All','','',''),('p','g_1','r_9','All','','',''),('p','g_1','r_41','All','','',''),('p','g_1','r_42','All','','',''),('p','g_1','r_43','All','','',''),('p','g_1','r_10','All','','',''),('p','g_1','r_11','All','','',''),('p','g_1','r_47','All','','',''),('p','g_1','r_48','All','','',''),('p','g_1','r_49','All','','',''),('p','g_1','r_12','All','','',''),('p','g_1','r_50','All','','',''),('p','g_1','r_51','All','','',''),('p','g_1','r_52','All','','',''),('p','g_1','r_53','All','','',''),('p','g_1','r_57','All','','',''),('p','g_1','r_58','All','','',''),('p','g_1','r_59','All','','',''),('p','g_1','r_60','All','','',''),('p','g_1','r_61','All','','',''),('p','g_1','r_62','All','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qxkj_auth_rule`
--

DROP TABLE IF EXISTS `qxkj_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qxkj_auth_rule` (
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
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='菜单节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_auth_rule`
--

LOCK TABLES `qxkj_auth_rule` WRITE;
/*!40000 ALTER TABLE `qxkj_auth_rule` DISABLE KEYS */;
INSERT INTO `qxkj_auth_rule` VALUES (5,'file',0,'/system/auth','权限管理','fa fa-users','','',1,1497429920,1582706271,80,1),(9,'file',5,'/system/auth/user-list','管理员管理','fa fa-user','','Admin tips',1,1497429920,1497430320,118,1),(10,'file',5,'/system/auth/adminlog','管理员日志','fa fa-list-alt','','Admin log tips',1,1497429920,1582731276,113,1),(11,'file',5,'/system/auth/role-list','角色组','fa fa-group','','Group tips',1,1497429920,1582706904,109,1),(12,'file',5,'/system/auth/menu-list','菜单规则','fa fa-bars','','Rule tips',1,1497429920,1582731459,104,1),(43,'file',9,'/system/auth/delete-admin','删除','fa fa-circle-o','','',0,1497429920,1582706783,1,1),(42,'file',9,'/system/auth/edit-user','修改','fa fa-circle-o','','',0,1497429920,1582706817,2,1),(41,'file',9,'/system/auth/add-user','添加','fa fa-circle-o','','',0,1497429920,1582726029,3,1),(47,'file',11,'/system/auth/add-role','添加角色','el-icon-document-add','','',0,1582706959,1582706959,50,1),(50,'file',12,'/system/auth/add-menu','添加菜单','el-icon-document-add','','',0,1582726105,1582726105,50,1),(46,'file',0,'/system/index/index','系统首页','el-icon-s-grid','noCheck','',1,1582704520,1582726295,100,1),(48,'file',11,'/system/auth/edit-role','修改角色','fa fa-pencil','','',0,1582706999,1582726035,50,1),(49,'file',11,'/system/auth/delete-role','删除角色','fa fa-institution','','',0,1582707051,1582726040,50,1),(51,'file',12,'/system/auth/edit-menu','修改菜单','fa fa-pencil','','',0,1582726145,1582726145,50,1),(52,'file',12,'/system/auth/delete-menu','删除菜单','fa fa-institution','','',0,1582726194,1582726194,50,1),(53,'file',12,'/system/auth/menu-sort','菜单排序','fa fa-list-ul','','',0,1582726229,1582726229,50,1),(57,'file',0,'/system/cms','CMS管理','fa fa-list','','',1,1582731636,1582731636,70,1),(58,'file',57,'/system/cms/menu-list','栏目管理','fa fa-list-ul','','',1,1582731762,1582732995,50,1),(59,'file',57,'/system/cms/news-list','内容管理','fa fa-th-list','','',1,1582731800,1582733003,50,1),(60,'file',57,'/system/cms/mode-list','模型管理','fa fa-codepen','','',1,1582731832,1582733011,50,1),(61,'file',57,'/system/cms/special-list','专题管理','fa fa-hand-pointer-o','','',1,1582732334,1582733018,50,1),(62,'file',57,'/system/cms/single-list','单页管理','fa fa-file-o','','',1,1582732373,1582733025,50,1),(63,'file',0,'/system/config','系统配置','fa fa-wrench','','',1,1582773590,1582773600,90,1),(64,'file',63,'/system/config/dict-list','字典管理','fa fa-sitemap','','',1,1582773640,1582773640,50,1),(65,'file',63,'/system/config/params-list','参数管理','fa fa-list-ul','','',1,1582773725,1582773725,50,1);
/*!40000 ALTER TABLE `qxkj_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qxkj_role`
--

DROP TABLE IF EXISTS `qxkj_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qxkj_role` (
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_role`
--

LOCK TABLES `qxkj_role` WRITE;
/*!40000 ALTER TABLE `qxkj_role` DISABLE KEYS */;
INSERT INTO `qxkj_role` VALUES (1,0,1,1329633709,1582773740,0,'超级管理员','备注'),(2,0,1,1329633709,1582732392,0,'普通管理员','备注'),(3,0,1,0,0,0,'站点管理员','站点管理人员'),(4,0,1,0,0,0,'初级管理员','初级管理员'),(5,0,1,0,0,0,'高级管理员','高级管理员'),(6,0,1,0,0,0,'超级管理员','超级管理员'),(7,0,1,0,0,0,'系统管理员','包含所有系统设置权限'),(8,0,1,0,0,0,'区级管理员','');
/*!40000 ALTER TABLE `qxkj_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qxkj_user`
--

DROP TABLE IF EXISTS `qxkj_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qxkj_user` (
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
-- Dumping data for table `qxkj_user`
--

LOCK TABLES `qxkj_user` WRITE;
/*!40000 ALTER TABLE `qxkj_user` DISABLE KEYS */;
INSERT INTO `qxkj_user` VALUES (1,'admin','18687460581','超级管理员',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh669@qq.com',0,'',1581491047,'192.168.31.221'),(2,'yixiaohu','13699885599','易小虎',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh@qq.com',1,'',1582190234,'[::1]'),(3,'zs','16399669855','张三',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'zs@qq.com',0,'',1559293160,'127.0.0.1'),(4,'qlgl','13758596696','测试',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'qlgl@qq.com',0,'',1559293134,'127.0.0.1'),(5,'test','13845696696','测试2',0,0,'9OFlt5qzzvCiZWhe7ilcLA==',1,'123@qq.com',0,'',0,''),(6,'18999998889','13755866654','刘大大',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'1223@qq.com',0,'',0,''),(7,'zmm','13788566696','张明明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'11123@qq.com',0,'',0,''),(8,'lxx','13756566696','李小小',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'123333@qq.com',0,'',1571729563,'127.0.0.1'),(10,'xmm','13588999969','小秘密',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(14,'cd_19','123154564','看金利科技',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(15,'lmm','135877545454','刘敏敏',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(16,'ldn','13899658874','李大牛',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(20,'dbc','13877555566','大百词',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(22,'yxfmlbb','15969423326','袁学飞',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh6691@qq.com',0,'',1565059554,'127.0.0.1'),(23,'wangming','13699888855','王明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(24,'zhk','13699885591','综合科',0,0,'IZNU7Pn91/++830Pi6HAWA==',1,'',0,'',1569288069,'192.168.0.146'),(28,'demo3','18699888855','测试账号1',0,1581314035,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(31,'demo','18699888856','测试账号1',0,1581314770,'9OFlt5qzzvCiZWhe7ilcLA==',1,'56@qq.com',0,'',1582772787,'192.168.31.221'),(32,'demo100','18699888859','测试账号1',0,1582103659,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(33,'demo110','18699888853','测试账号1',0,1582109337,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(34,'demo101','13855774455','测试账号1',0,1582110232,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(38,'demo103','18699888833','测试账号103',0,1582188923,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',1582188938,'[::1]');
/*!40000 ALTER TABLE `qxkj_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-27 11:23:06
