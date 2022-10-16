/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : book

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 21/08/2022 19:52:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `aid` int(11) NOT NULL COMMENT 'apply id',
  `sid` int(11) NULL DEFAULT NULL COMMENT 'student id',
  `cid` int(11) NULL DEFAULT NULL COMMENT 'course id',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT 'apply time',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `a_sid`(`sid`) USING BTREE,
  INDEX `a_cid`(`cid`) USING BTREE,
  CONSTRAINT `a_cid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `a_sid` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `aid` int(11) NOT NULL COMMENT 'attendance id',
  `sid` int(11) NULL DEFAULT NULL COMMENT 'student id',
  `cid` int(11) NULL DEFAULT NULL COMMENT 'course id',
  `attendancetime` datetime(0) NULL DEFAULT NULL COMMENT 'student attendance time',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `a_sid_2`(`sid`) USING BTREE,
  INDEX `a_cid_2`(`cid`) USING BTREE,
  CONSTRAINT `a_cid_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `a_sid_2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cid` int(11) NOT NULL COMMENT 'id',
  `cname` varchar(255)  NULL DEFAULT NULL COMMENT 'course name',
  `starttime` datetime(0) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `ctype` varchar(255)  NULL DEFAULT NULL COMMENT 'course type',
  `applynumber` int(11) NULL DEFAULT NULL COMMENT 'apply student number',
  PRIMARY KEY (`cid`) USING BTREE
);

-- ----------------------------
-- Table structure for instruction
-- ----------------------------
DROP TABLE IF EXISTS `instruction`;
CREATE TABLE `instruction`  (
  `iid` int(11) NOT NULL COMMENT 'instruction id',
  `cid` int(11) NULL DEFAULT NULL COMMENT 'course id',
  `tid` int(11) NULL DEFAULT NULL COMMENT 'teacher id',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT 'instruction start time',
  PRIMARY KEY (`iid`) USING BTREE,
  INDEX `i_tid`(`tid`) USING BTREE,
  INDEX `i_cid`(`cid`) USING BTREE,
  CONSTRAINT `i_cid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `i_tid` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` int(11) NOT NULL COMMENT 'id',
  `sname` varchar(20)  NULL DEFAULT NULL COMMENT 'name',
  `bod` date NULL DEFAULT NULL COMMENT 'birthday',
  `gender` char(1)  NULL DEFAULT NULL COMMENT 'm-man;f-female',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tid` int(18) NOT NULL,
  `tname` varchar(30)  NULL DEFAULT NULL,
  `bod` date NULL DEFAULT NULL COMMENT 'birthday',
  PRIMARY KEY (`tid`) USING BTREE
);


SET FOREIGN_KEY_CHECKS = 1;




INSERT INTO `course`(`cid`, `cname`, `starttime`, `endtime`, `ctype`, `applynumber`) VALUES (1, 'Zumba-basic', '2022-08-22 20:21:02', '2022-08-30 22:21:06', 'classical', 0);

INSERT INTO `course`(`cid`, `cname`, `starttime`, `endtime`, `ctype`, `applynumber`) VALUES (2, 'Zumba-professional', '2022-08-22 20:21:02', '2022-08-30 22:21:06', 'classical', 0);