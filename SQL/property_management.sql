/*
 Navicat MySQL Data Transfer

 Source Server         : liwanyu
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : property_management

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 18/05/2022 02:58:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_taskrelation
-- ----------------------------
DROP TABLE IF EXISTS `admin_taskrelation`;
CREATE TABLE `admin_taskrelation`  (
  `admin_taskid` int NOT NULL AUTO_INCREMENT COMMENT '维修信息',
  `ataskstate` tinyint NOT NULL DEFAULT 0 COMMENT '维修状态(0:正在维修, 1:维修完成, 2:维修失败)',
  `taskstarttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '维修任务分配时间',
  `taskendtime` timestamp NULL DEFAULT NULL COMMENT '维修完成时间',
  `admin_task_taskid` int NOT NULL COMMENT '维修ID',
  `admin_task_adminid` int NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`admin_taskid`) USING BTREE,
  INDEX `admin_task_taskid`(`admin_task_taskid`) USING BTREE,
  INDEX `admin_task_adminid`(`admin_task_adminid`) USING BTREE,
  CONSTRAINT `admin_taskrelation_ibfk_1` FOREIGN KEY (`admin_task_taskid`) REFERENCES `taskinfo` (`taskid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `admin_taskrelation_ibfk_2` FOREIGN KEY (`admin_task_adminid`) REFERENCES `admininfo` (`adminid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_taskrelation
-- ----------------------------
INSERT INTO `admin_taskrelation` VALUES (1, 2, '2020-01-24 17:39:23', NULL, 98, 11);
INSERT INTO `admin_taskrelation` VALUES (2, 2, '2019-11-17 16:14:02', NULL, 29, 4);
INSERT INTO `admin_taskrelation` VALUES (3, 2, '2021-11-11 22:25:17', NULL, 48, 18);
INSERT INTO `admin_taskrelation` VALUES (4, 2, '2020-12-23 05:42:23', NULL, 35, 6);
INSERT INTO `admin_taskrelation` VALUES (5, 2, '2020-12-29 15:04:01', NULL, 6, 13);
INSERT INTO `admin_taskrelation` VALUES (6, 2, '2019-09-03 12:09:25', NULL, 54, 25);
INSERT INTO `admin_taskrelation` VALUES (7, 1, '2020-09-17 07:55:23', '2019-03-06 15:25:34', 1, 23);
INSERT INTO `admin_taskrelation` VALUES (8, 1, '2018-01-12 04:43:12', '2018-06-29 23:15:09', 2, 8);
INSERT INTO `admin_taskrelation` VALUES (9, 1, '2018-04-26 11:44:30', '2019-08-15 20:48:57', 3, 1);
INSERT INTO `admin_taskrelation` VALUES (10, 1, '2017-10-20 02:02:32', '2017-08-01 05:42:02', 4, 20);
INSERT INTO `admin_taskrelation` VALUES (11, 1, '2019-03-03 12:38:47', '2018-09-07 15:15:15', 5, 4);
INSERT INTO `admin_taskrelation` VALUES (12, 1, '2022-05-01 11:42:56', '2020-01-18 04:36:16', 6, 27);
INSERT INTO `admin_taskrelation` VALUES (13, 1, '2019-07-01 10:24:29', '2021-05-24 08:01:13', 7, 17);
INSERT INTO `admin_taskrelation` VALUES (14, 1, '2018-07-08 14:06:41', '2018-10-14 10:32:59', 8, 1);
INSERT INTO `admin_taskrelation` VALUES (15, 1, '2020-02-21 05:32:29', '2019-05-25 09:15:55', 9, 11);
INSERT INTO `admin_taskrelation` VALUES (16, 1, '2022-02-06 01:45:14', '2020-10-11 03:14:43', 10, 25);
INSERT INTO `admin_taskrelation` VALUES (17, 1, '2020-09-30 04:01:58', '2018-03-23 11:58:19', 11, 9);
INSERT INTO `admin_taskrelation` VALUES (18, 1, '2017-01-12 19:38:44', '2017-07-31 19:01:04', 12, 1);
INSERT INTO `admin_taskrelation` VALUES (19, 1, '2020-09-27 05:50:12', '2018-08-10 15:30:21', 13, 12);
INSERT INTO `admin_taskrelation` VALUES (20, 1, '2019-03-02 22:21:54', '2020-12-24 10:25:32', 14, 11);
INSERT INTO `admin_taskrelation` VALUES (21, 1, '2021-08-19 19:53:48', '2018-08-07 03:35:37', 15, 20);
INSERT INTO `admin_taskrelation` VALUES (22, 1, '2019-01-10 08:51:42', '2018-08-05 10:55:12', 16, 14);
INSERT INTO `admin_taskrelation` VALUES (23, 1, '2018-01-19 08:28:12', '2020-03-18 05:38:12', 17, 16);
INSERT INTO `admin_taskrelation` VALUES (24, 1, '2018-05-04 00:18:40', '2019-01-27 12:37:58', 18, 26);
INSERT INTO `admin_taskrelation` VALUES (25, 1, '2019-10-17 09:19:04', '2020-06-11 13:18:40', 19, 17);
INSERT INTO `admin_taskrelation` VALUES (26, 1, '2018-01-04 11:18:45', '2019-01-18 05:22:27', 20, 10);
INSERT INTO `admin_taskrelation` VALUES (27, 1, '2019-03-06 03:13:01', '2021-12-03 05:36:58', 21, 23);
INSERT INTO `admin_taskrelation` VALUES (28, 1, '2021-10-18 17:24:20', '2022-01-24 05:11:25', 22, 23);
INSERT INTO `admin_taskrelation` VALUES (29, 1, '2020-10-07 05:07:59', '2017-11-06 17:54:00', 23, 4);
INSERT INTO `admin_taskrelation` VALUES (30, 1, '2019-08-07 08:26:49', '2020-06-02 08:39:03', 24, 4);
INSERT INTO `admin_taskrelation` VALUES (31, 1, '2017-07-29 19:15:31', '2020-07-20 05:29:13', 25, 1);
INSERT INTO `admin_taskrelation` VALUES (32, 1, '2018-11-20 02:31:18', '2017-04-30 02:19:06', 26, 16);
INSERT INTO `admin_taskrelation` VALUES (33, 1, '2019-08-31 16:27:20', '2020-01-31 10:39:54', 27, 28);
INSERT INTO `admin_taskrelation` VALUES (34, 1, '2018-10-08 04:39:59', '2022-05-07 05:00:38', 28, 5);
INSERT INTO `admin_taskrelation` VALUES (35, 1, '2019-02-03 21:58:19', '2020-04-20 12:23:02', 29, 18);
INSERT INTO `admin_taskrelation` VALUES (36, 1, '2019-10-20 00:56:31', '2019-04-27 02:17:00', 30, 23);
INSERT INTO `admin_taskrelation` VALUES (37, 1, '2021-01-18 17:00:09', '2018-10-04 20:35:48', 31, 13);
INSERT INTO `admin_taskrelation` VALUES (38, 1, '2020-12-17 11:07:05', '2018-05-20 16:31:03', 32, 4);
INSERT INTO `admin_taskrelation` VALUES (39, 1, '2020-06-07 01:19:39', '2017-12-22 05:54:46', 33, 19);
INSERT INTO `admin_taskrelation` VALUES (40, 1, '2018-03-28 22:59:18', '2019-10-21 03:35:35', 34, 25);
INSERT INTO `admin_taskrelation` VALUES (41, 1, '2020-10-25 02:24:27', '2017-12-03 10:35:58', 35, 14);
INSERT INTO `admin_taskrelation` VALUES (42, 1, '2020-11-21 01:44:15', '2018-06-03 01:00:36', 36, 19);
INSERT INTO `admin_taskrelation` VALUES (43, 1, '2020-11-20 14:33:24', '2020-05-18 05:16:49', 37, 23);
INSERT INTO `admin_taskrelation` VALUES (44, 1, '2021-11-18 23:05:10', '2019-09-07 22:31:22', 38, 16);
INSERT INTO `admin_taskrelation` VALUES (45, 1, '2021-10-09 00:06:30', '2019-12-24 15:09:14', 39, 17);
INSERT INTO `admin_taskrelation` VALUES (46, 1, '2021-10-12 07:50:09', '2020-11-26 07:36:11', 40, 11);
INSERT INTO `admin_taskrelation` VALUES (47, 1, '2017-10-04 17:26:16', '2020-08-08 01:38:52', 41, 10);
INSERT INTO `admin_taskrelation` VALUES (48, 1, '2018-07-21 08:57:44', '2020-12-22 15:27:55', 42, 13);
INSERT INTO `admin_taskrelation` VALUES (49, 1, '2020-08-07 11:54:58', '2018-12-13 17:33:27', 43, 8);
INSERT INTO `admin_taskrelation` VALUES (50, 1, '2017-01-01 19:28:22', '2021-03-22 12:35:52', 44, 1);
INSERT INTO `admin_taskrelation` VALUES (51, 1, '2021-04-29 12:29:23', '2019-12-03 17:52:53', 45, 23);
INSERT INTO `admin_taskrelation` VALUES (52, 1, '2020-09-23 21:03:48', '2017-08-12 10:27:41', 46, 3);
INSERT INTO `admin_taskrelation` VALUES (53, 1, '2018-08-25 14:42:26', '2018-06-18 09:08:57', 47, 26);
INSERT INTO `admin_taskrelation` VALUES (54, 1, '2020-11-17 05:36:06', '2018-02-12 21:47:52', 48, 11);
INSERT INTO `admin_taskrelation` VALUES (55, 1, '2020-06-30 10:10:24', '2019-12-19 09:30:28', 49, 3);
INSERT INTO `admin_taskrelation` VALUES (56, 1, '2017-12-03 09:08:38', '2020-02-20 18:19:29', 50, 23);
INSERT INTO `admin_taskrelation` VALUES (57, 1, '2017-11-08 01:49:23', '2017-09-21 14:50:29', 51, 20);
INSERT INTO `admin_taskrelation` VALUES (58, 1, '2021-01-19 20:56:31', '2021-01-29 00:14:30', 52, 16);
INSERT INTO `admin_taskrelation` VALUES (59, 1, '2017-08-28 06:44:55', '2019-07-06 14:55:17', 53, 20);
INSERT INTO `admin_taskrelation` VALUES (60, 1, '2019-06-24 19:04:37', '2021-01-01 15:59:17', 54, 8);
INSERT INTO `admin_taskrelation` VALUES (61, 1, '2019-05-11 16:37:37', '2020-09-15 12:37:40', 55, 18);
INSERT INTO `admin_taskrelation` VALUES (62, 1, '2021-08-04 18:50:38', '2019-02-24 06:06:32', 56, 17);
INSERT INTO `admin_taskrelation` VALUES (63, 1, '2018-12-05 08:00:02', '2022-03-16 01:45:19', 57, 14);
INSERT INTO `admin_taskrelation` VALUES (64, 1, '2020-09-21 18:47:59', '2020-10-30 12:44:50', 58, 23);
INSERT INTO `admin_taskrelation` VALUES (65, 1, '2020-08-21 15:31:22', '2018-12-07 08:17:22', 59, 18);
INSERT INTO `admin_taskrelation` VALUES (66, 1, '2022-05-02 11:34:44', '2021-05-15 21:31:39', 60, 1);
INSERT INTO `admin_taskrelation` VALUES (67, 1, '2020-02-23 21:48:25', '2017-12-11 18:03:04', 61, 13);
INSERT INTO `admin_taskrelation` VALUES (68, 1, '2018-04-02 03:22:27', '2021-02-21 13:53:33', 62, 13);
INSERT INTO `admin_taskrelation` VALUES (69, 1, '2020-09-21 04:06:04', '2021-07-17 16:42:18', 63, 11);
INSERT INTO `admin_taskrelation` VALUES (70, 1, '2019-11-29 06:55:44', '2017-10-08 05:28:22', 64, 12);
INSERT INTO `admin_taskrelation` VALUES (71, 1, '2021-10-31 17:57:03', '2020-01-17 18:21:36', 65, 17);
INSERT INTO `admin_taskrelation` VALUES (72, 1, '2019-09-26 16:22:54', '2017-01-30 11:10:36', 66, 23);
INSERT INTO `admin_taskrelation` VALUES (73, 1, '2018-11-25 19:28:38', '2019-11-14 14:35:32', 67, 20);
INSERT INTO `admin_taskrelation` VALUES (74, 1, '2019-11-16 14:42:54', '2020-08-20 10:51:57', 68, 19);
INSERT INTO `admin_taskrelation` VALUES (75, 1, '2020-03-04 16:03:06', '2018-03-06 05:46:00', 69, 27);
INSERT INTO `admin_taskrelation` VALUES (76, 1, '2020-05-31 11:44:20', '2022-04-22 05:04:22', 70, 27);
INSERT INTO `admin_taskrelation` VALUES (77, 1, '2018-01-05 16:42:11', '2020-11-09 02:32:57', 71, 10);
INSERT INTO `admin_taskrelation` VALUES (78, 1, '2020-09-24 11:45:12', '2017-06-03 00:10:39', 72, 12);
INSERT INTO `admin_taskrelation` VALUES (79, 1, '2021-03-31 19:20:41', '2018-01-14 12:54:02', 73, 20);
INSERT INTO `admin_taskrelation` VALUES (80, 0, '2022-01-06 05:47:01', NULL, 74, 23);
INSERT INTO `admin_taskrelation` VALUES (81, 0, '2022-03-27 20:37:51', NULL, 75, 18);
INSERT INTO `admin_taskrelation` VALUES (82, 0, '2017-02-18 04:26:39', NULL, 76, 16);
INSERT INTO `admin_taskrelation` VALUES (83, 0, '2020-02-20 05:11:10', NULL, 77, 28);
INSERT INTO `admin_taskrelation` VALUES (84, 0, '2021-04-18 00:33:45', NULL, 78, 12);
INSERT INTO `admin_taskrelation` VALUES (85, 0, '2020-06-21 17:20:20', NULL, 79, 20);
INSERT INTO `admin_taskrelation` VALUES (86, 0, '2020-07-28 20:51:09', NULL, 80, 11);
INSERT INTO `admin_taskrelation` VALUES (87, 0, '2022-04-17 20:38:41', NULL, 81, 18);
INSERT INTO `admin_taskrelation` VALUES (88, 0, '2019-10-18 05:32:04', NULL, 82, 11);
INSERT INTO `admin_taskrelation` VALUES (89, 0, '2021-08-22 02:30:36', NULL, 83, 1);
INSERT INTO `admin_taskrelation` VALUES (90, 0, '2022-05-12 14:40:29', NULL, 84, 27);

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo`  (
  `adminid` int NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `adminname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名',
  `adminpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `isactive` tinyint NOT NULL DEFAULT 0 COMMENT '是否激活(0:未激活, 1:已激活)',
  `adminphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `adminemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `padminid` int NULL DEFAULT 'NULL' COMMENT '父管理员ID',
  PRIMARY KEY (`adminid`) USING BTREE,
  UNIQUE INDEX `adminphone`(`adminphone`) USING BTREE,
  UNIQUE INDEX `adminemail`(`adminemail`) USING BTREE,
  INDEX `padminid`(`padminid`) USING BTREE,
  CONSTRAINT `admininfo_ibfk_1` FOREIGN KEY (`padminid`) REFERENCES `admininfo` (`adminid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES (1, '端才良', 'E+#bWPwIcrjRt^RBCET', 1, '13423874189', 'opjdpmrauksskw@126.com', 15);
INSERT INTO `admininfo` VALUES (2, '蒙舒方', '!ZBfutlizhT6m~TcB8le', 1, '15734882709', 'hdala@56.com', 21);
INSERT INTO `admininfo` VALUES (3, '竺碧菡', 'ZP#T0WO4cvmv3KX', 1, '14702202913', 'nutrhklpvjpefbp@qq.com', 15);
INSERT INTO `admininfo` VALUES (4, '查书文', 'AJ^Wnq(aVWXQv9F', 1, '18889426395', 'aevfupwvdfvh@hotmail.com', 15);
INSERT INTO `admininfo` VALUES (5, '占经略', 'PVuwkFxQQx', 1, '18109416374', 'apmtgsrkniruir@21cn.com', 15);
INSERT INTO `admininfo` VALUES (6, '紫听然', 'EU6GJA^ns!', 1, '17203414523', 'goiflsavpeut@enet.com.cn', 15);
INSERT INTO `admininfo` VALUES (7, '戢齐敏', 'Wb&Hp!r%s%XhgsS&fDM', 1, '18029828973', 'nibao@163.com', 21);
INSERT INTO `admininfo` VALUES (8, '谭良朋', 'Tu(*dH9#HBrP', 1, '19879605630', 'fjvannmka@eastday.com', 7);
INSERT INTO `admininfo` VALUES (9, '仇语海', '%ZfoFeRVQTwR8&(', 1, '16639222254', 'dewgvov@163.net', 7);
INSERT INTO `admininfo` VALUES (10, '褚运诚', 'ofLpaF!iXop', 1, '15274391432', 'oebvv@eastday.com', 7);
INSERT INTO `admininfo` VALUES (11, '史凝', ')Xn(zQ0vn', 1, '18110977757', 'sjshcg@21cn.com', 7);
INSERT INTO `admininfo` VALUES (12, '畅邃', 'O%DpBR2N^E', 1, '19859629558', 'fkfufk@sina.com', 7);
INSERT INTO `admininfo` VALUES (13, '竹浩岚', 'RGNR$6beW', 1, '18561546569', 'uppwehkkc@yeah.net', 24);
INSERT INTO `admininfo` VALUES (14, '麦正业', 'qdQ%2NiH!$6', 1, '17741005218', 'bahwbher@msn.com', 24);
INSERT INTO `admininfo` VALUES (15, '曾合美', '^g9&&ReWu4o', 1, '17377237638', 'wbu@163.net', 21);
INSERT INTO `admininfo` VALUES (16, '完霁', 'da3y+b~+64vDN', 1, '14778341877', 'akiawedmeffgfl@35.com', 24);
INSERT INTO `admininfo` VALUES (17, '尾笑晴', 'd)_gD~K2kLdwo!r', 1, '14590915618', 'fqkfaukdmbqjjun@eyou.com', 24);
INSERT INTO `admininfo` VALUES (18, '仪慈', ')Lo%fY#Qw*', 1, '15112631143', 'fgwcbjouldrsb@sina.com', 24);
INSERT INTO `admininfo` VALUES (19, '勾怡然', 'n4EK9oyh6C+7', 1, '17354955785', 'curikpvdwfkvlqc@263.net', 2);
INSERT INTO `admininfo` VALUES (20, '覃涵梅', '1*BS@X8vzC36nK6t', 1, '14509053317', 'kewfvf@yeah.net', 2);
INSERT INTO `admininfo` VALUES (21, '班代天', 'AZHR1p00XcXjy&k@$9\r\n', 1, '18414137037', 'thlrq@263.net\r\n', NULL);
INSERT INTO `admininfo` VALUES (22, '友雨柏', 'xtW81w@Op5ZPTJB7o', 0, '13003963483', 'ckhmdfh@xinhuanet', 24);
INSERT INTO `admininfo` VALUES (23, '笪鸿德', 'xY5krHg~PVAi', 1, '17203049246', 'catnlcd@263.net', 2);
INSERT INTO `admininfo` VALUES (24, '都凡之', 'pumusnDX(viM^sL', 1, '13891263138', 'citwbdp@265.com', 21);
INSERT INTO `admininfo` VALUES (25, '中绿蕊', 'm*@~nuD8RjRHlcE', 1, '15676794682', 'ohjjguwtbj@sohu.com', 2);
INSERT INTO `admininfo` VALUES (26, '户光耀', '%IcwL%FN_kVF+fP', 1, '18614404476', 'jdtpcvinsq@qq.com', 15);
INSERT INTO `admininfo` VALUES (27, '千迎天', '3dG!a7wU1UYP', 1, '17753888161', 'uowod@qq.com', 7);
INSERT INTO `admininfo` VALUES (28, '狄香卉', 'F5whjNY$GuGf!9AM', 1, '17714306412', 'undqauqr@163.net', 24);
INSERT INTO `admininfo` VALUES (29, '周文君', 'M_^QDIz&58Nlo9', 0, '17765309305', 'oarsqqeagvegwgu@yeah.net', NULL);
INSERT INTO `admininfo` VALUES (30, '旷语风', 'Lv_AwXvu)O~)', 1, '13644317391', 'mouhq@263.net', 2);

-- ----------------------------
-- Table structure for complaint_and_acviceinfo
-- ----------------------------
DROP TABLE IF EXISTS `complaint_and_acviceinfo`;
CREATE TABLE `complaint_and_acviceinfo`  (
  `c_aid` int NOT NULL AUTO_INCREMENT COMMENT '投诉/建议ID',
  `c_atime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `c_aobject` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对被投诉/建议的对象的描述',
  `c_acontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `c_a_userid` int NOT NULL COMMENT '用户ID',
  `c_a_adminid` int NULL DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`c_aid`) USING BTREE,
  INDEX `c_a_userid`(`c_a_userid`) USING BTREE,
  INDEX `c_a_adminid`(`c_a_adminid`) USING BTREE,
  CONSTRAINT `complaint_and_acviceinfo_ibfk_1` FOREIGN KEY (`c_a_userid`) REFERENCES `userinfo` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `complaint_and_acviceinfo_ibfk_2` FOREIGN KEY (`c_a_adminid`) REFERENCES `admininfo` (`adminid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complaint_and_acviceinfo
-- ----------------------------
INSERT INTO `complaint_and_acviceinfo` VALUES (1, '2018-03-21 06:25:59', 'xxxxxx', 'xxxxxxx', 9, 20);
INSERT INTO `complaint_and_acviceinfo` VALUES (2, '2017-11-07 09:23:03', 'xxxxxx', 'xxxxxxx', 19, 25);
INSERT INTO `complaint_and_acviceinfo` VALUES (3, '2019-01-10 16:07:20', 'xxxxxx', 'xxxxxxx', 55, 11);
INSERT INTO `complaint_and_acviceinfo` VALUES (4, '2018-02-16 13:01:35', 'xxxxxx', 'xxxxxxx', 80, 20);
INSERT INTO `complaint_and_acviceinfo` VALUES (5, '2020-05-24 16:10:30', 'xxxxxx', 'xxxxxxx', 67, 20);
INSERT INTO `complaint_and_acviceinfo` VALUES (6, '2018-08-18 17:34:55', 'xxxxxx', 'xxxxxxx', 4, 1);
INSERT INTO `complaint_and_acviceinfo` VALUES (7, '2021-05-21 22:25:38', 'xxxxxx', 'xxxxxxx', 43, 11);
INSERT INTO `complaint_and_acviceinfo` VALUES (8, '2021-09-06 02:20:29', 'xxxxxx', 'xxxxxxx', 62, 1);
INSERT INTO `complaint_and_acviceinfo` VALUES (9, '2021-10-03 23:58:34', 'xxxxxx', 'xxxxxxx', 87, 17);
INSERT INTO `complaint_and_acviceinfo` VALUES (10, '2017-07-12 09:47:10', 'xxxxxx', 'xxxxxxx', 38, 3);
INSERT INTO `complaint_and_acviceinfo` VALUES (11, '2019-02-04 10:46:57', 'xxxxxx', 'xxxxxxx', 3, 16);
INSERT INTO `complaint_and_acviceinfo` VALUES (12, '2019-08-24 06:59:31', 'xxxxxx', 'xxxxxxx', 71, 17);
INSERT INTO `complaint_and_acviceinfo` VALUES (13, '2017-04-23 01:38:33', 'xxxxxx', 'xxxxxxx', 79, 26);
INSERT INTO `complaint_and_acviceinfo` VALUES (14, '2020-01-18 04:29:39', 'xxxxxx', 'xxxxxxx', 18, 11);
INSERT INTO `complaint_and_acviceinfo` VALUES (15, '2018-07-08 06:22:54', 'xxxxxx', 'xxxxxxx', 20, 12);
INSERT INTO `complaint_and_acviceinfo` VALUES (16, '2017-01-30 14:25:25', 'xxxxxx', 'xxxxxxx', 80, 8);
INSERT INTO `complaint_and_acviceinfo` VALUES (17, '2021-04-12 04:20:18', 'xxxxxx', 'xxxxxxx', 83, 13);
INSERT INTO `complaint_and_acviceinfo` VALUES (18, '2021-04-04 20:02:19', 'xxxxxx', 'xxxxxxx', 75, 13);
INSERT INTO `complaint_and_acviceinfo` VALUES (19, '2022-01-17 09:36:19', 'xxxxxx', 'xxxxxxx', 17, 19);
INSERT INTO `complaint_and_acviceinfo` VALUES (20, '2019-09-07 13:29:48', 'xxxxxx', 'xxxxxxx', 8, 17);
INSERT INTO `complaint_and_acviceinfo` VALUES (21, '2020-06-11 18:03:29', 'xxxxxx', 'xxxxxxx', 72, 17);
INSERT INTO `complaint_and_acviceinfo` VALUES (22, '2019-09-27 13:09:53', 'xxxxxx', 'xxxxxxx', 13, 4);
INSERT INTO `complaint_and_acviceinfo` VALUES (23, '2021-01-26 03:32:00', 'xxxxxx', 'xxxxxxx', 76, 14);
INSERT INTO `complaint_and_acviceinfo` VALUES (24, '2018-02-20 12:17:42', 'xxxxxx', 'xxxxxxx', 62, 28);
INSERT INTO `complaint_and_acviceinfo` VALUES (25, '2017-02-17 03:16:00', 'xxxxxx', 'xxxxxxx', 87, 11);
INSERT INTO `complaint_and_acviceinfo` VALUES (26, '2021-05-26 05:17:28', 'xxxxxx', 'xxxxxxx', 1, 17);
INSERT INTO `complaint_and_acviceinfo` VALUES (27, '2022-04-24 10:57:12', 'xxxxxx', 'xxxxxxx', 72, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (28, '2020-12-30 20:07:04', 'xxxxxx', 'xxxxxxx', 70, 12);
INSERT INTO `complaint_and_acviceinfo` VALUES (29, '2018-03-28 21:10:56', 'xxxxxx', 'xxxxxxx', 48, 13);
INSERT INTO `complaint_and_acviceinfo` VALUES (30, '2019-04-27 10:05:43', 'xxxxxx', 'xxxxxxx', 9, 19);
INSERT INTO `complaint_and_acviceinfo` VALUES (31, '2021-09-12 18:39:32', 'xxxxxx', 'xxxxxxx', 95, 6);
INSERT INTO `complaint_and_acviceinfo` VALUES (32, '2017-04-21 08:21:54', 'xxxxxx', 'xxxxxxx', 62, 20);
INSERT INTO `complaint_and_acviceinfo` VALUES (33, '2018-11-10 02:39:15', 'xxxxxx', 'xxxxxxx', 80, 12);
INSERT INTO `complaint_and_acviceinfo` VALUES (34, '2021-12-07 19:12:51', 'xxxxxx', 'xxxxxxx', 86, 4);
INSERT INTO `complaint_and_acviceinfo` VALUES (35, '2018-02-21 16:22:02', 'xxxxxx', 'xxxxxxx', 23, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (36, '2021-05-28 07:33:26', 'xxxxxx', 'xxxxxxx', 58, 25);
INSERT INTO `complaint_and_acviceinfo` VALUES (37, '2022-04-10 23:18:01', 'xxxxxx', 'xxxxxxx', 12, 28);
INSERT INTO `complaint_and_acviceinfo` VALUES (38, '2021-04-24 09:16:32', 'xxxxxx', 'xxxxxxx', 84, 5);
INSERT INTO `complaint_and_acviceinfo` VALUES (39, '2019-05-14 22:36:09', 'xxxxxx', 'xxxxxxx', 54, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (40, '2018-05-27 02:18:47', 'xxxxxx', 'xxxxxxx', 1, 18);
INSERT INTO `complaint_and_acviceinfo` VALUES (41, '2018-07-30 14:28:58', 'xxxxxx', 'xxxxxxx', 84, 10);
INSERT INTO `complaint_and_acviceinfo` VALUES (42, '2021-12-31 22:55:40', 'xxxxxx', 'xxxxxxx', 80, 23);
INSERT INTO `complaint_and_acviceinfo` VALUES (43, '2019-09-05 06:39:23', 'xxxxxx', 'xxxxxxx', 25, 30);
INSERT INTO `complaint_and_acviceinfo` VALUES (44, '2020-04-23 05:19:37', 'xxxxxx', 'xxxxxxx', 99, 19);
INSERT INTO `complaint_and_acviceinfo` VALUES (45, '2017-03-15 03:06:08', 'xxxxxx', 'xxxxxxx', 27, 12);
INSERT INTO `complaint_and_acviceinfo` VALUES (46, '2019-02-03 15:48:21', 'xxxxxx', 'xxxxxxx', 47, 18);
INSERT INTO `complaint_and_acviceinfo` VALUES (47, '2020-07-07 07:58:48', 'xxxxxx', 'xxxxxxx', 52, 4);
INSERT INTO `complaint_and_acviceinfo` VALUES (48, '2022-05-12 19:28:31', 'xxxxxx', 'xxxxxxx', 95, 12);
INSERT INTO `complaint_and_acviceinfo` VALUES (49, '2019-10-26 05:56:16', 'xxxxxx', 'xxxxxxx', 97, 23);
INSERT INTO `complaint_and_acviceinfo` VALUES (50, '2019-02-07 23:21:56', 'xxxxxx', 'xxxxxxx', 25, 10);
INSERT INTO `complaint_and_acviceinfo` VALUES (51, '2017-07-09 14:59:18', 'xxxxxx', 'xxxxxxx', 77, 18);
INSERT INTO `complaint_and_acviceinfo` VALUES (52, '2017-12-10 05:38:23', 'xxxxxx', 'xxxxxxx', 99, 12);
INSERT INTO `complaint_and_acviceinfo` VALUES (53, '2020-10-15 15:50:24', 'xxxxxx', 'xxxxxxx', 86, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (54, '2019-02-20 19:58:55', 'xxxxxx', 'xxxxxxx', 91, 30);
INSERT INTO `complaint_and_acviceinfo` VALUES (55, '2021-09-27 15:49:28', 'xxxxxx', 'xxxxxxx', 11, 14);
INSERT INTO `complaint_and_acviceinfo` VALUES (56, '2019-12-15 18:25:13', 'xxxxxx', 'xxxxxxx', 91, 6);
INSERT INTO `complaint_and_acviceinfo` VALUES (57, '2022-02-06 20:12:49', 'xxxxxx', 'xxxxxxx', 54, 10);
INSERT INTO `complaint_and_acviceinfo` VALUES (58, '2018-05-17 01:35:20', 'xxxxxx', 'xxxxxxx', 46, 3);
INSERT INTO `complaint_and_acviceinfo` VALUES (59, '2018-11-26 06:22:31', 'xxxxxx', 'xxxxxxx', 30, 14);
INSERT INTO `complaint_and_acviceinfo` VALUES (60, '2017-10-15 16:03:24', 'xxxxxx', 'xxxxxxx', 65, 13);
INSERT INTO `complaint_and_acviceinfo` VALUES (61, '2017-05-31 21:37:32', 'xxxxxx', 'xxxxxxx', 77, 14);
INSERT INTO `complaint_and_acviceinfo` VALUES (62, '2021-12-24 14:46:47', 'xxxxxx', 'xxxxxxx', 88, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (63, '2018-07-05 18:28:44', 'xxxxxx', 'xxxxxxx', 15, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (64, '2017-12-16 19:56:36', 'xxxxxx', 'xxxxxxx', 43, 10);
INSERT INTO `complaint_and_acviceinfo` VALUES (65, '2017-03-02 16:04:41', 'xxxxxx', 'xxxxxxx', 96, 28);
INSERT INTO `complaint_and_acviceinfo` VALUES (66, '2021-02-17 05:10:51', 'xxxxxx', 'xxxxxxx', 16, 26);
INSERT INTO `complaint_and_acviceinfo` VALUES (67, '2021-07-14 01:10:36', 'xxxxxx', 'xxxxxxx', 30, 28);
INSERT INTO `complaint_and_acviceinfo` VALUES (68, '2021-02-06 01:48:22', 'xxxxxx', 'xxxxxxx', 94, 5);
INSERT INTO `complaint_and_acviceinfo` VALUES (69, '2021-11-07 09:16:32', 'xxxxxx', 'xxxxxxx', 4, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (70, '2021-01-27 09:07:34', 'xxxxxx', 'xxxxxxx', 40, 6);
INSERT INTO `complaint_and_acviceinfo` VALUES (71, '2022-02-20 11:08:37', 'xxxxxx', 'xxxxxxx', 33, 13);
INSERT INTO `complaint_and_acviceinfo` VALUES (72, '2021-01-22 09:40:19', 'xxxxxx', 'xxxxxxx', 23, 14);
INSERT INTO `complaint_and_acviceinfo` VALUES (73, '2019-09-02 21:16:19', 'xxxxxx', 'xxxxxxx', 14, 4);
INSERT INTO `complaint_and_acviceinfo` VALUES (74, '2022-03-04 16:00:57', 'xxxxxx', 'xxxxxxx', 22, 6);
INSERT INTO `complaint_and_acviceinfo` VALUES (75, '2017-05-15 14:54:52', 'xxxxxx', 'xxxxxxx', 68, 4);
INSERT INTO `complaint_and_acviceinfo` VALUES (76, '2017-11-25 04:21:13', 'xxxxxx', 'xxxxxxx', 10, 11);
INSERT INTO `complaint_and_acviceinfo` VALUES (77, '2020-12-17 20:23:28', 'xxxxxx', 'xxxxxxx', 66, 27);
INSERT INTO `complaint_and_acviceinfo` VALUES (78, '2017-02-09 20:29:25', 'xxxxxx', 'xxxxxxx', 66, 19);
INSERT INTO `complaint_and_acviceinfo` VALUES (79, '2018-07-15 23:59:23', 'xxxxxx', 'xxxxxxx', 73, 6);
INSERT INTO `complaint_and_acviceinfo` VALUES (80, '2019-06-30 02:58:32', 'xxxxxx', 'xxxxxxx', 76, 6);
INSERT INTO `complaint_and_acviceinfo` VALUES (81, '2020-03-24 03:10:23', 'xxxxxx', 'xxxxxxx', 83, 4);
INSERT INTO `complaint_and_acviceinfo` VALUES (82, '2020-06-05 17:02:21', 'xxxxxx', 'xxxxxxx', 74, 9);
INSERT INTO `complaint_and_acviceinfo` VALUES (83, '2020-03-06 02:09:56', 'xxxxxx', 'xxxxxxx', 33, 13);
INSERT INTO `complaint_and_acviceinfo` VALUES (84, '2022-02-07 03:35:12', 'xxxxxx', 'xxxxxxx', 17, 8);
INSERT INTO `complaint_and_acviceinfo` VALUES (85, '2020-03-02 06:58:01', 'xxxxxx', 'xxxxxxx', 68, 30);
INSERT INTO `complaint_and_acviceinfo` VALUES (86, '2017-03-10 01:38:43', 'xxxxxx', 'xxxxxxx', 62, 3);
INSERT INTO `complaint_and_acviceinfo` VALUES (87, '2017-04-30 12:10:09', 'xxxxxx', 'xxxxxxx', 17, 18);
INSERT INTO `complaint_and_acviceinfo` VALUES (88, '2021-07-18 16:30:32', 'xxxxxx', 'xxxxxxx', 27, 6);
INSERT INTO `complaint_and_acviceinfo` VALUES (89, '2018-06-15 01:09:23', 'xxxxxx', 'xxxxxxx', 54, 1);
INSERT INTO `complaint_and_acviceinfo` VALUES (90, '2017-04-13 09:42:48', 'xxxxxx', 'xxxxxxx', 83, 28);
INSERT INTO `complaint_and_acviceinfo` VALUES (91, '2020-09-28 21:25:35', 'xxxxxx', 'xxxxxxx', 68, 26);
INSERT INTO `complaint_and_acviceinfo` VALUES (92, '2017-11-06 01:35:23', 'xxxxxx', 'xxxxxxx', 47, 26);
INSERT INTO `complaint_and_acviceinfo` VALUES (93, '2017-02-12 03:16:28', 'xxxxxx', 'xxxxxxx', 92, 12);
INSERT INTO `complaint_and_acviceinfo` VALUES (94, '2017-08-23 05:43:37', 'xxxxxx', 'xxxxxxx', 18, 17);
INSERT INTO `complaint_and_acviceinfo` VALUES (95, '2021-03-24 04:09:38', 'xxxxxx', 'xxxxxxx', 51, 23);
INSERT INTO `complaint_and_acviceinfo` VALUES (96, '2018-11-24 14:32:17', 'xxxxxx', 'xxxxxxx', 53, 14);
INSERT INTO `complaint_and_acviceinfo` VALUES (97, '2018-11-11 23:20:54', 'xxxxxx', 'xxxxxxx', 64, 16);
INSERT INTO `complaint_and_acviceinfo` VALUES (98, '2018-08-16 04:15:54', 'xxxxxx', 'xxxxxxx', 74, 1);
INSERT INTO `complaint_and_acviceinfo` VALUES (99, '2021-02-23 16:05:48', 'xxxxxx', 'xxxxxxx', 46, 8);
INSERT INTO `complaint_and_acviceinfo` VALUES (100, '2020-08-16 00:42:01', 'xxxxxx', 'xxxxxxx', 13, 20);

-- ----------------------------
-- Table structure for costinfo
-- ----------------------------
DROP TABLE IF EXISTS `costinfo`;
CREATE TABLE `costinfo`  (
  `costid` int NOT NULL AUTO_INCREMENT COMMENT '费用ID',
  `coststarttime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `paytime` timestamp NULL DEFAULT NULL COMMENT '缴费时间',
  `costmoney` double NOT NULL COMMENT '金额',
  `cost_houseid` int NOT NULL COMMENT '房屋ID',
  `cost_userid` int NOT NULL COMMENT '用户ID',
  `cost_costtypeid` int NOT NULL COMMENT '费用类型ID',
  PRIMARY KEY (`costid`) USING BTREE,
  INDEX `cost_houseid`(`cost_houseid`) USING BTREE,
  INDEX `cost_userid`(`cost_userid`) USING BTREE,
  INDEX `cost_costtypeid`(`cost_costtypeid`) USING BTREE,
  CONSTRAINT `costinfo_ibfk_1` FOREIGN KEY (`cost_houseid`) REFERENCES `houseinfo` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `costinfo_ibfk_2` FOREIGN KEY (`cost_userid`) REFERENCES `userinfo` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `costinfo_ibfk_3` FOREIGN KEY (`cost_costtypeid`) REFERENCES `costtypeinfo` (`costtypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of costinfo
-- ----------------------------
INSERT INTO `costinfo` VALUES (1, '2021-06-08 12:33:55', '2021-06-13 07:43:55', 232.78487872169728, 20, 7, 5);
INSERT INTO `costinfo` VALUES (2, '2020-09-15 08:09:39', '2020-09-16 10:03:03', 468.67646915333125, 7, 36, 6);
INSERT INTO `costinfo` VALUES (3, '2019-07-31 06:36:49', '2019-08-02 12:45:22', 329.82261341522945, 26, 41, 5);
INSERT INTO `costinfo` VALUES (4, '2018-01-12 18:46:59', '2018-01-17 11:39:13', 932.2156533715017, 24, 48, 2);
INSERT INTO `costinfo` VALUES (5, '2017-05-16 17:22:13', '2017-05-20 02:35:06', 563.5173007753338, 39, 66, 2);
INSERT INTO `costinfo` VALUES (6, '2017-11-05 00:31:37', '2017-11-07 10:30:27', 499.53757386691956, 13, 90, 6);
INSERT INTO `costinfo` VALUES (7, '2019-01-30 04:35:13', '2019-02-03 16:52:05', 232.07654067646848, 8, 10, 6);
INSERT INTO `costinfo` VALUES (8, '2017-01-16 05:45:53', '2017-01-21 17:27:24', 140.75144300916793, 11, 34, 2);
INSERT INTO `costinfo` VALUES (9, '2019-03-13 06:39:08', '2019-03-13 20:50:08', 67.16266014073472, 31, 79, 2);
INSERT INTO `costinfo` VALUES (10, '2021-12-02 21:53:48', '2021-12-06 04:47:59', 574.4748885431089, 27, 39, 6);
INSERT INTO `costinfo` VALUES (11, '2018-10-03 19:03:41', '2018-10-07 10:07:00', 474.0209763188665, 35, 8, 3);
INSERT INTO `costinfo` VALUES (12, '2017-12-09 15:11:06', '2017-12-13 22:20:03', 42.92830215026217, 25, 77, 6);
INSERT INTO `costinfo` VALUES (13, '2022-03-28 21:48:06', '2022-03-30 23:10:47', 572.8319477305392, 4, 97, 2);
INSERT INTO `costinfo` VALUES (14, '2017-07-10 19:08:57', '2017-07-11 00:39:13', 689.2280843847824, 3, 28, 3);
INSERT INTO `costinfo` VALUES (15, '2017-04-05 02:03:19', '2017-04-06 14:11:59', 614.9094148357829, 15, 45, 1);
INSERT INTO `costinfo` VALUES (16, '2020-11-19 10:04:32', '2020-11-20 09:26:31', 211.63849198901107, 28, 63, 5);
INSERT INTO `costinfo` VALUES (17, '2021-12-23 21:00:13', '2021-12-25 09:34:47', 262.99938267413245, 37, 21, 6);
INSERT INTO `costinfo` VALUES (18, '2018-10-20 20:04:22', '2018-10-24 20:45:18', 683.4879600654581, 31, 56, 3);
INSERT INTO `costinfo` VALUES (19, '2022-03-18 08:51:58', '2022-03-21 09:33:09', 58.69768393278832, 24, 100, 6);
INSERT INTO `costinfo` VALUES (20, '2019-01-16 22:20:12', '2019-01-19 09:32:17', 440.5860535207093, 12, 2, 6);
INSERT INTO `costinfo` VALUES (21, '2018-11-06 10:51:51', '2018-11-11 09:42:55', 298.33395305470407, 4, 22, 2);
INSERT INTO `costinfo` VALUES (22, '2017-09-09 21:43:20', '2017-09-14 10:59:39', 724.2289513743658, 9, 24, 5);
INSERT INTO `costinfo` VALUES (23, '2018-05-18 00:14:28', '2018-05-23 22:41:33', 603.370197897783, 26, 70, 6);
INSERT INTO `costinfo` VALUES (24, '2021-06-15 18:53:24', '2021-06-17 11:41:00', 257.6962956829445, 22, 95, 4);
INSERT INTO `costinfo` VALUES (25, '2017-12-25 10:15:08', '2017-12-28 20:29:21', 632.9744265115065, 38, 14, 4);
INSERT INTO `costinfo` VALUES (26, '2021-08-27 08:39:32', '2021-08-31 22:57:32', 982.3063084614839, 34, 88, 3);
INSERT INTO `costinfo` VALUES (27, '2017-06-06 19:51:42', '2017-06-06 02:31:47', 229.7288390204918, 9, 38, 6);
INSERT INTO `costinfo` VALUES (28, '2020-05-30 04:33:19', '2020-06-01 07:13:55', 547.902663687483, 20, 13, 6);
INSERT INTO `costinfo` VALUES (29, '2020-06-23 00:41:21', '2020-06-25 10:09:01', 649.2653092680033, 2, 42, 3);
INSERT INTO `costinfo` VALUES (30, '2019-09-11 22:07:43', '2019-09-11 05:34:26', 260.537003198367, 4, 44, 3);
INSERT INTO `costinfo` VALUES (31, '2018-05-23 17:53:11', '2018-05-25 09:04:54', 201.37774959341309, 28, 49, 1);
INSERT INTO `costinfo` VALUES (32, '2019-10-27 02:50:37', '2019-10-30 11:04:16', 396.6768477596746, 3, 98, 1);
INSERT INTO `costinfo` VALUES (33, '2020-10-13 20:12:25', '2020-10-13 21:29:23', 873.4242166636427, 3, 19, 4);
INSERT INTO `costinfo` VALUES (34, '2021-10-23 13:43:50', '2021-10-27 19:55:19', 35.343745391579965, 8, 23, 6);
INSERT INTO `costinfo` VALUES (35, '2021-12-23 23:32:40', '2021-12-27 00:38:30', 722.0372814197307, 26, 99, 1);
INSERT INTO `costinfo` VALUES (36, '2021-12-19 08:54:47', '2021-12-23 23:02:17', 865.5588439049603, 40, 30, 6);
INSERT INTO `costinfo` VALUES (37, '2020-03-02 07:20:20', '2020-03-07 08:27:41', 646.4171789956071, 38, 43, 4);
INSERT INTO `costinfo` VALUES (38, '2019-07-04 05:14:25', '2019-07-07 22:15:40', 242.0259553494621, 36, 54, 4);
INSERT INTO `costinfo` VALUES (39, '2018-05-17 19:42:16', '2018-05-18 11:25:50', 817.817288571326, 10, 61, 6);
INSERT INTO `costinfo` VALUES (40, '2018-03-17 17:59:48', '2018-03-20 07:08:58', 959.4884199609421, 26, 94, 1);
INSERT INTO `costinfo` VALUES (41, '2017-03-30 19:20:37', '2017-04-03 03:56:48', 243.85146380807328, 5, 5, 4);
INSERT INTO `costinfo` VALUES (42, '2017-01-14 07:49:02', '2017-01-14 04:53:28', 485.63484389418153, 9, 40, 4);
INSERT INTO `costinfo` VALUES (43, '2018-01-30 13:53:01', '2018-01-30 22:01:06', 190.2724154359426, 40, 64, 3);
INSERT INTO `costinfo` VALUES (44, '2021-07-15 00:24:15', '2021-07-18 16:43:46', 433.1952327240465, 10, 75, 4);
INSERT INTO `costinfo` VALUES (45, '2017-07-07 03:22:58', '2017-07-07 02:06:07', 96.34578323039699, 32, 96, 1);
INSERT INTO `costinfo` VALUES (46, '2020-01-19 05:36:18', '2020-01-24 23:44:05', 883.9690644504402, 37, 9, 4);
INSERT INTO `costinfo` VALUES (47, '2018-11-09 20:35:43', '2018-11-13 06:45:54', 934.4106680880403, 28, 32, 5);
INSERT INTO `costinfo` VALUES (48, '2017-01-09 14:39:18', '2017-01-11 07:44:17', 821.2854989942734, 39, 82, 2);
INSERT INTO `costinfo` VALUES (49, '2018-05-08 03:27:44', '2018-05-10 10:50:03', 194.15728356630845, 22, 92, 5);
INSERT INTO `costinfo` VALUES (50, '2021-12-17 01:57:13', '2021-12-18 23:24:10', 417.8054663740341, 30, 6, 1);
INSERT INTO `costinfo` VALUES (51, '2017-08-01 22:08:20', '2017-08-01 13:59:01', 961.6249549926738, 32, 73, 5);
INSERT INTO `costinfo` VALUES (52, '2018-10-19 05:54:51', '2018-10-24 04:10:39', 396.47588747903274, 25, 35, 1);
INSERT INTO `costinfo` VALUES (53, '2020-11-07 19:59:14', '2020-11-07 12:29:18', 617.3028222212279, 29, 55, 3);
INSERT INTO `costinfo` VALUES (54, '2017-05-14 11:15:04', '2017-05-18 06:40:51', 413.8481879143577, 39, 60, 3);
INSERT INTO `costinfo` VALUES (55, '2022-04-08 15:42:32', '2022-04-12 12:09:44', 395.30886611109736, 11, 69, 3);
INSERT INTO `costinfo` VALUES (56, '2018-07-17 11:26:30', '2018-07-21 12:09:23', 425.31703541416465, 11, 74, 6);
INSERT INTO `costinfo` VALUES (57, '2021-11-10 02:18:10', '2021-11-11 20:34:09', 741.7627568878705, 35, 72, 4);
INSERT INTO `costinfo` VALUES (58, '2019-04-16 04:29:41', '2019-04-16 02:33:00', 640.1048565403491, 23, 51, 2);
INSERT INTO `costinfo` VALUES (59, '2017-04-10 07:50:04', '2017-04-13 16:17:28', 549.1459914824842, 14, 87, 5);
INSERT INTO `costinfo` VALUES (60, '2017-08-14 05:20:40', '2017-08-18 09:02:35', 345.7036761398346, 31, 59, 2);
INSERT INTO `costinfo` VALUES (61, '2018-02-22 11:49:02', '2018-02-22 01:09:32', 791.8842891061352, 29, 80, 3);
INSERT INTO `costinfo` VALUES (62, '2017-03-16 23:43:58', '2017-03-17 17:21:07', 477.2700358755544, 29, 11, 5);
INSERT INTO `costinfo` VALUES (63, '2019-11-12 03:06:43', '2019-11-14 08:31:30', 367.24373509606636, 21, 18, 5);
INSERT INTO `costinfo` VALUES (64, '2020-11-07 02:53:10', '2020-11-12 14:25:49', 757.6313531974619, 22, 81, 4);
INSERT INTO `costinfo` VALUES (65, '2017-02-28 04:55:38', '2017-03-04 11:38:28', 109.85669550685681, 8, 65, 6);
INSERT INTO `costinfo` VALUES (66, '2018-03-20 11:32:47', '2018-03-25 11:16:34', 583.0287371228005, 26, 33, 5);
INSERT INTO `costinfo` VALUES (67, '2021-09-19 22:37:02', '2021-09-22 14:40:24', 716.2980614730297, 34, 50, 4);
INSERT INTO `costinfo` VALUES (68, '2021-03-13 16:53:17', '2021-03-16 08:40:00', 404.9153753982554, 3, 57, 1);
INSERT INTO `costinfo` VALUES (69, '2018-01-10 04:18:15', '2018-01-13 15:06:58', 325.00998247720935, 13, 78, 1);
INSERT INTO `costinfo` VALUES (70, '2020-05-01 05:42:32', '2020-05-05 11:03:00', 371.0295413914781, 3, 58, 6);
INSERT INTO `costinfo` VALUES (71, '2018-05-13 05:41:10', '2018-05-18 13:18:41', 695.5755040742082, 33, 1, 3);
INSERT INTO `costinfo` VALUES (72, '2021-02-26 03:18:06', '2021-03-01 23:32:42', 67.4593103187982, 5, 31, 3);
INSERT INTO `costinfo` VALUES (73, '2020-05-18 05:13:19', '2020-05-20 15:43:53', 99.42877596938852, 32, 89, 1);
INSERT INTO `costinfo` VALUES (74, '2020-10-15 05:57:02', '2020-10-20 05:51:05', 220.88924255568648, 18, 29, 4);
INSERT INTO `costinfo` VALUES (75, '2019-08-27 08:06:07', '2019-08-31 21:53:47', 705.8814753640555, 29, 47, 1);
INSERT INTO `costinfo` VALUES (76, '2017-03-25 12:37:31', '2017-03-30 22:12:58', 457.99283008121785, 20, 86, 4);
INSERT INTO `costinfo` VALUES (77, '2017-12-05 15:55:28', '2017-12-06 08:24:46', 560.7228130003988, 39, 4, 5);
INSERT INTO `costinfo` VALUES (78, '2020-02-26 14:18:16', '2020-03-02 06:06:20', 53.239796771716215, 25, 17, 2);
INSERT INTO `costinfo` VALUES (79, '2019-03-20 01:36:41', '2019-03-23 09:56:31', 177.73719310648085, 6, 26, 6);
INSERT INTO `costinfo` VALUES (80, '2017-06-26 00:13:33', '2017-06-27 04:54:49', 601.8725499726648, 22, 37, 3);
INSERT INTO `costinfo` VALUES (81, '2022-04-25 23:30:49', '2022-04-29 03:36:17', 210.01914817563892, 5, 46, 3);
INSERT INTO `costinfo` VALUES (82, '2018-03-06 08:56:33', '2018-03-11 00:07:43', 466.80712319422355, 1, 53, 1);
INSERT INTO `costinfo` VALUES (83, '2020-12-05 20:14:08', '2020-12-07 00:17:33', 504.0933335759113, 39, 76, 2);
INSERT INTO `costinfo` VALUES (84, '2021-07-29 08:33:48', '2021-07-31 19:43:49', 575.0853529273328, 10, 27, 6);
INSERT INTO `costinfo` VALUES (85, '2019-02-03 19:41:14', '2019-02-07 19:08:33', 745.1066299333957, 14, 84, 5);
INSERT INTO `costinfo` VALUES (86, '2017-01-26 14:47:47', '2017-01-28 09:57:04', 897.6112759665315, 1, 62, 2);
INSERT INTO `costinfo` VALUES (87, '2019-02-10 14:40:25', '2019-02-15 12:52:39', 338.9852896939696, 4, 85, 6);
INSERT INTO `costinfo` VALUES (88, '2018-05-23 00:08:34', '2018-05-27 17:22:29', 54.88872940176486, 1, 93, 3);
INSERT INTO `costinfo` VALUES (89, '2022-01-28 11:50:38', '2022-02-02 01:27:53', 777.8718875134501, 38, 15, 6);
INSERT INTO `costinfo` VALUES (90, '2017-08-15 07:39:12', '2017-08-20 23:11:28', 338.06986040053664, 30, 71, 6);
INSERT INTO `costinfo` VALUES (91, '2021-05-09 14:44:06', '2021-05-10 08:03:15', 61.503040730302, 20, 12, 1);
INSERT INTO `costinfo` VALUES (92, '2019-01-19 06:37:35', '2019-01-23 23:49:03', 596.0408967486004, 28, 20, 6);
INSERT INTO `costinfo` VALUES (93, '2021-06-03 10:44:11', '2021-06-08 00:44:59', 441.69886898924335, 32, 83, 4);
INSERT INTO `costinfo` VALUES (94, '2021-05-16 06:47:26', '2021-05-20 12:03:53', 974.8835079456616, 35, 68, 4);

-- ----------------------------
-- Table structure for costtypeinfo
-- ----------------------------
DROP TABLE IF EXISTS `costtypeinfo`;
CREATE TABLE `costtypeinfo`  (
  `costtypeid` int NOT NULL AUTO_INCREMENT COMMENT '费用类型ID',
  `costtype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '费用类型',
  PRIMARY KEY (`costtypeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of costtypeinfo
-- ----------------------------
INSERT INTO `costtypeinfo` VALUES (1, '水费');
INSERT INTO `costtypeinfo` VALUES (2, '电费');
INSERT INTO `costtypeinfo` VALUES (3, '气费');
INSERT INTO `costtypeinfo` VALUES (4, '维修费');
INSERT INTO `costtypeinfo` VALUES (5, '物管费');
INSERT INTO `costtypeinfo` VALUES (6, '清洁费');

-- ----------------------------
-- Table structure for houseinfo
-- ----------------------------
DROP TABLE IF EXISTS `houseinfo`;
CREATE TABLE `houseinfo`  (
  `houseid` int NOT NULL AUTO_INCREMENT COMMENT '房屋ID',
  `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '位置',
  `housestate` tinyint NOT NULL DEFAULT 0 COMMENT '房屋状态(0:无用户, 1:有用户)',
  `house_adminid` int NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`houseid`) USING BTREE,
  INDEX `house_adminid`(`house_adminid`) USING BTREE,
  CONSTRAINT `houseinfo_ibfk_1` FOREIGN KEY (`house_adminid`) REFERENCES `admininfo` (`adminid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of houseinfo
-- ----------------------------
INSERT INTO `houseinfo` VALUES (1, '清溪小区4 栋8楼20号', 1, 8);
INSERT INTO `houseinfo` VALUES (2, '清溪小区5 栋2楼12号', 1, 16);
INSERT INTO `houseinfo` VALUES (3, '清溪小区4 栋4楼11号', 1, 25);
INSERT INTO `houseinfo` VALUES (4, '清溪小区3 栋11楼8号', 1, 26);
INSERT INTO `houseinfo` VALUES (5, '清溪小区5 栋11楼17号', 1, 13);
INSERT INTO `houseinfo` VALUES (6, '清溪小区1 栋10楼10号', 1, 1);
INSERT INTO `houseinfo` VALUES (7, '清溪小区3 栋2楼16号', 1, 1);
INSERT INTO `houseinfo` VALUES (8, '清溪小区5 栋5楼13号', 1, 20);
INSERT INTO `houseinfo` VALUES (9, '清溪小区3 栋12楼13号', 1, 28);
INSERT INTO `houseinfo` VALUES (10, '清溪小区4 栋2楼19号', 1, 23);
INSERT INTO `houseinfo` VALUES (11, '清溪小区3 栋11楼15号', 1, 25);
INSERT INTO `houseinfo` VALUES (12, '清溪小区3 栋12楼12号', 1, 27);
INSERT INTO `houseinfo` VALUES (13, '清溪小区3 栋4楼11号', 1, 5);
INSERT INTO `houseinfo` VALUES (14, '清溪小区1 栋10楼15号', 1, 4);
INSERT INTO `houseinfo` VALUES (15, '清溪小区5 栋9楼13号', 1, 18);
INSERT INTO `houseinfo` VALUES (16, '清溪小区5 栋3楼16号', 0, 17);
INSERT INTO `houseinfo` VALUES (17, '清溪小区2 栋5楼17号', 0, 14);
INSERT INTO `houseinfo` VALUES (18, '清溪小区2 栋12楼18号', 1, 1);
INSERT INTO `houseinfo` VALUES (19, '清溪小区5 栋11楼16号', 0, 12);
INSERT INTO `houseinfo` VALUES (20, '清溪小区4 栋8楼12号', 1, 4);
INSERT INTO `houseinfo` VALUES (21, '清溪小区1 栋11楼14号', 1, 8);
INSERT INTO `houseinfo` VALUES (22, '清溪小区4 栋4楼14号', 1, 26);
INSERT INTO `houseinfo` VALUES (23, '清溪小区2 栋2楼15号', 1, 5);
INSERT INTO `houseinfo` VALUES (24, '清溪小区5 栋6楼16号', 1, 27);
INSERT INTO `houseinfo` VALUES (25, '清溪小区4 栋8楼18号', 1, 6);
INSERT INTO `houseinfo` VALUES (26, '清溪小区2 栋3楼16号', 1, 8);
INSERT INTO `houseinfo` VALUES (27, '清溪小区2 栋4楼9号', 1, 12);
INSERT INTO `houseinfo` VALUES (28, '清溪小区5 栋12楼16号', 1, 14);
INSERT INTO `houseinfo` VALUES (29, '清溪小区1 栋9楼18号', 1, 23);
INSERT INTO `houseinfo` VALUES (30, '清溪小区3 栋7楼8号', 1, 12);
INSERT INTO `houseinfo` VALUES (31, '清溪小区5 栋8楼19号', 1, 28);
INSERT INTO `houseinfo` VALUES (32, '清溪小区5 栋6楼10号', 1, 25);
INSERT INTO `houseinfo` VALUES (33, '清溪小区1 栋1楼11号', 1, 11);
INSERT INTO `houseinfo` VALUES (34, '清溪小区4 栋7楼20号', 1, 3);
INSERT INTO `houseinfo` VALUES (35, '清溪小区4 栋5楼11号', 1, 28);
INSERT INTO `houseinfo` VALUES (36, '清溪小区2 栋8楼12号', 1, 18);
INSERT INTO `houseinfo` VALUES (37, '清溪小区5 栋8楼16号', 1, 27);
INSERT INTO `houseinfo` VALUES (38, '清溪小区3 栋6楼11号', 1, 11);
INSERT INTO `houseinfo` VALUES (39, '清溪小区3 栋6楼10号', 1, 10);
INSERT INTO `houseinfo` VALUES (40, '清溪小区1 栋2楼9号', 1, 12);
INSERT INTO `houseinfo` VALUES (41, '清溪小区1 栋10楼11号', 0, 3);
INSERT INTO `houseinfo` VALUES (42, '清溪小区1 栋3楼11号', 0, 13);
INSERT INTO `houseinfo` VALUES (43, '清溪小区5 栋10楼15号', 0, 10);
INSERT INTO `houseinfo` VALUES (44, '清溪小区1 栋6楼18号', 0, 20);
INSERT INTO `houseinfo` VALUES (45, '清溪小区2 栋7楼10号', 0, 17);
INSERT INTO `houseinfo` VALUES (46, '清溪小区3 栋3楼19号', 0, 4);
INSERT INTO `houseinfo` VALUES (47, '清溪小区1 栋12楼14号', 0, 10);
INSERT INTO `houseinfo` VALUES (48, '清溪小区2 栋4楼13号', 0, 9);
INSERT INTO `houseinfo` VALUES (49, '清溪小区5 栋10楼16号', 0, 11);
INSERT INTO `houseinfo` VALUES (50, '清溪小区5 栋3楼18号', 0, 18);
INSERT INTO `houseinfo` VALUES (51, '清溪小区5 栋9楼10号', 0, 30);
INSERT INTO `houseinfo` VALUES (52, '清溪小区1 栋4楼10号', 0, 16);
INSERT INTO `houseinfo` VALUES (53, '清溪小区3 栋10楼13号', 0, 20);
INSERT INTO `houseinfo` VALUES (54, '清溪小区3 栋2楼12号', 0, 30);
INSERT INTO `houseinfo` VALUES (55, '清溪小区2 栋2楼9号', 0, 6);
INSERT INTO `houseinfo` VALUES (56, '清溪小区3 栋4楼13号', 0, 8);
INSERT INTO `houseinfo` VALUES (57, '清溪小区2 栋11楼19号', 0, 28);
INSERT INTO `houseinfo` VALUES (58, '清溪小区2 栋5楼11号', 0, 13);
INSERT INTO `houseinfo` VALUES (59, '清溪小区4 栋2楼14号', 0, 20);
INSERT INTO `houseinfo` VALUES (60, '清溪小区2 栋1楼18号', 0, 4);
INSERT INTO `houseinfo` VALUES (61, '清溪小区1 栋4楼16号', 0, 17);
INSERT INTO `houseinfo` VALUES (62, '清溪小区1 栋10楼19号', 0, 5);
INSERT INTO `houseinfo` VALUES (63, '清溪小区1 栋6楼10号', 0, 18);
INSERT INTO `houseinfo` VALUES (64, '清溪小区2 栋11楼11号', 0, 27);
INSERT INTO `houseinfo` VALUES (65, '清溪小区2 栋6楼11号', 0, 16);
INSERT INTO `houseinfo` VALUES (66, '清溪小区1 栋11楼13号', 0, 6);
INSERT INTO `houseinfo` VALUES (67, '清溪小区4 栋8楼17号', 0, 5);
INSERT INTO `houseinfo` VALUES (68, '清溪小区3 栋9楼12号', 0, 13);
INSERT INTO `houseinfo` VALUES (69, '清溪小区2 栋9楼10号', 0, 19);
INSERT INTO `houseinfo` VALUES (70, '清溪小区4 栋5楼15号', 0, 30);
INSERT INTO `houseinfo` VALUES (71, '清溪小区3 栋2楼19号', 0, 3);
INSERT INTO `houseinfo` VALUES (72, '清溪小区5 栋5楼8号', 0, 23);
INSERT INTO `houseinfo` VALUES (73, '清溪小区5 栋6楼20号', 0, 28);
INSERT INTO `houseinfo` VALUES (74, '清溪小区4 栋10楼11号', 0, 14);
INSERT INTO `houseinfo` VALUES (75, '清溪小区1 栋3楼14号', 0, 14);
INSERT INTO `houseinfo` VALUES (76, '清溪小区2 栋10楼11号', 0, 26);
INSERT INTO `houseinfo` VALUES (77, '清溪小区1 栋6楼12号', 0, 19);
INSERT INTO `houseinfo` VALUES (78, '清溪小区4 栋12楼19号', 0, 17);
INSERT INTO `houseinfo` VALUES (79, '清溪小区5 栋6楼15号', 0, 26);
INSERT INTO `houseinfo` VALUES (80, '清溪小区1 栋9楼8号', 0, 25);
INSERT INTO `houseinfo` VALUES (81, '清溪小区3 栋4楼12号', 0, 6);
INSERT INTO `houseinfo` VALUES (82, '清溪小区4 栋1楼11号', 0, 19);
INSERT INTO `houseinfo` VALUES (83, '清溪小区2 栋4楼19号', 0, 10);
INSERT INTO `houseinfo` VALUES (84, '清溪小区2 栋1楼15号', 0, 3);
INSERT INTO `houseinfo` VALUES (85, '清溪小区4 栋9楼19号', 0, 9);
INSERT INTO `houseinfo` VALUES (86, '清溪小区4 栋11楼15号', 0, 16);
INSERT INTO `houseinfo` VALUES (87, '清溪小区3 栋5楼16号', 0, 9);
INSERT INTO `houseinfo` VALUES (88, '清溪小区4 栋4楼19号', 0, 27);
INSERT INTO `houseinfo` VALUES (89, '清溪小区5 栋5楼12号', 0, 19);
INSERT INTO `houseinfo` VALUES (90, '清溪小区2 栋12楼15号', 0, 30);
INSERT INTO `houseinfo` VALUES (91, '清溪小区2 栋4楼20号', 0, 11);
INSERT INTO `houseinfo` VALUES (92, '清溪小区1 栋12楼12号', 0, 9);
INSERT INTO `houseinfo` VALUES (93, '清溪小区3 栋11楼12号', 0, 23);
INSERT INTO `houseinfo` VALUES (94, '清溪小区4 栋6楼12号', 0, 1);
INSERT INTO `houseinfo` VALUES (95, '清溪小区5 栋7楼11号', 0, 30);
INSERT INTO `houseinfo` VALUES (96, '清溪小区4 栋12楼20号', 0, 18);

-- ----------------------------
-- Table structure for newsinfo
-- ----------------------------
DROP TABLE IF EXISTS `newsinfo`;
CREATE TABLE `newsinfo`  (
  `newsid` int NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `newstime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `newscontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `newstype` tinyint NOT NULL DEFAULT 0 COMMENT '房屋状态(0:全体用户, 1:多用户, 2:单用户)',
  `newsendtime` timestamp NULL DEFAULT NULL COMMENT '到期时间',
  `news_adminid` int NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`newsid`) USING BTREE,
  INDEX `news_adminid`(`news_adminid`) USING BTREE,
  CONSTRAINT `newsinfo_ibfk_1` FOREIGN KEY (`news_adminid`) REFERENCES `admininfo` (`adminid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newsinfo
-- ----------------------------
INSERT INTO `newsinfo` VALUES (1, '2020-12-16 08:37:21', 'xxxx', 1, '2020-04-18 07:03:44', 20);
INSERT INTO `newsinfo` VALUES (2, '2019-05-19 11:59:08', 'xxxx', 2, NULL, 25);
INSERT INTO `newsinfo` VALUES (3, '2018-10-28 15:53:00', 'xxxx', 2, NULL, 11);
INSERT INTO `newsinfo` VALUES (4, '2022-04-17 06:51:02', 'xxxx', 0, '2019-03-10 00:17:37', 20);
INSERT INTO `newsinfo` VALUES (5, '2018-03-20 13:07:54', 'xxxx', 1, '2019-08-14 21:58:41', 20);
INSERT INTO `newsinfo` VALUES (6, '2017-09-18 03:05:31', 'xxxx', 2, NULL, 1);
INSERT INTO `newsinfo` VALUES (7, '2021-05-03 05:03:52', 'xxxx', 1, '2020-02-19 07:52:08', 11);
INSERT INTO `newsinfo` VALUES (8, '2020-10-17 08:42:40', 'xxxx', 1, '2019-06-17 07:57:21', 1);
INSERT INTO `newsinfo` VALUES (9, '2020-09-23 05:26:47', 'xxxx', 2, NULL, 17);
INSERT INTO `newsinfo` VALUES (10, '2017-03-19 23:06:12', 'xxxx', 0, '2018-10-20 12:11:09', 3);
INSERT INTO `newsinfo` VALUES (11, '2018-04-01 18:19:08', 'xxxx', 0, '2017-07-14 22:20:21', 16);
INSERT INTO `newsinfo` VALUES (12, '2021-02-26 07:08:58', 'xxxx', 0, '2018-02-02 22:30:39', 17);
INSERT INTO `newsinfo` VALUES (13, '2019-12-08 21:56:34', 'xxxx', 1, '2019-12-18 04:10:45', 26);
INSERT INTO `newsinfo` VALUES (14, '2020-02-16 02:54:21', 'xxxx', 1, '2019-06-14 02:04:30', 11);
INSERT INTO `newsinfo` VALUES (15, '2018-05-04 15:00:41', 'xxxx', 2, NULL, 12);
INSERT INTO `newsinfo` VALUES (16, '2019-12-28 09:32:22', 'xxxx', 2, NULL, 8);
INSERT INTO `newsinfo` VALUES (17, '2017-11-27 08:09:48', 'xxxx', 0, '2018-07-11 21:18:33', 13);
INSERT INTO `newsinfo` VALUES (18, '2021-04-16 18:27:20', 'xxxx', 2, NULL, 13);
INSERT INTO `newsinfo` VALUES (19, '2019-02-25 08:02:30', 'xxxx', 1, '2022-03-31 21:32:23', 19);
INSERT INTO `newsinfo` VALUES (20, '2019-09-06 01:58:41', 'xxxx', 2, NULL, 17);
INSERT INTO `newsinfo` VALUES (21, '2020-03-16 11:03:39', 'xxxx', 2, NULL, 17);
INSERT INTO `newsinfo` VALUES (22, '2019-07-24 04:17:23', 'xxxx', 1, '2021-01-31 19:08:59', 4);
INSERT INTO `newsinfo` VALUES (23, '2020-03-29 01:02:38', 'xxxx', 2, NULL, 14);
INSERT INTO `newsinfo` VALUES (24, '2018-06-14 21:42:11', 'xxxx', 0, '2018-10-21 20:36:07', 28);
INSERT INTO `newsinfo` VALUES (25, '2018-10-05 05:39:59', 'xxxx', 2, NULL, 11);
INSERT INTO `newsinfo` VALUES (26, '2020-08-01 11:38:14', 'xxxx', 2, NULL, 17);
INSERT INTO `newsinfo` VALUES (27, '2017-08-09 21:24:56', 'xxxx', 0, '2021-12-03 06:44:04', 27);
INSERT INTO `newsinfo` VALUES (28, '2019-01-08 19:36:04', 'xxxx', 2, NULL, 12);
INSERT INTO `newsinfo` VALUES (29, '2021-10-14 12:27:07', 'xxxx', 2, NULL, 13);
INSERT INTO `newsinfo` VALUES (30, '2017-10-06 17:50:37', 'xxxx', 1, '2017-04-25 09:01:21', 19);
INSERT INTO `newsinfo` VALUES (31, '2017-01-24 14:46:33', 'xxxx', 2, NULL, 6);
INSERT INTO `newsinfo` VALUES (32, '2020-04-01 12:18:55', 'xxxx', 0, '2022-04-10 01:06:22', 20);
INSERT INTO `newsinfo` VALUES (33, '2018-12-14 17:01:30', 'xxxx', 1, '2018-10-04 06:58:25', 12);
INSERT INTO `newsinfo` VALUES (34, '2021-11-05 11:48:45', 'xxxx', 0, '2020-03-27 03:47:12', 4);
INSERT INTO `newsinfo` VALUES (35, '2019-03-04 00:26:54', 'xxxx', 1, '2021-06-03 01:12:10', 27);
INSERT INTO `newsinfo` VALUES (36, '2022-04-07 20:05:54', 'xxxx', 2, NULL, 25);
INSERT INTO `newsinfo` VALUES (37, '2018-02-11 13:54:04', 'xxxx', 2, NULL, 28);
INSERT INTO `newsinfo` VALUES (38, '2022-01-04 01:33:04', 'xxxx', 2, NULL, 5);
INSERT INTO `newsinfo` VALUES (39, '2019-06-11 15:36:25', 'xxxx', 1, '2020-12-11 22:55:52', 27);
INSERT INTO `newsinfo` VALUES (40, '2017-05-04 02:36:02', 'xxxx', 2, NULL, 18);
INSERT INTO `newsinfo` VALUES (41, '2019-02-06 18:00:05', 'xxxx', 2, NULL, 10);
INSERT INTO `newsinfo` VALUES (42, '2021-12-26 07:00:17', 'xxxx', 2, NULL, 23);
INSERT INTO `newsinfo` VALUES (43, '2020-03-05 02:52:06', 'xxxx', 0, '2020-04-04 15:38:18', 30);
INSERT INTO `newsinfo` VALUES (44, '2020-08-08 17:33:12', 'xxxx', 1, '2022-08-05 11:41:10', 19);
INSERT INTO `newsinfo` VALUES (45, '2017-05-26 07:57:42', 'xxxx', 0, '2019-09-25 15:45:50', 12);
INSERT INTO `newsinfo` VALUES (46, '2021-09-13 13:33:37', 'xxxx', 0, '2022-05-27 04:44:55', 18);
INSERT INTO `newsinfo` VALUES (47, '2020-09-23 07:15:48', 'xxxx', 2, NULL, 4);
INSERT INTO `newsinfo` VALUES (48, '2017-09-01 17:09:47', 'xxxx', 2, NULL, 12);
INSERT INTO `newsinfo` VALUES (49, '2020-12-13 06:58:03', 'xxxx', 0, '2017-09-12 23:23:15', 23);
INSERT INTO `newsinfo` VALUES (50, '2020-02-22 19:34:31', 'xxxx', 2, NULL, 10);
INSERT INTO `newsinfo` VALUES (51, '2021-03-27 16:37:29', 'xxxx', 1, '2022-05-26 17:29:22', 18);
INSERT INTO `newsinfo` VALUES (52, '2020-08-22 07:16:40', 'xxxx', 1, '2022-03-06 06:53:21', 12);
INSERT INTO `newsinfo` VALUES (53, '2021-11-25 01:02:20', 'xxxx', 2, NULL, 27);
INSERT INTO `newsinfo` VALUES (54, '2020-06-20 20:15:59', 'xxxx', 1, '2020-09-02 01:41:26', 30);
INSERT INTO `newsinfo` VALUES (55, '2019-01-18 20:44:01', 'xxxx', 2, NULL, 14);
INSERT INTO `newsinfo` VALUES (56, '2020-03-18 00:03:33', 'xxxx', 1, '2019-12-03 08:32:31', 6);
INSERT INTO `newsinfo` VALUES (57, '2020-10-06 01:18:50', 'xxxx', 0, '2022-06-03 18:40:24', 10);
INSERT INTO `newsinfo` VALUES (58, '2021-11-28 11:59:50', 'xxxx', 0, '2018-05-24 04:19:59', 3);
INSERT INTO `newsinfo` VALUES (59, '2019-12-12 09:58:56', 'xxxx', 0, '2020-11-15 02:36:46', 14);
INSERT INTO `newsinfo` VALUES (60, '2021-07-26 13:46:48', 'xxxx', 1, '2019-05-29 03:58:04', 13);
INSERT INTO `newsinfo` VALUES (61, '2021-10-21 06:22:48', 'xxxx', 2, NULL, 14);
INSERT INTO `newsinfo` VALUES (62, '2022-02-01 17:12:10', 'xxxx', 2, NULL, 27);
INSERT INTO `newsinfo` VALUES (63, '2018-10-09 11:07:38', 'xxxx', 2, NULL, 27);
INSERT INTO `newsinfo` VALUES (64, '2018-05-19 16:51:28', 'xxxx', 1, '2020-05-07 16:06:21', 10);
INSERT INTO `newsinfo` VALUES (65, '2019-02-18 14:45:29', 'xxxx', 2, NULL, 28);
INSERT INTO `newsinfo` VALUES (66, '2021-11-29 21:42:06', 'xxxx', 2, NULL, 26);
INSERT INTO `newsinfo` VALUES (67, '2017-03-11 00:22:47', 'xxxx', 2, NULL, 28);
INSERT INTO `newsinfo` VALUES (68, '2019-10-20 17:39:15', 'xxxx', 0, '2019-12-22 07:27:11', 5);
INSERT INTO `newsinfo` VALUES (69, '2017-01-23 19:54:56', 'xxxx', 1, '2019-01-06 16:48:42', 27);
INSERT INTO `newsinfo` VALUES (70, '2017-03-10 13:36:14', 'xxxx', 0, '2019-12-22 06:58:41', 6);
INSERT INTO `newsinfo` VALUES (71, '2021-09-25 09:23:11', 'xxxx', 1, '2021-11-23 22:31:30', 13);
INSERT INTO `newsinfo` VALUES (72, '2019-01-12 09:47:58', 'xxxx', 0, '2021-03-14 07:57:48', 14);
INSERT INTO `newsinfo` VALUES (73, '2019-07-05 18:52:38', 'xxxx', 1, '2021-11-21 18:50:09', 4);
INSERT INTO `newsinfo` VALUES (74, '2021-11-23 00:48:52', 'xxxx', 1, '2019-09-30 00:23:30', 6);
INSERT INTO `newsinfo` VALUES (75, '2017-08-06 10:24:57', 'xxxx', 0, '2021-08-31 10:50:59', 4);
INSERT INTO `newsinfo` VALUES (76, '2020-11-29 17:13:15', 'xxxx', 1, '2022-05-23 14:40:45', 11);
INSERT INTO `newsinfo` VALUES (77, '2019-06-09 03:25:28', 'xxxx', 2, NULL, 27);
INSERT INTO `newsinfo` VALUES (78, '2019-10-31 18:41:27', 'xxxx', 0, '2019-09-09 14:33:00', 19);
INSERT INTO `newsinfo` VALUES (79, '2019-03-23 05:53:43', 'xxxx', 2, NULL, 6);
INSERT INTO `newsinfo` VALUES (80, '2020-01-09 04:33:00', 'xxxx', 0, '2021-07-16 12:18:53', 6);
INSERT INTO `newsinfo` VALUES (81, '2017-12-20 23:56:15', 'xxxx', 0, '2022-06-24 03:55:25', 4);
INSERT INTO `newsinfo` VALUES (82, '2020-11-20 00:00:44', 'xxxx', 0, '2017-12-04 01:10:38', 9);
INSERT INTO `newsinfo` VALUES (83, '2020-11-05 10:27:54', 'xxxx', 1, '2020-08-19 23:42:57', 13);
INSERT INTO `newsinfo` VALUES (84, '2018-08-17 20:17:17', 'xxxx', 1, '2022-08-08 00:56:14', 8);
INSERT INTO `newsinfo` VALUES (85, '2019-02-16 21:39:45', 'xxxx', 0, '2019-10-01 07:47:21', 30);
INSERT INTO `newsinfo` VALUES (86, '2018-01-11 09:45:06', 'xxxx', 2, NULL, 3);
INSERT INTO `newsinfo` VALUES (87, '2018-06-03 07:21:37', 'xxxx', 2, NULL, 18);
INSERT INTO `newsinfo` VALUES (88, '2022-03-14 21:09:09', 'xxxx', 0, '2019-09-25 06:11:50', 6);
INSERT INTO `newsinfo` VALUES (89, '2020-07-05 19:38:56', 'xxxx', 1, '2019-01-27 01:16:50', 1);
INSERT INTO `newsinfo` VALUES (90, '2018-12-24 13:27:23', 'xxxx', 2, NULL, 28);
INSERT INTO `newsinfo` VALUES (91, '2019-10-06 22:24:11', 'xxxx', 0, '2018-10-07 11:04:38', 26);
INSERT INTO `newsinfo` VALUES (92, '2019-10-31 13:56:49', 'xxxx', 0, '2022-01-03 12:43:17', 26);
INSERT INTO `newsinfo` VALUES (93, '2020-08-16 12:41:39', 'xxxx', 1, '2019-02-26 15:33:58', 12);
INSERT INTO `newsinfo` VALUES (94, '2021-04-22 22:39:53', 'xxxx', 0, '2021-07-03 17:17:02', 17);
INSERT INTO `newsinfo` VALUES (95, '2019-09-19 07:32:43', 'xxxx', 0, '2017-10-18 16:04:33', 23);
INSERT INTO `newsinfo` VALUES (96, '2021-03-21 07:44:43', 'xxxx', 1, '2019-08-04 20:51:39', 14);
INSERT INTO `newsinfo` VALUES (97, '2020-06-25 10:30:46', 'xxxx', 2, NULL, 16);
INSERT INTO `newsinfo` VALUES (98, '2020-12-17 08:18:52', 'xxxx', 0, '2017-03-11 21:04:07', 1);
INSERT INTO `newsinfo` VALUES (99, '2017-04-10 11:40:12', 'xxxx', 0, '2020-01-18 23:55:07', 8);
INSERT INTO `newsinfo` VALUES (100, '2018-12-10 06:52:40', 'xxxx', 0, '2018-05-12 12:16:56', 20);

-- ----------------------------
-- Table structure for pcarinfo
-- ----------------------------
DROP TABLE IF EXISTS `pcarinfo`;
CREATE TABLE `pcarinfo`  (
  `pcarid` int NOT NULL AUTO_INCREMENT COMMENT '停车位ID',
  `pcarstate` tinyint NOT NULL DEFAULT 0 COMMENT '停车位状态(0:空闲,  1:已停车, 2:已预定)',
  `pcarloction` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '位置',
  `buytime` timestamp NULL DEFAULT NULL COMMENT '购买时间',
  `pcar_houseid` int NULL DEFAULT NULL COMMENT '房屋ID',
  PRIMARY KEY (`pcarid`) USING BTREE,
  INDEX `pcar_houseid`(`pcar_houseid`) USING BTREE,
  CONSTRAINT `pcarinfo_ibfk_1` FOREIGN KEY (`pcar_houseid`) REFERENCES `houseinfo` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pcarinfo
-- ----------------------------
INSERT INTO `pcarinfo` VALUES (1, 1, '1', '2017-03-26 17:31:07', 26);
INSERT INTO `pcarinfo` VALUES (2, 1, '2', '2021-04-19 05:34:36', 22);
INSERT INTO `pcarinfo` VALUES (3, 1, '3', '2017-09-09 15:56:29', 13);
INSERT INTO `pcarinfo` VALUES (4, 0, '4', NULL, 12);
INSERT INTO `pcarinfo` VALUES (5, 1, '5', '2021-08-04 23:41:45', 9);
INSERT INTO `pcarinfo` VALUES (6, 1, '6', '2019-01-30 14:56:23', 35);
INSERT INTO `pcarinfo` VALUES (7, 1, '7', '2017-03-23 10:59:06', 30);
INSERT INTO `pcarinfo` VALUES (8, 1, '8', '2018-07-22 04:18:52', 26);
INSERT INTO `pcarinfo` VALUES (9, 0, '9', NULL, 10);
INSERT INTO `pcarinfo` VALUES (10, 1, '10', '2017-09-24 12:00:11', 2);
INSERT INTO `pcarinfo` VALUES (11, 1, '11', '2019-08-29 04:22:05', 9);
INSERT INTO `pcarinfo` VALUES (12, 1, '12', '2022-02-08 19:57:42', 9);
INSERT INTO `pcarinfo` VALUES (13, 1, '13', '2017-12-09 21:27:29', 29);
INSERT INTO `pcarinfo` VALUES (14, 0, '14', NULL, 20);
INSERT INTO `pcarinfo` VALUES (15, 0, '15', NULL, 22);
INSERT INTO `pcarinfo` VALUES (16, 1, '16', '2019-07-15 18:08:19', 8);
INSERT INTO `pcarinfo` VALUES (17, 0, '17', NULL, 39);
INSERT INTO `pcarinfo` VALUES (18, 1, '18', '2018-05-10 17:12:44', 26);
INSERT INTO `pcarinfo` VALUES (19, 0, '19', NULL, 25);
INSERT INTO `pcarinfo` VALUES (20, 0, '20', NULL, 39);
INSERT INTO `pcarinfo` VALUES (21, 1, '21', '2022-04-10 18:40:42', 39);
INSERT INTO `pcarinfo` VALUES (22, 0, '22', NULL, 12);
INSERT INTO `pcarinfo` VALUES (23, 1, '23', '2017-11-06 11:46:04', 15);
INSERT INTO `pcarinfo` VALUES (24, 0, '24', NULL, 5);
INSERT INTO `pcarinfo` VALUES (25, 0, '25', NULL, 39);
INSERT INTO `pcarinfo` VALUES (26, 1, '26', '2018-07-14 16:50:57', 32);
INSERT INTO `pcarinfo` VALUES (27, 1, '27', '2018-08-30 18:35:17', 21);
INSERT INTO `pcarinfo` VALUES (28, 1, '28', '2020-02-18 08:04:09', 28);
INSERT INTO `pcarinfo` VALUES (29, 0, '29', NULL, 37);
INSERT INTO `pcarinfo` VALUES (30, 1, '30', '2019-05-31 02:31:17', 30);
INSERT INTO `pcarinfo` VALUES (31, 0, '31', NULL, 22);
INSERT INTO `pcarinfo` VALUES (32, 0, '32', NULL, 5);
INSERT INTO `pcarinfo` VALUES (33, 1, '33', '2020-12-13 17:29:32', 6);
INSERT INTO `pcarinfo` VALUES (34, 0, '34', NULL, 13);
INSERT INTO `pcarinfo` VALUES (35, 0, '35', NULL, 15);
INSERT INTO `pcarinfo` VALUES (36, 1, '36', '2018-05-19 14:53:03', 8);
INSERT INTO `pcarinfo` VALUES (37, 1, '37', '2022-02-11 08:52:13', 8);
INSERT INTO `pcarinfo` VALUES (38, 0, '38', NULL, 34);
INSERT INTO `pcarinfo` VALUES (39, 0, '39', NULL, 9);
INSERT INTO `pcarinfo` VALUES (40, 1, '40', '2017-04-13 04:11:31', 20);
INSERT INTO `pcarinfo` VALUES (41, 1, '41', '2022-02-25 20:04:07', 37);
INSERT INTO `pcarinfo` VALUES (42, 1, '42', '2018-02-10 15:43:43', 28);
INSERT INTO `pcarinfo` VALUES (43, 1, '43', '2017-05-23 05:08:00', 26);
INSERT INTO `pcarinfo` VALUES (44, 1, '44', '2017-06-24 07:43:08', 36);
INSERT INTO `pcarinfo` VALUES (45, 1, '45', '2020-12-13 12:58:30', 14);
INSERT INTO `pcarinfo` VALUES (46, 1, '46', '2019-10-01 04:21:09', 32);
INSERT INTO `pcarinfo` VALUES (47, 1, '47', '2018-11-25 18:55:35', 28);
INSERT INTO `pcarinfo` VALUES (48, 0, '48', NULL, 37);
INSERT INTO `pcarinfo` VALUES (49, 0, '49', NULL, 3);
INSERT INTO `pcarinfo` VALUES (50, 0, '50', NULL, 25);
INSERT INTO `pcarinfo` VALUES (51, 0, '51', NULL, 31);
INSERT INTO `pcarinfo` VALUES (52, 0, '52', NULL, 32);
INSERT INTO `pcarinfo` VALUES (53, 0, '53', NULL, 26);
INSERT INTO `pcarinfo` VALUES (54, 0, '54', NULL, 39);
INSERT INTO `pcarinfo` VALUES (55, 1, '55', '2018-02-08 13:55:50', 1);
INSERT INTO `pcarinfo` VALUES (56, 0, '56', NULL, 30);
INSERT INTO `pcarinfo` VALUES (57, 0, '57', NULL, 13);
INSERT INTO `pcarinfo` VALUES (58, 0, '58', NULL, 35);
INSERT INTO `pcarinfo` VALUES (59, 1, '59', '2017-12-28 04:43:52', 26);
INSERT INTO `pcarinfo` VALUES (60, 1, '60', '2019-09-29 15:35:41', 4);
INSERT INTO `pcarinfo` VALUES (61, 0, '61', NULL, 13);
INSERT INTO `pcarinfo` VALUES (62, 1, '62', '2017-07-07 18:14:19', 6);
INSERT INTO `pcarinfo` VALUES (63, 1, '63', '2019-09-30 09:24:03', 3);
INSERT INTO `pcarinfo` VALUES (64, 1, '64', '2018-04-10 14:08:09', 29);
INSERT INTO `pcarinfo` VALUES (65, 1, '65', '2019-02-19 01:16:31', 32);
INSERT INTO `pcarinfo` VALUES (66, 1, '66', '2019-12-01 20:11:29', 9);
INSERT INTO `pcarinfo` VALUES (67, 0, '67', NULL, 4);
INSERT INTO `pcarinfo` VALUES (68, 1, '68', '2018-04-02 01:39:38', 27);
INSERT INTO `pcarinfo` VALUES (69, 1, '69', '2019-05-29 09:31:55', 22);
INSERT INTO `pcarinfo` VALUES (70, 1, '70', '2018-01-14 16:22:13', 39);
INSERT INTO `pcarinfo` VALUES (71, 1, '71', '2021-01-18 11:59:00', 9);
INSERT INTO `pcarinfo` VALUES (72, 1, '72', '2017-05-29 05:48:02', 22);
INSERT INTO `pcarinfo` VALUES (73, 0, '73', NULL, 23);
INSERT INTO `pcarinfo` VALUES (74, 0, '74', NULL, 22);
INSERT INTO `pcarinfo` VALUES (75, 0, '75', NULL, 25);
INSERT INTO `pcarinfo` VALUES (76, 1, '76', '2020-07-20 08:18:13', 6);
INSERT INTO `pcarinfo` VALUES (77, 1, '77', '2017-05-14 10:52:22', 3);
INSERT INTO `pcarinfo` VALUES (78, 0, '78', NULL, 28);
INSERT INTO `pcarinfo` VALUES (79, 0, '79', NULL, 3);
INSERT INTO `pcarinfo` VALUES (80, 0, '80', NULL, 5);
INSERT INTO `pcarinfo` VALUES (81, 1, '81', '2017-02-25 02:13:22', 31);
INSERT INTO `pcarinfo` VALUES (82, 0, '82', NULL, 29);
INSERT INTO `pcarinfo` VALUES (83, 1, '83', '2022-04-07 15:22:32', 4);
INSERT INTO `pcarinfo` VALUES (84, 0, '84', NULL, 39);
INSERT INTO `pcarinfo` VALUES (85, 1, '85', '2017-05-27 20:57:37', 32);
INSERT INTO `pcarinfo` VALUES (86, 0, '86', NULL, 8);
INSERT INTO `pcarinfo` VALUES (87, 1, '87', '2018-11-15 18:01:31', 38);
INSERT INTO `pcarinfo` VALUES (88, 1, '88', '2019-01-12 12:55:13', 13);
INSERT INTO `pcarinfo` VALUES (89, 1, '89', '2017-02-17 12:31:04', 32);
INSERT INTO `pcarinfo` VALUES (90, 1, '90', '2019-02-07 22:08:58', 38);
INSERT INTO `pcarinfo` VALUES (91, 0, '91', NULL, 35);
INSERT INTO `pcarinfo` VALUES (92, 1, '92', '2018-03-25 21:06:09', 20);
INSERT INTO `pcarinfo` VALUES (93, 0, '93', NULL, 9);
INSERT INTO `pcarinfo` VALUES (94, 1, '94', '2019-01-31 06:03:31', 33);
INSERT INTO `pcarinfo` VALUES (95, 0, '95', NULL, 30);
INSERT INTO `pcarinfo` VALUES (96, 0, '96', NULL, 15);
INSERT INTO `pcarinfo` VALUES (97, 1, '97', '2021-07-13 14:25:08', 32);
INSERT INTO `pcarinfo` VALUES (98, 0, '98', NULL, 3);
INSERT INTO `pcarinfo` VALUES (99, 0, '99', NULL, 1);

-- ----------------------------
-- Table structure for taskinfo
-- ----------------------------
DROP TABLE IF EXISTS `taskinfo`;
CREATE TABLE `taskinfo`  (
  `taskid` int NOT NULL AUTO_INCREMENT COMMENT '维修ID',
  `taskstate` tinyint NOT NULL DEFAULT 0 COMMENT '维修状态(0:未开始, 1:已开始, 2:已完成)',
  `taskcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修内容',
  `task_userid` int NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`taskid`) USING BTREE,
  INDEX `task_userid`(`task_userid`) USING BTREE,
  CONSTRAINT `taskinfo_ibfk_1` FOREIGN KEY (`task_userid`) REFERENCES `userinfo` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of taskinfo
-- ----------------------------
INSERT INTO `taskinfo` VALUES (1, 2, '暖气故障', 83);
INSERT INTO `taskinfo` VALUES (2, 1, '电路维修', 57);
INSERT INTO `taskinfo` VALUES (3, 1, '配玻璃', 73);
INSERT INTO `taskinfo` VALUES (4, 2, '修门', 2);
INSERT INTO `taskinfo` VALUES (5, 1, '通下水道', 95);
INSERT INTO `taskinfo` VALUES (6, 2, '涂油漆', 7);
INSERT INTO `taskinfo` VALUES (7, 0, '水管破裂', 14);
INSERT INTO `taskinfo` VALUES (8, 0, '修补屋面', 63);
INSERT INTO `taskinfo` VALUES (9, 2, '暖气故障', 31);
INSERT INTO `taskinfo` VALUES (10, 2, '暖气故障', 78);
INSERT INTO `taskinfo` VALUES (11, 0, '修门', 11);
INSERT INTO `taskinfo` VALUES (12, 1, '暖气故障', 6);
INSERT INTO `taskinfo` VALUES (13, 0, '换窗纱', 98);
INSERT INTO `taskinfo` VALUES (14, 2, '通下水道', 19);
INSERT INTO `taskinfo` VALUES (15, 0, '涂油漆', 61);
INSERT INTO `taskinfo` VALUES (16, 2, '水管破裂', 98);
INSERT INTO `taskinfo` VALUES (17, 0, '房屋漏水', 99);
INSERT INTO `taskinfo` VALUES (18, 2, '电路维修', 22);
INSERT INTO `taskinfo` VALUES (19, 0, '暖气故障', 57);
INSERT INTO `taskinfo` VALUES (20, 2, '修水龙头', 81);
INSERT INTO `taskinfo` VALUES (21, 1, '涂油漆', 83);
INSERT INTO `taskinfo` VALUES (22, 2, '换窗纱', 54);
INSERT INTO `taskinfo` VALUES (23, 1, '修空调', 51);
INSERT INTO `taskinfo` VALUES (24, 0, '换窗纱', 58);
INSERT INTO `taskinfo` VALUES (25, 1, '修水龙头', 66);
INSERT INTO `taskinfo` VALUES (26, 2, '电路维修', 14);
INSERT INTO `taskinfo` VALUES (27, 0, '修门', 3);
INSERT INTO `taskinfo` VALUES (28, 2, '修补屋面', 96);
INSERT INTO `taskinfo` VALUES (29, 1, '配玻璃', 82);
INSERT INTO `taskinfo` VALUES (30, 1, '更换过梁', 20);
INSERT INTO `taskinfo` VALUES (31, 2, '暖气故障', 13);
INSERT INTO `taskinfo` VALUES (32, 2, '配玻璃', 88);
INSERT INTO `taskinfo` VALUES (33, 1, '修水龙头', 7);
INSERT INTO `taskinfo` VALUES (34, 0, '拆换五金', 22);
INSERT INTO `taskinfo` VALUES (35, 0, '更换过梁', 27);
INSERT INTO `taskinfo` VALUES (36, 1, '暖气故障', 98);
INSERT INTO `taskinfo` VALUES (37, 2, '更换过梁', 78);
INSERT INTO `taskinfo` VALUES (38, 0, '水管破裂', 79);
INSERT INTO `taskinfo` VALUES (39, 2, '修门', 43);
INSERT INTO `taskinfo` VALUES (40, 0, '电路维修', 42);
INSERT INTO `taskinfo` VALUES (41, 2, '维修天然气', 80);
INSERT INTO `taskinfo` VALUES (42, 1, '电路维修', 8);
INSERT INTO `taskinfo` VALUES (43, 2, '修水龙头', 66);
INSERT INTO `taskinfo` VALUES (44, 1, '配玻璃', 60);
INSERT INTO `taskinfo` VALUES (45, 2, '拆换五金', 89);
INSERT INTO `taskinfo` VALUES (46, 2, '水管破裂', 23);
INSERT INTO `taskinfo` VALUES (47, 0, '维修天然气', 20);
INSERT INTO `taskinfo` VALUES (48, 0, '修空调', 53);
INSERT INTO `taskinfo` VALUES (49, 2, '修空调', 70);
INSERT INTO `taskinfo` VALUES (50, 0, '拆换五金', 27);
INSERT INTO `taskinfo` VALUES (51, 0, '房屋漏水', 23);
INSERT INTO `taskinfo` VALUES (52, 0, '修补屋面', 90);
INSERT INTO `taskinfo` VALUES (53, 1, '更换过梁', 37);
INSERT INTO `taskinfo` VALUES (54, 1, '修补屋面', 64);
INSERT INTO `taskinfo` VALUES (55, 1, '换窗纱', 1);
INSERT INTO `taskinfo` VALUES (56, 1, '修门', 38);
INSERT INTO `taskinfo` VALUES (57, 2, '房屋漏水', 11);
INSERT INTO `taskinfo` VALUES (58, 2, '修补楼地面面层', 14);
INSERT INTO `taskinfo` VALUES (59, 2, '通下水道', 94);
INSERT INTO `taskinfo` VALUES (60, 0, '拆换五金', 74);
INSERT INTO `taskinfo` VALUES (61, 1, '修补屋面', 2);
INSERT INTO `taskinfo` VALUES (62, 0, '换窗纱', 34);
INSERT INTO `taskinfo` VALUES (63, 2, '通下水道', 18);
INSERT INTO `taskinfo` VALUES (64, 2, '更换过梁', 22);
INSERT INTO `taskinfo` VALUES (65, 1, '拆换五金', 55);
INSERT INTO `taskinfo` VALUES (66, 1, '修水龙头', 17);
INSERT INTO `taskinfo` VALUES (67, 0, '更换过梁', 32);
INSERT INTO `taskinfo` VALUES (68, 1, '换窗纱', 29);
INSERT INTO `taskinfo` VALUES (69, 0, '配玻璃', 17);
INSERT INTO `taskinfo` VALUES (70, 2, '水管破裂', 17);
INSERT INTO `taskinfo` VALUES (71, 0, '房屋漏水', 7);
INSERT INTO `taskinfo` VALUES (72, 0, '更换过梁', 10);
INSERT INTO `taskinfo` VALUES (73, 0, '通下水道', 19);
INSERT INTO `taskinfo` VALUES (74, 1, '通下水道', 29);
INSERT INTO `taskinfo` VALUES (75, 0, '维修天然气', 50);
INSERT INTO `taskinfo` VALUES (76, 2, '涂油漆', 56);
INSERT INTO `taskinfo` VALUES (77, 1, '涂油漆', 21);
INSERT INTO `taskinfo` VALUES (78, 2, '涂油漆', 76);
INSERT INTO `taskinfo` VALUES (79, 2, '房屋漏水', 48);
INSERT INTO `taskinfo` VALUES (80, 1, '修空调', 50);
INSERT INTO `taskinfo` VALUES (81, 1, '水管破裂', 18);
INSERT INTO `taskinfo` VALUES (82, 1, '修门', 54);
INSERT INTO `taskinfo` VALUES (83, 0, '修水龙头', 12);
INSERT INTO `taskinfo` VALUES (84, 1, '通下水道', 55);
INSERT INTO `taskinfo` VALUES (85, 2, '维修天然气', 10);
INSERT INTO `taskinfo` VALUES (86, 2, '拆换五金', 77);
INSERT INTO `taskinfo` VALUES (87, 1, '涂油漆', 28);
INSERT INTO `taskinfo` VALUES (88, 0, '修补楼地面面层', 9);
INSERT INTO `taskinfo` VALUES (89, 0, '换窗纱', 49);
INSERT INTO `taskinfo` VALUES (90, 0, '修水龙头', 57);
INSERT INTO `taskinfo` VALUES (91, 0, '水管破裂', 67);
INSERT INTO `taskinfo` VALUES (92, 1, '电路维修', 62);
INSERT INTO `taskinfo` VALUES (93, 0, '拆换五金', 27);
INSERT INTO `taskinfo` VALUES (94, 2, '暖气故障', 75);
INSERT INTO `taskinfo` VALUES (95, 2, '修补屋面', 74);
INSERT INTO `taskinfo` VALUES (96, 1, '拆换五金', 100);
INSERT INTO `taskinfo` VALUES (97, 0, '涂油漆', 48);
INSERT INTO `taskinfo` VALUES (98, 2, '配玻璃', 84);
INSERT INTO `taskinfo` VALUES (99, 1, '拆换五金', 69);
INSERT INTO `taskinfo` VALUES (100, 0, '暖气故障', 12);

-- ----------------------------
-- Table structure for updatarelation
-- ----------------------------
DROP TABLE IF EXISTS `updatarelation`;
CREATE TABLE `updatarelation`  (
  `updataid` int NOT NULL AUTO_INCREMENT COMMENT '更新ID',
  `updatacontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新内容',
  `updatatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updata_houseid` int NOT NULL COMMENT '房屋ID',
  `updata_adminid` int NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`updataid`) USING BTREE,
  INDEX `updata_houseid`(`updata_houseid`) USING BTREE,
  INDEX `updata_adminid`(`updata_adminid`) USING BTREE,
  CONSTRAINT `updatarelation_ibfk_1` FOREIGN KEY (`updata_houseid`) REFERENCES `houseinfo` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `updatarelation_ibfk_2` FOREIGN KEY (`updata_adminid`) REFERENCES `admininfo` (`adminid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of updatarelation
-- ----------------------------
INSERT INTO `updatarelation` VALUES (1, 'xxxx', '2018-01-17 06:07:09', 39, 8);
INSERT INTO `updatarelation` VALUES (2, 'xxxx', '2017-06-19 12:07:37', 13, 8);
INSERT INTO `updatarelation` VALUES (3, 'xxxx', '2021-09-21 04:16:07', 24, 9);
INSERT INTO `updatarelation` VALUES (4, 'xxxx', '2019-08-11 09:08:38', 34, 20);
INSERT INTO `updatarelation` VALUES (5, 'xxxx', '2018-09-16 23:50:45', 12, 17);
INSERT INTO `updatarelation` VALUES (6, 'xxxx', '2017-01-13 23:41:31', 11, 4);
INSERT INTO `updatarelation` VALUES (7, 'xxxx', '2022-04-17 02:16:48', 37, 16);
INSERT INTO `updatarelation` VALUES (8, 'xxxx', '2022-02-24 11:20:05', 4, 19);
INSERT INTO `updatarelation` VALUES (9, 'xxxx', '2017-04-09 09:30:42', 35, 14);
INSERT INTO `updatarelation` VALUES (10, 'xxxx', '2017-11-15 01:17:42', 8, 20);
INSERT INTO `updatarelation` VALUES (11, 'xxxx', '2017-02-02 05:30:13', 6, 16);
INSERT INTO `updatarelation` VALUES (12, 'xxxx', '2021-12-29 03:38:49', 6, 14);
INSERT INTO `updatarelation` VALUES (13, 'xxxx', '2019-06-04 22:34:13', 33, 17);
INSERT INTO `updatarelation` VALUES (14, 'xxxx', '2021-07-26 19:37:42', 23, 25);
INSERT INTO `updatarelation` VALUES (15, 'xxxx', '2019-02-16 13:29:36', 38, 28);
INSERT INTO `updatarelation` VALUES (16, 'xxxx', '2020-06-23 06:04:13', 33, 1);
INSERT INTO `updatarelation` VALUES (17, 'xxxx', '2017-07-04 01:30:45', 39, 17);
INSERT INTO `updatarelation` VALUES (18, 'xxxx', '2020-10-18 09:46:57', 28, 28);
INSERT INTO `updatarelation` VALUES (19, 'xxxx', '2021-06-18 18:19:32', 26, 25);
INSERT INTO `updatarelation` VALUES (20, 'xxxx', '2017-12-07 21:07:30', 20, 6);
INSERT INTO `updatarelation` VALUES (21, 'xxxx', '2018-03-05 03:18:41', 30, 9);
INSERT INTO `updatarelation` VALUES (22, 'xxxx', '2018-10-30 00:18:28', 37, 3);
INSERT INTO `updatarelation` VALUES (23, 'xxxx', '2017-05-12 01:36:39', 14, 28);
INSERT INTO `updatarelation` VALUES (24, 'xxxx', '2018-01-15 05:26:04', 25, 1);
INSERT INTO `updatarelation` VALUES (25, 'xxxx', '2019-11-08 01:54:20', 12, 23);
INSERT INTO `updatarelation` VALUES (26, 'xxxx', '2017-05-29 13:35:35', 24, 16);
INSERT INTO `updatarelation` VALUES (27, 'xxxx', '2020-02-20 00:23:48', 23, 11);
INSERT INTO `updatarelation` VALUES (28, 'xxxx', '2017-12-08 21:44:29', 30, 13);
INSERT INTO `updatarelation` VALUES (29, 'xxxx', '2020-03-07 01:48:51', 2, 9);
INSERT INTO `updatarelation` VALUES (30, 'xxxx', '2020-10-05 18:48:31', 10, 11);
INSERT INTO `updatarelation` VALUES (31, 'xxxx', '2019-10-05 18:22:37', 5, 18);
INSERT INTO `updatarelation` VALUES (32, 'xxxx', '2019-08-29 15:58:33', 4, 23);
INSERT INTO `updatarelation` VALUES (33, 'xxxx', '2021-08-08 00:48:38', 39, 17);
INSERT INTO `updatarelation` VALUES (34, 'xxxx', '2021-12-31 07:03:35', 10, 8);
INSERT INTO `updatarelation` VALUES (35, 'xxxx', '2018-09-15 06:50:42', 10, 3);
INSERT INTO `updatarelation` VALUES (36, 'xxxx', '2019-10-24 21:28:03', 13, 27);
INSERT INTO `updatarelation` VALUES (37, 'xxxx', '2021-01-29 09:58:30', 3, 26);
INSERT INTO `updatarelation` VALUES (38, 'xxxx', '2019-07-29 05:44:09', 8, 9);
INSERT INTO `updatarelation` VALUES (39, 'xxxx', '2017-02-11 05:30:34', 10, 23);
INSERT INTO `updatarelation` VALUES (40, 'xxxx', '2021-11-15 03:57:50', 36, 28);
INSERT INTO `updatarelation` VALUES (41, 'xxxx', '2017-11-26 02:59:38', 33, 9);
INSERT INTO `updatarelation` VALUES (42, 'xxxx', '2018-01-03 05:02:06', 18, 17);
INSERT INTO `updatarelation` VALUES (43, 'xxxx', '2020-08-12 22:28:03', 11, 10);
INSERT INTO `updatarelation` VALUES (44, 'xxxx', '2019-02-24 10:44:39', 24, 8);
INSERT INTO `updatarelation` VALUES (45, 'xxxx', '2019-02-09 05:19:33', 31, 17);
INSERT INTO `updatarelation` VALUES (46, 'xxxx', '2021-10-22 08:36:20', 31, 5);
INSERT INTO `updatarelation` VALUES (47, 'xxxx', '2017-03-06 19:39:01', 38, 25);
INSERT INTO `updatarelation` VALUES (48, 'xxxx', '2020-01-02 07:35:25', 33, 8);
INSERT INTO `updatarelation` VALUES (49, 'xxxx', '2020-05-08 01:35:21', 21, 26);
INSERT INTO `updatarelation` VALUES (50, 'xxxx', '2019-02-27 23:42:51', 38, 12);
INSERT INTO `updatarelation` VALUES (51, 'xxxx', '2021-08-18 14:51:59', 24, 19);
INSERT INTO `updatarelation` VALUES (52, 'xxxx', '2017-01-31 17:02:47', 21, 6);
INSERT INTO `updatarelation` VALUES (53, 'xxxx', '2020-01-05 04:51:38', 33, 1);
INSERT INTO `updatarelation` VALUES (54, 'xxxx', '2022-05-02 15:26:20', 2, 20);
INSERT INTO `updatarelation` VALUES (55, 'xxxx', '2021-04-28 00:30:45', 36, 20);
INSERT INTO `updatarelation` VALUES (56, 'xxxx', '2017-11-20 18:31:56', 38, 17);
INSERT INTO `updatarelation` VALUES (57, 'xxxx', '2019-07-08 06:12:40', 11, 28);
INSERT INTO `updatarelation` VALUES (58, 'xxxx', '2019-04-16 19:17:20', 39, 12);
INSERT INTO `updatarelation` VALUES (59, 'xxxx', '2019-12-27 12:31:02', 27, 11);
INSERT INTO `updatarelation` VALUES (60, 'xxxx', '2017-07-06 19:05:56', 22, 4);
INSERT INTO `updatarelation` VALUES (61, 'xxxx', '2020-06-04 14:07:04', 12, 11);
INSERT INTO `updatarelation` VALUES (62, 'xxxx', '2021-04-14 14:00:13', 13, 6);
INSERT INTO `updatarelation` VALUES (63, 'xxxx', '2017-09-24 08:12:22', 32, 11);
INSERT INTO `updatarelation` VALUES (64, 'xxxx', '2021-07-04 18:14:51', 6, 9);
INSERT INTO `updatarelation` VALUES (65, 'xxxx', '2021-04-04 18:13:39', 38, 11);
INSERT INTO `updatarelation` VALUES (66, 'xxxx', '2022-03-26 20:21:17', 6, 23);
INSERT INTO `updatarelation` VALUES (67, 'xxxx', '2017-10-16 00:23:37', 22, 9);
INSERT INTO `updatarelation` VALUES (68, 'xxxx', '2020-01-31 06:37:42', 24, 18);
INSERT INTO `updatarelation` VALUES (69, 'xxxx', '2019-09-17 19:46:46', 13, 23);
INSERT INTO `updatarelation` VALUES (70, 'xxxx', '2019-06-22 14:32:08', 23, 27);
INSERT INTO `updatarelation` VALUES (71, 'xxxx', '2017-12-06 14:29:52', 14, 9);
INSERT INTO `updatarelation` VALUES (72, 'xxxx', '2017-01-15 10:55:11', 31, 19);
INSERT INTO `updatarelation` VALUES (73, 'xxxx', '2021-03-28 13:09:50', 12, 26);
INSERT INTO `updatarelation` VALUES (74, 'xxxx', '2022-05-12 09:56:13', 31, 26);
INSERT INTO `updatarelation` VALUES (75, 'xxxx', '2020-08-09 22:48:42', 24, 4);
INSERT INTO `updatarelation` VALUES (76, 'xxxx', '2019-04-15 10:48:00', 13, 8);
INSERT INTO `updatarelation` VALUES (77, 'xxxx', '2021-09-28 05:45:45', 25, 14);
INSERT INTO `updatarelation` VALUES (78, 'xxxx', '2021-11-18 11:18:13', 13, 16);
INSERT INTO `updatarelation` VALUES (79, 'xxxx', '2017-11-18 13:35:17', 5, 5);
INSERT INTO `updatarelation` VALUES (80, 'xxxx', '2021-01-03 07:31:20', 26, 17);
INSERT INTO `updatarelation` VALUES (81, 'xxxx', '2020-09-22 12:09:34', 20, 11);
INSERT INTO `updatarelation` VALUES (82, 'xxxx', '2021-08-24 12:03:47', 21, 11);
INSERT INTO `updatarelation` VALUES (83, 'xxxx', '2020-08-30 21:41:15', 30, 17);
INSERT INTO `updatarelation` VALUES (84, 'xxxx', '2017-01-20 21:20:01', 2, 8);
INSERT INTO `updatarelation` VALUES (85, 'xxxx', '2019-05-08 04:38:00', 30, 8);
INSERT INTO `updatarelation` VALUES (86, 'xxxx', '2017-02-02 15:57:27', 30, 12);
INSERT INTO `updatarelation` VALUES (87, 'xxxx', '2021-09-06 09:40:23', 4, 14);
INSERT INTO `updatarelation` VALUES (88, 'xxxx', '2022-01-16 14:30:49', 33, 11);
INSERT INTO `updatarelation` VALUES (89, 'xxxx', '2019-01-01 20:23:14', 36, 23);
INSERT INTO `updatarelation` VALUES (90, 'xxxx', '2018-12-20 13:32:12', 40, 18);
INSERT INTO `updatarelation` VALUES (91, 'xxxx', '2018-03-16 06:44:30', 7, 1);
INSERT INTO `updatarelation` VALUES (92, 'xxxx', '2021-04-26 20:09:09', 21, 5);
INSERT INTO `updatarelation` VALUES (93, 'xxxx', '2020-07-02 04:12:06', 15, 3);
INSERT INTO `updatarelation` VALUES (94, 'xxxx', '2018-02-01 10:09:31', 10, 25);
INSERT INTO `updatarelation` VALUES (95, 'xxxx', '2019-08-05 14:54:27', 14, 26);
INSERT INTO `updatarelation` VALUES (96, 'xxxx', '2018-11-20 01:42:13', 18, 3);
INSERT INTO `updatarelation` VALUES (97, 'xxxx', '2020-03-09 05:53:47', 28, 23);
INSERT INTO `updatarelation` VALUES (98, 'xxxx', '2020-03-09 14:19:01', 3, 3);
INSERT INTO `updatarelation` VALUES (99, 'xxxx', '2019-09-15 04:39:45', 22, 3);
INSERT INTO `updatarelation` VALUES (100, 'xxxx', '2017-07-16 06:15:34', 29, 18);

-- ----------------------------
-- Table structure for user_houserelation
-- ----------------------------
DROP TABLE IF EXISTS `user_houserelation`;
CREATE TABLE `user_houserelation`  (
  `uh_relation_userid` int NOT NULL COMMENT '用户ID',
  `uh_relation_houseid` int NOT NULL COMMENT '房屋ID',
  `gethousetime` timestamp NULL DEFAULT NULL COMMENT '购房时间',
  `movetime` timestamp NULL DEFAULT NULL COMMENT '入住时间',
  PRIMARY KEY (`uh_relation_userid`, `uh_relation_houseid`) USING BTREE,
  INDEX `uh_relation_houseid`(`uh_relation_houseid`) USING BTREE,
  CONSTRAINT `user_houserelation_ibfk_1` FOREIGN KEY (`uh_relation_userid`) REFERENCES `userinfo` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_houserelation_ibfk_2` FOREIGN KEY (`uh_relation_houseid`) REFERENCES `houseinfo` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_houserelation
-- ----------------------------
INSERT INTO `user_houserelation` VALUES (1, 33, '2019-09-23 04:47:23', '2020-06-07 14:59:05');
INSERT INTO `user_houserelation` VALUES (2, 12, '2019-04-05 01:18:57', '2019-12-15 08:24:48');
INSERT INTO `user_houserelation` VALUES (4, 39, '2020-12-17 01:31:08', '2021-03-05 05:19:10');
INSERT INTO `user_houserelation` VALUES (5, 5, '2018-01-14 04:11:03', '2018-11-11 20:12:33');
INSERT INTO `user_houserelation` VALUES (6, 30, '2022-01-12 10:29:50', '2022-12-04 21:53:31');
INSERT INTO `user_houserelation` VALUES (7, 20, '2019-03-24 04:34:15', '2020-01-06 07:09:57');
INSERT INTO `user_houserelation` VALUES (8, 35, '2018-06-05 15:50:17', '2019-05-21 08:16:23');
INSERT INTO `user_houserelation` VALUES (9, 37, '2019-03-22 12:45:48', '2020-01-27 05:20:33');
INSERT INTO `user_houserelation` VALUES (10, 8, '2019-01-19 18:58:05', '2019-03-30 12:38:58');
INSERT INTO `user_houserelation` VALUES (11, 29, '2019-01-01 21:39:21', '2019-06-20 07:13:22');
INSERT INTO `user_houserelation` VALUES (12, 20, '2019-09-23 16:43:03', '2020-07-03 23:39:42');
INSERT INTO `user_houserelation` VALUES (13, 20, '2021-11-24 09:37:00', '2022-03-14 10:23:37');
INSERT INTO `user_houserelation` VALUES (14, 38, '2021-10-20 16:44:32', '2022-06-25 15:03:48');
INSERT INTO `user_houserelation` VALUES (15, 38, '2021-06-11 23:55:16', '2021-10-01 05:03:02');
INSERT INTO `user_houserelation` VALUES (17, 25, '2017-05-24 19:25:23', '2018-01-07 21:24:40');
INSERT INTO `user_houserelation` VALUES (18, 21, '2021-10-20 07:47:39', '2022-07-22 06:44:12');
INSERT INTO `user_houserelation` VALUES (19, 3, '2018-12-07 00:33:40', '2019-07-14 15:36:02');
INSERT INTO `user_houserelation` VALUES (20, 28, '2021-11-22 20:18:16', '2022-04-08 06:47:50');
INSERT INTO `user_houserelation` VALUES (21, 37, '2017-04-21 22:10:25', '2017-12-31 13:31:03');
INSERT INTO `user_houserelation` VALUES (22, 4, '2020-03-04 23:46:55', '2020-07-03 15:23:07');
INSERT INTO `user_houserelation` VALUES (23, 8, '2019-07-07 08:36:58', '2019-10-14 22:52:57');
INSERT INTO `user_houserelation` VALUES (24, 9, '2019-05-31 21:14:05', '2019-10-02 02:40:38');
INSERT INTO `user_houserelation` VALUES (26, 6, '2017-04-22 19:13:48', '2017-12-02 01:44:27');
INSERT INTO `user_houserelation` VALUES (27, 10, '2022-02-18 15:18:19', '2022-04-27 15:32:38');
INSERT INTO `user_houserelation` VALUES (28, 3, '2020-02-25 03:54:49', '2020-07-08 04:43:07');
INSERT INTO `user_houserelation` VALUES (29, 18, '2019-10-24 04:57:49', '2020-04-01 11:15:07');
INSERT INTO `user_houserelation` VALUES (30, 40, '2017-08-22 13:39:35', '2018-08-10 12:26:02');
INSERT INTO `user_houserelation` VALUES (31, 5, '2020-01-05 20:03:56', '2020-07-12 21:55:37');
INSERT INTO `user_houserelation` VALUES (32, 28, '2019-08-21 01:32:50', '2020-03-15 11:02:16');
INSERT INTO `user_houserelation` VALUES (33, 26, '2021-08-24 17:38:44', '2021-12-05 18:10:03');
INSERT INTO `user_houserelation` VALUES (34, 11, '2019-03-30 02:53:22', '2019-06-12 13:17:23');
INSERT INTO `user_houserelation` VALUES (35, 25, '2018-10-26 02:04:45', '2019-07-04 12:28:16');
INSERT INTO `user_houserelation` VALUES (36, 7, '2019-11-26 18:31:56', '2020-11-11 20:29:25');
INSERT INTO `user_houserelation` VALUES (37, 22, '2020-05-19 09:54:43', '2020-09-07 06:19:14');
INSERT INTO `user_houserelation` VALUES (38, 9, '2018-10-02 01:47:22', '2019-03-07 16:58:50');
INSERT INTO `user_houserelation` VALUES (39, 27, '2019-09-20 03:44:06', '2019-12-25 20:32:32');
INSERT INTO `user_houserelation` VALUES (40, 9, '2018-11-02 03:13:42', '2019-06-04 12:54:22');
INSERT INTO `user_houserelation` VALUES (41, 26, '2020-09-01 01:27:58', '2020-11-05 03:06:26');
INSERT INTO `user_houserelation` VALUES (42, 2, '2020-07-31 20:47:00', '2021-01-04 07:35:52');
INSERT INTO `user_houserelation` VALUES (43, 38, '2019-10-31 14:36:13', '2020-05-21 21:18:07');
INSERT INTO `user_houserelation` VALUES (44, 4, '2020-02-06 18:59:07', '2020-12-22 19:46:56');
INSERT INTO `user_houserelation` VALUES (45, 15, '2017-11-13 01:40:42', '2018-04-01 02:10:34');
INSERT INTO `user_houserelation` VALUES (46, 5, '2021-02-27 14:23:06', '2021-11-15 14:02:22');
INSERT INTO `user_houserelation` VALUES (47, 29, '2021-03-08 04:57:33', '2021-08-22 06:48:09');
INSERT INTO `user_houserelation` VALUES (48, 24, '2020-09-01 22:58:18', '2021-01-12 04:47:24');
INSERT INTO `user_houserelation` VALUES (49, 28, '2018-12-29 07:56:10', '2019-08-07 02:02:15');
INSERT INTO `user_houserelation` VALUES (50, 34, '2022-03-15 13:41:14', '2022-08-27 07:00:45');
INSERT INTO `user_houserelation` VALUES (51, 23, '2018-01-14 23:36:12', '2018-10-12 00:44:29');
INSERT INTO `user_houserelation` VALUES (53, 1, '2021-11-16 01:00:50', '2022-10-23 02:49:38');
INSERT INTO `user_houserelation` VALUES (54, 36, '2020-01-31 03:32:33', '2020-11-06 06:13:32');
INSERT INTO `user_houserelation` VALUES (55, 29, '2020-07-04 01:47:40', '2020-12-15 04:50:33');
INSERT INTO `user_houserelation` VALUES (56, 31, '2017-04-23 03:41:12', '2017-09-05 22:34:50');
INSERT INTO `user_houserelation` VALUES (57, 3, '2017-12-06 22:22:15', '2018-02-09 08:57:01');
INSERT INTO `user_houserelation` VALUES (58, 3, '2017-02-23 01:39:27', '2018-01-20 05:25:11');
INSERT INTO `user_houserelation` VALUES (59, 31, '2018-03-16 16:44:41', '2019-02-23 21:04:20');
INSERT INTO `user_houserelation` VALUES (60, 39, '2020-11-09 00:35:42', '2021-10-31 13:27:02');
INSERT INTO `user_houserelation` VALUES (61, 10, '2017-04-17 05:00:21', '2017-12-21 04:02:39');
INSERT INTO `user_houserelation` VALUES (62, 1, '2021-03-20 15:57:59', '2021-10-16 16:56:55');
INSERT INTO `user_houserelation` VALUES (63, 28, '2018-04-30 19:32:56', '2018-11-12 18:11:03');
INSERT INTO `user_houserelation` VALUES (64, 40, '2021-07-22 02:43:08', '2022-03-24 13:18:55');
INSERT INTO `user_houserelation` VALUES (65, 8, '2020-02-12 04:51:32', '2020-05-20 23:27:34');
INSERT INTO `user_houserelation` VALUES (66, 39, '2018-07-13 13:46:14', '2018-11-27 14:08:26');
INSERT INTO `user_houserelation` VALUES (68, 35, '2019-09-09 15:22:06', '2020-02-08 19:55:16');
INSERT INTO `user_houserelation` VALUES (69, 11, '2019-02-11 10:24:40', '2019-11-04 09:23:17');
INSERT INTO `user_houserelation` VALUES (70, 26, '2022-03-26 06:40:45', '2022-07-15 22:10:11');
INSERT INTO `user_houserelation` VALUES (71, 30, '2018-01-24 13:04:21', '2018-09-01 04:39:32');
INSERT INTO `user_houserelation` VALUES (72, 35, '2019-09-12 07:15:58', '2020-01-19 22:43:30');
INSERT INTO `user_houserelation` VALUES (73, 32, '2018-11-12 12:25:07', '2019-04-06 23:37:00');
INSERT INTO `user_houserelation` VALUES (74, 11, '2021-09-20 20:42:54', '2022-06-23 22:35:17');
INSERT INTO `user_houserelation` VALUES (75, 10, '2018-07-20 14:58:55', '2019-06-01 14:36:26');
INSERT INTO `user_houserelation` VALUES (76, 39, '2018-10-13 09:44:52', '2019-04-17 16:07:40');
INSERT INTO `user_houserelation` VALUES (77, 25, '2021-01-28 10:39:36', '2021-11-04 23:36:34');
INSERT INTO `user_houserelation` VALUES (78, 13, '2018-09-24 22:46:51', '2019-05-30 10:44:12');
INSERT INTO `user_houserelation` VALUES (79, 31, '2019-01-22 04:13:33', '2019-06-08 03:58:25');
INSERT INTO `user_houserelation` VALUES (80, 29, '2020-01-15 03:01:29', '2020-06-10 12:46:27');
INSERT INTO `user_houserelation` VALUES (81, 22, '2019-10-15 05:00:11', '2020-05-20 17:21:32');
INSERT INTO `user_houserelation` VALUES (82, 39, '2020-05-31 12:48:27', '2021-02-13 00:10:46');
INSERT INTO `user_houserelation` VALUES (83, 32, '2020-12-23 07:32:52', '2021-03-15 12:43:08');
INSERT INTO `user_houserelation` VALUES (84, 14, '2018-03-12 22:56:41', '2018-10-26 09:59:54');
INSERT INTO `user_houserelation` VALUES (85, 4, '2020-09-22 14:39:12', '2021-08-06 20:46:59');
INSERT INTO `user_houserelation` VALUES (86, 20, '2021-11-01 03:26:39', '2022-09-25 01:39:18');
INSERT INTO `user_houserelation` VALUES (87, 14, '2020-12-15 14:03:02', '2021-03-25 13:23:15');
INSERT INTO `user_houserelation` VALUES (88, 34, '2021-07-23 08:30:03', '2021-09-28 10:49:39');
INSERT INTO `user_houserelation` VALUES (89, 32, '2019-03-12 00:15:29', '2019-08-01 13:01:59');
INSERT INTO `user_houserelation` VALUES (90, 13, '2021-09-26 05:30:31', '2022-04-13 22:34:00');
INSERT INTO `user_houserelation` VALUES (92, 22, '2022-01-10 01:01:40', '2022-12-06 04:47:17');
INSERT INTO `user_houserelation` VALUES (93, 1, '2021-04-07 23:46:55', '2022-03-24 20:08:29');
INSERT INTO `user_houserelation` VALUES (94, 26, '2018-10-20 11:15:10', '2019-08-27 02:15:00');
INSERT INTO `user_houserelation` VALUES (95, 22, '2018-11-09 06:34:35', '2019-06-12 21:02:05');
INSERT INTO `user_houserelation` VALUES (96, 32, '2020-07-07 05:04:03', '2021-06-22 20:28:05');
INSERT INTO `user_houserelation` VALUES (97, 4, '2021-11-04 18:41:06', '2022-10-26 06:31:23');
INSERT INTO `user_houserelation` VALUES (98, 3, '2019-11-27 06:50:33', '2020-09-03 13:33:13');
INSERT INTO `user_houserelation` VALUES (99, 26, '2017-06-10 20:25:19', '2018-02-05 00:58:11');
INSERT INTO `user_houserelation` VALUES (100, 24, '2019-04-21 08:33:00', '2019-12-06 08:15:50');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userid` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `userpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `isactive` tinyint NOT NULL DEFAULT 0 COMMENT '是否激活(0:未激活, 1:已激活)',
  `userphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `useremail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `userphone`(`userphone`) USING BTREE,
  UNIQUE INDEX `useremail`(`useremail`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, '磨暮', 'jjfN8m$J(nJ9rX@auPwe', 0, '15362264107', 'wwmgbp@qq.com;');
INSERT INTO `userinfo` VALUES (2, '介雅诗', '7K1&pORh$~vOr7Sc', 0, '15181495409', 'hobpgnesqkbjdn@sohu.com;');
INSERT INTO `userinfo` VALUES (3, '革清晖', 'd!TB03N(Q', 0, '13428002557', 'cvreqvbwj@35.com;');
INSERT INTO `userinfo` VALUES (4, '步金', 'D2dGT@XCd5T!7$469', 0, '15351467466', 'efiogcpsdkr@35.com;');
INSERT INTO `userinfo` VALUES (5, '世寒凝', 'rU3kD(PcAZHz', 0, '15735257321', 'vcb@35.com;');
INSERT INTO `userinfo` VALUES (6, '颜海荣', 'zav2tVcQ$$pn7IW', 0, '18884415520', 'twjko@enet.com.cn;');
INSERT INTO `userinfo` VALUES (7, '占鸿德', 'avHZeX8y3&Z9k0', 0, '18560027894', 'vrjin@qq.com;');
INSERT INTO `userinfo` VALUES (8, '泷灵安', '5oevHH1gcH', 0, '18592682871', 'opwm@263.net;');
INSERT INTO `userinfo` VALUES (9, '诸碧曼', 'q(~eEbUGJ)pACJ*', 0, '13514189910', 'rhlsikh@msn.com;');
INSERT INTO `userinfo` VALUES (10, '辛书双', 'sCdv+Btuy1&', 0, '18538232830', 'foutwmpmroelii@hotmail.com;');
INSERT INTO `userinfo` VALUES (11, '侍海逸', 'wC2Id%E(%j6dXhcSnP+', 0, '18246229697', 'nilkhv@21cn.com;');
INSERT INTO `userinfo` VALUES (12, '费嘉良', 'g9U%1R0!2bTt+!$G)VL', 0, '13397806288', 'iemlncetfd@citiz.com;');
INSERT INTO `userinfo` VALUES (13, '桂傲之', 'Y#YlJRb_znljEC&k', 0, '15039435533', 'lrcqvcfvc@hotmail.com;');
INSERT INTO `userinfo` VALUES (14, '撒长文', 'bbnknh3Ur2r~n)vKD', 0, '15614843474', 'wfirctj@21cn.com;');
INSERT INTO `userinfo` VALUES (15, '稽昕月', '5zIa$s7FEjU', 0, '14761524418', 'bdksaevok@eyou.com;');
INSERT INTO `userinfo` VALUES (16, '逯惜文', 'VZEugOXyC6', 0, '18418542764', 'ftlvtfs@yahoo.com.cn;');
INSERT INTO `userinfo` VALUES (17, '力瑶岑', 'NNZl7Rl()8%fOh', 0, '13299125692', 'poobsmgeh@163.net;');
INSERT INTO `userinfo` VALUES (18, '衡鸿福', '*FlL*$+xCy@rUsC', 0, '15959781819', 'soeq@126.com;');
INSERT INTO `userinfo` VALUES (19, '竺痴春', 'C+uO^anwKNGzMgxF!czn', 0, '18988198979', 'hqrdnkr@263.net;');
INSERT INTO `userinfo` VALUES (20, '东郭梦丝', 'd7$)PZ21CwFij)', 0, '18819007087', 'crkv@163.com;');
INSERT INTO `userinfo` VALUES (21, '佟佳惜萍', 'fZ~717PiJg', 0, '19837378632', 'vgokmjakurhiij@sina.com;');
INSERT INTO `userinfo` VALUES (22, '顿阳德', 'ab3bKGN0o2Deq(BF', 0, '13446924831', 'rnmvbracdt@email.com.cn;');
INSERT INTO `userinfo` VALUES (23, '潭济', 'slYPwBuP~~LA7Ufy', 0, '17589976165', 'kmqjfwuhmfsugft@tom.com;');
INSERT INTO `userinfo` VALUES (24, '旁娅欣', 'QXkCeYB9qdU', 0, '16518926439', 'cipnjwui@263.net;');
INSERT INTO `userinfo` VALUES (25, '塞刚捷', 'cllTsG6m$Dl(zSY', 0, '15692437651', 'egmhpjjwiaudjm@enet.com.cn;');
INSERT INTO `userinfo` VALUES (26, '潮寄柔', 'rO@_Uj)5', 0, '14526386859', 'lroosu@qq.com;');
INSERT INTO `userinfo` VALUES (27, '冠心慈', 'P9t0drm&je!z9_BU', 0, '19886732724', 'bkhabmtahw@msn.com;');
INSERT INTO `userinfo` VALUES (28, '封春冬', '1tov+~h0UlCT+jR+(4v', 0, '17774082040', 'avdkufkjivwc@sohu.com;');
INSERT INTO `userinfo` VALUES (29, '锁薇', 'sa$pW4u_@spnw#z~vb4O', 0, '13998509574', 'kcrgdgp@yahoo.com.cn;');
INSERT INTO `userinfo` VALUES (30, '养君博', 'oBFRBi6oq8HGY72C8e', 0, '13189937998', 'ecivsdusjsdd@yahoo.com.cn;');
INSERT INTO `userinfo` VALUES (31, '艾永嘉', 'glCGI*_FT*$iANy', 0, '18974617470', 'dqmjekclep@yeah.net;');
INSERT INTO `userinfo` VALUES (32, '夷丹萱', 'DKkc#ZybC+l%z', 0, '15714715911', 'qgatjjgpvimhp@sohu.com;');
INSERT INTO `userinfo` VALUES (33, '学高超', '5UOA43AtO', 0, '18275708544', 'dngecu@xinhuanet;');
INSERT INTO `userinfo` VALUES (34, '旗宇荫', 'QDBss0Ih84@rEM', 0, '17291387994', 'mnukgdqvq@netease.com;');
INSERT INTO `userinfo` VALUES (35, '长孙映冬', 'hf&TfdG7kZFJhT5v', 0, '16603448856', 'knsm@email.com.cn;');
INSERT INTO `userinfo` VALUES (36, '道嘉庆', 'DC(guNR@+ndHYA9V', 0, '13487213373', 'uuqsefrv@citiz.com;');
INSERT INTO `userinfo` VALUES (37, '霜天泽', 'Q~VXD$M+64', 0, '13994582338', 'uulqfeqkfmvalej@35.com;');
INSERT INTO `userinfo` VALUES (38, '闵淳雅', 'Lo&6Ok&2ud', 0, '17624636127', 'vtuhaukfwsrii@163.net;');
INSERT INTO `userinfo` VALUES (39, '双鸣', 'xhuAf%LSVY4vTLE2p', 0, '13019864079', 'hesa@netease.com;');
INSERT INTO `userinfo` VALUES (40, '休霁', 'B@EKq!KgGPQ41', 0, '15928301294', 'kfthh@21cn.com;');
INSERT INTO `userinfo` VALUES (41, '翦明明', 'k9nW7B6$hcl!vCYtKJ', 0, '16619471464', 'tjliiascbouwb@hotmail.com;');
INSERT INTO `userinfo` VALUES (42, '长文瑶', 'y@lkW1wd*dIPUax', 0, '17839649584', 'jvcujjpgj@yahoo.com.cn;');
INSERT INTO `userinfo` VALUES (43, '向嘉宝', 'Hxs$qCu+t(', 0, '18231258409', 'sknaaqbp@yeah.net;');
INSERT INTO `userinfo` VALUES (44, '石叡', 'TEzjOXxikfiHH4$Tb', 0, '18368962222', 'hiwhhkg@netease.com;');
INSERT INTO `userinfo` VALUES (45, '冯琛丽', '8dj3(nNUQwf%h)XcER', 0, '19987797236', 'bdvesvejji@35.com;');
INSERT INTO `userinfo` VALUES (46, '薛运杰', 'mG5MmH2GGZ_vLiERB', 0, '17829157005', 'bwreh@qq.com;');
INSERT INTO `userinfo` VALUES (47, '坚白梅', '~)_JJdpI5rCi', 0, '15014436333', 'neuicpcmd@126.com;');
INSERT INTO `userinfo` VALUES (48, '侯寄蓉', '3_A+RrrtxhhA', 0, '17599074264', 'vjplhkugsc@sohu.com;');
INSERT INTO `userinfo` VALUES (49, '仪渊', 'Pg7ks8ny5Tw', 0, '15805563867', 'ogekfjfcawfwr@eyou.com;');
INSERT INTO `userinfo` VALUES (50, '红慧', '35xa~9OcH@zeQIAy', 0, '15341088927', 'smqi@citiz.com;');
INSERT INTO `userinfo` VALUES (51, '苏秀慧', 'Z1O~$y2ru6d*o#n~', 0, '13942478447', 'hkr@msn.com;');
INSERT INTO `userinfo` VALUES (52, '折晴画', 'hX(&4F5nSl_&ajL', 0, '17111791758', 'oghbpust@tom.com;');
INSERT INTO `userinfo` VALUES (53, '睦锐意', 'AhEzN3Amf*&Gy~%G7Rv', 0, '13948189926', 'vftdvk@sohu.com;');
INSERT INTO `userinfo` VALUES (54, '逄雅韵', 'yU(AQCG&kqL3&', 0, '18006897112', 'eqqe@35.com;');
INSERT INTO `userinfo` VALUES (55, '母向卉', 'lI23e+lxoC@I3gmMA%', 0, '13914008537', 'rcrrlhtkaorv@sohu.com;');
INSERT INTO `userinfo` VALUES (56, '鄢天翰', 'm6Vo^OioPc(6W6wg2t', 0, '17333888377', 'gieuupugtedif@35.com;');
INSERT INTO `userinfo` VALUES (57, '庹流婉', 'f0^iDU7KCOphoH3T!de%', 0, '17757138214', 'qtkmfhnda@netease.com;');
INSERT INTO `userinfo` VALUES (58, '纵侠', '#fd^ZbDWV', 0, '13602966167', 'glfejwo@35.com;');
INSERT INTO `userinfo` VALUES (59, '及彬郁', 'd$bFdBQg', 0, '13091518197', 'slth@eastday.com;');
INSERT INTO `userinfo` VALUES (60, '宁藉', '9kllI6mH_0+fyc_U', 0, '18437909551', 'kfn@163.net;');
INSERT INTO `userinfo` VALUES (61, '平思若', ')kiZuhzc5(', 0, '18240531757', 'chuhrginop@sohu.com;');
INSERT INTO `userinfo` VALUES (62, '舒又青', 'ISA+B~&_B5eM~P1', 0, '18000542837', 'lvijb@163.com;');
INSERT INTO `userinfo` VALUES (63, '叶雨琴', 'F6QYW4Y15j9e1', 0, '18877072113', 'erbtreadlat@hotmail.com;');
INSERT INTO `userinfo` VALUES (64, '矫婀娜', 'buu)$xzWRoO8j#k', 0, '18959892325', 'jgtvnvj@netease.com;');
INSERT INTO `userinfo` VALUES (65, '雍虹影', 'fy3AzhadPJvx$%!e', 0, '14535268546', 'bmwn@netease.com;');
INSERT INTO `userinfo` VALUES (66, '赵曼蔓', 'E(EOhbEtX3jz)xP_!2fS', 0, '15621252459', 'iptjnrj@eyou.com;');
INSERT INTO `userinfo` VALUES (67, '辜山兰', '0ljeHb6RxS9u$EzNpeXc', 0, '13693086244', 'ldcrdun@sina.com;');
INSERT INTO `userinfo` VALUES (68, '税贞静', 'w^iqqA5OJW8~@', 0, '15763819718', 'orfcksdeqnpmu@eyou.com;');
INSERT INTO `userinfo` VALUES (69, '资春竹', 'opSZtyJ6f6K@', 0, '19855853523', 'prsd@265.com;');
INSERT INTO `userinfo` VALUES (70, '尔林', 'sGY^I8f3p2g&9sj', 0, '19982727767', 'swuskksp@citiz.com;');
INSERT INTO `userinfo` VALUES (71, '仇绍元', '%wAOzoRa^B4', 0, '18125081185', 'krovncffagibtpl@eastday.com;');
INSERT INTO `userinfo` VALUES (72, '邢璇玑', 'H1AwmdZ8BGG*', 0, '13536715176', 'fbibjhntrhh@enet.com.cn;');
INSERT INTO `userinfo` VALUES (73, '侨谷之', 'm+6Bw#lXImrcmHD5Zfs', 0, '13473565115', 'hmrufrfegnmnddi@eyou.com;');
INSERT INTO `userinfo` VALUES (74, '西门千柔', 'CX07AA1cjKiy$Y%M5*x', 0, '18355956753', 'egtlnnmobjbc@qq.com;');
INSERT INTO `userinfo` VALUES (75, '嘉颖秀', 'L&xM7@Mno$OI', 0, '15626886801', 'ufqwtgvkqiswlt@citiz.com;');
INSERT INTO `userinfo` VALUES (76, '闾丘清华', '3!&4Qayz%IVnvyl', 0, '15601922097', 'decndbdtq@263.net;');
INSERT INTO `userinfo` VALUES (77, '洛冷雪', 'nc(+@#1LnnvnL', 0, '19995116743', 'geiecjtohjemjfr@163.net;');
INSERT INTO `userinfo` VALUES (78, '贸涵涵', '2Tj+7UY!_Ft$', 0, '17623411252', 'pocqdrguwf@etang.com;');
INSERT INTO `userinfo` VALUES (79, '轩辕高明', 'eR9ocee6m$$j', 0, '15060687487', 'cufucogieq@265.com;');
INSERT INTO `userinfo` VALUES (80, '徭庆', 'o3clzkOos^HxvUP^', 0, '16625136262', 'fdtwppiilp@eastday.com;');
INSERT INTO `userinfo` VALUES (81, '胥明轩', 'sNH%acYjrKL%JW', 0, '14754326085', 'tldjb@sohu.com;');
INSERT INTO `userinfo` VALUES (82, '单于雨晨', 'vnVOFyoXd', 0, '13683088883', 'dfrfmv@sohu.com;');
INSERT INTO `userinfo` VALUES (83, '窦帅', 'Up7@BltB+qK1Gc', 0, '18875842405', 'nlegwbjlwug@eyou.com;');
INSERT INTO `userinfo` VALUES (84, '乐正元彤', 'F#8qHpf$x1+%~', 0, '13634187952', 'ufijq@263.net;');
INSERT INTO `userinfo` VALUES (85, '勾夏兰', 'ulnlq2014dzsPQvgOnw', 0, '17261101905', 'nltgu@126.com;');
INSERT INTO `userinfo` VALUES (86, '覃文君', '^Wy2siKKn&jM6~(', 0, '13346041580', 'jkvhaairug@56.com;');
INSERT INTO `userinfo` VALUES (87, '司寇晓山', 'oDn%uiHv)*6NO', 0, '15511547440', 'akwdlrcs@163.net;');
INSERT INTO `userinfo` VALUES (88, '姒友', 'L0#(*uRXN1%NdWKS_Je', 0, '19849706499', 'jstrnq@enet.com.cn;');
INSERT INTO `userinfo` VALUES (89, '延芸若', 'BKQ)p8Skvj))SkCk3Xl@', 0, '13915746602', 'uiiq@yeah.net;');
INSERT INTO `userinfo` VALUES (90, '喻采绿', 'gE7EVXnTk)+)Y', 0, '15996874013', 'bng@sina.com;');
INSERT INTO `userinfo` VALUES (91, '完星阑', '*YPSC@dUM3bkP^WVxG', 0, '18301253712', 'cibwl@35.com;');
INSERT INTO `userinfo` VALUES (92, '穰子亦', '5RFFJc(b%~nHsNn1Hnb', 0, '18083073703', 'ohhls@tom.com;');
INSERT INTO `userinfo` VALUES (93, '裴敬', 'Q#1u#$X6&VJGZlcnL', 0, '18234402019', 'kbclgkopgjbtg@sohu.com;');
INSERT INTO `userinfo` VALUES (94, '犹浩初', 'kG0P5(p)', 0, '15131684548', 'cvlvteoh@35.com;');
INSERT INTO `userinfo` VALUES (95, '酆元', 'VIgwGyF3@F0sF4_', 0, '15122575248', 'nacrginnonwvc@eyou.com;');
INSERT INTO `userinfo` VALUES (96, '彭靖柏', '&3W3BgF!T^HEKK@', 0, '13797627636', 'hkc@email.com.cn;');
INSERT INTO `userinfo` VALUES (97, '春国安', ')C_ftE#crJR', 0, '14777781300', 'noi@qq.com;');
INSERT INTO `userinfo` VALUES (98, '尚尔安', ')EO!rfYO', 0, '17872382415', 'cjckiphhioimqq@email.com.cn;');
INSERT INTO `userinfo` VALUES (99, '夙景焕', 'wz3gD)z4*J', 0, '13460966934', 'nuqhseqikwcmecu@enet.com.cn;');
INSERT INTO `userinfo` VALUES (100, '依勇锐', 'RX_$2LvU', 0, '15037124838', 'kgusrstjac@56.com;');
INSERT INTO `userinfo` VALUES (101, '', '', 0, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
