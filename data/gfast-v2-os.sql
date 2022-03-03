/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : gfast-v2-os

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 03/03/2022 12:08:05
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
INSERT INTO `casbin_rule` VALUES ('g', '1', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '1', '3', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '22', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '22', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '15', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '78', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '83', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '84', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '89', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '103', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '104', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '106', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '90', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '112', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '8', '117', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '5', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '19', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '20', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '21', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '22', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '23', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '24', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '25', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '6', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '41', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '42', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '43', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '86', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '8', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '16', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '17', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '18', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '26', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '27', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '29', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '30', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '31', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '28', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '44', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '45', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '46', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '33', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '47', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '48', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '49', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '40', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '50', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '51', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '52', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '53', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '54', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '3', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '34', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '55', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '36', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '56', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '57', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '58', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '59', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '60', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '37', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '38', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '61', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '62', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '39', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '63', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '64', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '4', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '32', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '65', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '66', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '67', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '68', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '35', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '69', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '70', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '71', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '89', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '103', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '119', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '104', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '106', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '90', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '112', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '115', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '116', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '117', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '93', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '113', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '118', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '114', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '107', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '108', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '109', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '110', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '111', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '2', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '3', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '34', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '35', '3', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '35', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '5', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '14', '3', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '36', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '37', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '5', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '19', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '20', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '21', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '22', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '23', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '24', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '25', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '6', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '41', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '42', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '43', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '8', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '16', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '17', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '18', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '26', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '27', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '29', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '30', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '31', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '28', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '33', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '40', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '50', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '52', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '53', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '3', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '34', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '36', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '37', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '38', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '39', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '4', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '32', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '35', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '96', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '97', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '98', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '124', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '126', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '38', '5', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '38', '8', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'alice', 'data1', 'read', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'bob', 'data2', 'write', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'data2_admin', 'data2', 'read', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', 'data2_admin', 'data2', 'write', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'alice', 'data2_admin', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '31', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '31', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', '16', '3', '', '', '', '');

-- ----------------------------
-- Table structure for demo_data_auth
-- ----------------------------
DROP TABLE IF EXISTS `demo_data_auth`;
CREATE TABLE `demo_data_auth`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `created_by` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '修改人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_data_auth
-- ----------------------------
INSERT INTO `demo_data_auth` VALUES (3, '测试01', 31, 31, '2022-03-03 10:15:11', '2022-03-03 10:36:34', NULL);
INSERT INTO `demo_data_auth` VALUES (4, '测试02', 16, 0, '2022-03-03 10:36:52', '2022-03-03 10:36:52', NULL);
INSERT INTO `demo_data_auth` VALUES (5, '测试03', 22, 0, '2022-03-03 10:37:47', '2022-03-03 10:37:47', NULL);
INSERT INTO `demo_data_auth` VALUES (6, '测试04', 28, 0, '2022-03-03 10:37:53', '2022-03-03 10:37:53', NULL);
INSERT INTO `demo_data_auth` VALUES (7, '测试05', 20, 0, '2022-03-03 10:37:58', '2022-03-03 10:37:58', NULL);
INSERT INTO `demo_data_auth` VALUES (8, '测试06', 32, 0, '2022-03-03 10:38:05', '2022-03-03 10:38:05', NULL);
INSERT INTO `demo_data_auth` VALUES (9, '测试07', 32, 0, '2022-03-03 10:38:12', '2022-03-03 10:38:12', NULL);
INSERT INTO `demo_data_auth` VALUES (10, '测试08', 31, 0, '2022-03-03 10:38:18', '2022-03-03 10:38:18', NULL);

-- ----------------------------
-- Table structure for demo_gen
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen`;
CREATE TABLE `demo_gen`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `demo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '年龄',
  `classes` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` datetime(0) NULL DEFAULT NULL COMMENT '出生年月',
  `demo_gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  `demo_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `demo_cate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of demo_gen
-- ----------------------------
INSERT INTO `demo_gen` VALUES (1, '张三', 54, '2', '2021-08-03 00:00:00', 1, '2021-08-03 18:03:00', '2021-08-03 18:03:37', NULL, 31, 31, 1, '0,1');
INSERT INTO `demo_gen` VALUES (2, '李四', 56, '2', '2021-08-03 00:00:00', 1, '2021-08-03 18:23:01', '2021-08-16 15:45:30', NULL, 31, 31, 1, '1,0');
INSERT INTO `demo_gen` VALUES (3, 'sssss', 0, '2', NULL, 1, '2021-08-03 18:23:25', '2021-08-03 18:23:25', '2021-08-03 18:23:28', 31, 0, 0, '1');

-- ----------------------------
-- Table structure for demo_gen_class
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_class`;
CREATE TABLE `demo_gen_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `class_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成关联测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of demo_gen_class
-- ----------------------------
INSERT INTO `demo_gen_class` VALUES (1, '一班');
INSERT INTO `demo_gen_class` VALUES (2, '二班');
INSERT INTO `demo_gen_class` VALUES (3, '三班');
INSERT INTO `demo_gen_class` VALUES (4, '1111111');
INSERT INTO `demo_gen_class` VALUES (5, '22222');

-- ----------------------------
-- Table structure for demo_gen_tree
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_tree`;
CREATE TABLE `demo_gen_tree`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级ID',
  `demo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '年龄',
  `classes` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` datetime(0) NULL DEFAULT NULL COMMENT '出生年月',
  `demo_gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  `demo_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `demo_cate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成树形结构测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of demo_gen_tree
-- ----------------------------
INSERT INTO `demo_gen_tree` VALUES (1, 0, '张三', 20, '1', '2021-08-23 00:00:00', 1, '2021-08-04 11:54:21', '2021-08-04 11:54:21', NULL, 31, 0, 1, '0');
INSERT INTO `demo_gen_tree` VALUES (2, 1, '李四', 28, '2', '2021-08-24 00:00:00', 1, '2021-08-04 11:54:38', '2021-08-04 14:33:57', NULL, 31, 0, 0, '0');
INSERT INTO `demo_gen_tree` VALUES (3, 0, '王五', 63, '1', '2021-08-17 00:00:00', 1, '2021-08-04 11:54:56', '2021-08-04 11:54:56', NULL, 31, 0, 1, '0');
INSERT INTO `demo_gen_tree` VALUES (4, 3, '小小', 65, '1', '2021-08-24 00:00:00', 1, '2021-08-04 15:51:55', '2021-08-04 15:51:55', NULL, 31, 0, 0, '0');
INSERT INTO `demo_gen_tree` VALUES (5, 3, '麻花', 23, '1', NULL, 2, '2021-08-04 15:52:13', '2021-08-04 15:52:13', NULL, 31, 0, 1, '0');
INSERT INTO `demo_gen_tree` VALUES (6, 5, '璐璐', 12, '1', '2021-08-09 00:00:00', 2, '2021-08-16 15:42:46', '2021-08-16 15:42:46', NULL, 31, 0, 1, '0');

-- ----------------------------
-- Table structure for plugins_manage
-- ----------------------------
DROP TABLE IF EXISTS `plugins_manage`;
CREATE TABLE `plugins_manage`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '插件在商城中的id',
  `p_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '插件名称英文',
  `p_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `p_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '插件介绍',
  `p_auth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `is_install` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否安装',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `version` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前版本',
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '价格',
  `download_times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `install_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装路径（用于卸载）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `storeIdUni`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '插件管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plugins_manage
-- ----------------------------
INSERT INTO `plugins_manage` VALUES (34, 1, 'mail', '邮件发送', '邮件发送', 'demo01', 1, 1, '1.0.0', 1, 1248, 'plugins');
INSERT INTO `plugins_manage` VALUES (35, 2, 'wechat', '微信公众号', '微信小程序管理接口，包含关注回复、关键字回复、图文消息、素材管理、菜单管理等', 'demo01', 0, 0, '1.0.2', 1, 456, NULL);
INSERT INTO `plugins_manage` VALUES (36, 3, 'cms', 'cms管理系统', 'cms管理系统', 'gfast01', 0, 0, '1.0.3', 9900, 278, NULL);
INSERT INTO `plugins_manage` VALUES (37, 4, 'demo2', '免费测试', '666', 'demo01', 0, 0, '1.2', 0, 2, NULL);
INSERT INTO `plugins_manage` VALUES (38, 5, 'mail', '邮件发送', 'qq smtp邮件发送功能', 'wilgx0', 0, 0, '1.0.1', 199, 42, NULL);
INSERT INTO `plugins_manage` VALUES (39, 6, 'wechat', '微信公众号', '微信小程序管理接口，包含关注回复、关键字回复、图文消息、素材管理、菜单管理等', 'gfast01', 0, 0, '1.0.1', 5900, 22, NULL);
INSERT INTO `plugins_manage` VALUES (40, 7, 'gencode', '代码生成', '代码生成功能完善，支持生成上传文件、图片及富文本编辑器功能', 'gfast01', 0, 0, '1.0.2', 900, 68, NULL);
INSERT INTO `plugins_manage` VALUES (41, 8, 'im', '在线客服', '在线客服', 'wilgx0', 0, 0, '1.0.1', 9900, 4, NULL);
INSERT INTO `plugins_manage` VALUES (42, 9, 'doorkeeper', 'IP过滤', 'IP地址过滤，支持ipv4 ipv6 ,可设置访问ip白名单和黑名单', 'wilgx0', 0, 0, '1.0.1', 199, 15, NULL);
INSERT INTO `plugins_manage` VALUES (43, 10, 'smsPlugin', '短信发送', '短信发送，支持网易云信、腾讯云、阿里云短信平台，可自定义配置。', 'wilgx0', 0, 0, '1.0.1', 1999, 2, NULL);
INSERT INTO `plugins_manage` VALUES (44, 11, 'wordFlow', '流程审批', '流程审批插件', 'gfast01', 0, 0, '1.0.1', 29900, 0, NULL);

-- ----------------------------
-- Table structure for sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `always_show` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示状态',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `jump_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '跳转路由',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_frame` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型ID',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 235 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auth_rule
-- ----------------------------
INSERT INTO `sys_auth_rule` VALUES (1, 0, 'system/config', '系统配置', 'system', '', 'Admin tips', 0, 0, 1, 1, 'config', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (2, 0, 'system/auth', '权限管理', 'peoples', '', '', 0, 0, 1, 1, 'system/auth', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (3, 0, 'system/monitor', '系统监控', 'monitor', '', '', 0, 0, 1, 1, 'monitor', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (5, 1, 'system/config/dict/type/list', '字典管理', 'dict', '', '', 1, 0, 1, 1, 'dict/list', '', 'system/config/dict/list', 0, 'sys_admin', 0, NULL, '2021-07-20 08:47:37', NULL);
INSERT INTO `sys_auth_rule` VALUES (6, 1, 'system/config/sysConfig/list', '参数管理', 'date-range', '', '', 1, 0, 1, 1, 'params/list', '', 'system/config/params/list', 0, 'sys_admin', 0, NULL, '2021-07-20 08:58:57', NULL);
INSERT INTO `sys_auth_rule` VALUES (8, 2, 'system/auth/menuList', '菜单管理', 'nested', '', '', 1, 0, 1, 1, 'menuList', '', 'system/auth/menuList', 0, 'sys_admin', 0, NULL, '2021-07-20 09:01:49', NULL);
INSERT INTO `sys_auth_rule` VALUES (21, 5, 'system/config/dict/type/delete', '删除字典', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:56:49', NULL);
INSERT INTO `sys_auth_rule` VALUES (16, 8, 'system/auth/addMenu', '添加菜单', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:02:20', NULL);
INSERT INTO `sys_auth_rule` VALUES (17, 8, 'system/auth/editMenu', '修改菜单', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (18, 8, 'system/auth/deleteMenu', '删除菜单', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (19, 5, 'system/config/dict/type/add', '添加字典', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:56:29', NULL);
INSERT INTO `sys_auth_rule` VALUES (20, 5, 'system/config/dict/type/edit', '修改字典', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:56:39', NULL);
INSERT INTO `sys_auth_rule` VALUES (22, 5, 'system/config/dict/data/list', '字典数据管理', '', '', '', 2, 0, 1, 1, 'dataList', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:57:25', NULL);
INSERT INTO `sys_auth_rule` VALUES (23, 5, 'system/config/dict/data/add', '添加字典数据', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:58:06', NULL);
INSERT INTO `sys_auth_rule` VALUES (24, 5, 'system/config/dict/data/edit', '修改字典数据', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:58:14', NULL);
INSERT INTO `sys_auth_rule` VALUES (25, 5, 'system/config/dict/data/delete', '删除字典数据', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:58:22', NULL);
INSERT INTO `sys_auth_rule` VALUES (26, 2, 'system/auth/roleList', '角色管理', 'logininfor', '', '', 1, 0, 1, 1, 'role', '', 'system/auth/roleList', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (27, 26, 'system/auth/addRole', '添加角色', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (28, 2, 'system/auth/deptList', '部门管理', 'peoples', '', '', 1, 0, 1, 1, 'dept', '', 'system/auth/dept', 0, 'sys_admin', 0, NULL, '2021-07-20 09:03:46', NULL);
INSERT INTO `sys_auth_rule` VALUES (29, 26, 'system/auth/editRole', '修改角色', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (30, 26, 'system/auth/statusSetRole', '设置角色状态', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (31, 26, 'system/auth/deleteRole', '删除角色', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (33, 2, 'system/auth/postList', '岗位管理', 'tab', '', '', 1, 0, 1, 1, 'post', '', 'system/auth/post', 0, 'sys_admin', 0, NULL, '2021-07-20 09:04:51', NULL);
INSERT INTO `sys_auth_rule` VALUES (34, 3, 'system/monitor/online/list', '在线用户', 'cascader', '', '', 1, 0, 1, 1, 'online', '', 'system/monitor/online/list', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (36, 3, 'system/monitor/job', '定时任务', 'clipboard', '', '', 1, 0, 1, 1, 'job', '', 'system/monitor/job', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (37, 3, 'system/monitor/server/info', '服务监控', 'dict', '', '', 1, 0, 1, 1, 'server', '', 'system/monitor/server', 0, 'sys_admin', 0, NULL, '2021-07-19 16:07:23', NULL);
INSERT INTO `sys_auth_rule` VALUES (38, 3, 'system/monitor/loginLog', '登录日志', 'chart', '', '', 1, 0, 1, 1, 'logininfor', '', 'system/monitor/logininfor', 0, 'sys_admin', 0, NULL, '2021-07-20 09:08:00', NULL);
INSERT INTO `sys_auth_rule` VALUES (39, 3, 'system/monitor/operLog', '操作日志', 'dashboard', '', '', 1, 0, 1, 1, 'operlog', '', 'system/monitor/operlog', 0, 'sys_admin', 0, NULL, '2021-07-20 09:08:31', NULL);
INSERT INTO `sys_auth_rule` VALUES (40, 2, 'system/auth/userList', '用户管理', 'user', '', '', 1, 0, 1, 1, 'user', '', 'system/auth/userList', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (41, 6, 'system/config/sysConfig/add', '添加参数', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:59:09', NULL);
INSERT INTO `sys_auth_rule` VALUES (42, 6, 'system/config/sysConfig/edit', '修改参数', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:59:17', NULL);
INSERT INTO `sys_auth_rule` VALUES (43, 6, 'system/config/sysConfig/delete', '删除参数', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 08:59:25', NULL);
INSERT INTO `sys_auth_rule` VALUES (44, 28, 'system/auth/deptAdd', '添加部门', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:04:05', NULL);
INSERT INTO `sys_auth_rule` VALUES (45, 28, 'system/auth/deptEdit', '修改部门', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:04:19', NULL);
INSERT INTO `sys_auth_rule` VALUES (46, 28, 'system/auth/deptDelete', '删除部门', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:04:35', NULL);
INSERT INTO `sys_auth_rule` VALUES (47, 33, 'system/auth/postAdd', '添加岗位', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:05:04', NULL);
INSERT INTO `sys_auth_rule` VALUES (48, 33, 'system/auth/postEdit', '修改岗位', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:05:15', NULL);
INSERT INTO `sys_auth_rule` VALUES (49, 33, 'system/auth/postDelete', '删除岗位', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:05:25', NULL);
INSERT INTO `sys_auth_rule` VALUES (50, 40, 'system/auth/addUser', '添加用户', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (51, 40, 'system/auth/editUser', '修改用户', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (52, 40, 'system/auth/resetUserPwd', '密码重置', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (53, 40, 'system/auth/changeUserStatus', '状态设置', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (54, 40, 'system/auth/deleteUser', '删除用户', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:06:16', NULL);
INSERT INTO `sys_auth_rule` VALUES (55, 34, 'system/monitor/online/forceLogout', '强制退出', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (56, 36, 'system/monitor/job/add', '添加任务', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (57, 36, 'system/monitor/job/edit', '修改任务', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (58, 36, 'system/monitor/job/start', '开启任务', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (59, 36, 'system/monitor/job/stop', '停止任务', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (60, 36, 'system/monitor/job/delete', '删除任务', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (61, 38, 'system/monitor/loginLog/delete', '删除', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:08:10', NULL);
INSERT INTO `sys_auth_rule` VALUES (62, 38, 'system/monitor/loginLog/clear', '清空', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:08:15', NULL);
INSERT INTO `sys_auth_rule` VALUES (63, 39, 'system/monitor/operLog/delete', '删除', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:08:36', NULL);
INSERT INTO `sys_auth_rule` VALUES (64, 39, 'system/monitor/operLog/clear', '清空', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, NULL, '2021-07-20 09:08:41', NULL);
INSERT INTO `sys_auth_rule` VALUES (75, 0, 'system/tools', '系统工具', 'server', '', '', 0, 0, 1, 1, 'system/tools', '', '', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (76, 75, 'system/tools/build', '表单构建', 'build', '', '', 1, 0, 1, 1, 'build', '', 'system/tools/build', 0, 'sys_admin', 0, NULL, NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (86, 1, 'system/config/sysWebSet', '站点设置', 'system', '', '', 1, 0, 1, 1, '/webSet', '', 'system/config/webSet', 0, 'sys_admin', 0, NULL, '2021-07-20 08:59:41', NULL);
INSERT INTO `sys_auth_rule` VALUES (185, 86, 'system/config/sysWebSet/update', '站点配置更新', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, '2021-07-20 09:00:18', '2021-07-20 09:00:18', NULL);
INSERT INTO `sys_auth_rule` VALUES (186, 75, 'system/tools/gen/tableList', '代码生成', 'code', '', '', 1, 0, 1, 1, 'gen', '', 'system/tools/gen', 0, 'sys_admin', 0, '2021-08-16 10:36:54', '2021-08-16 12:12:49', NULL);
INSERT INTO `sys_auth_rule` VALUES (231, 227, 'system/pluginsManage/delete', '插件管理删除', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, '2021-12-22 10:12:09', '2021-12-22 10:12:09', NULL);
INSERT INTO `sys_auth_rule` VALUES (232, 227, 'system/pluginsManage/changeStatus', '插件管理状态修改', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, '2021-12-22 10:12:31', '2021-12-22 10:12:31', NULL);
INSERT INTO `sys_auth_rule` VALUES (230, 227, 'system/pluginsManage/edit', '插件管理修改', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, '2021-12-22 10:11:48', '2021-12-22 10:11:48', NULL);
INSERT INTO `sys_auth_rule` VALUES (229, 227, 'system/pluginsManage/add', '插件管理添加', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, '2021-12-22 10:11:29', '2021-12-22 10:11:29', NULL);
INSERT INTO `sys_auth_rule` VALUES (228, 227, 'system/pluginsManage/get', '插件管理查询', '', '', '', 2, 0, 1, 1, '', '', '', 0, 'sys_admin', 0, '2021-12-22 10:10:54', '2021-12-22 10:10:54', NULL);
INSERT INTO `sys_auth_rule` VALUES (227, 75, 'system/pluginsManage/list', '插件管理', 'list', '', '', 1, 0, 1, 1, 'pluginsManageList', '', 'system/pluginsManage/list', 0, 'sys_admin', 0, '2021-12-22 10:10:15', '2021-12-22 10:10:15', NULL);
INSERT INTO `sys_auth_rule` VALUES (226, 75, 'system/tools/api', '系统接口', 'guide', '', '', 1, 0, 1, 1, 'api', '', 'system/tools/api', 0, 'sys_admin', 0, '2021-12-22 09:42:42', '2021-12-22 09:42:42', NULL);
INSERT INTO `sys_auth_rule` VALUES (233, 0, 'demo/demoDataAuth', '数据权限测试管理', 'clipboard', '', '', 0, 0, 1, 1, 'demoDataAuth', '', '', 0, 'sys_admin', 0, '2022-03-03 11:52:48', '2022-03-03 11:52:48', NULL);
INSERT INTO `sys_auth_rule` VALUES (234, 233, 'demo/demoDataAuth/list', '数据权限测试列表', 'date', '', '', 1, 0, 1, 1, 'demoDataAuthList', '', 'demo/demoDataAuth/list', 0, 'sys_admin', 0, '2022-03-03 11:53:26', '2022-03-03 11:53:26', NULL);

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
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `uni_config_key`(`config_key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '文件上传-文件大小', 'sys.uploadFile.fileSize', '50M', 1, 31, 31, '文件上传大小限制', NULL, '2021-07-06 14:57:35', NULL);
INSERT INTO `sys_config` VALUES (2, '文件上传-文件类型', 'sys.uploadFile.fileType', 'doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png', 1, 31, 31, '文件上传后缀类型限制', NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES (3, '图片上传-图片类型', 'sys.uploadFile.imageType', 'jpg,jpeg,gif,npm,png', 1, 31, 0, '图片上传后缀类型限制', NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES (4, '图片上传-图片大小', 'sys.uploadFile.imageSize', '50M', 1, 31, 31, '图片上传大小限制', NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES (11, '静态资源', 'static.resource', '/', 1, 2, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES (12, '啊实打实的22', 'aasdd22', 'asdasd22', 0, 31, 31, 'dasdasd22', '2021-07-06 12:11:37', '2021-07-06 14:58:27', '2021-07-06 15:21:48');

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
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '奇讯科技', 0, '若依', '15888888888', 'ry@qq.com', '1', 0, 31, '2021-07-13 15:56:52', '2021-07-13 15:57:05', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '', '大数据', 1, '小刘', '18888888888', 'liou@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (201, 100, '', '开发', 1, '老李', '18888888888', 'li@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (202, 108, '', '外勤', 1, '小a', '18888888888', 'aa@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (203, 108, '', '行政', 0, 'aa', '18888888888', 'aa@qq.com', '0', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (204, 100, '', '测试一下', 0, '张三', '13688999888', '656@qq.com', '1', 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', '2021-07-12 10:12:00');
INSERT INTO `sys_dept` VALUES (205, 100, '', '测试222', 0, '李四22', '13788556554', '1546@2ad.com', '1', 31, 31, '2021-07-13 15:56:52', '2021-07-13 15:56:52', '2021-07-12 10:12:20');
INSERT INTO `sys_dept` VALUES (206, 205, '', 'asdasd', 0, 'dasd', '13699878797', '4654@aa.com', '1', 31, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', '2021-07-12 10:12:20');

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
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 0, '男', '1', 'sys_user_sex', '', '', 0, 1, 31, 2, '备注信息', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (2, 0, '女', '2', 'sys_user_sex', '', '', 0, 1, 31, 31, '备注信息', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (3, 0, '保密', '0', 'sys_user_sex', '', '', 1, 1, 31, 31, '备注信息', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (28, 0, '正常', '0', 'sys_job_status', '', 'default', 1, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (29, 0, '暂停', '1', 'sys_job_status', '', 'default', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (30, 0, '默认', 'DEFAULT', 'sys_job_group', '', 'default', 1, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '系统', 'SYSTEM', 'sys_job_group', '', 'default', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 0, '成功', '1', 'admin_login_status', '', 'default', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 0, '失败', '0', 'admin_login_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 0, '成功', '1', 'sys_oper_log_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 0, '失败', '0', 'sys_oper_log_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 0, '重复执行', '1', 'sys_job_policy', '', 'default', 1, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 0, '执行一次', '2', 'sys_job_policy', '', 'default', 1, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 0, '显示', '1', 'sys_show_hide', NULL, 'default', 1, 1, 31, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 0, '隐藏', '0', 'sys_show_hide', NULL, 'default', 0, 1, 31, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 0, '正常', '1', 'sys_normal_disable', '', 'default', 1, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 0, '停用', '0', 'sys_normal_disable', '', 'default', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 0, '是', '1', 'sys_yes_no', '', '', 1, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 0, '否', '0', 'sys_yes_no', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (61, 0, '政府工作目标', '1', 'gov_cate_models', '', '', 0, 1, 2, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (62, 0, '系统后台', 'sys_admin', 'menu_module_type', '', '', 1, 1, 2, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (63, 0, '政务工作', 'gov_work', 'menu_module_type', '', '', 0, 1, 2, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (65, 0, '[work]测试业务表', 'wf_news', 'flow_type', '', '', 0, 1, 2, 2, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (66, 0, '回退修改', '-1', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (67, 0, '保存中', '0', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (68, 0, '流程中', '1', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (69, 0, '审批通过', '2', 'flow_status', '', '', 0, 1, 31, 2, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (70, 2, '发布栏目', '2', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (71, 3, '跳转栏目', '3', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (72, 4, '单页栏目', '4', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (73, 2, '置顶', '1', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (74, 3, '幻灯', '2', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (75, 4, '推荐', '3', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (76, 1, '一般', '0', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (77, 1, '频道页', '1', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (78, 0, '普通', '0', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20', NULL);
INSERT INTO `sys_dict_data` VALUES (79, 0, '加急', '1', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20', NULL);
INSERT INTO `sys_dict_data` VALUES (80, 0, '紧急', '2', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20', NULL);
INSERT INTO `sys_dict_data` VALUES (81, 0, '特急', '3', 'flow_level', '', '', 0, 1, 31, 31, '', NULL, '2021-07-20 08:55:25', NULL);
INSERT INTO `sys_dict_data` VALUES (82, 0, '频道页', '1', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (83, 0, '发布栏目', '2', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (84, 0, '跳转栏目', '3', 'sys_blog_type', '', '', 0, 1, 31, 31, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (85, 0, '单页栏目', '4', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (87, 0, '[cms]文章表', 'cms_news', 'flow_type', '', '', 0, 1, 31, 0, '', NULL, NULL, NULL);

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
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', 1, 31, 1, '用于选择用户性别', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (3, '任务状态', 'sys_job_status', 1, 31, 31, '任务状态列表', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (13, '任务分组', 'sys_job_group', 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (14, '管理员登录状态', 'admin_login_status', 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (15, '操作日志状态', 'sys_oper_log_status', 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (16, '任务策略', 'sys_job_policy', 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (17, '菜单状态', 'sys_show_hide', 1, 31, 0, '菜单状态', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (18, '系统开关', 'sys_normal_disable', 1, 31, 31, '系统开关', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (24, '系统内置', 'sys_yes_no', 1, 31, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (29, '政务工作模型分类', 'gov_cate_models', 1, 2, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (30, '菜单模块类型', 'menu_module_type', 1, 2, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (31, '工作流程类型', 'flow_type', 1, 2, 0, '', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (32, '工作流程审批状态', 'flow_status', 1, 31, 0, '工作流程审批状态', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (33, '博客分类类型', 'sys_blog_type', 1, 31, 31, '博客分类中的标志', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (34, '博客日志标志', 'sys_log_sign', 1, 31, 0, '博客日志管理中的标志数据字典', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (35, '工作流紧急状态', 'flow_level', 1, 31, 31, '', NULL, '2021-07-20 08:55:20', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(4) NULL DEFAULT 1 COMMENT '计划执行策略（1多次执行 2执行一次）',
  `concurrent` tinyint(4) NULL DEFAULT 1 COMMENT '是否并发执行（0允许 1禁止）',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态（0正常 1暂停）',
  `create_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `update_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '测试任务1', '', 'DEFAULT', 'test1', '* * * * * ?', 1, 0, 1, 1, 31, '', NULL, '2021-07-16 16:01:59', NULL);
INSERT INTO `sys_job` VALUES (2, '测试任务2', 'hello|gfast', 'DEFAULT', 'test2', '* * * * * ?', 1, 0, 1, 1, 31, '备注', NULL, '2021-07-16 17:15:09', NULL);
INSERT INTO `sys_job` VALUES (6, '测试任务3', 'hello|gfast', 'DEFAULT', 'test2', '* * * * * *', 1, 0, 1, 1, 31, '备注', NULL, NULL, '2021-07-16 16:51:20');
INSERT INTO `sys_job` VALUES (8, '在线用户定时更新', '', 'DEFAULT', 'checkUserOnline', '5 */10 * * * ?', 1, 0, 0, 2, 1, '', NULL, '2021-07-19 08:57:24', NULL);
INSERT INTO `sys_job` VALUES (9, '测试', 'arg1', 'DEFAULT', 'demo1', ' */5 * * * * ? ', 1, 1, 1, 31, 31, '', '2021-07-15 15:00:15', '2021-07-16 16:47:56', '2021-07-16 16:48:00');
INSERT INTO `sys_job` VALUES (10, '测试', 'arg1', 'DEFAULT', 'demo1', ' */5 * * * * ? ', 2, 1, 1, 31, 31, '', '2021-07-15 22:12:15', '2021-07-16 16:47:52', '2021-07-16 16:48:00');
INSERT INTO `sys_job` VALUES (11, '测试', 'arg1', 'DEFAULT', 'demo1', ' */5 * * * * ? ', 2, 1, 1, 31, 31, '', '2021-07-16 08:49:43', '2021-07-16 08:59:32', '2021-07-16 16:46:51');
INSERT INTO `sys_job` VALUES (12, '测试366', 'arg1', 'DEFAULT', 'demo1', ' */5 * * * * ? ', 2, 1, 1, 31, 31, '', '2021-07-16 08:50:10', '2021-07-16 08:59:26', '2021-07-16 16:46:51');

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
  `login_time` datetime(0) NULL COMMENT '登录时间',
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-19 15:52:33', '');
INSERT INTO `sys_login_log` VALUES (2, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-19 16:45:43', '系统后台');
INSERT INTO `sys_login_log` VALUES (3, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 7', 1, '登录成功', '2021-07-19 17:03:06', '系统后台');
INSERT INTO `sys_login_log` VALUES (4, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-19 17:46:26', '系统后台');
INSERT INTO `sys_login_log` VALUES (5, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-20 08:44:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (6, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 7', 1, '登录成功', '2021-07-20 09:13:42', '系统后台');
INSERT INTO `sys_login_log` VALUES (7, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-20 09:48:56', '系统后台');
INSERT INTO `sys_login_log` VALUES (8, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-20 10:22:26', '系统后台');
INSERT INTO `sys_login_log` VALUES (9, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-20 12:13:35', '系统后台');
INSERT INTO `sys_login_log` VALUES (10, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-20 14:12:04', '系统后台');
INSERT INTO `sys_login_log` VALUES (11, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-07-20 16:18:38', '系统后台');
INSERT INTO `sys_login_log` VALUES (12, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-08-04 16:58:01', '系统后台');
INSERT INTO `sys_login_log` VALUES (13, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-08-04 21:06:12', '系统后台');
INSERT INTO `sys_login_log` VALUES (14, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-09-15 14:59:08', '系统后台');
INSERT INTO `sys_login_log` VALUES (15, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-11-08 16:58:32', '系统后台');
INSERT INTO `sys_login_log` VALUES (16, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-11-09 14:33:34', '系统后台');
INSERT INTO `sys_login_log` VALUES (17, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2021-12-22 09:34:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (18, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2022-01-04 15:02:46', '系统后台');
INSERT INTO `sys_login_log` VALUES (19, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2022-01-04 16:01:05', '系统后台');
INSERT INTO `sys_login_log` VALUES (20, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2022-01-11 09:19:57', '系统后台');
INSERT INTO `sys_login_log` VALUES (21, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2022-02-17 09:17:03', '系统后台');
INSERT INTO `sys_login_log` VALUES (22, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-03 08:59:21', '系统后台');
INSERT INTO `sys_login_log` VALUES (23, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-03 11:50:25', '系统后台');
INSERT INTO `sys_login_log` VALUES (24, 'demo', '[::1]', '内网IP', 'Chrome', 'Windows 10', 1, '登录成功', '2022-03-03 12:01:22', '系统后台');

-- ----------------------------
-- Table structure for sys_model_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_model_info`;
CREATE TABLE `sys_model_info`  (
  `model_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `model_category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模板分类id',
  `model_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模型标识',
  `model_title` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `model_pk` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键字段',
  `model_order` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '默认排序字段',
  `model_sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单字段排序',
  `model_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列表显示字段，为空显示全部',
  `model_edit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '可编辑字段，为空则除主键外均可以编辑',
  `model_indexes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '索引字段',
  `search_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `model_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `model_engine` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `update_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE INDEX `name_uni`(`model_name`) USING BTREE COMMENT '模型名唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_model_info
-- ----------------------------
INSERT INTO `sys_model_info` VALUES (1, 5, 'house_info', '房屋信息', 'house_id', 'hi_order', 'house_id', 'house_id,belong_houses,belong_house_type,door_number', 'belong_houses,belong_house_type,door_number', 'door_number', 'belong_houses,belong_house_type,door_number', 1498101800, 1605838046, 1, 'MyISAM', 0, 1);
INSERT INTO `sys_model_info` VALUES (9, 6, 'cms_news_attr', '文章模型', 'art_id', '', 'art_id', 'news_info,text_demo', 'news_content,thumbnail,news_files,news_file,news_imgs,news_title,news_info,text_demo,time_demo', '', 'news_info,text_demo', 1595316217, 1596095352, 1, 'InnoDB', 1, 31);
INSERT INTO `sys_model_info` VALUES (10, 1, 'gov_work_report', '政府工作报告', 'matter_id', 'matter_id', '', 'title,content,sponsor,organizer', 'title,content,sponsor,organizer', 'matter_id', 'title', 1596528880, 1599701551, 1, 'InnoDB', 2, 31);
INSERT INTO `sys_model_info` VALUES (12, 1, 'gov_work_major_project', '重大项目', 'matter_id', 'matter_id', '', 'project_no,title,content,sponsor,total_investment,annual_investment,progress_status', 'project_no,title,content,sponsor,total_investment,annual_investment,progress_status', 'matter_id', 'title', 1599702575, 1605512186, 1, 'InnoDB', 31, 1);
INSERT INTO `sys_model_info` VALUES (13, 1, 'gov_work_important_documents', '重要文件办理', 'matter_id', 'matter_id', '', 'title,original_unit,document_number,receive_time,sponsor,content', 'title,original_unit,document_number,receive_time,sponsor,content', 'matter_id', 'title', 1599710390, 1599710390, 1, 'InnoDB', 31, 0);
INSERT INTO `sys_model_info` VALUES (14, 1, 'gov_work_livelihood', '民生目标', 'matter_id', 'matter_id', '', 'title,type,content,sponsor,organizer', 'title,type,content,sponsor,organizer', 'matter_id', 'title', 1599721999, 1599721999, 1, 'InnoDB', 31, 0);
INSERT INTO `sys_model_info` VALUES (15, 1, 'gov_work_meeting', '会议议定', 'matter_id', 'matter_id', '', 'title,content,sponsor,organizer', 'title,content,sponsor,organizer', 'matter_id', 'title', 1599722042, 1605512125, 1, 'InnoDB', 31, 1);
INSERT INTO `sys_model_info` VALUES (16, 1, 'gov_work_assigned_leader', '领导交办', 'matter_id', 'matter_id', '', 'title,number,content,sponsor,organizer,instruction_time,instruction_leader', 'title,number,content,sponsor,organizer,instruction_time,instruction_leader', 'matter_id', 'title', 1599722097, 1599722097, 1, 'InnoDB', 31, 0);
INSERT INTO `sys_model_info` VALUES (17, 1, 'gov_work_other', '其它任务', 'matter_id', 'matter_id', '', 'title,content,sponsor,organizer', 'title,content,sponsor,organizer', 'matter_id', 'title', 1599722127, 1599722127, 1, 'InnoDB', 31, 0);
INSERT INTO `sys_model_info` VALUES (18, 1, 'gov_work_investment', '招商引资', 'matter_id', 'matter_id', '', 'project_type,title,company_name,investment_volume,paid_in_investment,content,address,project_progress,project_target,manage_leader,responsible_department,sponsor,organizer,remark', 'project_type,title,company_name,investment_volume,paid_in_investment,content,address,project_progress,project_target,manage_leader,responsible_department,sponsor,organizer,remark', '', 'title', 1611542517, 1611542540, 1, 'InnoDB', 1, 1);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '清空', 0, '/system/monitor/operLog/clear', 'DELETE', 1, 'demo', '财务部门', '/system/monitor/operLog/clear', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:09:41');
INSERT INTO `sys_oper_log` VALUES (2, '', 0, '/system/monitor/operLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/operLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:09:41');
INSERT INTO `sys_oper_log` VALUES (3, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:09:45');
INSERT INTO `sys_oper_log` VALUES (4, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:09:45');
INSERT INTO `sys_oper_log` VALUES (5, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:09:45');
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:09:45');
INSERT INTO `sys_oper_log` VALUES (7, '', 0, '/system/monitor/operLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/operLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:09:49');
INSERT INTO `sys_oper_log` VALUES (8, '', 0, '/system/monitor/loginLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/loginLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:27');
INSERT INTO `sys_oper_log` VALUES (9, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=admin_login_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"admin_login_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:27');
INSERT INTO `sys_oper_log` VALUES (10, '', 0, '/system/monitor/loginLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/loginLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:28');
INSERT INTO `sys_oper_log` VALUES (11, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:32');
INSERT INTO `sys_oper_log` VALUES (12, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_group&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_group\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:35');
INSERT INTO `sys_oper_log` VALUES (13, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_policy&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_policy\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:35');
INSERT INTO `sys_oper_log` VALUES (14, '', 0, '/system/monitor/job/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/job/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:35');
INSERT INTO `sys_oper_log` VALUES (15, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:35');
INSERT INTO `sys_oper_log` VALUES (16, '在线用户', 0, '/system/monitor/online/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/online/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:10:37');
INSERT INTO `sys_oper_log` VALUES (17, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:48:56');
INSERT INTO `sys_oper_log` VALUES (18, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:48:56');
INSERT INTO `sys_oper_log` VALUES (19, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 09:48:57');
INSERT INTO `sys_oper_log` VALUES (20, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:04:43');
INSERT INTO `sys_oper_log` VALUES (21, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:04:43');
INSERT INTO `sys_oper_log` VALUES (22, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:04:48');
INSERT INTO `sys_oper_log` VALUES (23, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:04:48');
INSERT INTO `sys_oper_log` VALUES (24, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:04:50');
INSERT INTO `sys_oper_log` VALUES (25, '部门管理', 0, '/system/auth/deptList', 'GET', 1, 'demo', '财务部门', '/system/auth/deptList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:04:50');
INSERT INTO `sys_oper_log` VALUES (26, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:22:26');
INSERT INTO `sys_oper_log` VALUES (27, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:22:26');
INSERT INTO `sys_oper_log` VALUES (28, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:22:37');
INSERT INTO `sys_oper_log` VALUES (29, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:22:37');
INSERT INTO `sys_oper_log` VALUES (30, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:22:37');
INSERT INTO `sys_oper_log` VALUES (31, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:22:37');
INSERT INTO `sys_oper_log` VALUES (32, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:50:56');
INSERT INTO `sys_oper_log` VALUES (33, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:50:56');
INSERT INTO `sys_oper_log` VALUES (34, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:50:57');
INSERT INTO `sys_oper_log` VALUES (35, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:50:57');
INSERT INTO `sys_oper_log` VALUES (36, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:50:57');
INSERT INTO `sys_oper_log` VALUES (37, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:50:57');
INSERT INTO `sys_oper_log` VALUES (38, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=161', '[::1]', '内网IP', '{\"menuId\":\"161\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:51:08');
INSERT INTO `sys_oper_log` VALUES (39, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[160]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:52:58');
INSERT INTO `sys_oper_log` VALUES (40, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:52:59');
INSERT INTO `sys_oper_log` VALUES (41, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=143', '[::1]', '内网IP', '{\"menuId\":\"143\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 10:53:51');
INSERT INTO `sys_oper_log` VALUES (42, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:30');
INSERT INTO `sys_oper_log` VALUES (43, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:30');
INSERT INTO `sys_oper_log` VALUES (44, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:36');
INSERT INTO `sys_oper_log` VALUES (45, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:36');
INSERT INTO `sys_oper_log` VALUES (46, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:36');
INSERT INTO `sys_oper_log` VALUES (47, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:36');
INSERT INTO `sys_oper_log` VALUES (48, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[150]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:43');
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:43');
INSERT INTO `sys_oper_log` VALUES (50, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[146]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:48');
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:48');
INSERT INTO `sys_oper_log` VALUES (52, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[138]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:52');
INSERT INTO `sys_oper_log` VALUES (53, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:52');
INSERT INTO `sys_oper_log` VALUES (54, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[136]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:57');
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:02:57');
INSERT INTO `sys_oper_log` VALUES (56, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[134]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:01');
INSERT INTO `sys_oper_log` VALUES (57, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:01');
INSERT INTO `sys_oper_log` VALUES (58, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[132]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:04');
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:04');
INSERT INTO `sys_oper_log` VALUES (60, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[120]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:07');
INSERT INTO `sys_oper_log` VALUES (61, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:07');
INSERT INTO `sys_oper_log` VALUES (62, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[96]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:11');
INSERT INTO `sys_oper_log` VALUES (63, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:11');
INSERT INTO `sys_oper_log` VALUES (64, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[87]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:15');
INSERT INTO `sys_oper_log` VALUES (65, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:15');
INSERT INTO `sys_oper_log` VALUES (66, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[77]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:36');
INSERT INTO `sys_oper_log` VALUES (67, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:36');
INSERT INTO `sys_oper_log` VALUES (68, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[82]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:39');
INSERT INTO `sys_oper_log` VALUES (69, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:39');
INSERT INTO `sys_oper_log` VALUES (70, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[72]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:44');
INSERT INTO `sys_oper_log` VALUES (71, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:44');
INSERT INTO `sys_oper_log` VALUES (72, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[4]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:47');
INSERT INTO `sys_oper_log` VALUES (73, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:47');
INSERT INTO `sys_oper_log` VALUES (74, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:49');
INSERT INTO `sys_oper_log` VALUES (75, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:49');
INSERT INTO `sys_oper_log` VALUES (76, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:50');
INSERT INTO `sys_oper_log` VALUES (77, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:50');
INSERT INTO `sys_oper_log` VALUES (78, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:50');
INSERT INTO `sys_oper_log` VALUES (79, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:03:50');
INSERT INTO `sys_oper_log` VALUES (80, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:16');
INSERT INTO `sys_oper_log` VALUES (81, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:16');
INSERT INTO `sys_oper_log` VALUES (82, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:16');
INSERT INTO `sys_oper_log` VALUES (83, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:16');
INSERT INTO `sys_oper_log` VALUES (84, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[78]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:20');
INSERT INTO `sys_oper_log` VALUES (85, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:20');
INSERT INTO `sys_oper_log` VALUES (86, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:24');
INSERT INTO `sys_oper_log` VALUES (87, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:24');
INSERT INTO `sys_oper_log` VALUES (88, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:24');
INSERT INTO `sys_oper_log` VALUES (89, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:24');
INSERT INTO `sys_oper_log` VALUES (90, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:24');
INSERT INTO `sys_oper_log` VALUES (91, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:24');
INSERT INTO `sys_oper_log` VALUES (92, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:28');
INSERT INTO `sys_oper_log` VALUES (93, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:28');
INSERT INTO `sys_oper_log` VALUES (94, '站点设置', 0, '/system/config/sysWebSet', 'GET', 1, 'demo', '财务部门', '/system/config/sysWebSet', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:30');
INSERT INTO `sys_oper_log` VALUES (95, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:32');
INSERT INTO `sys_oper_log` VALUES (96, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:32');
INSERT INTO `sys_oper_log` VALUES (97, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:32');
INSERT INTO `sys_oper_log` VALUES (98, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:32');
INSERT INTO `sys_oper_log` VALUES (99, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:33');
INSERT INTO `sys_oper_log` VALUES (100, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:33');
INSERT INTO `sys_oper_log` VALUES (101, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:35');
INSERT INTO `sys_oper_log` VALUES (102, '部门管理', 0, '/system/auth/deptList', 'GET', 1, 'demo', '财务部门', '/system/auth/deptList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:35');
INSERT INTO `sys_oper_log` VALUES (103, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:36');
INSERT INTO `sys_oper_log` VALUES (104, '岗位管理', 0, '/system/auth/postList', 'GET', 1, 'demo', '财务部门', '/system/auth/postList?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:36');
INSERT INTO `sys_oper_log` VALUES (105, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:37');
INSERT INTO `sys_oper_log` VALUES (106, '', 0, '/system/auth/deptTreeSelect', 'GET', 1, 'demo', '财务部门', '/system/auth/deptTreeSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:37');
INSERT INTO `sys_oper_log` VALUES (107, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:37');
INSERT INTO `sys_oper_log` VALUES (108, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:04:37');
INSERT INTO `sys_oper_log` VALUES (109, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:02');
INSERT INTO `sys_oper_log` VALUES (110, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:02');
INSERT INTO `sys_oper_log` VALUES (111, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:02');
INSERT INTO `sys_oper_log` VALUES (112, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:02');
INSERT INTO `sys_oper_log` VALUES (113, '', 0, '/system/auth/deptTreeSelect', 'GET', 1, 'demo', '财务部门', '/system/auth/deptTreeSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:02');
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:02');
INSERT INTO `sys_oper_log` VALUES (115, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:08');
INSERT INTO `sys_oper_log` VALUES (116, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:08');
INSERT INTO `sys_oper_log` VALUES (117, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:09');
INSERT INTO `sys_oper_log` VALUES (118, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:09');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:09');
INSERT INTO `sys_oper_log` VALUES (120, '', 0, '/system/auth/deptTreeSelect', 'GET', 1, 'demo', '财务部门', '/system/auth/deptTreeSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:09');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:11');
INSERT INTO `sys_oper_log` VALUES (122, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:11');
INSERT INTO `sys_oper_log` VALUES (123, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:11');
INSERT INTO `sys_oper_log` VALUES (124, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:06:11');
INSERT INTO `sys_oper_log` VALUES (125, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:41:33');
INSERT INTO `sys_oper_log` VALUES (126, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:41:38');
INSERT INTO `sys_oper_log` VALUES (127, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:41:43');
INSERT INTO `sys_oper_log` VALUES (128, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:41:48');
INSERT INTO `sys_oper_log` VALUES (129, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:41:53');
INSERT INTO `sys_oper_log` VALUES (130, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:41:58');
INSERT INTO `sys_oper_log` VALUES (131, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:03');
INSERT INTO `sys_oper_log` VALUES (132, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:08');
INSERT INTO `sys_oper_log` VALUES (133, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:13');
INSERT INTO `sys_oper_log` VALUES (134, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:18');
INSERT INTO `sys_oper_log` VALUES (135, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:23');
INSERT INTO `sys_oper_log` VALUES (136, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:28');
INSERT INTO `sys_oper_log` VALUES (137, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:33');
INSERT INTO `sys_oper_log` VALUES (138, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:38');
INSERT INTO `sys_oper_log` VALUES (139, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:43');
INSERT INTO `sys_oper_log` VALUES (140, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:48');
INSERT INTO `sys_oper_log` VALUES (141, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:53');
INSERT INTO `sys_oper_log` VALUES (142, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:42:58');
INSERT INTO `sys_oper_log` VALUES (143, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:03');
INSERT INTO `sys_oper_log` VALUES (144, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:08');
INSERT INTO `sys_oper_log` VALUES (145, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:13');
INSERT INTO `sys_oper_log` VALUES (146, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:18');
INSERT INTO `sys_oper_log` VALUES (147, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:23');
INSERT INTO `sys_oper_log` VALUES (148, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:28');
INSERT INTO `sys_oper_log` VALUES (149, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:33');
INSERT INTO `sys_oper_log` VALUES (150, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:38');
INSERT INTO `sys_oper_log` VALUES (151, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:43');
INSERT INTO `sys_oper_log` VALUES (152, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:48');
INSERT INTO `sys_oper_log` VALUES (153, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:53');
INSERT INTO `sys_oper_log` VALUES (154, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:43:58');
INSERT INTO `sys_oper_log` VALUES (155, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:03');
INSERT INTO `sys_oper_log` VALUES (156, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:08');
INSERT INTO `sys_oper_log` VALUES (157, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:13');
INSERT INTO `sys_oper_log` VALUES (158, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:18');
INSERT INTO `sys_oper_log` VALUES (159, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:23');
INSERT INTO `sys_oper_log` VALUES (160, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:28');
INSERT INTO `sys_oper_log` VALUES (161, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:33');
INSERT INTO `sys_oper_log` VALUES (162, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:38');
INSERT INTO `sys_oper_log` VALUES (163, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:43');
INSERT INTO `sys_oper_log` VALUES (164, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:48');
INSERT INTO `sys_oper_log` VALUES (165, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:53');
INSERT INTO `sys_oper_log` VALUES (166, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:44:58');
INSERT INTO `sys_oper_log` VALUES (167, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:03');
INSERT INTO `sys_oper_log` VALUES (168, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:08');
INSERT INTO `sys_oper_log` VALUES (169, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:13');
INSERT INTO `sys_oper_log` VALUES (170, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:18');
INSERT INTO `sys_oper_log` VALUES (171, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:23');
INSERT INTO `sys_oper_log` VALUES (172, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:28');
INSERT INTO `sys_oper_log` VALUES (173, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:33');
INSERT INTO `sys_oper_log` VALUES (174, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:38');
INSERT INTO `sys_oper_log` VALUES (175, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:43');
INSERT INTO `sys_oper_log` VALUES (176, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:48');
INSERT INTO `sys_oper_log` VALUES (177, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:53');
INSERT INTO `sys_oper_log` VALUES (178, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:45:58');
INSERT INTO `sys_oper_log` VALUES (179, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:03');
INSERT INTO `sys_oper_log` VALUES (180, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:08');
INSERT INTO `sys_oper_log` VALUES (181, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:13');
INSERT INTO `sys_oper_log` VALUES (182, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:18');
INSERT INTO `sys_oper_log` VALUES (183, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:23');
INSERT INTO `sys_oper_log` VALUES (184, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:28');
INSERT INTO `sys_oper_log` VALUES (185, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:33');
INSERT INTO `sys_oper_log` VALUES (186, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:38');
INSERT INTO `sys_oper_log` VALUES (187, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:43');
INSERT INTO `sys_oper_log` VALUES (188, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:48');
INSERT INTO `sys_oper_log` VALUES (189, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:53');
INSERT INTO `sys_oper_log` VALUES (190, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:46:58');
INSERT INTO `sys_oper_log` VALUES (191, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:03');
INSERT INTO `sys_oper_log` VALUES (192, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:08');
INSERT INTO `sys_oper_log` VALUES (193, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:13');
INSERT INTO `sys_oper_log` VALUES (194, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:18');
INSERT INTO `sys_oper_log` VALUES (195, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:23');
INSERT INTO `sys_oper_log` VALUES (196, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:28');
INSERT INTO `sys_oper_log` VALUES (197, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:33');
INSERT INTO `sys_oper_log` VALUES (198, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:38');
INSERT INTO `sys_oper_log` VALUES (199, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:43');
INSERT INTO `sys_oper_log` VALUES (200, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:48');
INSERT INTO `sys_oper_log` VALUES (201, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:53');
INSERT INTO `sys_oper_log` VALUES (202, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:47:58');
INSERT INTO `sys_oper_log` VALUES (203, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:03');
INSERT INTO `sys_oper_log` VALUES (204, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:08');
INSERT INTO `sys_oper_log` VALUES (205, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:13');
INSERT INTO `sys_oper_log` VALUES (206, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:18');
INSERT INTO `sys_oper_log` VALUES (207, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:23');
INSERT INTO `sys_oper_log` VALUES (208, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:28');
INSERT INTO `sys_oper_log` VALUES (209, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:33');
INSERT INTO `sys_oper_log` VALUES (210, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:38');
INSERT INTO `sys_oper_log` VALUES (211, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:43');
INSERT INTO `sys_oper_log` VALUES (212, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:48');
INSERT INTO `sys_oper_log` VALUES (213, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:53');
INSERT INTO `sys_oper_log` VALUES (214, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:48:58');
INSERT INTO `sys_oper_log` VALUES (215, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:03');
INSERT INTO `sys_oper_log` VALUES (216, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:08');
INSERT INTO `sys_oper_log` VALUES (217, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:13');
INSERT INTO `sys_oper_log` VALUES (218, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:18');
INSERT INTO `sys_oper_log` VALUES (219, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:23');
INSERT INTO `sys_oper_log` VALUES (220, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:28');
INSERT INTO `sys_oper_log` VALUES (221, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:33');
INSERT INTO `sys_oper_log` VALUES (222, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:38');
INSERT INTO `sys_oper_log` VALUES (223, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:43');
INSERT INTO `sys_oper_log` VALUES (224, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:48');
INSERT INTO `sys_oper_log` VALUES (225, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:53');
INSERT INTO `sys_oper_log` VALUES (226, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:49:58');
INSERT INTO `sys_oper_log` VALUES (227, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:03');
INSERT INTO `sys_oper_log` VALUES (228, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:08');
INSERT INTO `sys_oper_log` VALUES (229, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:13');
INSERT INTO `sys_oper_log` VALUES (230, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:18');
INSERT INTO `sys_oper_log` VALUES (231, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:23');
INSERT INTO `sys_oper_log` VALUES (232, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:28');
INSERT INTO `sys_oper_log` VALUES (233, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:33');
INSERT INTO `sys_oper_log` VALUES (234, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:38');
INSERT INTO `sys_oper_log` VALUES (235, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:43');
INSERT INTO `sys_oper_log` VALUES (236, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:48');
INSERT INTO `sys_oper_log` VALUES (237, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:53');
INSERT INTO `sys_oper_log` VALUES (238, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:50:58');
INSERT INTO `sys_oper_log` VALUES (239, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:03');
INSERT INTO `sys_oper_log` VALUES (240, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:08');
INSERT INTO `sys_oper_log` VALUES (241, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:13');
INSERT INTO `sys_oper_log` VALUES (242, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:18');
INSERT INTO `sys_oper_log` VALUES (243, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:23');
INSERT INTO `sys_oper_log` VALUES (244, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:28');
INSERT INTO `sys_oper_log` VALUES (245, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:33');
INSERT INTO `sys_oper_log` VALUES (246, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:38');
INSERT INTO `sys_oper_log` VALUES (247, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:43');
INSERT INTO `sys_oper_log` VALUES (248, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:48');
INSERT INTO `sys_oper_log` VALUES (249, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:53');
INSERT INTO `sys_oper_log` VALUES (250, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:51:58');
INSERT INTO `sys_oper_log` VALUES (251, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:52:03');
INSERT INTO `sys_oper_log` VALUES (252, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:52:08');
INSERT INTO `sys_oper_log` VALUES (253, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:52:56');
INSERT INTO `sys_oper_log` VALUES (254, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:53:56');
INSERT INTO `sys_oper_log` VALUES (255, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:54:56');
INSERT INTO `sys_oper_log` VALUES (256, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:55:56');
INSERT INTO `sys_oper_log` VALUES (257, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:56:39');
INSERT INTO `sys_oper_log` VALUES (258, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:56:43');
INSERT INTO `sys_oper_log` VALUES (259, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:56:48');
INSERT INTO `sys_oper_log` VALUES (260, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:56:53');
INSERT INTO `sys_oper_log` VALUES (261, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:56:58');
INSERT INTO `sys_oper_log` VALUES (262, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:03');
INSERT INTO `sys_oper_log` VALUES (263, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:08');
INSERT INTO `sys_oper_log` VALUES (264, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:13');
INSERT INTO `sys_oper_log` VALUES (265, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:18');
INSERT INTO `sys_oper_log` VALUES (266, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:23');
INSERT INTO `sys_oper_log` VALUES (267, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:28');
INSERT INTO `sys_oper_log` VALUES (268, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:33');
INSERT INTO `sys_oper_log` VALUES (269, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:38');
INSERT INTO `sys_oper_log` VALUES (270, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:43');
INSERT INTO `sys_oper_log` VALUES (271, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:48');
INSERT INTO `sys_oper_log` VALUES (272, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:53');
INSERT INTO `sys_oper_log` VALUES (273, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:57:58');
INSERT INTO `sys_oper_log` VALUES (274, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:03');
INSERT INTO `sys_oper_log` VALUES (275, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:08');
INSERT INTO `sys_oper_log` VALUES (276, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:13');
INSERT INTO `sys_oper_log` VALUES (277, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:18');
INSERT INTO `sys_oper_log` VALUES (278, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:23');
INSERT INTO `sys_oper_log` VALUES (279, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:28');
INSERT INTO `sys_oper_log` VALUES (280, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:33');
INSERT INTO `sys_oper_log` VALUES (281, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:38');
INSERT INTO `sys_oper_log` VALUES (282, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:43');
INSERT INTO `sys_oper_log` VALUES (283, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:48');
INSERT INTO `sys_oper_log` VALUES (284, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:53');
INSERT INTO `sys_oper_log` VALUES (285, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:58:58');
INSERT INTO `sys_oper_log` VALUES (286, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:03');
INSERT INTO `sys_oper_log` VALUES (287, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:08');
INSERT INTO `sys_oper_log` VALUES (288, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:13');
INSERT INTO `sys_oper_log` VALUES (289, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:18');
INSERT INTO `sys_oper_log` VALUES (290, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:23');
INSERT INTO `sys_oper_log` VALUES (291, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:28');
INSERT INTO `sys_oper_log` VALUES (292, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:33');
INSERT INTO `sys_oper_log` VALUES (293, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:38');
INSERT INTO `sys_oper_log` VALUES (294, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:43');
INSERT INTO `sys_oper_log` VALUES (295, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:48');
INSERT INTO `sys_oper_log` VALUES (296, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:53');
INSERT INTO `sys_oper_log` VALUES (297, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 11:59:58');
INSERT INTO `sys_oper_log` VALUES (298, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:03');
INSERT INTO `sys_oper_log` VALUES (299, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:08');
INSERT INTO `sys_oper_log` VALUES (300, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:13');
INSERT INTO `sys_oper_log` VALUES (301, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:18');
INSERT INTO `sys_oper_log` VALUES (302, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:23');
INSERT INTO `sys_oper_log` VALUES (303, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:28');
INSERT INTO `sys_oper_log` VALUES (304, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:33');
INSERT INTO `sys_oper_log` VALUES (305, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:38');
INSERT INTO `sys_oper_log` VALUES (306, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:43');
INSERT INTO `sys_oper_log` VALUES (307, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:48');
INSERT INTO `sys_oper_log` VALUES (308, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:53');
INSERT INTO `sys_oper_log` VALUES (309, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:00:58');
INSERT INTO `sys_oper_log` VALUES (310, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:03');
INSERT INTO `sys_oper_log` VALUES (311, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:08');
INSERT INTO `sys_oper_log` VALUES (312, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:13');
INSERT INTO `sys_oper_log` VALUES (313, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:18');
INSERT INTO `sys_oper_log` VALUES (314, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:23');
INSERT INTO `sys_oper_log` VALUES (315, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:28');
INSERT INTO `sys_oper_log` VALUES (316, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:33');
INSERT INTO `sys_oper_log` VALUES (317, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:38');
INSERT INTO `sys_oper_log` VALUES (318, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:43');
INSERT INTO `sys_oper_log` VALUES (319, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:48');
INSERT INTO `sys_oper_log` VALUES (320, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:53');
INSERT INTO `sys_oper_log` VALUES (321, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:01:58');
INSERT INTO `sys_oper_log` VALUES (322, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:03');
INSERT INTO `sys_oper_log` VALUES (323, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:08');
INSERT INTO `sys_oper_log` VALUES (324, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:13');
INSERT INTO `sys_oper_log` VALUES (325, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:18');
INSERT INTO `sys_oper_log` VALUES (326, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:23');
INSERT INTO `sys_oper_log` VALUES (327, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:28');
INSERT INTO `sys_oper_log` VALUES (328, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:33');
INSERT INTO `sys_oper_log` VALUES (329, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:38');
INSERT INTO `sys_oper_log` VALUES (330, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:43');
INSERT INTO `sys_oper_log` VALUES (331, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:48');
INSERT INTO `sys_oper_log` VALUES (332, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:53');
INSERT INTO `sys_oper_log` VALUES (333, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:02:58');
INSERT INTO `sys_oper_log` VALUES (334, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:03');
INSERT INTO `sys_oper_log` VALUES (335, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:08');
INSERT INTO `sys_oper_log` VALUES (336, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:13');
INSERT INTO `sys_oper_log` VALUES (337, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:18');
INSERT INTO `sys_oper_log` VALUES (338, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:23');
INSERT INTO `sys_oper_log` VALUES (339, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:28');
INSERT INTO `sys_oper_log` VALUES (340, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:33');
INSERT INTO `sys_oper_log` VALUES (341, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:38');
INSERT INTO `sys_oper_log` VALUES (342, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:43');
INSERT INTO `sys_oper_log` VALUES (343, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:48');
INSERT INTO `sys_oper_log` VALUES (344, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:53');
INSERT INTO `sys_oper_log` VALUES (345, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:03:58');
INSERT INTO `sys_oper_log` VALUES (346, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:03');
INSERT INTO `sys_oper_log` VALUES (347, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:08');
INSERT INTO `sys_oper_log` VALUES (348, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:13');
INSERT INTO `sys_oper_log` VALUES (349, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:18');
INSERT INTO `sys_oper_log` VALUES (350, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:19');
INSERT INTO `sys_oper_log` VALUES (351, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:19');
INSERT INTO `sys_oper_log` VALUES (352, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:19');
INSERT INTO `sys_oper_log` VALUES (353, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:19');
INSERT INTO `sys_oper_log` VALUES (354, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&deptId=105&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"deptId\":\"105\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:23');
INSERT INTO `sys_oper_log` VALUES (355, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&deptId=103&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"deptId\":\"103\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:24');
INSERT INTO `sys_oper_log` VALUES (356, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&deptId=103&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"deptId\":\"103\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:25');
INSERT INTO `sys_oper_log` VALUES (357, '', 0, '/system/auth/getEditUser', 'GET', 1, 'demo', '财务部门', '/system/auth/getEditUser?id=6', '[::1]', '内网IP', '{\"id\":\"6\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:26');
INSERT INTO `sys_oper_log` VALUES (358, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:31');
INSERT INTO `sys_oper_log` VALUES (359, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:31');
INSERT INTO `sys_oper_log` VALUES (360, '修改角色', 0, '/system/auth/editRole', 'GET', 1, 'demo', '财务部门', '/system/auth/editRole?roleId=4', '[::1]', '内网IP', '{\"roleId\":\"4\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:04:33');
INSERT INTO `sys_oper_log` VALUES (361, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:16');
INSERT INTO `sys_oper_log` VALUES (362, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:16');
INSERT INTO `sys_oper_log` VALUES (363, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:19');
INSERT INTO `sys_oper_log` VALUES (364, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:19');
INSERT INTO `sys_oper_log` VALUES (365, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:22');
INSERT INTO `sys_oper_log` VALUES (366, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:22');
INSERT INTO `sys_oper_log` VALUES (367, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:36');
INSERT INTO `sys_oper_log` VALUES (368, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:36');
INSERT INTO `sys_oper_log` VALUES (369, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:44');
INSERT INTO `sys_oper_log` VALUES (370, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:06:44');
INSERT INTO `sys_oper_log` VALUES (371, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:35');
INSERT INTO `sys_oper_log` VALUES (372, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:35');
INSERT INTO `sys_oper_log` VALUES (373, '站点设置', 0, '/system/config/sysWebSet', 'GET', 1, 'demo', '财务部门', '/system/config/sysWebSet', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:40');
INSERT INTO `sys_oper_log` VALUES (374, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:47');
INSERT INTO `sys_oper_log` VALUES (375, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:47');
INSERT INTO `sys_oper_log` VALUES (376, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:48');
INSERT INTO `sys_oper_log` VALUES (377, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:48');
INSERT INTO `sys_oper_log` VALUES (378, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:51');
INSERT INTO `sys_oper_log` VALUES (379, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:51');
INSERT INTO `sys_oper_log` VALUES (380, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:51');
INSERT INTO `sys_oper_log` VALUES (381, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:51');
INSERT INTO `sys_oper_log` VALUES (382, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:52');
INSERT INTO `sys_oper_log` VALUES (383, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:52');
INSERT INTO `sys_oper_log` VALUES (384, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:53');
INSERT INTO `sys_oper_log` VALUES (385, '部门管理', 0, '/system/auth/deptList', 'GET', 1, 'demo', '财务部门', '/system/auth/deptList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:53');
INSERT INTO `sys_oper_log` VALUES (386, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:55');
INSERT INTO `sys_oper_log` VALUES (387, '岗位管理', 0, '/system/auth/postList', 'GET', 1, 'demo', '财务部门', '/system/auth/postList?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:55');
INSERT INTO `sys_oper_log` VALUES (388, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:56');
INSERT INTO `sys_oper_log` VALUES (389, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:56');
INSERT INTO `sys_oper_log` VALUES (390, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:56');
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:13:56');
INSERT INTO `sys_oper_log` VALUES (392, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:14:05');
INSERT INTO `sys_oper_log` VALUES (393, '', 0, '/system/monitor/loginLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/loginLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:11');
INSERT INTO `sys_oper_log` VALUES (394, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=admin_login_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"admin_login_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:11');
INSERT INTO `sys_oper_log` VALUES (395, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:13');
INSERT INTO `sys_oper_log` VALUES (396, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:18');
INSERT INTO `sys_oper_log` VALUES (397, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:23');
INSERT INTO `sys_oper_log` VALUES (398, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:28');
INSERT INTO `sys_oper_log` VALUES (399, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:33');
INSERT INTO `sys_oper_log` VALUES (400, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:38');
INSERT INTO `sys_oper_log` VALUES (401, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:38');
INSERT INTO `sys_oper_log` VALUES (402, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:38');
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:38');
INSERT INTO `sys_oper_log` VALUES (404, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:38');
INSERT INTO `sys_oper_log` VALUES (405, '站点设置', 0, '/system/config/sysWebSet', 'GET', 1, 'demo', '财务部门', '/system/config/sysWebSet', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:40');
INSERT INTO `sys_oper_log` VALUES (406, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:42');
INSERT INTO `sys_oper_log` VALUES (407, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:42');
INSERT INTO `sys_oper_log` VALUES (408, '站点设置', 0, '/system/config/sysWebSet', 'GET', 1, 'demo', '财务部门', '/system/config/sysWebSet', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:42');
INSERT INTO `sys_oper_log` VALUES (409, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:44');
INSERT INTO `sys_oper_log` VALUES (410, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:44');
INSERT INTO `sys_oper_log` VALUES (411, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:45');
INSERT INTO `sys_oper_log` VALUES (412, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 12:15:45');
INSERT INTO `sys_oper_log` VALUES (413, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:04');
INSERT INTO `sys_oper_log` VALUES (414, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:05');
INSERT INTO `sys_oper_log` VALUES (415, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:05');
INSERT INTO `sys_oper_log` VALUES (416, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:05');
INSERT INTO `sys_oper_log` VALUES (417, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:09');
INSERT INTO `sys_oper_log` VALUES (418, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:09');
INSERT INTO `sys_oper_log` VALUES (419, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:17');
INSERT INTO `sys_oper_log` VALUES (420, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:17');
INSERT INTO `sys_oper_log` VALUES (421, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:19');
INSERT INTO `sys_oper_log` VALUES (422, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:19');
INSERT INTO `sys_oper_log` VALUES (423, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:35');
INSERT INTO `sys_oper_log` VALUES (424, '岗位管理', 0, '/system/auth/postList', 'GET', 1, 'demo', '财务部门', '/system/auth/postList?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:35');
INSERT INTO `sys_oper_log` VALUES (425, '部门管理', 0, '/system/auth/deptList', 'GET', 1, 'demo', '财务部门', '/system/auth/deptList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:39');
INSERT INTO `sys_oper_log` VALUES (426, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 14:12:39');
INSERT INTO `sys_oper_log` VALUES (427, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:38');
INSERT INTO `sys_oper_log` VALUES (428, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:38');
INSERT INTO `sys_oper_log` VALUES (429, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:42');
INSERT INTO `sys_oper_log` VALUES (430, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:42');
INSERT INTO `sys_oper_log` VALUES (431, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:46');
INSERT INTO `sys_oper_log` VALUES (432, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_group&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_group\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:46');
INSERT INTO `sys_oper_log` VALUES (433, '', 0, '/system/monitor/job/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/job/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:46');
INSERT INTO `sys_oper_log` VALUES (434, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_policy&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_policy\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:46');
INSERT INTO `sys_oper_log` VALUES (435, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=admin_login_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"admin_login_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:48');
INSERT INTO `sys_oper_log` VALUES (436, '', 0, '/system/monitor/loginLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/loginLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:48');
INSERT INTO `sys_oper_log` VALUES (437, '开启任务', 0, '/system/monitor/job/start', 'PUT', 1, 'demo', '财务部门', '/system/monitor/job/start?id=1', '[::1]', '内网IP', '{\"id\":\"1\"}', '{\"code\":-1,\"msg\":\"演示系统禁止操作\"}', 0, '', '2021-07-20 16:18:51');
INSERT INTO `sys_oper_log` VALUES (438, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:18:55');
INSERT INTO `sys_oper_log` VALUES (439, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:19:04');
INSERT INTO `sys_oper_log` VALUES (440, '清空', 0, '/system/monitor/loginLog/clear', 'DELETE', 1, 'demo', '财务部门', '/system/monitor/loginLog/clear', '[::1]', '内网IP', '{}', '{\"code\":-1,\"msg\":\"演示系统禁止操作\"}', 0, '', '2021-07-20 16:19:11');
INSERT INTO `sys_oper_log` VALUES (441, '', 0, '/system/monitor/operLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/operLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:19:15');
INSERT INTO `sys_oper_log` VALUES (442, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_oper_log_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_oper_log_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:19:15');
INSERT INTO `sys_oper_log` VALUES (443, '删除', 0, '/system/monitor/operLog/delete', 'DELETE', 1, 'demo', '财务部门', '/system/monitor/operLog/delete', '[::1]', '内网IP', '{\"ids\":[440,439,438,437,436,435,434,433,432,431]}', '{\"code\":-1,\"msg\":\"演示系统禁止操作\"}', 0, '', '2021-07-20 16:19:19');
INSERT INTO `sys_oper_log` VALUES (444, '', 0, '/system/monitor/operLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/operLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:19:21');
INSERT INTO `sys_oper_log` VALUES (445, '', 0, '/system/monitor/operLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/operLog/list?pageNum=1&pageSize=10&status=0&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"0\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:19:41');
INSERT INTO `sys_oper_log` VALUES (446, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:20:11');
INSERT INTO `sys_oper_log` VALUES (447, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:20:11');
INSERT INTO `sys_oper_log` VALUES (448, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:20:12');
INSERT INTO `sys_oper_log` VALUES (449, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 16:20:12');
INSERT INTO `sys_oper_log` VALUES (450, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 17:02:34');
INSERT INTO `sys_oper_log` VALUES (451, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 17:02:34');
INSERT INTO `sys_oper_log` VALUES (452, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 17:02:35');
INSERT INTO `sys_oper_log` VALUES (453, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-07-20 17:02:35');
INSERT INTO `sys_oper_log` VALUES (454, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:03');
INSERT INTO `sys_oper_log` VALUES (455, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:03');
INSERT INTO `sys_oper_log` VALUES (456, '在线用户', 0, '/system/monitor/online/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/online/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:09');
INSERT INTO `sys_oper_log` VALUES (457, '', 0, '/system/monitor/job/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/job/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:11');
INSERT INTO `sys_oper_log` VALUES (458, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:11');
INSERT INTO `sys_oper_log` VALUES (459, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_group&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_group\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:11');
INSERT INTO `sys_oper_log` VALUES (460, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_policy&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_policy\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:11');
INSERT INTO `sys_oper_log` VALUES (461, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:13');
INSERT INTO `sys_oper_log` VALUES (462, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:18');
INSERT INTO `sys_oper_log` VALUES (463, '', 0, '/system/monitor/loginLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/loginLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:18');
INSERT INTO `sys_oper_log` VALUES (464, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=admin_login_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"admin_login_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:18');
INSERT INTO `sys_oper_log` VALUES (465, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:21');
INSERT INTO `sys_oper_log` VALUES (466, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:21');
INSERT INTO `sys_oper_log` VALUES (467, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:22');
INSERT INTO `sys_oper_log` VALUES (468, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:22');
INSERT INTO `sys_oper_log` VALUES (469, '站点设置', 0, '/system/config/sysWebSet', 'GET', 1, 'demo', '财务部门', '/system/config/sysWebSet', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 16:58:24');
INSERT INTO `sys_oper_log` VALUES (470, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:13');
INSERT INTO `sys_oper_log` VALUES (471, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:13');
INSERT INTO `sys_oper_log` VALUES (472, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:20');
INSERT INTO `sys_oper_log` VALUES (473, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:20');
INSERT INTO `sys_oper_log` VALUES (474, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:20');
INSERT INTO `sys_oper_log` VALUES (475, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:20');
INSERT INTO `sys_oper_log` VALUES (476, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:23');
INSERT INTO `sys_oper_log` VALUES (477, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:23');
INSERT INTO `sys_oper_log` VALUES (478, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_yes_no&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:27');
INSERT INTO `sys_oper_log` VALUES (479, '参数管理', 0, '/system/config/sysConfig/list', 'GET', 1, 'demo', '财务部门', '/system/config/sysConfig/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-04 21:06:27');
INSERT INTO `sys_oper_log` VALUES (480, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:34:21');
INSERT INTO `sys_oper_log` VALUES (481, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:34:21');
INSERT INTO `sys_oper_log` VALUES (482, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:35:45');
INSERT INTO `sys_oper_log` VALUES (483, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:35:45');
INSERT INTO `sys_oper_log` VALUES (484, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:35:45');
INSERT INTO `sys_oper_log` VALUES (485, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:35:45');
INSERT INTO `sys_oper_log` VALUES (486, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:35:50');
INSERT INTO `sys_oper_log` VALUES (487, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:25');
INSERT INTO `sys_oper_log` VALUES (488, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=gov_work', '[::1]', '内网IP', '{\"module\":\"gov_work\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:34');
INSERT INTO `sys_oper_log` VALUES (489, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:39');
INSERT INTO `sys_oper_log` VALUES (490, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"\",\"icon\":\"code\",\"isFrame\":\"0\",\"jumpPath\":\"system/tools/gen\",\"menuName\":\"代码生成\",\"menuType\":\"0\",\"moduleType\":\"sys_admin\",\"name\":\"system/tools/gen/tableList\",\"orderNum\":0,\"parentId\":75,\"path\":\"gen\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:54');
INSERT INTO `sys_oper_log` VALUES (491, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:54');
INSERT INTO `sys_oper_log` VALUES (492, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:59');
INSERT INTO `sys_oper_log` VALUES (493, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:59');
INSERT INTO `sys_oper_log` VALUES (494, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:59');
INSERT INTO `sys_oper_log` VALUES (495, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:59');
INSERT INTO `sys_oper_log` VALUES (496, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:59');
INSERT INTO `sys_oper_log` VALUES (497, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:36:59');
INSERT INTO `sys_oper_log` VALUES (498, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=186', '[::1]', '内网IP', '{\"menuId\":\"186\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:37:10');
INSERT INTO `sys_oper_log` VALUES (499, '修改菜单', 0, '/system/auth/editMenu', 'PUT', 1, 'demo', '财务部门', '/system/auth/editMenu', '[::1]', '内网IP', '{\"component\":\"system/tools/gen/tableList\",\"icon\":\"code\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuId\":186,\"menuName\":\"代码生成\",\"menuType\":\"1\",\"moduleType\":\"sys_admin\",\"name\":\"system/tools/gen/tableList\",\"orderNum\":0,\"parentId\":75,\"path\":\"gen\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:37:19');
INSERT INTO `sys_oper_log` VALUES (500, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:37:19');
INSERT INTO `sys_oper_log` VALUES (501, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=186', '[::1]', '内网IP', '{\"menuId\":\"186\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:37:21');
INSERT INTO `sys_oper_log` VALUES (502, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:45:36');
INSERT INTO `sys_oper_log` VALUES (503, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:45:36');
INSERT INTO `sys_oper_log` VALUES (504, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:45:36');
INSERT INTO `sys_oper_log` VALUES (505, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:45:36');
INSERT INTO `sys_oper_log` VALUES (506, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:45:36');
INSERT INTO `sys_oper_log` VALUES (507, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:45:36');
INSERT INTO `sys_oper_log` VALUES (508, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:51:31');
INSERT INTO `sys_oper_log` VALUES (509, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:51:31');
INSERT INTO `sys_oper_log` VALUES (510, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:51:31');
INSERT INTO `sys_oper_log` VALUES (511, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:51:31');
INSERT INTO `sys_oper_log` VALUES (512, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:51:31');
INSERT INTO `sys_oper_log` VALUES (513, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:51:31');
INSERT INTO `sys_oper_log` VALUES (514, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:52:47');
INSERT INTO `sys_oper_log` VALUES (515, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:52:48');
INSERT INTO `sys_oper_log` VALUES (516, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:52:48');
INSERT INTO `sys_oper_log` VALUES (517, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:52:48');
INSERT INTO `sys_oper_log` VALUES (518, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:52:48');
INSERT INTO `sys_oper_log` VALUES (519, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 10:52:48');
INSERT INTO `sys_oper_log` VALUES (520, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:06:32');
INSERT INTO `sys_oper_log` VALUES (521, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:06:32');
INSERT INTO `sys_oper_log` VALUES (522, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:06:32');
INSERT INTO `sys_oper_log` VALUES (523, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:06:32');
INSERT INTO `sys_oper_log` VALUES (524, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:06:32');
INSERT INTO `sys_oper_log` VALUES (525, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:06:32');
INSERT INTO `sys_oper_log` VALUES (526, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:07:05');
INSERT INTO `sys_oper_log` VALUES (527, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:07:05');
INSERT INTO `sys_oper_log` VALUES (528, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:07:05');
INSERT INTO `sys_oper_log` VALUES (529, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:07:05');
INSERT INTO `sys_oper_log` VALUES (530, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:07:05');
INSERT INTO `sys_oper_log` VALUES (531, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:07:05');
INSERT INTO `sys_oper_log` VALUES (532, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:21');
INSERT INTO `sys_oper_log` VALUES (533, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:21');
INSERT INTO `sys_oper_log` VALUES (534, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:22');
INSERT INTO `sys_oper_log` VALUES (535, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:22');
INSERT INTO `sys_oper_log` VALUES (536, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:22');
INSERT INTO `sys_oper_log` VALUES (537, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:22');
INSERT INTO `sys_oper_log` VALUES (538, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:30');
INSERT INTO `sys_oper_log` VALUES (539, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:30');
INSERT INTO `sys_oper_log` VALUES (540, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:30');
INSERT INTO `sys_oper_log` VALUES (541, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:30');
INSERT INTO `sys_oper_log` VALUES (542, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=186', '[::1]', '内网IP', '{\"menuId\":\"186\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:47:33');
INSERT INTO `sys_oper_log` VALUES (543, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=186', '[::1]', '内网IP', '{\"menuId\":\"186\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 11:48:06');
INSERT INTO `sys_oper_log` VALUES (544, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:01:28');
INSERT INTO `sys_oper_log` VALUES (545, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:01:28');
INSERT INTO `sys_oper_log` VALUES (546, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:01:28');
INSERT INTO `sys_oper_log` VALUES (547, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:01:28');
INSERT INTO `sys_oper_log` VALUES (548, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:01:28');
INSERT INTO `sys_oper_log` VALUES (549, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:01:28');
INSERT INTO `sys_oper_log` VALUES (550, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:02:29');
INSERT INTO `sys_oper_log` VALUES (551, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:02:29');
INSERT INTO `sys_oper_log` VALUES (552, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:03:28');
INSERT INTO `sys_oper_log` VALUES (553, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:03:28');
INSERT INTO `sys_oper_log` VALUES (554, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:28');
INSERT INTO `sys_oper_log` VALUES (555, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:28');
INSERT INTO `sys_oper_log` VALUES (556, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:37');
INSERT INTO `sys_oper_log` VALUES (557, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:37');
INSERT INTO `sys_oper_log` VALUES (558, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:37');
INSERT INTO `sys_oper_log` VALUES (559, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:37');
INSERT INTO `sys_oper_log` VALUES (560, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=186', '[::1]', '内网IP', '{\"menuId\":\"186\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:40');
INSERT INTO `sys_oper_log` VALUES (561, '修改菜单', 0, '/system/auth/editMenu', 'PUT', 1, 'demo', '财务部门', '/system/auth/editMenu', '[::1]', '内网IP', '{\"component\":\"system/tools/gen/tableList\",\"icon\":\"code\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuId\":186,\"menuName\":\"代码生成\",\"menuType\":\"1\",\"moduleType\":\"sys_admin\",\"name\":\"system/tools/gen/tableList\",\"orderNum\":0,\"parentId\":75,\"path\":\"gen\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:47');
INSERT INTO `sys_oper_log` VALUES (562, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:47');
INSERT INTO `sys_oper_log` VALUES (563, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:49');
INSERT INTO `sys_oper_log` VALUES (564, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:49');
INSERT INTO `sys_oper_log` VALUES (565, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:49');
INSERT INTO `sys_oper_log` VALUES (566, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:49');
INSERT INTO `sys_oper_log` VALUES (567, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:49');
INSERT INTO `sys_oper_log` VALUES (568, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:11:49');
INSERT INTO `sys_oper_log` VALUES (569, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=186', '[::1]', '内网IP', '{\"menuId\":\"186\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:25');
INSERT INTO `sys_oper_log` VALUES (570, '修改菜单', 0, '/system/auth/editMenu', 'PUT', 1, 'demo', '财务部门', '/system/auth/editMenu', '[::1]', '内网IP', '{\"component\":\"system/tools/gen\",\"icon\":\"code\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuId\":186,\"menuName\":\"代码生成\",\"menuType\":\"1\",\"moduleType\":\"sys_admin\",\"name\":\"system/tools/gen/tableList\",\"orderNum\":0,\"parentId\":75,\"path\":\"gen\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:49');
INSERT INTO `sys_oper_log` VALUES (571, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:49');
INSERT INTO `sys_oper_log` VALUES (572, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:51');
INSERT INTO `sys_oper_log` VALUES (573, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:51');
INSERT INTO `sys_oper_log` VALUES (574, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:52');
INSERT INTO `sys_oper_log` VALUES (575, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:52');
INSERT INTO `sys_oper_log` VALUES (576, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:52');
INSERT INTO `sys_oper_log` VALUES (577, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:52');
INSERT INTO `sys_oper_log` VALUES (578, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:12:55');
INSERT INTO `sys_oper_log` VALUES (579, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=79', '[::1]', '内网IP', '{\"tableId\":\"79\"}', '{\"code\":-1,\"msg\":\"template file \\\"go/dao.template\\\" not found\"}', 0, '', '2021-08-16 12:12:56');
INSERT INTO `sys_oper_log` VALUES (580, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=78', '[::1]', '内网IP', '{\"tableId\":\"78\"}', '{\"code\":-1,\"msg\":\"template file \\\"go/dao.template\\\" not found\"}', 0, '', '2021-08-16 12:12:59');
INSERT INTO `sys_oper_log` VALUES (581, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=79', '[::1]', '内网IP', '{\"tableId\":\"79\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:13:32');
INSERT INTO `sys_oper_log` VALUES (582, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:13:33');
INSERT INTO `sys_oper_log` VALUES (583, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:13:33');
INSERT INTO `sys_oper_log` VALUES (584, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:13:34');
INSERT INTO `sys_oper_log` VALUES (585, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=77', '[::1]', '内网IP', '{\"tableId\":\"77\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:13:36');
INSERT INTO `sys_oper_log` VALUES (586, '', 0, '/system/tools/gen/delete', 'DELETE', 1, 'demo', '财务部门', '/system/tools/gen/delete', '[::1]', '内网IP', '{\"ids\":79}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:04');
INSERT INTO `sys_oper_log` VALUES (587, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:04');
INSERT INTO `sys_oper_log` VALUES (588, '', 0, '/system/tools/gen/delete', 'DELETE', 1, 'demo', '财务部门', '/system/tools/gen/delete', '[::1]', '内网IP', '{\"ids\":[78,77,73]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:16');
INSERT INTO `sys_oper_log` VALUES (589, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:16');
INSERT INTO `sys_oper_log` VALUES (590, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=74', '[::1]', '内网IP', '{\"tableId\":\"74\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:23');
INSERT INTO `sys_oper_log` VALUES (591, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:23');
INSERT INTO `sys_oper_log` VALUES (592, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:23');
INSERT INTO `sys_oper_log` VALUES (593, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:14:29');
INSERT INTO `sys_oper_log` VALUES (594, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:15:48');
INSERT INTO `sys_oper_log` VALUES (595, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:15:48');
INSERT INTO `sys_oper_log` VALUES (596, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:15:48');
INSERT INTO `sys_oper_log` VALUES (597, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 12:15:53');
INSERT INTO `sys_oper_log` VALUES (598, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:23:47');
INSERT INTO `sys_oper_log` VALUES (599, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:23:47');
INSERT INTO `sys_oper_log` VALUES (600, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:23:48');
INSERT INTO `sys_oper_log` VALUES (601, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=74', '[::1]', '内网IP', '{\"tableId\":\"74\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:23:59');
INSERT INTO `sys_oper_log` VALUES (602, '', 0, '/system/tools/gen/batchGenCode', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/batchGenCode', '[::1]', '内网IP', '{\"ids\":74}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:25:16');
INSERT INTO `sys_oper_log` VALUES (603, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:25:20');
INSERT INTO `sys_oper_log` VALUES (604, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:25:20');
INSERT INTO `sys_oper_log` VALUES (605, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:25:20');
INSERT INTO `sys_oper_log` VALUES (606, '特殊字段测试列表', 0, '/demo/demoGenOther/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:25:58');
INSERT INTO `sys_oper_log` VALUES (607, '', 0, '/system/upload/upImg', 'POST', 1, 'demo', '财务部门', '/system/upload/upImg', '[::1]', '内网IP', '{\"token\":\"oqvgpXlo+yd79rXmKL2otwfhEkHseCvwM5m6FA4zk6QJqJq2IWi6ZsRlgU3j9+ZrXU5HcYR3La2Lg4N4u0+lv6FpR16OPUrJWp5OJfqU/KNMpEt7ePz0852uBPF9clAMsnFep52ZX9LgzyeRp/h+jw==\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:26:18');
INSERT INTO `sys_oper_log` VALUES (608, '', 0, '/system/upload/upImg', 'POST', 1, 'demo', '财务部门', '/system/upload/upImg', '[::1]', '内网IP', '{\"token\":\"oqvgpXlo+yd79rXmKL2otwfhEkHseCvwM5m6FA4zk6QJqJq2IWi6ZsRlgU3j9+ZrXU5HcYR3La2Lg4N4u0+lv6FpR16OPUrJWp5OJfqU/KNMpEt7ePz0852uBPF9clAMsnFep52ZX9LgzyeRp/h+jw==\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:26:21');
INSERT INTO `sys_oper_log` VALUES (609, '', 0, '/system/upload/upImg', 'POST', 1, 'demo', '财务部门', '/system/upload/upImg', '[::1]', '内网IP', '{\"token\":\"oqvgpXlo+yd79rXmKL2otwfhEkHseCvwM5m6FA4zk6QJqJq2IWi6ZsRlgU3j9+ZrXU5HcYR3La2Lg4N4u0+lv6FpR16OPUrJWp5OJfqU/KNMpEt7ePz0852uBPF9clAMsnFep52ZX9LgzyeRp/h+jw==\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:26:25');
INSERT INTO `sys_oper_log` VALUES (610, '', 0, '/system/upload/upFile', 'POST', 1, 'demo', '财务部门', '/system/upload/upFile', '[::1]', '内网IP', '{\"token\":\"oqvgpXlo+yd79rXmKL2otwfhEkHseCvwM5m6FA4zk6QJqJq2IWi6ZsRlgU3j9+ZrXU5HcYR3La2Lg4N4u0+lv6FpR16OPUrJWp5OJfqU/KNMpEt7ePz0852uBPF9clAMsnFep52ZX9LgzyeRp/h+jw==\"}', '{\"code\":0,\"msg\":\"上传成功\"}', 1, '', '2021-08-16 14:30:59');
INSERT INTO `sys_oper_log` VALUES (611, '', 0, '/system/upload/upFile', 'POST', 1, 'demo', '财务部门', '/system/upload/upFile', '[::1]', '内网IP', '{\"token\":\"oqvgpXlo+yd79rXmKL2otwfhEkHseCvwM5m6FA4zk6QJqJq2IWi6ZsRlgU3j9+ZrXU5HcYR3La2Lg4N4u0+lv6FpR16OPUrJWp5OJfqU/KNMpEt7ePz0852uBPF9clAMsnFep52ZX9LgzyeRp/h+jw==\"}', '{\"code\":0,\"msg\":\"上传成功\"}', 1, '', '2021-08-16 14:31:08');
INSERT INTO `sys_oper_log` VALUES (612, '', 0, '/system/upload/upFile', 'POST', 1, 'demo', '财务部门', '/system/upload/upFile', '[::1]', '内网IP', '{\"token\":\"oqvgpXlo+yd79rXmKL2otwfhEkHseCvwM5m6FA4zk6QJqJq2IWi6ZsRlgU3j9+ZrXU5HcYR3La2Lg4N4u0+lv6FpR16OPUrJWp5OJfqU/KNMpEt7ePz0852uBPF9clAMsnFep52ZX9LgzyeRp/h+jw==\"}', '{\"code\":0,\"msg\":\"上传成功\"}', 1, '', '2021-08-16 14:31:12');
INSERT INTO `sys_oper_log` VALUES (613, '特殊字段测试添加', 0, '/demo/demoGenOther/add', 'POST', 1, 'demo', '财务部门', '/demo/demoGenOther/add', '[::1]', '内网IP', '{\"file\":[{\"name\":\"5b0fac3e20268.jpg\",\"status\":\"success\",\"uid\":1629095459164,\"url\":\"http://localhost:8200/pub_upload/2021-08-16/cdkq567622r4fs9kwp.jpg\"}],\"files\":[{\"name\":\"5b5589ebf0af8.png\",\"status\":\"success\",\"uid\":1629095472867,\"url\":\"http://localhost:8200/pub_upload/2021-08-16/cdkq5ajn99lsgoqyp3.png\"},{\"name\":\"5b5fd982ce018.jpg\",\"status\":\"success\",\"uid\":1629095472868,\"url\":\"http://localhost:8200/pub_upload/2021-08-16/cdkq5chxhzcshfvksd.jpg\"}],\"img\":\"pub_upload/2021-08-16/cdkq1l8l5ej0v0wkui.jpg\",\"imgs\":[{\"name\":\"6ef43e00e7afa99e991b823f5c94a2fc.jpg\",\"status\":\"success\",\"uid\":1629095185917,\"url\":\"http://localhost:8200/pub_upload/2021-08-16/cdkq1mjoyhyszannhv.jpg\"},{\"name\":\"111.jpg\",\"status\":\"success\",\"uid\":1629095185918,\"url\":\"http://localhost:8200/pub_upload/2021-08-16/cdkq1oo5um44haajd3.jpg\"}],\"info\":\"\\u003cp\\u003e夸奖哈开始阶段和卡就是好的卡还是的啊时刻监督和\\u003c/p\\u003e\\n\\n\\u003cp\\u003e啊开始阶段和咯技术的和按课时计划的\\u003c/p\\u003e\\n\",\"remark\":\"6666666666666666\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:31:20');
INSERT INTO `sys_oper_log` VALUES (614, '特殊字段测试列表', 0, '/demo/demoGenOther/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:31:20');
INSERT INTO `sys_oper_log` VALUES (615, '特殊字段测试列表', 0, '/demo/demoGenOther/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:38:47');
INSERT INTO `sys_oper_log` VALUES (616, '特殊字段测试查询', 0, '/demo/demoGenOther/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/get?id=9', '[::1]', '内网IP', '{\"id\":\"9\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:38:49');
INSERT INTO `sys_oper_log` VALUES (617, '特殊字段测试查询', 0, '/demo/demoGenOther/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/get?id=9', '[::1]', '内网IP', '{\"id\":\"9\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:39:38');
INSERT INTO `sys_oper_log` VALUES (618, '特殊字段测试查询', 0, '/demo/demoGenOther/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/get?id=9', '[::1]', '内网IP', '{\"id\":\"9\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:39:44');
INSERT INTO `sys_oper_log` VALUES (619, '特殊字段测试查询', 0, '/demo/demoGenOther/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/get?id=8', '[::1]', '内网IP', '{\"id\":\"8\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:39:47');
INSERT INTO `sys_oper_log` VALUES (620, '特殊字段测试查询', 0, '/demo/demoGenOther/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGenOther/get?id=7', '[::1]', '内网IP', '{\"id\":\"7\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:39:50');
INSERT INTO `sys_oper_log` VALUES (621, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:22');
INSERT INTO `sys_oper_log` VALUES (622, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=65', '[::1]', '内网IP', '{\"tableId\":\"65\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:22');
INSERT INTO `sys_oper_log` VALUES (623, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:22');
INSERT INTO `sys_oper_log` VALUES (624, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:26');
INSERT INTO `sys_oper_log` VALUES (625, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:30');
INSERT INTO `sys_oper_log` VALUES (626, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:30');
INSERT INTO `sys_oper_log` VALUES (627, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:30');
INSERT INTO `sys_oper_log` VALUES (628, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:39');
INSERT INTO `sys_oper_log` VALUES (629, '', 0, '/system/tools/gen/batchGenCode', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/batchGenCode', '[::1]', '内网IP', '{\"ids\":[65,69]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:46');
INSERT INTO `sys_oper_log` VALUES (630, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:50');
INSERT INTO `sys_oper_log` VALUES (631, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:50');
INSERT INTO `sys_oper_log` VALUES (632, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:50');
INSERT INTO `sys_oper_log` VALUES (633, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:57');
INSERT INTO `sys_oper_log` VALUES (634, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:57');
INSERT INTO `sys_oper_log` VALUES (635, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:40:57');
INSERT INTO `sys_oper_log` VALUES (636, '', 0, '/system/tools/gen/batchGenCode', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/batchGenCode', '[::1]', '内网IP', '{\"ids\":[65,69]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:41:28');
INSERT INTO `sys_oper_log` VALUES (637, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:41:34');
INSERT INTO `sys_oper_log` VALUES (638, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:41:34');
INSERT INTO `sys_oper_log` VALUES (639, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:41:35');
INSERT INTO `sys_oper_log` VALUES (640, '代码生成关联测试列表', 0, '/system/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/system/demoGenClass/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:41:58');
INSERT INTO `sys_oper_log` VALUES (641, '代码生成关联测试列表', 0, '/system/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/system/demoGenClass/list?pageSize=10000', '[::1]', '内网IP', '{\"pageSize\":\"10000\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:02');
INSERT INTO `sys_oper_log` VALUES (642, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:02');
INSERT INTO `sys_oper_log` VALUES (643, '代码生成测试列表', 0, '/system/demoGen/list', 'GET', 1, 'demo', '财务部门', '/system/demoGen/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:02');
INSERT INTO `sys_oper_log` VALUES (644, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:02');
INSERT INTO `sys_oper_log` VALUES (645, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=cms_news_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"cms_news_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:02');
INSERT INTO `sys_oper_log` VALUES (646, '代码生成测试查询', 0, '/system/demoGen/get', 'GET', 1, 'demo', '财务部门', '/system/demoGen/get?id=2', '[::1]', '内网IP', '{\"id\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:04');
INSERT INTO `sys_oper_log` VALUES (647, '代码生成测试修改', 0, '/system/demoGen/edit', 'PUT', 1, 'demo', '财务部门', '/system/demoGen/edit', '[::1]', '内网IP', '{\"classes\":\"2\",\"createdAt\":\"2021-08-03 18:23:01\",\"createdBy\":31,\"deletedAt\":null,\"demoAge\":56,\"demoBorn\":\"2021-08-03 00:00:00\",\"demoCate\":[\"1\",\"0\"],\"demoGender\":\"1\",\"demoName\":\"李四\",\"demoStatus\":\"0\",\"id\":2,\"updatedAt\":\"2021-08-04 09:53:53\",\"updatedBy\":31}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:12');
INSERT INTO `sys_oper_log` VALUES (648, '代码生成测试列表', 0, '/system/demoGen/list', 'GET', 1, 'demo', '财务部门', '/system/demoGen/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:12');
INSERT INTO `sys_oper_log` VALUES (649, '代码生成测试状态修改', 0, '/system/demoGen/changeDemoStatus', 'PUT', 1, 'demo', '财务部门', '/system/demoGen/changeDemoStatus', '[::1]', '内网IP', '{\"demoStatus\":1,\"id\":2}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 14:42:15');
INSERT INTO `sys_oper_log` VALUES (650, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:05');
INSERT INTO `sys_oper_log` VALUES (651, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:05');
INSERT INTO `sys_oper_log` VALUES (652, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:05');
INSERT INTO `sys_oper_log` VALUES (653, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:05');
INSERT INTO `sys_oper_log` VALUES (654, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[187]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:11');
INSERT INTO `sys_oper_log` VALUES (655, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:11');
INSERT INTO `sys_oper_log` VALUES (656, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[193]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:13');
INSERT INTO `sys_oper_log` VALUES (657, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:13');
INSERT INTO `sys_oper_log` VALUES (658, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[199]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:15');
INSERT INTO `sys_oper_log` VALUES (659, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:15');
INSERT INTO `sys_oper_log` VALUES (660, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:18');
INSERT INTO `sys_oper_log` VALUES (661, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:18');
INSERT INTO `sys_oper_log` VALUES (662, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:18');
INSERT INTO `sys_oper_log` VALUES (663, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:18');
INSERT INTO `sys_oper_log` VALUES (664, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:18');
INSERT INTO `sys_oper_log` VALUES (665, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:18');
INSERT INTO `sys_oper_log` VALUES (666, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:45');
INSERT INTO `sys_oper_log` VALUES (667, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:01:49');
INSERT INTO `sys_oper_log` VALUES (668, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:06:20');
INSERT INTO `sys_oper_log` VALUES (669, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:06:26');
INSERT INTO `sys_oper_log` VALUES (670, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:07:37');
INSERT INTO `sys_oper_log` VALUES (671, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:07:38');
INSERT INTO `sys_oper_log` VALUES (672, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:08:36');
INSERT INTO `sys_oper_log` VALUES (673, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:08:38');
INSERT INTO `sys_oper_log` VALUES (674, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":-1,\"msg\":\"template: D:\\\\goProject\\\\p2020\\\\gfast_open\\\\template\\\\vm\\\\vue\\\\tree-vue.template:600: unexpected EOF\"}', 0, '', '2021-08-16 15:10:16');
INSERT INTO `sys_oper_log` VALUES (675, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:10:29');
INSERT INTO `sys_oper_log` VALUES (676, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:10:48');
INSERT INTO `sys_oper_log` VALUES (677, '', 0, '/system/monitor/job/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/job/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:11:26');
INSERT INTO `sys_oper_log` VALUES (678, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_policy&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_policy\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:11:26');
INSERT INTO `sys_oper_log` VALUES (679, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:11:26');
INSERT INTO `sys_oper_log` VALUES (680, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_job_group&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_group\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:11:26');
INSERT INTO `sys_oper_log` VALUES (681, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:16:01');
INSERT INTO `sys_oper_log` VALUES (682, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:16:03');
INSERT INTO `sys_oper_log` VALUES (683, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:17:11');
INSERT INTO `sys_oper_log` VALUES (684, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:17:13');
INSERT INTO `sys_oper_log` VALUES (685, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:17:14');
INSERT INTO `sys_oper_log` VALUES (686, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:01');
INSERT INTO `sys_oper_log` VALUES (687, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=65', '[::1]', '内网IP', '{\"tableId\":\"65\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:01');
INSERT INTO `sys_oper_log` VALUES (688, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:01');
INSERT INTO `sys_oper_log` VALUES (689, '', 0, '/system/tools/gen/editSave', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/editSave', '[::1]', '内网IP', '{\"businessName\":\"demo_gen_class\",\"className\":\"DemoGenClass\",\"columns\":[{\"columnComment\":\"分类id\",\"columnId\":666,\"columnName\":\"id\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"uint\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":1,\"tableId\":65},{\"columnComment\":\"分类名\",\"columnId\":667,\"columnName\":\"class_name\",\"columnType\":\"varchar(30)\",\"dictType\":\"\",\"goField\":\"ClassName\",\"goType\":\"string\",\"htmlField\":\"className\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"LIKE\",\"sort\":2,\"tableId\":65}],\"createTime\":\"2021-07-26 11:07:30\",\"functionAuthor\":\"gfast\",\"functionName\":\"代码生成关联测试\",\"moduleName\":\"demo\",\"options\":\"\",\"packageName\":\"gfast/app/demo\",\"params\":{},\"remark\":\"\",\"tableComment\":\"代码生成关联测试表\",\"tableId\":65,\"tableName\":\"demo_gen_class\",\"tplCategory\":\"crud\",\"updateTime\":\"2021-07-26 15:33:03\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:10');
INSERT INTO `sys_oper_log` VALUES (690, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:10');
INSERT INTO `sys_oper_log` VALUES (691, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:13');
INSERT INTO `sys_oper_log` VALUES (692, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:13');
INSERT INTO `sys_oper_log` VALUES (693, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:13');
INSERT INTO `sys_oper_log` VALUES (694, '', 0, '/system/tools/gen/editSave', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/editSave', '[::1]', '内网IP', '{\"businessName\":\"demo_gen_tree\",\"className\":\"DemoGenTree\",\"columns\":[{\"columnComment\":\"ID\",\"columnId\":693,\"columnName\":\"id\",\"columnType\":\"int(11) unsigned\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"uint\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":1,\"tableId\":68},{\"columnComment\":\"父级ID\",\"columnId\":694,\"columnName\":\"parent_id\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"ParentId\",\"goType\":\"uint\",\"htmlField\":\"parentId\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":2,\"tableId\":68},{\"columnComment\":\"姓名\",\"columnId\":695,\"columnName\":\"demo_name\",\"columnType\":\"varchar(20)\",\"dictType\":\"\",\"goField\":\"DemoName\",\"goType\":\"string\",\"htmlField\":\"demoName\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"LIKE\",\"sort\":3,\"tableId\":68},{\"columnComment\":\"年龄\",\"columnId\":696,\"columnName\":\"demo_age\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"DemoAge\",\"goType\":\"uint\",\"htmlField\":\"demoAge\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":4,\"tableId\":68},{\"columnComment\":\"班级\",\"columnId\":697,\"columnName\":\"classes\",\"columnType\":\"varchar(30)\",\"dictType\":\"\",\"goField\":\"Classes\",\"goType\":\"string\",\"htmlField\":\"classes\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"id\",\"linkLabelName\":\"className\",\"linkTableClass\":\"DemoGenClass\",\"linkTableName\":\"demo_gen_class\",\"linkTablePackage\":\"gfast/app/system\",\"queryType\":\"EQ\",\"sort\":5,\"tableId\":68},{\"columnComment\":\"出生年月\",\"columnId\":698,\"columnName\":\"demo_born\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"DemoBorn\",\"goType\":\"Time\",\"htmlField\":\"demoBorn\",\"htmlType\":\"datetime\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":6,\"tableId\":68},{\"columnComment\":\"性别\",\"columnId\":699,\"columnName\":\"demo_gender\",\"columnType\":\"tinyint(3) unsigned\",\"dictType\":\"sys_user_sex\",\"goField\":\"DemoGender\",\"goType\":\"uint\",\"htmlField\":\"demoGender\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":7,\"tableId\":68},{\"columnComment\":\"创建日期\",\"columnId\":700,\"columnName\":\"created_at\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"CreatedAt\",\"goType\":\"Time\",\"htmlField\":\"createdAt\",\"htmlType\":\"datetime\",\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":8,\"tableId\":68},{\"columnComment\":\"状态\",\"columnId\":705,\"columnName\":\"demo_status\",\"columnType\":\"tinyint(4)\",\"dictType\":\"sys_normal_disable\",\"goField\":\"DemoStatus\",\"goType\":\"int\",\"htmlField\":\"demoStatus\",\"htmlType\":\"radio\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":13,\"tableId\":68},{\"columnComment\":\"分类\",\"columnId\":706,\"columnName\":\"demo_cate\",\"columnType\":\"varchar(30)\",\"dictType\":\"cms_news_type\",\"goField\":\"DemoCate\",\"goType\":\"string\",\"htmlField\":\"demoCate\",\"htmlType\":\"checkbox\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":14,\"tableId\":68}],\"createTime\":\"2021-08-02 11:55:43\",\"functionAuthor\":\"gfast\",\"functionName\":\"代码生成树形结构测试\",\"moduleName\":\"demo\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"treeName\\\":\\\"demoName\\\",\\\"treeParentCode\\\":\\\"parentId\\\"}\",\"packageName\":\"gfast/app/demo\",\"params\":{\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\"},\"remark\":\"\",\"tableComment\":\"代码生成树形结构测试表\",\"tableId\":68,\"tableName\":\"demo_gen_tree\",\"tplCategory\":\"tree\",\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\",\"updateTime\":\"2021-08-04 11:19:31\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:18');
INSERT INTO `sys_oper_log` VALUES (695, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:18');
INSERT INTO `sys_oper_log` VALUES (696, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:23');
INSERT INTO `sys_oper_log` VALUES (697, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:23');
INSERT INTO `sys_oper_log` VALUES (698, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:23');
INSERT INTO `sys_oper_log` VALUES (699, '', 0, '/system/tools/gen/editSave', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/editSave', '[::1]', '内网IP', '{\"businessName\":\"demo_gen\",\"className\":\"DemoGen\",\"columns\":[{\"columnComment\":\"\",\"columnId\":707,\"columnName\":\"id\",\"columnType\":\"int(11) unsigned\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"uint\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":1,\"tableId\":69},{\"columnComment\":\"姓名\",\"columnId\":708,\"columnName\":\"demo_name\",\"columnType\":\"varchar(20)\",\"dictType\":\"\",\"goField\":\"DemoName\",\"goType\":\"string\",\"htmlField\":\"demoName\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"LIKE\",\"sort\":2,\"tableId\":69},{\"columnComment\":\"年龄\",\"columnId\":709,\"columnName\":\"demo_age\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"DemoAge\",\"goType\":\"uint\",\"htmlField\":\"demoAge\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":3,\"tableId\":69},{\"columnComment\":\"班级\",\"columnId\":710,\"columnName\":\"classes\",\"columnType\":\"varchar(30)\",\"dictType\":\"\",\"goField\":\"Classes\",\"goType\":\"string\",\"htmlField\":\"classes\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"id\",\"linkLabelName\":\"className\",\"linkTableClass\":\"DemoGenClass\",\"linkTableName\":\"demo_gen_class\",\"linkTablePackage\":\"gfast/app/system\",\"queryType\":\"EQ\",\"sort\":4,\"tableId\":69},{\"columnComment\":\"出生年月\",\"columnId\":711,\"columnName\":\"demo_born\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"DemoBorn\",\"goType\":\"Time\",\"htmlField\":\"demoBorn\",\"htmlType\":\"datetime\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":5,\"tableId\":69},{\"columnComment\":\"性别\",\"columnId\":712,\"columnName\":\"demo_gender\",\"columnType\":\"tinyint(3) unsigned\",\"dictType\":\"sys_user_sex\",\"goField\":\"DemoGender\",\"goType\":\"uint\",\"htmlField\":\"demoGender\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":6,\"tableId\":69},{\"columnComment\":\"创建日期\",\"columnId\":713,\"columnName\":\"created_at\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"CreatedAt\",\"goType\":\"Time\",\"htmlField\":\"createdAt\",\"htmlType\":\"datetime\",\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":7,\"tableId\":69},{\"columnComment\":\"状态\",\"columnId\":718,\"columnName\":\"demo_status\",\"columnType\":\"tinyint(4)\",\"dictType\":\"sys_normal_disable\",\"goField\":\"DemoStatus\",\"goType\":\"int\",\"htmlField\":\"demoStatus\",\"htmlType\":\"radio\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":12,\"tableId\":69},{\"columnComment\":\"分类\",\"columnId\":719,\"columnName\":\"demo_cate\",\"columnType\":\"varchar(30)\",\"dictType\":\"cms_news_type\",\"goField\":\"DemoCate\",\"goType\":\"string\",\"htmlField\":\"demoCate\",\"htmlType\":\"checkbox\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":13,\"tableId\":69}],\"createTime\":\"2021-08-03 18:14:06\",\"functionAuthor\":\"gfast\",\"functionName\":\"代码生成测试\",\"moduleName\":\"demo\",\"options\":\"\",\"packageName\":\"gfast/app/demo\",\"params\":{},\"remark\":\"\",\"tableComment\":\"代码生成测试表\",\"tableId\":69,\"tableName\":\"demo_gen\",\"tplCategory\":\"crud\",\"updateTime\":\"2021-08-03 18:16:24\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:32');
INSERT INTO `sys_oper_log` VALUES (700, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:32');
INSERT INTO `sys_oper_log` VALUES (701, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:37');
INSERT INTO `sys_oper_log` VALUES (702, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=74', '[::1]', '内网IP', '{\"tableId\":\"74\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:37');
INSERT INTO `sys_oper_log` VALUES (703, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:37');
INSERT INTO `sys_oper_log` VALUES (704, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:20:41');
INSERT INTO `sys_oper_log` VALUES (705, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:23:36');
INSERT INTO `sys_oper_log` VALUES (706, '', 0, '/system/tools/gen/batchGenCode', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/batchGenCode', '[::1]', '内网IP', '{\"ids\":[65,68]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:23:54');
INSERT INTO `sys_oper_log` VALUES (707, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:23:56');
INSERT INTO `sys_oper_log` VALUES (708, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:23:56');
INSERT INTO `sys_oper_log` VALUES (709, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:23:57');
INSERT INTO `sys_oper_log` VALUES (710, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:35:26');
INSERT INTO `sys_oper_log` VALUES (711, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=65', '[::1]', '内网IP', '{\"tableId\":\"65\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:35:28');
INSERT INTO `sys_oper_log` VALUES (712, '', 0, '/system/tools/gen/batchGenCode', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/batchGenCode', '[::1]', '内网IP', '{\"ids\":68}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:35:59');
INSERT INTO `sys_oper_log` VALUES (713, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:11');
INSERT INTO `sys_oper_log` VALUES (714, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:13');
INSERT INTO `sys_oper_log` VALUES (715, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=cms_news_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"cms_news_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:13');
INSERT INTO `sys_oper_log` VALUES (716, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:13');
INSERT INTO `sys_oper_log` VALUES (717, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageSize=10000', '[::1]', '内网IP', '{\"pageSize\":\"10000\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:13');
INSERT INTO `sys_oper_log` VALUES (718, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:13');
INSERT INTO `sys_oper_log` VALUES (719, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:19');
INSERT INTO `sys_oper_log` VALUES (720, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:24');
INSERT INTO `sys_oper_log` VALUES (721, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:31');
INSERT INTO `sys_oper_log` VALUES (722, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:43');
INSERT INTO `sys_oper_log` VALUES (723, '代码生成树形结构测试查询', 0, '/demo/demoGenTree/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/get?id=2', '[::1]', '内网IP', '{\"id\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:46');
INSERT INTO `sys_oper_log` VALUES (724, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:46');
INSERT INTO `sys_oper_log` VALUES (725, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:36:57');
INSERT INTO `sys_oper_log` VALUES (726, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:09');
INSERT INTO `sys_oper_log` VALUES (727, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:09');
INSERT INTO `sys_oper_log` VALUES (728, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:09');
INSERT INTO `sys_oper_log` VALUES (729, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:20');
INSERT INTO `sys_oper_log` VALUES (730, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageSize=10000', '[::1]', '内网IP', '{\"pageSize\":\"10000\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:20');
INSERT INTO `sys_oper_log` VALUES (731, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=cms_news_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"cms_news_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:20');
INSERT INTO `sys_oper_log` VALUES (732, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:20');
INSERT INTO `sys_oper_log` VALUES (733, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:20');
INSERT INTO `sys_oper_log` VALUES (734, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:27');
INSERT INTO `sys_oper_log` VALUES (735, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:30');
INSERT INTO `sys_oper_log` VALUES (736, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:30');
INSERT INTO `sys_oper_log` VALUES (737, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:30');
INSERT INTO `sys_oper_log` VALUES (738, '', 0, '/system/tools/gen/editSave', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/editSave', '[::1]', '内网IP', '{\"businessName\":\"demo_gen_tree\",\"className\":\"DemoGenTree\",\"columns\":[{\"columnComment\":\"ID\",\"columnId\":693,\"columnName\":\"id\",\"columnType\":\"int(11) unsigned\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"uint\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":1,\"tableId\":68},{\"columnComment\":\"父级ID\",\"columnId\":694,\"columnName\":\"parent_id\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"ParentId\",\"goType\":\"uint\",\"htmlField\":\"parentId\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":2,\"tableId\":68},{\"columnComment\":\"姓名\",\"columnId\":695,\"columnName\":\"demo_name\",\"columnType\":\"varchar(20)\",\"dictType\":\"\",\"goField\":\"DemoName\",\"goType\":\"string\",\"htmlField\":\"demoName\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"LIKE\",\"sort\":3,\"tableId\":68},{\"columnComment\":\"年龄\",\"columnId\":696,\"columnName\":\"demo_age\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"DemoAge\",\"goType\":\"uint\",\"htmlField\":\"demoAge\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":4,\"tableId\":68},{\"columnComment\":\"班级\",\"columnId\":697,\"columnName\":\"classes\",\"columnType\":\"varchar(30)\",\"dictType\":\"\",\"goField\":\"Classes\",\"goType\":\"string\",\"htmlField\":\"classes\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"id\",\"linkLabelName\":\"className\",\"linkTableClass\":\"DemoGenClass\",\"linkTableName\":\"demo_gen_class\",\"linkTablePackage\":\"gfast/app/demo\",\"queryType\":\"EQ\",\"sort\":5,\"tableId\":68},{\"columnComment\":\"出生年月\",\"columnId\":698,\"columnName\":\"demo_born\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"DemoBorn\",\"goType\":\"Time\",\"htmlField\":\"demoBorn\",\"htmlType\":\"datetime\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":6,\"tableId\":68},{\"columnComment\":\"性别\",\"columnId\":699,\"columnName\":\"demo_gender\",\"columnType\":\"tinyint(3) unsigned\",\"dictType\":\"sys_user_sex\",\"goField\":\"DemoGender\",\"goType\":\"uint\",\"htmlField\":\"demoGender\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":7,\"tableId\":68},{\"columnComment\":\"创建日期\",\"columnId\":700,\"columnName\":\"created_at\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"CreatedAt\",\"goType\":\"Time\",\"htmlField\":\"createdAt\",\"htmlType\":\"datetime\",\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":8,\"tableId\":68},{\"columnComment\":\"状态\",\"columnId\":705,\"columnName\":\"demo_status\",\"columnType\":\"tinyint(4)\",\"dictType\":\"sys_normal_disable\",\"goField\":\"DemoStatus\",\"goType\":\"int\",\"htmlField\":\"demoStatus\",\"htmlType\":\"radio\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":13,\"tableId\":68},{\"columnComment\":\"分类\",\"columnId\":706,\"columnName\":\"demo_cate\",\"columnType\":\"varchar(30)\",\"dictType\":\"cms_news_type\",\"goField\":\"DemoCate\",\"goType\":\"string\",\"htmlField\":\"demoCate\",\"htmlType\":\"checkbox\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":14,\"tableId\":68}],\"createTime\":\"2021-08-02 11:55:43\",\"functionAuthor\":\"gfast\",\"functionName\":\"代码生成树形结构测试\",\"moduleName\":\"demo\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"treeName\\\":\\\"demoName\\\",\\\"treeParentCode\\\":\\\"parentId\\\"}\",\"packageName\":\"gfast/app/demo\",\"params\":{\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\"},\"remark\":\"\",\"tableComment\":\"代码生成树形结构测试表\",\"tableId\":68,\"tableName\":\"demo_gen_tree\",\"tplCategory\":\"tree\",\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\",\"updateTime\":\"2021-08-16 15:20:18\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:41');
INSERT INTO `sys_oper_log` VALUES (739, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:37:42');
INSERT INTO `sys_oper_log` VALUES (740, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:39:39');
INSERT INTO `sys_oper_log` VALUES (741, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=cms_news_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"cms_news_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:39:44');
INSERT INTO `sys_oper_log` VALUES (742, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:39:44');
INSERT INTO `sys_oper_log` VALUES (743, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:39:44');
INSERT INTO `sys_oper_log` VALUES (744, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageSize=10000', '[::1]', '内网IP', '{\"pageSize\":\"10000\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:39:44');
INSERT INTO `sys_oper_log` VALUES (745, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:39:44');
INSERT INTO `sys_oper_log` VALUES (746, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:39:45');
INSERT INTO `sys_oper_log` VALUES (747, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:40:55');
INSERT INTO `sys_oper_log` VALUES (748, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:40:55');
INSERT INTO `sys_oper_log` VALUES (749, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:00');
INSERT INTO `sys_oper_log` VALUES (750, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:00');
INSERT INTO `sys_oper_log` VALUES (751, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:04');
INSERT INTO `sys_oper_log` VALUES (752, '', 0, '/system/tools/gen/batchGenCode', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/batchGenCode', '[::1]', '内网IP', '{\"ids\":68}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:08');
INSERT INTO `sys_oper_log` VALUES (753, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:17');
INSERT INTO `sys_oper_log` VALUES (754, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:17');
INSERT INTO `sys_oper_log` VALUES (755, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:17');
INSERT INTO `sys_oper_log` VALUES (756, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:27');
INSERT INTO `sys_oper_log` VALUES (757, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:27');
INSERT INTO `sys_oper_log` VALUES (758, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:41:28');
INSERT INTO `sys_oper_log` VALUES (759, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:22');
INSERT INTO `sys_oper_log` VALUES (760, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:22');
INSERT INTO `sys_oper_log` VALUES (761, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:23');
INSERT INTO `sys_oper_log` VALUES (762, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:26');
INSERT INTO `sys_oper_log` VALUES (763, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:26');
INSERT INTO `sys_oper_log` VALUES (764, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageSize=10000', '[::1]', '内网IP', '{\"pageSize\":\"10000\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:26');
INSERT INTO `sys_oper_log` VALUES (765, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:26');
INSERT INTO `sys_oper_log` VALUES (766, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=cms_news_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"cms_news_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:26');
INSERT INTO `sys_oper_log` VALUES (767, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:28');
INSERT INTO `sys_oper_log` VALUES (768, '代码生成树形结构测试添加', 0, '/demo/demoGenTree/add', 'POST', 1, 'demo', '财务部门', '/demo/demoGenTree/add', '[::1]', '内网IP', '{\"classes\":\"1\",\"demoAge\":\"12\",\"demoBorn\":\"2021-08-09\",\"demoCate\":[\"0\"],\"demoGender\":\"2\",\"demoName\":\"璐璐\",\"demoStatus\":\"1\",\"parentId\":5}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:46');
INSERT INTO `sys_oper_log` VALUES (769, '代码生成树形结构测试列表', 0, '/demo/demoGenTree/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenTree/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:42:46');
INSERT INTO `sys_oper_log` VALUES (770, '', 0, '/system/tools/gen/batchGenCode', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/batchGenCode', '[::1]', '内网IP', '{\"ids\":69}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:10');
INSERT INTO `sys_oper_log` VALUES (771, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:13');
INSERT INTO `sys_oper_log` VALUES (772, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:13');
INSERT INTO `sys_oper_log` VALUES (773, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:13');
INSERT INTO `sys_oper_log` VALUES (774, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:16');
INSERT INTO `sys_oper_log` VALUES (775, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:16');
INSERT INTO `sys_oper_log` VALUES (776, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageSize=10000', '[::1]', '内网IP', '{\"pageSize\":\"10000\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:16');
INSERT INTO `sys_oper_log` VALUES (777, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=cms_news_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"cms_news_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:43:16');
INSERT INTO `sys_oper_log` VALUES (778, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:10');
INSERT INTO `sys_oper_log` VALUES (779, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:10');
INSERT INTO `sys_oper_log` VALUES (780, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=cms_news_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"cms_news_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:11');
INSERT INTO `sys_oper_log` VALUES (781, '代码生成关联测试列表', 0, '/demo/demoGenClass/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGenClass/list?pageSize=10000', '[::1]', '内网IP', '{\"pageSize\":\"10000\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:11');
INSERT INTO `sys_oper_log` VALUES (782, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:11');
INSERT INTO `sys_oper_log` VALUES (783, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:11');
INSERT INTO `sys_oper_log` VALUES (784, '代码生成测试列表', 0, '/demo/demoGen/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGen/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:11');
INSERT INTO `sys_oper_log` VALUES (785, '代码生成测试查询', 0, '/demo/demoGen/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGen/get?id=2', '[::1]', '内网IP', '{\"id\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:17');
INSERT INTO `sys_oper_log` VALUES (786, '代码生成测试修改', 0, '/demo/demoGen/edit', 'PUT', 1, 'demo', '财务部门', '/demo/demoGen/edit', '[::1]', '内网IP', '{\"classes\":\"2\",\"createdAt\":\"2021-08-03 18:23:01\",\"createdBy\":31,\"deletedAt\":null,\"demoAge\":56,\"demoBorn\":\"2021-08-03 00:00:00\",\"demoCate\":[\"1\",\"0\"],\"demoGender\":\"1\",\"demoName\":\"李四\",\"demoStatus\":\"1\",\"id\":2,\"updatedAt\":\"2021-08-16 14:42:15\",\"updatedBy\":31}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:19');
INSERT INTO `sys_oper_log` VALUES (787, '代码生成测试列表', 0, '/demo/demoGen/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGen/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:19');
INSERT INTO `sys_oper_log` VALUES (788, '代码生成测试查询', 0, '/demo/demoGen/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGen/get?id=2', '[::1]', '内网IP', '{\"id\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:20');
INSERT INTO `sys_oper_log` VALUES (789, '代码生成测试修改', 0, '/demo/demoGen/edit', 'PUT', 1, 'demo', '财务部门', '/demo/demoGen/edit', '[::1]', '内网IP', '{\"classes\":\"2\",\"createdAt\":\"2021-08-03 18:23:01\",\"createdBy\":31,\"deletedAt\":null,\"demoAge\":56,\"demoBorn\":\"2021-08-03 00:00:00\",\"demoCate\":[\"1\",\"0\"],\"demoGender\":\"1\",\"demoName\":\"李四222\",\"demoStatus\":\"1\",\"id\":2,\"updatedAt\":\"2021-08-16 15:45:19\",\"updatedBy\":31}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:26');
INSERT INTO `sys_oper_log` VALUES (790, '代码生成测试列表', 0, '/demo/demoGen/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGen/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:26');
INSERT INTO `sys_oper_log` VALUES (791, '代码生成测试查询', 0, '/demo/demoGen/get', 'GET', 1, 'demo', '财务部门', '/demo/demoGen/get?id=2', '[::1]', '内网IP', '{\"id\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:27');
INSERT INTO `sys_oper_log` VALUES (792, '代码生成测试修改', 0, '/demo/demoGen/edit', 'PUT', 1, 'demo', '财务部门', '/demo/demoGen/edit', '[::1]', '内网IP', '{\"classes\":\"2\",\"createdAt\":\"2021-08-03 18:23:01\",\"createdBy\":31,\"deletedAt\":null,\"demoAge\":56,\"demoBorn\":\"2021-08-03 00:00:00\",\"demoCate\":[\"1\",\"0\"],\"demoGender\":\"1\",\"demoName\":\"李四\",\"demoStatus\":\"1\",\"id\":2,\"updatedAt\":\"2021-08-16 15:45:26\",\"updatedBy\":31}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:30');
INSERT INTO `sys_oper_log` VALUES (793, '代码生成测试列表', 0, '/demo/demoGen/list', 'GET', 1, 'demo', '财务部门', '/demo/demoGen/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:45:30');
INSERT INTO `sys_oper_log` VALUES (794, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:13');
INSERT INTO `sys_oper_log` VALUES (795, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=74', '[::1]', '内网IP', '{\"tableId\":\"74\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:18');
INSERT INTO `sys_oper_log` VALUES (796, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:22');
INSERT INTO `sys_oper_log` VALUES (797, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=74', '[::1]', '内网IP', '{\"tableId\":\"74\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:22');
INSERT INTO `sys_oper_log` VALUES (798, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:22');
INSERT INTO `sys_oper_log` VALUES (799, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:31');
INSERT INTO `sys_oper_log` VALUES (800, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:38');
INSERT INTO `sys_oper_log` VALUES (801, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:38');
INSERT INTO `sys_oper_log` VALUES (802, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:38');
INSERT INTO `sys_oper_log` VALUES (803, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:48');
INSERT INTO `sys_oper_log` VALUES (804, '', 0, '/system/tools/gen/delete', 'DELETE', 1, 'demo', '财务部门', '/system/tools/gen/delete', '[::1]', '内网IP', '{\"ids\":74}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:51');
INSERT INTO `sys_oper_log` VALUES (805, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:51:51');
INSERT INTO `sys_oper_log` VALUES (806, '', 0, '/system/tools/gen/dataList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/dataList?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:52:09');
INSERT INTO `sys_oper_log` VALUES (807, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:27');
INSERT INTO `sys_oper_log` VALUES (808, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=65', '[::1]', '内网IP', '{\"tableId\":\"65\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:27');
INSERT INTO `sys_oper_log` VALUES (809, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:27');
INSERT INTO `sys_oper_log` VALUES (810, '', 0, '/system/tools/gen/editSave', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/editSave', '[::1]', '内网IP', '{\"businessName\":\"demo_gen_class\",\"className\":\"DemoGenClass\",\"columns\":[{\"columnComment\":\"分类id\",\"columnId\":666,\"columnName\":\"id\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"uint\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":1,\"tableId\":65},{\"columnComment\":\"分类名\",\"columnId\":667,\"columnName\":\"class_name\",\"columnType\":\"varchar(30)\",\"dictType\":\"\",\"goField\":\"ClassName\",\"goType\":\"string\",\"htmlField\":\"className\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"LIKE\",\"sort\":2,\"tableId\":65}],\"createTime\":\"2021-07-26 11:07:30\",\"functionAuthor\":\"gfast\",\"functionName\":\"代码生成关联测试\",\"moduleName\":\"system\",\"options\":\"\",\"packageName\":\"gfast/app/system\",\"params\":{},\"remark\":\"\",\"tableComment\":\"代码生成关联测试表\",\"tableId\":65,\"tableName\":\"demo_gen_class\",\"tplCategory\":\"crud\",\"updateTime\":\"2021-08-16 15:20:10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:39');
INSERT INTO `sys_oper_log` VALUES (811, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:39');
INSERT INTO `sys_oper_log` VALUES (812, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:42');
INSERT INTO `sys_oper_log` VALUES (813, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=68', '[::1]', '内网IP', '{\"tableId\":\"68\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:42');
INSERT INTO `sys_oper_log` VALUES (814, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:42');
INSERT INTO `sys_oper_log` VALUES (815, '', 0, '/system/tools/gen/editSave', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/editSave', '[::1]', '内网IP', '{\"businessName\":\"demo_gen_tree\",\"className\":\"DemoGenTree\",\"columns\":[{\"columnComment\":\"ID\",\"columnId\":693,\"columnName\":\"id\",\"columnType\":\"int(11) unsigned\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"uint\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":1,\"tableId\":68},{\"columnComment\":\"父级ID\",\"columnId\":694,\"columnName\":\"parent_id\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"ParentId\",\"goType\":\"uint\",\"htmlField\":\"parentId\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":2,\"tableId\":68},{\"columnComment\":\"姓名\",\"columnId\":695,\"columnName\":\"demo_name\",\"columnType\":\"varchar(20)\",\"dictType\":\"\",\"goField\":\"DemoName\",\"goType\":\"string\",\"htmlField\":\"demoName\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"LIKE\",\"sort\":3,\"tableId\":68},{\"columnComment\":\"年龄\",\"columnId\":696,\"columnName\":\"demo_age\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"DemoAge\",\"goType\":\"uint\",\"htmlField\":\"demoAge\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":4,\"tableId\":68},{\"columnComment\":\"班级\",\"columnId\":697,\"columnName\":\"classes\",\"columnType\":\"varchar(30)\",\"dictType\":\"\",\"goField\":\"Classes\",\"goType\":\"string\",\"htmlField\":\"classes\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"id\",\"linkLabelName\":\"className\",\"linkTableClass\":\"DemoGenClass\",\"linkTableName\":\"demo_gen_class\",\"linkTablePackage\":\"gfast/app/demo\",\"queryType\":\"EQ\",\"sort\":5,\"tableId\":68},{\"columnComment\":\"出生年月\",\"columnId\":698,\"columnName\":\"demo_born\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"DemoBorn\",\"goType\":\"Time\",\"htmlField\":\"demoBorn\",\"htmlType\":\"datetime\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":6,\"tableId\":68},{\"columnComment\":\"性别\",\"columnId\":699,\"columnName\":\"demo_gender\",\"columnType\":\"tinyint(3) unsigned\",\"dictType\":\"sys_user_sex\",\"goField\":\"DemoGender\",\"goType\":\"uint\",\"htmlField\":\"demoGender\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":7,\"tableId\":68},{\"columnComment\":\"创建日期\",\"columnId\":700,\"columnName\":\"created_at\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"CreatedAt\",\"goType\":\"Time\",\"htmlField\":\"createdAt\",\"htmlType\":\"datetime\",\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":8,\"tableId\":68},{\"columnComment\":\"状态\",\"columnId\":705,\"columnName\":\"demo_status\",\"columnType\":\"tinyint(4)\",\"dictType\":\"sys_normal_disable\",\"goField\":\"DemoStatus\",\"goType\":\"int\",\"htmlField\":\"demoStatus\",\"htmlType\":\"radio\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":13,\"tableId\":68},{\"columnComment\":\"分类\",\"columnId\":706,\"columnName\":\"demo_cate\",\"columnType\":\"varchar(30)\",\"dictType\":\"cms_news_type\",\"goField\":\"DemoCate\",\"goType\":\"string\",\"htmlField\":\"demoCate\",\"htmlType\":\"checkbox\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":14,\"tableId\":68}],\"createTime\":\"2021-08-02 11:55:43\",\"functionAuthor\":\"gfast\",\"functionName\":\"代码生成树形结构测试\",\"moduleName\":\"system\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"treeName\\\":\\\"demoName\\\",\\\"treeParentCode\\\":\\\"parentId\\\"}\",\"packageName\":\"gfast/app/system\",\"params\":{\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\"},\"remark\":\"\",\"tableComment\":\"代码生成树形结构测试表\",\"tableId\":68,\"tableName\":\"demo_gen_tree\",\"tplCategory\":\"tree\",\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\",\"updateTime\":\"2021-08-16 15:37:41\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:47');
INSERT INTO `sys_oper_log` VALUES (816, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:48');
INSERT INTO `sys_oper_log` VALUES (817, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:51');
INSERT INTO `sys_oper_log` VALUES (818, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:51');
INSERT INTO `sys_oper_log` VALUES (819, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:51');
INSERT INTO `sys_oper_log` VALUES (820, '', 0, '/system/tools/gen/editSave', 'PUT', 1, 'demo', '财务部门', '/system/tools/gen/editSave', '[::1]', '内网IP', '{\"businessName\":\"demo_gen\",\"className\":\"DemoGen\",\"columns\":[{\"columnComment\":\"\",\"columnId\":707,\"columnName\":\"id\",\"columnType\":\"int(11) unsigned\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"uint\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isEdit\":\"0\",\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":1,\"tableId\":69},{\"columnComment\":\"姓名\",\"columnId\":708,\"columnName\":\"demo_name\",\"columnType\":\"varchar(20)\",\"dictType\":\"\",\"goField\":\"DemoName\",\"goType\":\"string\",\"htmlField\":\"demoName\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"LIKE\",\"sort\":2,\"tableId\":69},{\"columnComment\":\"年龄\",\"columnId\":709,\"columnName\":\"demo_age\",\"columnType\":\"int(10) unsigned\",\"dictType\":\"\",\"goField\":\"DemoAge\",\"goType\":\"uint\",\"htmlField\":\"demoAge\",\"htmlType\":\"input\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":3,\"tableId\":69},{\"columnComment\":\"班级\",\"columnId\":710,\"columnName\":\"classes\",\"columnType\":\"varchar(30)\",\"dictType\":\"\",\"goField\":\"Classes\",\"goType\":\"string\",\"htmlField\":\"classes\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"id\",\"linkLabelName\":\"className\",\"linkTableClass\":\"DemoGenClass\",\"linkTableName\":\"demo_gen_class\",\"linkTablePackage\":\"gfast/app/demo\",\"queryType\":\"EQ\",\"sort\":4,\"tableId\":69},{\"columnComment\":\"出生年月\",\"columnId\":711,\"columnName\":\"demo_born\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"DemoBorn\",\"goType\":\"Time\",\"htmlField\":\"demoBorn\",\"htmlType\":\"datetime\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"\",\"isRequired\":\"\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":5,\"tableId\":69},{\"columnComment\":\"性别\",\"columnId\":712,\"columnName\":\"demo_gender\",\"columnType\":\"tinyint(3) unsigned\",\"dictType\":\"sys_user_sex\",\"goField\":\"DemoGender\",\"goType\":\"uint\",\"htmlField\":\"demoGender\",\"htmlType\":\"select\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":6,\"tableId\":69},{\"columnComment\":\"创建日期\",\"columnId\":713,\"columnName\":\"created_at\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"CreatedAt\",\"goType\":\"Time\",\"htmlField\":\"createdAt\",\"htmlType\":\"datetime\",\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":7,\"tableId\":69},{\"columnComment\":\"状态\",\"columnId\":718,\"columnName\":\"demo_status\",\"columnType\":\"tinyint(4)\",\"dictType\":\"sys_normal_disable\",\"goField\":\"DemoStatus\",\"goType\":\"int\",\"htmlField\":\"demoStatus\",\"htmlType\":\"radio\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":12,\"tableId\":69},{\"columnComment\":\"分类\",\"columnId\":719,\"columnName\":\"demo_cate\",\"columnType\":\"varchar(30)\",\"dictType\":\"cms_news_type\",\"goField\":\"DemoCate\",\"goType\":\"string\",\"htmlField\":\"demoCate\",\"htmlType\":\"checkbox\",\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableClass\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"queryType\":\"EQ\",\"sort\":13,\"tableId\":69}],\"createTime\":\"2021-08-03 18:14:06\",\"functionAuthor\":\"gfast\",\"functionName\":\"代码生成测试\",\"moduleName\":\"system\",\"options\":\"\",\"packageName\":\"gfast/app/system\",\"params\":{},\"remark\":\"\",\"tableComment\":\"代码生成测试表\",\"tableId\":69,\"tableName\":\"demo_gen\",\"tplCategory\":\"crud\",\"updateTime\":\"2021-08-16 15:20:32\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:56');
INSERT INTO `sys_oper_log` VALUES (821, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-08-16 15:53:57');
INSERT INTO `sys_oper_log` VALUES (822, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:08');
INSERT INTO `sys_oper_log` VALUES (823, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:08');
INSERT INTO `sys_oper_log` VALUES (824, '', 0, '/system/cache/clear', 'DELETE', 1, 'demo', '财务部门', '/system/cache/clear', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:10');
INSERT INTO `sys_oper_log` VALUES (825, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:20');
INSERT INTO `sys_oper_log` VALUES (826, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:20');
INSERT INTO `sys_oper_log` VALUES (827, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:23');
INSERT INTO `sys_oper_log` VALUES (828, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:23');
INSERT INTO `sys_oper_log` VALUES (829, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:24');
INSERT INTO `sys_oper_log` VALUES (830, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:24');
INSERT INTO `sys_oper_log` VALUES (831, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:39');
INSERT INTO `sys_oper_log` VALUES (832, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:39');
INSERT INTO `sys_oper_log` VALUES (833, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:39');
INSERT INTO `sys_oper_log` VALUES (834, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 14:59:39');
INSERT INTO `sys_oper_log` VALUES (835, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[206]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:21');
INSERT INTO `sys_oper_log` VALUES (836, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:21');
INSERT INTO `sys_oper_log` VALUES (837, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[212]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:24');
INSERT INTO `sys_oper_log` VALUES (838, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:24');
INSERT INTO `sys_oper_log` VALUES (839, '删除菜单', 0, '/system/auth/deleteMenu', 'DELETE', 1, 'demo', '财务部门', '/system/auth/deleteMenu', '[::1]', '内网IP', '{\"ids\":[219]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:26');
INSERT INTO `sys_oper_log` VALUES (840, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:26');
INSERT INTO `sys_oper_log` VALUES (841, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:30');
INSERT INTO `sys_oper_log` VALUES (842, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:30');
INSERT INTO `sys_oper_log` VALUES (843, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:31');
INSERT INTO `sys_oper_log` VALUES (844, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:31');
INSERT INTO `sys_oper_log` VALUES (845, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:31');
INSERT INTO `sys_oper_log` VALUES (846, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:31');
INSERT INTO `sys_oper_log` VALUES (847, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-09-15 15:00:34');
INSERT INTO `sys_oper_log` VALUES (848, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-08 16:58:32');
INSERT INTO `sys_oper_log` VALUES (849, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-08 16:58:32');
INSERT INTO `sys_oper_log` VALUES (850, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-08 16:58:35');
INSERT INTO `sys_oper_log` VALUES (851, '', 0, '/system/tools/gen/preview', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/preview?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-08 16:58:38');
INSERT INTO `sys_oper_log` VALUES (852, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-08 16:59:10');
INSERT INTO `sys_oper_log` VALUES (853, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-08 16:59:10');
INSERT INTO `sys_oper_log` VALUES (854, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-08 16:59:10');
INSERT INTO `sys_oper_log` VALUES (855, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-09 14:33:34');
INSERT INTO `sys_oper_log` VALUES (856, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-09 14:33:34');
INSERT INTO `sys_oper_log` VALUES (857, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-09 14:33:39');
INSERT INTO `sys_oper_log` VALUES (858, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-09 14:33:39');
INSERT INTO `sys_oper_log` VALUES (859, '修改角色', 0, '/system/auth/editRole', 'GET', 1, 'demo', '财务部门', '/system/auth/editRole?roleId=2', '[::1]', '内网IP', '{\"roleId\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-09 14:33:47');
INSERT INTO `sys_oper_log` VALUES (860, '修改角色', 0, '/system/auth/editRole', 'GET', 1, 'demo', '财务部门', '/system/auth/editRole?roleId=8', '[::1]', '内网IP', '{\"roleId\":\"8\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-09 14:41:49');
INSERT INTO `sys_oper_log` VALUES (861, '', 0, '/system/auth/roleDeptTreeSelect', 'GET', 1, 'demo', '财务部门', '/system/auth/roleDeptTreeSelect?roleId=8', '[::1]', '内网IP', '{\"roleId\":\"8\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-11-09 14:41:49');
INSERT INTO `sys_oper_log` VALUES (862, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:03');
INSERT INTO `sys_oper_log` VALUES (863, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:03');
INSERT INTO `sys_oper_log` VALUES (864, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:09');
INSERT INTO `sys_oper_log` VALUES (865, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:09');
INSERT INTO `sys_oper_log` VALUES (866, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:09');
INSERT INTO `sys_oper_log` VALUES (867, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:09');
INSERT INTO `sys_oper_log` VALUES (868, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:33');
INSERT INTO `sys_oper_log` VALUES (869, '部门管理', 0, '/system/auth/deptList', 'GET', 1, 'demo', '财务部门', '/system/auth/deptList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:34:33');
INSERT INTO `sys_oper_log` VALUES (870, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:37:48');
INSERT INTO `sys_oper_log` VALUES (871, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:37:48');
INSERT INTO `sys_oper_log` VALUES (872, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:37:48');
INSERT INTO `sys_oper_log` VALUES (873, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:37:49');
INSERT INTO `sys_oper_log` VALUES (874, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:41:50');
INSERT INTO `sys_oper_log` VALUES (875, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:39');
INSERT INTO `sys_oper_log` VALUES (876, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"system/tools/api\",\"icon\":\"guide\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"系统接口\",\"menuType\":\"1\",\"moduleType\":\"sys_admin\",\"name\":\"system/tools/api\",\"orderNum\":0,\"parentId\":75,\"path\":\"api\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:42');
INSERT INTO `sys_oper_log` VALUES (877, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:42');
INSERT INTO `sys_oper_log` VALUES (878, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:45');
INSERT INTO `sys_oper_log` VALUES (879, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:45');
INSERT INTO `sys_oper_log` VALUES (880, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:46');
INSERT INTO `sys_oper_log` VALUES (881, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:46');
INSERT INTO `sys_oper_log` VALUES (882, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:46');
INSERT INTO `sys_oper_log` VALUES (883, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:46');
INSERT INTO `sys_oper_log` VALUES (884, '', 0, '/system/auth/menu', 'GET', 1, 'demo', '财务部门', '/system/auth/menu?menuId=226', '[::1]', '内网IP', '{\"menuId\":\"226\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:42:55');
INSERT INTO `sys_oper_log` VALUES (885, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:03');
INSERT INTO `sys_oper_log` VALUES (886, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:03');
INSERT INTO `sys_oper_log` VALUES (887, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:03');
INSERT INTO `sys_oper_log` VALUES (888, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:03');
INSERT INTO `sys_oper_log` VALUES (889, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:03');
INSERT INTO `sys_oper_log` VALUES (890, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:03');
INSERT INTO `sys_oper_log` VALUES (891, '', 0, '/system/cache/clear', 'DELETE', 1, 'demo', '财务部门', '/system/cache/clear', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:13');
INSERT INTO `sys_oper_log` VALUES (892, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:16');
INSERT INTO `sys_oper_log` VALUES (893, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:16');
INSERT INTO `sys_oper_log` VALUES (894, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:16');
INSERT INTO `sys_oper_log` VALUES (895, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:16');
INSERT INTO `sys_oper_log` VALUES (896, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:16');
INSERT INTO `sys_oper_log` VALUES (897, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:43:17');
INSERT INTO `sys_oper_log` VALUES (898, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:44:44');
INSERT INTO `sys_oper_log` VALUES (899, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:44:44');
INSERT INTO `sys_oper_log` VALUES (900, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:44:44');
INSERT INTO `sys_oper_log` VALUES (901, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:44:44');
INSERT INTO `sys_oper_log` VALUES (902, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:44:44');
INSERT INTO `sys_oper_log` VALUES (903, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:44:44');
INSERT INTO `sys_oper_log` VALUES (904, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:45:30');
INSERT INTO `sys_oper_log` VALUES (905, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:45:30');
INSERT INTO `sys_oper_log` VALUES (906, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:45:30');
INSERT INTO `sys_oper_log` VALUES (907, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:45:30');
INSERT INTO `sys_oper_log` VALUES (908, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:45:30');
INSERT INTO `sys_oper_log` VALUES (909, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:45:30');
INSERT INTO `sys_oper_log` VALUES (910, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:46:46');
INSERT INTO `sys_oper_log` VALUES (911, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:46:46');
INSERT INTO `sys_oper_log` VALUES (912, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:46:49');
INSERT INTO `sys_oper_log` VALUES (913, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:54:21');
INSERT INTO `sys_oper_log` VALUES (914, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:54:21');
INSERT INTO `sys_oper_log` VALUES (915, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:55:34');
INSERT INTO `sys_oper_log` VALUES (916, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:55:42');
INSERT INTO `sys_oper_log` VALUES (917, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:55:42');
INSERT INTO `sys_oper_log` VALUES (918, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:55:42');
INSERT INTO `sys_oper_log` VALUES (919, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 09:55:42');
INSERT INTO `sys_oper_log` VALUES (920, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:09:49');
INSERT INTO `sys_oper_log` VALUES (921, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:14');
INSERT INTO `sys_oper_log` VALUES (922, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"system/pluginsManage/list\",\"icon\":\"list\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"插件管理\",\"menuType\":\"1\",\"moduleType\":\"sys_admin\",\"name\":\"system/pluginsManage/list\",\"orderNum\":0,\"parentId\":75,\"path\":\"pluginsManageList\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:15');
INSERT INTO `sys_oper_log` VALUES (923, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:15');
INSERT INTO `sys_oper_log` VALUES (924, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:18');
INSERT INTO `sys_oper_log` VALUES (925, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:18');
INSERT INTO `sys_oper_log` VALUES (926, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:18');
INSERT INTO `sys_oper_log` VALUES (927, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:18');
INSERT INTO `sys_oper_log` VALUES (928, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:18');
INSERT INTO `sys_oper_log` VALUES (929, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:18');
INSERT INTO `sys_oper_log` VALUES (930, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:24');
INSERT INTO `sys_oper_log` VALUES (931, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:41');
INSERT INTO `sys_oper_log` VALUES (932, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:52');
INSERT INTO `sys_oper_log` VALUES (933, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"插件管理查询\",\"menuType\":\"2\",\"moduleType\":\"sys_admin\",\"name\":\"system/pluginsManage/get\",\"orderNum\":0,\"parentId\":227,\"path\":\"\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:54');
INSERT INTO `sys_oper_log` VALUES (934, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:54');
INSERT INTO `sys_oper_log` VALUES (935, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:10:57');
INSERT INTO `sys_oper_log` VALUES (936, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:29');
INSERT INTO `sys_oper_log` VALUES (937, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"插件管理添加\",\"menuType\":\"2\",\"moduleType\":\"sys_admin\",\"name\":\"system/pluginsManage/add\",\"orderNum\":0,\"parentId\":227,\"path\":\"\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:29');
INSERT INTO `sys_oper_log` VALUES (938, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:29');
INSERT INTO `sys_oper_log` VALUES (939, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:32');
INSERT INTO `sys_oper_log` VALUES (940, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:48');
INSERT INTO `sys_oper_log` VALUES (941, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"插件管理修改\",\"menuType\":\"2\",\"moduleType\":\"sys_admin\",\"name\":\"system/pluginsManage/edit\",\"orderNum\":0,\"parentId\":227,\"path\":\"\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:48');
INSERT INTO `sys_oper_log` VALUES (942, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:48');
INSERT INTO `sys_oper_log` VALUES (943, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:11:51');
INSERT INTO `sys_oper_log` VALUES (944, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:09');
INSERT INTO `sys_oper_log` VALUES (945, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"插件管理删除\",\"menuType\":\"2\",\"moduleType\":\"sys_admin\",\"name\":\"system/pluginsManage/delete\",\"orderNum\":0,\"parentId\":227,\"path\":\"\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:09');
INSERT INTO `sys_oper_log` VALUES (946, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:09');
INSERT INTO `sys_oper_log` VALUES (947, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:22');
INSERT INTO `sys_oper_log` VALUES (948, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:30');
INSERT INTO `sys_oper_log` VALUES (949, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"插件管理状态修改\",\"menuType\":\"2\",\"moduleType\":\"sys_admin\",\"name\":\"system/pluginsManage/changeStatus\",\"orderNum\":0,\"parentId\":227,\"path\":\"\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:31');
INSERT INTO `sys_oper_log` VALUES (950, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:31');
INSERT INTO `sys_oper_log` VALUES (951, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:40');
INSERT INTO `sys_oper_log` VALUES (952, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:41');
INSERT INTO `sys_oper_log` VALUES (953, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:41');
INSERT INTO `sys_oper_log` VALUES (954, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:41');
INSERT INTO `sys_oper_log` VALUES (955, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:41');
INSERT INTO `sys_oper_log` VALUES (956, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:41');
INSERT INTO `sys_oper_log` VALUES (957, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:12:43');
INSERT INTO `sys_oper_log` VALUES (958, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":-1,\"msg\":\"Error 1146: Table \'gfast-v2-os.plugins_manage\' doesn\'t exist, SELECT `Id`,`StoreId`,`PName`,`PTitle`,`PDescription`,`PAuth`,`IsInstall`,`Status`,`Version`,`Price`,`DownloadTimes`,`InstallPath` FROM `plugins_manage` WHERE store_id in(1,2,3,4)\\n\"}', 0, '', '2021-12-22 10:12:43');
INSERT INTO `sys_oper_log` VALUES (959, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":-1,\"msg\":\"Error 1146: Table \'gfast-v2-os.plugins_manage\' doesn\'t exist, SELECT `Id`,`StoreId`,`PName`,`PTitle`,`PDescription`,`PAuth`,`IsInstall`,`Status`,`Version`,`Price`,`DownloadTimes`,`InstallPath` FROM `plugins_manage` WHERE store_id in(1,2,3,4)\\n\"}', 0, '', '2021-12-22 10:12:52');
INSERT INTO `sys_oper_log` VALUES (960, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:13:51');
INSERT INTO `sys_oper_log` VALUES (961, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:13:56');
INSERT INTO `sys_oper_log` VALUES (962, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":1}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:17:43');
INSERT INTO `sys_oper_log` VALUES (963, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:17:43');
INSERT INTO `sys_oper_log` VALUES (964, '', 0, '/system/pluginsManage/loginR', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/loginR', '[::1]', '内网IP', '{\"password\":\"123456\",\"username\":\"demo01\",\"verifyCode\":\"rf9n\",\"verifyKey\":\"Hxu77GEUHchTOx8ok1hd\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:17:55');
INSERT INTO `sys_oper_log` VALUES (965, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":1,\"rToken\":\"Nc+AUBrD28LKiNfIoZmzAcNcKTPK06UJaHeO7248HgszZYK/k3mPN0KmdPNt7Ry2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:17:59');
INSERT INTO `sys_oper_log` VALUES (966, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:18:00');
INSERT INTO `sys_oper_log` VALUES (967, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:18:01');
INSERT INTO `sys_oper_log` VALUES (968, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:18:01');
INSERT INTO `sys_oper_log` VALUES (969, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:18:02');
INSERT INTO `sys_oper_log` VALUES (970, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:18:02');
INSERT INTO `sys_oper_log` VALUES (971, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:43:36');
INSERT INTO `sys_oper_log` VALUES (972, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:43:36');
INSERT INTO `sys_oper_log` VALUES (973, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:43:37');
INSERT INTO `sys_oper_log` VALUES (974, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-22 10:43:37');
INSERT INTO `sys_oper_log` VALUES (975, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:24:25');
INSERT INTO `sys_oper_log` VALUES (976, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:24:25');
INSERT INTO `sys_oper_log` VALUES (977, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:07');
INSERT INTO `sys_oper_log` VALUES (978, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:07');
INSERT INTO `sys_oper_log` VALUES (979, '', 0, '/system/cache/clear', 'DELETE', 1, 'demo', '财务部门', '/system/cache/clear', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:10');
INSERT INTO `sys_oper_log` VALUES (980, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:11');
INSERT INTO `sys_oper_log` VALUES (981, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:11');
INSERT INTO `sys_oper_log` VALUES (982, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:16');
INSERT INTO `sys_oper_log` VALUES (983, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:16');
INSERT INTO `sys_oper_log` VALUES (984, '删除字典', 0, '/system/config/dict/type/delete', 'DELETE', 1, 'demo', '财务部门', '/system/config/dict/type/delete', '[::1]', '内网IP', '{\"dictIds\":2}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:23');
INSERT INTO `sys_oper_log` VALUES (985, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:23');
INSERT INTO `sys_oper_log` VALUES (986, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:55');
INSERT INTO `sys_oper_log` VALUES (987, '字典数据管理', 0, '/system/config/dict/data/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/list?pageNum=1&pageSize=10&dictType=cms_news_pub_type', '[::1]', '内网IP', '{\"dictType\":\"cms_news_pub_type\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:27:55');
INSERT INTO `sys_oper_log` VALUES (988, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:28:04');
INSERT INTO `sys_oper_log` VALUES (989, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:21');
INSERT INTO `sys_oper_log` VALUES (990, '删除字典', 0, '/system/config/dict/type/delete', 'DELETE', 1, 'demo', '财务部门', '/system/config/dict/type/delete', '[::1]', '内网IP', '{\"dictIds\":25}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:39');
INSERT INTO `sys_oper_log` VALUES (991, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:39');
INSERT INTO `sys_oper_log` VALUES (992, '删除字典', 0, '/system/config/dict/type/delete', 'DELETE', 1, 'demo', '财务部门', '/system/config/dict/type/delete', '[::1]', '内网IP', '{\"dictIds\":26}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:44');
INSERT INTO `sys_oper_log` VALUES (993, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:44');
INSERT INTO `sys_oper_log` VALUES (994, '删除字典', 0, '/system/config/dict/type/delete', 'DELETE', 1, 'demo', '财务部门', '/system/config/dict/type/delete', '[::1]', '内网IP', '{\"dictIds\":27}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:46');
INSERT INTO `sys_oper_log` VALUES (995, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:46');
INSERT INTO `sys_oper_log` VALUES (996, '删除字典', 0, '/system/config/dict/type/delete', 'DELETE', 1, 'demo', '财务部门', '/system/config/dict/type/delete', '[::1]', '内网IP', '{\"dictIds\":28}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:49');
INSERT INTO `sys_oper_log` VALUES (997, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:49');
INSERT INTO `sys_oper_log` VALUES (998, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:29:52');
INSERT INTO `sys_oper_log` VALUES (999, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:30:00');
INSERT INTO `sys_oper_log` VALUES (1000, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:30:00');
INSERT INTO `sys_oper_log` VALUES (1001, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:30:00');
INSERT INTO `sys_oper_log` VALUES (1002, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:30:00');
INSERT INTO `sys_oper_log` VALUES (1003, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:30:01');
INSERT INTO `sys_oper_log` VALUES (1004, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '财务部门', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2021-12-24 14:30:02');
INSERT INTO `sys_oper_log` VALUES (1005, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:02:47');
INSERT INTO `sys_oper_log` VALUES (1006, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:02:47');
INSERT INTO `sys_oper_log` VALUES (1007, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:03:01');
INSERT INTO `sys_oper_log` VALUES (1008, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:03:02');
INSERT INTO `sys_oper_log` VALUES (1009, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:03:03');
INSERT INTO `sys_oper_log` VALUES (1010, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:03:11');
INSERT INTO `sys_oper_log` VALUES (1011, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:03:11');
INSERT INTO `sys_oper_log` VALUES (1012, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:04:54');
INSERT INTO `sys_oper_log` VALUES (1013, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:04:54');
INSERT INTO `sys_oper_log` VALUES (1014, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:04:55');
INSERT INTO `sys_oper_log` VALUES (1015, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:04:55');
INSERT INTO `sys_oper_log` VALUES (1016, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":3}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:04:58');
INSERT INTO `sys_oper_log` VALUES (1017, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:04:58');
INSERT INTO `sys_oper_log` VALUES (1018, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:05:16');
INSERT INTO `sys_oper_log` VALUES (1019, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:05:16');
INSERT INTO `sys_oper_log` VALUES (1020, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:05:16');
INSERT INTO `sys_oper_log` VALUES (1021, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:05:16');
INSERT INTO `sys_oper_log` VALUES (1022, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":4}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:05:18');
INSERT INTO `sys_oper_log` VALUES (1023, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 15:05:18');
INSERT INTO `sys_oper_log` VALUES (1024, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:01:05');
INSERT INTO `sys_oper_log` VALUES (1025, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:01:05');
INSERT INTO `sys_oper_log` VALUES (1026, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:01:10');
INSERT INTO `sys_oper_log` VALUES (1027, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:01:11');
INSERT INTO `sys_oper_log` VALUES (1028, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:01:12');
INSERT INTO `sys_oper_log` VALUES (1029, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:01:12');
INSERT INTO `sys_oper_log` VALUES (1030, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:20:33');
INSERT INTO `sys_oper_log` VALUES (1031, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":3}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:32:30');
INSERT INTO `sys_oper_log` VALUES (1032, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:32:30');
INSERT INTO `sys_oper_log` VALUES (1033, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:32:33');
INSERT INTO `sys_oper_log` VALUES (1034, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:32:40');
INSERT INTO `sys_oper_log` VALUES (1035, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:36:35');
INSERT INTO `sys_oper_log` VALUES (1036, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:36:36');
INSERT INTO `sys_oper_log` VALUES (1037, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:43:34');
INSERT INTO `sys_oper_log` VALUES (1038, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:47:40');
INSERT INTO `sys_oper_log` VALUES (1039, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:47:43');
INSERT INTO `sys_oper_log` VALUES (1040, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:47:43');
INSERT INTO `sys_oper_log` VALUES (1041, '', 0, '/system/pluginsManage/loginR', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/loginR', '[::1]', '内网IP', '{\"password\":\"qxkj_3331516\",\"username\":\"demo01\",\"verifyCode\":\"xawz\",\"verifyKey\":\"rccShATqKnBy1aoMudBH\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:47:58');
INSERT INTO `sys_oper_log` VALUES (1042, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"jWIZl6kuurm6mW5jB/45s5rkMoLHAI8tvZ0JkKEly2vhspIl1IvdlHQbUNv2PEHk\"}', '{\"code\":-1,\"msg\":\"未购买，请先购买后下载\"}', 0, '', '2022-01-04 16:48:00');
INSERT INTO `sys_oper_log` VALUES (1043, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"jWIZl6kuurm6mW5jB/45s5rkMoLHAI8tvZ0JkKEly2vhspIl1IvdlHQbUNv2PEHk\"}', '{\"code\":-1,\"msg\":\"未购买，请先购买后下载\"}', 0, '', '2022-01-04 16:48:03');
INSERT INTO `sys_oper_log` VALUES (1044, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"jWIZl6kuurm6mW5jB/45s5rkMoLHAI8tvZ0JkKEly2vhspIl1IvdlHQbUNv2PEHk\"}', '{\"code\":-1,\"msg\":\"未购买，请先购买后下载\"}', 0, '', '2022-01-04 16:48:10');
INSERT INTO `sys_oper_log` VALUES (1045, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:54:23');
INSERT INTO `sys_oper_log` VALUES (1046, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"jWIZl6kuurm6mW5jB/45s5rkMoLHAI8tvZ0JkKEly2vhspIl1IvdlHQbUNv2PEHk\"}', '{\"code\":-1,\"msg\":\"请求错误或登录超时\"}', 0, '', '2022-01-04 16:54:25');
INSERT INTO `sys_oper_log` VALUES (1047, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"jWIZl6kuurm6mW5jB/45s5rkMoLHAI8tvZ0JkKEly2vhspIl1IvdlHQbUNv2PEHk\"}', '{\"code\":-1,\"msg\":\"请求错误或登录超时\"}', 0, '', '2022-01-04 16:54:31');
INSERT INTO `sys_oper_log` VALUES (1048, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"jWIZl6kuurm6mW5jB/45s5rkMoLHAI8tvZ0JkKEly2vhspIl1IvdlHQbUNv2PEHk\"}', '{\"code\":-1,\"msg\":\"请求错误或登录超时\"}', 0, '', '2022-01-04 16:54:49');
INSERT INTO `sys_oper_log` VALUES (1049, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"jWIZl6kuurm6mW5jB/45s5rkMoLHAI8tvZ0JkKEly2vhspIl1IvdlHQbUNv2PEHk\"}', '{\"code\":-1,\"msg\":\"请求错误或登录超时\"}', 0, '', '2022-01-04 16:54:50');
INSERT INTO `sys_oper_log` VALUES (1050, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:54:51');
INSERT INTO `sys_oper_log` VALUES (1051, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:54:51');
INSERT INTO `sys_oper_log` VALUES (1052, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:54:52');
INSERT INTO `sys_oper_log` VALUES (1053, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:54:52');
INSERT INTO `sys_oper_log` VALUES (1054, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:54:53');
INSERT INTO `sys_oper_log` VALUES (1055, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:54:53');
INSERT INTO `sys_oper_log` VALUES (1056, '', 0, '/system/pluginsManage/loginR', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/loginR', '[::1]', '内网IP', '{\"password\":\"qxkj_3331516\",\"username\":\"demo01\",\"verifyCode\":\"5eae\",\"verifyKey\":\"OgTa14QdbYx37UQJXHtx\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 16:55:03');
INSERT INTO `sys_oper_log` VALUES (1057, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"cghHm1l4ykpaj2+WPmvqlkQnW+JZnPLlj9+FD2/EcuilPgT8+aLm7v4u6ShkKECJ\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 16:55:07');
INSERT INTO `sys_oper_log` VALUES (1058, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"cghHm1l4ykpaj2+WPmvqlkQnW+JZnPLlj9+FD2/EcuilPgT8+aLm7v4u6ShkKECJ\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 16:55:15');
INSERT INTO `sys_oper_log` VALUES (1059, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"cghHm1l4ykpaj2+WPmvqlkQnW+JZnPLlj9+FD2/EcuilPgT8+aLm7v4u6ShkKECJ\",\"version\":\"1.0.2\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 16:55:37');
INSERT INTO `sys_oper_log` VALUES (1060, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"cghHm1l4ykpaj2+WPmvqlkQnW+JZnPLlj9+FD2/EcuilPgT8+aLm7v4u6ShkKECJ\",\"version\":\"1.0.1\"}', '{\"code\":-1,\"msg\":\"文件不存在\"}', 0, '', '2022-01-04 16:55:40');
INSERT INTO `sys_oper_log` VALUES (1061, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"cghHm1l4ykpaj2+WPmvqlkQnW+JZnPLlj9+FD2/EcuilPgT8+aLm7v4u6ShkKECJ\",\"version\":\"1.0.2\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 16:55:43');
INSERT INTO `sys_oper_log` VALUES (1062, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"cghHm1l4ykpaj2+WPmvqlkQnW+JZnPLlj9+FD2/EcuilPgT8+aLm7v4u6ShkKECJ\",\"version\":\"1.0.1\"}', '{\"code\":-1,\"msg\":\"文件不存在\"}', 0, '', '2022-01-04 16:55:45');
INSERT INTO `sys_oper_log` VALUES (1063, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"cghHm1l4ykpaj2+WPmvqlkQnW+JZnPLlj9+FD2/EcuilPgT8+aLm7v4u6ShkKECJ\"}', '{\"code\":-1,\"msg\":\"请求错误或登录超时\"}', 0, '', '2022-01-04 17:47:52');
INSERT INTO `sys_oper_log` VALUES (1064, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:48:47');
INSERT INTO `sys_oper_log` VALUES (1065, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:48:47');
INSERT INTO `sys_oper_log` VALUES (1066, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:48:47');
INSERT INTO `sys_oper_log` VALUES (1067, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:48:47');
INSERT INTO `sys_oper_log` VALUES (1068, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:48:50');
INSERT INTO `sys_oper_log` VALUES (1069, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:48:50');
INSERT INTO `sys_oper_log` VALUES (1070, '', 0, '/system/pluginsManage/loginR', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/loginR', '[::1]', '内网IP', '{\"password\":\"123456\",\"username\":\"demo01\",\"verifyCode\":\"qp62\",\"verifyKey\":\"G99BEtCDyNfTc4KQ2QdA\"}', '{\"code\":-1,\"msg\":\"密码错误!\"}', 0, '', '2022-01-04 17:48:59');
INSERT INTO `sys_oper_log` VALUES (1071, '', 0, '/system/pluginsManage/captcha', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/captcha', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:48:59');
INSERT INTO `sys_oper_log` VALUES (1072, '', 0, '/system/pluginsManage/loginR', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/loginR', '[::1]', '内网IP', '{\"password\":\"qxkj_3331516\",\"username\":\"demo01\",\"verifyCode\":\"kenw\",\"verifyKey\":\"6JOB9aB3tng46s7z9SvS\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:49:08');
INSERT INTO `sys_oper_log` VALUES (1073, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"iCg5PkU31D9h9RkUZBIl0R9qEsyIpWPcAxBgQa5Z7jBGyWfoW7FcpzD1oTVcXwGk\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 17:49:10');
INSERT INTO `sys_oper_log` VALUES (1074, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"iCg5PkU31D9h9RkUZBIl0R9qEsyIpWPcAxBgQa5Z7jBGyWfoW7FcpzD1oTVcXwGk\",\"version\":\"1.0.2\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 17:49:17');
INSERT INTO `sys_oper_log` VALUES (1075, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 17:50:42');
INSERT INTO `sys_oper_log` VALUES (1076, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"iCg5PkU31D9h9RkUZBIl0R9qEsyIpWPcAxBgQa5Z7jBGyWfoW7FcpzD1oTVcXwGk\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 17:50:44');
INSERT INTO `sys_oper_log` VALUES (1077, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"iCg5PkU31D9h9RkUZBIl0R9qEsyIpWPcAxBgQa5Z7jBGyWfoW7FcpzD1oTVcXwGk\",\"version\":\"1.0.1\"}', '{\"code\":-1,\"msg\":\"cannot find file/folder \\\"D:/goProject/p2020/gfast_open/data/installPlugins/gfast-v2-支付证书/install.json\\\" in following paths:\\n1. D:\\\\goProject\\\\p2020\\\\gfast_open\"}', 0, '', '2022-01-04 17:50:47');
INSERT INTO `sys_oper_log` VALUES (1078, '', 0, '/system/pluginsManage/install', 'POST', 1, 'demo', '财务部门', '/system/pluginsManage/install', '[::1]', '内网IP', '{\"pluginId\":2,\"rToken\":\"iCg5PkU31D9h9RkUZBIl0R9qEsyIpWPcAxBgQa5Z7jBGyWfoW7FcpzD1oTVcXwGk\",\"version\":\"1.0.2\"}', '{\"code\":-1,\"msg\":\"插件信息不存在，请刷新页面后再安装。\"}', 0, '', '2022-01-04 17:50:55');
INSERT INTO `sys_oper_log` VALUES (1079, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-04 18:00:22');
INSERT INTO `sys_oper_log` VALUES (1080, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-11 09:19:57');
INSERT INTO `sys_oper_log` VALUES (1081, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-11 09:19:57');
INSERT INTO `sys_oper_log` VALUES (1082, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-01-11 09:19:58');
INSERT INTO `sys_oper_log` VALUES (1083, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-02-17 09:17:04');
INSERT INTO `sys_oper_log` VALUES (1084, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-02-17 09:17:04');
INSERT INTO `sys_oper_log` VALUES (1085, '', 0, '/system/monitor/operLog/list', 'GET', 1, 'demo', '财务部门', '/system/monitor/operLog/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-02-17 09:17:12');
INSERT INTO `sys_oper_log` VALUES (1086, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_oper_log_status&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_oper_log_status\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-02-17 09:17:12');
INSERT INTO `sys_oper_log` VALUES (1087, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-02-17 09:17:15');
INSERT INTO `sys_oper_log` VALUES (1088, '插件管理', 0, '/system/pluginsManage/list', 'GET', 1, 'demo', '财务部门', '/system/pluginsManage/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-02-17 09:17:15');
INSERT INTO `sys_oper_log` VALUES (1089, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 08:59:21');
INSERT INTO `sys_oper_log` VALUES (1090, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 08:59:21');
INSERT INTO `sys_oper_log` VALUES (1091, '字典管理', 0, '/system/config/dict/type/list', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/list?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 08:59:29');
INSERT INTO `sys_oper_log` VALUES (1092, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 08:59:29');
INSERT INTO `sys_oper_log` VALUES (1093, '服务监控', 0, '/system/monitor/server/info', 'GET', 1, 'demo', '财务部门', '/system/monitor/server/info', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:00:43');
INSERT INTO `sys_oper_log` VALUES (1094, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:01:03');
INSERT INTO `sys_oper_log` VALUES (1095, '', 0, '/system/tools/gen/relationTable', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/relationTable', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:01:17');
INSERT INTO `sys_oper_log` VALUES (1096, '', 0, '/system/tools/gen/columnList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/columnList?tableId=69', '[::1]', '内网IP', '{\"tableId\":\"69\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:01:17');
INSERT INTO `sys_oper_log` VALUES (1097, '', 0, '/system/config/dict/type/optionSelect', 'GET', 1, 'demo', '财务部门', '/system/config/dict/type/optionSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:01:17');
INSERT INTO `sys_oper_log` VALUES (1098, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:15:58');
INSERT INTO `sys_oper_log` VALUES (1099, '岗位管理', 0, '/system/auth/postList', 'GET', 1, 'demo', '财务部门', '/system/auth/postList?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:15:58');
INSERT INTO `sys_oper_log` VALUES (1100, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:03');
INSERT INTO `sys_oper_log` VALUES (1101, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:03');
INSERT INTO `sys_oper_log` VALUES (1102, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:03');
INSERT INTO `sys_oper_log` VALUES (1103, '', 0, '/system/auth/deptTreeSelect', 'GET', 1, 'demo', '财务部门', '/system/auth/deptTreeSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:03');
INSERT INTO `sys_oper_log` VALUES (1104, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:11');
INSERT INTO `sys_oper_log` VALUES (1105, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=3&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"3\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:12');
INSERT INTO `sys_oper_log` VALUES (1106, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:13');
INSERT INTO `sys_oper_log` VALUES (1107, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:14');
INSERT INTO `sys_oper_log` VALUES (1108, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:16:15');
INSERT INTO `sys_oper_log` VALUES (1109, '代码生成', 0, '/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/tableList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:23:32');
INSERT INTO `sys_oper_log` VALUES (1110, '', 0, '/system/tools/gen/dataList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/dataList?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:23:34');
INSERT INTO `sys_oper_log` VALUES (1111, '', 0, '/system/tools/gen/dataList', 'GET', 1, 'demo', '财务部门', '/system/tools/gen/dataList?pageNum=2&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 09:23:39');
INSERT INTO `sys_oper_log` VALUES (1112, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:50:25');
INSERT INTO `sys_oper_log` VALUES (1113, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:50:25');
INSERT INTO `sys_oper_log` VALUES (1114, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:50:29');
INSERT INTO `sys_oper_log` VALUES (1115, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:50:29');
INSERT INTO `sys_oper_log` VALUES (1116, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:50:29');
INSERT INTO `sys_oper_log` VALUES (1117, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:50:29');
INSERT INTO `sys_oper_log` VALUES (1118, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:51:41');
INSERT INTO `sys_oper_log` VALUES (1119, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:52:44');
INSERT INTO `sys_oper_log` VALUES (1120, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"\",\"icon\":\"clipboard\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"数据权限测试管理\",\"menuType\":\"0\",\"moduleType\":\"sys_admin\",\"name\":\"demo/demoDataAuth\",\"orderNum\":0,\"path\":\"demoDataAuth\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:52:48');
INSERT INTO `sys_oper_log` VALUES (1121, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:52:48');
INSERT INTO `sys_oper_log` VALUES (1122, '', 0, '/system/auth/getMenus', 'GET', 1, 'demo', '财务部门', '/system/auth/getMenus', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:52:49');
INSERT INTO `sys_oper_log` VALUES (1123, '', 0, '/system/auth/modelOptions', 'GET', 1, 'demo', '财务部门', '/system/auth/modelOptions?module=sys_admin', '[::1]', '内网IP', '{\"module\":\"sys_admin\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:24');
INSERT INTO `sys_oper_log` VALUES (1124, '添加菜单', 0, '/system/auth/addMenu', 'POST', 1, 'demo', '财务部门', '/system/auth/addMenu', '[::1]', '内网IP', '{\"component\":\"demo/demoDataAuth/list\",\"icon\":\"date\",\"isFrame\":\"0\",\"jumpPath\":\"\",\"menuName\":\"数据权限测试列表\",\"menuType\":\"1\",\"moduleType\":\"sys_admin\",\"name\":\"demo/demoDataAuth/list\",\"orderNum\":0,\"parentId\":233,\"path\":\"demoDataAuthList\",\"status\":\"1\",\"visible\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:26');
INSERT INTO `sys_oper_log` VALUES (1125, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:26');
INSERT INTO `sys_oper_log` VALUES (1126, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '财务部门', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:28');
INSERT INTO `sys_oper_log` VALUES (1127, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '财务部门', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:28');
INSERT INTO `sys_oper_log` VALUES (1128, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:28');
INSERT INTO `sys_oper_log` VALUES (1129, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_show_hide&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_show_hide\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:28');
INSERT INTO `sys_oper_log` VALUES (1130, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=menu_module_type&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"menu_module_type\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:28');
INSERT INTO `sys_oper_log` VALUES (1131, '菜单管理', 0, '/system/auth/menuList', 'GET', 1, 'demo', '财务部门', '/system/auth/menuList', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:28');
INSERT INTO `sys_oper_log` VALUES (1132, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '财务部门', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:31');
INSERT INTO `sys_oper_log` VALUES (1133, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '财务部门', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:53:33');
INSERT INTO `sys_oper_log` VALUES (1134, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '财务部门', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:54:30');
INSERT INTO `sys_oper_log` VALUES (1135, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '财务部门', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:55:19');
INSERT INTO `sys_oper_log` VALUES (1136, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '财务部门', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 11:55:25');
INSERT INTO `sys_oper_log` VALUES (1137, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '财务部门', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:00:46');
INSERT INTO `sys_oper_log` VALUES (1138, '', 0, '/system/auth/usersGet', 'GET', 1, 'demo', '财务部门', '/system/auth/usersGet?ids[]=31&ids[]=28&ids[]=31', '[::1]', '内网IP', '{\"ids\":[\"31\",\"28\",\"31\"]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:00:46');
INSERT INTO `sys_oper_log` VALUES (1139, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:00:56');
INSERT INTO `sys_oper_log` VALUES (1140, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '财务部门', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:00:56');
INSERT INTO `sys_oper_log` VALUES (1141, '', 0, '/system/auth/deptTreeSelect', 'GET', 1, 'demo', '财务部门', '/system/auth/deptTreeSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:00:56');
INSERT INTO `sys_oper_log` VALUES (1142, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:00:56');
INSERT INTO `sys_oper_log` VALUES (1143, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:02');
INSERT INTO `sys_oper_log` VALUES (1144, '', 0, '/system/auth/getEditUser', 'GET', 1, 'demo', '财务部门', '/system/auth/getEditUser?id=31', '[::1]', '内网IP', '{\"id\":\"31\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:07');
INSERT INTO `sys_oper_log` VALUES (1145, '修改用户', 0, '/system/auth/editUser', 'PUT', 1, 'demo', '财务部门', '/system/auth/editUser', '[::1]', '内网IP', '{\"deptId\":101,\"email\":\"223@qq.com\",\"isAdmin\":1,\"nickName\":\"测试账号\",\"password\":\"\",\"phonenumber\":\"15334455789\",\"postIds\":[2],\"remark\":\"\",\"roleIds\":[1,2],\"sex\":\"2\",\"status\":\"1\",\"userId\":31,\"userName\":\"demo\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:12');
INSERT INTO `sys_oper_log` VALUES (1146, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '财务部门', '/system/auth/userList?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:12');
INSERT INTO `sys_oper_log` VALUES (1147, '', 0, '/system/user/getInfo', 'GET', 1, 'demo', '深圳总公司', '/system/user/getInfo', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:22');
INSERT INTO `sys_oper_log` VALUES (1148, '', 0, '/system/user/getRouters', 'GET', 1, 'demo', '深圳总公司', '/system/user/getRouters', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:22');
INSERT INTO `sys_oper_log` VALUES (1149, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '深圳总公司', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:22');
INSERT INTO `sys_oper_log` VALUES (1150, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '深圳总公司', '/system/config/dict/data/GetDictData?dictType=sys_user_sex&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:22');
INSERT INTO `sys_oper_log` VALUES (1151, '', 0, '/system/auth/deptTreeSelect', 'GET', 1, 'demo', '深圳总公司', '/system/auth/deptTreeSelect', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:22');
INSERT INTO `sys_oper_log` VALUES (1152, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '深圳总公司', '/system/auth/userList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:22');
INSERT INTO `sys_oper_log` VALUES (1153, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '深圳总公司', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:25');
INSERT INTO `sys_oper_log` VALUES (1154, '', 0, '/system/auth/usersGet', 'GET', 1, 'demo', '深圳总公司', '/system/auth/usersGet?ids[]=31&ids[]=31', '[::1]', '内网IP', '{\"ids\":[\"31\",\"31\"]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:25');
INSERT INTO `sys_oper_log` VALUES (1155, '', 0, '/system/config/dict/data/GetDictData', 'GET', 1, 'demo', '深圳总公司', '/system/config/dict/data/GetDictData?dictType=sys_normal_disable&defaultValue=', '[::1]', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_normal_disable\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:30');
INSERT INTO `sys_oper_log` VALUES (1156, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '深圳总公司', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:30');
INSERT INTO `sys_oper_log` VALUES (1157, '修改角色', 0, '/system/auth/editRole', 'GET', 1, 'demo', '深圳总公司', '/system/auth/editRole?roleId=2', '[::1]', '内网IP', '{\"roleId\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:35');
INSERT INTO `sys_oper_log` VALUES (1158, '', 0, '/system/auth/roleDeptTreeSelect', 'GET', 1, 'demo', '深圳总公司', '/system/auth/roleDeptTreeSelect?roleId=2', '[::1]', '内网IP', '{\"roleId\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:35');
INSERT INTO `sys_oper_log` VALUES (1159, '', 0, '/system/auth/roleDataScope', 'PUT', 1, 'demo', '深圳总公司', '/system/auth/roleDataScope', '[::1]', '内网IP', '{\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"deptIds\":[],\"menuCheckStrictly\":false,\"menuIds\":[1,5,19,20,21,22,23,24,25,6,41,42,43,2,8,16,17,18,26,27,29,30,31,28,33,40,50,52,53,3,34,36,37,38,39,4,32,35,96,97,98,124,126],\"remark\":\"备注\",\"roleId\":2,\"roleName\":\"普通管理员\",\"roleSort\":0,\"status\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:38');
INSERT INTO `sys_oper_log` VALUES (1160, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '深圳总公司', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:38');
INSERT INTO `sys_oper_log` VALUES (1161, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '深圳总公司', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:42');
INSERT INTO `sys_oper_log` VALUES (1162, '', 0, '/system/auth/usersGet', 'GET', 1, 'demo', '深圳总公司', '/system/auth/usersGet?ids[]=31&ids[]=31', '[::1]', '内网IP', '{\"ids\":[\"31\",\"31\"]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:42');
INSERT INTO `sys_oper_log` VALUES (1163, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '深圳总公司', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:45');
INSERT INTO `sys_oper_log` VALUES (1164, '', 0, '/system/auth/usersGet', 'GET', 1, 'demo', '深圳总公司', '/system/auth/usersGet?ids[]=31&ids[]=31', '[::1]', '内网IP', '{\"ids\":[\"31\",\"31\"]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:45');
INSERT INTO `sys_oper_log` VALUES (1165, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '深圳总公司', '/system/auth/userList?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:01:55');
INSERT INTO `sys_oper_log` VALUES (1166, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '深圳总公司', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:04');
INSERT INTO `sys_oper_log` VALUES (1167, '', 0, '/system/auth/usersGet', 'GET', 1, 'demo', '深圳总公司', '/system/auth/usersGet?ids[]=31&ids[]=31', '[::1]', '内网IP', '{\"ids\":[\"31\",\"31\"]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:05');
INSERT INTO `sys_oper_log` VALUES (1168, '修改角色', 0, '/system/auth/editRole', 'GET', 1, 'demo', '深圳总公司', '/system/auth/editRole?roleId=2', '[::1]', '内网IP', '{\"roleId\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:18');
INSERT INTO `sys_oper_log` VALUES (1169, '', 0, '/system/auth/roleDeptTreeSelect', 'GET', 1, 'demo', '深圳总公司', '/system/auth/roleDeptTreeSelect?roleId=2', '[::1]', '内网IP', '{\"roleId\":\"2\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:18');
INSERT INTO `sys_oper_log` VALUES (1170, '', 0, '/system/auth/roleDataScope', 'PUT', 1, 'demo', '深圳总公司', '/system/auth/roleDataScope', '[::1]', '内网IP', '{\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"deptIds\":[],\"menuCheckStrictly\":false,\"menuIds\":[1,5,19,20,21,22,23,24,25,6,41,42,43,2,8,16,17,18,26,27,29,30,31,28,33,40,50,52,53,3,34,36,37,38,39,4,32,35,96,97,98,124,126],\"remark\":\"备注\",\"roleId\":2,\"roleName\":\"普通管理员\",\"roleSort\":0,\"status\":\"1\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:21');
INSERT INTO `sys_oper_log` VALUES (1171, '角色管理', 0, '/system/auth/roleList', 'GET', 1, 'demo', '深圳总公司', '/system/auth/roleList?pageNum=1&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:21');
INSERT INTO `sys_oper_log` VALUES (1172, '', 0, '/system/user/profile', 'GET', 1, 'demo', '深圳总公司', '/system/user/profile', '[::1]', '内网IP', '{}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:24');
INSERT INTO `sys_oper_log` VALUES (1173, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '深圳总公司', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:33');
INSERT INTO `sys_oper_log` VALUES (1174, '', 0, '/system/auth/usersGet', 'GET', 1, 'demo', '深圳总公司', '/system/auth/usersGet?ids[]=31&ids[]=31', '[::1]', '内网IP', '{\"ids\":[\"31\",\"31\"]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:33');
INSERT INTO `sys_oper_log` VALUES (1175, '', 0, '/system/auth/getEditUser', 'GET', 1, 'demo', '深圳总公司', '/system/auth/getEditUser?id=16', '[::1]', '内网IP', '{\"id\":\"16\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:53');
INSERT INTO `sys_oper_log` VALUES (1176, '修改用户', 0, '/system/auth/editUser', 'PUT', 1, 'demo', '深圳总公司', '/system/auth/editUser', '[::1]', '内网IP', '{\"deptId\":103,\"email\":\"a@ll.con\",\"isAdmin\":1,\"nickName\":\"李大牛\",\"password\":\"\",\"phonenumber\":\"13899658874\",\"postIds\":[2],\"remark\":\"\",\"roleIds\":[3],\"sex\":\"0\",\"status\":\"1\",\"userId\":16,\"userName\":\"ldn\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:57');
INSERT INTO `sys_oper_log` VALUES (1177, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '深圳总公司', '/system/auth/userList?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:02:57');
INSERT INTO `sys_oper_log` VALUES (1178, '', 0, '/system/auth/getEditUser', 'GET', 1, 'demo', '深圳总公司', '/system/auth/getEditUser?id=20', '[::1]', '内网IP', '{\"id\":\"20\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:03:00');
INSERT INTO `sys_oper_log` VALUES (1179, '修改用户', 0, '/system/auth/editUser', 'PUT', 1, 'demo', '深圳总公司', '/system/auth/editUser', '[::1]', '内网IP', '{\"deptId\":105,\"email\":\"kkj@qq.com\",\"isAdmin\":1,\"nickName\":\"大百词\",\"password\":\"\",\"phonenumber\":\"13877555566\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[],\"sex\":\"0\",\"status\":\"1\",\"userId\":20,\"userName\":\"dbc\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:03:09');
INSERT INTO `sys_oper_log` VALUES (1180, '用户管理', 0, '/system/auth/userList', 'GET', 1, 'demo', '深圳总公司', '/system/auth/userList?pageNum=2&pageSize=10&beginTime=&endTime=', '[::1]', '内网IP', '{\"beginTime\":\"\",\"endTime\":\"\",\"pageNum\":\"2\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:03:09');
INSERT INTO `sys_oper_log` VALUES (1181, '数据权限测试列表', 0, '/demo/demoDataAuth/list', 'GET', 1, 'demo', '深圳总公司', '/demo/demoDataAuth/list?pageNum=1&pageSize=10', '[::1]', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:03:27');
INSERT INTO `sys_oper_log` VALUES (1182, '', 0, '/system/auth/usersGet', 'GET', 1, 'demo', '深圳总公司', '/system/auth/usersGet?ids[]=31&ids[]=16&ids[]=20&ids[]=31', '[::1]', '内网IP', '{\"ids\":[\"31\",\"16\",\"20\",\"31\"]}', '{\"code\":0,\"msg\":\"success\"}', 1, '', '2022-03-03 12:03:27');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '1', '', 0, 0, '2021-07-11 11:32:58', NULL, NULL);
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '1', '', 0, 0, '2021-07-12 11:01:26', NULL, NULL);
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '1', '', 0, 0, '2021-07-12 11:01:30', NULL, NULL);
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '1', '', 0, 0, '2021-07-12 11:01:33', NULL, NULL);
INSERT INTO `sys_post` VALUES (5, 'it', 'IT部', 5, '1', '信息部', 31, 31, '2021-07-12 11:09:42', '2021-07-12 11:21:00', NULL);
INSERT INTO `sys_post` VALUES (6, 'asd', 'aaa', 100, '0', '', 31, 0, '2021-07-12 11:21:12', '2021-07-12 11:21:12', '2021-07-12 11:24:49');
INSERT INTO `sys_post` VALUES (7, 'asda', 'ddd', 222, '0', 'asdas', 31, 31, '2021-07-12 11:21:18', '2021-07-12 11:21:27', '2021-07-12 11:24:49');
INSERT INTO `sys_post` VALUES (8, 'dasd', 'dasd', 3444, '0', 'asdas', 31, 31, '2021-07-12 11:21:22', '2021-07-12 11:21:31', '2021-07-12 11:24:45');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态;0:禁用;1:正常',
  `list_order` float NOT NULL DEFAULT 0 COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) UNSIGNED NOT NULL DEFAULT 3 COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 1, 0, '超级管理员', '备注', 3);
INSERT INTO `sys_role` VALUES (2, 1, 0, '普通管理员', '备注', 4);
INSERT INTO `sys_role` VALUES (3, 1, 0, '站点管理员', '站点管理人员', 3);
INSERT INTO `sys_role` VALUES (4, 1, 0, '初级管理员', '初级管理员', 3);
INSERT INTO `sys_role` VALUES (5, 1, 0, '高级管理员', '高级管理员', 2);
INSERT INTO `sys_role` VALUES (8, 1, 0, '区级管理员', '', 2);

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
  `phone_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime(0) NULL COMMENT '最后登录时间',
  `created_at` datetime(0) NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_login`(`user_name`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '13578342363', '超级管理员', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'yxh669@qq.com', 1, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-19/ccwpeuqz1i2s769hua.jpeg', 101, '', 1, 'asdasfdsaf大发放打发士大夫发按时', '描述信息', '18611111111', '[::1]', '2021-07-19 14:28:38', '2021-06-22 17:58:00', '2021-07-12 22:07:44', NULL);
INSERT INTO `sys_user` VALUES (2, 'yixiaohu', '13699885599', '奈斯', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'yxh@qq.com', 1, 'pub_upload/2020-11-02/c6sntzg7r96c7p9gqf.jpeg', 102, '备注', 1, '', '', '', '[::1]', '2021-03-29 21:12:43', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (3, 'zs', '16399669855', '张三', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'zs@qq.com', 0, '', 101, '', 1, '', '', '', '[::1]', '2021-07-16 17:40:29', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (4, 'qlgl', '13758596696', '测试c', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'qlgl@qq.com', 0, '', 102, '', 1, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (5, 'test', '13845696696', '测试2', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123@qq.com', 0, '', 101, '', 0, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (6, '18999998889', '13755866654', '刘大大', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '1223@qq.com', 0, '', 103, '', 1, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-07-12 22:01:23', NULL);
INSERT INTO `sys_user` VALUES (7, 'zmm', '13788566696', '张明明', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '11123@qq.com', 0, '', 104, '', 1, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (8, 'lxx', '13756566696', '李小小', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123333@qq.com', 0, '', 101, '', 1, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (10, 'xmm', '13588999969', '小秘密', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 101, '', 1, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (14, 'cd_19', '123154564', '看金利科技', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-07-19 16:45:59', NULL);
INSERT INTO `sys_user` VALUES (15, 'lmm', '13587754545', '刘敏敏', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'a@coc.com', 0, '', 201, '', 1, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (16, 'ldn', '13899658874', '李大牛', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'a@ll.con', 0, '', 103, '', 1, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-03-03 12:02:57', NULL);
INSERT INTO `sys_user` VALUES (20, 'dbc', '13877555566', '大百词', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'kkj@qq.com', 0, '', 105, '', 1, '', '', '', '', NULL, '2021-06-22 17:58:00', '2022-03-03 12:03:09', NULL);
INSERT INTO `sys_user` VALUES (22, 'yxfmlbb', '15969423326', '大数据部门测试', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'yxh6691@qq.com', 0, 'pub_upload/2021-03-08/c9rmm1sewobsxrsot8.jpeg', 200, '', 1, '2222233', '1222', '13239874541', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (23, 'wangming', '13699888855', '王明', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (24, 'zhk', '13699885591', '综合科', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', '192.168.0.146', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (28, 'demo3', '18699888855', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123132@qq.com', 0, '', 109, '', 1, '', '', '', '192.168.0.229', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (31, 'demo', '15334455789', '测试账号', 0, '39978de67915a11e94bfe9c879b2d9a1', 'gqwLs4n95E', 1, '223@qq.com', 2, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-14/ccsn83vgufh0oiyzji.jpeg', 101, '', 1, '云南省曲靖市22223', '12345', '15334455777', '[::1]', '2022-03-03 12:01:22', '2021-06-22 17:58:00', '2022-03-03 12:01:12', NULL);
INSERT INTO `sys_user` VALUES (32, 'demo100', '18699888859', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (33, 'demo110', '18699888853', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (34, 'yxfmlbb2', '15969423327', '研发部门测试', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '1111@qqq.com', 1, '', 103, '', 0, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (35, 'wk666', '18888888888', 'wk', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '396861557@qq.com', 1, '', 100, '', 1, '', '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (36, 'zxd', '13699885565', '张晓东', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'zxk@qq.com', 1, '', 201, '666', 1, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (37, 'yxfmlbb3', '13513513511', '张三', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '111@qq.com', 0, '', 204, '', 0, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (38, 'test_user', '18888888880', 'test', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '11@qq.com', 1, '', 200, '111', 0, '', '', '', '', NULL, '2021-06-22 17:58:00', '2021-07-12 22:05:29', NULL);
INSERT INTO `sys_user` VALUES (39, 'asan', '18687460555', '阿三', 0, '2354837137115700e2adf870ac113dcf', 'drdDvbtYZW', 1, '456654@qq.com', 1, '', 201, '666666', 1, '', '', '', '', NULL, '2021-07-12 17:21:43', '2021-07-12 21:13:31', '2021-07-12 22:00:44');
INSERT INTO `sys_user` VALUES (40, 'asi', '13655888888', '啊四', 0, 'fbb755b35d48759dad47bb1540249fd1', '9dfUstcxrz', 1, '5464@qq.com', 1, '', 201, 'adsaasd', 1, '', '', '', '', '0000-00-00 00:00:00', '2021-07-12 17:46:27', '2021-07-12 21:29:41', '2021-07-12 22:00:44');
INSERT INTO `sys_user` VALUES (41, 'awu', '13578556546', '阿五', 0, '3b36a96afa0dfd66aa915e0816e0e9f6', '9gHRa9ho4U', 0, '132321@qq.com', 1, '', 201, 'asdasdasd', 1, '', '', '', '', NULL, '2021-07-12 17:54:31', '2021-07-12 21:46:34', '2021-07-12 21:59:56');

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
) ENGINE = MyISAM AUTO_INCREMENT = 16832 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户在线状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES (16831, 'bf87af2abc41328047b2fb5ddd9215db', 'oqvgpXlo+yd79rXmKL2otwfhEkHseCvwM5m6FA4zk6QJqJq2IWi6ZsRlgU3j9+ZrXU5HcYR3La2Lg4N4u0+lvzAHifxVoqsXWAr6fyXtXFLWpUMNVKKtoqjQC61kyBBnha+nIJepP6a8V/M57xr2RQ==', '2022-03-03 12:01:22', 'demo', '[::1]', 'Chrome', 'Windows 10');

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

-- ----------------------------
-- Table structure for sys_web_set
-- ----------------------------
DROP TABLE IF EXISTS `sys_web_set`;
CREATE TABLE `sys_web_set`  (
  `web_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `web_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站点信息',
  PRIMARY KEY (`web_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_web_set
-- ----------------------------
INSERT INTO `sys_web_set` VALUES (1, '{\"CopyrightInfo\":\"11122\",\"recordInfo\":\"111222\",\"statisticsCode\":\"11122\",\"webId\":1,\"webLogo\":\"https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-13/ccroz2q3sptczqwchk.jpg\",\"webName\":\"gfast\",\"webSite\":\"http://localhost/index#/webSet\"}');

-- ----------------------------
-- Table structure for tools_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `tools_gen_table`;
CREATE TABLE `tools_gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tools_gen_table
-- ----------------------------
INSERT INTO `tools_gen_table` VALUES (65, 'demo_gen_class', '代码生成关联测试表', 'DemoGenClass', 'crud', 'gfast/app/system', 'system', 'demo_gen_class', '代码生成关联测试', 'gfast', '', '2021-07-26 11:07:30', '2021-08-16 15:53:39', '');
INSERT INTO `tools_gen_table` VALUES (68, 'demo_gen_tree', '代码生成树形结构测试表', 'DemoGenTree', 'tree', 'gfast/app/system', 'system', 'demo_gen_tree', '代码生成树形结构测试', 'gfast', '{\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\"}', '2021-08-02 11:55:43', '2021-08-16 15:53:47', '');
INSERT INTO `tools_gen_table` VALUES (69, 'demo_gen', '代码生成测试表', 'DemoGen', 'crud', 'gfast/app/system', 'system', 'demo_gen', '代码生成测试', 'gfast', '', '2021-08-03 18:14:06', '2021-08-16 15:53:56', '');

-- ----------------------------
-- Table structure for tools_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `tools_gen_table_column`;
CREATE TABLE `tools_gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Go类型',
  `go_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Go字段名',
  `html_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'html字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `link_table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表名',
  `link_table_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表类名',
  `link_table_package` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表包名',
  `link_label_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表键名',
  `link_label_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表字段值',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 720 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tools_gen_table_column
-- ----------------------------
INSERT INTO `tools_gen_table_column` VALUES (666, 65, 'id', '分类id', 'int(10) unsigned', 'uint', 'Id', 'id', '1', '1', '0', '0', '0', '1', '0', 'EQ', 'input', '', 1, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (667, 65, 'class_name', '分类名', 'varchar(30)', 'string', 'ClassName', 'className', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (693, 68, 'id', 'ID', 'int(11) unsigned', 'uint', 'Id', 'id', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', '', 1, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (694, 68, 'parent_id', '父级ID', 'int(10) unsigned', 'uint', 'ParentId', 'parentId', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'select', '', 2, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (695, 68, 'demo_name', '姓名', 'varchar(20)', 'string', 'DemoName', 'demoName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (696, 68, 'demo_age', '年龄', 'int(10) unsigned', 'uint', 'DemoAge', 'demoAge', '0', '0', '1', '1', '1', '1', '', 'EQ', 'input', '', 4, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (697, 68, 'classes', '班级', 'varchar(30)', 'string', 'Classes', 'classes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'demo_gen_class', 'DemoGenClass', 'gfast/app/system', 'id', 'className');
INSERT INTO `tools_gen_table_column` VALUES (698, 68, 'demo_born', '出生年月', 'datetime', 'Time', 'DemoBorn', 'demoBorn', '0', '0', '', '1', '1', '1', '', 'EQ', 'datetime', '', 6, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (699, 68, 'demo_gender', '性别', 'tinyint(3) unsigned', 'uint', 'DemoGender', 'demoGender', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 7, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (700, 68, 'created_at', '创建日期', 'datetime', 'Time', 'CreatedAt', 'createdAt', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'datetime', '', 8, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (701, 68, 'updated_at', '修改日期', 'datetime', 'Time', 'UpdatedAt', 'updatedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 9, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (702, 68, 'deleted_at', '删除日期', 'datetime', 'Time', 'DeletedAt', 'deletedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 10, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (703, 68, 'created_by', '创建人', 'bigint(20) unsigned', 'uint64', 'CreatedBy', 'createdBy', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 11, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (704, 68, 'updated_by', '修改人', 'bigint(20) unsigned', 'uint64', 'UpdatedBy', 'updatedBy', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 12, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (705, 68, 'demo_status', '状态', 'tinyint(4)', 'int', 'DemoStatus', 'demoStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 13, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (706, 68, 'demo_cate', '分类', 'varchar(30)', 'string', 'DemoCate', 'demoCate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'checkbox', 'cms_news_type', 14, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (707, 69, 'id', '', 'int(11) unsigned', 'uint', 'Id', 'id', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', '', 1, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (708, 69, 'demo_name', '姓名', 'varchar(20)', 'string', 'DemoName', 'demoName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (709, 69, 'demo_age', '年龄', 'int(10) unsigned', 'uint', 'DemoAge', 'demoAge', '0', '0', '1', '1', '1', '1', '', 'EQ', 'input', '', 3, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (710, 69, 'classes', '班级', 'varchar(30)', 'string', 'Classes', 'classes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'demo_gen_class', 'DemoGenClass', 'gfast/app/system', 'id', 'className');
INSERT INTO `tools_gen_table_column` VALUES (711, 69, 'demo_born', '出生年月', 'datetime', 'Time', 'DemoBorn', 'demoBorn', '0', '0', '', '1', '1', '1', '', 'EQ', 'datetime', '', 5, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (712, 69, 'demo_gender', '性别', 'tinyint(3) unsigned', 'uint', 'DemoGender', 'demoGender', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 6, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (713, 69, 'created_at', '创建日期', 'datetime', 'Time', 'CreatedAt', 'createdAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 7, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (714, 69, 'updated_at', '修改日期', 'datetime', 'Time', 'UpdatedAt', 'updatedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 8, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (715, 69, 'deleted_at', '删除日期', 'datetime', 'Time', 'DeletedAt', 'deletedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 9, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (716, 69, 'created_by', '创建人', 'bigint(20) unsigned', 'uint64', 'CreatedBy', 'createdBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (717, 69, 'updated_by', '修改人', 'bigint(20) unsigned', 'uint64', 'UpdatedBy', 'updatedBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (718, 69, 'demo_status', '状态', 'tinyint(4)', 'int', 'DemoStatus', 'demoStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 12, '', '', '', '', '');
INSERT INTO `tools_gen_table_column` VALUES (719, 69, 'demo_cate', '分类', 'varchar(30)', 'string', 'DemoCate', 'demoCate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'checkbox', 'cms_news_type', 13, '', '', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
