/*
==========================================================================
GFast自动生成菜单SQL,只生成一次,按需修改.
生成日期：2021-09-19 09:44:19
生成路径: data/gen_sql/system/demo_gen_class_menu.sql
生成人：gfast
==========================================================================
*/
-- 当前日期
select @now := now();
-- 目录 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(0,'system/demoGenClass','班级管理','form','','班级管理',0,0,1,1,'demoGenClass','','',0,'sys_admin',0,@now,@now,NULL );
-- 菜单父目录ID
SELECT @parentId := LAST_INSERT_ID();
-- 菜单 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/demoGenClass/list','班级列表','list','','班级列表',1,0,1,1,'demoGenClassList','','system/demoGenClass/list',0,'sys_admin',0,@now,@now,NULL );
-- 按钮父目录ID
SELECT @parentId := LAST_INSERT_ID();
-- 按钮 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/demoGenClass/get','班级查询','','','班级查询',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/demoGenClass/add','班级添加','','','班级添加',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/demoGenClass/edit','班级修改','','','班级修改',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/demoGenClass/delete','班级删除','','','班级删除',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
