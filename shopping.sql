/*
Navicat MySQL Data Transfer

Source Server         : mylocal
Source Server Version : 50015
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50015
File Encoding         : 65001

Date: 2018-12-26 08:45:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL COMMENT '账户余额',
  `source` varchar(255) NOT NULL COMMENT '财富来源：注册赠送 或者 个人充值 或者 商城消费',
  `updtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '12121212121', '1000', '注册赠送', '2017-12-16 20:25:58');
INSERT INTO `account` VALUES ('2', '11111111111', '1000', '注册赠送', '2017-12-16 20:26:15');
INSERT INTO `account` VALUES ('4', '13900009998', '1000', '注册赠送', '2017-12-16 20:26:15');
INSERT INTO `account` VALUES ('5', '13900009998', '-51', '商城消费', '2017-12-18 18:21:12');
INSERT INTO `account` VALUES ('6', '13900009998', '-51', '商城消费', '2017-12-18 18:25:04');
INSERT INTO `account` VALUES ('7', '13900009998', '-100', '商城消费', '2017-12-18 18:34:53');
INSERT INTO `account` VALUES ('8', '13900009998', '-100', '商城消费', '2017-12-18 18:35:43');
INSERT INTO `account` VALUES ('9', '13900009998', '-100', '商城消费', '2017-12-18 18:35:44');
INSERT INTO `account` VALUES ('10', '13900009998', '-100', '商城消费', '2017-12-18 18:36:54');
INSERT INTO `account` VALUES ('11', '13900009998', '-100', '商城消费', '2017-12-18 18:36:55');
INSERT INTO `account` VALUES ('12', '13900009998', '-100', '商城消费', '2017-12-18 18:37:34');
INSERT INTO `account` VALUES ('13', '13900009998', '-100', '商城消费', '2017-12-18 18:37:34');
INSERT INTO `account` VALUES ('14', '13900009998', '-100', '商城消费', '2017-12-18 18:37:34');
INSERT INTO `account` VALUES ('15', '13900009998', '-100', '商城消费', '2017-12-18 18:37:35');
INSERT INTO `account` VALUES ('16', '13900009998', '-100', '商城消费', '2017-12-18 18:37:35');
INSERT INTO `account` VALUES ('17', '13900009998', '-100', '商城消费', '2017-12-18 18:38:22');
INSERT INTO `account` VALUES ('18', '13900009998', '-100', '商城消费', '2017-12-18 18:38:23');
INSERT INTO `account` VALUES ('19', '13900009998', '-100', '商城消费', '2017-12-18 18:38:48');
INSERT INTO `account` VALUES ('20', '13900009998', '-100', '商城消费', '2017-12-18 18:38:49');
INSERT INTO `account` VALUES ('21', '13900009998', '-100', '商城消费', '2017-12-18 18:41:43');
INSERT INTO `account` VALUES ('22', '13900009998', '-100', '商城消费', '2017-12-18 18:41:45');
INSERT INTO `account` VALUES ('23', '13900009998', '-100', '商城消费', '2017-12-18 18:42:04');
INSERT INTO `account` VALUES ('24', '13900009998', '-100', '商城消费', '2017-12-18 18:42:05');
INSERT INTO `account` VALUES ('25', '13900009998', '-100', '商城消费', '2017-12-18 18:42:06');
INSERT INTO `account` VALUES ('26', '13900009998', '-100', '商城消费', '2017-12-18 18:42:17');
INSERT INTO `account` VALUES ('27', '13900009998', '-100', '商城消费', '2017-12-18 18:42:18');
INSERT INTO `account` VALUES ('28', '13900009998', '-100', '商城消费', '2017-12-18 18:42:25');
INSERT INTO `account` VALUES ('29', '13900009998', '-100', '商城消费', '2017-12-18 18:42:34');
INSERT INTO `account` VALUES ('30', '13900009998', '-100', '商城消费', '2017-12-18 18:42:38');
INSERT INTO `account` VALUES ('31', '13900009998', '-100', '商城消费', '2017-12-18 18:43:05');
INSERT INTO `account` VALUES ('32', '13900009998', '-100', '商城消费', '2017-12-18 18:43:06');
INSERT INTO `account` VALUES ('33', '13900009998', '-100', '商城消费', '2017-12-18 18:43:27');
INSERT INTO `account` VALUES ('34', '13900009998', '-100', '商城消费', '2017-12-18 18:43:28');
INSERT INTO `account` VALUES ('35', '13900009998', '-100', '商城消费', '2017-12-18 18:43:39');
INSERT INTO `account` VALUES ('36', '13000001111', '1000', '注册赠送', '2017-12-18 20:42:51');
INSERT INTO `account` VALUES ('37', '18500001111', '2', '注册赠送', '2017-12-18 20:45:11');
INSERT INTO `account` VALUES ('38', '18900001111', '500', '注册赠送', '2017-12-18 20:47:32');
INSERT INTO `account` VALUES ('39', '18900001111', '-160', '商城消费', '2017-12-18 21:17:51');
INSERT INTO `account` VALUES ('40', '18900001111', '-160', '商城消费', '2017-12-18 21:20:13');
INSERT INTO `account` VALUES ('41', '18900001111', '-160', '商城消费', '2017-12-18 21:22:30');
INSERT INTO `account` VALUES ('42', '18900001111', '0', '商城消费', '2017-12-18 21:37:28');
INSERT INTO `account` VALUES ('43', '18900001111', '-10', '商城消费', '2017-12-18 21:38:03');
INSERT INTO `account` VALUES ('44', '18900001111', '-10', '商城消费', '2017-12-18 21:38:26');
INSERT INTO `account` VALUES ('45', '18600001111', '200', '注册赠送', '2017-12-19 13:36:48');
INSERT INTO `account` VALUES ('46', '18600001111', '-160', '商城消费', '2017-12-19 13:37:18');
INSERT INTO `account` VALUES ('47', '18700001111', '200', '注册赠送', '2017-12-19 14:04:53');
INSERT INTO `account` VALUES ('48', '18700001111', '-160', '商城消费', '2017-12-19 14:06:18');
INSERT INTO `account` VALUES ('49', '13811111111', '1000', '充值', '2017-12-30 19:11:19');
INSERT INTO `account` VALUES ('50', '13811111111', '45', '充值', '2017-12-30 19:11:29');
INSERT INTO `account` VALUES ('51', '13099999999', '300', '注册赠送', '2017-12-30 19:13:49');
INSERT INTO `account` VALUES ('52', '13099999999', '-130', '商城消费', '2017-12-30 19:18:16');
INSERT INTO `account` VALUES ('53', '18569468385', '500', '充值', '2018-12-24 13:00:58');
INSERT INTO `account` VALUES ('54', '18569468385', '500', '充值', '2018-12-24 13:11:58');
INSERT INTO `account` VALUES ('55', '18569468385', '-133', '商城消费', '2018-12-24 13:29:53');
INSERT INTO `account` VALUES ('56', '18569468385', '-97', '商城消费', '2018-12-24 13:33:01');
INSERT INTO `account` VALUES ('57', '18569468385', '500', '充值', '2018-12-24 13:33:37');
INSERT INTO `account` VALUES ('58', '18569468385', '100', '充值', '2018-12-24 15:49:03');
INSERT INTO `account` VALUES ('59', '18569468385', '100', '充值', '2018-12-24 15:53:07');
INSERT INTO `account` VALUES ('60', '18569468385', '100', '充值', '2018-12-24 15:56:24');
INSERT INTO `account` VALUES ('61', '18569468385', '200', '充值', '2018-12-24 15:57:06');
INSERT INTO `account` VALUES ('62', '18569468385', '100', '充值', '2018-12-24 15:57:42');
INSERT INTO `account` VALUES ('63', '18569468385', '100', '充值', '2018-12-24 15:58:04');
INSERT INTO `account` VALUES ('64', '18569468385', '100', '充值', '2018-12-24 15:59:11');
INSERT INTO `account` VALUES ('65', '18569468385', '-97', '商城消费', '2018-12-24 16:10:26');
INSERT INTO `account` VALUES ('66', '18569468385', '100', '充值', '2018-12-25 09:32:19');
INSERT INTO `account` VALUES ('67', '18569468385', '100', '充值', '2018-12-25 11:57:01');
INSERT INTO `account` VALUES ('68', '18569468385', '-390', '商城消费', '2018-12-25 12:32:21');

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `id` int(11) NOT NULL auto_increment,
  `sort_order` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('18', '2', 'czsc', '/resources/upload/0403524601a34f6299a732759e236579.jpg', '1');
INSERT INTO `ad` VALUES ('20', '3', 'czsc', '/resources/upload/73edb3e77b21498d888f57583c60a964.jpg', '1');
INSERT INTO `ad` VALUES ('21', '1', 'eqe', '/resources/upload/02858a627e624d6f8bc9099e991d10b9.jpg', '1');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(5) NOT NULL auto_increment,
  `content` text collate utf8_bin,
  `category` varchar(5) collate utf8_bin default NULL,
  `update_time` datetime default NULL,
  `update_user_id` varchar(50) collate utf8_bin default NULL,
  `title` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('15', 0x3C703E266E6273703B6173647361663C2F703E, '2', '2018-12-18 10:29:17', 'admin', 'xxxx');
INSERT INTO `article` VALUES ('16', 0x3C703E266E6273703B6173647361663C2F703E, '2', '2016-10-28 10:53:41', 'admin', '大青花鱼');
INSERT INTO `article` VALUES ('17', 0x3C703E266E6273703B6173647361663C2F703E, '2', '2016-10-28 10:53:41', 'admin', '大青花鱼');
INSERT INTO `article` VALUES ('19', 0x3C703E3C696D67207372633D22687474703A2F2F3132372E302E302E313A383038302F73686F702F75706C6F61642F696D6167652F32303136313032382F313437373633313935303539323031373638352E6A706722207469746C653D22313437373633313935303539323031373638352E6A70672220616C743D227A6762E79A847063E6B58BE8AF95315F30312E6A7067222F3E266E6273703B6173647361663C2F703E, '2', '2016-10-28 13:19:17', 'admin', '大青花鱼');
INSERT INTO `article` VALUES ('21', 0x3C703E266E6273703B6173647361663C2F703E, '2', '2016-10-28 10:53:41', 'admin', '大青花鱼');
INSERT INTO `article` VALUES ('22', 0x3C703E266E6273703B6173647361663C2F703E, '2', '2016-10-28 10:53:41', 'admin', '大青花鱼');
INSERT INTO `article` VALUES ('23', 0x3C703E266E6273703B6173647361663C2F703E, '2', '2016-10-28 10:53:41', 'admin', '大青花鱼');
INSERT INTO `article` VALUES ('32', 0x3C703E266E6273703B3C696D67207469746C653D22313437383631313031303433383039393631362E6A70672220616C743D2234363165386464363237376639653266643533323636376131383330653932346239393966336437202D20E382B3E38394E383BC2E6A706722207372633D22687474703A2F2F6C6F63616C686F73743A383038302F53686F7070696E672F75706C6F61642F696D6167652F32303136313130382F313437383631313031303433383039393631362E6A7067222F3E3C2F703E, '9', '2016-11-08 21:18:49', 'admin', '万用知识点如图');

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `category_id` int(5) NOT NULL auto_increment,
  `category_name` varchar(255) collate utf8_bin default NULL,
  `update_user_id` varchar(50) collate utf8_bin default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES ('2', 'od', 'admin', '2016-10-14 15:18:21');
INSERT INTO `article_category` VALUES ('5', '1', 'admin', '2016-10-28 14:44:13');
INSERT INTO `article_category` VALUES ('6', '2', 'admin', '2016-10-28 14:44:20');
INSERT INTO `article_category` VALUES ('7', '3', 'admin', '2016-10-28 14:44:24');
INSERT INTO `article_category` VALUES ('8', '4', 'admin', '2016-10-28 14:44:28');
INSERT INTO `article_category` VALUES ('9', '5', 'admin', '2016-10-28 14:44:32');
INSERT INTO `article_category` VALUES ('10', '6', 'admin', '2016-10-28 14:44:36');
INSERT INTO `article_category` VALUES ('11', '7', 'admin', '2016-10-28 14:44:39');
INSERT INTO `article_category` VALUES ('12', '8', 'admin', '2016-10-28 14:44:44');
INSERT INTO `article_category` VALUES ('16', 'qawsedfg', 'admin', '2016-10-28 15:47:55');
INSERT INTO `article_category` VALUES ('17', 'fgggdh', 'admin', '2016-10-28 15:48:04');
INSERT INTO `article_category` VALUES ('18', 'hhhhh', 'admin', '2016-10-28 15:57:46');
INSERT INTO `article_category` VALUES ('19', '20161028', 'admin', '2016-10-28 16:04:31');
INSERT INTO `article_category` VALUES ('20', '897494', 'admin', '2016-10-28 16:48:34');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(5) NOT NULL auto_increment,
  `user_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `content` text collate utf8_bin,
  `audit` int(1) default NULL,
  `stars` int(1) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('21', '123486', '935', 0x7472, '1', '5', '2016-10-30 11:52:58');
INSERT INTO `comments` VALUES ('22', '123486', '935', 0x77686572652031203D31, '1', '2', '2016-10-30 15:54:48');
INSERT INTO `comments` VALUES ('23', '123486', '935', 0x77686572652031203D31, '1', '2', '2016-10-30 15:54:55');
INSERT INTO `comments` VALUES ('26', '123484', '935', 0x35313135, '1', '4', '2016-11-04 18:26:49');
INSERT INTO `comments` VALUES ('27', '123484', '935', 0x35313135, '1', '4', '2016-11-04 18:27:05');
INSERT INTO `comments` VALUES ('28', '123468', '997', 0x32313131313131313131, '1', '0', '2016-11-08 18:43:16');
INSERT INTO `comments` VALUES ('29', '123468', '997', 0x32313131313131313131, '1', '5', '2016-11-08 18:43:19');
INSERT INTO `comments` VALUES ('30', '123519', '935', 0x776F7175, '1', '0', '2016-11-08 17:46:04');
INSERT INTO `comments` VALUES ('31', '123519', '935', 0x776F7175, '1', '5', '2016-11-08 17:46:11');
INSERT INTO `comments` VALUES ('32', '123468', '936', 0xE790AFE6BAAAE89C9CE799BDE88289E89C9CE69F9A2032E4B8AAE8A38520E7BAA6322E356B67200AE789B9E588ABE5A5BDEFBC8CE789A9E6B581E4B99FE7BB99E58A9B, '1', '5', '2016-11-08 19:47:28');
INSERT INTO `comments` VALUES ('33', '123468', '936', 0xE790AFE6BAAAE89C9CE799BDE88289E89C9CE69F9A2032E4B8AAE8A38520E7BAA6322E356B6720E789B9E588ABE5A5BDEFBC8CE789A9E6B581E4B99FE7BB99E58A9B, '1', '3', '2016-11-08 19:48:16');
INSERT INTO `comments` VALUES ('34', '123468', '935', 0x736466736466736466, '1', '1', '2016-11-08 20:03:50');
INSERT INTO `comments` VALUES ('35', '123486', '935', 0x617364736164, '1', '5', '2016-11-08 19:54:09');
INSERT INTO `comments` VALUES ('36', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:29');
INSERT INTO `comments` VALUES ('37', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:37');
INSERT INTO `comments` VALUES ('38', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:39');
INSERT INTO `comments` VALUES ('39', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:40');
INSERT INTO `comments` VALUES ('40', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:42');
INSERT INTO `comments` VALUES ('41', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:43');
INSERT INTO `comments` VALUES ('42', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:44');
INSERT INTO `comments` VALUES ('43', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:46');
INSERT INTO `comments` VALUES ('44', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:47');
INSERT INTO `comments` VALUES ('45', '123468', '998', 0x7364667364667364, '1', '2', '2016-11-08 21:39:48');
INSERT INTO `comments` VALUES ('46', '123468', '998', 0x3133323133323133323133313332313332313332313332313332313332, '1', '5', '2016-11-08 21:41:59');
INSERT INTO `comments` VALUES ('47', '123522', '939', 0x66647361, '0', '0', '2016-11-16 15:42:48');
INSERT INTO `comments` VALUES ('48', '123527', '1000', 0xE5BEAEE8BDAFE5BEAEE8BDAFE5BEAEE8BDAF, '1', '1', '2018-12-17 19:12:55');
INSERT INTO `comments` VALUES ('49', '123527', '1000', 0xE597A1E597A1E597A176, '1', '5', '2018-12-17 19:13:54');
INSERT INTO `comments` VALUES ('50', '123528', '935', 0x64776173666461777364, '0', '1', '2018-12-18 08:49:21');

-- ----------------------------
-- Table structure for contect
-- ----------------------------
DROP TABLE IF EXISTS `contect`;
CREATE TABLE `contect` (
  `id` int(5) NOT NULL auto_increment,
  `user_id` int(5) NOT NULL,
  `name` varchar(50) collate utf8_bin default NULL,
  `mobile` varchar(50) collate utf8_bin default NULL,
  `contact_flag` int(1) default NULL,
  `address` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of contect
-- ----------------------------
INSERT INTO `contect` VALUES ('1', '123456', '徐雨松', '13889122960', '1', '长江南街208号');
INSERT INTO `contect` VALUES ('2', '123456', '刘明仁', '13889127072', '0', '长江南街208号');
INSERT INTO `contect` VALUES ('32', '123486', '按时', '13244444444', '0', '阿斯顿发斯蒂芬撒洞庭湖');
INSERT INTO `contect` VALUES ('34', '123486', 'wqrq ', '13222222222', '0', 'asdf ');
INSERT INTO `contect` VALUES ('35', '123486', '1234', '13243545554', '1', 'dfsg ');
INSERT INTO `contect` VALUES ('36', '123486', '1243', '13444444444', '0', '1234');
INSERT INTO `contect` VALUES ('42', '123519', '111', '15254161612', '1', '111');
INSERT INTO `contect` VALUES ('43', '123519', 'ss', '15254161612', null, '12134');
INSERT INTO `contect` VALUES ('46', '123519', '1', '15254161612', null, '15254161612');
INSERT INTO `contect` VALUES ('47', '123519', '2', '15254161612', null, '15254161612');
INSERT INTO `contect` VALUES ('48', '123519', '3', '15254161612', null, '15254161612');
INSERT INTO `contect` VALUES ('54', '123468', '徐雨松', '13889122960', '1', '长江南街208号');
INSERT INTO `contect` VALUES ('62', '123522', 'tom', '13300001111', '0', 'china ......');
INSERT INTO `contect` VALUES ('63', '123522', 'tom', '13300002222', '0', 'china ......');
INSERT INTO `contect` VALUES ('64', '123527', 'liuzhang', '15973124132', '1', 'asasasasas');
INSERT INTO `contect` VALUES ('65', '123527', 'sdsdsd', '15973124132', null, 'sdsdsd');
INSERT INTO `contect` VALUES ('76', '123528', 'da', '18569468385', '1', '北京 密云县 dasdsa');

-- ----------------------------
-- Table structure for demo_product
-- ----------------------------
DROP TABLE IF EXISTS `demo_product`;
CREATE TABLE `demo_product` (
  `id` int(11) NOT NULL auto_increment,
  `price` int(11) default NULL,
  `name` varchar(255) default NULL,
  `info` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demo_product
-- ----------------------------
INSERT INTO `demo_product` VALUES ('1', '20', '电话卡', '20元充值卡');
INSERT INTO `demo_product` VALUES ('2', '30', '电话卡', '20元充值卡');
INSERT INTO `demo_product` VALUES ('3', '40', '电话卡', '20元充值卡');
INSERT INTO `demo_product` VALUES ('4', '50', '电话卡', '20元充值卡');
INSERT INTO `demo_product` VALUES ('5', '200', '乌龙茶(500g)', '产地：台湾梨山......');
INSERT INTO `demo_product` VALUES ('6', '20', '电话卡', '20元充值卡');

-- ----------------------------
-- Table structure for ewallet
-- ----------------------------
DROP TABLE IF EXISTS `ewallet`;
CREATE TABLE `ewallet` (
  `id` int(11) NOT NULL auto_increment,
  `amount` int(11) NOT NULL default '0' COMMENT '注册用户电子钱包默认金额',
  `updtime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ewallet
-- ----------------------------
INSERT INTO `ewallet` VALUES ('1', '1000', '2017-12-15 09:12:48');
INSERT INTO `ewallet` VALUES ('2', '500', '2017-12-18 08:12:25');
INSERT INTO `ewallet` VALUES ('3', '200', '2017-12-19 01:12:54');
INSERT INTO `ewallet` VALUES ('4', '200', '2017-12-19 02:12:27');
INSERT INTO `ewallet` VALUES ('5', '300', '2017-12-30 07:12:03');

-- ----------------------------
-- Table structure for foot
-- ----------------------------
DROP TABLE IF EXISTS `foot`;
CREATE TABLE `foot` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foot
-- ----------------------------
INSERT INTO `foot` VALUES ('7', '935', '123528', '2018-12-24 17:21:32');
INSERT INTO `foot` VALUES ('8', '934', '123528', '2018-12-25 08:58:00');

-- ----------------------------
-- Table structure for logistics
-- ----------------------------
DROP TABLE IF EXISTS `logistics`;
CREATE TABLE `logistics` (
  `id` int(5) NOT NULL auto_increment,
  `company_name` varchar(64) collate utf8_bin default NULL,
  `logistics_num` varchar(32) collate utf8_bin NOT NULL,
  `order_num` varchar(20) collate utf8_bin NOT NULL,
  `state` int(5) NOT NULL,
  `contact_name` varchar(50) collate utf8_bin default NULL,
  `contact_mobile` varchar(20) collate utf8_bin default NULL,
  `contact_address` varchar(300) collate utf8_bin default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of logistics
-- ----------------------------
INSERT INTO `logistics` VALUES ('70', '顺丰', '90232716cdad4470a7b52bc6edea69da', 'O2016110800005', '3', 'wqrq ', '13222222222', 'asdf ', '2016-11-08 11:44:19');
INSERT INTO `logistics` VALUES ('71', '顺丰', 'e3b47c2724a34c7bbef0345b64f0e0c6', 'O2016110800006', '3', '暗室逢灯', '13599999999', '分割', '2016-11-08 17:14:45');
INSERT INTO `logistics` VALUES ('72', '顺丰物流', '195b279249ed4bbe877e8be881bedeab', 'O2016110800047', '3', '耿俐', '13889127072', '锦水北街4号', '2016-11-08 20:28:27');
INSERT INTO `logistics` VALUES ('73', '顺丰物流', 'd867a31d560a4a219baf0335ac261864', 'O2016110800047', '2', '耿俐', '13889127072', '锦水北街4号', '2016-11-08 20:29:14');
INSERT INTO `logistics` VALUES ('74', '运达快递', '3620c9e59f534b28a348edf03b6e8899', 'O2016110800044', '2', '徐雨松', '13889122960', '长江街208号', '2016-11-08 20:30:16');
INSERT INTO `logistics` VALUES ('75', '中通快递', '827052c263e442d7ba11be202853b5d3', 'O2016110800054', '3', '徐雨松', '13889122960', '长江街208号', '2016-11-08 21:17:43');
INSERT INTO `logistics` VALUES ('76', '申通快递', '87d04d713c3c43eeb2fae8acae075fa6', 'O2016110800053', '3', '徐雨松', '13889122960', '长江街208号', '2016-11-08 20:36:42');
INSERT INTO `logistics` VALUES ('77', '顺丰', 'fa0b96aa136445b5b9daaca3ad2132c5', 'O2016110800054', '3', '徐雨松', '13889122960', '长江街208号', '2016-11-08 21:17:43');
INSERT INTO `logistics` VALUES ('78', '顺丰', 'c19b495c94224b8c8a78dc4ce87c0ba9', 'O2016110800054', '3', '徐雨松', '13889122960', '长江街208号', '2016-11-08 21:17:43');
INSERT INTO `logistics` VALUES ('79', '顺丰', '6960bb76418d4b528c54c6be7be3ab29', 'O2016110800054', '3', '徐雨松', '13889122960', '长江街208号', '2016-11-08 21:17:43');
INSERT INTO `logistics` VALUES ('80', '顺丰', '29ba9ee57c784468b65bf31eee58cbe8', 'O2016110800054', '3', '徐雨松', '13889122960', '长江街208号', '2016-11-08 21:17:43');
INSERT INTO `logistics` VALUES ('81', '顺丰', '7a9d7e95be7b4589b14784746b351296', 'O2016110800052', '3', null, null, null, '2016-11-08 21:34:19');
INSERT INTO `logistics` VALUES ('82', '陪你睡', 'f840cadfa9654112ac5e8b32818e35b2', 'O2016110800050', '3', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', '2016-11-08 21:37:54');
INSERT INTO `logistics` VALUES ('83', '顺丰快递', 'd8c3dde01c234feb9f80883cc5e99c56', 'O2016110800055', '3', '徐雨松', '13889122960', '长江南街208号', '2016-11-08 21:41:51');
INSERT INTO `logistics` VALUES ('84', '中通快递', '09bfdb22d890461fba1083c3898cc19c', 'O2016110800058', '2', '徐雨松', '13889122960', '长江南街208号', '2016-11-08 21:46:17');

-- ----------------------------
-- Table structure for option_info
-- ----------------------------
DROP TABLE IF EXISTS `option_info`;
CREATE TABLE `option_info` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin NOT NULL,
  `type` int(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of option_info
-- ----------------------------
INSERT INTO `option_info` VALUES ('2', '包装', '0');
INSERT INTO `option_info` VALUES ('3', '颜色', '1');
INSERT INTO `option_info` VALUES ('4', '材料', '1');
INSERT INTO `option_info` VALUES ('5', '产地', '0');
INSERT INTO `option_info` VALUES ('50', '尺码', '0');

-- ----------------------------
-- Table structure for option_value
-- ----------------------------
DROP TABLE IF EXISTS `option_value`;
CREATE TABLE `option_value` (
  `id` int(5) NOT NULL auto_increment,
  `option_id` int(5) NOT NULL,
  `name` varchar(50) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of option_value
-- ----------------------------
INSERT INTO `option_value` VALUES ('4', '2', '平装');
INSERT INTO `option_value` VALUES ('5', '2', '精装');
INSERT INTO `option_value` VALUES ('6', '2', '软精装');
INSERT INTO `option_value` VALUES ('7', '3', '红');
INSERT INTO `option_value` VALUES ('8', '3', '黄');
INSERT INTO `option_value` VALUES ('9', '3', '蓝');
INSERT INTO `option_value` VALUES ('10', '3', '绿');
INSERT INTO `option_value` VALUES ('11', '4', '皮');
INSERT INTO `option_value` VALUES ('12', '4', '棉');
INSERT INTO `option_value` VALUES ('13', '4', '革');
INSERT INTO `option_value` VALUES ('14', '4', '布');

-- ----------------------------
-- Table structure for order_history
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history` (
  `id` int(5) NOT NULL auto_increment,
  `order_num` varchar(20) collate utf8_bin NOT NULL,
  `status` int(2) NOT NULL,
  `note` varchar(300) collate utf8_bin default NULL,
  `update_user_id` int(5) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_history
-- ----------------------------
INSERT INTO `order_history` VALUES ('146', 'O2016110800005', '1', '已下单', '123486', '2016-11-08 11:36:59');
INSERT INTO `order_history` VALUES ('147', 'O2016110800005', '2', '配送中', '123486', '2016-11-08 11:41:46');
INSERT INTO `order_history` VALUES ('148', 'O2016110800005', '3', '配送完成', '123486', '2016-11-08 11:44:21');
INSERT INTO `order_history` VALUES ('149', 'O2016110800006', '1', '已下单', '123486', '2016-11-08 11:46:16');
INSERT INTO `order_history` VALUES ('150', 'O2016110800006', '2', '配送中', '123486', '2016-11-08 11:46:42');
INSERT INTO `order_history` VALUES ('151', 'O2016110800006', '3', '配送完成', '123486', '2016-11-08 11:47:07');
INSERT INTO `order_history` VALUES ('152', 'O2016110800006', '3', '配送完成', '3', '2016-11-08 14:08:32');
INSERT INTO `order_history` VALUES ('153', 'O2016110800006', '3', '配送完成', '3', '2016-11-08 17:13:53');
INSERT INTO `order_history` VALUES ('154', 'O2016110800006', '3', '配送完成', '3', '2016-11-08 17:14:05');
INSERT INTO `order_history` VALUES ('155', 'O2016110800006', '3', '配送完成', '3', '2016-11-08 17:14:45');
INSERT INTO `order_history` VALUES ('156', 'O2016110800009', '1', '已下单', '123468', '2016-11-08 17:31:48');
INSERT INTO `order_history` VALUES ('157', 'O2016110800011', '1', '已下单', '123519', '2016-11-08 17:48:04');
INSERT INTO `order_history` VALUES ('158', 'O2016110800013', '1', '已下单', '123519', '2016-11-08 17:50:07');
INSERT INTO `order_history` VALUES ('159', 'O2016110800014', '1', '已下单', '123519', '2016-11-08 17:51:34');
INSERT INTO `order_history` VALUES ('160', 'O2016110800016', '1', '已下单', '123519', '2016-11-08 17:57:20');
INSERT INTO `order_history` VALUES ('161', 'O2016110800017', '1', '已下单', '123519', '2016-11-08 18:00:00');
INSERT INTO `order_history` VALUES ('162', 'O2016110800018', '1', '已下单', '123519', '2016-11-08 18:03:07');
INSERT INTO `order_history` VALUES ('163', 'O2016110800019', '1', '已下单', '123519', '2016-11-08 18:04:14');
INSERT INTO `order_history` VALUES ('164', 'O2016110800022', '1', '已下单', '123468', '2016-11-08 18:33:33');
INSERT INTO `order_history` VALUES ('165', 'O2016110800024', '1', '已下单', '123468', '2016-11-08 18:38:38');
INSERT INTO `order_history` VALUES ('166', 'O2016110800026', '1', '已下单', '123468', '2016-11-08 18:52:09');
INSERT INTO `order_history` VALUES ('167', 'O2016110800027', '1', '已下单', '123468', '2016-11-08 18:54:31');
INSERT INTO `order_history` VALUES ('168', 'O2016110800029', '1', '已下单', '123468', '2016-11-08 19:04:20');
INSERT INTO `order_history` VALUES ('169', 'O2016110800032', '1', '已下单', '123468', '2016-11-08 19:32:21');
INSERT INTO `order_history` VALUES ('170', 'O2016110800031', '1', '已下单', '123486', '2016-11-08 19:42:19');
INSERT INTO `order_history` VALUES ('171', 'O2016110800035', '1', '已下单', '123486', '2016-11-08 19:52:49');
INSERT INTO `order_history` VALUES ('172', 'O2016110800033', '1', '已下单', '123521', '2016-11-08 20:11:54');
INSERT INTO `order_history` VALUES ('173', 'O2016110800039', '1', '已下单', '123521', '2016-11-08 20:16:47');
INSERT INTO `order_history` VALUES ('174', 'O2016110800041', '1', '已下单', '123468', '2016-11-08 20:20:46');
INSERT INTO `order_history` VALUES ('175', 'O2016110800042', '1', '已下单', '123468', '2016-11-08 20:21:49');
INSERT INTO `order_history` VALUES ('176', 'O2016110800043', '1', '已下单', '123521', '2016-11-08 20:24:26');
INSERT INTO `order_history` VALUES ('177', 'O2016110800044', '1', '已下单', '123468', '2016-11-08 20:24:36');
INSERT INTO `order_history` VALUES ('178', 'O2016110800045', '1', '已下单', '123521', '2016-11-08 20:24:58');
INSERT INTO `order_history` VALUES ('179', 'O2016110800046', '1', '已下单', '123521', '2016-11-08 20:26:09');
INSERT INTO `order_history` VALUES ('180', 'O2016110800047', '1', '已下单', '123468', '2016-11-08 20:26:58');
INSERT INTO `order_history` VALUES ('181', 'O2016110800048', '1', '已下单', '123521', '2016-11-08 20:28:12');
INSERT INTO `order_history` VALUES ('182', 'O2016110800047', '2', '配送中', '3', '2016-11-08 20:28:18');
INSERT INTO `order_history` VALUES ('183', 'O2016110800047', '3', '配送完成', '3', '2016-11-08 20:28:27');
INSERT INTO `order_history` VALUES ('184', 'O2016110800049', '1', '已下单', '123521', '2016-11-08 20:28:51');
INSERT INTO `order_history` VALUES ('185', 'O2016110800047', '2', '配送中', '3', '2016-11-08 20:29:14');
INSERT INTO `order_history` VALUES ('186', 'O2016110800050', '1', '已下单', '123521', '2016-11-08 20:29:30');
INSERT INTO `order_history` VALUES ('187', 'O2016110800051', '1', '已下单', '123521', '2016-11-08 20:30:04');
INSERT INTO `order_history` VALUES ('188', 'O2016110800044', '2', '配送中', '3', '2016-11-08 20:30:16');
INSERT INTO `order_history` VALUES ('189', 'O2016110800052', '1', '已下单', '123521', '2016-11-08 20:31:29');
INSERT INTO `order_history` VALUES ('190', 'O2016110800053', '1', '已下单', '123468', '2016-11-08 20:33:06');
INSERT INTO `order_history` VALUES ('191', 'O2016110800054', '1', '已下单', '123468', '2016-11-08 20:34:03');
INSERT INTO `order_history` VALUES ('192', 'O2016110800054', '2', '配送中', '3', '2016-11-08 20:35:41');
INSERT INTO `order_history` VALUES ('193', 'O2016110800053', '2', '配送中', '3', '2016-11-08 20:36:27');
INSERT INTO `order_history` VALUES ('194', 'O2016110800053', '3', '配送完成', '3', '2016-11-08 20:36:42');
INSERT INTO `order_history` VALUES ('195', 'O2016110800054', '2', '配送中', '123486', '2016-11-08 21:01:06');
INSERT INTO `order_history` VALUES ('196', 'O2016110800054', '2', '配送中', '123486', '2016-11-08 21:15:35');
INSERT INTO `order_history` VALUES ('197', 'O2016110800054', '2', '配送中', '123486', '2016-11-08 21:16:23');
INSERT INTO `order_history` VALUES ('198', 'O2016110800054', '2', '配送中', '123486', '2016-11-08 21:17:17');
INSERT INTO `order_history` VALUES ('199', 'O2016110800054', '3', '配送完成', '123486', '2016-11-08 21:17:43');
INSERT INTO `order_history` VALUES ('200', 'O2016110800052', '2', '配送中', '123486', '2016-11-08 21:34:06');
INSERT INTO `order_history` VALUES ('201', 'O2016110800052', '3', '配送完成', '123486', '2016-11-08 21:34:19');
INSERT INTO `order_history` VALUES ('202', 'O2016110800050', '2', '配送中', '123486', '2016-11-08 21:37:41');
INSERT INTO `order_history` VALUES ('203', 'O2016110800050', '3', '配送完成', '123486', '2016-11-08 21:37:54');
INSERT INTO `order_history` VALUES ('204', 'O2016110800055', '1', '已下单', '123468', '2016-11-08 21:40:07');
INSERT INTO `order_history` VALUES ('205', 'O2016110800055', '2', '配送中', '3', '2016-11-08 21:41:14');
INSERT INTO `order_history` VALUES ('206', 'O2016110800055', '3', '配送完成', '3', '2016-11-08 21:41:51');
INSERT INTO `order_history` VALUES ('207', 'O2016110800058', '1', '已下单', '123468', '2016-11-08 21:45:22');
INSERT INTO `order_history` VALUES ('208', 'O2016110800058', '2', '配送中', '3', '2016-11-08 21:46:17');
INSERT INTO `order_history` VALUES ('209', 'O2016111700001', '1', '已下单', '123522', '2016-11-17 10:10:10');
INSERT INTO `order_history` VALUES ('210', 'O2016111900006', '1', '已下单', '123522', '2016-11-19 13:17:57');
INSERT INTO `order_history` VALUES ('211', 'O2016111900007', '1', '已下单', '123522', '2016-11-19 13:19:04');
INSERT INTO `order_history` VALUES ('212', 'O2016111900008', '1', '已下单', '123522', '2016-11-19 13:29:06');
INSERT INTO `order_history` VALUES ('213', 'O2016111900009', '1', '已下单', '123522', '2016-11-19 13:35:08');
INSERT INTO `order_history` VALUES ('214', 'O2016111900010', '1', '已下单', '123522', '2016-11-19 13:35:50');
INSERT INTO `order_history` VALUES ('215', 'O2016111900011', '1', '已下单', '123522', '2016-11-19 13:36:56');
INSERT INTO `order_history` VALUES ('216', 'O2016111900012', '1', '已下单', '123522', '2016-11-19 21:16:15');
INSERT INTO `order_history` VALUES ('217', 'O2016111900014', '1', '已下单', '123522', '2016-11-19 22:28:38');
INSERT INTO `order_history` VALUES ('218', 'O2016111900012', '3', '配送完成', '3', '2017-12-30 17:44:52');
INSERT INTO `order_history` VALUES ('219', 'O2017123000001', '1', '已下单', '123526', '2017-12-30 19:18:16');
INSERT INTO `order_history` VALUES ('220', 'O2018121700001', '1', '已下单', '123527', '2018-12-17 19:24:29');
INSERT INTO `order_history` VALUES ('221', 'O2018121800002', '1', '已下单', '123528', '2018-12-18 08:55:45');
INSERT INTO `order_history` VALUES ('222', 'O2018121900001', '1', '已下单', '123528', '2018-12-19 10:10:54');
INSERT INTO `order_history` VALUES ('223', 'O2018121900002', '1', '已下单', '123528', '2018-12-19 11:34:25');
INSERT INTO `order_history` VALUES ('224', 'O2018121900003', '1', '已下单', '123528', '2018-12-19 11:40:26');
INSERT INTO `order_history` VALUES ('225', 'O2018122400001', '1', '已下单', '123528', '2018-12-24 12:07:01');
INSERT INTO `order_history` VALUES ('226', 'O2018122400002', '1', '已下单', '123528', '2018-12-24 12:09:52');
INSERT INTO `order_history` VALUES ('227', 'O2018122400003', '1', '已下单', '123528', '2018-12-24 13:29:53');
INSERT INTO `order_history` VALUES ('228', 'O2018122400004', '1', '已下单', '123528', '2018-12-24 13:33:01');
INSERT INTO `order_history` VALUES ('229', 'O2018122400005', '1', '已下单', '123528', '2018-12-24 16:10:26');
INSERT INTO `order_history` VALUES ('230', 'O2018122500004', '1', '已下单', '123528', '2018-12-25 12:32:21');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_num` varchar(20) collate utf8_bin NOT NULL,
  `price` varchar(10) collate utf8_bin default '0',
  `payment_flag` int(1) NOT NULL default '0',
  `user_id` int(5) NOT NULL,
  `contact_name` varchar(50) collate utf8_bin default NULL,
  `contact_mobile` varchar(20) collate utf8_bin default NULL,
  `contact_address` varchar(300) collate utf8_bin default NULL,
  `message` varchar(300) collate utf8_bin default NULL,
  `status` int(2) default NULL,
  `type` int(2) NOT NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('O2016110800005', '32200', '1', '123486', 'wqrq ', '13222222222', 'asdf ', null, '3', '0', '2016-11-08 11:36:42');
INSERT INTO `order_info` VALUES ('O2016110800006', '7800', '1', '123486', '暗室逢灯', '13599999999', '分割', null, '3', '0', '2016-11-08 11:46:08');
INSERT INTO `order_info` VALUES ('O2016110800008', '19600', '0', '123518', null, null, null, null, null, '1', '2016-11-08 14:34:15');
INSERT INTO `order_info` VALUES ('O2016110800009', '1000000', '1', '123468', null, null, null, null, '1', '0', '2016-11-08 17:31:30');
INSERT INTO `order_info` VALUES ('O2016110800011', '1024600', '1', '123519', null, null, null, null, '1', '0', '2016-11-08 17:45:57');
INSERT INTO `order_info` VALUES ('O2016110800013', '19600', '1', '123519', null, null, null, null, '1', '0', '2016-11-08 17:49:57');
INSERT INTO `order_info` VALUES ('O2016110800014', '2800', '1', '123519', '111', '15254161612', '111', null, '1', '0', '2016-11-08 17:51:24');
INSERT INTO `order_info` VALUES ('O2016110800016', '26000', '1', '123519', '111', '15254161612', '111', null, '1', '0', '2016-11-08 17:57:15');
INSERT INTO `order_info` VALUES ('O2016110800017', '8400', '1', '123519', '111', '15254161612', '111', null, '1', '0', '2016-11-08 17:59:55');
INSERT INTO `order_info` VALUES ('O2016110800018', '19600', '1', '123519', '111', '15254161612', '111', null, '1', '0', '2016-11-08 18:02:58');
INSERT INTO `order_info` VALUES ('O2016110800019', '10000', '1', '123519', 'ss', '15254161612', '12134', null, '1', '0', '2016-11-08 18:04:08');
INSERT INTO `order_info` VALUES ('O2016110800022', '4007800', '1', '123468', null, null, null, null, '1', '0', '2016-11-08 18:30:47');
INSERT INTO `order_info` VALUES ('O2016110800024', '100', '1', '123468', null, null, null, null, '1', '0', '2016-11-08 18:38:20');
INSERT INTO `order_info` VALUES ('O2016110800025', '15600', '0', '123484', null, null, null, null, null, '1', '2016-11-08 18:38:28');
INSERT INTO `order_info` VALUES ('O2016110800026', '204000', '1', '123468', null, null, null, null, '1', '0', '2016-11-08 18:50:58');
INSERT INTO `order_info` VALUES ('O2016110800027', '240000', '1', '123468', null, null, null, null, '1', '0', '2016-11-08 18:54:23');
INSERT INTO `order_info` VALUES ('O2016110800029', '91000', '1', '123468', null, null, null, null, '1', '0', '2016-11-08 19:04:00');
INSERT INTO `order_info` VALUES ('O2016110800031', '52600', '1', '123486', 'wqrq ', '13222222222', 'asdf ', null, '1', '0', '2016-11-08 19:16:54');
INSERT INTO `order_info` VALUES ('O2016110800032', '208000', '1', '123468', '耿俐', '13889127072', '锦水北街4号', null, '1', '0', '2016-11-08 19:28:32');
INSERT INTO `order_info` VALUES ('O2016110800033', '63200', '1', '123521', null, null, null, null, '1', '0', '2016-11-08 19:42:41');
INSERT INTO `order_info` VALUES ('O2016110800035', '939600', '1', '123486', '暗室逢灯', '13599999999', '分割', null, '1', '0', '2016-11-08 19:48:44');
INSERT INTO `order_info` VALUES ('O2016110800037', '42800', '0', '123486', null, null, null, null, null, '1', '2016-11-08 20:05:20');
INSERT INTO `order_info` VALUES ('O2016110800039', '27600', '1', '123521', null, null, null, null, '1', '0', '2016-11-08 20:16:35');
INSERT INTO `order_info` VALUES ('O2016110800041', '600000', '1', '123468', '徐雨松', '13889122960', '长江街208号', null, '1', '0', '2016-11-08 20:20:23');
INSERT INTO `order_info` VALUES ('O2016110800042', '600000', '1', '123468', '徐雨松', '13889122960', '长江街208号', null, '1', '0', '2016-11-08 20:21:42');
INSERT INTO `order_info` VALUES ('O2016110800043', '4020000', '1', '123521', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', null, '1', '0', '2016-11-08 20:24:19');
INSERT INTO `order_info` VALUES ('O2016110800044', '570000', '1', '123468', '徐雨松', '13889122960', '长江街208号', null, '2', '0', '2016-11-08 20:24:23');
INSERT INTO `order_info` VALUES ('O2016110800045', '3376800', '1', '123521', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', null, '1', '0', '2016-11-08 20:24:52');
INSERT INTO `order_info` VALUES ('O2016110800046', '999000', '1', '123521', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', null, '1', '0', '2016-11-08 20:26:05');
INSERT INTO `order_info` VALUES ('O2016110800047', '28800000', '1', '123468', '耿俐', '13889127072', '锦水北街4号', null, '2', '0', '2016-11-08 20:26:30');
INSERT INTO `order_info` VALUES ('O2016110800048', '201000', '1', '123521', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', null, '1', '0', '2016-11-08 20:26:51');
INSERT INTO `order_info` VALUES ('O2016110800049', '72600', '1', '123521', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', null, '1', '0', '2016-11-08 20:28:37');
INSERT INTO `order_info` VALUES ('O2016110800050', '205000', '1', '123521', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', null, '3', '0', '2016-11-08 20:29:15');
INSERT INTO `order_info` VALUES ('O2016110800051', '135000', '1', '123521', '11111111111111111111111111111111111111111111111', '18712344567', 'asdsad', null, '1', '0', '2016-11-08 20:29:55');
INSERT INTO `order_info` VALUES ('O2016110800052', '210000', '1', '123521', null, null, null, null, '3', '0', '2016-11-08 20:31:18');
INSERT INTO `order_info` VALUES ('O2016110800053', '147200', '1', '123468', '徐雨松', '13889122960', '长江街208号', null, '3', '0', '2016-11-08 20:31:37');
INSERT INTO `order_info` VALUES ('O2016110800054', '200000', '1', '123468', '徐雨松', '13889122960', '长江街208号', null, '3', '0', '2016-11-08 20:33:54');
INSERT INTO `order_info` VALUES ('O2016110800055', '13000', '1', '123468', '徐雨松', '13889122960', '长江南街208号', null, '3', '0', '2016-11-08 20:40:28');
INSERT INTO `order_info` VALUES ('O2016110800057', '171600', '0', '123521', null, null, null, null, null, '1', '2016-11-08 21:08:21');
INSERT INTO `order_info` VALUES ('O2016110800058', '7800', '1', '123468', '徐雨松', '13889122960', '长江南街208号', null, '2', '0', '2016-11-08 21:45:18');
INSERT INTO `order_info` VALUES ('O2016111700001', '3600', '1', '123522', null, null, null, null, '1', '0', '2016-11-17 10:00:26');
INSERT INTO `order_info` VALUES ('O2016111900006', '17100', '1', '123522', null, null, null, null, '1', '0', '2016-11-19 12:00:11');
INSERT INTO `order_info` VALUES ('O2016111900007', '11250', '1', '123522', null, null, null, null, '1', '0', '2016-11-19 13:18:55');
INSERT INTO `order_info` VALUES ('O2016111900008', '14700', '1', '123522', null, null, null, null, '1', '0', '2016-11-19 13:21:51');
INSERT INTO `order_info` VALUES ('O2016111900009', '5850', '1', '123522', null, null, null, null, '1', '0', '2016-11-19 13:35:04');
INSERT INTO `order_info` VALUES ('O2016111900010', '5850', '1', '123522', null, null, null, null, '1', '0', '2016-11-19 13:35:34');
INSERT INTO `order_info` VALUES ('O2016111900011', '5850', '1', '123522', null, null, null, null, '1', '0', '2016-11-19 13:36:48');
INSERT INTO `order_info` VALUES ('O2016111900012', '3600', '1', '123522', 'ning yang3', '13304012611', '2stree100-1', null, '3', '0', '2016-11-19 21:16:04');
INSERT INTO `order_info` VALUES ('O2016111900014', '67500', '1', '123522', 'tom', '13300001111', 'china ......', null, '1', '0', '2016-11-19 22:21:17');
INSERT INTO `order_info` VALUES ('O2016111900015', '3600', '0', '123522', null, null, null, null, null, '1', '2016-11-19 22:41:25');
INSERT INTO `order_info` VALUES ('O2017123000001', '13000', '1', '123526', null, null, null, null, '1', '0', '2017-12-30 19:18:09');
INSERT INTO `order_info` VALUES ('O2018121700001', '36750', '1', '123527', 'liuzhang', '15973124132', 'asasasasas', null, '1', '0', '2018-12-17 19:22:46');
INSERT INTO `order_info` VALUES ('O2018121800002', '41100', '1', '123528', 'dadd', '18569468385', 'dawf', null, '1', '0', '2018-12-18 08:54:45');
INSERT INTO `order_info` VALUES ('O2018121900001', '17100', '1', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-19 10:10:22');
INSERT INTO `order_info` VALUES ('O2018121900002', '9750', '1', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-19 11:34:18');
INSERT INTO `order_info` VALUES ('O2018121900003', '31800', '1', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-19 11:40:15');
INSERT INTO `order_info` VALUES ('O2018122400001', '9750', '1', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-24 10:15:49');
INSERT INTO `order_info` VALUES ('O2018122400002', '195000', '1', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-24 12:09:27');
INSERT INTO `order_info` VALUES ('O2018122400003', '13350', '2', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-24 12:12:19');
INSERT INTO `order_info` VALUES ('O2018122400004', '9750', '2', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-24 13:32:39');
INSERT INTO `order_info` VALUES ('O2018122400005', '9750', '2', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '0', '2018-12-24 16:07:42');
INSERT INTO `order_info` VALUES ('O2018122500004', '39000', '1', '123528', 'da', '18569468385', '北京 密云县 dasdsa', null, '1', '2', '2018-12-25 11:59:14');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` varchar(36) collate utf8_bin NOT NULL,
  `order_num` varchar(20) collate utf8_bin NOT NULL,
  `product_id` int(5) NOT NULL,
  `price` int(8) NOT NULL,
  `quantity` int(4) default NULL,
  `user_id` int(5) NOT NULL,
  `json_data` text collate utf8_bin,
  `sku_id` int(11) default NULL,
  `option_value_key_group` varchar(80) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('I2016110800014', 'O2016110800005', '940', '7800', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800015', 'O2016110800005', '938', '4800', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800016', 'O2016110800005', '933', '19600', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800017', 'O2016110800006', '940', '7800', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800019', 'O2016110800008', '933', '19600', '1', '123518', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800022', 'O2016110800009', '998', '20000', '50', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800026', 'O2016110800011', '935', '13000', '31', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800027', 'O2016110800011', '944', '2800', '222', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800029', 'O2016110800013', '934', '9800', '2', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800032', 'O2016110800014', '944', '2800', '1', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800034', 'O2016110800016', '935', '13000', '2', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800035', 'O2016110800017', '944', '2800', '3', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800036', 'O2016110800018', '934', '9800', '2', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800037', 'O2016110800019', '991', '5000', '2', '123519', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800040', 'O2016110800022', '940', '7800', '1', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800041', 'O2016110800022', '998', '20000', '200', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800043', 'O2016110800024', '998', '1', '100', '123468', null, '305', '7_11');
INSERT INTO `order_item` VALUES ('I2016110800044', 'O2016110800025', '940', '7800', '2', '123484', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800045', 'O2016110800026', '936', '6800', '30', '123468', null, '309', '5');
INSERT INTO `order_item` VALUES ('I2016110800046', 'O2016110800027', '938', '4800', '50', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800049', 'O2016110800029', '935', '13000', '7', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800051', 'O2016110800031', '998', '30000', '1', '123486', 0xE9A29CE889B23AE7BAA220E69D90E696993AE79AAE, '305', '7_11');
INSERT INTO `order_item` VALUES ('I2016110800052', 'O2016110800031', '938', '4800', '2', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800053', 'O2016110800031', '935', '13000', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800054', 'O2016110800032', '935', '13000', '16', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800055', 'O2016110800033', '935', '13000', '4', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800056', 'O2016110800033', '944', '2800', '4', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800058', 'O2016110800035', '997', '31600', '17', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800059', 'O2016110800035', '933', '19600', '11', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800060', 'O2016110800035', '942', '9000', '12', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800061', 'O2016110800035', '943', '3600', '15', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800063', 'O2016110800035', '934', '9800', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800064', 'O2016110800035', '939', '15000', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800065', 'O2016110800037', '935', '13000', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800067', 'O2016110800039', '994', '9200', '3', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800068', 'O2016110800037', '998', '20000', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800070', 'O2016110800041', '998', '30000', '20', '123468', 0xE9A29CE889B23AE7BAA220E69D90E696993AE79AAE, '305', '7_11');
INSERT INTO `order_item` VALUES ('I2016110800072', 'O2016110800042', '998', '20000', '30', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800074', 'O2016110800043', '998', '20000', '201', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800075', 'O2016110800044', '998', '19000', '30', '123468', 0xE9A29CE889B23AE7BBBF20E69D90E696993AE5B883, '307', '10_14');
INSERT INTO `order_item` VALUES ('I2016110800076', 'O2016110800045', '944', '2800', '1206', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800077', 'O2016110800046', '942', '9000', '111', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800078', 'O2016110800047', '937', '32000', '900', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800080', 'O2016110800048', '940', '7800', '5', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800081', 'O2016110800048', '935', '13000', '9', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800082', 'O2016110800048', '947', '5000', '9', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800083', 'O2016110800049', '940', '7800', '5', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800084', 'O2016110800049', '938', '4800', '7', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800085', 'O2016110800050', '939', '15000', '3', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800086', 'O2016110800050', '937', '32000', '5', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800087', 'O2016110800051', '939', '15000', '9', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800088', 'O2016110800052', '939', '15000', '14', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800089', 'O2016110800053', '940', '7800', '2', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800090', 'O2016110800053', '939', '15000', '3', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800091', 'O2016110800053', '938', '4800', '1', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800092', 'O2016110800053', '937', '32000', '1', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800093', 'O2016110800053', '941', '11600', '3', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800094', 'O2016110800053', '999', '1000', '3', '123468', 0xE58C85E8A3853AE5B9B3E8A385, '311', '4');
INSERT INTO `order_item` VALUES ('I2016110800095', 'O2016110800053', '999', '6000', '2', '123468', 0xE58C85E8A3853AE8BDAFE7B2BEE8A385, '313', '6');
INSERT INTO `order_item` VALUES ('I2016110800096', 'O2016110800054', '998', '20000', '10', '123468', 0xE9A29CE889B23AE7BAA220E69D90E696993AE6A389, '306', '7_12');
INSERT INTO `order_item` VALUES ('I2016110800098', 'O2016110800055', '935', '13000', '1', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800099', 'O2016110800037', '934', '9800', '1', '123486', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800101', 'O2016110800057', '940', '7800', '22', '123521', null, null, '');
INSERT INTO `order_item` VALUES ('I2016110800102', 'O2016110800058', '940', '7800', '1', '123468', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111700001', 'O2016111700001', '938', '3600', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900014', 'O2016111900006', '939', '11250', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900015', 'O2016111900006', '940', '5850', '1', '123522', null, null, null);
INSERT INTO `order_item` VALUES ('I2016111900016', 'O2016111900007', '939', '11250', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900017', 'O2016111900008', '933', '14700', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900018', 'O2016111900009', '940', '5850', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900019', 'O2016111900010', '940', '5850', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900020', 'O2016111900011', '940', '5850', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900021', 'O2016111900012', '938', '3600', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900023', 'O2016111900014', '939', '11250', '6', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2016111900024', 'O2016111900015', '938', '3600', '1', '123522', null, null, '');
INSERT INTO `order_item` VALUES ('I2017123000001', 'O2017123000001', '935', '13000', '1', '123526', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121700001', 'O2018121700001', '934', '7350', '5', '123527', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121800004', 'O2018121800002', '940', '5850', '2', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121800005', 'O2018121800002', '933', '14700', '2', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121900001', 'O2018121900001', '935', '9750', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121900002', 'O2018121900001', '934', '7350', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121900003', 'O2018121900002', '935', '9750', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121900004', 'O2018121900003', '935', '9750', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121900005', 'O2018121900003', '934', '7350', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018121900006', 'O2018121900003', '933', '14700', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018122400001', 'O2018122400001', '935', '9750', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018122400002', 'O2018122400002', '935', '9750', '20', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018122400003', 'O2018122400003', '938', '3600', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018122400004', 'O2018122400003', '935', '9750', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018122400005', 'O2018122400004', '935', '9750', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018122400006', 'O2018122400005', '935', '9750', '1', '123528', null, null, '');
INSERT INTO `order_item` VALUES ('I2018122500004', 'O2018122500004', '935', '9750', '4', '123528', null, null, '');

-- ----------------------------
-- Table structure for order_option
-- ----------------------------
DROP TABLE IF EXISTS `order_option`;
CREATE TABLE `order_option` (
  `id` int(5) NOT NULL auto_increment,
  `order_Item_Id` varchar(36) collate utf8_bin NOT NULL,
  `option_id` int(5) NOT NULL,
  `option_value_id` int(5) NOT NULL,
  `option_value_name` varchar(50) collate utf8_bin NOT NULL,
  `option_name` varchar(50) collate utf8_bin default NULL,
  `option_value_key` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_option
-- ----------------------------

-- ----------------------------
-- Table structure for payment_history
-- ----------------------------
DROP TABLE IF EXISTS `payment_history`;
CREATE TABLE `payment_history` (
  `id` int(5) NOT NULL auto_increment,
  `order_num` varchar(20) collate utf8_bin NOT NULL,
  `product_price` int(10) NOT NULL,
  `payment_type` int(2) NOT NULL,
  `user_id` int(5) NOT NULL,
  `payment_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of payment_history
-- ----------------------------
INSERT INTO `payment_history` VALUES ('66', 'O2016110800005', '32200', '0', '123486', '2016-11-08 11:36:59');
INSERT INTO `payment_history` VALUES ('67', 'O2016110800006', '7800', '1', '123486', '2016-11-08 11:46:16');
INSERT INTO `payment_history` VALUES ('68', 'O2016110800009', '1000000', '1', '123468', '2016-11-08 17:31:48');
INSERT INTO `payment_history` VALUES ('69', 'O2016110800011', '1024600', '1', '123519', '2016-11-08 17:48:04');
INSERT INTO `payment_history` VALUES ('70', 'O2016110800013', '19600', '1', '123519', '2016-11-08 17:50:07');
INSERT INTO `payment_history` VALUES ('71', 'O2016110800014', '2800', '0', '123519', '2016-11-08 17:51:34');
INSERT INTO `payment_history` VALUES ('72', 'O2016110800016', '26000', '1', '123519', '2016-11-08 17:57:20');
INSERT INTO `payment_history` VALUES ('73', 'O2016110800017', '8400', '1', '123519', '2016-11-08 18:00:00');
INSERT INTO `payment_history` VALUES ('74', 'O2016110800018', '19600', '1', '123519', '2016-11-08 18:03:07');
INSERT INTO `payment_history` VALUES ('75', 'O2016110800019', '10000', '1', '123519', '2016-11-08 18:04:14');
INSERT INTO `payment_history` VALUES ('76', 'O2016110800022', '4007800', '1', '123468', '2016-11-08 18:33:33');
INSERT INTO `payment_history` VALUES ('77', 'O2016110800024', '100', '1', '123468', '2016-11-08 18:38:38');
INSERT INTO `payment_history` VALUES ('78', 'O2016110800026', '204000', '1', '123468', '2016-11-08 18:52:09');
INSERT INTO `payment_history` VALUES ('79', 'O2016110800027', '240000', '0', '123468', '2016-11-08 18:54:31');
INSERT INTO `payment_history` VALUES ('80', 'O2016110800029', '91000', '1', '123468', '2016-11-08 19:04:20');
INSERT INTO `payment_history` VALUES ('81', 'O2016110800032', '208000', '0', '123468', '2016-11-08 19:32:21');
INSERT INTO `payment_history` VALUES ('82', 'O2016110800031', '52600', '0', '123486', '2016-11-08 19:42:19');
INSERT INTO `payment_history` VALUES ('83', 'O2016110800035', '939600', '0', '123486', '2016-11-08 19:52:49');
INSERT INTO `payment_history` VALUES ('84', 'O2016110800033', '63200', '0', '123521', '2016-11-08 20:11:54');
INSERT INTO `payment_history` VALUES ('85', 'O2016110800039', '27600', '1', '123521', '2016-11-08 20:16:47');
INSERT INTO `payment_history` VALUES ('86', 'O2016110800041', '600000', '1', '123468', '2016-11-08 20:20:46');
INSERT INTO `payment_history` VALUES ('87', 'O2016110800042', '600000', '1', '123468', '2016-11-08 20:21:49');
INSERT INTO `payment_history` VALUES ('88', 'O2016110800043', '4020000', '1', '123521', '2016-11-08 20:24:26');
INSERT INTO `payment_history` VALUES ('89', 'O2016110800044', '570000', '0', '123468', '2016-11-08 20:24:36');
INSERT INTO `payment_history` VALUES ('90', 'O2016110800045', '3376800', '1', '123521', '2016-11-08 20:24:58');
INSERT INTO `payment_history` VALUES ('91', 'O2016110800046', '999000', '1', '123521', '2016-11-08 20:26:09');
INSERT INTO `payment_history` VALUES ('92', 'O2016110800047', '28800000', '0', '123468', '2016-11-08 20:26:58');
INSERT INTO `payment_history` VALUES ('93', 'O2016110800048', '201000', '0', '123521', '2016-11-08 20:28:12');
INSERT INTO `payment_history` VALUES ('94', 'O2016110800049', '72600', '0', '123521', '2016-11-08 20:28:51');
INSERT INTO `payment_history` VALUES ('95', 'O2016110800050', '205000', '0', '123521', '2016-11-08 20:29:30');
INSERT INTO `payment_history` VALUES ('96', 'O2016110800051', '135000', '0', '123521', '2016-11-08 20:30:04');
INSERT INTO `payment_history` VALUES ('97', 'O2016110800052', '210000', '0', '123521', '2016-11-08 20:31:29');
INSERT INTO `payment_history` VALUES ('98', 'O2016110800053', '147200', '1', '123468', '2016-11-08 20:33:06');
INSERT INTO `payment_history` VALUES ('99', 'O2016110800054', '200000', '1', '123468', '2016-11-08 20:34:03');
INSERT INTO `payment_history` VALUES ('100', 'O2016110800055', '13000', '1', '123468', '2016-11-08 21:40:07');
INSERT INTO `payment_history` VALUES ('101', 'O2016110800058', '7800', '1', '123468', '2016-11-08 21:45:22');
INSERT INTO `payment_history` VALUES ('102', 'O2016111700001', '3600', '1', '123522', '2016-11-17 10:10:10');
INSERT INTO `payment_history` VALUES ('103', 'O2016111900006', '17100', '1', '123522', '2016-11-19 13:17:57');
INSERT INTO `payment_history` VALUES ('104', 'O2016111900007', '11250', '1', '123522', '2016-11-19 13:19:04');
INSERT INTO `payment_history` VALUES ('105', 'O2016111900008', '14700', '1', '123522', '2016-11-19 13:29:06');
INSERT INTO `payment_history` VALUES ('106', 'O2016111900009', '5850', '0', '123522', '2016-11-19 13:35:08');
INSERT INTO `payment_history` VALUES ('107', 'O2016111900010', '5850', '0', '123522', '2016-11-19 13:35:50');
INSERT INTO `payment_history` VALUES ('108', 'O2016111900011', '5850', '1', '123522', '2016-11-19 13:36:56');
INSERT INTO `payment_history` VALUES ('109', 'O2016111900012', '3600', '0', '123522', '2016-11-19 21:16:15');
INSERT INTO `payment_history` VALUES ('110', 'O2016111900014', '67500', '0', '123522', '2016-11-19 22:28:38');
INSERT INTO `payment_history` VALUES ('111', 'O2017123000001', '13000', '0', '123526', '2017-12-30 19:18:16');
INSERT INTO `payment_history` VALUES ('112', 'O2018121700001', '36750', '0', '123527', '2018-12-17 19:24:29');
INSERT INTO `payment_history` VALUES ('113', 'O2018121800002', '41100', '0', '123528', '2018-12-18 08:55:45');
INSERT INTO `payment_history` VALUES ('114', 'O2018121900001', '17100', '0', '123528', '2018-12-19 10:10:54');
INSERT INTO `payment_history` VALUES ('115', 'O2018121900002', '9750', '1', '123528', '2018-12-19 11:34:25');
INSERT INTO `payment_history` VALUES ('116', 'O2018121900003', '31800', '1', '123528', '2018-12-19 11:40:26');
INSERT INTO `payment_history` VALUES ('117', 'O2018122400001', '9750', '2', '123528', '2018-12-24 12:07:01');
INSERT INTO `payment_history` VALUES ('118', 'O2018122400002', '195000', '2', '123528', '2018-12-24 12:09:52');
INSERT INTO `payment_history` VALUES ('119', 'O2018122400003', '13350', '2', '123528', '2018-12-24 13:29:53');
INSERT INTO `payment_history` VALUES ('120', 'O2018122400004', '9750', '2', '123528', '2018-12-24 13:33:01');
INSERT INTO `payment_history` VALUES ('121', 'O2018122400005', '9750', '2', '123528', '2018-12-24 16:10:26');
INSERT INTO `payment_history` VALUES ('122', 'O2018122500004', '39000', '2', '123528', '2018-12-25 12:32:21');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(100) collate utf8_bin default NULL,
  `category_id` int(4) default NULL,
  `explain` text collate utf8_bin,
  `general_explain` varchar(255) collate utf8_bin default NULL,
  `discount` int(4) default NULL,
  `shop_price` int(8) default NULL,
  `price` int(8) default NULL,
  `external_id` varchar(100) collate utf8_bin default NULL,
  `quantity` int(8) default '0',
  `hot` int(1) default NULL,
  `product_status` int(1) NOT NULL default '0',
  `inventory_flag` int(1) NOT NULL default '0',
  `default_img` varchar(255) collate utf8_bin default NULL,
  `update_time` datetime default NULL,
  `update_user_id` int(5) default NULL,
  `create_time` datetime default NULL,
  `create_user_id` int(5) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('933', '新鲜冬枣 1500g 礼盒装 大荔冬枣 水果礼盒    新鲜水果 冬枣 顺丰快递发货 3斤礼盒装', '1', 0xE696B0E9B29CE586ACE69EA320313530306720E7A4BCE79B92E8A38520E5A4A7E88D94E586ACE69EA320E6B0B4E69E9CE7A4BCE79B9220202020E696B0E9B29CE6B0B4E69E9C20E586ACE69EA320E9A1BAE4B8B0E5BFABE98092E58F91E8B4A72033E696A4E7A4BCE79B92E8A385, null, '2000', '14700', '19600', null, '1974', '1', '0', '0', '/resources/upload/c05f7df2362d49399d78262637f03eb9.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('934', '寻真水果 山东烟台栖霞红富士苹果16-24个 5kg 新鲜水果', '1', 0xE5AFBBE79C9FE6B0B4E69E9C20E5B1B1E4B89CE7839FE58FB0E6A096E99C9EE7BAA2E5AF8CE5A3ABE88BB9E69E9C31362D3234E4B8AA20356B6720E696B0E9B29CE6B0B4E69E9C, null, '2000', '7350', '9800', null, '1977', '1', '0', '0', '/resources/upload/2ad834a8448d4d839d9f1f64b6ee8fea.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('935', '缤咕果园 海南红心火龙果6斤装约7个大果 红肉吉祥果新鲜水果', '1', 0xE7BCA4E59295E69E9CE59BAD20E6B5B7E58D97E7BAA2E5BF83E781ABE9BE99E69E9C36E696A4E8A385E7BAA637E4B8AAE5A4A7E69E9C20E7BAA2E88289E59089E7A5A5E69E9CE696B0E9B29CE6B0B4E69E9C, null, '2000', '9750', '13000', null, '1889', '1', '0', '0', '/resources/upload/b1600afee99a43cd83539acf67c65212.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('936', '鲜游记 琯溪蜜白肉蜜柚 2个装 约2.5kg 福建平和新鲜柚子', '1', 0xE9B29CE6B8B8E8AEB020E790AFE6BAAAE89C9CE799BDE88289E89C9CE69F9A2032E4B8AAE8A38520E7BAA6322E356B6720E7A68FE5BBBAE5B9B3E5928CE696B0E9B29CE69F9AE5AD90, null, '2000', '3600', '4800', null, '140', '0', '0', '0', '/resources/upload/64ccd6b3061c4025bc26860171614e78.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('937', '新鲜冬枣 1500g 礼盒装 大荔冬枣 水果礼盒    新鲜水果 冬枣 顺丰快递发货 5斤礼盒装', '1', 0xE696B0E9B29CE586ACE69EA320313530306720E7A4BCE79B92E8A38520E5A4A7E88D94E586ACE69EA320E6B0B4E69E9CE7A4BCE79B9220202020E696B0E9B29CE6B0B4E69E9C20E586ACE69EA320E9A1BAE4B8B0E5BFABE98092E58F91E8B4A72035E696A4E7A4BCE79B92E8A385, null, '2000', '24000', '32000', null, '1093', '0', '0', '0', '/resources/upload/df93dc6afdcc46129519733d3d53fe1b.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('938', '寻真水果 山东莱阳丰水梨黄金梨子 2.5kg 新鲜水果', '1', 0xE5AFBBE79C9FE6B0B4E69E9C20E5B1B1E4B89CE88EB1E998B3E4B8B0E6B0B4E6A2A8E9BB84E98791E6A2A8E5AD9020322E356B6720E696B0E9B29CE6B0B4E69E9C, null, '2000', '3600', '4800', null, '1932', '0', '0', '0', '/resources/upload/22f0bbb7272448f3941a8c9a57148a39.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('939', '缤咕果园 云南蒙自甜石榴 新鲜水果 散装10斤实惠装', '1', 0xE7BCA4E59295E69E9CE59BAD20E4BA91E58D97E89299E887AAE7949CE79FB3E6A6B420E696B0E9B29CE6B0B4E69E9C20E695A3E8A3853130E696A4E5AE9EE683A0E8A385, null, '2000', '11250', '15000', null, '1958', '0', '0', '0', '/resources/upload/7dd89272867b463d9e00ed7536e527f0.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('940', '百宝源 广西百香果大果 鸡蛋果 1.5kg 24个 西番莲 新鲜水果', '1', 0xE799BEE5AE9DE6BA9020E5B9BFE8A5BFE799BEE9A699E69E9CE5A4A7E69E9C20E9B8A1E89B8BE69E9C20312E356B67203234E4B8AA20E8A5BFE795AAE88EB220E696B0E9B29CE6B0B4E69E9C, null, '2000', '5850', '7800', null, '1974', '0', '0', '0', '/resources/upload/65d82f9ffe9d47aba0338ad7ae5db663.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('941', '百宝源 新疆阿克苏冰糖心苹果 红富士苹果水果 2.5kg(80-85mm)果', '1', 0xE799BEE5AE9DE6BA9020E696B0E79686E998BFE5858BE88B8FE586B0E7B396E5BF83E88BB9E69E9C20E7BAA2E5AF8CE5A3ABE88BB9E69E9CE6B0B4E69E9C20322E356B672838302D38356D6D29E69E9C, null, '2000', '8700', '11600', null, '1997', '0', '0', '0', '/resources/upload/abcff7741cf34fb09b4c0970cccf3cc5.jpg', '2016-10-30 08:26:05', '1', '2016-10-30 08:26:05', '3');
INSERT INTO `product` VALUES ('942', '密园小农  密云当地新鲜西红柿 约2kg 自然熟 沙瓤 新鲜蔬菜', '2', 0xE5AF86E59BADE5B08FE5869C2020E5AF86E4BA91E5BD93E59CB0E696B0E9B29CE8A5BFE7BAA2E69FBF20E7BAA6326B6720E887AAE784B6E7869F20E6B299E793A420E696B0E9B29CE894ACE88F9C, null, '2000', '6750', '9000', null, '1873', '0', '0', '0', '/resources/upload/97812ce7d175451484ce43705ad6d5c3.jpg', '2016-10-30 12:25:54', '1', '2016-10-30 12:25:54', '3');
INSERT INTO `product` VALUES ('943', '密园小农 密云当地新鲜圆生菜 球生菜 约500g 新鲜蔬菜', '2', 0xE5AF86E59BADE5B08FE5869C20E5AF86E4BA91E5BD93E59CB0E696B0E9B29CE59C86E7949FE88F9C20E79083E7949FE88F9C20E7BAA63530306720E696B0E9B29CE894ACE88F9C, null, '2000', '2700', '3600', null, '1979', '1', '0', '0', '/resources/upload/975251f97af745eebfc764f9a0cfdc0b.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('944', '密园小农 新鲜西兰花 500g  当天采摘蔬菜', '2', 0xE5AF86E59BADE5B08FE5869C20E696B0E9B29CE8A5BFE585B0E88AB120353030672020E5BD93E5A4A9E98787E69198E894ACE88F9C, null, '2000', '2100', '2800', null, '460', '1', '0', '0', '/resources/upload/f55b147033d84497a54fd5c34c75e153.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('945', '密园小农 密云当地新鲜白萝卜 约500g 新鲜蔬菜', '2', 0xE5AF86E59BADE5B08FE5869C20E5AF86E4BA91E5BD93E59CB0E696B0E9B29CE799BDE8909DE58D9C20E7BAA63530306720E696B0E9B29CE894ACE88F9C, null, '2000', '1800', '2400', null, '1997', '1', '0', '0', '/resources/upload/54f21981ff2d4ca48114165568942b62.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('946', '密园小农 新鲜胡萝卜 500g  密云本地胡萝卜当天配送蔬菜 1斤装', '2', 0xE5AF86E59BADE5B08FE5869C20E696B0E9B29CE883A1E8909DE58D9C20353030672020E5AF86E4BA91E69CACE59CB0E883A1E8909DE58D9CE5BD93E5A4A9E9858DE98081E894ACE88F9C2031E696A4E8A385, null, '2000', '1500', '2000', null, '2000', '1', '0', '0', '/resources/upload/32a59763fa4c48e4a6ee01f080664b96.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('947', '密农人家 甘薯南瓜 肉质甜糯 1250g ', '2', 0xE5AF86E5869CE4BABAE5AEB620E79498E896AFE58D97E7939C20E88289E8B4A8E7949CE7B3AF20313235306720, null, '2000', '3750', '5000', null, '1985', '0', '0', '0', '/resources/upload/b2346a8175f9447e8e3a6dc87492d5bc.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('948', '密农人家   密云新鲜自然成熟 西红柿 番茄  蔬菜    500g', '2', 0xE5AF86E5869CE4BABAE5AEB6202020E5AF86E4BA91E696B0E9B29CE887AAE784B6E68890E7869F20E8A5BFE7BAA2E69FBF20E795AAE88C842020E894ACE88F9C2020202035303067, null, '2000', '1500', '2000', null, '2000', '0', '0', '0', '/resources/upload/44519a54228c41e8913932a755692911.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('949', '密农人家  密云本地 新鲜平菇 蘑菇 300g', '2', 0xE5AF86E5869CE4BABAE5AEB62020E5AF86E4BA91E69CACE59CB020E696B0E9B29CE5B9B3E88F8720E89891E88F872033303067, null, '2000', '1500', '2000', null, '1997', '0', '0', '0', '/resources/upload/691368890fd241b4897906773362013e.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('950', ' 密农人家  密云露天 蔬菜 新鲜菠菜 现摘发货 300g', '2', 0x20E5AF86E5869CE4BABAE5AEB62020E5AF86E4BA91E99CB2E5A4A920E894ACE88F9C20E696B0E9B29CE88FA0E88F9C20E78EB0E69198E58F91E8B4A72033303067, null, '2000', '1050', '1400', null, '2000', '0', '0', '0', '/resources/upload/a5457ecc8ea24f6b96bfca7c69504fc1.jpg', '2016-10-30 12:25:55', '1', '2016-10-30 12:25:55', '3');
INSERT INTO `product` VALUES ('951', ' 密农人家   密云蔬菜 新鲜油菜应季蔬菜 北京当日达 300g', '2', 0x20E5AF86E5869CE4BABAE5AEB6202020E5AF86E4BA91E894ACE88F9C20E696B0E9B29CE6B2B9E88F9CE5BA94E5ADA3E894ACE88F9C20E58C97E4BAACE5BD93E697A5E8BEBE2033303067, null, '2000', '1050', '1400', null, '2000', '0', '0', '0', '/resources/upload/02a59a18dea24d1ea28c2c70191ad1a2.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('952', '密农人家   带泥藕 新鲜莲藕 蔬菜  400g', '2', 0xE5AF86E5869CE4BABAE5AEB6202020E5B8A6E6B3A5E8979520E696B0E9B29CE88EB2E8979520E894ACE88F9C202034303067, null, '2000', '1950', '2600', null, '2000', '0', '0', '0', '/resources/upload/916b62bdc93f4f8f9679e52de69da316.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('953', ' 密农人家  密云新鲜水果胡萝卜 手指胡萝卜  500g', '2', 0x20E5AF86E5869CE4BABAE5AEB62020E5AF86E4BA91E696B0E9B29CE6B0B4E69E9CE883A1E8909DE58D9C20E6898BE68C87E883A1E8909DE58D9C202035303067, null, '2000', '1800', '2400', null, '2000', '0', '0', '0', '/resources/upload/d71a3b39702b4090b85f205edfcd4722.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('954', '密农人家 蔬菜 新鲜菜花 应季蔬菜 现摘发货  500g 买一送一', '2', 0xE5AF86E5869CE4BABAE5AEB620E894ACE88F9C20E696B0E9B29CE88F9CE88AB120E5BA94E5ADA3E894ACE88F9C20E78EB0E69198E58F91E8B4A720203530306720E4B9B0E4B880E98081E4B880, null, '2000', '1800', '2400', null, '2000', '0', '0', '0', '/resources/upload/dd9a09e21b37418792a7ff6969755982.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('955', '密农人家 葱头 洋葱 新鲜蔬菜 500g', '2', 0xE5AF86E5869CE4BABAE5AEB620E891B1E5A4B420E6B48BE891B120E696B0E9B29CE894ACE88F9C2035303067, null, '2000', '1800', '2400', null, '2000', '0', '0', '0', '/resources/upload/700d147ea6c54c30a2fd0fe6fb0a09d0.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('956', ' 密农人家 柿子椒 新鲜蔬菜 500g', '2', 0x20E5AF86E5869CE4BABAE5AEB620E69FBFE5AD90E6A49220E696B0E9B29CE894ACE88F9C2035303067, null, '2000', '1650', '2200', null, '2000', '0', '0', '0', '/resources/upload/ffba6f54e3114d8ea8008a31ce607add.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('957', ' 密农人家   密云农家 长茄子 新鲜蔬菜 自然成熟 现摘发货 400g', '2', 0x20E5AF86E5869CE4BABAE5AEB6202020E5AF86E4BA91E5869CE5AEB620E995BFE88C84E5AD9020E696B0E9B29CE894ACE88F9C20E887AAE784B6E68890E7869F20E78EB0E69198E58F91E8B4A72034303067, null, '2000', '1350', '1800', null, '2000', '0', '0', '0', '/resources/upload/9e8541d3463b49a59bcc6e1742b313d2.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('958', '密农人家 密云现摘 七寸黄瓜 北京当日达 新鲜蔬菜  500g', '2', 0xE5AF86E5869CE4BABAE5AEB620E5AF86E4BA91E78EB0E6919820E4B883E5AFB8E9BB84E7939C20E58C97E4BAACE5BD93E697A5E8BEBE20E696B0E9B29CE894ACE88F9C202035303067, null, '2000', '1800', '2400', null, '2000', '0', '0', '0', '/resources/upload/a0edcc836031461f9715172c8cb1b4e4.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('959', '东升农场 红菜头套餐 2.5KG 精品甜菜根新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E7BAA2E88F9CE5A4B4E5A597E9A49020322E354B4720E7B2BEE59381E7949CE88F9CE6A0B9E696B0E9B29CE9858DE98081, null, '2000', '7350', '9800', null, '2000', '0', '0', '0', '/resources/upload/5ce6eaf5532f488e91cf282841dfd6b6.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('960', '东升农场 生菜 1份 300g 无公害意大利生菜新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E7949FE88F9C2031E4BBBD203330306720E697A0E585ACE5AEB3E6848FE5A4A7E588A9E7949FE88F9CE696B0E9B29CE9858DE98081, null, '2000', '1800', '2400', null, '2000', '0', '0', '0', '/resources/upload/78c89990ee794bdda0c92d948dae0ea3.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('961', '东升农场  莲藕 1份  800G 精品新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA2020E88EB2E897952031E4BBBD20203830304720E7B2BEE59381E696B0E9B29CE9858DE98081, null, '2000', '3600', '4800', null, '2000', '0', '0', '0', '/resources/upload/bd931f1c267e439c8ac8f14f2515fa26.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('962', '东升农场 心里美萝卜 1份 500g 精品新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E5BF83E9878CE7BE8EE8909DE58D9C2031E4BBBD203530306720E7B2BEE59381E696B0E9B29CE9858DE98081, null, '2000', '1500', '2000', null, '2000', '0', '0', '0', '/resources/upload/a25d635b4c9b41698100c81989c0d9aa.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('963', '东升农场 娃娃菜 1份 400g 精品新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E5A883E5A883E88F9C2031E4BBBD203430306720E7B2BEE59381E696B0E9B29CE9858DE98081, null, '2000', '2250', '3000', null, '2000', '0', '0', '0', '/resources/upload/d49a2088a67e47a7a8a572c57eb87d1b.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('964', '东升农场 黄洋葱 1份 500g 精品新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E9BB84E6B48BE891B12031E4BBBD203530306720E7B2BEE59381E696B0E9B29CE9858DE98081, null, '2000', '1350', '1800', null, '2000', '0', '0', '0', '/resources/upload/352aec839f2f4666975969d334663748.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('965', '东升农场 西葫芦 1份 500g 精品云南小瓜新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E8A5BFE891ABE88AA62031E4BBBD203530306720E7B2BEE59381E4BA91E58D97E5B08FE7939CE696B0E9B29CE9858DE98081, null, '2000', '1500', '2000', null, '2000', '0', '0', '0', '/resources/upload/653046cf4c9c418dbffc847d92ec29bf.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('966', '东升农场 紫甘蓝 1份 800g 精品紫椰菜新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E7B4ABE79498E8939D2031E4BBBD203830306720E7B2BEE59381E7B4ABE6A4B0E88F9CE696B0E9B29CE9858DE98081, null, '2000', '2250', '3000', null, '2000', '0', '0', '0', '/resources/upload/a7ad4eb5398e4511b313ebf67a593e3d.jpg', '2016-10-30 12:25:56', '1', '2016-10-30 12:25:56', '3');
INSERT INTO `product` VALUES ('967', '东升农场 黄秋葵 1份 200g 精品新鲜配送', '2', 0xE4B89CE58D87E5869CE59CBA20E9BB84E7A78BE891B52031E4BBBD203230306720E7B2BEE59381E696B0E9B29CE9858DE98081, null, '2000', '1200', '1600', null, '2000', '0', '0', '0', '/resources/upload/330b29cbf57b4d3799d7ef3fcfa339fe.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('968', '密园小农 新鲜土豆 500g  马铃薯  新鲜蔬菜 密云本地种植', '2', 0xE5AF86E59BADE5B08FE5869C20E696B0E9B29CE59C9FE8B18620353030672020E9A9ACE99383E896AF2020E696B0E9B29CE894ACE88F9C20E5AF86E4BA91E69CACE59CB0E7A78DE6A48D, null, '2000', '1350', '1800', null, '2000', '0', '0', '0', '/resources/upload/2e05bef3d318498b8d0285b87d1f391a.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('969', '密园小农 农家柴鸡蛋  20枚装 约1kg 土鸡蛋 笨鸡蛋 新鲜鸡蛋', '2', 0xE5AF86E59BADE5B08FE5869C20E5869CE5AEB6E69FB4E9B8A1E89B8B20203230E69E9AE8A38520E7BAA6316B6720E59C9FE9B8A1E89B8B20E7ACA8E9B8A1E89B8B20E696B0E9B29CE9B8A1E89B8B, null, '2000', '6300', '8400', null, '2000', '0', '0', '0', '/resources/upload/75b9ac0998ee4660a7e6cf12c7879845.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('970', ' 密农人家  山地散养鸡蛋 乌鸡蛋 绿壳鸡蛋 土鸡蛋   一枚', '2', 0x20E5AF86E5869CE4BABAE5AEB62020E5B1B1E59CB0E695A3E585BBE9B8A1E89B8B20E4B98CE9B8A1E89B8B20E7BBBFE5A3B3E9B8A1E89B8B20E59C9FE9B8A1E89B8B202020E4B880E69E9A, null, '2000', '300', '400', null, '2000', '0', '0', '0', '/resources/upload/a273ac980ab545809f2c53a7b93ece38.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('971', '快食尚 北京密云散养土鸡蛋新鲜鸡蛋  20枚 约1kg 柴鸡蛋 草鸡蛋 笨鸡蛋', '2', 0xE5BFABE9A39FE5B09A20E58C97E4BAACE5AF86E4BA91E695A3E585BBE59C9FE9B8A1E89B8BE696B0E9B29CE9B8A1E89B8B20203230E69E9A20E7BAA6316B6720E69FB4E9B8A1E89B8B20E88D89E9B8A1E89B8B20E7ACA8E9B8A1E89B8B, null, '2000', '6900', '9200', null, '2000', '0', '0', '0', '/resources/upload/40ed8bc0990940ecb115d68e40816508.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('972', '密农人家 散养 农家土鸡蛋 20枚 约1kg 土鸡蛋 柴鸡蛋 笨鸡蛋', '2', 0xE5AF86E5869CE4BABAE5AEB620E695A3E585BB20E5869CE5AEB6E59C9FE9B8A1E89B8B203230E69E9A20E7BAA6316B6720E59C9FE9B8A1E89B8B20E69FB4E9B8A1E89B8B20E7ACA8E9B8A1E89B8B, null, '2000', '7200', '9600', null, '2000', '0', '0', '0', '/resources/upload/e4648d2557cf459c9c17f7c9b4725309.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('973', '农谣 新鲜散养虫草土鸡蛋30枚 草鸡蛋 约1.6kg 礼盒装', '2', 0xE5869CE8B0A320E696B0E9B29CE695A3E585BBE899ABE88D89E59C9FE9B8A1E89B8B3330E69E9A20E88D89E9B8A1E89B8B20E7BAA6312E366B6720E7A4BCE79B92E8A385, null, '2000', '9150', '12200', null, '2000', '0', '0', '0', '/resources/upload/e91b28eab2064e26975f871e249444e4.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('974', '密园小农 农家柴鸡蛋 10枚装 约0.5kg 土鸡蛋 笨鸡蛋 新鲜鸡蛋', '2', 0xE5AF86E59BADE5B08FE5869C20E5869CE5AEB6E69FB4E9B8A1E89B8B203130E69E9AE8A38520E7BAA6302E356B6720E59C9FE9B8A1E89B8B20E7ACA8E9B8A1E89B8B20E696B0E9B29CE9B8A1E89B8B, null, '2000', '3600', '4800', null, '2000', '0', '0', '0', '/resources/upload/60b0985496d4449db8dc32a3862476bc.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('975', '农谣 农家散养土鸡蛋 40枚装 约2.1kg 柴鸡蛋 新鲜鸡蛋 40枚草鸡蛋', '2', 0xE5869CE8B0A320E5869CE5AEB6E695A3E585BBE59C9FE9B8A1E89B8B203430E69E9AE8A38520E7BAA6322E316B6720E69FB4E9B8A1E89B8B20E696B0E9B29CE9B8A1E89B8B203430E69E9AE88D89E9B8A1E89B8B, null, '2000', '11700', '15600', null, '2000', '0', '0', '0', '/resources/upload/4e488bad48fe43fc8afa36f02e41ec6c.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('976', '德青源爱的鲜鸡蛋32枚 纯粮养鸡 清洁鸡蛋破损包赔', '2', 0xE5BEB7E99D92E6BA90E788B1E79A84E9B29CE9B8A1E89B8B3332E69E9A20E7BAAFE7B2AEE585BBE9B8A120E6B885E6B481E9B8A1E89B8BE7A0B4E68D9FE58C85E8B594, null, '2000', '5400', '7200', null, '2000', '0', '0', '0', '/resources/upload/ccf7b68c0ec44d18b8eeb70d564e469a.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('977', '德青源爱的宝宝初产鲜鸡蛋16枚/盒 两到三天产一枚', '2', 0xE5BEB7E99D92E6BA90E788B1E79A84E5AE9DE5AE9DE5889DE4BAA7E9B29CE9B8A1E89B8B3136E69E9A2FE79B9220E4B8A4E588B0E4B889E5A4A9E4BAA7E4B880E69E9A, null, '2000', '8850', '11800', null, '2000', '0', '0', '0', '/resources/upload/3855cbaed4e34ebfa0f8a6c956ea91e2.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('978', '田园居 林下散养土鸡蛋12枚柴鸡蛋笨鸡蛋草鸡蛋 480g', '2', 0xE794B0E59BADE5B18520E69E97E4B88BE695A3E585BBE59C9FE9B8A1E89B8B3132E69E9AE69FB4E9B8A1E89B8BE7ACA8E9B8A1E89B8BE88D89E9B8A1E89B8B2034383067, null, '2000', '2850', '3800', null, '2000', '0', '0', '0', '/resources/upload/172a9a5f2fae44d5a96cf05f2cf542d8.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('979', '洪门 有机土鸡蛋 6枚礼盒装 240克 农场新鲜直发', '2', 0xE6B4AAE997A820E69C89E69CBAE59C9FE9B8A1E89B8B2036E69E9AE7A4BCE79B92E8A38520323430E5858B20E5869CE59CBAE696B0E9B29CE79BB4E58F91, null, '2000', '1800', '2400', null, '2000', '0', '0', '0', '/resources/upload/b43e0bdc0aa14aafa1ef352f7f247116.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('980', '密园小农 农家绿壳乌鸡蛋 40枚 约2kg 土鸡蛋', '2', 0xE5AF86E59BADE5B08FE5869C20E5869CE5AEB6E7BBBFE5A3B3E4B98CE9B8A1E89B8B203430E69E9A20E7BAA6326B6720E59C9FE9B8A1E89B8B, null, '2000', '14700', '19600', null, '2000', '0', '0', '0', '/resources/upload/2e3d23434858455491f836b820bc8788.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('981', '快食尚 北京散养水鸭 青色绿色鸭蛋 农家新鲜鸭蛋 生鸭蛋 土鸭蛋 鲜鸭蛋  20枚装', '2', 0xE5BFABE9A39FE5B09A20E58C97E4BAACE695A3E585BBE6B0B4E9B8AD20E99D92E889B2E7BBBFE889B2E9B8ADE89B8B20E5869CE5AEB6E696B0E9B29CE9B8ADE89B8B20E7949FE9B8ADE89B8B20E59C9FE9B8ADE89B8B20E9B29CE9B8ADE89B8B20203230E69E9AE8A385, null, '2000', '9000', '12000', null, '2000', '0', '0', '0', '/resources/upload/0e9e2ccc551e4f5eb00275e4f94d43c6.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('982', '田园居 林下散养土鸡蛋30枚柴鸡蛋笨鸡蛋 1.2kg ', '2', 0xE794B0E59BADE5B18520E69E97E4B88BE695A3E585BBE59C9FE9B8A1E89B8B3330E69E9AE69FB4E9B8A1E89B8BE7ACA8E9B8A1E89B8B20312E326B6720, null, '2000', '5850', '7800', null, '2000', '0', '0', '0', '/resources/upload/fd0e842952e843f88467d39afbd6e002.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('983', '兰皇 可生食生鲜鸡蛋 30枚 1.8kg', '2', 0xE585B0E79A8720E58FAFE7949FE9A39FE7949FE9B29CE9B8A1E89B8B203330E69E9A20312E386B67, null, '2000', '13350', '17800', null, '2000', '0', '0', '0', '/resources/upload/9e0862130e614feb96db8c1acc4f6c4d.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('984', '洪门 有机土鸡蛋20枚*2礼盒装 1.6千克 农家柴鸡蛋 深山生态散养', '2', 0xE6B4AAE997A820E69C89E69CBAE59C9FE9B8A1E89B8B3230E69E9A2A32E7A4BCE79B92E8A38520312E36E58D83E5858B20E5869CE5AEB6E69FB4E9B8A1E89B8B20E6B7B1E5B1B1E7949FE68081E695A3E585BB, null, '2000', '9300', '12400', null, '2000', '0', '0', '0', '/resources/upload/49a19606ce064448a3ad5487963e79ea.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('985', '光阳(goosun)乌鸡蛋30枚装 新鲜鸡蛋 营养健康  新鲜食品GYWJD30', '2', 0xE58589E998B328676F6F73756E29E4B98CE9B8A1E89B8B3330E69E9AE8A38520E696B0E9B29CE9B8A1E89B8B20E890A5E585BBE581A5E5BAB72020E696B0E9B29CE9A39FE593814759574A443330, null, '2000', '12900', '17200', null, '2000', '0', '0', '0', '/resources/upload/e0a75e3ce7fe47f7a03ff8b9f8a9bf8d.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('986', '密园小农  散养土鸡蛋 30枚 约1.5kg 鲜鸡蛋 柴鸡蛋 笨鸡蛋', '2', 0xE5AF86E59BADE5B08FE5869C2020E695A3E585BBE59C9FE9B8A1E89B8B203330E69E9A20E7BAA6312E356B6720E9B29CE9B8A1E89B8B20E69FB4E9B8A1E89B8B20E7ACA8E9B8A1E89B8B, null, '2000', '8400', '11200', null, '2000', '0', '0', '0', '/resources/upload/1c19f991d1ad491191bfcba6faf33a10.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('987', '天霖 新鲜鹅蛋 初生蛋草鹅蛋 农家散养5枚装', '2', 0xE5A4A9E99C9620E696B0E9B29CE9B985E89B8B20E5889DE7949FE89B8BE88D89E9B985E89B8B20E5869CE5AEB6E695A3E585BB35E69E9AE8A385, null, '2000', '7350', '9800', null, '2000', '0', '0', '0', '/resources/upload/a41cb91cda56430a9f7b951d7fdf37e6.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('988', '聚怀斋 野鸡蛋20枚/30枚可选 七彩山鸡蛋散养野鸡蛋新鲜土鸡蛋农家草鸡蛋 20枚', '2', 0xE8819AE68080E6968B20E9878EE9B8A1E89B8B3230E69E9A2F3330E69E9AE58FAFE9808920E4B883E5BDA9E5B1B1E9B8A1E89B8BE695A3E585BBE9878EE9B8A1E89B8BE696B0E9B29CE59C9FE9B8A1E89B8BE5869CE5AEB6E88D89E9B8A1E89B8B203230E69E9A, null, '2000', '6750', '9000', null, '2000', '0', '0', '0', '/resources/upload/706619fb20684db4a3e1ef783deca1cc.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('989', '密农人家 散养 农家土鸡蛋 30枚 约1.5kg 土鸡蛋 柴鸡蛋 笨鸡蛋', '2', 0xE5AF86E5869CE4BABAE5AEB620E695A3E585BB20E5869CE5AEB6E59C9FE9B8A1E89B8B203330E69E9A20E7BAA6312E356B6720E59C9FE9B8A1E89B8B20E69FB4E9B8A1E89B8B20E7ACA8E9B8A1E89B8B, null, '2000', '8100', '10800', null, '2000', '0', '0', '0', '/resources/upload/d121017482bd48389ed961120a82f94b.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('990', '田园居 40枚土鸡蛋草鸡蛋笨鸡蛋走心礼盒装 1.6kg', '2', 0xE794B0E59BADE5B185203430E69E9AE59C9FE9B8A1E89B8BE88D89E9B8A1E89B8BE7ACA8E9B8A1E89B8BE8B5B0E5BF83E7A4BCE79B92E8A38520312E366B67, null, '2000', '8250', '11000', null, '1999', '0', '0', '0', '/resources/upload/0c419968d9f84270a931f7fcada739dc.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('991', '牛栏湖NLH 自然放养土鸭蛋鲜鸭蛋生鸭蛋 10枚装 约650g 10枚/盒', '2', 0xE7899BE6A08FE6B9964E4C4820E887AAE784B6E694BEE585BBE59C9FE9B8ADE89B8BE9B29CE9B8ADE89B8BE7949FE9B8ADE89B8B203130E69E9AE8A38520E7BAA636353067203130E69E9A2FE79B92, null, '2000', '3750', '5000', null, '1995', '0', '0', '0', '/resources/upload/1494d0574e6e4e3590de70be43e9cafe.jpg', '2016-10-30 12:25:57', '1', '2016-10-30 12:25:57', '3');
INSERT INTO `product` VALUES ('992', '密园小农 水库散养新鲜柴鹅蛋 12枚装 约1.5kg 农家散养鲜鹅蛋 土鹅蛋 ', '2', 0x3C703EE5AF86E59BADE5B08FE5869C20E6B0B4E5BA93E695A3E585BBE696B0E9B29CE69FB4E9B985E89B8B203132E69E9AE8A38520E7BAA6312E356B6720E5869CE5AEB6E695A3E585BBE9B29CE9B985E89B8B20E59C9FE9B985E89B8B3C2F703E, '', '2000', '18000', '24099', '', '2000', '0', '0', '0', '/resources/upload/4954a09f444a4347ad5c26c00fc4f509.jpg', '2016-11-08 14:24:38', '3', '2016-10-30 12:25:58', '3');
INSERT INTO `product` VALUES ('993', '天霖  新鲜鸽子蛋 30枚  农家散养土鸽子蛋', '2', 0xE5A4A9E99C962020E696B0E9B29CE9B8BDE5AD90E89B8B203330E69E9A2020E5869CE5AEB6E695A3E585BBE59C9FE9B8BDE5AD90E89B8B, null, '2000', '20700', '27600', null, '2000', '0', '0', '0', '/resources/upload/3a3e7ac84b9d47639c601085adc8b988.jpg', '2016-10-30 12:25:58', '1', '2016-10-30 12:25:58', '3');
INSERT INTO `product` VALUES ('994', '农谣 新鲜散养虫草土鸡蛋20枚 草鸡蛋 约1.4 礼盒装', '2', 0xE5869CE8B0A320E696B0E9B29CE695A3E585BBE899ABE88D89E59C9FE9B8A1E89B8B3230E69E9A20E88D89E9B8A1E89B8B20E7BAA6312E3420E7A4BCE79B92E8A385, null, '2000', '6900', '9200', null, '1997', '0', '0', '0', '/resources/upload/863954b11a0e477bb0af63d14ebfa09e.jpg', '2016-10-30 12:25:58', '1', '2016-10-30 12:25:58', '3');
INSERT INTO `product` VALUES ('995', '快食尚 北京密云散养土鸡蛋新鲜鸡蛋  40枚 约2kg 柴鸡蛋 草鸡蛋 笨鸡蛋', '2', 0xE5BFABE9A39FE5B09A20E58C97E4BAACE5AF86E4BA91E695A3E585BBE59C9FE9B8A1E89B8BE696B0E9B29CE9B8A1E89B8B20203430E69E9A20E7BAA6326B6720E69FB4E9B8A1E89B8B20E88D89E9B8A1E89B8B20E7ACA8E9B8A1E89B8B, null, '2000', '8700', '11600', null, '1999', '0', '0', '0', '/resources/upload/cf2971078a894b4997ec5bd44599b92a.jpg', '2016-10-30 12:25:58', '1', '2016-10-30 12:25:58', '3');
INSERT INTO `product` VALUES ('996', '德青源爱的鲜鸡蛋64枚装 发两盒32枚 清洁鸡蛋破损包赔', '2', 0x3C703EE5BEB7E99D92E6BA90E788B1E79A84E9B29CE9B8A1E89B8B3634E69E9AE8A38520E58F91E4B8A4E79B923332E69E9A20E6B885E6B481E9B8A1E89B8BE7A0B4E68D9FE58C85E8B5943C2F703E, '', '2000', '9300', '12400', '', '500', '0', '0', '0', '/resources/upload/f7815c07a32641268c3c764646832995.jpg', '2016-11-08 15:48:02', '3', '2016-10-30 12:25:58', '3');
INSERT INTO `product` VALUES ('997', '田园居 80枚土鸡蛋草鸡蛋笨鸡蛋贴心礼盒装 3.2kg', '2', 0xE794B0E59BADE5B185203830E69E9AE59C9FE9B8A1E89B8BE88D89E9B8A1E89B8BE7ACA8E9B8A1E89B8BE8B4B4E5BF83E7A4BCE79B92E8A38520332E326B67, null, '2000', '23700', '31600', null, '1983', '0', '0', '0', '/resources/upload/c24782348ae14b48a7002debe924e1a2.jpg', '2016-10-30 12:25:58', '1', '2016-10-30 12:25:58', '3');
INSERT INTO `product` VALUES ('1000', '鸡蛋23', '2', 0x3C703E3C696D67207372633D22687474703A2F2F3139322E3136382E3133372E313A383038382F53686F7070696E672F75706C6F61642F696D6167652F32303138313231372F313534353034353031323731333038343232382E6A706722207469746C653D22313534353034353031323731333038343232382E6A70672220616C743D22536E6170322E6A7067222F3E3C2F703E, '', null, '120', '150', '111', '200', '1', '0', '0', '/resources/upload/5550012b79b3401db16a17a80a75b857.jpg', '2018-12-17 19:10:52', '3', '2018-12-17 19:10:15', '3');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin default NULL,
  `sort_order` int(4) default NULL,
  `description` text collate utf8_bin,
  `image` varchar(255) collate utf8_bin default NULL,
  `update_time` datetime default NULL,
  `update_user_id` int(5) default NULL,
  `show_index` int(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '水果类', '997', 0xE8AEA1E7AE97E69CBAE8AFADE8A880EFBC88436F6D7075746572204C616E6775616765EFBC89E68C87E794A8E4BA8EE4BABAE4B88EE8AEA1E7AE97E69CBAE4B98BE997B4E9809AE8AEAFE79A84E8AFADE8A880E38082E8AEA1E7AE97E69CBAE8AFADE8A880E698AFE4BABAE4B88EE8AEA1E7AE97E69CBAE4B98BE997B4E4BCA0E98092E4BFA1E681AFE79A84E5AA92E4BB8BE38082E8AEA1E7AE97E69CBAE7B3BBE7BB9FE69C80E5A4A7E789B9E5BE81E698AFE68C87E4BBA4E9809AE8BF87E4B880E7A78DE8AFADE8A880E4BCA0E8BEBEE7BB99E69CBAE599A8E38082E4B8BAE4BA86E4BDBFE794B5E5AD90E8AEA1E7AE97E69CBAE8BF9BE8A18CE59084E7A78DE5B7A5E4BD9CEFBC8CE5B0B1E99C80E8A681E69C89E4B880E5A597E794A8E4BBA5E7BC96E58699E8AEA1E7AE97E69CBAE7A88BE5BA8FE79A84E695B0E5AD97E38081E5AD97E7ACA6E5928CE8AFADE6B395E8A784E58892EFBC8CE794B1E8BF99E4BA9BE5AD97E7ACA6E5928CE8AFADE6B395E8A784E58899E7BB84E68890E8AEA1E7AE97E69CBAE59084E7A78DE68C87E4BBA4EFBC88E68896E59084E7A78DE8AFADE58FA5EFBC89E38082E8BF99E4BA9BE5B0B1E698AFE8AEA1E7AE97E69CBAE883BDE68EA5E58F97E79A84E8AFADE8A880E38082, '/resources/upload/c68b08f0e98749f999b01f0430ac8050.jpg', '2018-12-25 11:54:23', '3', '1');
INSERT INTO `product_category` VALUES ('2', '蔬菜蛋类', '2', 0x31, '', '2016-10-27 18:07:17', '3', null);
INSERT INTO `product_category` VALUES ('31', '肉禽类', '3', 0x32, '/resources/upload/7b3e182cbfd7408d92bc043c65754d8b.png', '2016-10-31 14:24:33', '3', null);
INSERT INTO `product_category` VALUES ('32', '测试分类', '11', '', '', '2016-10-31 14:26:15', '3', null);
INSERT INTO `product_category` VALUES ('44', '男装', '999', 0xE586ACE5ADA3E794B7E8A385E696B0E6ACBEE4B88AE5B882, '/resources/upload/0ad766e56d844d0d895e4be5607c434c.jpg', '2016-11-08 14:54:49', '3', null);
INSERT INTO `product_category` VALUES ('45', '女装', '998', 0xE5A5B3E8A385, '/resources/upload/801d7e1430a74f97839b3ca1ea415a3e.jpg', '2016-11-08 14:49:38', '3', null);
INSERT INTO `product_category` VALUES ('46', '童装', '996', 0xE7ABA5E8A385E696B0E59381E4B88AE5B882, '/resources/upload/600611bebf564002bdaf416950661f62.jpg', '2016-11-08 14:57:08', '3', null);
INSERT INTO `product_category` VALUES ('47', '运动鞋类', '996', 0xE8BF90E58AA8E99E8BE7B1BB, '/resources/upload/11aac404300f4e8fa2a4e5f483bc9874.jpg', '2016-11-08 14:58:04', '3', null);
INSERT INTO `product_category` VALUES ('48', '休闲类', '995', 0xE4BC91E997B2E7B1BB, '/resources/upload/85a0e5828aaa47de899362d58c2afa5a.jpg', '2016-11-08 14:58:31', '3', null);
INSERT INTO `product_category` VALUES ('49', '家电', '994', 0x3131313131, '/resources/upload/29f595adb9f043c98f0de7279831ac04.jpg', '2016-11-08 15:00:54', '3', null);
INSERT INTO `product_category` VALUES ('50', '家居', '993', 0x31313131, '/resources/upload/fd61b589349e4c3cb111c2a692729360.jpg', '2016-11-08 15:01:21', '3', null);
INSERT INTO `product_category` VALUES ('51', '鞋帽类', '1000', 0x313131, '/resources/upload/bf309fc6792b4a8a99dd5d52ea77de55.png', '2016-11-08 19:56:48', '3', null);
INSERT INTO `product_category` VALUES ('52', '电子类', '1001', 0x31323331323331, '', '2016-11-08 19:57:23', '3', null);
INSERT INTO `product_category` VALUES ('53', '软件类', '1002', 0x313233313233313233, '', '2016-11-08 19:57:38', '3', null);
INSERT INTO `product_category` VALUES ('54', '电脑类', '1004', 0x31323331323331, '', '2016-11-08 19:59:23', '3', null);
INSERT INTO `product_category` VALUES ('55', '家电类', '1005', 0x3132333132333132, '', '2016-11-08 19:59:47', '3', null);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(5) NOT NULL auto_increment,
  `product_id` int(5) NOT NULL,
  `url` varchar(255) collate utf8_bin default NULL,
  `explain` text collate utf8_bin,
  `update_time` datetime default NULL,
  `update_user_id` int(5) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('6', '2', 'http://img12.360buyimg.com/n1/jfs/t766/42/347764079/292212/7f849eb5/54a3536bN34e91b95.jpg', 0x4323E9AB98E7BAA7E7BC96E7A88BEFBC88E7ACAC39E78988EFBC8920432320352E302026202E4E455420342E352E31, '2016-10-24 16:39:35', '2');
INSERT INTO `product_image` VALUES ('7', '2', 'http://img12.360buyimg.com/n1/jfs/t760/361/344498043/199657/1c7d46c7/54a3a655N7b920c50.jpg', 0x4323E9AB98E7BAA7E7BC96E7A88BEFBC88E7ACAC39E78988EFBC8920432320352E302026202E4E455420342E352E31, '2016-10-24 16:39:37', '2');
INSERT INTO `product_image` VALUES ('8', '2', 'http://img12.360buyimg.com/n5/jfs/t2380/153/2094859540/240756/59dcc45a/56a064f1N52c1ce56.jpg', 0x4323E9AB98E7BAA7E7BC96E7A88BEFBC88E7ACAC39E78988EFBC8920432320352E302026202E4E455420342E352E31, '2016-10-24 16:39:40', '2');
INSERT INTO `product_image` VALUES ('9', '2', 'http://img12.360buyimg.com/n1/jfs/t2242/11/1458899572/227082/52b76732/56a06504Nb48c1bf3.jpg', 0x4323E9AB98E7BAA7E7BC96E7A88BEFBC88E7ACAC39E78988EFBC8920432320352E302026202E4E455420342E352E31, '2016-10-24 16:39:44', '2');
INSERT INTO `product_image` VALUES ('10', '2', 'http://img12.360buyimg.com/n1/jfs/t2521/288/1276970647/234174/e12bc701/56a064fdNc84a1cba.jpg', 0x4323E9AB98E7BAA7E7BC96E7A88BEFBC88E7ACAC39E78988EFBC8920432320352E302026202E4E455420342E352E31, '2016-10-24 16:39:46', '2');
INSERT INTO `product_image` VALUES ('23', '634', '/upload/image/66c5a5d212d54fcf8fedd65987431c20.jpg', null, '2016-10-30 14:11:57', '3');
INSERT INTO `product_image` VALUES ('24', '634', '/upload/image/619e06d36c7e479289be6221313fd2f5.jpg', null, '2016-10-30 14:11:57', '3');
INSERT INTO `product_image` VALUES ('25', '634', '/upload/image/25199c21a1ad40b596f256ae3641949f.jpg', null, '2016-10-30 14:11:57', '3');
INSERT INTO `product_image` VALUES ('39', '4', '/resources/upload/3569038260e04e04b2ff62bfdbca7dc8.jpg', null, '2016-10-30 22:45:04', '3');
INSERT INTO `product_image` VALUES ('48', '1', '/resources/upload/969cd96ad1e9434d9b22752cbd212037.jpg', null, '2016-11-02 17:10:11', '3');
INSERT INTO `product_image` VALUES ('52', '992', '/resources/upload/afec3c2cfaf04470ba5f8b9951939017.jpg', null, '2016-11-08 14:24:38', '3');
INSERT INTO `product_image` VALUES ('53', '992', '/resources/upload/ba0d1fe5cfb34d4998700188261f72bb.jpg', null, '2016-11-08 14:24:38', '3');
INSERT INTO `product_image` VALUES ('54', '992', '/resources/upload/db2440040f3346ce8d947cc5a7ffaa72.jpg', null, '2016-11-08 14:24:38', '3');

-- ----------------------------
-- Table structure for product_option_info
-- ----------------------------
DROP TABLE IF EXISTS `product_option_info`;
CREATE TABLE `product_option_info` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of product_option_info
-- ----------------------------
INSERT INTO `product_option_info` VALUES ('49', '992', '3');
INSERT INTO `product_option_info` VALUES ('50', '992', '4');
INSERT INTO `product_option_info` VALUES ('69', '996', '3');
INSERT INTO `product_option_info` VALUES ('70', '996', '4');
INSERT INTO `product_option_info` VALUES ('77', '998', '3');
INSERT INTO `product_option_info` VALUES ('78', '998', '4');
INSERT INTO `product_option_info` VALUES ('79', '936', '2');
INSERT INTO `product_option_info` VALUES ('80', '999', '2');

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `type_code` varchar(10) collate utf8_bin NOT NULL default '',
  `counter_key` varchar(10) collate utf8_bin NOT NULL default '',
  `no_counter` int(9) default NULL,
  PRIMARY KEY  (`type_code`,`counter_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('I', 'I20161021', '4');
INSERT INTO `sequence` VALUES ('I', 'I20161022', '46');
INSERT INTO `sequence` VALUES ('I', 'I20161025', '7');
INSERT INTO `sequence` VALUES ('I', 'I20161026', '4');
INSERT INTO `sequence` VALUES ('I', 'I20161027', '27');
INSERT INTO `sequence` VALUES ('I', 'I20161028', '50');
INSERT INTO `sequence` VALUES ('I', 'I20161029', '29');
INSERT INTO `sequence` VALUES ('I', 'I20161030', '38');
INSERT INTO `sequence` VALUES ('I', 'I20161103', '18');
INSERT INTO `sequence` VALUES ('I', 'I20161104', '20');
INSERT INTO `sequence` VALUES ('I', 'I20161107', '35');
INSERT INTO `sequence` VALUES ('I', 'I20161108', '102');
INSERT INTO `sequence` VALUES ('I', 'I20161116', '2');
INSERT INTO `sequence` VALUES ('I', 'I20161117', '1');
INSERT INTO `sequence` VALUES ('I', 'I20161118', '2');
INSERT INTO `sequence` VALUES ('I', 'I20161119', '24');
INSERT INTO `sequence` VALUES ('I', 'I20171230', '1');
INSERT INTO `sequence` VALUES ('I', 'I20181217', '2');
INSERT INTO `sequence` VALUES ('I', 'I20181218', '5');
INSERT INTO `sequence` VALUES ('I', 'I20181219', '6');
INSERT INTO `sequence` VALUES ('I', 'I20181224', '6');
INSERT INTO `sequence` VALUES ('I', 'I20181225', '4');
INSERT INTO `sequence` VALUES ('O', 'O20161021', '2');
INSERT INTO `sequence` VALUES ('O', 'O20161022', '21');
INSERT INTO `sequence` VALUES ('O', 'O20161025', '2');
INSERT INTO `sequence` VALUES ('O', 'O20161026', '3');
INSERT INTO `sequence` VALUES ('O', 'O20161027', '22');
INSERT INTO `sequence` VALUES ('O', 'O20161028', '49');
INSERT INTO `sequence` VALUES ('O', 'O20161029', '21');
INSERT INTO `sequence` VALUES ('O', 'O20161030', '18');
INSERT INTO `sequence` VALUES ('O', 'O20161103', '7');
INSERT INTO `sequence` VALUES ('O', 'O20161104', '7');
INSERT INTO `sequence` VALUES ('O', 'O20161107', '25');
INSERT INTO `sequence` VALUES ('O', 'O20161108', '58');
INSERT INTO `sequence` VALUES ('O', 'O20161116', '1');
INSERT INTO `sequence` VALUES ('O', 'O20161117', '1');
INSERT INTO `sequence` VALUES ('O', 'O20161118', '1');
INSERT INTO `sequence` VALUES ('O', 'O20161119', '15');
INSERT INTO `sequence` VALUES ('O', 'O20171230', '1');
INSERT INTO `sequence` VALUES ('O', 'O20181217', '1');
INSERT INTO `sequence` VALUES ('O', 'O20181218', '2');
INSERT INTO `sequence` VALUES ('O', 'O20181219', '3');
INSERT INTO `sequence` VALUES ('O', 'O20181224', '5');
INSERT INTO `sequence` VALUES ('O', 'O20181225', '4');

-- ----------------------------
-- Table structure for sku
-- ----------------------------
DROP TABLE IF EXISTS `sku`;
CREATE TABLE `sku` (
  `id` int(11) NOT NULL auto_increment,
  `sku_json` text collate utf8_bin,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) default NULL,
  `price` int(11) NOT NULL,
  `option_value_key_group` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sku
-- ----------------------------
INSERT INTO `sku` VALUES ('189', 0xE9A29CE889B23AE7BAA220E69D90E696993AE79AAE, '992', '0', '1', '7_11');
INSERT INTO `sku` VALUES ('280', 0xE9A29CE889B23AE7BAA220E69D90E696993AE79AAE, '996', '-1', '1', '7_11');
INSERT INTO `sku` VALUES ('281', 0xE9A29CE889B23AE7BAA220E69D90E696993AE6A389, '996', '-1', '1', '7_12');
INSERT INTO `sku` VALUES ('282', 0xE9A29CE889B23AE7BAA220E69D90E696993AE99DA9, '996', '-1', '1', '7_13');
INSERT INTO `sku` VALUES ('283', 0xE9A29CE889B23AE7BAA220E69D90E696993AE5B883, '996', '-1', '1', '7_14');
INSERT INTO `sku` VALUES ('284', 0xE9A29CE889B23AE9BB8420E69D90E696993AE79AAE, '996', '-1', '1', '8_11');
INSERT INTO `sku` VALUES ('285', 0xE9A29CE889B23AE9BB8420E69D90E696993AE6A389, '996', '-1', '1', '8_12');
INSERT INTO `sku` VALUES ('286', 0xE9A29CE889B23AE9BB8420E69D90E696993AE99DA9, '996', '-1', '1', '8_13');
INSERT INTO `sku` VALUES ('287', 0xE9A29CE889B23AE9BB8420E69D90E696993AE5B883, '996', '-1', '1', '8_14');
INSERT INTO `sku` VALUES ('288', 0xE9A29CE889B23AE8939D20E69D90E696993AE79AAE, '996', '-1', '1', '9_11');
INSERT INTO `sku` VALUES ('289', 0xE9A29CE889B23AE8939D20E69D90E696993AE6A389, '996', '-1', '1', '9_12');
INSERT INTO `sku` VALUES ('290', 0xE9A29CE889B23AE8939D20E69D90E696993AE99DA9, '996', '-1', '1', '9_13');
INSERT INTO `sku` VALUES ('291', 0xE9A29CE889B23AE8939D20E69D90E696993AE5B883, '996', '-1', '1', '9_14');
INSERT INTO `sku` VALUES ('292', 0xE9A29CE889B23AE7BBBF20E69D90E696993AE79AAE, '996', '-1', '1', '10_11');
INSERT INTO `sku` VALUES ('293', 0xE9A29CE889B23AE7BBBF20E69D90E696993AE6A389, '996', '-1', '1', '10_12');
INSERT INTO `sku` VALUES ('294', 0xE9A29CE889B23AE7BBBF20E69D90E696993AE99DA9, '996', '-1', '1', '10_13');
INSERT INTO `sku` VALUES ('295', 0xE9A29CE889B23AE7BBBF20E69D90E696993AE5B883, '996', '-1', '1', '10_14');
INSERT INTO `sku` VALUES ('305', 0xE9A29CE889B23AE7BAA220E69D90E696993AE79AAE, '998', '777', '30000', '7_11');
INSERT INTO `sku` VALUES ('306', 0xE9A29CE889B23AE7BAA220E69D90E696993AE6A389, '998', '38', '20000', '7_12');
INSERT INTO `sku` VALUES ('307', 0xE9A29CE889B23AE7BBBF20E69D90E696993AE5B883, '998', '18', '19000', '10_14');
INSERT INTO `sku` VALUES ('308', 0xE58C85E8A3853AE5B9B3E8A385, '936', '18', '4800', '4');
INSERT INTO `sku` VALUES ('309', 0xE58C85E8A3853AE7B2BEE8A385, '936', '18', '6800', '5');
INSERT INTO `sku` VALUES ('310', 0xE58C85E8A3853AE8BDAFE7B2BEE8A385, '936', '98', '5800', '6');
INSERT INTO `sku` VALUES ('311', 0xE58C85E8A3853AE5B9B3E8A385, '999', '15', '1000', '4');
INSERT INTO `sku` VALUES ('312', 0xE58C85E8A3853AE7B2BEE8A385, '999', '28', '1500', '5');
INSERT INTO `sku` VALUES ('313', 0xE58C85E8A3853AE8BDAFE7B2BEE8A385, '999', '48', '6000', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(5) NOT NULL auto_increment,
  `user_name` varchar(50) collate utf8_bin NOT NULL,
  `pwd` varchar(100) collate utf8_bin NOT NULL,
  `nickname` varchar(50) collate utf8_bin default NULL,
  `email` varchar(50) collate utf8_bin default NULL,
  `enabled` int(2) NOT NULL default '0',
  `open_id` varchar(50) collate utf8_bin default NULL,
  `oauth_type` varchar(50) collate utf8_bin default NULL,
  `image` varchar(255) collate utf8_bin default NULL,
  `last_login_time` datetime default NULL,
  `register_time` datetime default NULL,
  `integra` int(11) default NULL,
  `money` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Leo', 'caf1a3dfb505ffed0d024130f58c5cfa', 'Erase_Leo', 'erase_liu@yahoo.com', '1', '34k63b5aa765d61d8327deb882cf99', 'QQ', null, '2016-10-21 11:35:41', '2016-10-21 11:35:43', null, null);
INSERT INTO `user` VALUES ('3', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'admin@139.com', '1', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('123456', 'XUYUSONG', '708574aadf1838a3c6bd6420bb70b4ae', '松11111', 'xuyusong@sy-binal.com', '1', '123456', '123456', '123456', '2016-10-21 21:52:54', '2016-10-21 20:02:29', null, null);
INSERT INTO `user` VALUES ('123468', '13889122960', '81dc9bdb52d04dc20036dbd8313ed055', '松', 'xuyusong@sy-binal.com', '1', null, null, null, '2016-11-08 22:39:34', '2016-10-22 20:56:13', '36687', null);
INSERT INTO `user` VALUES ('123473', '13889127072', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-10-22 21:43:53', '2016-10-22 21:43:53', null, null);
INSERT INTO `user` VALUES ('123474', '13889123456', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-10-23 11:30:09', '2016-10-23 11:30:09', null, null);
INSERT INTO `user` VALUES ('123482', '13591890872', '9bf8324440870e7663a4b1e4379fedf4', null, null, '1', null, null, null, '2016-10-25 16:27:07', '2016-10-24 14:10:42', null, null);
INSERT INTO `user` VALUES ('123483', '13889126548', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-10-24 16:31:56', '2016-10-24 16:31:56', null, null);
INSERT INTO `user` VALUES ('123484', '15640303446', '202cb962ac59075b964b07152d234b70', 'Erase', 'Erasess@11.ccc', '1', null, null, null, '2016-11-09 11:10:58', '2016-10-25 16:15:10', '15', null);
INSERT INTO `user` VALUES ('123485', '13891885172', '202cb962ac59075b964b07152d234b70', null, null, '1', null, null, null, '2016-10-25 16:38:46', '2016-10-25 16:38:46', null, null);
INSERT INTO `user` VALUES ('123486', '13888888888', '81dc9bdb52d04dc20036dbd8313ed055', '度搜啊', '13888888888', '1', null, null, null, '2016-11-08 21:43:32', '2016-10-25 16:45:19', '1072', null);
INSERT INTO `user` VALUES ('123487', 'aaa', 'd41d8cd98f00b204e9800998ecf8427e', 'aaa', 'aaa', '1', null, null, null, '2016-10-25 16:51:52', '2016-10-25 16:51:52', null, null);
INSERT INTO `user` VALUES ('123488', 'aaaa', '5acae4350aa08ec888f519fd10b25d4b', 'aaaa', 'sdfasdf@sdf.com', '1', null, null, null, '2016-10-25 17:00:17', '2016-10-25 17:00:17', null, null);
INSERT INTO `user` VALUES ('123489', 'bbbb', '5acae4350aa08ec888f519fd10b25d4b', 'bbbb', 'sdf', '1', null, null, null, '2016-10-25 17:06:13', '2016-10-25 17:06:13', null, null);
INSERT INTO `user` VALUES ('123490', 'ccc', '5acae4350aa08ec888f519fd10b25d4b', 'ccc', 'fsdf', '1', null, null, null, '2016-10-25 17:08:29', '2016-10-25 17:08:29', null, null);
INSERT INTO `user` VALUES ('123491', 'admin12', 'e10adc3949ba59abbe56e057f20f883e', 'asdsmin', '', '1', null, null, null, '2016-10-25 17:36:16', '2016-10-25 17:36:16', null, null);
INSERT INTO `user` VALUES ('123505', 'ddddd', 'e10adc3949ba59abbe56e057f20f883e', 'ddddd', '', '1', null, null, null, '2016-10-25 17:55:50', '2016-10-25 17:55:50', null, null);
INSERT INTO `user` VALUES ('123506', 'eeeeeeeeee', '5acae4350aa08ec888f519fd10b25d4b', 'eeeeeeeeeeee', 'asdf@139.com', '1', null, null, null, '2016-10-25 17:56:24', '2016-10-25 17:56:24', null, null);
INSERT INTO `user` VALUES ('123507', 'aaaa111', '25f9e794323b453885f5181f1b624d0b', 'aaaa111', '', '1', null, null, null, '2016-10-25 18:03:39', '2016-10-25 18:03:39', null, null);
INSERT INTO `user` VALUES ('123508', 'abc', '123456789', 'abc', '13213@1329.com', '1', null, null, null, '2016-10-25 18:04:52', '2016-10-25 18:04:52', null, null);
INSERT INTO `user` VALUES ('123509', '13303032222', '5f4dcc3b5aa765d61d8327deb882cf99', null, null, '1', null, null, null, '2016-10-27 14:54:47', '2016-10-27 14:54:47', null, null);
INSERT INTO `user` VALUES ('123516', 'XYS', 'e10adc3949ba59abbe56e057f20f883e', 'XYS', 'xuyusong@sy-binal.com', '1', null, null, null, '2016-10-28 13:06:43', '2016-10-28 13:06:43', null, null);
INSERT INTO `user` VALUES ('123517', '18741357909', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-10-29 16:59:43', '2016-10-29 16:59:43', null, null);
INSERT INTO `user` VALUES ('123518', '13899999999', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-11-08 14:32:13', '2016-11-08 14:26:24', '19', null);
INSERT INTO `user` VALUES ('123519', '15254161612', '698d51a19d8a121ce581499d7b701668', 'jojo', '903977454@qq.com', '1', null, null, null, '2016-11-08 20:37:44', '2016-11-08 17:36:40', '1108', null);
INSERT INTO `user` VALUES ('123520', '13889123231', '202cb962ac59075b964b07152d234b70', null, null, '1', null, null, null, '2016-11-08 20:06:28', '2016-11-08 20:06:21', null, null);
INSERT INTO `user` VALUES ('123521', '18741357901', '827ccb0eea8a706c4c34a16891f84e7b', '111', '903977454@qq.com', '1', null, null, null, '2016-11-08 21:12:25', '2016-11-08 19:41:22', '9479', null);
INSERT INTO `user` VALUES ('123522', '13304012611', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-11-19 22:41:18', '2016-11-16 15:41:47', '133', null);
INSERT INTO `user` VALUES ('123523', '13911111111', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-11-18 14:04:45', '2016-11-16 15:41:47', null, null);
INSERT INTO `user` VALUES ('123524', '13811111111', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2017-12-30 19:02:19', '2016-11-16 15:41:47', null, null);
INSERT INTO `user` VALUES ('123525', '18611111111', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2016-11-18 13:35:01', '2016-11-16 15:41:47', null, null);
INSERT INTO `user` VALUES ('123526', '13099999999', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2017-12-30 19:14:01', '2017-12-30 19:13:49', '13', null);
INSERT INTO `user` VALUES ('123527', '15973124132', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2018-12-17 19:22:44', '2018-12-17 19:08:54', '36', null);
INSERT INTO `user` VALUES ('123528', '18569468385', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null, null, '2018-12-25 12:32:04', '2018-12-18 08:46:17', '372', '4134');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL auto_increment,
  `username` varchar(45) collate utf8_bin NOT NULL,
  `role` varchar(45) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', 'admin', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('6', '13889122960', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('7', '13889127072', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('8', '13889123456', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('9', '13591890872', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('10', '13889126548', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('11', 'XUYUSONG', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('12', 'Leo', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('13', '15640303446', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('14', '13891885172', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('15', '13888888888', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('16', 'bbbb', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('17', 'ccc', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('18', '', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('19', 'ddddd', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('20', 'eeeeeeeeee', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('21', 'aaaa111', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('22', 'abc', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('23', '13303032222', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('24', 'XYS', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('25', '18741357909', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('26', '13899999999', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('27', '15254161612', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('28', '13889123231', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('29', '18741357901', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('30', '13304012611', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('31', '13099999999', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('32', '15973124132', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('33', '18569468385', 'ROLE_USER');

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `id` int(5) NOT NULL auto_increment,
  `product_id` int(5) NOT NULL,
  `option_value_ids` varchar(255) collate utf8_bin default NULL,
  `user_id` int(5) NOT NULL,
  `mark_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
INSERT INTO `wishlist` VALUES ('195', '940', null, '123484', '2016-11-03 14:47:16');
INSERT INTO `wishlist` VALUES ('196', '939', null, '123484', '2016-11-03 14:47:21');
INSERT INTO `wishlist` VALUES ('197', '938', null, '123484', '2016-11-03 14:47:25');
INSERT INTO `wishlist` VALUES ('198', '937', null, '123484', '2016-11-03 14:47:26');
INSERT INTO `wishlist` VALUES ('200', '934', null, '123484', '2016-11-03 15:38:44');
INSERT INTO `wishlist` VALUES ('201', '935', null, '123484', '2016-11-03 15:38:45');
INSERT INTO `wishlist` VALUES ('202', '936', null, '123484', '2016-11-03 15:38:46');
INSERT INTO `wishlist` VALUES ('203', '949', null, '123484', '2016-11-03 15:38:47');
INSERT INTO `wishlist` VALUES ('213', '941', null, '123484', '2016-11-03 17:09:48');
INSERT INTO `wishlist` VALUES ('214', '939', null, '123486', '2016-11-07 16:59:17');
INSERT INTO `wishlist` VALUES ('215', '992', null, '123486', '2016-11-08 11:57:16');
INSERT INTO `wishlist` VALUES ('216', '998', null, '123468', '2016-11-08 18:31:12');
INSERT INTO `wishlist` VALUES ('217', '936', null, '123468', '2016-11-08 19:53:38');
INSERT INTO `wishlist` VALUES ('218', '999', null, '123468', '2016-11-08 20:43:56');
INSERT INTO `wishlist` VALUES ('219', '938', null, '123468', '2016-11-08 20:50:44');
INSERT INTO `wishlist` VALUES ('220', '940', null, '123521', '2016-11-08 20:15:51');
INSERT INTO `wishlist` VALUES ('221', '998', null, '123521', '2016-11-08 20:17:57');
INSERT INTO `wishlist` VALUES ('222', '941', null, '123468', '2016-11-08 21:24:47');
INSERT INTO `wishlist` VALUES ('223', '940', null, '123468', '2016-11-08 21:24:48');
INSERT INTO `wishlist` VALUES ('224', '939', null, '123468', '2016-11-08 21:24:49');
INSERT INTO `wishlist` VALUES ('225', '937', null, '123468', '2016-11-08 21:24:52');
INSERT INTO `wishlist` VALUES ('226', '935', null, '123468', '2016-11-08 21:24:54');
INSERT INTO `wishlist` VALUES ('227', '934', null, '123468', '2016-11-08 21:24:56');
INSERT INTO `wishlist` VALUES ('228', '933', null, '123468', '2016-11-08 21:24:57');
INSERT INTO `wishlist` VALUES ('229', '997', null, '123468', '2016-11-08 21:25:30');
INSERT INTO `wishlist` VALUES ('230', '996', null, '123468', '2016-11-08 21:25:30');
INSERT INTO `wishlist` VALUES ('231', '995', null, '123468', '2016-11-08 21:25:31');
INSERT INTO `wishlist` VALUES ('232', '994', null, '123468', '2016-11-08 21:25:32');
INSERT INTO `wishlist` VALUES ('233', '990', null, '123468', '2016-11-08 21:25:34');
INSERT INTO `wishlist` VALUES ('235', '993', null, '123468', '2016-11-08 21:25:36');
INSERT INTO `wishlist` VALUES ('236', '991', null, '123468', '2016-11-08 21:25:36');
INSERT INTO `wishlist` VALUES ('237', '986', null, '123468', '2016-11-08 21:25:39');
INSERT INTO `wishlist` VALUES ('238', '987', null, '123468', '2016-11-08 21:25:40');
INSERT INTO `wishlist` VALUES ('239', '988', null, '123468', '2016-11-08 21:25:41');
INSERT INTO `wishlist` VALUES ('240', '989', null, '123468', '2016-11-08 21:25:42');
INSERT INTO `wishlist` VALUES ('243', '983', null, '123468', '2016-11-08 21:25:44');
INSERT INTO `wishlist` VALUES ('244', '939', null, '123522', '2016-11-19 09:50:12');
INSERT INTO `wishlist` VALUES ('248', '933', null, '123527', '2018-12-17 19:14:48');
