/*
Navicat MySQL Data Transfer

Source Server         : LH
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2017-07-23 11:18:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(36) character set utf8 NOT NULL,
  `user_name` varchar(255) character set utf8 default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');
INSERT INTO `admin` VALUES ('10', '324', '3423');
INSERT INTO `admin` VALUES ('11', '342', '32423');
INSERT INTO `admin` VALUES ('12', '324', '2423');
INSERT INTO `admin` VALUES ('2', 'user', '654321');
INSERT INTO `admin` VALUES ('3', 'lh', '123456');
INSERT INTO `admin` VALUES ('4', '1', '1');
INSERT INTO `admin` VALUES ('5', 'AA', '1234');
INSERT INTO `admin` VALUES ('6', '大', '2');
INSERT INTO `admin` VALUES ('7', '文革', '23');
INSERT INTO `admin` VALUES ('8', '打工的', '规定');
INSERT INTO `admin` VALUES ('9', '软文广告', '324');

-- ----------------------------
-- Table structure for `carbase`
-- ----------------------------
DROP TABLE IF EXISTS `carbase`;
CREATE TABLE `carbase` (
  `id` varchar(36) character set utf8 NOT NULL,
  `name` varchar(255) character set utf8 default NULL,
  `code` varchar(255) character set utf8 default NULL,
  `pid` varchar(255) character set utf8 default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of carbase
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` char(36) character set utf8 NOT NULL COMMENT 'ID',
  `user_name` varchar(255) character set utf8 default NULL COMMENT '账号',
  `password` varchar(255) character set utf8 default NULL COMMENT '密码',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '12345456');
