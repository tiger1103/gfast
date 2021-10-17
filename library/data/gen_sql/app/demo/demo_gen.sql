/*
==========================================================================
GFast自动生成菜单SQL,只生成一次,按需修改.
生成日期：2021-09-19 09:44:19
生成路径: data/gen_sql/demo/demo_gen_menu.sql
生成人：gfast
==========================================================================
*/
-- 当前日期
select @now := now();
-- 目录 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(0,'demo/demoGen','学生管理','form','','学生管理',0,0,1,1,'demoGen','','',0,'sys_admin',0,@now,@now,NULL );
-- 菜单父目录ID
SELECT @parentId := LAST_INSERT_ID();
-- 菜单 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'demo/demoGen/list','学生列表','list','','学生列表',1,0,1,1,'demoGenList','','demo/demoGen/list',0,'sys_admin',0,@now,@now,NULL );
-- 按钮父目录ID
SELECT @parentId := LAST_INSERT_ID();
-- 按钮 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'demo/demoGen/get','学生查询','','','学生查询',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'demo/demoGen/add','学生添加','','','学生添加',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'demo/demoGen/edit','学生修改','','','学生修改',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'demo/demoGen/delete','学生删除','','','学生删除',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'demo/demoGen/changeDemoStatus','学生状态修改','','','学生状态修改',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
