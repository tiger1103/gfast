/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : gfast-v3

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 22/04/2022 18:17:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `ptype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v0` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v3` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v4` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v5` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

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
CREATE TABLE `sys_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `is_hide` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示状态',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_link` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型ID',
  `is_iframe` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否内嵌iframe',
  `is_cached` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否缓存',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由重定向地址',
  `is_affix` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否固定',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auth_rule
-- ----------------------------
INSERT INTO `sys_auth_rule` VALUES (1, 0, 'api/v1/system/auth', '权限管理', 'ele-Stamp', '', '', 0, 30, 0, '/system/auth', 'layout/routerView/parent', 0, '', 0, 0, 1, '0', 0, '', '2022-03-24 15:03:37', '2022-04-14 16:29:19');
INSERT INTO `sys_auth_rule` VALUES (2, 1, 'api/v1/system/auth/menuList', '菜单管理', 'ele-Calendar', '', '', 1, 0, 0, '/system/auth/menuList', 'system/menu/index', 0, '', 0, 0, 1, '', 0, '', '2022-03-24 17:24:13', '2022-03-29 10:54:49');
INSERT INTO `sys_auth_rule` VALUES (3, 2, 'api/v1/system/menu/add', '添加菜单', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-03-29 16:48:43', '2022-03-29 17:05:19');
INSERT INTO `sys_auth_rule` VALUES (4, 2, 'api/v1/system/menu/update', '修改菜单', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-03-29 17:04:25', '2022-03-29 18:11:36');
INSERT INTO `sys_auth_rule` VALUES (10, 1, 'api/v1/system/role/list', '角色管理', 'iconfont icon-juxingkaobei', '', '', 1, 0, 0, '/system/auth/roleList', 'system/role/index', 0, '', 0, 0, 1, '', 0, '', '2022-03-29 18:15:03', '2022-03-30 10:25:34');
INSERT INTO `sys_auth_rule` VALUES (11, 2, 'api/v1/system/menu/delete', '删除菜单', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:49:10', '2022-04-06 14:49:17');
INSERT INTO `sys_auth_rule` VALUES (12, 10, 'api/v1/system/role/add', '添加角色', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:49:46', '2022-04-06 14:49:46');
INSERT INTO `sys_auth_rule` VALUES (13, 10, '/api/v1/system/role/edit', '修改角色', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:50:08', '2022-04-06 14:50:08');
INSERT INTO `sys_auth_rule` VALUES (14, 10, '/api/v1/system/role/delete', '删除角色', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:50:22', '2022-04-06 14:50:22');
INSERT INTO `sys_auth_rule` VALUES (15, 1, 'api/v1/system/dept/list', '部门管理', 'iconfont icon-siweidaotu', '', '', 1, 0, 0, '/system/auth/deptList', 'system/dept/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:52:23', '2022-04-07 22:59:20');
INSERT INTO `sys_auth_rule` VALUES (16, 17, 'aliyun', '阿里云-iframe', 'iconfont icon-diannao1', '', '', 1, 0, 0, '/demo/outLink/aliyun', 'layout/routerView/iframes', 1, '', 0, 1, 1, '', 0, 'https://www.aliyun.com/daily-act/ecs/activity_selection?spm=5176.8789780.J_3965641470.5.568845b58KHj51', '2022-04-06 17:26:29', '2022-04-07 15:27:17');
INSERT INTO `sys_auth_rule` VALUES (17, 0, 'outLink', '外链测试', 'iconfont icon-zhongduancanshu', '', '', 0, 20, 0, '/demo/outLink', 'layout/routerView/parent', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 15:20:51', '2022-04-14 16:29:07');
INSERT INTO `sys_auth_rule` VALUES (18, 17, 'tenyun', '腾讯云-外链', 'iconfont icon-shouye_dongtaihui', '', '', 1, 0, 0, '/demo/outLink/tenyun', 'layout/routerView/link', 1, '', 0, 0, 1, '', 0, 'https://cloud.tencent.com/act/new?cps_key=20b1c3842f74986b2894e2c5fcde7ea2&fromSource=gwzcw.3775555.3775555.3775555&utm_id=gwzcw.3775555.3775555.3775555&utm_medium=cpc', '2022-04-07 15:23:52', '2022-04-07 15:27:25');
INSERT INTO `sys_auth_rule` VALUES (19, 15, 'api/v1/system/dept/add', '添加部门', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:56:39', '2022-04-07 22:56:39');
INSERT INTO `sys_auth_rule` VALUES (20, 15, 'api/v1/system/dept/edit', '修改部门', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:57:00', '2022-04-07 22:57:00');
INSERT INTO `sys_auth_rule` VALUES (21, 15, 'api/v1/system/dept/delete', '删除部门', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:57:30', '2022-04-07 22:57:30');
INSERT INTO `sys_auth_rule` VALUES (22, 1, 'api/v1/system/post/list', '岗位管理', 'iconfont icon-neiqianshujuchucun', '', '', 1, 0, 0, '/system/auth/postList', 'system/post/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:58:46', '2022-04-09 14:26:15');
INSERT INTO `sys_auth_rule` VALUES (23, 22, 'api/v1/system/post/add', '添加岗位', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:14:49', '2022-04-09 14:14:49');
INSERT INTO `sys_auth_rule` VALUES (24, 22, 'api/v1/system/post/edit', '修改岗位', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:15:25', '2022-04-09 14:15:25');
INSERT INTO `sys_auth_rule` VALUES (25, 22, 'api/v1/system/post/delete', '删除岗位', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:15:47', '2022-04-09 14:15:47');
INSERT INTO `sys_auth_rule` VALUES (26, 1, 'api/v1/system/user/list', '用户管理', 'ele-User', '', '', 1, 0, 0, '/system/auth/user/list', 'system/user/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:19:10', '2022-04-09 14:19:58');
INSERT INTO `sys_auth_rule` VALUES (27, 0, 'api/v1/system/dict', '系统配置', 'iconfont icon-shuxingtu', '', '', 0, 40, 0, '/system/dict', 'layout/routerView/parent', 0, '', 0, 0, 1, '654', 0, '', '2022-04-14 16:28:51', '2022-04-18 14:40:56');
INSERT INTO `sys_auth_rule` VALUES (28, 27, 'api/v1/system/dict/type/list', '字典管理', 'iconfont icon-crew_feature', '', '', 1, 0, 0, '/system/dict/type/list', 'system/dict/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-14 16:32:10', '2022-04-16 17:02:50');
INSERT INTO `sys_auth_rule` VALUES (29, 27, 'api/v1/system/dict/dataList', '字典数据管理', 'iconfont icon-putong', '', '', 1, 0, 1, '/system/dict/data/list/:dictType', 'system/dict/dataList', 0, '', 0, 0, 1, '', 0, '', '2022-04-18 12:04:17', '2022-04-18 14:58:43');
INSERT INTO `sys_auth_rule` VALUES (30, 27, 'api/v1/system/config/list', '参数管理', 'ele-Cherry', '', '', 1, 0, 0, '/system/config/list', 'system/config/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-18 21:05:20', '2022-04-18 21:13:19');
INSERT INTO `sys_auth_rule` VALUES (31, 0, 'api/v1/system/monitor', '系统监控', 'iconfont icon-xuanzeqi', '', '', 0, 30, 0, '/system/monitor', 'layout/routerView/parent', 0, '', 0, 0, 1, '', 0, '', '2022-04-19 10:40:19', '2022-04-19 10:44:38');
INSERT INTO `sys_auth_rule` VALUES (32, 31, 'api/v1/system/monitor/server', '服务监控', 'iconfont icon-shuju', '', '', 1, 0, 0, '/system/monitor/server', 'system/monitor/server/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-19 10:43:32', '2022-04-19 10:44:47');
INSERT INTO `sys_auth_rule` VALUES (33, 31, 'api/swagger', 'api文档', 'iconfont icon--chaifenlie', '', '', 1, 0, 0, '/system/swagger', 'layout/routerView/iframes', 1, '', 0, 1, 1, '', 0, 'http://localhost:8201/swagger', '2022-04-21 09:23:43', '2022-04-21 11:19:49');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) NULL DEFAULT 0 COMMENT '系统内置（Y是 N否）',
  `create_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `update_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `uni_config_key`(`config_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '文件上传-文件大小', 'sys.uploadFile.fileSize', '50M', 1, 31, 31, '文件上传大小限制', NULL, '2021-07-06 14:57:35');
INSERT INTO `sys_config` VALUES (2, '文件上传-文件类型', 'sys.uploadFile.fileType', 'doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png', 1, 31, 31, '文件上传后缀类型限制', NULL, NULL);
INSERT INTO `sys_config` VALUES (3, '图片上传-图片类型', 'sys.uploadFile.imageType', 'jpg,jpeg,gif,npm,png', 1, 31, 0, '图片上传后缀类型限制', NULL, NULL);
INSERT INTO `sys_config` VALUES (4, '图片上传-图片大小', 'sys.uploadFile.imageSize', '50M', 1, 31, 31, '图片上传大小限制', NULL, NULL);
INSERT INTO `sys_config` VALUES (11, '静态资源', 'static.resource', '/', 1, 2, 0, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '奇讯科技', 0, '若依', '15888888888', 'ry@qq.com', 1, 0, 31, '2021-07-13 15:56:52', '2021-07-13 15:57:05', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', 1, 0, 31, '2021-07-13 15:56:52', '2021-11-04 09:16:38', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '', '大数据', 1, '小刘', '18888888888', 'liou@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (201, 100, '', '开发', 1, '老李', '18888888888', 'li@qq.com', 0, 31, NULL, '2021-07-13 15:56:52', '2022-04-07 22:35:21', NULL);
INSERT INTO `sys_dept` VALUES (202, 108, '', '外勤', 1, '小a', '18888888888', 'aa@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (203, 108, '', '行政', 0, 'aa', '18888888888', 'aa@qq.com', 0, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `create_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `update_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 0, '男', '1', 'sys_user_sex', '', '', 0, 1, 31, 2, '备注信息', '2022-04-18 16:46:22', NULL);
INSERT INTO `sys_dict_data` VALUES (2, 0, '女', '2', 'sys_user_sex', '', '', 0, 1, 31, 31, '备注信息', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (3, 0, '保密', '0', 'sys_user_sex', '', '', 1, 1, 31, 31, '备注信息', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (24, 0, '频道页', '1', 'cms_category_type', '', '', 0, 1, 31, 31, '作为频道页，不可作为栏目发布文章，可添加下级分类', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (25, 0, '发布栏目', '2', 'cms_category_type', '', '', 0, 1, 31, 31, '作为发布栏目，可添加文章', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (26, 0, '跳转栏目', '3', 'cms_category_type', '', '', 0, 1, 31, 31, '不直接发布内容，用于跳转页面', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (27, 0, '单页栏目', '4', 'cms_category_type', '', '', 0, 1, 31, 31, '单页面模式，分类直接显示为文章', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (28, 0, '正常', '0', 'sys_job_status', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (29, 0, '暂停', '1', 'sys_job_status', '', 'default', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (30, 0, '默认', 'DEFAULT', 'sys_job_group', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '系统', 'SYSTEM', 'sys_job_group', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 0, '成功', '1', 'admin_login_status', '', 'default', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 0, '失败', '0', 'admin_login_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 0, '成功', '1', 'sys_oper_log_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 0, '失败', '0', 'sys_oper_log_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 0, '重复执行', '1', 'sys_job_policy', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 0, '执行一次', '2', 'sys_job_policy', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 0, '显示', '0', 'sys_show_hide', NULL, 'default', 1, 1, 31, 0, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 0, '隐藏', '1', 'sys_show_hide', NULL, 'default', 0, 1, 31, 0, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 0, '正常', '1', 'sys_normal_disable', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 0, '停用', '0', 'sys_normal_disable', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 0, '是', '1', 'sys_yes_no', '', '', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 0, '否', '0', 'sys_yes_no', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 0, '已发布', '1', 'cms_article_pub_type', '', '', 1, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (54, 0, '未发布', '0', 'cms_article_pub_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (55, 0, '置顶', '1', 'cms_article_attr', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (56, 0, '推荐', '2', 'cms_article_attr', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (57, 0, '普通文章', '0', 'cms_article_type', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (58, 0, '跳转链接', '1', 'cms_article_type', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (59, 0, 'cms模型', '6', 'cms_cate_models', '', '', 0, 1, 1, 1, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (61, 0, '政府工作目标', '1', 'gov_cate_models', '', '', 0, 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (62, 0, '系统后台', 'sys_admin', 'menu_module_type', '', '', 1, 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (63, 0, '政务工作', 'gov_work', 'menu_module_type', '', '', 0, 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (64, 0, '幻灯', '3', 'cms_article_attr', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (65, 0, '[work]测试业务表', 'wf_news', 'flow_type', '', '', 0, 1, 2, 2, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (66, 0, '回退修改', '-1', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (67, 0, '保存中', '0', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (68, 0, '流程中', '1', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (69, 0, '审批通过', '2', 'flow_status', '', '', 0, 1, 31, 2, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (70, 2, '发布栏目', '2', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (71, 3, '跳转栏目', '3', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (72, 4, '单页栏目', '4', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (73, 2, '置顶', '1', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (74, 3, '幻灯', '2', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (75, 4, '推荐', '3', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (76, 1, '一般', '0', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (77, 1, '频道页', '1', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (78, 0, '普通', '0', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES (79, 0, '加急', '1', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES (80, 0, '紧急', '2', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES (81, 0, '特急', '3', 'flow_level', '', '', 0, 1, 31, 31, '', NULL, '2021-07-20 08:55:25');
INSERT INTO `sys_dict_data` VALUES (82, 0, '频道页', '1', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (83, 0, '发布栏目', '2', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (84, 0, '跳转栏目', '3', 'sys_blog_type', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (85, 0, '单页栏目', '4', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (87, 0, '[cms]文章表', 'cms_news', 'flow_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (91, 0, '测试一下', '666', 'cms_article_type', '', '', 0, 1, 31, 0, '', '2021-08-03 17:04:12', '2021-08-03 17:04:12');
INSERT INTO `sys_dict_data` VALUES (92, 0, '缓存测试222', '33333', 'cms_article_type', '', '', 0, 1, 31, 31, '', '2021-08-03 17:16:45', '2021-08-03 17:19:41');
INSERT INTO `sys_dict_data` VALUES (93, 0, '缓存测试222', '11111', 'cms_article_type', '', '', 0, 1, 31, 31, '', '2021-08-03 17:26:14', '2021-08-03 17:26:26');
INSERT INTO `sys_dict_data` VALUES (94, 0, '1折', '10', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 11:59:38', '2021-08-14 11:59:38');
INSERT INTO `sys_dict_data` VALUES (95, 0, '5折', '50', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 11:59:49', '2021-08-14 11:59:49');
INSERT INTO `sys_dict_data` VALUES (96, 0, '8折', '80', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 12:00:00', '2021-08-14 12:00:00');
INSERT INTO `sys_dict_data` VALUES (97, 0, '9折', '90', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 12:00:07', '2021-08-14 12:00:07');
INSERT INTO `sys_dict_data` VALUES (98, 0, '无折扣', '100', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 12:00:16', '2021-08-14 12:00:16');
INSERT INTO `sys_dict_data` VALUES (99, 0, '不显示', 'none', 'cms_nav_position', '', '', 1, 1, 22, 0, '', '2021-08-31 15:37:35', '2021-08-31 15:37:35');
INSERT INTO `sys_dict_data` VALUES (100, 0, '顶部导航', 'top', 'cms_nav_position', '', '', 0, 1, 22, 0, '', '2021-08-31 15:37:57', '2021-08-31 15:37:57');
INSERT INTO `sys_dict_data` VALUES (101, 0, '底部导航', 'bottom', 'cms_nav_position', '', '', 0, 1, 22, 0, '', '2021-08-31 15:38:08', '2021-08-31 15:38:08');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `create_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `update_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', 1, 31, 1, '用于选择用户性别', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (2, '分类类型', 'cms_category_type', 1, 31, 3, '文章分类类型', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_type` VALUES (3, '任务状态', 'sys_job_status', 1, 31, 31, '任务状态列表', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (13, '任务分组', 'sys_job_group', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (14, '管理员登录状态', 'admin_login_status', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (15, '操作日志状态', 'sys_oper_log_status', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (16, '任务策略', 'sys_job_policy', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (17, '菜单状态', 'sys_show_hide', 1, 31, 0, '菜单状态', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (18, '系统开关', 'sys_normal_disable', 1, 31, 31, '系统开关', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (24, '系统内置', 'sys_yes_no', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (25, '文章发布状态', 'cms_article_pub_type', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (26, '文章附加状态', 'cms_article_attr', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (27, '文章类型', 'cms_article_type', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (28, '文章栏目模型分类', 'cms_cate_models', 1, 1, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (29, '政务工作模型分类', 'gov_cate_models', 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (30, '菜单模块类型', 'menu_module_type', 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (31, '工作流程类型', 'flow_type', 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (32, '工作流程审批状态', 'flow_status', 1, 31, 0, '工作流程审批状态', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (33, '博客分类类型', 'sys_blog_type', 1, 31, 31, '博客分类中的标志', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (34, '博客日志标志', 'sys_log_sign', 1, 31, 0, '博客日志管理中的标志数据字典', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (35, '工作流紧急状态', 'flow_level', 1, 31, 31, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_type` VALUES (48, '插件商城折扣', 'plugin_store_discount', 1, 31, 0, '', '2021-08-14 11:59:26', '2021-08-14 11:59:26');
INSERT INTO `sys_dict_type` VALUES (49, 'CMS栏目导航位置', 'cms_nav_position', 1, 22, 0, '', '2021-08-31 15:37:04', '2021-08-31 15:37:04');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 886 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (449, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 12:14:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (450, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 14:23:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (451, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 14:23:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (452, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 14:25:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (453, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:30:17', '系统后台');
INSERT INTO `sys_login_log` VALUES (454, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:31:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (455, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:32:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (456, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:39:41', '系统后台');
INSERT INTO `sys_login_log` VALUES (457, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:39:45', '系统后台');
INSERT INTO `sys_login_log` VALUES (458, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:41:04', '系统后台');
INSERT INTO `sys_login_log` VALUES (459, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:42:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (460, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:45:02', '系统后台');
INSERT INTO `sys_login_log` VALUES (461, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:45:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (462, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:45:45', '系统后台');
INSERT INTO `sys_login_log` VALUES (463, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:45:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (464, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:46:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (465, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:46:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (466, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:47:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (467, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:47:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (468, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 17:47:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (469, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:02:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (470, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:03:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (471, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:04:29', '系统后台');
INSERT INTO `sys_login_log` VALUES (472, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:06:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (473, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:08:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (474, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:08:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (475, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:10:19', '系统后台');
INSERT INTO `sys_login_log` VALUES (476, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:15:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (477, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:18:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (478, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:18:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (479, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-08 18:24:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (480, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 09:22:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (481, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 11:04:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (482, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 11:09:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (483, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 15:50:29', '系统后台');
INSERT INTO `sys_login_log` VALUES (484, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 15:51:35', '系统后台');
INSERT INTO `sys_login_log` VALUES (485, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 15:52:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (486, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 15:53:34', '系统后台');
INSERT INTO `sys_login_log` VALUES (487, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 16:54:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (488, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 16:58:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (489, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 16:59:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (490, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 17:02:25', '系统后台');
INSERT INTO `sys_login_log` VALUES (491, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 17:03:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (492, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-09 17:05:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (493, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:21:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (494, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:22:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (495, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:22:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (496, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:31:53', '系统后台');
INSERT INTO `sys_login_log` VALUES (497, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:32:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (498, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:39:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (499, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:55:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (500, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:56:15', '系统后台');
INSERT INTO `sys_login_log` VALUES (501, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:58:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (502, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:58:51', '系统后台');
INSERT INTO `sys_login_log` VALUES (503, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 10:59:58', '系统后台');
INSERT INTO `sys_login_log` VALUES (504, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 11:01:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (505, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 11:01:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (506, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:32:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (507, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:34:53', '系统后台');
INSERT INTO `sys_login_log` VALUES (508, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:34:55', '系统后台');
INSERT INTO `sys_login_log` VALUES (509, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:35:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (510, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:35:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (511, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:36:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (512, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:36:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (513, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-11 16:37:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (514, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 09:46:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (515, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 09:51:58', '系统后台');
INSERT INTO `sys_login_log` VALUES (516, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 09:55:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (517, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 10:57:45', '系统后台');
INSERT INTO `sys_login_log` VALUES (518, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 10:58:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (519, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 11:39:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (520, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 11:40:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (521, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 11:40:40', '系统后台');
INSERT INTO `sys_login_log` VALUES (522, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:13:48', '系统后台');
INSERT INTO `sys_login_log` VALUES (523, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:13:57', '系统后台');
INSERT INTO `sys_login_log` VALUES (524, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:14:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (525, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:14:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (526, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:14:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (527, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (528, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:26', '系统后台');
INSERT INTO `sys_login_log` VALUES (529, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (530, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:29', '系统后台');
INSERT INTO `sys_login_log` VALUES (531, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (532, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (533, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (534, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (535, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:15:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (536, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:16:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (537, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:16:17', '系统后台');
INSERT INTO `sys_login_log` VALUES (538, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:16:19', '系统后台');
INSERT INTO `sys_login_log` VALUES (539, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:16:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (540, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-14 15:16:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (541, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 09:18:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (542, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 09:20:55', '系统后台');
INSERT INTO `sys_login_log` VALUES (543, 'asda', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:17:33', '系统后台');
INSERT INTO `sys_login_log` VALUES (544, 'asdasd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:19:02', '系统后台');
INSERT INTO `sys_login_log` VALUES (545, 'sadasd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:21:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (546, 'sadasd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:21:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (547, 'asd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:23:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (548, 'asd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:23:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (549, 'asd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:23:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (550, 'asd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:25:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (551, 'asd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:25:25', '系统后台');
INSERT INTO `sys_login_log` VALUES (552, 'sada', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:27:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (553, 'asd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:28:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (554, 'sadas', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:41:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (555, 'sadas', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:41:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (556, 'asdasd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:42:10', '系统后台');
INSERT INTO `sys_login_log` VALUES (557, 'asdasd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:42:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (558, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:42:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (559, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:42:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (560, 'sda', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:43:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (561, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:45:53', '系统后台');
INSERT INTO `sys_login_log` VALUES (562, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:45:58', '系统后台');
INSERT INTO `sys_login_log` VALUES (563, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:45:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (564, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:46:01', '系统后台');
INSERT INTO `sys_login_log` VALUES (565, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:46:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (566, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:46:04', '系统后台');
INSERT INTO `sys_login_log` VALUES (567, 'dema', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-15 14:46:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (568, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:46:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (569, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:46:16', '系统后台');
INSERT INTO `sys_login_log` VALUES (570, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:46:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (571, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:46:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (572, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:48:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (573, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:49:26', '系统后台');
INSERT INTO `sys_login_log` VALUES (574, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:49:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (575, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:49:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (576, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:49:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (577, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:59:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (578, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 14:59:55', '系统后台');
INSERT INTO `sys_login_log` VALUES (579, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:02:02', '系统后台');
INSERT INTO `sys_login_log` VALUES (580, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:03:01', '系统后台');
INSERT INTO `sys_login_log` VALUES (581, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:04:25', '系统后台');
INSERT INTO `sys_login_log` VALUES (582, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:04:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (583, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:04:34', '系统后台');
INSERT INTO `sys_login_log` VALUES (584, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:05:50', '系统后台');
INSERT INTO `sys_login_log` VALUES (585, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:06:36', '系统后台');
INSERT INTO `sys_login_log` VALUES (586, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:10:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (587, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:11:17', '系统后台');
INSERT INTO `sys_login_log` VALUES (588, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:12:15', '系统后台');
INSERT INTO `sys_login_log` VALUES (589, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:13:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (590, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:15:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (591, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:16:02', '系统后台');
INSERT INTO `sys_login_log` VALUES (592, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:20:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (593, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:21:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (594, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:21:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (595, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:21:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (596, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:26:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (597, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:49:34', '系统后台');
INSERT INTO `sys_login_log` VALUES (598, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:49:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (599, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:57:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (600, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 15:57:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (601, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 16:00:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (602, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 16:02:47', '系统后台');
INSERT INTO `sys_login_log` VALUES (603, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 16:02:58', '系统后台');
INSERT INTO `sys_login_log` VALUES (604, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 16:10:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (605, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 16:30:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (606, 'admin', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 16:31:16', '系统后台');
INSERT INTO `sys_login_log` VALUES (607, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 16:31:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (608, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 16:33:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (609, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 16:34:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (610, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 17:55:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (611, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 17:56:40', '系统后台');
INSERT INTO `sys_login_log` VALUES (612, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 17:57:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (613, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 18:00:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (614, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-15 18:01:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (615, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 18:05:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (616, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 18:21:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (617, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 18:21:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (618, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 18:22:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (619, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-15 18:23:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (620, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 09:30:54', '系统后台');
INSERT INTO `sys_login_log` VALUES (621, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 09:57:49', '系统后台');
INSERT INTO `sys_login_log` VALUES (622, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 09:58:17', '系统后台');
INSERT INTO `sys_login_log` VALUES (623, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 10:14:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (624, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 10:20:26', '系统后台');
INSERT INTO `sys_login_log` VALUES (625, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 10:22:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (626, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 10:22:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (627, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 10:22:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (628, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 10:22:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (629, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 10:32:10', '系统后台');
INSERT INTO `sys_login_log` VALUES (630, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 10:32:49', '系统后台');
INSERT INTO `sys_login_log` VALUES (631, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 11:30:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (632, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 12:03:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (633, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 12:06:17', '系统后台');
INSERT INTO `sys_login_log` VALUES (634, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 14:14:50', '系统后台');
INSERT INTO `sys_login_log` VALUES (635, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 15:57:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (636, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 16:43:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (637, 'demosada', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:17:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (638, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:17:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (639, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:17:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (640, 'demoasdasd', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:17:53', '系统后台');
INSERT INTO `sys_login_log` VALUES (641, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:18:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (642, 'zsasda', '127.0.0.1', '内网IP', 'ApiPOST', '', 0, '账号密码错误', '2022-03-16 17:18:26', '系统后台');
INSERT INTO `sys_login_log` VALUES (643, 'zsa', '127.0.0.1', '内网IP', 'ApiPOST', '', 0, '账号密码错误', '2022-03-16 17:18:41', '系统后台');
INSERT INTO `sys_login_log` VALUES (644, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 0, '账号密码错误', '2022-03-16 17:18:48', '系统后台');
INSERT INTO `sys_login_log` VALUES (645, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 0, '账号密码错误', '2022-03-16 17:19:45', '系统后台');
INSERT INTO `sys_login_log` VALUES (646, 'demo55', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:21:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (647, 'demo4564646', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:21:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (648, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:21:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (649, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:22:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (650, 'demo2', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:24:11', '系统后台');
INSERT INTO `sys_login_log` VALUES (651, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:24:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (652, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:25:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (653, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:25:22', '系统后台');
INSERT INTO `sys_login_log` VALUES (654, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:25:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (655, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 0, '账号密码错误', '2022-03-16 17:25:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (656, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:26:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (657, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:26:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (658, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:27:17', '系统后台');
INSERT INTO `sys_login_log` VALUES (659, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:27:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (660, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:28:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (661, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:28:10', '系统后台');
INSERT INTO `sys_login_log` VALUES (662, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:28:31', '系统后台');
INSERT INTO `sys_login_log` VALUES (663, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:29:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (664, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-16 17:30:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (665, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:30:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (666, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:31:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (667, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:31:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (668, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:32:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (669, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:37:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (670, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:42:16', '系统后台');
INSERT INTO `sys_login_log` VALUES (671, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:44:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (672, 'zsss', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:45:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (673, 'zsss', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:45:29', '系统后台');
INSERT INTO `sys_login_log` VALUES (674, 'zsss', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-16 17:45:34', '系统后台');
INSERT INTO `sys_login_log` VALUES (675, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 17:50:57', '系统后台');
INSERT INTO `sys_login_log` VALUES (676, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 18:05:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (677, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 18:18:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (678, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 18:22:40', '系统后台');
INSERT INTO `sys_login_log` VALUES (679, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 18:24:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (680, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 18:24:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (681, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-16 18:24:51', '系统后台');
INSERT INTO `sys_login_log` VALUES (682, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:00:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (683, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:04:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (684, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:05:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (685, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 10:29:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (686, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 10:35:19', '系统后台');
INSERT INTO `sys_login_log` VALUES (687, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 10:43:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (688, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-17 10:45:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (689, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 10:45:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (690, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-17 10:45:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (691, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 0, '账号密码错误', '2022-03-17 10:46:50', '系统后台');
INSERT INTO `sys_login_log` VALUES (692, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 10:47:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (693, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 10:48:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (694, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 10:51:19', '系统后台');
INSERT INTO `sys_login_log` VALUES (695, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:52:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (696, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:55:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (697, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:55:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (698, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:55:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (699, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:55:45', '系统后台');
INSERT INTO `sys_login_log` VALUES (700, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 10:57:36', '系统后台');
INSERT INTO `sys_login_log` VALUES (701, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:06:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (702, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:09:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (703, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:11:10', '系统后台');
INSERT INTO `sys_login_log` VALUES (704, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:26:31', '系统后台');
INSERT INTO `sys_login_log` VALUES (705, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:30:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (706, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:36:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (707, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:42:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (708, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:45:25', '系统后台');
INSERT INTO `sys_login_log` VALUES (709, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 11:54:51', '系统后台');
INSERT INTO `sys_login_log` VALUES (710, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 14:41:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (711, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 14:45:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (712, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 14:55:57', '系统后台');
INSERT INTO `sys_login_log` VALUES (713, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:15:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (714, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:20:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (715, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:21:49', '系统后台');
INSERT INTO `sys_login_log` VALUES (716, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:24:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (717, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:46:38', '系统后台');
INSERT INTO `sys_login_log` VALUES (718, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:48:02', '系统后台');
INSERT INTO `sys_login_log` VALUES (719, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:49:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (720, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:50:36', '系统后台');
INSERT INTO `sys_login_log` VALUES (721, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:51:48', '系统后台');
INSERT INTO `sys_login_log` VALUES (722, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:54:50', '系统后台');
INSERT INTO `sys_login_log` VALUES (723, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:56:04', '系统后台');
INSERT INTO `sys_login_log` VALUES (724, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:57:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (725, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 15:58:24', '系统后台');
INSERT INTO `sys_login_log` VALUES (726, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 16:04:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (727, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:04:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (728, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 16:10:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (729, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:13:49', '系统后台');
INSERT INTO `sys_login_log` VALUES (730, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:16:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (731, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:32:57', '系统后台');
INSERT INTO `sys_login_log` VALUES (732, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:39:26', '系统后台');
INSERT INTO `sys_login_log` VALUES (733, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:42:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (734, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:44:38', '系统后台');
INSERT INTO `sys_login_log` VALUES (735, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:46:11', '系统后台');
INSERT INTO `sys_login_log` VALUES (736, 'zs', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:48:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (737, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 16:54:33', '系统后台');
INSERT INTO `sys_login_log` VALUES (738, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-17 17:06:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (739, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 17:55:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (740, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-17 18:07:51', '系统后台');
INSERT INTO `sys_login_log` VALUES (741, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-18 09:44:38', '系统后台');
INSERT INTO `sys_login_log` VALUES (742, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-18 14:29:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (743, 'zs', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-18 15:22:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (744, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-18 15:22:29', '系统后台');
INSERT INTO `sys_login_log` VALUES (745, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 09:21:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (746, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 14:14:54', '系统后台');
INSERT INTO `sys_login_log` VALUES (747, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 14:14:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (748, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 14:15:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (749, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 14:16:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (750, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 14:38:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (751, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 15:17:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (752, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 15:29:55', '系统后台');
INSERT INTO `sys_login_log` VALUES (753, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 15:58:22', '系统后台');
INSERT INTO `sys_login_log` VALUES (754, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-21 18:06:31', '系统后台');
INSERT INTO `sys_login_log` VALUES (755, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-22 09:01:15', '系统后台');
INSERT INTO `sys_login_log` VALUES (756, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-22 09:11:55', '系统后台');
INSERT INTO `sys_login_log` VALUES (757, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 09:00:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (758, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-24 09:59:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (759, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 14:45:09', '系统后台');
INSERT INTO `sys_login_log` VALUES (760, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 14:47:54', '系统后台');
INSERT INTO `sys_login_log` VALUES (761, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 14:48:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (762, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 14:52:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (763, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 15:02:19', '系统后台');
INSERT INTO `sys_login_log` VALUES (764, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 15:02:36', '系统后台');
INSERT INTO `sys_login_log` VALUES (765, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-24 15:05:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (766, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 17:06:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (767, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-24 17:09:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (768, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-25 15:08:31', '系统后台');
INSERT INTO `sys_login_log` VALUES (769, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-25 15:11:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (770, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-25 15:12:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (771, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-25 16:06:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (772, 'demo2', '127.0.0.1', '内网IP', 'ApiPOST', '', 0, '账号密码错误', '2022-03-25 16:41:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (773, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-28 10:24:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (774, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-28 10:37:47', '系统后台');
INSERT INTO `sys_login_log` VALUES (775, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-28 14:27:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (776, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-28 14:29:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (777, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-28 16:27:11', '系统后台');
INSERT INTO `sys_login_log` VALUES (778, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-29 10:10:16', '系统后台');
INSERT INTO `sys_login_log` VALUES (779, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-29 10:49:47', '系统后台');
INSERT INTO `sys_login_log` VALUES (780, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 09:06:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (781, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-30 09:58:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (782, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 10:19:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (783, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 10:20:01', '系统后台');
INSERT INTO `sys_login_log` VALUES (784, 'test', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 10:50:40', '系统后台');
INSERT INTO `sys_login_log` VALUES (785, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 10:51:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (786, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 11:08:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (787, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 11:09:44', '系统后台');
INSERT INTO `sys_login_log` VALUES (788, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 11:09:49', '系统后台');
INSERT INTO `sys_login_log` VALUES (789, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 11:23:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (790, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-30 11:41:01', '系统后台');
INSERT INTO `sys_login_log` VALUES (791, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-30 11:44:36', '系统后台');
INSERT INTO `sys_login_log` VALUES (792, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-03-31 09:34:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (793, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-01 10:09:45', '系统后台');
INSERT INTO `sys_login_log` VALUES (794, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-01 10:13:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (795, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-01 10:16:04', '系统后台');
INSERT INTO `sys_login_log` VALUES (796, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-01 15:02:11', '系统后台');
INSERT INTO `sys_login_log` VALUES (797, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-02 09:15:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (798, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-02 09:15:34', '系统后台');
INSERT INTO `sys_login_log` VALUES (799, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-02 09:59:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (800, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-02 11:04:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (801, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-06 09:51:48', '系统后台');
INSERT INTO `sys_login_log` VALUES (802, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-06 16:21:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (803, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-06 17:40:57', '系统后台');
INSERT INTO `sys_login_log` VALUES (804, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-07 09:34:50', '系统后台');
INSERT INTO `sys_login_log` VALUES (805, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-07 15:17:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (806, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-07 15:58:53', '系统后台');
INSERT INTO `sys_login_log` VALUES (807, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-07 22:13:22', '系统后台');
INSERT INTO `sys_login_log` VALUES (808, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-08 09:26:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (809, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-08 12:03:47', '系统后台');
INSERT INTO `sys_login_log` VALUES (810, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-08 14:17:47', '系统后台');
INSERT INTO `sys_login_log` VALUES (811, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-08 14:24:23', '系统后台');
INSERT INTO `sys_login_log` VALUES (812, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-09 12:58:53', '系统后台');
INSERT INTO `sys_login_log` VALUES (813, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-11 09:01:47', '系统后台');
INSERT INTO `sys_login_log` VALUES (814, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-11 09:13:10', '系统后台');
INSERT INTO `sys_login_log` VALUES (815, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-11 09:36:58', '系统后台');
INSERT INTO `sys_login_log` VALUES (816, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-11 16:42:45', '系统后台');
INSERT INTO `sys_login_log` VALUES (817, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-12 08:59:10', '系统后台');
INSERT INTO `sys_login_log` VALUES (818, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-12 09:11:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (819, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-12 14:20:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (820, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-12 16:13:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (821, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-13 09:30:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (822, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-13 11:51:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (823, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-13 15:00:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (824, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-13 15:07:04', '系统后台');
INSERT INTO `sys_login_log` VALUES (825, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 11:38:33', '系统后台');
INSERT INTO `sys_login_log` VALUES (826, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 15:08:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (827, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 15:09:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (828, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 15:11:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (829, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 15:40:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (830, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 15:41:48', '系统后台');
INSERT INTO `sys_login_log` VALUES (831, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 15:46:52', '系统后台');
INSERT INTO `sys_login_log` VALUES (832, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 15:48:41', '系统后台');
INSERT INTO `sys_login_log` VALUES (833, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 17:50:00', '系统后台');
INSERT INTO `sys_login_log` VALUES (834, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 18:08:01', '系统后台');
INSERT INTO `sys_login_log` VALUES (835, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-14 21:10:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (836, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-16 10:07:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (837, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-16 10:48:15', '系统后台');
INSERT INTO `sys_login_log` VALUES (838, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 11:15:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (839, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 11:15:16', '系统后台');
INSERT INTO `sys_login_log` VALUES (840, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 11:15:18', '系统后台');
INSERT INTO `sys_login_log` VALUES (841, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 11:15:20', '系统后台');
INSERT INTO `sys_login_log` VALUES (842, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 15:59:10', '系统后台');
INSERT INTO `sys_login_log` VALUES (843, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 15:59:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (844, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 15:59:14', '系统后台');
INSERT INTO `sys_login_log` VALUES (845, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 15:59:15', '系统后台');
INSERT INTO `sys_login_log` VALUES (846, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 15:59:16', '系统后台');
INSERT INTO `sys_login_log` VALUES (847, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-16 15:59:17', '系统后台');
INSERT INTO `sys_login_log` VALUES (848, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-16 16:11:58', '系统后台');
INSERT INTO `sys_login_log` VALUES (849, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-16 17:01:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (850, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-18 10:33:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (851, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-18 10:45:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (852, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-18 16:27:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (853, 'demo', '::1', '安徽省 合肥市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-18 20:59:19', '系统后台');
INSERT INTO `sys_login_log` VALUES (854, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-18 22:18:35', '系统后台');
INSERT INTO `sys_login_log` VALUES (855, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-19 08:49:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (856, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-19 08:55:49', '系统后台');
INSERT INTO `sys_login_log` VALUES (857, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-19 08:57:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (858, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:50:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (859, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (860, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:07', '系统后台');
INSERT INTO `sys_login_log` VALUES (861, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:29', '系统后台');
INSERT INTO `sys_login_log` VALUES (862, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (863, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (864, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:31', '系统后台');
INSERT INTO `sys_login_log` VALUES (865, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (866, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-19 09:51:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (867, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-19 11:08:39', '系统后台');
INSERT INTO `sys_login_log` VALUES (868, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-19 11:50:30', '系统后台');
INSERT INTO `sys_login_log` VALUES (869, 'demo', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', 1, '登录成功', '2022-04-19 15:07:34', '系统后台');
INSERT INTO `sys_login_log` VALUES (870, 'admin', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-19 16:38:37', '系统后台');
INSERT INTO `sys_login_log` VALUES (871, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-19 17:29:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (872, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 08:42:41', '系统后台');
INSERT INTO `sys_login_log` VALUES (873, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 09:51:36', '系统后台');
INSERT INTO `sys_login_log` VALUES (874, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 10:41:01', '系统后台');
INSERT INTO `sys_login_log` VALUES (875, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 10:50:15', '系统后台');
INSERT INTO `sys_login_log` VALUES (876, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 10:50:19', '系统后台');
INSERT INTO `sys_login_log` VALUES (877, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 10:50:59', '系统后台');
INSERT INTO `sys_login_log` VALUES (878, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 14:38:28', '系统后台');
INSERT INTO `sys_login_log` VALUES (879, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-20 16:26:04', '系统后台');
INSERT INTO `sys_login_log` VALUES (880, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-20 16:27:13', '系统后台');
INSERT INTO `sys_login_log` VALUES (881, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-21 08:31:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (882, 'demo', '::1', '云南省 曲靖市', 'Chrome', 'Windows 10', 1, '登录成功', '2022-04-21 09:22:27', '系统后台');
INSERT INTO `sys_login_log` VALUES (883, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-21 17:17:35', '系统后台');
INSERT INTO `sys_login_log` VALUES (884, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-21 17:27:48', '系统后台');
INSERT INTO `sys_login_log` VALUES (885, 'demo', '127.0.0.1', '内网IP', 'ApiPOST', '', 1, '登录成功', '2022-04-21 17:28:09', '系统后台');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `json_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, 1, '', 0, 0, '2021-07-11 11:32:58', NULL, NULL);
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, 1, '', 0, 0, '2021-07-12 11:01:26', NULL, NULL);
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, 1, '', 0, 0, '2021-07-12 11:01:30', NULL, NULL);
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, 0, '普通员工', 0, 31, '2021-07-12 11:01:33', '2022-04-08 15:32:23', NULL);
INSERT INTO `sys_post` VALUES (5, 'it', 'IT部', 5, 1, '信息部', 31, 31, '2021-07-12 11:09:42', '2022-04-09 12:59:12', NULL);
INSERT INTO `sys_post` VALUES (6, '1111', '1111', 0, 1, '11111', 31, 0, '2022-04-08 15:32:44', '2022-04-08 15:32:44', '2022-04-08 15:51:24');
INSERT INTO `sys_post` VALUES (7, '222', '2222', 0, 1, '22222', 31, 0, '2022-04-08 15:32:55', '2022-04-08 15:32:55', '2022-04-08 15:51:24');
INSERT INTO `sys_post` VALUES (8, '33333', '3333', 0, 0, '33333', 31, 0, '2022-04-08 15:33:01', '2022-04-08 15:33:01', '2022-04-08 15:51:40');
INSERT INTO `sys_post` VALUES (9, '222', '111', 0, 1, '2313213', 31, 0, '2022-04-08 15:52:53', '2022-04-08 15:52:53', '2022-04-08 15:52:56');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态;0:禁用;1:正常',
  `list_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) UNSIGNED NOT NULL DEFAULT 3 COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 1, 0, '超级管理员', '备注', 3, '2022-04-01 11:38:39', '2022-04-09 12:59:28');
INSERT INTO `sys_role` VALUES (2, 1, 0, '普通管理员', '备注', 3, '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES (3, 1, 0, '站点管理员', '站点管理人员', 3, '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES (4, 1, 0, '初级管理员', '初级管理员', 3, '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES (5, 1, 0, '高级管理员', '高级管理员', 2, '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES (8, 1, 0, '区级管理员', '', 2, '2022-04-01 11:38:39', '2022-04-06 09:53:40');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (5, 103);
INSERT INTO `sys_role_dept` VALUES (5, 104);
INSERT INTO `sys_role_dept` VALUES (5, 105);
INSERT INTO `sys_role_dept` VALUES (8, 105);
INSERT INTO `sys_role_dept` VALUES (8, 106);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT 0 COMMENT '生日',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '部门id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_login`(`user_name`, `deleted_at`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`, `deleted_at`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '13578342363', '超级管理员', 0, 'c567ae329f9929b518759d3bea13f492', 'f9aZTAa8yz', 1, 'yxh669@qq.com', 1, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-19/ccwpeuqz1i2s769hua.jpeg', 101, '', 1, 'asdasfdsaf大发放打发士大夫发按时', '描述信息', '::1', '2022-04-19 16:38:37', '2021-06-22 17:58:00', '2022-04-19 16:38:37', NULL);
INSERT INTO `sys_user` VALUES (2, 'yixiaohu', '13699885599', '奈斯', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'yxh@qq.com', 1, 'pub_upload/2020-11-02/c6sntzg7r96c7p9gqf.jpeg', 102, '备注', 1, '', '', '[::1]', '2022-02-14 18:10:40', '2021-06-22 17:58:00', '2022-04-13 11:20:03', NULL);
INSERT INTO `sys_user` VALUES (3, 'zs', '16399669855', '张三', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'zs@qq.com', 0, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-08-02/cd8nif79egjg9kbkgk.jpeg', 101, '', 1, '', '', '127.0.0.1', '2022-03-18 15:22:13', '2021-06-22 17:58:00', '2022-04-21 11:20:06', NULL);
INSERT INTO `sys_user` VALUES (4, 'qlgl', '13758596696', '测试c', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'qlgl@qq.com', 0, '', 102, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:55:28', NULL);
INSERT INTO `sys_user` VALUES (5, 'test', '13845696696', '测试2', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123@qq.com', 0, '', 101, '', 0, '', '', '::1', '2022-03-30 10:50:39', '2021-06-22 17:58:00', '2022-04-12 17:55:31', NULL);
INSERT INTO `sys_user` VALUES (6, '18999998889', '13755866654', '刘大大', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '1223@qq.com', 0, '', 103, '', 1, '', '', '[::1]', '2022-02-25 14:29:22', '2021-06-22 17:58:00', '2022-04-14 21:11:06', NULL);
INSERT INTO `sys_user` VALUES (7, 'zmm', '13788566696', '张明明', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '11123@qq.com', 0, '', 104, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:55:42', NULL);
INSERT INTO `sys_user` VALUES (8, 'lxx', '13756566696', '李小小', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123333@qq.com', 0, '', 101, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:55:45', NULL);
INSERT INTO `sys_user` VALUES (10, 'xmm', '13588999969', '小秘密', 0, '2de2a8df703bfc634cfda2cb2f6a59be', 'Frz7LJY7SE', 1, '696@qq.com', 0, '', 101, '', 1, '', '', '[::1]', '2021-07-22 17:08:53', '2021-06-22 17:58:00', '2022-04-12 17:55:50', NULL);
INSERT INTO `sys_user` VALUES (14, 'cd_19', '13699888899', '看金利科技', 0, '1169d5fe4119fd4277a95f02d7036171', '7paigEoedh', 1, '', 0, '', 102, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2022-04-12 18:13:22', NULL);
INSERT INTO `sys_user` VALUES (15, 'lmm', '13587754545', '刘敏敏', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'a@coc.com', 0, '', 201, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:56:23', NULL);
INSERT INTO `sys_user` VALUES (16, 'ldn', '13899658874', '李大牛', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'a@ll.con', 0, '', 102, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:56:27', NULL);
INSERT INTO `sys_user` VALUES (20, 'dbc', '13877555566', '大百词', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (22, 'yxfmlbb', '15969423326', '大数据部门测试', 0, '66f89b40ee4a10aabaf70c15756429ea', 'mvd2OtUe8f', 1, 'yxh6691@qq.com', 0, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-09-29/cem20k3fdciosy7nwo.jpeg', 200, '', 1, '2222233', '1222', '[::1]', '2021-10-28 11:36:07', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (23, 'wangming', '13699888855', '王明', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (24, 'zhk', '13699885591', '综合科', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '192.168.0.146', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (28, 'demo3', '18699888855', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123132@qq.com', 0, '', 109, '', 1, '', '', '192.168.0.229', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (31, 'demo', '15334455789', '李四', 0, '39978de67915a11e94bfe9c879b2d9a1', 'gqwLs4n95E', 1, '223@qq.com', 2, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-11-30/cg30rab8myj85vjzcf.jpeg', 109, '', 1, '云南省曲靖市22223', '12345', '127.0.0.1', '2022-04-21 17:28:09', '2021-06-22 17:58:00', '2022-04-21 17:28:09', NULL);
INSERT INTO `sys_user` VALUES (32, 'demo100', '18699888859', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '[::1]', '2021-11-24 18:01:21', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (33, 'demo110', '18699888853', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (34, 'yxfmlbb2', '15969423327', '研发部门测试', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '1111@qqq.com', 1, '', 103, '', 0, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (35, 'wk666', '18888888888', 'wk', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '396861557@qq.com', 1, '', 100, '', 1, '', '', '[::1]', '2021-12-09 14:52:37', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (36, 'zxd', '13699885565', '张晓东', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'zxk@qq.com', 1, '', 201, '666', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (37, 'yxfmlbb3', '13513513511', '张三', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '111@qq.com', 0, '', 204, '', 1, '', '', '[::1]', '2021-07-26 14:49:25', '2021-06-22 17:58:00', '2021-07-26 14:49:18', NULL);
INSERT INTO `sys_user` VALUES (38, 'test_user', '18888888880', 'test', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '11@qq.com', 1, '', 200, '111', 0, '', '', '', NULL, '2021-06-22 17:58:00', '2021-07-12 22:05:29', NULL);
INSERT INTO `sys_user` VALUES (39, 'asan', '18687460555', '阿三', 0, '2354837137115700e2adf870ac113dcf', 'drdDvbtYZW', 1, '456654@qq.com', 1, '', 201, '666666', 1, '', '', '', NULL, '2021-07-12 17:21:43', '2021-07-12 21:13:31', '2021-07-12 22:00:44');
INSERT INTO `sys_user` VALUES (40, 'asi', '13655888888', '啊四', 0, 'fbb755b35d48759dad47bb1540249fd1', '9dfUstcxrz', 1, '5464@qq.com', 1, '', 201, 'adsaasd', 1, '', '', '', '0000-00-00 00:00:00', '2021-07-12 17:46:27', '2021-07-12 21:29:41', '2021-07-12 22:00:44');
INSERT INTO `sys_user` VALUES (41, 'awu', '13578556546', '阿五', 0, '3b36a96afa0dfd66aa915e0816e0e9f6', '9gHRa9ho4U', 0, '132321@qq.com', 1, '', 201, 'asdasdasd', 1, '', '', '', NULL, '2021-07-12 17:54:31', '2021-07-12 21:46:34', '2021-07-12 21:59:56');
INSERT INTO `sys_user` VALUES (42, 'demo01', '13699888556', '测试01222', 0, '048dc94116558fb40920f3553ecd5fe8', 'KiVrfzKJQx', 1, '456@qq.com', 2, '', 109, '测试用户', 1, '', '', '', NULL, '2022-04-12 16:15:23', '2022-04-12 17:54:49', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `ip` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17387 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户在线状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (1, 3);
INSERT INTO `sys_user_post` VALUES (2, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 2);
INSERT INTO `sys_user_post` VALUES (5, 2);
INSERT INTO `sys_user_post` VALUES (10, 1);
INSERT INTO `sys_user_post` VALUES (10, 2);
INSERT INTO `sys_user_post` VALUES (10, 3);
INSERT INTO `sys_user_post` VALUES (10, 4);
INSERT INTO `sys_user_post` VALUES (10, 5);
INSERT INTO `sys_user_post` VALUES (14, 1);
INSERT INTO `sys_user_post` VALUES (15, 4);
INSERT INTO `sys_user_post` VALUES (16, 2);
INSERT INTO `sys_user_post` VALUES (22, 1);
INSERT INTO `sys_user_post` VALUES (22, 2);
INSERT INTO `sys_user_post` VALUES (31, 2);
INSERT INTO `sys_user_post` VALUES (34, 1);
INSERT INTO `sys_user_post` VALUES (35, 2);
INSERT INTO `sys_user_post` VALUES (35, 3);
INSERT INTO `sys_user_post` VALUES (36, 1);
INSERT INTO `sys_user_post` VALUES (37, 3);
INSERT INTO `sys_user_post` VALUES (38, 2);
INSERT INTO `sys_user_post` VALUES (38, 3);
INSERT INTO `sys_user_post` VALUES (42, 2);
INSERT INTO `sys_user_post` VALUES (42, 3);

SET FOREIGN_KEY_CHECKS = 1;
