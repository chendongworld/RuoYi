/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : world

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 23/05/2018 12:22:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_1', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F62000000000000000102000C4900067374617475734C000863726561746542797400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D6571007E00094C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978700000000174000561646D696E740015323031382D30332D30312030303A30303A30302E3074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D737400007070707800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_2', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F62000000000000000102000C4900067374617475734C000863726561746542797400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D6571007E00094C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978700000000174000561646D696E740015323031382D30332D30312030303A30303A30302E3074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D7374000272797070707800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-2VNHCR21527048280474', 1527049334387, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1525765520000, -1, 5, 'PAUSED', 'CRON', 1525765511000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F62000000000000000102000C4900067374617475734C000863726561746542797400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D6571007E00094C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978700000000174000561646D696E740015323031382D30332D30312030303A30303A30302E3074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D737400007070707800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', NULL, 1525765520000, -1, 5, 'PAUSED', 'CRON', 1525765512000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F62000000000000000102000C4900067374617475734C000863726561746542797400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D6571007E00094C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000978700000000174000561646D696E740015323031382D30332D30312030303A30303A30302E3074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D7374000272797070707800);

-- ----------------------------
-- Table structure for sys_channel
-- ----------------------------
DROP TABLE IF EXISTS `sys_channel`;
CREATE TABLE `sys_channel`  (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '渠道id',
  `channel_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `channel_sort` int(255) NULL DEFAULT NULL COMMENT '排序值',
  `channel_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道属性',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_channel
-- ----------------------------
INSERT INTO `sys_channel` VALUES (8, '二狗子支付', 1, '网银', '2018-05-21 11:59:29', NULL, 'zidong', NULL, '2');

-- ----------------------------
-- Table structure for sys_deal
-- ----------------------------
DROP TABLE IF EXISTS `sys_deal`;
CREATE TABLE `sys_deal`  (
  `deal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务员名称',
  `channel_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `merchant_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `sum_money` decimal(50, 2) NULL DEFAULT NULL COMMENT '总金额',
  `sum_profit` decimal(50, 2) NULL DEFAULT NULL COMMENT '总利润',
  `user_profit` decimal(50, 2) NULL DEFAULT NULL COMMENT '业务员利润',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`deal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_deal
-- ----------------------------
INSERT INTO `sys_deal` VALUES (11, '子东', '二狗子支付', '8848', '二狗子支付网银支付', 10000.00, -30.00, -15.00, '2018-05-21 12:01:03', '2018-05-21 12:01:48', '子东', '子东', NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父部门id',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '负责人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `status` int(1) NULL DEFAULT 0 COMMENT '部门状态:0正常,1停用',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '上海徽行', 0, '马云', '15011112221', 'ry@qq.com', 0, 'admin', '2018-05-09 14:00:45', 'ry', '2018-03-01 00:00:00');
INSERT INTO `sys_dept` VALUES (101, 100, '技术', 1, '不知道', '15011112222', 'ry@qq.com', 0, 'admin', '2018-05-09 14:31:52', 'admin', '2018-05-09 14:31:52');
INSERT INTO `sys_dept` VALUES (102, 100, '业务', 2, '不知道', '15011112223', 'ry@qq.com', 0, 'admin', '2018-05-09 14:23:08', 'admin', '2018-05-09 14:23:08');
INSERT INTO `sys_dept` VALUES (104, 100, '财务', 4, '不知道', '111111111111', 'ry@qq.com', 0, 'admin', '2018-05-09 14:22:41', 'admin', '2018-05-09 14:22:41');
INSERT INTO `sys_dept` VALUES (105, 100, '运营', 5, '陈子东', '15555555555', 'ry@qq.com', 0, 'admin', '2018-05-09 14:22:11', 'admin', '2018-05-09 14:22:11');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（0正常 1禁用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '工商银行', '01', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (2, 2, '建设银行', '02', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (3, 3, '农业银行', '03', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (4, 4, '光大银行', '04', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (5, 5, '兴业银行', '05', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (6, 6, '中国银行', '06', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (7, 7, '平安银行', '07', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (8, 8, '招商银行', '08', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (9, 1, '微信支付', 'WX', 'sys_pay_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (10, 2, '支付宝', 'ZFB', 'sys_pay_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (11, 3, 'QQ支付', 'JD', 'sys_pay_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_dict_data` VALUES (12, 4, '京东支付', 'QQ', 'sys_pay_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（0正常 1禁用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '银行列表', 'sys_bank_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '银行数据列表');
INSERT INTO `sys_dict_type` VALUES (2, '支付通道', 'sys_pay_code', 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '支付通道列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `params` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', 1, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', 1, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `params` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `is_exception` int(1) NULL DEFAULT 0 COMMENT '是否异常',
  `exception_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` int(1) NULL DEFAULT 0 COMMENT '登录状态 0成功 1失败',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', 'Chrome 45', 'Windows 7', 0, '登录成功', '2018-03-01 00:00:00');
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 15:46:48');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-08 15:54:24');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 15:54:47');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-08 15:57:35');
INSERT INTO `sys_logininfor` VALUES (104, 'admi', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '用户不存在/密码错误', '2018-05-08 16:01:41');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 16:01:48');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 16:07:32');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-08 16:20:21');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 16:20:36');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 16:49:50');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 17:08:54');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 17:08:54');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 17:46:12');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-08 17:54:39');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-08 17:54:54');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-08 17:57:27');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 12:22:25');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-09 12:23:30');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 12:23:31');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-09 12:30:08');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 12:30:09');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 13:57:16');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-09 14:26:58');
INSERT INTO `sys_logininfor` VALUES (123, 'abcde', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 14:27:13');
INSERT INTO `sys_logininfor` VALUES (124, 'abcde', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-09 14:27:29');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 14:27:30');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-09 14:28:36');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 14:28:37');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-09 14:31:27');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-09 14:31:27');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '192.168.0.188', 'Chrome Mobile', 'Android Mobile', 0, '登录成功', '2018-05-09 14:45:34');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '192.168.0.162', 'Internet Explorer 11', 'Windows 10', 0, '登录成功', '2018-05-09 20:43:31');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-10 09:50:04');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '退出成功', '2018-05-10 09:51:50');
INSERT INTO `sys_logininfor` VALUES (134, 'abcde', '192.168.0.186', 'Chrome 39', 'Windows 7', 1, '密码输入错误1次，admin123', '2018-05-10 09:51:58');
INSERT INTO `sys_logininfor` VALUES (135, 'abcde', '192.168.0.186', 'Chrome 39', 'Windows 7', 1, '密码输入错误2次，123456', '2018-05-10 09:52:04');
INSERT INTO `sys_logininfor` VALUES (136, 'abcde', '192.168.0.186', 'Chrome 39', 'Windows 7', 1, '密码输入错误3次，123456', '2018-05-10 09:52:12');
INSERT INTO `sys_logininfor` VALUES (137, 'abcde', '192.168.0.186', 'Chrome 39', 'Windows 7', 1, '密码输入错误4次，123456', '2018-05-10 09:52:25');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-10 09:52:31');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '退出成功', '2018-05-10 09:53:25');
INSERT INTO `sys_logininfor` VALUES (140, 'manman', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-10 09:53:36');
INSERT INTO `sys_logininfor` VALUES (141, 'manman', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '退出成功', '2018-05-10 09:53:45');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-10 09:53:46');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '192.168.0.162', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-10 10:16:16');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-10 15:42:18');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-10 15:45:34');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-10 17:05:08');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-10 17:52:51');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 09:56:32');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 15:26:13');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:06:28');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:18:28');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:29:20');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:34:32');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:34:43');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:35:29');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:42:05');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:51:40');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:52:11');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:55:57');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 16:59:08');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 17:13:26');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 17:19:25');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 17:33:42');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 18:07:39');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 18:37:59');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 18:38:55');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 18:40:35');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-11 18:47:29');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 11:09:44');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 13:21:28');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 13:32:11');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 13:36:40');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 13:38:41');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 13:40:33');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 13:42:56');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-12 13:45:03');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:04:11');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:11:54');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:15:01');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:22:00');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:25:20');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:27:46');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:29:55');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:32:25');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:34:29');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:41:52');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:44:16');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:48:21');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:52:12');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 10:55:42');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:06:14');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:19:53');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:29:33');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:31:31');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:34:27');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:39:02');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:41:41');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:45:20');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:47:37');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:53:13');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 11:56:11');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:01:20');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:11:01');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:13:17');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:16:16');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:27:19');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:28:32');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:30:50');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:31:23');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:33:18');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 12:34:21');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 14:27:12');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 15:07:00');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 15:16:32');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 15:26:11');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-14 16:38:50');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 17:27:42');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 17:39:21');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 17:51:12');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 17:56:01');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 17:59:02');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:04:03');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:11:13');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:12:59');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:15:18');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:16:37');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:17:36');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:18:37');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:20:45');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-15 18:22:16');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 09:40:29');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 10:43:02');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 10:49:24');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 10:52:28');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 10:59:34');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 11:02:13');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 11:20:32');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 11:23:20');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 16:02:24');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 16:58:49');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:01:39');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:02:18');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:03:18');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:22:56');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:29:44');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:35:18');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:41:45');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:52:28');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:56:26');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 17:59:45');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 18:00:45');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 18:09:11');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 18:29:37');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 18:34:40');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 18:35:23');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-16 18:37:29');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 10:31:35');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 11:23:00');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 11:24:41');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 11:25:47');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 11:29:10');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 11:30:05');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 11:31:42');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 12:36:31');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 12:39:18');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 13:06:32');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 13:08:23');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 13:13:29');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 13:15:57');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 13:17:48');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 13:21:26');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 13:25:59');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 18:23:45');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 18:31:37');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 18:42:15');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 19:19:07');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 19:23:25');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 19:27:19');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 19:29:28');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 19:30:41');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 19:33:05');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 21:03:29');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-17 21:04:20');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 21:04:55');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-17 21:05:01');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-17 21:19:04');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-17 21:19:37');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '192.168.0.188', 'Chrome Mobile', 'Android Mobile', 0, '登录成功', '2018-05-17 21:21:18');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '192.168.0.188', 'Chrome Mobile', 'Android Mobile', 0, '登录成功', '2018-05-17 21:23:36');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '192.168.0.189', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-18 09:54:54');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '192.168.0.189', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-18 09:55:05');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '192.168.0.189', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-18 09:55:43');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 10:09:43');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 10:11:49');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-18 10:33:23');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 11:46:57');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 14:04:50');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 14:05:48');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 14:06:41');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 14:07:42');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 14:38:57');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-18 14:46:55');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 14:46:58');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 14:53:49');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 15:00:57');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 15:02:13');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-18 15:06:12');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '退出成功', '2018-05-18 15:08:49');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '192.168.0.186', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-18 15:09:20');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 15:26:36');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 15:46:39');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 16:28:29');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 16:37:10');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 16:49:33');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 16:58:49');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 17:05:26');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-18 17:19:19');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 17:19:20');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 17:34:48');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 18:04:06');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 18:11:39');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 18:16:34');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 18:20:45');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 18:35:55');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 18:58:35');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 19:06:24');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 19:14:15');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 19:15:59');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 19:18:46');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 19:21:36');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 20:41:04');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 20:43:18');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 20:47:46');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 20:51:35');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 20:53:50');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-18 20:56:28');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:05:06');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '192.168.0.199', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-19 10:14:57');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-19 10:33:45');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:34:21');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:35:56');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:35:56');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:37:03');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:47:31');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:51:50');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 10:59:19');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 11:06:30');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 11:51:54');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 11:54:53');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 12:03:29');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 12:27:08');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 12:39:16');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 12:53:47');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 12:54:48');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-19 13:03:08');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-19 13:20:52');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '192.168.0.186', 'Internet Explorer 11', 'Windows 10', 0, '登录成功', '2018-05-21 10:13:51');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 10:21:32');
INSERT INTO `sys_logininfor` VALUES (359, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误1次，123456', '2018-05-21 10:21:42');
INSERT INTO `sys_logininfor` VALUES (360, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误2次，12345', '2018-05-21 10:21:50');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:22:10');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 10:23:29');
INSERT INTO `sys_logininfor` VALUES (363, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:23:41');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:46:06');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 10:46:16');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:46:19');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 10:47:20');
INSERT INTO `sys_logininfor` VALUES (368, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误1次，123456', '2018-05-21 10:47:29');
INSERT INTO `sys_logininfor` VALUES (369, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误2次，12345', '2018-05-21 10:47:36');
INSERT INTO `sys_logininfor` VALUES (370, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误3次，123456', '2018-05-21 10:47:40');
INSERT INTO `sys_logininfor` VALUES (371, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '用户不存在/密码错误', '2018-05-21 10:47:44');
INSERT INTO `sys_logininfor` VALUES (372, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误4次，manman123456', '2018-05-21 10:49:06');
INSERT INTO `sys_logininfor` VALUES (373, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误5次，123456', '2018-05-21 10:49:16');
INSERT INTO `sys_logininfor` VALUES (374, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误5次，帐户锁定10分钟', '2018-05-21 10:51:41');
INSERT INTO `sys_logininfor` VALUES (375, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误5次，帐户锁定10分钟', '2018-05-21 10:51:50');
INSERT INTO `sys_logininfor` VALUES (376, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误5次，帐户锁定10分钟', '2018-05-21 10:51:52');
INSERT INTO `sys_logininfor` VALUES (377, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误5次，帐户锁定10分钟', '2018-05-21 10:51:53');
INSERT INTO `sys_logininfor` VALUES (378, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '密码输入错误5次，帐户锁定10分钟', '2018-05-21 10:51:53');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:52:27');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 10:54:29');
INSERT INTO `sys_logininfor` VALUES (381, 'zidong', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:54:36');
INSERT INTO `sys_logininfor` VALUES (382, 'zidong', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:57:30');
INSERT INTO `sys_logininfor` VALUES (383, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误1次，123456', '2018-05-21 10:58:32');
INSERT INTO `sys_logininfor` VALUES (384, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 10:58:52');
INSERT INTO `sys_logininfor` VALUES (385, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 11:02:07');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:02:25');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 11:07:08');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:07:10');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 11:10:38');
INSERT INTO `sys_logininfor` VALUES (390, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误1次，123456', '2018-05-21 11:10:55');
INSERT INTO `sys_logininfor` VALUES (391, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:11:09');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:29:10');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 11:34:02');
INSERT INTO `sys_logininfor` VALUES (394, 'manman', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:34:08');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:39:17');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:40:57');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:48:28');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误1次，123456\\', '2018-05-21 11:58:30');
INSERT INTO `sys_logininfor` VALUES (399, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 11:58:43');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 14:18:29');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 15:53:50');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 16:04:16');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 16:37:54');
INSERT INTO `sys_logininfor` VALUES (404, 'manman', '192.168.0.189', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-21 16:58:13');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 17:07:08');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 17:10:49');
INSERT INTO `sys_logininfor` VALUES (407, 'manman', '192.168.0.189', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-21 17:17:55');
INSERT INTO `sys_logininfor` VALUES (408, 'manman', '192.168.0.144', 'Chrome Mobile', 'Android Mobile', 0, '登录成功', '2018-05-21 17:39:41');
INSERT INTO `sys_logininfor` VALUES (409, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 17:55:29');
INSERT INTO `sys_logininfor` VALUES (410, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 18:00:54');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误1次，123456', '2018-05-21 18:01:05');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误2次，123456', '2018-05-21 18:01:10');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 1, '密码输入错误3次，123456', '2018-05-21 18:01:16');
INSERT INTO `sys_logininfor` VALUES (414, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 18:01:26');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 18:05:15');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 18:09:06');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-21 20:24:31');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-21 20:26:33');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:00:20');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:00:20');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 17:00:33');
INSERT INTO `sys_logininfor` VALUES (422, '', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '* 必须填写', '2018-05-22 17:01:04');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:01:18');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:01:18');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 17:01:23');
INSERT INTO `sys_logininfor` VALUES (426, '', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 1, '* 必须填写', '2018-05-22 17:01:40');
INSERT INTO `sys_logininfor` VALUES (427, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:11:37');
INSERT INTO `sys_logininfor` VALUES (428, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:11:37');
INSERT INTO `sys_logininfor` VALUES (429, 'manman', '192.168.0.186', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 17:13:32');
INSERT INTO `sys_logininfor` VALUES (430, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:25:31');
INSERT INTO `sys_logininfor` VALUES (431, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:36:02');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:40:27');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:40:27');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 17:41:54');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:42:08');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:42:08');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 17:44:58');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:45:19');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 17:45:19');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 17:49:42');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 18:10:55');
INSERT INTO `sys_logininfor` VALUES (442, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 18:12:08');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 18:19:27');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 18:24:28');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '退出成功', '2018-05-22 19:05:50');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 19:28:54');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 19:56:42');
INSERT INTO `sys_logininfor` VALUES (448, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 20:17:48');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 20:28:53');
INSERT INTO `sys_logininfor` VALUES (450, 'zidong', '192.168.0.186', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-22 20:47:25');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-23 10:07:10');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-23 10:49:43');
INSERT INTO `sys_logininfor` VALUES (453, 'manman', '192.168.0.189', 'Chrome 39', 'Windows 7', 0, '登录成功', '2018-05-23 11:30:02');
INSERT INTO `sys_logininfor` VALUES (454, 'manman', '192.168.0.189', 'Microsoft Edge 12', 'Windows 10', 0, '登录成功', '2018-05-23 11:30:50');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows 10', 0, '登录成功', '2018-05-23 11:32:13');
INSERT INTO `sys_logininfor` VALUES (456, 'manman', '192.168.0.189', 'Internet Explorer 11', 'Windows 10', 0, '登录成功', '2018-05-23 11:33:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT NULL COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求地址',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '类型:M目录,C菜单,F按钮',
  `visible` int(1) NULL DEFAULT 0 COMMENT '菜单状态:0显示,1隐藏',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', 0, '', 'fa fa-gear', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'M', 0, '', 'fa fa-video-camera', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', 'M', 0, '', 'fa fa-bars', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '用户管理', 1, 5, '/system/user', 'C', 0, 'system:user:view', '#', 'admin', '2018-05-19 13:16:11', 'admin', '2018-05-19 13:16:11', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (5, '角色管理', 1, 6, '/system/role', 'C', 0, 'system:role:view', '#', 'admin', '2018-05-19 13:16:21', 'admin', '2018-05-19 13:16:21', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (6, '菜单管理', 1, 7, '/system/menu', 'C', 0, 'system:menu:view', '#', 'admin', '2018-05-19 13:16:32', 'admin', '2018-05-19 13:16:32', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (7, '部门管理', 1, 8, '/system/dept', 'C', 0, 'system:dept:view', '#', 'admin', '2018-05-19 13:16:46', 'admin', '2018-05-19 13:16:46', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (8, '岗位管理', 1, 9, '/system/post', 'C', 0, 'system:post:view', '#', 'admin', '2018-05-19 13:16:57', 'admin', '2018-05-19 13:16:57', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (9, '字典管理', 1, 9, '/system/dict', 'C', 0, 'system:dict:view', '#', 'admin', '2018-05-19 13:17:15', 'admin', '2018-05-19 13:17:15', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (10, '参数设置', 1, 9, '/system/config', 'C', 0, 'system:config:view', '#', 'admin', '2018-05-19 13:17:23', 'admin', '2018-05-19 13:17:23', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (11, '操作日志', 2, 1, '/monitor/operlog', 'C', 0, 'monitor:operlog:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (12, '登录日志', 2, 2, '/monitor/logininfor', 'C', 0, 'monitor:logininfor:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (13, '在线用户', 2, 3, '/monitor/online', 'C', 0, 'monitor:online:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (14, '定时任务', 2, 4, '/monitor/job', 'C', 0, 'monitor:job:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (15, '数据监控', 2, 5, '/monitor/data', 'C', 0, 'monitor:data:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (16, '代码生成', 3, 1, '/tool/gen', 'C', 0, 'tool:gen:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (17, '用户查询', 4, 1, '#', 'F', 0, 'system:user:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (18, '用户新增', 4, 2, '#', 'F', 0, 'system:user:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (19, '用户修改', 4, 3, '#', 'F', 0, 'system:user:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (20, '用户删除', 4, 4, '#', 'F', 0, 'system:user:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (21, '用户保存', 4, 5, '#', 'F', 0, 'system:user:save', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (22, '批量删除', 4, 6, '#', 'F', 0, 'system:user:batchRemove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (23, '重置密码', 4, 7, '#', 'F', 0, 'system:user:resetPwd', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (24, '角色查询', 5, 1, '#', 'F', 0, 'system:role:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (25, '角色新增', 5, 2, '#', 'F', 0, 'system:role:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (26, '角色修改', 5, 3, '#', 'F', 0, 'system:role:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (27, '角色删除', 5, 4, '#', 'F', 0, 'system:role:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (28, '角色保存', 5, 5, '#', 'F', 0, 'system:role:save', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (29, '批量删除', 5, 6, '#', 'F', 0, 'system:role:batchRemove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (30, '菜单查询', 6, 1, '#', 'F', 0, 'system:menu:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (31, '菜单新增', 6, 2, '#', 'F', 0, 'system:menu:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (32, '菜单修改', 6, 3, '#', 'F', 0, 'system:menu:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (33, '菜单删除', 6, 4, '#', 'F', 0, 'system:menu:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (34, '菜单保存', 6, 5, '#', 'F', 0, 'system:menu:save', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (35, '部门查询', 7, 1, '#', 'F', 0, 'system:dept:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (36, '部门新增', 7, 2, '#', 'F', 0, 'system:dept:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (37, '部门修改', 7, 3, '#', 'F', 0, 'system:dept:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (38, '部门删除', 7, 4, '#', 'F', 0, 'system:dept:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (39, '部门保存', 7, 5, '#', 'F', 0, 'system:dept:save', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (40, '岗位查询', 8, 1, '#', 'F', 0, 'system:post:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (41, '岗位新增', 8, 2, '#', 'F', 0, 'system:post:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (42, '岗位修改', 8, 3, '#', 'F', 0, 'system:post:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (43, '岗位删除', 8, 4, '#', 'F', 0, 'system:post:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (44, '岗位保存', 8, 5, '#', 'F', 0, 'system:post:save', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (45, '批量删除', 8, 4, '#', 'F', 0, 'system:post:batchRemove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (46, '字典查询', 9, 1, '#', 'F', 0, 'system:dict:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (47, '字典新增', 9, 2, '#', 'F', 0, 'system:dict:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (48, '字典修改', 9, 3, '#', 'F', 0, 'system:dict:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (49, '批量删除', 9, 4, '#', 'F', 0, 'system:dict:batchRemove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (50, '字典保存', 9, 5, '#', 'F', 0, 'system:dict:save', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (51, '操作查询', 11, 1, '#', 'F', 0, 'monitor:operlog:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (52, '批量删除', 11, 2, '#', 'F', 0, 'monitor:operlog:batchRemove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (53, '详细信息', 11, 3, '#', 'F', 0, 'monitor:operlog:detail', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (54, '登录查询', 12, 1, '#', 'F', 0, 'monitor:logininfor:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (55, '批量删除', 12, 2, '#', 'F', 0, 'monitor:logininfor:batchRemove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (56, '在线查询', 13, 1, '#', 'F', 0, 'monitor:online:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (57, '批量强退', 13, 2, '#', 'F', 0, 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (58, '单条强退', 13, 3, '#', 'F', 0, 'monitor:online:forceLogout', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (59, '任务查询', 14, 1, '#', 'F', 0, 'monitor:job:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (60, '任务新增', 14, 2, '#', 'F', 0, 'monitor:job:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (61, '任务修改', 14, 3, '#', 'F', 0, 'monitor:job:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (62, '任务删除', 14, 4, '#', 'F', 0, 'monitor:job:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (63, '任务保存', 14, 5, '#', 'F', 0, 'monitor:job:save', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (64, '状态修改', 14, 6, '#', 'F', 0, 'monitor:job:changeStatus', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (65, '批量删除', 14, 7, '#', 'F', 0, 'monitor:job:batchRemove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (66, '交易管理', 1, 1, '/system/deal', 'C', 0, 'system:deal:view', 'fa fa-diamond', 'admin', '2018-05-17 18:24:42', 'admin', '2018-05-17 18:24:42', '');
INSERT INTO `sys_menu` VALUES (67, '交易查询', 66, 1, '#', 'F', 0, 'system:deal:list', '', 'admin', '2018-05-17 18:25:33', 'admin', '2018-05-17 18:25:33', '');
INSERT INTO `sys_menu` VALUES (68, '产品管理', 1, 3, '/system/product', 'C', 0, 'system:product:view', '', 'admin', '2018-05-19 13:18:06', 'admin', '2018-05-19 13:18:06', '');
INSERT INTO `sys_menu` VALUES (69, '产品查询', 68, 1, '#', 'F', 0, 'system:product:list', '', 'admin', '2018-05-16 17:19:52', '', '2018-05-11 16:40:51', '');
INSERT INTO `sys_menu` VALUES (70, '产品新增', 68, 2, '#', 'F', 0, 'system:product:add', '#', 'admin', '2018-05-16 17:25:45', 'admin', '2018-05-16 17:25:45', '');
INSERT INTO `sys_menu` VALUES (71, '产品修改', 68, 3, '#', 'F', 0, 'system:product:edit', '#', 'admin', '2018-05-16 17:26:04', 'admin', '2018-05-16 17:26:04', '');
INSERT INTO `sys_menu` VALUES (72, '产品删除', 68, 4, '#', 'F', 0, 'system:product:remove', '', 'admin', '2018-05-16 17:26:37', 'admin', '2018-05-16 17:26:37', '');
INSERT INTO `sys_menu` VALUES (73, '产品保存', 68, 5, '', 'F', 0, 'system:product:save', '', 'admin', '2018-05-17 10:32:52', '', '0000-00-00 00:00:00', '');
INSERT INTO `sys_menu` VALUES (74, '批量删除', 68, 6, '', 'F', 0, 'system:product:batchRemove', '', 'admin', '2018-05-17 11:28:48', '', '0000-00-00 00:00:00', '');
INSERT INTO `sys_menu` VALUES (75, '渠道管理', 1, 2, '/system/channel', 'C', 0, 'system:channel:view', 'fa fa-cogs', 'admin', '2018-05-19 13:17:55', 'admin', '2018-05-19 13:17:55', '');
INSERT INTO `sys_menu` VALUES (76, '新增渠道', 75, 2, '', 'F', 0, 'system:channel:add', '', 'admin', '2018-05-17 11:58:44', 'admin', '2018-05-17 11:58:44', '');
INSERT INTO `sys_menu` VALUES (77, '查询渠道', 75, 1, '', 'F', 0, 'system:channel:list', '', 'admin', '2018-05-17 12:00:20', 'admin', '2018-05-17 12:00:20', '');
INSERT INTO `sys_menu` VALUES (78, '修改渠道', 75, 3, '', 'F', 0, 'system:channel:edit', '', 'admin', '2018-05-18 14:46:46', '', '2018-05-18 14:46:44', '');
INSERT INTO `sys_menu` VALUES (79, '删除渠道', 75, 4, '', 'F', 0, 'system:channel:remove', '', 'admin', '2018-05-18 14:46:43', '', '2018-05-18 14:46:42', '');
INSERT INTO `sys_menu` VALUES (80, '保存渠道', 75, 5, '', 'F', 0, 'system:channel:save', '', 'admin', '2018-05-18 14:46:41', '', '2018-05-18 14:46:39', '');
INSERT INTO `sys_menu` VALUES (81, '批量删除', 75, 6, '', 'F', 0, 'system:channel:batchRemove', '', 'admin', '2018-05-18 14:46:38', '', '2018-05-18 14:46:37', '');
INSERT INTO `sys_menu` VALUES (82, '交易新增', 66, 2, '', 'F', 0, 'system:deal:add', '', 'admin', '2018-05-18 14:46:36', '', '2018-05-18 14:46:34', '');
INSERT INTO `sys_menu` VALUES (83, '交易修改', 66, 3, '', 'F', 0, 'system:deal:edit', '', 'admin', '2018-05-18 14:46:33', '', '2018-05-18 14:46:31', '');
INSERT INTO `sys_menu` VALUES (84, '交易删除', 66, 4, '', 'F', 0, 'system:deal:remove', '', 'admin', '2018-05-18 14:46:30', '', '2018-05-18 14:46:28', '');
INSERT INTO `sys_menu` VALUES (85, '交易保存', 66, 5, '', 'F', 0, 'system:deal:save', '', 'admin', '2018-05-18 14:46:27', '', '2018-05-18 14:46:24', '');
INSERT INTO `sys_menu` VALUES (86, '批量删除', 66, 6, '', 'F', 0, 'system:deal:batchRemove', '', 'admin', '2018-05-18 14:46:22', '', '2018-05-18 14:46:20', '');
INSERT INTO `sys_menu` VALUES (87, '商户管理', 1, 4, '/system/merchant', 'C', 0, 'system:merchant:view', '', 'admin', '2018-05-19 13:18:21', 'admin', '2018-05-19 13:18:21', '');
INSERT INTO `sys_menu` VALUES (88, '查询商户', 87, 1, '', 'F', 0, 'system:merchant:list', '', 'admin', '2018-05-18 14:46:16', '', '2018-05-18 14:46:14', '');
INSERT INTO `sys_menu` VALUES (89, '新增商户', 87, 2, '', 'F', 0, 'system:merchant:add', '', 'admin', '2018-05-18 14:46:13', '', '2018-05-18 14:46:12', '');
INSERT INTO `sys_menu` VALUES (90, '修改商户', 87, 3, '', 'F', 0, 'system:merchant:edit', '', 'admin', '2018-05-18 14:46:11', '', '2018-05-18 14:46:09', '');
INSERT INTO `sys_menu` VALUES (91, '删除商户', 87, 4, '', 'F', 0, 'system:merchant:remove', '', 'admin', '2018-05-18 14:46:08', '', '2018-05-18 14:46:07', '');
INSERT INTO `sys_menu` VALUES (92, '保存商户', 87, 5, '', 'F', 0, 'system:merchant:save', '', 'admin', '2018-05-18 14:46:06', '', '2018-05-18 14:46:04', '');
INSERT INTO `sys_menu` VALUES (93, '批量删除', 87, 6, '', 'F', 0, 'system:merchant:batchRemove', '', 'admin', '2018-05-18 14:46:03', '', '2018-05-18 14:46:02', '');

-- ----------------------------
-- Table structure for sys_merchant
-- ----------------------------
DROP TABLE IF EXISTS `sys_merchant`;
CREATE TABLE `sys_merchant`  (
  `merchant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务对接人',
  `merchant_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `merchant_sort` int(255) NULL DEFAULT NULL COMMENT '排序值',
  `merchant_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '商户费率',
  `royalty_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '业务提成比率',
  `merchant_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道属性',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`merchant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_merchant
-- ----------------------------
INSERT INTO `sys_merchant` VALUES (7, '子东', '8848', 1, 0.30, 50.00, NULL, '2018-05-21 12:00:41', NULL, '子东', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '功能请求',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `channel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '来源渠道',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态 0正常 1异常',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '监控管理', '在线用户-强退用户', 'com.ruoyi.project.monitor.online.controller.UserOnlineController()', 'web', 'admin', '研发部门', 'delete.do?id=1', '127.0.0.1', 'JSON参数', 0, '错误描述', '2018-03-01 00:00:00');
INSERT INTO `sys_oper_log` VALUES (2, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,9,46,47,48,49,50,10,2,11,51,52,53,12,54,55', 0, NULL, '2018-05-10 18:06:22');
INSERT INTO `sys_oper_log` VALUES (3, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,9,46,47,48,49,50,10,68,69,70,71,72,2,11,51', 0, NULL, '2018-05-11 16:16:50');
INSERT INTO `sys_oper_log` VALUES (4, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,9,46,47,48,49,50,10,66,67,68,69,70,71,72,2', 0, NULL, '2018-05-11 16:44:25');
INSERT INTO `sys_oper_log` VALUES (5, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,10,2,11,51,52,53,12,54,55,13,56,57,58,14,5', 0, NULL, '2018-05-11 17:40:47');
INSERT INTO `sys_oper_log` VALUES (6, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,9,46,47,48,49,50,2,11,51,52,53,12,54,55,13', 0, NULL, '2018-05-11 17:41:27');
INSERT INTO `sys_oper_log` VALUES (7, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,2,11,51,52,53,12,54,55,13,56,57,58,14,59,6', 0, NULL, '2018-05-11 17:41:55');
INSERT INTO `sys_oper_log` VALUES (8, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,68,69,70,71,72,2,11,51,52,53,12,54,55,13,5', 0, NULL, '2018-05-11 17:43:42');
INSERT INTO `sys_oper_log` VALUES (9, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,68,69,70,71,72,75,76,77,78,79,80,81,2,11,5', 0, NULL, '2018-05-17 12:10:55');
INSERT INTO `sys_oper_log` VALUES (10, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,66,67,82,83,84,85,86,68,69,70,71,72,75,76,', 0, NULL, '2018-05-17 18:29:35');
INSERT INTO `sys_oper_log` VALUES (11, '系统管理', '角色管理-保存角色', 'com.ruoyi.project.system.role.controller.RoleController.save()', 'web', 'admin', '技术', '/system/role/save', '0:0:0:0:0:0:0:1', '{\"roleId\":[\"1\"],\"roleName\":[\"开发账号\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,4,17,18,19,20,21,22,23,5,24,25,26,27,28,29,6,30,31,32,33,34,7,35,36,37,38,39,8,40,41,42,43,44,45,66,67,82,83,84,85,86,68,69,70,71,72,75,76,', 0, NULL, '2018-05-18 14:45:15');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` int(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '经理', 2, 0, 'admin', '2018-05-21 10:53:33', 'admin', '2018-05-21 10:53:33', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `channel_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `channel_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '渠道成本',
  `product_sort` int(2) NULL DEFAULT NULL COMMENT '排序值',
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品属性',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_product
-- ----------------------------
INSERT INTO `sys_product` VALUES (16, '二狗子支付', '二狗子支付网银支付', 0.60, 1, NULL, '2018-05-21 11:59:51', NULL, 'zidong', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(10) NOT NULL COMMENT '显示顺序',
  `status` int(1) NULL DEFAULT 0 COMMENT '角色状态:0正常,1禁用',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '开发账号', 'admin', 1, 0, 'admin', '2018-05-18 14:45:14', 'admin', '2018-05-18 14:45:14', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通账号', 'common', 3, 0, 'admin', '2018-05-10 18:08:13', 'admin', '2018-05-10 18:08:13', '普通角色');
INSERT INTO `sys_role` VALUES (3, '管理账号', 'common', 2, 0, 'admin', '2018-05-21 10:21:18', 'admin', '2018-05-21 10:21:18', '管理账号');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (1, 38);
INSERT INTO `sys_role_menu` VALUES (1, 39);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (1, 44);
INSERT INTO `sys_role_menu` VALUES (1, 45);
INSERT INTO `sys_role_menu` VALUES (1, 51);
INSERT INTO `sys_role_menu` VALUES (1, 52);
INSERT INTO `sys_role_menu` VALUES (1, 53);
INSERT INTO `sys_role_menu` VALUES (1, 54);
INSERT INTO `sys_role_menu` VALUES (1, 55);
INSERT INTO `sys_role_menu` VALUES (1, 56);
INSERT INTO `sys_role_menu` VALUES (1, 57);
INSERT INTO `sys_role_menu` VALUES (1, 58);
INSERT INTO `sys_role_menu` VALUES (1, 59);
INSERT INTO `sys_role_menu` VALUES (1, 60);
INSERT INTO `sys_role_menu` VALUES (1, 61);
INSERT INTO `sys_role_menu` VALUES (1, 62);
INSERT INTO `sys_role_menu` VALUES (1, 63);
INSERT INTO `sys_role_menu` VALUES (1, 64);
INSERT INTO `sys_role_menu` VALUES (1, 65);
INSERT INTO `sys_role_menu` VALUES (1, 66);
INSERT INTO `sys_role_menu` VALUES (1, 67);
INSERT INTO `sys_role_menu` VALUES (1, 68);
INSERT INTO `sys_role_menu` VALUES (1, 69);
INSERT INTO `sys_role_menu` VALUES (1, 70);
INSERT INTO `sys_role_menu` VALUES (1, 71);
INSERT INTO `sys_role_menu` VALUES (1, 72);
INSERT INTO `sys_role_menu` VALUES (1, 75);
INSERT INTO `sys_role_menu` VALUES (1, 76);
INSERT INTO `sys_role_menu` VALUES (1, 77);
INSERT INTO `sys_role_menu` VALUES (1, 78);
INSERT INTO `sys_role_menu` VALUES (1, 79);
INSERT INTO `sys_role_menu` VALUES (1, 80);
INSERT INTO `sys_role_menu` VALUES (1, 81);
INSERT INTO `sys_role_menu` VALUES (1, 82);
INSERT INTO `sys_role_menu` VALUES (1, 83);
INSERT INTO `sys_role_menu` VALUES (1, 84);
INSERT INTO `sys_role_menu` VALUES (1, 85);
INSERT INTO `sys_role_menu` VALUES (1, 86);
INSERT INTO `sys_role_menu` VALUES (1, 87);
INSERT INTO `sys_role_menu` VALUES (1, 88);
INSERT INTO `sys_role_menu` VALUES (1, 89);
INSERT INTO `sys_role_menu` VALUES (1, 90);
INSERT INTO `sys_role_menu` VALUES (1, 91);
INSERT INTO `sys_role_menu` VALUES (1, 92);
INSERT INTO `sys_role_menu` VALUES (1, 93);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 24);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (2, 35);
INSERT INTO `sys_role_menu` VALUES (2, 40);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 8);
INSERT INTO `sys_role_menu` VALUES (3, 17);
INSERT INTO `sys_role_menu` VALUES (3, 18);
INSERT INTO `sys_role_menu` VALUES (3, 19);
INSERT INTO `sys_role_menu` VALUES (3, 20);
INSERT INTO `sys_role_menu` VALUES (3, 21);
INSERT INTO `sys_role_menu` VALUES (3, 22);
INSERT INTO `sys_role_menu` VALUES (3, 23);
INSERT INTO `sys_role_menu` VALUES (3, 40);
INSERT INTO `sys_role_menu` VALUES (3, 41);
INSERT INTO `sys_role_menu` VALUES (3, 42);
INSERT INTO `sys_role_menu` VALUES (3, 43);
INSERT INTO `sys_role_menu` VALUES (3, 44);
INSERT INTO `sys_role_menu` VALUES (3, 45);
INSERT INTO `sys_role_menu` VALUES (3, 66);
INSERT INTO `sys_role_menu` VALUES (3, 67);
INSERT INTO `sys_role_menu` VALUES (3, 68);
INSERT INTO `sys_role_menu` VALUES (3, 69);
INSERT INTO `sys_role_menu` VALUES (3, 70);
INSERT INTO `sys_role_menu` VALUES (3, 71);
INSERT INTO `sys_role_menu` VALUES (3, 73);
INSERT INTO `sys_role_menu` VALUES (3, 75);
INSERT INTO `sys_role_menu` VALUES (3, 76);
INSERT INTO `sys_role_menu` VALUES (3, 77);
INSERT INTO `sys_role_menu` VALUES (3, 78);
INSERT INTO `sys_role_menu` VALUES (3, 80);
INSERT INTO `sys_role_menu` VALUES (3, 82);
INSERT INTO `sys_role_menu` VALUES (3, 83);
INSERT INTO `sys_role_menu` VALUES (3, 87);
INSERT INTO `sys_role_menu` VALUES (3, 88);
INSERT INTO `sys_role_menu` VALUES (3, 89);
INSERT INTO `sys_role_menu` VALUES (3, 90);
INSERT INTO `sys_role_menu` VALUES (3, 92);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `user_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '类型:Y默认用户,N非默认用户',
  `status` int(1) NULL DEFAULT 0 COMMENT '帐号状态:0正常,1禁用',
  `refuse_des` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '拒绝登录描述',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` timestamp(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 101, 'admin', '开发', 'yzz_ivy@163.com', '15088888888', '172eee54aa664e9dd0536b063796e54e', '', 'Y', 0, '维护中', 'admin', '2018-05-09 14:31:15', 'ry', '2018-03-01 00:00:00');
INSERT INTO `sys_user` VALUES (5, 105, 'manman', '曼曼管理', '12314@1234', '123456789067', 'c9bdc4e218277cc4638ed78270788279', '', 'N', 0, '', 'admin', '2018-05-21 11:29:28', 'manman', '2018-05-21 11:29:28');
INSERT INTO `sys_user` VALUES (6, 102, 'zidong', '子东', '123@123', '123465', 'b5dbb2625494be2e6e6ebf785467def9', '', 'N', 0, '', 'admin', '2018-05-21 11:13:31', '', '2018-05-21 11:13:29');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestsamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'session创建时间',
  `last_access_time` timestamp(0) NOT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '4');
INSERT INTO `sys_user_post` VALUES ('4', '4');
INSERT INTO `sys_user_post` VALUES ('5', '4');
INSERT INTO `sys_user_post` VALUES ('6', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (5, 3);
INSERT INTO `sys_user_role` VALUES (6, 3);

SET FOREIGN_KEY_CHECKS = 1;
