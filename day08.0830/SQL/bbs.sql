DROP DATABASE IF EXISTS bbs;
CREATE DATABASE bbs;
USE bbs;
-- 创建板块表
DROP TABLE IF EXISTS bbs_section;
CREATE TABLE bbs_section(
	sec_id INT auto_increment PRIMARY KEY,
	sec_motto VARCHAR(100) NOT NULL,
	sec_user_id INT 
);
-- 创建用户表[主键，用户名（昵称），密码，email，生日，性别，等级，备注，注册日期，状态，积分]
DROP TABLE IF EXISTS bbs_user;
CREATE TABLE bbs_user(
	user_id INT auto_increment PRIMARY KEY,
	user_name VARCHAR(20) NOT NULL UNIQUE,
	user_password VARCHAR(32) NOT NULL,
	user_email varchar(30) NOT NULL COMMENT '电子邮件',
	user_birthday date,
	user_sex enum('female','male') DEFAULT 'male',
	user_level TINYINT UNSIGNED,
	user_remark VARCHAR(30),
	user_registe_date TIMESTAMP,
	user_status VARCHAR(10),
	user_score INT
);
ALTER TABLE bbs_section ADD CONSTRAINT fk_section_user FOREIGN KEY(sec_user_id) REFERENCES bbs_user(user_id);
-- 创建主贴表[发帖人,发帖表情，标题，内容，发帖的日期，状态(是否置顶-精华)]
DROP TABLE IF EXISTS bbs_topic;
CREATE TABLE bbs_topic(
	topic_id INT auto_increment PRIMARY KEY,
	top_user_id INT NOT NULL,
	topic_phiz VARCHAR(20),
	topic_title VARCHAR(20) NOT NULL,
	topic_content text,
	topic_date TIMESTAMP,
	topic_status TINYINT(1) UNSIGNED COMMENT '状态-是否为精华',
	top_sec_id INT NOT NULL,
	CONSTRAINT fk_topic_user FOREIGN KEY(top_user_id) REFERENCES bbs_user(user_id),
	CONSTRAINT fk_topic_sectioin FOREIGN KEY(top_sec_id) REFERENCES bbs_section(sec_id)
);
-- 创建回帖表[回帖人，回复的主贴，回帖表情，内容，回帖时间]
DROP TABLE IF EXISTS bbs_reply;
CREATE TABLE bbs_reply(
	reply_id INT auto_increment PRIMARY KEY,
	reply_user_id INT NOT NULL,
	reply_topic_id INT NOT NULL,
	reply_phiz VARCHAR(20),
	reply_content VARCHAR(100),
	reply_date TIMESTAMP,
	CONSTRAINT fk_reply_user FOREIGN KEY(reply_user_id) REFERENCES bbs_user(user_id),
	CONSTRAINT fk_reply_topic FOREIGN KEY(reply_topic_id) REFERENCES bbs_topic(topic_id)
);
--  创建权限表[权限名称，资源url]
DROP TABLE IF EXISTS bbs_permission;
CREATE TABLE bbs_permission(
	permission_id int auto_increment PRIMARY KEY,
	permission_name varchar(20) NOT NULL,
	permission_url VARCHAR(100) NOT null
);
-- 角色表[角色名，所拥有的权限]
DROP TABLE IF EXISTS bbs_role;
CREATE TABLE bbs_role(
	role_id int auto_increment PRIMARY KEY,
	role_name VARCHAR(10) NOT NULL
);

--  指定权限和角色之间的关系
DROP TABLE IF EXISTS bbs_permission_role;
CREATE TABLE bbs_permission_role(
	permssion_id INT,
	role_id INT,
	CONSTRAINT fk_permission FOREIGN KEY(permssion_id) REFERENCES bbs_permission(permission_id),
	CONSTRAINT fk_role FOREIGN KEY(role_id) REFERENCES bbs_role(role_id)
);-- 指定角色和用户之间的关系