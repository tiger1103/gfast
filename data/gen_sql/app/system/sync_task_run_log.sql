/*
==========================================================================
GFast自动生成菜单SQL,只生成一次,按需修改.
生成日期：2021-10-20 17:04:29
生成路径: data/gen_sql/system/sync_task_run_log_menu.sql
生成人：happyown
==========================================================================
*/
-- 当前日期
select @now := now();
-- 目录 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(0,'system/syncTaskRunLog','管理','form','','管理',0,0,1,1,'syncTaskRunLog','','',0,'sys_admin',0,@now,@now,NULL );
-- 菜单父目录ID
SELECT @parentId := LAST_INSERT_ID();
-- 菜单 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/syncTaskRunLog/list','列表','list','','列表',1,0,1,1,'syncTaskRunLogList','','system/syncTaskRunLog/list',0,'sys_admin',0,@now,@now,NULL );
-- 按钮父目录ID
SELECT @parentId := LAST_INSERT_ID();
-- 按钮 SQL
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/syncTaskRunLog/get','查询','','','查询',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/syncTaskRunLog/add','添加','','','添加',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/syncTaskRunLog/edit','修改','','','修改',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
INSERT INTO `sys_auth_rule` (`pid`,`name`,`title`,`icon`,`condition`,`remark`,`menu_type`,`weigh`,`status`,`always_show`,`path`,`jump_path`,`component`,`is_frame`,`module_type`,`model_id`,`created_at`,`updated_at`,`deleted_at` )
VALUES(@parentId,'system/syncTaskRunLog/delete','删除','','','删除',2,0,1,1,'','','',0,'sys_admin',0,@now,@now,NULL );
