/*
Navicat MySQL Data Transfer

Source Server         : server02
Source Server Version : 50726
Source Host           : server02:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-05-23 19:06:14
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
INSERT INTO `qrtz_locks` VALUES ('clusteredScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('clusteredScheduler', 'TRIGGER_ACCESS');

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
INSERT INTO `qrtz_scheduler_state` VALUES ('clusteredScheduler', 'server011558598237500', '1558609576555', '10000');

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
INSERT INTO `t_attachment` VALUES ('1', '1024x768.jpg', '/demofile/head/2019/5/1558592894759.jpg', '/home/demofile/head/2019/5/1558592894759.jpg');
INSERT INTO `t_attachment` VALUES ('2', '1920.jpg', '/demofile/head/2019/5/1558594752112.jpg', '/home/demofile/head/2019/5/1558594752112.jpg');
INSERT INTO `t_attachment` VALUES ('3', '1920.jpg', '/demofile/head/2019/5/1558594771808.jpg', '/home/demofile/head/2019/5/1558594771808.jpg');
INSERT INTO `t_attachment` VALUES ('4', '1440x900.jpg', '/demofile/head/2019/5/1558594803113.jpg', '/home/demofile/head/2019/5/1558594803113.jpg');
INSERT INTO `t_attachment` VALUES ('8', '1024x768.jpg', '/demofile/head/2019/5/1558604442885.jpg', '/home/demofile/head/2019/5/1558604442885.jpg');
INSERT INTO `t_attachment` VALUES ('9', '1920.jpg', '/demofile/head/2019/5/1558604517359.jpg', '/home/demofile/head/2019/5/1558604517359.jpg');
INSERT INTO `t_attachment` VALUES ('10', '1920.jpg', '/demofile/head/2019/5/1558604654757.jpg', '/home/demofile/head/2019/5/1558604654757.jpg');
INSERT INTO `t_attachment` VALUES ('11', '1920.jpg', '/demofile/head/2019/5/1558605150612.jpg', '/home/demofile/head/2019/5/1558605150612.jpg');
INSERT INTO `t_attachment` VALUES ('12', '1920.jpg', '/demofile/head/2019/5/1558605400218.jpg', '/home/demofile/head/2019/5/1558605400218.jpg');
INSERT INTO `t_attachment` VALUES ('13', '1440x900.jpg', '/demofile/head/2019/5/1558605607651.jpg', '/home/demofile/head/2019/5/1558605607651.jpg');
INSERT INTO `t_attachment` VALUES ('14', '1920.jpg', '/demofile/head/2019/5/1558605782432.jpg', '/home/demofile/head/2019/5/1558605782432.jpg');
INSERT INTO `t_attachment` VALUES ('15', '1280x1024.jpg', '/demofile/head/2019/5/1558605856221.jpg', '/home/demofile/head/2019/5/1558605856221.jpg');
INSERT INTO `t_attachment` VALUES ('16', '1024x768.jpg', '/demofile/head/2019/5/1558606483239.jpg', '/home/demofile/head/2019/5/1558606483239.jpg');
INSERT INTO `t_attachment` VALUES ('17', '1024x768.jpg', '/demofile/head/2019/5/1558607031760.jpg', '/home/demofile/head/2019/5/1558607031760.jpg');
INSERT INTO `t_attachment` VALUES ('18', '1024x768.jpg', '/demofile/head/2019/5/1558607518800.jpg', '/home/demofile/head/2019/5/1558607518800.jpg');
INSERT INTO `t_attachment` VALUES ('19', '1440x900.jpg', '/demofile/head/2019/5/1558607525299.jpg', '/home/demofile/head/2019/5/1558607525299.jpg');
INSERT INTO `t_attachment` VALUES ('20', '1024x768.jpg', '/demofile/head/2019/5/1558607636678.jpg', '/home/demofile/head/2019/5/1558607636678.jpg');
INSERT INTO `t_attachment` VALUES ('21', '1920.jpg', '/demofile/head/2019/5/1558607659510.jpg', '/home/demofile/head/2019/5/1558607659510.jpg');
INSERT INTO `t_attachment` VALUES ('22', '1024x768.jpg', '/demofile/head/2019/5/1558607761017.jpg', '/home/demofile/head/2019/5/1558607761017.jpg');
INSERT INTO `t_attachment` VALUES ('23', '1920.jpg', '/demofile/head/2019/5/1558607861553.jpg', '/home/demofile/head/2019/5/1558607861553.jpg');
INSERT INTO `t_attachment` VALUES ('24', '1024x768.jpg', '/demofile/head/2019/5/1558607943660.jpg', '/home/demofile/head/2019/5/1558607943660.jpg');
INSERT INTO `t_attachment` VALUES ('25', '1920.jpg', '/demofile/head/2019/5/1558607951714.jpg', '/home/demofile/head/2019/5/1558607951714.jpg');
INSERT INTO `t_attachment` VALUES ('26', '1920.jpg', '/demofile/head/2019/5/1558608009252.jpg', '/home/demofile/head/2019/5/1558608009252.jpg');
INSERT INTO `t_attachment` VALUES ('27', '1024x768.jpg', '/demofile/head/2019/5/1558608322061.jpg', '/home/demofile/head/2019/5/1558608322061.jpg');
INSERT INTO `t_attachment` VALUES ('28', '1920.jpg', '/demofile/head/2019/5/1558608424839.jpg', '/home/demofile/head/2019/5/1558608424839.jpg');
INSERT INTO `t_attachment` VALUES ('29', '1024x768.jpg', '/demofile/head/2019/5/1558608508890.jpg', '/home/demofile/head/2019/5/1558608508890.jpg');
INSERT INTO `t_attachment` VALUES ('30', '1440x900.jpg', '/demofile/head/2019/5/1558608512246.jpg', '/home/demofile/head/2019/5/1558608512246.jpg');
INSERT INTO `t_attachment` VALUES ('31', '1920.jpg', '/demofile/head/2019/5/1558608552197.jpg', '/home/demofile/head/2019/5/1558608552197.jpg');
INSERT INTO `t_attachment` VALUES ('32', '1024x768.jpg', '/demofile/head/2019/5/1558608801937.jpg', '/home/demofile/head/2019/5/1558608801937.jpg');
INSERT INTO `t_attachment` VALUES ('33', '1920.jpg', '/demofile/head/2019/5/1558608804436.jpg', '/home/demofile/head/2019/5/1558608804436.jpg');
INSERT INTO `t_attachment` VALUES ('34', '1440x900.jpg', '/demofile/head/2019/5/1558608807078.jpg', '/home/demofile/head/2019/5/1558608807078.jpg');
INSERT INTO `t_attachment` VALUES ('35', '1280x1024.jpg', '/demofile/head/2019/5/1558608810016.jpg', '/home/demofile/head/2019/5/1558608810016.jpg');
INSERT INTO `t_attachment` VALUES ('36', '1920.jpg', '/demofile/head/2019/5/1558608852590.jpg', '/home/demofile/head/2019/5/1558608852590.jpg');
INSERT INTO `t_attachment` VALUES ('37', '1920.jpg', '/demofile/head/2019/5/1558608983064.jpg', '/home/demofile/head/2019/5/1558608983064.jpg');

-- ----------------------------
-- Table structure for t_broadcast_message
-- ----------------------------
DROP TABLE IF EXISTS `t_broadcast_message`;
CREATE TABLE `t_broadcast_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_time` bigint(20) DEFAULT NULL COMMENT '发送时间',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息内容',
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送用户id',
  PRIMARY KEY (`id`),
  KEY `t_broadcast_message_fk_send_user_id` (`send_user_id`),
  CONSTRAINT `t_broadcast_message_fk_send_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_broadcast_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_message`;
CREATE TABLE `t_chat_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_time` bigint(20) DEFAULT NULL COMMENT '发送时间',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息内容',
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送用户id',
  `to_user_id` int(11) DEFAULT NULL COMMENT '接收用户id',
  `read_status` tinyint(1) DEFAULT NULL COMMENT '阅读状态，1已读，0未读',
  PRIMARY KEY (`id`),
  KEY `t_single_message_fk_send_user_id` (`send_user_id`),
  KEY `t_single_message_fk_to_user_id` (`to_user_id`),
  CONSTRAINT `t_single_message_fk_send_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_single_message_fk_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `start_time` bigint(20) DEFAULT NULL COMMENT '开始时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '结束时间',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `send_time` bigint(20) DEFAULT NULL COMMENT '发送时间',
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送用户id',
  PRIMARY KEY (`id`),
  KEY `t_mail_fk_send_user_id` (`send_user_id`),
  CONSTRAINT `t_mail_fk_send_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail
-- ----------------------------
INSERT INTO `t_mail` VALUES ('4', 'REACT中后台找回密码', 'info', 'sent', '20190514185130', '20190514185205', null);
INSERT INTO `t_mail` VALUES ('5', 'REACT中后台找回密码', 'info', 'sent', '20190514190358', '20190514190426', null);
INSERT INTO `t_mail` VALUES ('7', 'REACT中后台找回密码', 'info', 'sent', '20190514220549', '20190514220551', null);
INSERT INTO `t_mail` VALUES ('9', 'REACT中后台找回密码', 'info', 'sent', '20190514221712', '20190514221715', null);
INSERT INTO `t_mail` VALUES ('10', 'REACT中后台找回密码', 'info', 'sent', '20190514224011', '20190514224014', null);
INSERT INTO `t_mail` VALUES ('13', 'REACT中后台找回密码', 'info', 'sent', '20190515004755', '20190515004757', null);
INSERT INTO `t_mail` VALUES ('14', 'REACT中后台找回密码', 'info', 'sent', '20190515004938', '20190515004939', null);
INSERT INTO `t_mail` VALUES ('15', 'REACT中后台找回密码', 'info', 'sent', '20190515004948', '20190515004948', null);
INSERT INTO `t_mail` VALUES ('16', 'REACT中后台找回密码', 'info', 'sent', '20190515005528', '20190515005541', null);
INSERT INTO `t_mail` VALUES ('17', 'REACT中后台找回密码', 'info', 'sent', '20190515005556', '20190515005644', null);
INSERT INTO `t_mail` VALUES ('20', 'REACT中后台找回密码', 'info', 'sent', '20190515010250', '20190515010307', null);
INSERT INTO `t_mail` VALUES ('22', 'REACT中后台找回密码', 'info', 'sent', '20190515010523', '20190515010524', null);
INSERT INTO `t_mail` VALUES ('23', 'REACT中后台找回密码', 'info', 'sent', '20190515010535', '20190515010541', null);
INSERT INTO `t_mail` VALUES ('24', 'REACT中后台找回密码', 'info', 'sent', '20190515010551', '20190515010551', null);
INSERT INTO `t_mail` VALUES ('26', 'REACT中后台找回密码', 'info', 'sent', '20190515010758', '20190515010800', null);
INSERT INTO `t_mail` VALUES ('27', 'REACT中后台找回密码', 'info', 'sent', '20190515011045', '20190515011046', null);
INSERT INTO `t_mail` VALUES ('28', 'REACT中后台找回密码', 'info', 'sent', '20190515092917', '20190515092918', null);
INSERT INTO `t_mail` VALUES ('30', 'REACT中后台找回密码', 'info', 'sent', '20190515094400', '20190515094407', null);
INSERT INTO `t_mail` VALUES ('31', 'REACT中后台找回密码', 'info', 'sent', '20190515094407', '20190515094412', null);
INSERT INTO `t_mail` VALUES ('32', 'REACT中后台找回密码', 'info', 'sent', '20190515094413', '20190515094418', null);
INSERT INTO `t_mail` VALUES ('33', 'REACT中后台找回密码', 'info', 'sent', '20190515094419', '20190515094426', null);
INSERT INTO `t_mail` VALUES ('34', 'REACT中后台找回密码', 'info', 'sent', '20190515103728', '20190515103750', null);
INSERT INTO `t_mail` VALUES ('35', 'REACT中后台找回密码', 'info', 'sent', '20190515103914', '20190515103924', null);
INSERT INTO `t_mail` VALUES ('36', 'REACT中后台找回密码', 'info', 'sent', '20190515104233', '20190515104238', null);
INSERT INTO `t_mail` VALUES ('37', 'REACT中后台找回密码', 'info', 'sent', '20190515104812', '20190515104821', null);
INSERT INTO `t_mail` VALUES ('39', 'REACT中后台找回密码', 'info', 'sent', '20190515105733', '20190515105745', null);
INSERT INTO `t_mail` VALUES ('40', 'REACT中后台找回密码', 'info', 'sent', '20190515133829', '20190515133902', null);
INSERT INTO `t_mail` VALUES ('41', 'REACT中后台找回密码', 'info', 'sent', '20190515134022', '20190515134029', null);
INSERT INTO `t_mail` VALUES ('42', 'REACT中后台找回密码', 'info', 'sent', '20190515134224', '20190515134224', null);
INSERT INTO `t_mail` VALUES ('43', 'REACT中后台找回密码', 'info', 'sent', '20190515134604', '20190515134622', null);
INSERT INTO `t_mail` VALUES ('44', 'REACT中后台找回密码', 'info', 'sent', '20190515140115', '20190515140117', null);
INSERT INTO `t_mail` VALUES ('45', 'REACT中后台找回密码', 'info', 'sent', '20190515140336', '20190515140337', null);
INSERT INTO `t_mail` VALUES ('46', 'REACT中后台找回密码', 'info', 'sent', '20190515140804', '20190515140820', null);
INSERT INTO `t_mail` VALUES ('47', 'REACT中后台找回密码', 'info', 'sent', '20190515140908', '20190515140916', null);
INSERT INTO `t_mail` VALUES ('48', 'REACT中后台找回密码', 'info', 'sent', '20190515140957', '20190515141013', null);
INSERT INTO `t_mail` VALUES ('49', 'REACT中后台找回密码', 'info', 'sent', '20190515143120', '20190515143120', null);
INSERT INTO `t_mail` VALUES ('50', 'REACT中后台找回密码', 'info', 'sent', '20190520112139', '20190520112140', null);
INSERT INTO `t_mail` VALUES ('51', 'REACT中后台找回密码', 'info', 'sent', '20190520113120', '20190520113130', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail_content
-- ----------------------------
INSERT INTO `t_mail_content` VALUES ('4', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E5853414B45393C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C70207374796C653D27746578742D616C69676E3A7269676874273E5245414354E4B8ADE5908EE58FB03C2F703E3C70207374796C653D27746578742D616C69676E3A7269676874273E323031392D30352D31342031383A35313C2F703E, '4');
INSERT INTO `t_mail_content` VALUES ('5', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E324C794D746E3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C70207374796C653D27746578742D616C69676E3A7269676874273E5245414354E4B8ADE5908EE58FB03C2F703E3C70207374796C653D27746578742D616C69676E3A7269676874273E323031392D30352D31342031393A30333C2F703E, '5');
INSERT INTO `t_mail_content` VALUES ('7', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E3738394630723C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31342032323A30353C2F703E, '7');
INSERT INTO `t_mail_content` VALUES ('9', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E686A313572673C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31342032323A31373C2F703E, '9');
INSERT INTO `t_mail_content` VALUES ('10', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E65413879626A3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31342032323A34303C2F703E, '10');
INSERT INTO `t_mail_content` VALUES ('13', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E71474447624E3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030303A34373C2F703E, '13');
INSERT INTO `t_mail_content` VALUES ('14', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E4D6A7A5441383C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030303A34393C2F703E, '14');
INSERT INTO `t_mail_content` VALUES ('15', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E6F4E5A7665323C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030303A34393C2F703E, '15');
INSERT INTO `t_mail_content` VALUES ('16', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E45506766464B3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030303A35353C2F703E, '16');
INSERT INTO `t_mail_content` VALUES ('17', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E4D5070316B6B3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030303A35353C2F703E, '17');
INSERT INTO `t_mail_content` VALUES ('20', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E36744F43664A3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030313A30323C2F703E, '20');
INSERT INTO `t_mail_content` VALUES ('22', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E71757875776E3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030313A30353C2F703E, '22');
INSERT INTO `t_mail_content` VALUES ('23', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E3764637954483C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030313A30353C2F703E, '23');
INSERT INTO `t_mail_content` VALUES ('24', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E4E52594D62503C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030313A30353C2F703E, '24');
INSERT INTO `t_mail_content` VALUES ('26', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E457A6A77744D3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030313A30373C2F703E, '26');
INSERT INTO `t_mail_content` VALUES ('27', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E6A49654C37413C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030313A31303C2F703E, '27');
INSERT INTO `t_mail_content` VALUES ('28', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E3453546241343C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030393A32393C2F703E, '28');
INSERT INTO `t_mail_content` VALUES ('30', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E61544D7158713C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030393A34333C2F703E, '30');
INSERT INTO `t_mail_content` VALUES ('31', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E71497A4354443C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030393A34343C2F703E, '31');
INSERT INTO `t_mail_content` VALUES ('32', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E56764866574E3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030393A34343C2F703E, '32');
INSERT INTO `t_mail_content` VALUES ('33', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E7567343976563C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352030393A34343C2F703E, '33');
INSERT INTO `t_mail_content` VALUES ('34', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E666877416F6F3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031303A33373C2F703E, '34');
INSERT INTO `t_mail_content` VALUES ('35', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E4135427651683C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031303A33393C2F703E, '35');
INSERT INTO `t_mail_content` VALUES ('36', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E6C30646144553C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031303A34323C2F703E, '36');
INSERT INTO `t_mail_content` VALUES ('37', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E5A68484D65513C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031303A34383C2F703E, '37');
INSERT INTO `t_mail_content` VALUES ('39', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E42365A4D4E6C3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031303A35373C2F703E, '39');
INSERT INTO `t_mail_content` VALUES ('40', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E6E76617073613C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031333A33383C2F703E, '40');
INSERT INTO `t_mail_content` VALUES ('41', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E7A316C6268733C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031333A34303C2F703E, '41');
INSERT INTO `t_mail_content` VALUES ('42', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E32427339504E3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031333A34323C2F703E, '42');
INSERT INTO `t_mail_content` VALUES ('43', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E533058474B423C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031333A34363C2F703E, '43');
INSERT INTO `t_mail_content` VALUES ('44', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E4835514434333C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031343A30313C2F703E, '44');
INSERT INTO `t_mail_content` VALUES ('45', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E476F767845593C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031343A30333C2F703E, '45');
INSERT INTO `t_mail_content` VALUES ('46', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E4241577635753C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031343A30383C2F703E, '46');
INSERT INTO `t_mail_content` VALUES ('47', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E614B686E4C703C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031343A30393C2F703E, '47');
INSERT INTO `t_mail_content` VALUES ('48', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E5961617576363C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031343A30393C2F703E, '48');
INSERT INTO `t_mail_content` VALUES ('49', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E73415675706B3C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D31352031343A33313C2F703E, '49');
INSERT INTO `t_mail_content` VALUES ('50', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E46436F3864453C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D32302031313A32313C2F703E, '50');
INSERT INTO `t_mail_content` VALUES ('51', 0x3C703EE682A8E5A5BDEFBC9A3C2F703E3C703EE682A8E59CA85245414354E4B8ADE5908EE58FB0E794B3E8AFB7E689BEE59B9EE5AF86E7A081EFBC8CE9AA8CE8AF81E7A081EFBC9A3C7370616E207374796C653D27636F6C6F723A23463030273E3457617665453C2F7370616E3EEFBC8CE69C89E69588E69C9F3330E58886E9929FE380823C2F703E3C703EE5A682E69E9CE682A8E6B2A1E69C89E8BF9BE8A18CE8BF87E689BEE59B9EE5AF86E7A081E79A84E6938DE4BD9CEFBC8CE8AFB7E697A0E8A786E6ADA4E982AEE4BBB6E380823C2F703E3C703E2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3C2F703E3C703E5245414354E4B8ADE5908EE58FB03C2F703E3C703E323031392D30352D32302031313A33313C2F703E, '51');

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
INSERT INTO `t_mail_to_user_link` VALUES ('23', '9');
INSERT INTO `t_mail_to_user_link` VALUES ('44', '9');
INSERT INTO `t_mail_to_user_link` VALUES ('48', '9');
INSERT INTO `t_mail_to_user_link` VALUES ('4', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('5', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('7', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('9', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('10', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('13', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('14', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('15', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('16', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('17', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('20', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('22', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('24', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('26', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('27', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('28', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('30', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('31', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('32', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('33', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('34', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('35', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('36', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('37', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('39', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('40', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('41', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('42', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('43', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('45', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('46', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('47', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('49', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('50', '10');
INSERT INTO `t_mail_to_user_link` VALUES ('51', '10');

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '协议类型',
  `resource_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源类别',
  `resource_seq` int(5) DEFAULT NULL COMMENT '资源顺序',
  `resource_pattern` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源pattern',
  `resource_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求方法',
  `resource_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('1', 'http', '附件', '1300', '/attachment/*/*', 'GET', '附件列表');
INSERT INTO `t_resource` VALUES ('2', 'http', '附件', '1400', '/attachment/*', 'GET', '附件详情');
INSERT INTO `t_resource` VALUES ('3', 'http', '附件', '1500', '/attachment/*', 'DELETE', '删除附件');
INSERT INTO `t_resource` VALUES ('4', 'http', '部门', '700', '/dept/*/*', 'GET', '部门列表');
INSERT INTO `t_resource` VALUES ('5', 'http', '部门', '800', '/dept/*', 'GET', '部门详情');
INSERT INTO `t_resource` VALUES ('6', 'http', '部门', '900', '/dept', 'POST', '保存部门');
INSERT INTO `t_resource` VALUES ('7', 'http', '部门', '1000', '/dept', 'PUT', '更新部门');
INSERT INTO `t_resource` VALUES ('8', 'http', '部门', '1100', '/dept/*', 'DELETE', '删除部门');
INSERT INTO `t_resource` VALUES ('9', 'http', '附件', '1200', '/file/*/*', 'POST', '上传文件');
INSERT INTO `t_resource` VALUES ('10', 'http', '权限', '2600', '/resource/*/*', 'GET', '权限列表');
INSERT INTO `t_resource` VALUES ('11', 'http', '权限', '2700', '/resource/*', 'GET', '权限详情');
INSERT INTO `t_resource` VALUES ('12', 'http', '权限', '2800', '/resource', 'POST', '保存权限');
INSERT INTO `t_resource` VALUES ('13', 'http', '权限', '2900', '/resource', 'PUT', '更新权限');
INSERT INTO `t_resource` VALUES ('14', 'http', '权限', '3000', '/resource/*', 'DELETE', '删除权限');
INSERT INTO `t_resource` VALUES ('15', 'http', '角色', '2100', '/role/*/*', 'GET', '角色列表');
INSERT INTO `t_resource` VALUES ('16', 'http', '角色', '2200', '/role/*', 'GET', '角色详情');
INSERT INTO `t_resource` VALUES ('17', 'http', '角色', '2300', '/role', 'POST', '保存角色');
INSERT INTO `t_resource` VALUES ('18', 'http', '角色', '2400', '/role', 'PUT', '更新角色');
INSERT INTO `t_resource` VALUES ('19', 'http', '角色', '2500', '/role/*', 'DELETE', '删除角色');
INSERT INTO `t_resource` VALUES ('20', 'http', '用户', '1600', '/user/*/*', 'GET', '用户列表');
INSERT INTO `t_resource` VALUES ('21', 'http', '用户', '1700', '/user/*', 'GET', '用户详情');
INSERT INTO `t_resource` VALUES ('22', 'http', '用户', '1800', '/user', 'POST', '保存用户');
INSERT INTO `t_resource` VALUES ('23', 'http', '用户', '1900', '/user', 'PUT', '更新用户');
INSERT INTO `t_resource` VALUES ('24', 'http', '用户', '2000', '/user/*', 'DELETE', '删除用户');
INSERT INTO `t_resource` VALUES ('25', 'http', 'websocket', '3100', '/endpoint/**', null, '获取websocket信息及握手');
INSERT INTO `t_resource` VALUES ('26', 'websocket', 'websocket', '3200', '/topic/broadcast', 'SUBSCRIBE', '订阅广播消息');
INSERT INTO `t_resource` VALUES ('28', 'http', '广播', '3400', '/broadcast', 'POST', '发送广播消息');
INSERT INTO `t_resource` VALUES ('29', 'http', '广播', '3500', '/broadcast/*/*', 'GET', '广播列表');
INSERT INTO `t_resource` VALUES ('30', 'http', '广播', '3600', '/broadcast/*', 'GET', '广播详情');
INSERT INTO `t_resource` VALUES ('31', 'http', '消息', '3700', '/chat/*/*', 'GET', '消息列表');
INSERT INTO `t_resource` VALUES ('32', 'http', '消息', '3800', '/chat/*', 'GET', '消息详情');
INSERT INTO `t_resource` VALUES ('33', 'http', '消息', '3900', '/chat/*/*/*/*', 'GET', '往来消息');
INSERT INTO `t_resource` VALUES ('34', 'http', '消息', '4000', '/chat', 'PUT', '更新消息');
INSERT INTO `t_resource` VALUES ('35', 'http', '消息', '4100', '/chat', 'POST', '发送点对点消息');
INSERT INTO `t_resource` VALUES ('36', 'websocket', 'websocket', '3300', '/user/topic/chat', 'SUBSCRIBE', '订阅点对点消息');
INSERT INTO `t_resource` VALUES ('39', 'http', '定时任务模板', '4200', '/jobTemplate/*/*', 'GET', '任务模板列表');
INSERT INTO `t_resource` VALUES ('40', 'http', '定时任务模板', '4300', '/jobTemplate/*', 'GET', '任务模板详情');
INSERT INTO `t_resource` VALUES ('41', 'http', '定时任务模板', '4400', '/jobTemplate', 'POST', '保存任务模板');
INSERT INTO `t_resource` VALUES ('42', 'http', '定时任务模板', '4500', '/jobTemplate', 'PUT', '更新任务模板');
INSERT INTO `t_resource` VALUES ('43', 'http', '定时任务模板', '4600', '/jobTemplate/*', 'DELETE', '删除任务模板');
INSERT INTO `t_resource` VALUES ('44', 'http', '定时任务', '4700', '/job/*/*', 'GET', '定时任务列表');
INSERT INTO `t_resource` VALUES ('45', 'http', '定时任务', '4800', '/job/*', 'GET', '定时任务详情');
INSERT INTO `t_resource` VALUES ('46', 'http', '定时任务', '4900', '/job', 'POST', '保存定时任务');
INSERT INTO `t_resource` VALUES ('47', 'http', '定时任务', '5000', '/job', 'PUT', '更新定时任务');
INSERT INTO `t_resource` VALUES ('48', 'http', '定时任务', '5100', '/job/*', 'DELETE', '删除定时任务');
INSERT INTO `t_resource` VALUES ('49', 'http', '定时任务', '5200', '/job/pause/*', 'PATCH', '暂停定时任务');
INSERT INTO `t_resource` VALUES ('50', 'http', '定时任务', '5300', '/job/resume/*', 'PATCH', '恢复定时任务');
INSERT INTO `t_resource` VALUES ('51', 'http', '邮件', '5400', '/mail/*/*', 'GET', '邮件列表');
INSERT INTO `t_resource` VALUES ('52', 'http', '邮件', '5500', '/mail/*', 'GET', '邮件详情');
INSERT INTO `t_resource` VALUES ('53', 'http', '邮件', '5600', '/mail', 'POST', '保存邮件');
INSERT INTO `t_resource` VALUES ('54', 'http', '邮件', '5700', '/mail', 'PUT', '更新邮件');
INSERT INTO `t_resource` VALUES ('55', 'http', '邮件', '5800', '/mail/*', 'PATCH', '发送邮件');
INSERT INTO `t_resource` VALUES ('56', 'http', '邮件', '5900', '/mail/*', 'DELETE', '删除邮件');
INSERT INTO `t_resource` VALUES ('57', 'http', '个人信息', '300', '/userinfo', 'GET', '查询个人信息');
INSERT INTO `t_resource` VALUES ('59', 'http', '个人信息', '200', '/userinfo', 'PUT', '更新个人信息');
INSERT INTO `t_resource` VALUES ('60', 'http', '个人信息', '400', '/userinfo/retrieve_password_mail', 'POST', '发送找回密码邮件');
INSERT INTO `t_resource` VALUES ('61', 'http', '个人信息', '500', '/userinfo/retrieve_password', 'POST', '找回密码');
INSERT INTO `t_resource` VALUES ('62', 'http', '部门', '600', '/dept/all', 'GET', '查询所有部门');
INSERT INTO `t_resource` VALUES ('63', 'http', '个人信息', '100', '/userinfo', 'POST', '注册个人信息');
INSERT INTO `t_resource` VALUES ('65', 'http', '权限', '2550', '/resource/categorys', 'GET', '查询所有权限类别');
INSERT INTO `t_resource` VALUES ('66', 'http', '权限', '2570', '/resource/all', 'GET', '查询所有权限');
INSERT INTO `t_resource` VALUES ('67', 'http', '角色', '2050', '/role/all', 'GET', '查询所有角色');
INSERT INTO `t_resource` VALUES ('68', 'http', '用户', '1550', '/user/all', 'GET', '查询所有用户');
INSERT INTO `t_resource` VALUES ('69', 'http', '个人信息', '250', '/userinfo', 'PATCH', '修改密码');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色描述',
  `role_seq` int(5) DEFAULT NULL COMMENT '角色顺序',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否新用户默认角色',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_role_idx_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('7', 'ROLE_GUEST', '游客', '100', '0');
INSERT INTO `t_role` VALUES ('8', 'ROLE_PERSONAL', '个人信息管理', '200', '1');
INSERT INTO `t_role` VALUES ('9', 'ROLE_BASE', '基础数据查询', '300', '1');
INSERT INTO `t_role` VALUES ('10', 'ROLE_SYSTEM', '系统管理', '600', '0');
INSERT INTO `t_role` VALUES ('11', 'ROLE_ATTACHMENT', '附件管理', '800', '0');
INSERT INTO `t_role` VALUES ('15', 'ROLE_CHAT', 'websocket点对点聊天', '500', '1');
INSERT INTO `t_role` VALUES ('16', 'ROLE_SUBSCRIBE_BROADCAST', '订阅广播消息', '400', '1');
INSERT INTO `t_role` VALUES ('17', 'ROLE_BROADCAST', '发送广播消息', '700', '0');
INSERT INTO `t_role` VALUES ('18', 'ROLE_SCHEDULER', '定时任务管理', '900', '0');
INSERT INTO `t_role` VALUES ('19', 'ROLE_MAIL', '邮件管理', '1000', '0');

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
INSERT INTO `t_role_resource_link` VALUES ('11', '1');
INSERT INTO `t_role_resource_link` VALUES ('11', '2');
INSERT INTO `t_role_resource_link` VALUES ('11', '3');
INSERT INTO `t_role_resource_link` VALUES ('10', '4');
INSERT INTO `t_role_resource_link` VALUES ('10', '5');
INSERT INTO `t_role_resource_link` VALUES ('10', '6');
INSERT INTO `t_role_resource_link` VALUES ('10', '7');
INSERT INTO `t_role_resource_link` VALUES ('10', '8');
INSERT INTO `t_role_resource_link` VALUES ('8', '9');
INSERT INTO `t_role_resource_link` VALUES ('11', '9');
INSERT INTO `t_role_resource_link` VALUES ('10', '10');
INSERT INTO `t_role_resource_link` VALUES ('10', '11');
INSERT INTO `t_role_resource_link` VALUES ('10', '12');
INSERT INTO `t_role_resource_link` VALUES ('10', '13');
INSERT INTO `t_role_resource_link` VALUES ('10', '14');
INSERT INTO `t_role_resource_link` VALUES ('10', '15');
INSERT INTO `t_role_resource_link` VALUES ('10', '16');
INSERT INTO `t_role_resource_link` VALUES ('10', '17');
INSERT INTO `t_role_resource_link` VALUES ('10', '18');
INSERT INTO `t_role_resource_link` VALUES ('10', '19');
INSERT INTO `t_role_resource_link` VALUES ('10', '20');
INSERT INTO `t_role_resource_link` VALUES ('10', '21');
INSERT INTO `t_role_resource_link` VALUES ('10', '22');
INSERT INTO `t_role_resource_link` VALUES ('10', '23');
INSERT INTO `t_role_resource_link` VALUES ('10', '24');
INSERT INTO `t_role_resource_link` VALUES ('15', '25');
INSERT INTO `t_role_resource_link` VALUES ('16', '25');
INSERT INTO `t_role_resource_link` VALUES ('17', '25');
INSERT INTO `t_role_resource_link` VALUES ('16', '26');
INSERT INTO `t_role_resource_link` VALUES ('17', '26');
INSERT INTO `t_role_resource_link` VALUES ('17', '28');
INSERT INTO `t_role_resource_link` VALUES ('16', '29');
INSERT INTO `t_role_resource_link` VALUES ('17', '29');
INSERT INTO `t_role_resource_link` VALUES ('16', '30');
INSERT INTO `t_role_resource_link` VALUES ('17', '30');
INSERT INTO `t_role_resource_link` VALUES ('15', '31');
INSERT INTO `t_role_resource_link` VALUES ('15', '32');
INSERT INTO `t_role_resource_link` VALUES ('15', '33');
INSERT INTO `t_role_resource_link` VALUES ('15', '34');
INSERT INTO `t_role_resource_link` VALUES ('15', '35');
INSERT INTO `t_role_resource_link` VALUES ('15', '36');
INSERT INTO `t_role_resource_link` VALUES ('18', '39');
INSERT INTO `t_role_resource_link` VALUES ('18', '40');
INSERT INTO `t_role_resource_link` VALUES ('18', '41');
INSERT INTO `t_role_resource_link` VALUES ('18', '42');
INSERT INTO `t_role_resource_link` VALUES ('18', '43');
INSERT INTO `t_role_resource_link` VALUES ('18', '44');
INSERT INTO `t_role_resource_link` VALUES ('18', '45');
INSERT INTO `t_role_resource_link` VALUES ('18', '46');
INSERT INTO `t_role_resource_link` VALUES ('18', '47');
INSERT INTO `t_role_resource_link` VALUES ('18', '48');
INSERT INTO `t_role_resource_link` VALUES ('18', '49');
INSERT INTO `t_role_resource_link` VALUES ('18', '50');
INSERT INTO `t_role_resource_link` VALUES ('19', '51');
INSERT INTO `t_role_resource_link` VALUES ('19', '52');
INSERT INTO `t_role_resource_link` VALUES ('19', '53');
INSERT INTO `t_role_resource_link` VALUES ('19', '54');
INSERT INTO `t_role_resource_link` VALUES ('19', '55');
INSERT INTO `t_role_resource_link` VALUES ('19', '56');
INSERT INTO `t_role_resource_link` VALUES ('8', '57');
INSERT INTO `t_role_resource_link` VALUES ('8', '59');
INSERT INTO `t_role_resource_link` VALUES ('7', '60');
INSERT INTO `t_role_resource_link` VALUES ('7', '61');
INSERT INTO `t_role_resource_link` VALUES ('9', '62');
INSERT INTO `t_role_resource_link` VALUES ('10', '62');
INSERT INTO `t_role_resource_link` VALUES ('7', '63');
INSERT INTO `t_role_resource_link` VALUES ('9', '65');
INSERT INTO `t_role_resource_link` VALUES ('10', '65');
INSERT INTO `t_role_resource_link` VALUES ('9', '66');
INSERT INTO `t_role_resource_link` VALUES ('10', '66');
INSERT INTO `t_role_resource_link` VALUES ('9', '67');
INSERT INTO `t_role_resource_link` VALUES ('10', '67');
INSERT INTO `t_role_resource_link` VALUES ('9', '68');
INSERT INTO `t_role_resource_link` VALUES ('10', '68');
INSERT INTO `t_role_resource_link` VALUES ('8', '69');

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
  `head_img_id` int(11) DEFAULT NULL COMMENT '头像图片id',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birth` bigint(20) DEFAULT NULL COMMENT '生日',
  `logintime` bigint(20) DEFAULT NULL COMMENT '登陆时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_user_idx_username` (`username`),
  UNIQUE KEY `t_user_uk_email` (`email`),
  KEY `t_user_fk_dept_id` (`dept_id`),
  KEY `t_user_fk_head_img_id` (`head_img_id`),
  CONSTRAINT `t_user_fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `t_dept` (`id`),
  CONSTRAINT `t_user_fk_head_img_id` FOREIGN KEY (`head_img_id`) REFERENCES `t_attachment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('9', 'admin', '$2a$10$bR0way2ADFQDIt.UYSX3lekMwhHVOSwGUDLq.lBy6G0NQR/.AKXm2', 'xuelingkang@163.com', '薛凌康', '1', '1', '650736000736', '1558607985487', '1');
INSERT INTO `t_user` VALUES ('10', 'manager', '$2a$10$ODfMqCWyr0TOnvmeePdwFOfu3.0PfjHOxjDGrwRfqvw4Y1CULVa76', '574290057@qq.com', '总经理', '2', '1', '655833600710', '1558447124559', '1');

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
INSERT INTO `t_user_role_link` VALUES ('9', '8');
INSERT INTO `t_user_role_link` VALUES ('10', '8');
INSERT INTO `t_user_role_link` VALUES ('9', '9');
INSERT INTO `t_user_role_link` VALUES ('10', '9');
INSERT INTO `t_user_role_link` VALUES ('9', '10');
INSERT INTO `t_user_role_link` VALUES ('10', '10');
INSERT INTO `t_user_role_link` VALUES ('9', '11');
INSERT INTO `t_user_role_link` VALUES ('10', '11');
INSERT INTO `t_user_role_link` VALUES ('9', '15');
INSERT INTO `t_user_role_link` VALUES ('10', '15');
INSERT INTO `t_user_role_link` VALUES ('9', '16');
INSERT INTO `t_user_role_link` VALUES ('10', '16');
INSERT INTO `t_user_role_link` VALUES ('9', '17');
INSERT INTO `t_user_role_link` VALUES ('10', '17');
INSERT INTO `t_user_role_link` VALUES ('9', '18');
INSERT INTO `t_user_role_link` VALUES ('10', '18');
INSERT INTO `t_user_role_link` VALUES ('9', '19');
INSERT INTO `t_user_role_link` VALUES ('10', '19');

-- ----------------------------
-- View structure for t_mail_to_users
-- ----------------------------
DROP VIEW IF EXISTS `t_mail_to_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `t_mail_to_users` AS select `t_mail_to_user_link`.`mail_id` AS `mail_id`,group_concat(`t_user`.`username` separator ',') AS `info` from (`t_mail_to_user_link` left join `t_user` on((`t_user`.`id` = `t_mail_to_user_link`.`to_user_id`))) group by `t_mail_to_user_link`.`mail_id` ;

-- ----------------------------
-- View structure for t_role_resources_info
-- ----------------------------
DROP VIEW IF EXISTS `t_role_resources_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `t_role_resources_info` AS select `t_role`.`id` AS `id`,group_concat(`t_resource`.`resource_pattern` separator ',') AS `resources_info` from ((`t_role` left join `t_role_resource_link` on((`t_role`.`id` = `t_role_resource_link`.`role_id`))) left join `t_resource` on((`t_role_resource_link`.`resource_id` = `t_resource`.`id`))) group by `t_role`.`id` ;
