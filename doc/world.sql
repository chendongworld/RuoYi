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

 Date: 14/05/2018 18:21:48
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
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-2VNHCR21526282758634', 1526293233297, 15000);

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
  `channel_cost` int(5) NULL DEFAULT NULL COMMENT '渠道成本',
  `channel_sort` int(255) NULL DEFAULT NULL COMMENT '排序值',
  `channel_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道属性',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_deal
-- ----------------------------
DROP TABLE IF EXISTS `sys_deal`;
CREATE TABLE `sys_deal`  (
  `deal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id',
  `user_name` int(11) NULL DEFAULT NULL COMMENT '业务员名称',
  `channel_name` int(11) NULL DEFAULT NULL COMMENT '渠道名称',
  `merchant_name` int(11) NULL DEFAULT NULL COMMENT '商户名称',
  `product_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `sum_money` decimal(50, 2) NULL DEFAULT NULL COMMENT '总金额',
  `sum_profit` decimal(50, 2) NULL DEFAULT NULL COMMENT '总利润',
  `user_profit` decimal(50, 0) NULL DEFAULT NULL COMMENT '业务员利润',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` datetime(0) NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`deal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', 0, '', 'fa fa-gear', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'M', 0, '', 'fa fa-video-camera', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', 'M', 0, '', 'fa fa-bars', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '用户管理', 1, 1, '/system/user', 'C', 0, 'system:user:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (5, '角色管理', 1, 2, '/system/role', 'C', 0, 'system:role:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (6, '菜单管理', 1, 3, '/system/menu', 'C', 0, 'system:menu:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (7, '部门管理', 1, 4, '/system/dept', 'C', 0, 'system:dept:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (8, '岗位管理', 1, 5, '/system/post', 'C', 0, 'system:post:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (9, '字典管理', 1, 6, '/system/dict', 'C', 0, 'system:dict:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (10, '参数设置', 1, 7, '/system/config', 'C', 0, 'system:config:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '参数设置菜单');
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
INSERT INTO `sys_menu` VALUES (66, '交易管理', 1, 1, '#', 'C', 0, '', 'fa fa-diamond', 'admin', '2018-05-09 14:35:22', 'admin', '2018-05-09 14:35:22', '');
INSERT INTO `sys_menu` VALUES (67, '交易明细', 66, 1, '#', 'F', 0, '', '', 'admin', '2018-05-10 10:18:17', 'admin', '2018-05-10 10:18:17', '');
INSERT INTO `sys_menu` VALUES (68, '产品管理', 1, 1, '/system/product', 'C', 0, 'system:product:view', '', 'admin', '2018-05-11 16:40:50', '', '2018-05-11 16:40:48', '');
INSERT INTO `sys_menu` VALUES (69, '产品查询', 68, 1, '', 'F', 0, 'system:product:list', '', 'admin', '2018-05-11 16:40:53', '', '2018-05-11 16:40:51', '');
INSERT INTO `sys_menu` VALUES (70, '产品新增', 68, 1, '', 'F', 0, 'system:product:add', '', 'admin', '2018-05-11 16:40:56', '', '2018-05-11 16:40:54', '');
INSERT INTO `sys_menu` VALUES (71, '产品修改', 68, 1, '/system/product/edit', 'F', 0, 'system:product:edit', '', 'admin', '2018-05-12 13:28:06', 'admin', '2018-05-12 13:28:06', '');
INSERT INTO `sys_menu` VALUES (72, '产品删除', 68, 1, '', 'F', 0, 'system:product:remove', '', 'admin', '2018-05-11 16:41:03', '', '2018-05-11 16:41:00', '');

-- ----------------------------
-- Table structure for sys_merchant
-- ----------------------------
DROP TABLE IF EXISTS `sys_merchant`;
CREATE TABLE `sys_merchant`  (
  `merchant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '业务对接人id',
  `merchant_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `merchant_sort` int(255) NULL DEFAULT NULL COMMENT '排序值',
  `merchant_rate` int(5) NULL DEFAULT NULL COMMENT '商户费率',
  `royalty_rate` int(5) NULL DEFAULT NULL COMMENT '业务提成比率',
  `merchant_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道属性',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`merchant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, 0, 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_sort` int(2) NULL DEFAULT NULL COMMENT '排序值',
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品属性',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_product
-- ----------------------------
INSERT INTO `sys_product` VALUES (1, 'aaa', 1, '阿斯顿', '2018-05-14 10:55:05', NULL, NULL, NULL, '代付');

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
INSERT INTO `sys_role` VALUES (1, '开发账号', 'admin', 1, 0, 'admin', '2018-05-11 17:43:42', 'admin', '2018-05-11 17:43:42', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通账号', 'common', 3, 0, 'admin', '2018-05-10 18:08:13', 'admin', '2018-05-10 18:08:13', '普通角色');
INSERT INTO `sys_role` VALUES (3, '管理账号', 'common', 2, 0, 'admin', '2018-05-10 18:07:18', 'admin', '2018-05-10 18:07:18', '');

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
INSERT INTO `sys_role_menu` VALUES (1, 68);
INSERT INTO `sys_role_menu` VALUES (1, 69);
INSERT INTO `sys_role_menu` VALUES (1, 70);
INSERT INTO `sys_role_menu` VALUES (1, 71);
INSERT INTO `sys_role_menu` VALUES (1, 72);
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
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 6);
INSERT INTO `sys_role_menu` VALUES (3, 7);
INSERT INTO `sys_role_menu` VALUES (3, 8);
INSERT INTO `sys_role_menu` VALUES (3, 12);
INSERT INTO `sys_role_menu` VALUES (3, 13);
INSERT INTO `sys_role_menu` VALUES (3, 17);
INSERT INTO `sys_role_menu` VALUES (3, 18);
INSERT INTO `sys_role_menu` VALUES (3, 19);
INSERT INTO `sys_role_menu` VALUES (3, 20);
INSERT INTO `sys_role_menu` VALUES (3, 21);
INSERT INTO `sys_role_menu` VALUES (3, 22);
INSERT INTO `sys_role_menu` VALUES (3, 23);
INSERT INTO `sys_role_menu` VALUES (3, 24);
INSERT INTO `sys_role_menu` VALUES (3, 25);
INSERT INTO `sys_role_menu` VALUES (3, 26);
INSERT INTO `sys_role_menu` VALUES (3, 27);
INSERT INTO `sys_role_menu` VALUES (3, 28);
INSERT INTO `sys_role_menu` VALUES (3, 29);
INSERT INTO `sys_role_menu` VALUES (3, 30);
INSERT INTO `sys_role_menu` VALUES (3, 31);
INSERT INTO `sys_role_menu` VALUES (3, 32);
INSERT INTO `sys_role_menu` VALUES (3, 33);
INSERT INTO `sys_role_menu` VALUES (3, 34);
INSERT INTO `sys_role_menu` VALUES (3, 35);
INSERT INTO `sys_role_menu` VALUES (3, 36);
INSERT INTO `sys_role_menu` VALUES (3, 37);
INSERT INTO `sys_role_menu` VALUES (3, 38);
INSERT INTO `sys_role_menu` VALUES (3, 39);
INSERT INTO `sys_role_menu` VALUES (3, 40);
INSERT INTO `sys_role_menu` VALUES (3, 41);
INSERT INTO `sys_role_menu` VALUES (3, 42);
INSERT INTO `sys_role_menu` VALUES (3, 43);
INSERT INTO `sys_role_menu` VALUES (3, 44);
INSERT INTO `sys_role_menu` VALUES (3, 45);
INSERT INTO `sys_role_menu` VALUES (3, 54);
INSERT INTO `sys_role_menu` VALUES (3, 55);
INSERT INTO `sys_role_menu` VALUES (3, 56);
INSERT INTO `sys_role_menu` VALUES (3, 57);
INSERT INTO `sys_role_menu` VALUES (3, 58);
INSERT INTO `sys_role_menu` VALUES (3, 66);
INSERT INTO `sys_role_menu` VALUES (3, 67);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 101, 'admin', '开发', 'yzz_ivy@163.com', '15088888888', '172eee54aa664e9dd0536b063796e54e', '', 'Y', 0, '维护中', 'admin', '2018-05-09 14:31:15', 'ry', '2018-03-01 00:00:00');
INSERT INTO `sys_user` VALUES (3, 102, 'abcde', '自动', 'sadd@651', '111', '24d794dfc756320ffadb905d526299bc', '', 'N', 0, '', 'admin', '2018-05-10 09:51:48', 'admin', '2018-05-10 09:51:48');
INSERT INTO `sys_user` VALUES (4, 105, 'manman', 'manman', '134@123', '213412425225', '24d794dfc756320ffadb905d526299bc', '', 'N', 0, '', 'admin', '2018-05-10 09:54:00', 'admin', '2018-05-10 09:54:00');

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
INSERT INTO `sys_user_role` VALUES (4, 2);

SET FOREIGN_KEY_CHECKS = 1;
