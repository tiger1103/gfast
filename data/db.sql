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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_role`
--

LOCK TABLES `qxkj_role` WRITE;
/*!40000 ALTER TABLE `qxkj_role` DISABLE KEYS */;
INSERT INTO `qxkj_role` VALUES (1,0,1,1329633709,1329633709,0,'超级管理员','拥有网站最高管理员权限！'),(2,0,1,1329633709,1329633709,0,'普通管理员','权限由最高管理员分配！'),(3,0,1,0,0,0,'站点管理员','站点管理人员'),(4,0,1,0,0,0,'初级管理员','初级管理员'),(5,0,1,0,0,0,'高级管理员','高级管理员'),(6,0,0,0,0,0,'超级管理员','超级管理员'),(7,0,1,0,0,0,'系统管理员','包含所有系统设置权限'),(8,0,1,0,0,0,'区级管理员','');
/*!40000 ALTER TABLE `qxkj_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qxkj_role_user`
--

DROP TABLE IF EXISTS `qxkj_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qxkj_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_role_user`
--

LOCK TABLES `qxkj_role_user` WRITE;
/*!40000 ALTER TABLE `qxkj_role_user` DISABLE KEYS */;
INSERT INTO `qxkj_role_user` VALUES (6,3,4),(8,2,5),(10,2,6),(20,4,7),(21,7,2),(23,2,10),(27,2,14),(28,2,15),(29,2,16),(47,2,20),(48,7,3),(49,2,3),(50,2,23),(51,7,22),(52,2,24),(53,5,8);
/*!40000 ALTER TABLE `qxkj_role_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_user`
--

LOCK TABLES `qxkj_user` WRITE;
/*!40000 ALTER TABLE `qxkj_user` DISABLE KEYS */;
INSERT INTO `qxkj_user` VALUES (1,'admin','18687460581','超级管理员',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh669@qq.com',0,'',1571734295,'127.0.0.1'),(2,'yixiaohu','13699885599','易小虎',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh@qq.com',1,'',1571923157,'192.168.31.221'),(3,'zs','16399669855','张三',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'zs@qq.com',0,'',1559293160,'127.0.0.1'),(4,'qlgl','13758596696','测试',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'qlgl@qq.com',0,'',1559293134,'127.0.0.1'),(5,'test','13845696696','测试2',0,0,'9OFlt5qzzvCiZWhe7ilcLA==',1,'123@qq.com',0,'',0,''),(6,'18999998889','13755866654','刘大大',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'1223@qq.com',0,'',0,''),(7,'zmm','13788566696','张明明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'11123@qq.com',0,'',0,''),(8,'lxx','13756566696','李小小',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'123333@qq.com',0,'',1571729563,'127.0.0.1'),(10,'xmm','13588999969','小秘密',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(14,'cd_19','123154564','看金利科技',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(15,'lmm','135877545454','刘敏敏',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(16,'ldn','13899658874','李大牛',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(20,'dbc','13877555566','大百词',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(22,'yxfmlbb','15969423326','袁学飞',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh6691@qq.com',0,'',1565059554,'127.0.0.1'),(23,'wangming','13699888855','王明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(24,'zhk','13699885591','综合科',0,0,'IZNU7Pn91/++830Pi6HAWA==',1,'',0,'',1569288069,'192.168.0.146');
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

-- Dump completed on 2019-12-26 22:52:55
