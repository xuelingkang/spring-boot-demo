/*
Navicat MySQL Data Transfer

Source Server         : server02
Source Server Version : 50726
Source Host           : server02:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-05-14 11:44:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('clusteredScheduler', 'server011557804958188', '1557805474228', '10000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for t_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '附件名称',
  `attachment_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '访问地址',
  `attachment_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '本地路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for t_broadcast_message
-- ----------------------------
DROP TABLE IF EXISTS `t_broadcast_message`;
CREATE TABLE `t_broadcast_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息内容',
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送用户id',
  PRIMARY KEY (`id`),
  KEY `t_broadcast_message_fk_send_user_id` (`send_user_id`),
  CONSTRAINT `t_broadcast_message_fk_send_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_broadcast_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_message`;
CREATE TABLE `t_chat_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息内容',
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送用户id',
  `to_user_id` int(11) DEFAULT NULL COMMENT '接收用户id',
  `read_status` tinyint(1) DEFAULT NULL COMMENT '阅读状态，1已读，0未读',
  PRIMARY KEY (`id`),
  KEY `t_single_message_fk_send_user_id` (`send_user_id`),
  KEY `t_single_message_fk_to_user_id` (`to_user_id`),
  CONSTRAINT `t_single_message_fk_send_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_single_message_fk_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_chat_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门名称',
  `level` int(2) DEFAULT NULL COMMENT '部门等级',
  `pid` int(11) DEFAULT NULL COMMENT '上级部门id',
  `seq` int(5) DEFAULT NULL COMMENT '顺序',
  `full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '全名',
  PRIMARY KEY (`id`),
  KEY `t_dept_fk_pid` (`pid`),
  KEY `t_dept_idx_seq` (`seq`),
  CONSTRAINT `t_dept_fk_pid` FOREIGN KEY (`pid`) REFERENCES `t_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '公司', '1', null, '100', '公司');
INSERT INTO `t_dept` VALUES ('2', '人资行政部', '2', '1', '100', '公司-人资行政部');
INSERT INTO `t_dept` VALUES ('3', '财务部', '2', '1', '200', '公司-财务部');
INSERT INTO `t_dept` VALUES ('4', '市场部', '2', '1', '300', '公司-市场部');
INSERT INTO `t_dept` VALUES ('5', '技术部', '2', '1', '400', '公司-技术部');
INSERT INTO `t_dept` VALUES ('6', '人事部', '3', '2', '100', '公司-人资行政部-人事部');
INSERT INTO `t_dept` VALUES ('7', '行政部', '3', '2', '200', '公司-人资行政部-行政部');
INSERT INTO `t_dept` VALUES ('8', '产品部', '3', '5', '100', '公司-技术部-产品部');
INSERT INTO `t_dept` VALUES ('9', '开发部', '3', '5', '200', '公司-技术部-开发部');
INSERT INTO `t_dept` VALUES ('10', '运维部', '3', '5', '300', '公司-技术部-运维部');
INSERT INTO `t_dept` VALUES ('11', '测试部', '3', '5', '400', '公司-技术部-测试部');
INSERT INTO `t_dept` VALUES ('12', '销售部', '3', '4', '100', '公司-市场部-销售部');
INSERT INTO `t_dept` VALUES ('13', '售后部', '3', '4', '200', '公司-市场部-售后部');
INSERT INTO `t_dept` VALUES ('14', '客服部', '3', '4', '300', '公司-市场部-客服部');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务描述',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `cron_expression` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'cron表达式',
  `job_template_id` int(11) DEFAULT NULL COMMENT '任务模板id',
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '调度器名称',
  `job_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务组',
  `trigger_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '触发器名称',
  `trigger_group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '触发器组',
  PRIMARY KEY (`id`),
  KEY `t_job_fk_job_template_id` (`job_template_id`),
  CONSTRAINT `t_job_fk_job_template_id` FOREIGN KEY (`job_template_id`) REFERENCES `t_job_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_job
-- ----------------------------

-- ----------------------------
-- Table structure for t_job_parameter
-- ----------------------------
DROP TABLE IF EXISTS `t_job_parameter`;
CREATE TABLE `t_job_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数名称',
  `parameter_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数值',
  `job_id` int(11) DEFAULT NULL COMMENT '定时任务id',
  PRIMARY KEY (`id`),
  KEY `t_job_parameter_fk_job_id` (`job_id`),
  CONSTRAINT `t_job_parameter_fk_job_id` FOREIGN KEY (`job_id`) REFERENCES `t_job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_job_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for t_job_template
-- ----------------------------
DROP TABLE IF EXISTS `t_job_template`;
CREATE TABLE `t_job_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务名称',
  `job_class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'org.quartz.Job的实现类或org.springframework.scheduling.quartz.QuartzJobBean的子类',
  `job_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_job_template
-- ----------------------------
INSERT INTO `t_job_template` VALUES ('2', '测试', 'com.example.job.TestJob', '测试更新定时任务模板');
INSERT INTO `t_job_template` VALUES ('7', '打印指定用户信息', 'com.example.job.LogUserJob', '打印指定用户信息');

-- ----------------------------
-- Table structure for t_job_template_parameter
-- ----------------------------
DROP TABLE IF EXISTS `t_job_template_parameter`;
CREATE TABLE `t_job_template_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数名称',
  `parameter_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数类型',
  `parameter_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数描述',
  `job_template_id` int(11) DEFAULT NULL COMMENT '任务模板id',
  PRIMARY KEY (`id`),
  KEY `t_job_template_parameter_fk_job_template_id` (`job_template_id`),
  CONSTRAINT `t_job_template_parameter_fk_job_template_id` FOREIGN KEY (`job_template_id`) REFERENCES `t_job_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_job_template_parameter
-- ----------------------------
INSERT INTO `t_job_template_parameter` VALUES ('3', 'name', 'string', '字符串参数', '2');
INSERT INTO `t_job_template_parameter` VALUES ('4', 'age', 'int', '整数参数', '2');
INSERT INTO `t_job_template_parameter` VALUES ('5', 'weight', 'float', '浮点参数', '2');
INSERT INTO `t_job_template_parameter` VALUES ('7', 'username', 'string', '用户名', '7');

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_subject` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮件标题',
  `mail_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮件类型',
  `mail_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮件状态',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送用户id',
  `to_user_id` int(11) DEFAULT NULL COMMENT '接收用户id',
  PRIMARY KEY (`id`),
  KEY `t_mail_fk_send_user_id` (`send_user_id`),
  KEY `t_mail_fk_to_user_id` (`to_user_id`),
  CONSTRAINT `t_mail_fk_send_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_mail_fk_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail
-- ----------------------------

-- ----------------------------
-- Table structure for t_mail_attachment_link
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_attachment_link`;
CREATE TABLE `t_mail_attachment_link` (
  `mail_id` int(11) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  PRIMARY KEY (`mail_id`,`attachment_id`),
  KEY `t_mail_attachment_link_fk_attachment_id` (`attachment_id`),
  CONSTRAINT `t_mail_attachment_link_fk_attachment_id` FOREIGN KEY (`attachment_id`) REFERENCES `t_attachment` (`id`),
  CONSTRAINT `t_mail_attachment_link_fk_mail_id` FOREIGN KEY (`mail_id`) REFERENCES `t_mail` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail_attachment_link
-- ----------------------------

-- ----------------------------
-- Table structure for t_mail_content
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_content`;
CREATE TABLE `t_mail_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '邮件内容',
  `mail_id` int(11) DEFAULT NULL COMMENT '邮件id',
  PRIMARY KEY (`id`),
  KEY `t_mail_content_fk_mail_id` (`mail_id`),
  CONSTRAINT `t_mail_content_fk_mail_id` FOREIGN KEY (`mail_id`) REFERENCES `t_mail` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail_content
-- ----------------------------

-- ----------------------------
-- Table structure for t_mail_to_user_link
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_to_user_link`;
CREATE TABLE `t_mail_to_user_link` (
  `mail_id` int(11) NOT NULL COMMENT '邮件id',
  `to_user_id` int(11) NOT NULL COMMENT '接收用户id',
  PRIMARY KEY (`mail_id`,`to_user_id`),
  KEY `t_mail_to_user_link_fk_to_user_id` (`to_user_id`),
  CONSTRAINT `t_mail_to_user_link_fk_mail_id` FOREIGN KEY (`mail_id`) REFERENCES `t_mail` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_mail_to_user_link_fk_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail_to_user_link
-- ----------------------------

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源类型',
  `resource_pattern` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源pattern',
  `resource_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求方法',
  `resource_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('1', 'http', '/attachment/*/*', 'GET', '附件列表');
INSERT INTO `t_resource` VALUES ('2', 'http', '/attachment/*', 'GET', '附件详情');
INSERT INTO `t_resource` VALUES ('3', 'http', '/attachment/*', 'DELETE', '删除附件');
INSERT INTO `t_resource` VALUES ('4', 'http', '/dept/*/*', 'GET', '部门列表');
INSERT INTO `t_resource` VALUES ('5', 'http', '/dept/*', 'GET', '部门详情');
INSERT INTO `t_resource` VALUES ('6', 'http', '/dept', 'POST', '保存部门');
INSERT INTO `t_resource` VALUES ('7', 'http', '/dept', 'PUT', '更新部门');
INSERT INTO `t_resource` VALUES ('8', 'http', '/dept/*', 'DELETE', '删除部门');
INSERT INTO `t_resource` VALUES ('9', 'http', '/file/*/*', 'POST', '上传文件');
INSERT INTO `t_resource` VALUES ('10', 'http', '/resource/*/*', 'GET', '资源列表');
INSERT INTO `t_resource` VALUES ('11', 'http', '/resource/*', 'GET', '资源详情');
INSERT INTO `t_resource` VALUES ('12', 'http', '/resource', 'POST', '保存资源');
INSERT INTO `t_resource` VALUES ('13', 'http', '/resource', 'PUT', '更新资源');
INSERT INTO `t_resource` VALUES ('14', 'http', '/resource/*', 'DELETE', '删除资源');
INSERT INTO `t_resource` VALUES ('15', 'http', '/role/*/*', 'GET', '角色列表');
INSERT INTO `t_resource` VALUES ('16', 'http', '/role/*', 'GET', '角色详情');
INSERT INTO `t_resource` VALUES ('17', 'http', '/role', 'POST', '保存角色');
INSERT INTO `t_resource` VALUES ('18', 'http', '/role', 'PUT', '更新角色');
INSERT INTO `t_resource` VALUES ('19', 'http', '/role/*', 'DELETE', '删除角色');
INSERT INTO `t_resource` VALUES ('20', 'http', '/user/*/*', 'GET', '用户列表');
INSERT INTO `t_resource` VALUES ('21', 'http', '/user/*', 'GET', '用户详情');
INSERT INTO `t_resource` VALUES ('22', 'http', '/user', 'POST', '保存用户');
INSERT INTO `t_resource` VALUES ('23', 'http', '/user', 'PUT', '更新用户');
INSERT INTO `t_resource` VALUES ('24', 'http', '/user/*', 'DELETE', '删除用户');
INSERT INTO `t_resource` VALUES ('25', 'http', '/endpoint/**', null, '获取websocket信息及握手');
INSERT INTO `t_resource` VALUES ('26', 'websocket', '/topic/broadcast', 'SUBSCRIBE', '订阅广播消息');
INSERT INTO `t_resource` VALUES ('28', 'http', '/broadcast', 'POST', '发送广播消息');
INSERT INTO `t_resource` VALUES ('29', 'http', '/broadcast/*/*', 'GET', '广播列表');
INSERT INTO `t_resource` VALUES ('30', 'http', '/broadcast/*', 'GET', '广播详情');
INSERT INTO `t_resource` VALUES ('31', 'http', '/chat/*/*', 'GET', '消息列表');
INSERT INTO `t_resource` VALUES ('32', 'http', '/chat/*', 'GET', '消息详情');
INSERT INTO `t_resource` VALUES ('33', 'http', '/chat/*/*/*/*', 'GET', '往来消息');
INSERT INTO `t_resource` VALUES ('34', 'http', '/chat', 'PUT', '更新消息');
INSERT INTO `t_resource` VALUES ('35', 'http', '/chat', 'POST', '发送点对点消息');
INSERT INTO `t_resource` VALUES ('36', 'websocket', '/user/topic/chat', 'SUBSCRIBE', '订阅点对点消息');
INSERT INTO `t_resource` VALUES ('39', 'http', '/jobTemplate/*/*', 'GET', '任务模板列表');
INSERT INTO `t_resource` VALUES ('40', 'http', '/jobTemplate/*', 'GET', '任务模板详情');
INSERT INTO `t_resource` VALUES ('41', 'http', '/jobTemplate', 'POST', '保存任务模板');
INSERT INTO `t_resource` VALUES ('42', 'http', '/jobTemplate', 'PUT', '更新任务模板');
INSERT INTO `t_resource` VALUES ('43', 'http', '/jobTemplate/*', 'DELETE', '删除任务模板');
INSERT INTO `t_resource` VALUES ('44', 'http', '/job/*/*', 'GET', '定时任务列表');
INSERT INTO `t_resource` VALUES ('45', 'http', '/job/*', 'GET', '定时任务详情');
INSERT INTO `t_resource` VALUES ('46', 'http', '/job', 'POST', '保存定时任务');
INSERT INTO `t_resource` VALUES ('47', 'http', '/job', 'PUT', '更新定时任务');
INSERT INTO `t_resource` VALUES ('48', 'http', '/job/*', 'DELETE', '删除定时任务');
INSERT INTO `t_resource` VALUES ('49', 'http', '/job/pause/*', 'PATCH', '暂停定时任务');
INSERT INTO `t_resource` VALUES ('50', 'http', '/job/resume/*', 'PATCH', '恢复定时任务');
INSERT INTO `t_resource` VALUES ('51', 'http', '/mail/*/*', 'GET', '邮件列表');
INSERT INTO `t_resource` VALUES ('52', 'http', '/mail/*', 'GET', '邮件详情');
INSERT INTO `t_resource` VALUES ('53', 'http', '/mail', 'POST', '保存邮件');
INSERT INTO `t_resource` VALUES ('54', 'http', '/mail', 'PUT', '更新邮件');
INSERT INTO `t_resource` VALUES ('55', 'http', '/mail/*', 'PATCH', '发送邮件');
INSERT INTO `t_resource` VALUES ('56', 'http', '/mail/*', 'DELETE', '删除邮件');
INSERT INTO `t_resource` VALUES ('57', 'http', '/userinfo', 'GET', '查询个人信息');
INSERT INTO `t_resource` VALUES ('59', 'http', '/userinfo', 'PUT', '更新个人信息');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_role_idx_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ROLE_ADMIN', '管理员');
INSERT INTO `t_role` VALUES ('2', 'ROLE_MANAGER', '总经理');
INSERT INTO `t_role` VALUES ('3', 'ROLE_FINANCE', '财务');
INSERT INTO `t_role` VALUES ('4', 'ROLE_HR', '人资');
INSERT INTO `t_role` VALUES ('5', 'ROLE_STAFF', '员工');
INSERT INTO `t_role` VALUES ('6', 'ROLE_LOGIN', '登录用户');
INSERT INTO `t_role` VALUES ('7', 'ROLE_GUEST', '游客');

-- ----------------------------
-- Table structure for t_role_resource_link
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource_link`;
CREATE TABLE `t_role_resource_link` (
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `t_role_resource_link_fk_resource_id` (`resource_id`),
  CONSTRAINT `t_role_resource_link_fk_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `t_resource` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_role_resource_link_fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_role_resource_link
-- ----------------------------
INSERT INTO `t_role_resource_link` VALUES ('1', '1');
INSERT INTO `t_role_resource_link` VALUES ('5', '1');
INSERT INTO `t_role_resource_link` VALUES ('6', '1');
INSERT INTO `t_role_resource_link` VALUES ('1', '2');
INSERT INTO `t_role_resource_link` VALUES ('5', '2');
INSERT INTO `t_role_resource_link` VALUES ('6', '2');
INSERT INTO `t_role_resource_link` VALUES ('1', '3');
INSERT INTO `t_role_resource_link` VALUES ('1', '4');
INSERT INTO `t_role_resource_link` VALUES ('2', '4');
INSERT INTO `t_role_resource_link` VALUES ('4', '4');
INSERT INTO `t_role_resource_link` VALUES ('5', '4');
INSERT INTO `t_role_resource_link` VALUES ('6', '4');
INSERT INTO `t_role_resource_link` VALUES ('7', '4');
INSERT INTO `t_role_resource_link` VALUES ('1', '5');
INSERT INTO `t_role_resource_link` VALUES ('2', '5');
INSERT INTO `t_role_resource_link` VALUES ('4', '5');
INSERT INTO `t_role_resource_link` VALUES ('5', '5');
INSERT INTO `t_role_resource_link` VALUES ('6', '5');
INSERT INTO `t_role_resource_link` VALUES ('1', '6');
INSERT INTO `t_role_resource_link` VALUES ('2', '6');
INSERT INTO `t_role_resource_link` VALUES ('4', '6');
INSERT INTO `t_role_resource_link` VALUES ('1', '7');
INSERT INTO `t_role_resource_link` VALUES ('2', '7');
INSERT INTO `t_role_resource_link` VALUES ('4', '7');
INSERT INTO `t_role_resource_link` VALUES ('1', '8');
INSERT INTO `t_role_resource_link` VALUES ('2', '8');
INSERT INTO `t_role_resource_link` VALUES ('4', '8');
INSERT INTO `t_role_resource_link` VALUES ('1', '9');
INSERT INTO `t_role_resource_link` VALUES ('3', '9');
INSERT INTO `t_role_resource_link` VALUES ('5', '9');
INSERT INTO `t_role_resource_link` VALUES ('1', '10');
INSERT INTO `t_role_resource_link` VALUES ('2', '10');
INSERT INTO `t_role_resource_link` VALUES ('4', '10');
INSERT INTO `t_role_resource_link` VALUES ('5', '10');
INSERT INTO `t_role_resource_link` VALUES ('1', '11');
INSERT INTO `t_role_resource_link` VALUES ('2', '11');
INSERT INTO `t_role_resource_link` VALUES ('4', '11');
INSERT INTO `t_role_resource_link` VALUES ('5', '11');
INSERT INTO `t_role_resource_link` VALUES ('1', '12');
INSERT INTO `t_role_resource_link` VALUES ('2', '12');
INSERT INTO `t_role_resource_link` VALUES ('4', '12');
INSERT INTO `t_role_resource_link` VALUES ('1', '13');
INSERT INTO `t_role_resource_link` VALUES ('2', '13');
INSERT INTO `t_role_resource_link` VALUES ('4', '13');
INSERT INTO `t_role_resource_link` VALUES ('1', '14');
INSERT INTO `t_role_resource_link` VALUES ('2', '14');
INSERT INTO `t_role_resource_link` VALUES ('4', '14');
INSERT INTO `t_role_resource_link` VALUES ('1', '15');
INSERT INTO `t_role_resource_link` VALUES ('2', '15');
INSERT INTO `t_role_resource_link` VALUES ('4', '15');
INSERT INTO `t_role_resource_link` VALUES ('5', '15');
INSERT INTO `t_role_resource_link` VALUES ('1', '16');
INSERT INTO `t_role_resource_link` VALUES ('2', '16');
INSERT INTO `t_role_resource_link` VALUES ('4', '16');
INSERT INTO `t_role_resource_link` VALUES ('5', '16');
INSERT INTO `t_role_resource_link` VALUES ('1', '17');
INSERT INTO `t_role_resource_link` VALUES ('2', '17');
INSERT INTO `t_role_resource_link` VALUES ('4', '17');
INSERT INTO `t_role_resource_link` VALUES ('1', '18');
INSERT INTO `t_role_resource_link` VALUES ('2', '18');
INSERT INTO `t_role_resource_link` VALUES ('4', '18');
INSERT INTO `t_role_resource_link` VALUES ('1', '19');
INSERT INTO `t_role_resource_link` VALUES ('2', '19');
INSERT INTO `t_role_resource_link` VALUES ('4', '19');
INSERT INTO `t_role_resource_link` VALUES ('1', '20');
INSERT INTO `t_role_resource_link` VALUES ('2', '20');
INSERT INTO `t_role_resource_link` VALUES ('3', '20');
INSERT INTO `t_role_resource_link` VALUES ('4', '20');
INSERT INTO `t_role_resource_link` VALUES ('5', '20');
INSERT INTO `t_role_resource_link` VALUES ('1', '21');
INSERT INTO `t_role_resource_link` VALUES ('2', '21');
INSERT INTO `t_role_resource_link` VALUES ('3', '21');
INSERT INTO `t_role_resource_link` VALUES ('4', '21');
INSERT INTO `t_role_resource_link` VALUES ('5', '21');
INSERT INTO `t_role_resource_link` VALUES ('1', '22');
INSERT INTO `t_role_resource_link` VALUES ('2', '22');
INSERT INTO `t_role_resource_link` VALUES ('4', '22');
INSERT INTO `t_role_resource_link` VALUES ('1', '23');
INSERT INTO `t_role_resource_link` VALUES ('2', '23');
INSERT INTO `t_role_resource_link` VALUES ('4', '23');
INSERT INTO `t_role_resource_link` VALUES ('6', '23');
INSERT INTO `t_role_resource_link` VALUES ('1', '24');
INSERT INTO `t_role_resource_link` VALUES ('2', '24');
INSERT INTO `t_role_resource_link` VALUES ('4', '24');
INSERT INTO `t_role_resource_link` VALUES ('1', '25');
INSERT INTO `t_role_resource_link` VALUES ('1', '26');
INSERT INTO `t_role_resource_link` VALUES ('1', '28');
INSERT INTO `t_role_resource_link` VALUES ('1', '29');
INSERT INTO `t_role_resource_link` VALUES ('1', '30');
INSERT INTO `t_role_resource_link` VALUES ('1', '31');
INSERT INTO `t_role_resource_link` VALUES ('1', '32');
INSERT INTO `t_role_resource_link` VALUES ('1', '33');
INSERT INTO `t_role_resource_link` VALUES ('1', '34');
INSERT INTO `t_role_resource_link` VALUES ('1', '35');
INSERT INTO `t_role_resource_link` VALUES ('1', '36');
INSERT INTO `t_role_resource_link` VALUES ('1', '39');
INSERT INTO `t_role_resource_link` VALUES ('1', '40');
INSERT INTO `t_role_resource_link` VALUES ('1', '41');
INSERT INTO `t_role_resource_link` VALUES ('1', '42');
INSERT INTO `t_role_resource_link` VALUES ('1', '43');
INSERT INTO `t_role_resource_link` VALUES ('1', '44');
INSERT INTO `t_role_resource_link` VALUES ('1', '45');
INSERT INTO `t_role_resource_link` VALUES ('1', '46');
INSERT INTO `t_role_resource_link` VALUES ('1', '47');
INSERT INTO `t_role_resource_link` VALUES ('1', '48');
INSERT INTO `t_role_resource_link` VALUES ('1', '49');
INSERT INTO `t_role_resource_link` VALUES ('1', '50');
INSERT INTO `t_role_resource_link` VALUES ('1', '51');
INSERT INTO `t_role_resource_link` VALUES ('1', '52');
INSERT INTO `t_role_resource_link` VALUES ('1', '53');
INSERT INTO `t_role_resource_link` VALUES ('1', '54');
INSERT INTO `t_role_resource_link` VALUES ('1', '55');
INSERT INTO `t_role_resource_link` VALUES ('1', '56');
INSERT INTO `t_role_resource_link` VALUES ('6', '57');
INSERT INTO `t_role_resource_link` VALUES ('6', '59');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `birth` date DEFAULT NULL COMMENT '生日',
  `logintime` timestamp NULL DEFAULT NULL COMMENT '登陆时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_user_idx_username` (`username`),
  UNIQUE KEY `t_user_uk_email` (`email`),
  KEY `t_user_fk_dept_id` (`dept_id`),
  CONSTRAINT `t_user_fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `t_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('9', 'admin', '$2a$10$3.pkW2p6bN8pBw8Ds/piruq7LK7LhckVc5gxuhI0UyiMKjW8Tb0DO', 'xuelingkang@163.com', '薛凌康', '1990-10-14', null, '1');

-- ----------------------------
-- Table structure for t_user_role_link
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_link`;
CREATE TABLE `t_user_role_link` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `t_user_role_link_fk_role_id` (`role_id`),
  CONSTRAINT `t_user_role_link_fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_user_role_link_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user_role_link
-- ----------------------------
INSERT INTO `t_user_role_link` VALUES ('9', '1');
INSERT INTO `t_user_role_link` VALUES ('9', '6');

-- ----------------------------
-- View structure for t_mail_to_users
-- ----------------------------
DROP VIEW IF EXISTS `t_mail_to_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `t_mail_to_users` AS select `t_mail_to_user_link`.`mail_id` AS `mail_id`,group_concat(`t_user`.`username` separator ',') AS `info` from (`t_mail_to_user_link` left join `t_user` on((`t_user`.`id` = `t_mail_to_user_link`.`to_user_id`))) group by `t_mail_to_user_link`.`mail_id` ;
