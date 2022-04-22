/*
Navicat MySQL Data Transfer

Source Server         : gfast-v3
Source Server Version : 50736
Source Host           : 192.168.0.212:3306
Source Database       : gfast-v3

Target Server Type    : MYSQL
Target Server Version : 50736
File Encoding         : 65001

Date: 2022-04-21 15:57:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `ptype` varchar(10) DEFAULT NULL,
  `v0` varchar(256) DEFAULT NULL,
  `v1` varchar(256) DEFAULT NULL,
  `v2` varchar(256) DEFAULT NULL,
  `v3` varchar(256) DEFAULT NULL,
  `v4` varchar(256) DEFAULT NULL,
  `v5` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('p', '2', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '3', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '4', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '3', '3', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '3', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '5', '4', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '10', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '4', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '10', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '12', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '13', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '14', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '42', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '42', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '1', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '1', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '2', '3', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '2', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '4', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '5', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '7', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '8', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '10', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '14', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '15', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '16', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '4', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '6', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '3', '2', '', '', '', '');

-- ----------------------------
-- Table structure for sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(300) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `is_hide` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示状态',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_link` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_iframe` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否内嵌iframe',
  `is_cached` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否缓存',
  `redirect` varchar(255) NOT NULL DEFAULT '' COMMENT '路由重定向地址',
  `is_affix` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否固定',
  `link_url` varchar(500) NOT NULL DEFAULT '' COMMENT '链接地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单节点表';

-- ----------------------------
-- Records of sys_auth_rule
-- ----------------------------
INSERT INTO `sys_auth_rule` VALUES ('1', '0', 'api/v1/system/auth', '权限管理', 'ele-Stamp', '', '', '0', '30', '0', '/system/auth', 'layout/routerView/parent', '0', '', '0', '0', '1', '0', '0', '', '2022-03-24 15:03:37', '2022-04-14 16:29:19');
INSERT INTO `sys_auth_rule` VALUES ('2', '1', 'api/v1/system/auth/menuList', '菜单管理', 'ele-Calendar', '', '', '1', '0', '0', '/system/auth/menuList', 'system/menu/index', '0', '', '0', '0', '1', '', '0', '', '2022-03-24 17:24:13', '2022-03-29 10:54:49');
INSERT INTO `sys_auth_rule` VALUES ('3', '2', 'api/v1/system/menu/add', '添加菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 16:48:43', '2022-03-29 17:05:19');
INSERT INTO `sys_auth_rule` VALUES ('4', '2', 'api/v1/system/menu/update', '修改菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 17:04:25', '2022-03-29 18:11:36');
INSERT INTO `sys_auth_rule` VALUES ('11', '2', 'api/v1/system/menu/delete', '删除菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:49:10', '2022-04-06 14:49:17');
INSERT INTO `sys_auth_rule` VALUES ('10', '1', 'api/v1/system/role/list', '角色管理', 'iconfont icon-juxingkaobei', '', '', '1', '0', '0', '/system/auth/roleList', 'system/role/index', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 18:15:03', '2022-03-30 10:25:34');
INSERT INTO `sys_auth_rule` VALUES ('12', '10', 'api/v1/system/role/add', '添加角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:49:46', '2022-04-06 14:49:46');
INSERT INTO `sys_auth_rule` VALUES ('13', '10', '/api/v1/system/role/edit', '修改角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:50:08', '2022-04-06 14:50:08');
INSERT INTO `sys_auth_rule` VALUES ('14', '10', '/api/v1/system/role/delete', '删除角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:50:22', '2022-04-06 14:50:22');
INSERT INTO `sys_auth_rule` VALUES ('15', '1', 'api/v1/system/dept/list', '部门管理', 'iconfont icon-siweidaotu', '', '', '1', '0', '0', '/system/auth/deptList', 'system/dept/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:52:23', '2022-04-07 22:59:20');
INSERT INTO `sys_auth_rule` VALUES ('16', '17', 'aliyun', '阿里云-iframe', 'iconfont icon-diannao1', '', '', '1', '0', '0', '/demo/outLink/aliyun', 'layout/routerView/iframes', '1', '', '0', '1', '1', '', '0', 'https://www.aliyun.com/daily-act/ecs/activity_selection?spm=5176.8789780.J_3965641470.5.568845b58KHj51', '2022-04-06 17:26:29', '2022-04-07 15:27:17');
INSERT INTO `sys_auth_rule` VALUES ('17', '0', 'outLink', '外链测试', 'iconfont icon-zhongduancanshu', '', '', '0', '20', '0', '/demo/outLink', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 15:20:51', '2022-04-14 16:29:07');
INSERT INTO `sys_auth_rule` VALUES ('18', '17', 'tenyun', '腾讯云-外链', 'iconfont icon-shouye_dongtaihui', '', '', '1', '0', '0', '/demo/outLink/tenyun', 'layout/routerView/link', '1', '', '0', '0', '1', '', '0', 'https://cloud.tencent.com/act/new?cps_key=20b1c3842f74986b2894e2c5fcde7ea2&fromSource=gwzcw.3775555.3775555.3775555&utm_id=gwzcw.3775555.3775555.3775555&utm_medium=cpc', '2022-04-07 15:23:52', '2022-04-07 15:27:25');
INSERT INTO `sys_auth_rule` VALUES ('19', '15', 'api/v1/system/dept/add', '添加部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:56:39', '2022-04-07 22:56:39');
INSERT INTO `sys_auth_rule` VALUES ('20', '15', 'api/v1/system/dept/edit', '修改部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:57:00', '2022-04-07 22:57:00');
INSERT INTO `sys_auth_rule` VALUES ('21', '15', 'api/v1/system/dept/delete', '删除部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:57:30', '2022-04-07 22:57:30');
INSERT INTO `sys_auth_rule` VALUES ('22', '1', 'api/v1/system/post/list', '岗位管理', 'iconfont icon-neiqianshujuchucun', '', '', '1', '0', '0', '/system/auth/postList', 'system/post/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:58:46', '2022-04-09 14:26:15');
INSERT INTO `sys_auth_rule` VALUES ('23', '22', 'api/v1/system/post/add', '添加岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:14:49', '2022-04-09 14:14:49');
INSERT INTO `sys_auth_rule` VALUES ('24', '22', 'api/v1/system/post/edit', '修改岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:15:25', '2022-04-09 14:15:25');
INSERT INTO `sys_auth_rule` VALUES ('25', '22', 'api/v1/system/post/delete', '删除岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:15:47', '2022-04-09 14:15:47');
INSERT INTO `sys_auth_rule` VALUES ('26', '1', 'api/v1/system/user/list', '用户管理', 'ele-User', '', '', '1', '0', '0', '/system/auth/user/list', 'system/user/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:19:10', '2022-04-09 14:19:58');
INSERT INTO `sys_auth_rule` VALUES ('27', '0', 'api/v1/system/dict', '系统配置', 'iconfont icon-shuxingtu', '', '', '0', '40', '0', '/system/dict', 'layout/routerView/parent', '0', '', '0', '0', '1', '654', '0', '', '2022-04-14 16:28:51', '2022-04-18 14:40:56');
INSERT INTO `sys_auth_rule` VALUES ('28', '27', 'api/v1/system/dict/type/list', '字典管理', 'iconfont icon-crew_feature', '', '', '1', '0', '0', '/system/dict/type/list', 'system/dict/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-14 16:32:10', '2022-04-16 17:02:50');
INSERT INTO `sys_auth_rule` VALUES ('29', '27', 'api/v1/system/dict/dataList', '字典数据管理', 'iconfont icon-putong', '', '', '1', '0', '1', '/system/dict/data/list/:dictType', 'system/dict/dataList', '0', '', '0', '0', '1', '', '0', '', '2022-04-18 12:04:17', '2022-04-18 14:58:43');
INSERT INTO `sys_auth_rule` VALUES ('30', '27', 'api/v1/system/config/list', '参数管理', 'ele-Cherry', '', '', '1', '0', '0', '/system/config/list', 'system/config/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-18 21:05:20', '2022-04-18 21:13:19');
INSERT INTO `sys_auth_rule` VALUES ('31', '0', 'api/v1/system/monitor', '系统监控', 'iconfont icon-xuanzeqi', '', '', '0', '30', '0', '/system/monitor', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-04-19 10:40:19', '2022-04-19 10:44:38');
INSERT INTO `sys_auth_rule` VALUES ('32', '31', 'api/v1/system/monitor/server', '服务监控', 'iconfont icon-shuju', '', '', '1', '0', '0', '/system/monitor/server', 'system/monitor/server/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-19 10:43:32', '2022-04-19 10:44:47');
INSERT INTO `sys_auth_rule` VALUES ('33', '31', 'api/swagger', 'api文档', 'iconfont icon--chaifenlie', '', '', '1', '0', '0', '/system/swagger', 'layout/routerView/iframes', '1', '', '0', '1', '1', '', '0', 'http://localhost:8201/swagger', '2022-04-21 09:23:43', '2022-04-21 11:19:49');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) DEFAULT '0' COMMENT '系统内置（Y是 N否）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE KEY `uni_config_key` (`config_key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '文件上传-文件大小', 'sys.uploadFile.fileSize', '50M', '1', '31', '31', '文件上传大小限制', null, '2021-07-06 14:57:35');
INSERT INTO `sys_config` VALUES ('2', '文件上传-文件类型', 'sys.uploadFile.fileType', 'doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png', '1', '31', '31', '文件上传后缀类型限制', null, null);
INSERT INTO `sys_config` VALUES ('3', '图片上传-图片类型', 'sys.uploadFile.imageType', 'jpg,jpeg,gif,npm,png', '1', '31', '0', '图片上传后缀类型限制', null, null);
INSERT INTO `sys_config` VALUES ('4', '图片上传-图片大小', 'sys.uploadFile.imageSize', '50M', '1', '31', '31', '图片上传大小限制', null, null);
INSERT INTO `sys_config` VALUES ('11', '静态资源', 'static.resource', '/', '1', '2', '0', '', null, null);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '奇讯科技', '0', '若依', '15888888888', 'ry@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2021-07-13 15:57:05', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2021-11-04 09:16:38', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('200', '100', '', '大数据', '1', '小刘', '18888888888', 'liou@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('201', '100', '', '开发', '1', '老李', '18888888888', 'li@qq.com', '0', '31', null, '2021-07-13 15:56:52', '2022-04-07 22:35:21', null);
INSERT INTO `sys_dept` VALUES ('202', '108', '', '外勤', '1', '小a', '18888888888', 'aa@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('203', '108', '', '行政', '0', 'aa', '18888888888', 'aa@qq.com', '0', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
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
  `update_by` bigint(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '0', '男', '1', 'sys_user_sex', '', '', '0', '1', '31', '2', '备注信息', '2022-04-18 16:46:22', null);
INSERT INTO `sys_dict_data` VALUES ('2', '0', '女', '2', 'sys_user_sex', '', '', '0', '1', '31', '31', '备注信息', null, null);
INSERT INTO `sys_dict_data` VALUES ('3', '0', '保密', '0', 'sys_user_sex', '', '', '1', '1', '31', '31', '备注信息', null, null);
INSERT INTO `sys_dict_data` VALUES ('24', '0', '频道页', '1', 'cms_category_type', '', '', '0', '1', '31', '31', '作为频道页，不可作为栏目发布文章，可添加下级分类', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('25', '0', '发布栏目', '2', 'cms_category_type', '', '', '0', '1', '31', '31', '作为发布栏目，可添加文章', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('26', '0', '跳转栏目', '3', 'cms_category_type', '', '', '0', '1', '31', '31', '不直接发布内容，用于跳转页面', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('27', '0', '单页栏目', '4', 'cms_category_type', '', '', '0', '1', '31', '31', '单页面模式，分类直接显示为文章', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('28', '0', '正常', '0', 'sys_job_status', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('29', '0', '暂停', '1', 'sys_job_status', '', 'default', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('30', '0', '默认', 'DEFAULT', 'sys_job_group', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('31', '0', '系统', 'SYSTEM', 'sys_job_group', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('32', '0', '成功', '1', 'admin_login_status', '', 'default', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('33', '0', '失败', '0', 'admin_login_status', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('34', '0', '成功', '1', 'sys_oper_log_status', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('35', '0', '失败', '0', 'sys_oper_log_status', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('36', '0', '重复执行', '1', 'sys_job_policy', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('37', '0', '执行一次', '2', 'sys_job_policy', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('38', '0', '显示', '0', 'sys_show_hide', null, 'default', '1', '1', '31', '0', null, null, null);
INSERT INTO `sys_dict_data` VALUES ('39', '0', '隐藏', '1', 'sys_show_hide', null, 'default', '0', '1', '31', '0', null, null, null);
INSERT INTO `sys_dict_data` VALUES ('40', '0', '正常', '1', 'sys_normal_disable', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('41', '0', '停用', '0', 'sys_normal_disable', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('49', '0', '是', '1', 'sys_yes_no', '', '', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('50', '0', '否', '0', 'sys_yes_no', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('51', '0', '已发布', '1', 'cms_article_pub_type', '', '', '1', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('54', '0', '未发布', '0', 'cms_article_pub_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('55', '0', '置顶', '1', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('56', '0', '推荐', '2', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('57', '0', '普通文章', '0', 'cms_article_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('58', '0', '跳转链接', '1', 'cms_article_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('59', '0', 'cms模型', '6', 'cms_cate_models', '', '', '0', '1', '1', '1', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('61', '0', '政府工作目标', '1', 'gov_cate_models', '', '', '0', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('62', '0', '系统后台', 'sys_admin', 'menu_module_type', '', '', '1', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('63', '0', '政务工作', 'gov_work', 'menu_module_type', '', '', '0', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('64', '0', '幻灯', '3', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('65', '0', '[work]测试业务表', 'wf_news', 'flow_type', '', '', '0', '1', '2', '2', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('66', '0', '回退修改', '-1', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('67', '0', '保存中', '0', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('68', '0', '流程中', '1', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('69', '0', '审批通过', '2', 'flow_status', '', '', '0', '1', '31', '2', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('70', '2', '发布栏目', '2', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('71', '3', '跳转栏目', '3', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('72', '4', '单页栏目', '4', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('73', '2', '置顶', '1', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('74', '3', '幻灯', '2', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('75', '4', '推荐', '3', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('76', '1', '一般', '0', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('77', '1', '频道页', '1', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('78', '0', '普通', '0', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('79', '0', '加急', '1', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('80', '0', '紧急', '2', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('81', '0', '特急', '3', 'flow_level', '', '', '0', '1', '31', '31', '', null, '2021-07-20 08:55:25');
INSERT INTO `sys_dict_data` VALUES ('82', '0', '频道页', '1', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('83', '0', '发布栏目', '2', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('84', '0', '跳转栏目', '3', 'sys_blog_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('85', '0', '单页栏目', '4', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('87', '0', '[cms]文章表', 'cms_news', 'flow_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('91', '0', '测试一下', '666', 'cms_article_type', '', '', '0', '1', '31', '0', '', '2021-08-03 17:04:12', '2021-08-03 17:04:12');
INSERT INTO `sys_dict_data` VALUES ('92', '0', '缓存测试222', '33333', 'cms_article_type', '', '', '0', '1', '31', '31', '', '2021-08-03 17:16:45', '2021-08-03 17:19:41');
INSERT INTO `sys_dict_data` VALUES ('93', '0', '缓存测试222', '11111', 'cms_article_type', '', '', '0', '1', '31', '31', '', '2021-08-03 17:26:14', '2021-08-03 17:26:26');
INSERT INTO `sys_dict_data` VALUES ('94', '0', '1折', '10', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 11:59:38', '2021-08-14 11:59:38');
INSERT INTO `sys_dict_data` VALUES ('95', '0', '5折', '50', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 11:59:49', '2021-08-14 11:59:49');
INSERT INTO `sys_dict_data` VALUES ('96', '0', '8折', '80', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:00', '2021-08-14 12:00:00');
INSERT INTO `sys_dict_data` VALUES ('97', '0', '9折', '90', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:07', '2021-08-14 12:00:07');
INSERT INTO `sys_dict_data` VALUES ('98', '0', '无折扣', '100', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:16', '2021-08-14 12:00:16');
INSERT INTO `sys_dict_data` VALUES ('99', '0', '不显示', 'none', 'cms_nav_position', '', '', '1', '1', '22', '0', '', '2021-08-31 15:37:35', '2021-08-31 15:37:35');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '顶部导航', 'top', 'cms_nav_position', '', '', '0', '1', '22', '0', '', '2021-08-31 15:37:57', '2021-08-31 15:37:57');
INSERT INTO `sys_dict_data` VALUES ('101', '0', '底部导航', 'bottom', 'cms_nav_position', '', '', '0', '1', '22', '0', '', '2021-08-31 15:38:08', '2021-08-31 15:38:08');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '1', '31', '1', '用于选择用户性别', null, null);
INSERT INTO `sys_dict_type` VALUES ('2', '分类类型', 'cms_category_type', '1', '31', '3', '文章分类类型', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_type` VALUES ('3', '任务状态', 'sys_job_status', '1', '31', '31', '任务状态列表', null, null);
INSERT INTO `sys_dict_type` VALUES ('13', '任务分组', 'sys_job_group', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('14', '管理员登录状态', 'admin_login_status', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('15', '操作日志状态', 'sys_oper_log_status', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('16', '任务策略', 'sys_job_policy', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('17', '菜单状态', 'sys_show_hide', '1', '31', '0', '菜单状态', null, null);
INSERT INTO `sys_dict_type` VALUES ('18', '系统开关', 'sys_normal_disable', '1', '31', '31', '系统开关', null, null);
INSERT INTO `sys_dict_type` VALUES ('24', '系统内置', 'sys_yes_no', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('25', '文章发布状态', 'cms_article_pub_type', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('26', '文章附加状态', 'cms_article_attr', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('27', '文章类型', 'cms_article_type', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('28', '文章栏目模型分类', 'cms_cate_models', '1', '1', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('29', '政务工作模型分类', 'gov_cate_models', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('30', '菜单模块类型', 'menu_module_type', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('31', '工作流程类型', 'flow_type', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('32', '工作流程审批状态', 'flow_status', '1', '31', '0', '工作流程审批状态', null, null);
INSERT INTO `sys_dict_type` VALUES ('33', '博客分类类型', 'sys_blog_type', '1', '31', '31', '博客分类中的标志', null, null);
INSERT INTO `sys_dict_type` VALUES ('34', '博客日志标志', 'sys_log_sign', '1', '31', '0', '博客日志管理中的标志数据字典', null, null);
INSERT INTO `sys_dict_type` VALUES ('35', '工作流紧急状态', 'flow_level', '1', '31', '31', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_type` VALUES ('48', '插件商城折扣', 'plugin_store_discount', '1', '31', '0', '', '2021-08-14 11:59:26', '2021-08-14 11:59:26');
INSERT INTO `sys_dict_type` VALUES ('49', 'CMS栏目导航位置', 'cms_nav_position', '1', '22', '0', '', '2021-08-31 15:37:04', '2021-08-31 15:37:04');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=883 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';


-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
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
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '1', '', '0', '0', '2021-07-11 11:32:58', null, null);
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '1', '', '0', '0', '2021-07-12 11:01:26', null, null);
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '1', '', '0', '0', '2021-07-12 11:01:30', null, null);
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', '普通员工', '0', '31', '2021-07-12 11:01:33', '2022-04-08 15:32:23', null);
INSERT INTO `sys_post` VALUES ('5', 'it', 'IT部', '5', '1', '信息部', '31', '31', '2021-07-12 11:09:42', '2022-04-09 12:59:12', null);
INSERT INTO `sys_post` VALUES ('6', '1111', '1111', '0', '1', '11111', '31', '0', '2022-04-08 15:32:44', '2022-04-08 15:32:44', '2022-04-08 15:51:24');
INSERT INTO `sys_post` VALUES ('7', '222', '2222', '0', '1', '22222', '31', '0', '2022-04-08 15:32:55', '2022-04-08 15:32:55', '2022-04-08 15:51:24');
INSERT INTO `sys_post` VALUES ('8', '33333', '3333', '0', '0', '33333', '31', '0', '2022-04-08 15:33:01', '2022-04-08 15:33:01', '2022-04-08 15:51:40');
INSERT INTO `sys_post` VALUES ('9', '222', '111', '0', '1', '2313213', '31', '0', '2022-04-08 15:52:53', '2022-04-08 15:52:53', '2022-04-08 15:52:56');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `list_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '超级管理员', '备注', '3', '2022-04-01 11:38:39', '2022-04-09 12:59:28');
INSERT INTO `sys_role` VALUES ('2', '1', '0', '普通管理员', '备注', '3', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('3', '1', '0', '站点管理员', '站点管理人员', '3', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('4', '1', '0', '初级管理员', '初级管理员', '3', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('5', '1', '0', '高级管理员', '高级管理员', '2', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('8', '1', '0', '区级管理员', '', '2', '2022-04-01 11:38:39', '2022-04-06 09:53:40');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('5', '103');
INSERT INTO `sys_role_dept` VALUES ('5', '104');
INSERT INTO `sys_role_dept` VALUES ('5', '105');
INSERT INTO `sys_role_dept` VALUES ('8', '105');
INSERT INTO `sys_role_dept` VALUES ('8', '106');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_login` (`user_name`,`deleted_at`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`,`deleted_at`) USING BTREE,
  KEY `user_nickname` (`user_nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '13578342363', '超级管理员', '0', 'c567ae329f9929b518759d3bea13f492', 'f9aZTAa8yz', '1', 'yxh669@qq.com', '1', 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-19/ccwpeuqz1i2s769hua.jpeg', '101', '', '1', 'asdasfdsaf大发放打发士大夫发按时', '描述信息', '::1', '2022-04-19 16:38:37', '2021-06-22 17:58:00', '2022-04-19 16:38:37', null);
INSERT INTO `sys_user` VALUES ('31', 'demo', '15334455789', '李四', '0', '39978de67915a11e94bfe9c879b2d9a1', 'gqwLs4n95E', '1', '223@qq.com', '2', 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-11-30/cg30rab8myj85vjzcf.jpeg', '109', '', '1', '云南省曲靖市22223', '12345', '::1', '2022-04-21 09:22:27', '2021-06-22 17:58:00', '2022-04-21 09:22:27', null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `ip` varchar(120) NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(30) NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_token` (`token`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17387 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户在线状态表';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '2');
INSERT INTO `sys_user_post` VALUES ('1', '3');
INSERT INTO `sys_user_post` VALUES ('2', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '2');
INSERT INTO `sys_user_post` VALUES ('5', '2');
INSERT INTO `sys_user_post` VALUES ('10', '1');
INSERT INTO `sys_user_post` VALUES ('10', '2');
INSERT INTO `sys_user_post` VALUES ('10', '3');
INSERT INTO `sys_user_post` VALUES ('10', '4');
INSERT INTO `sys_user_post` VALUES ('10', '5');
INSERT INTO `sys_user_post` VALUES ('14', '1');
INSERT INTO `sys_user_post` VALUES ('15', '4');
INSERT INTO `sys_user_post` VALUES ('16', '2');
INSERT INTO `sys_user_post` VALUES ('22', '1');
INSERT INTO `sys_user_post` VALUES ('22', '2');
INSERT INTO `sys_user_post` VALUES ('31', '2');
INSERT INTO `sys_user_post` VALUES ('34', '1');
INSERT INTO `sys_user_post` VALUES ('35', '2');
INSERT INTO `sys_user_post` VALUES ('35', '3');
INSERT INTO `sys_user_post` VALUES ('36', '1');
INSERT INTO `sys_user_post` VALUES ('37', '3');
INSERT INTO `sys_user_post` VALUES ('38', '2');
INSERT INTO `sys_user_post` VALUES ('38', '3');
INSERT INTO `sys_user_post` VALUES ('42', '2');
INSERT INTO `sys_user_post` VALUES ('42', '3');
