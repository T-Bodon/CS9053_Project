/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : foryou

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-22 17:26:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_key
-- ----------------------------
DROP TABLE IF EXISTS `app_key`;
CREATE TABLE `app_key` (
  `key` varchar(255) NOT NULL,
  `secrect` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_key
-- ----------------------------
INSERT INTO `app_key` VALUES ('iOS', '2fbf3345716d7ae1840bc11aa09e0b19');
INSERT INTO `app_key` VALUES ('server', '56846a8a2fee49d14901d39cc48b8b2a');
INSERT INTO `app_key` VALUES ('andorid', '7ceaa4db3e3be2ec5d66200337f54a1f');

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `campus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campus id',
  `campus_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'Campus name',
  `city_id` int(11) NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `location_x` double DEFAULT NULL,
  `location_y` double DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `close_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `custom_service` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`campus_id`,`city_id`),
  KEY `campus_city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of campus
-- ----------------------------
INSERT INTO `campus` VALUES ('1', 'New York University BK', '1', '00:00:01', '21:59:59', '12.2', '23.4', '1', 'Rest', '18896554881');
INSERT INTO `campus` VALUES ('2', 'New York University Manhattan', '1', '06:00:00', '17:00:00', null, null, '0', 'The campus has been closed, sorry for the inconvenience', '18896554880');

-- ----------------------------
-- Table structure for campus_admin
-- ----------------------------
DROP TABLE IF EXISTS `campus_admin`;
CREATE TABLE `campus_admin` (
  `campus_admin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  `campus_id` int(11) NOT NULL,
  `last_login_date` date DEFAULT NULL,
  PRIMARY KEY (`campus_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campus_admin
-- ----------------------------
INSERT INTO `campus_admin` VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2017-07-21');
INSERT INTO `campus_admin` VALUES ('admin_1', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '2017-09-22');

-- ----------------------------
-- Table structure for campus_admin_type
-- ----------------------------
DROP TABLE IF EXISTS `campus_admin_type`;
CREATE TABLE `campus_admin_type` (
  `campus_admin_type` smallint(3) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campus_admin_type
-- ----------------------------
INSERT INTO `campus_admin_type` VALUES ('0', 'campus administrator');
INSERT INTO `campus_admin_type` VALUES ('1', 'general manager');

-- ----------------------------
-- Table structure for campus_status
-- ----------------------------
DROP TABLE IF EXISTS `campus_status`;
CREATE TABLE `campus_status` (
  `status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campus_status
-- ----------------------------
INSERT INTO `campus_status` VALUES ('1', 'nomal');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'City id',
  `city_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', 'New York City');
INSERT INTO `city` VALUES ('2', 'Los Angeles');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `campus_id` int(11) NOT NULL,
  `phone_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `suggestion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('0', '15151883572', '2015-04-30', 'Why is there no delivery time on the checkout page? There is no remark function, so the order is so sudden.');
INSERT INTO `feedback` VALUES ('0', '15295567537', '2015-04-13', 'lol');
INSERT INTO `feedback` VALUES ('0', '15295567537', '2015-05-06', 'lol');
INSERT INTO `feedback` VALUES ('0', '15295567537', '2015-05-26', 'Python');
INSERT INTO `feedback` VALUES ('0', '18094390667', '2015-05-13', 'Java');
INSERT INTO `feedback` VALUES ('0', '18705199209', '2015-04-28', 'Can''t cancel the order？');
INSERT INTO `feedback` VALUES ('0', '18705199209', '2015-04-29', 'hhhh');
INSERT INTO `feedback` VALUES ('0', '18705199233', '2015-04-27', 'The things are a bit small, I hope to add more tall ones, and there is no shortage of money, but the picture is very good, convenient and fast');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-07-20', 'good');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-07-22', 'good');
INSERT INTO `feedback` VALUES ('1', '18860902573', '2015-08-19', 'good');
INSERT INTO `feedback` VALUES ('1', '18896554888', '2015-08-19', 'good');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-08-19', 'good');
INSERT INTO `feedback` VALUES ('1', '18260108169', '2015-08-27', 'test');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-08-28', 'good');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-08-28', 'goodgood;');
INSERT INTO `feedback` VALUES ('1', '18035735959', '2015-09-11', 'good');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', 'good');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', 'aaaaaaaa');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', 'test1');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', 'wwww');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', '12weEWQE');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', 'ss');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', 'good');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-11', '123');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-15', 'aaa');
INSERT INTO `feedback` VALUES ('1', '18260108169', '2015-09-15', '12357886');
INSERT INTO `feedback` VALUES ('1', '18013116680', '2015-09-15', '453062821  good');
INSERT INTO `feedback` VALUES ('1', '18896554880', '2015-09-17', 'good');
INSERT INTO `feedback` VALUES ('2', '18896554880', '2015-10-09', 'good');
INSERT INTO `feedback` VALUES ('1', '18896558935', '2015-10-09', 'hello world');
INSERT INTO `feedback` VALUES ('2', '18896554880', '2015-10-09', 'ah');
INSERT INTO `feedback` VALUES ('1', '18896558935', '2015-10-09', 'bad');
INSERT INTO `feedback` VALUES ('1', '18762885079', '2015-10-09', 'ok');
INSERT INTO `feedback` VALUES ('1', '18762885079', '2015-10-09', 'ok');
INSERT INTO `feedback` VALUES ('1', '18035735959', '2015-10-09', 'ok');
INSERT INTO `feedback` VALUES ('1', '18035735959', '2015-10-09', 'xue');
INSERT INTO `feedback` VALUES ('1', '18035735959', '2015-10-09', '？');
INSERT INTO `feedback` VALUES ('1', '18260108169', '2015-10-12', '');
INSERT INTO `feedback` VALUES ('1', '18260108169', '2015-10-12', 'ss');
INSERT INTO `feedback` VALUES ('1', '18862342354', '2015-10-16', '!!!');
INSERT INTO `feedback` VALUES ('1', '18862342354', '2015-10-16', '???');
INSERT INTO `feedback` VALUES ('1', '18896558935', '2015-10-18', 'hi');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campus_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float(6,2) NOT NULL,
  `discount_price` float(6,2) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT 'food status，1 on stock，0 out stock',
  `grade` float(2,0) DEFAULT NULL,
  `food_flag` varchar(255) DEFAULT NULL COMMENT 'food label',
  `is_discount` smallint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `prime_cost` float(6,2) DEFAULT NULL,
  `sale_number` bigint(11) DEFAULT NULL,
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `food_count` int(11) NOT NULL DEFAULT '500',
  `to_home` smallint(6) NOT NULL DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  `home_image` varchar(255) DEFAULT NULL,
  `is_full_discount` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`food_id`,`campus_id`),
  KEY `campus_foodid` (`campus_id`,`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('101', '1', 'cheese', '1.00', '0.80', '/Public/img/goods/9280c8519530206c.jpg', null, '2015-09-18 17:42:07', '1', null, '', '0', '105', null, '0', '0', '200', '0', null, null, '0');
INSERT INTO `food` VALUES ('101', '2', 'cheese', '1.00', '0.80', '/Public/img/goods/9280c8519530206c.jpg', null, '2015-09-18 17:42:07', '1', null, '', '0', '105', null, '0', '0', '500', '0', null, null, '0');
INSERT INTO `food` VALUES ('104', '1', 'cake', '11.00', '10.80', '/Public/img/goods/W020150327373576406347.jpg', ',http://www.enjoyfu.com.cn:7777/ForyouImage/food/1442902969347-1886647746.jpg,,', '2015-09-22 14:15:31', '1', null, 'cake', '0', '105', null, '0', '0', '200', '1', null, 'http://www.deskcar.com/desktop/fengjing/2012613231539/13.jpg', '0');
INSERT INTO `food` VALUES ('104', '2', 'cake', '11.00', '10.80', '/Public/img/goods/W020150327373576406347.jpg', ',http://www.enjoyfu.com.cn:7777/ForyouImage/food/1442902969347-1886647746.jpg,,', '2015-09-22 14:15:31', '1', null, 'cake', '0', '105', null, '0', '0', '500', '1', null, 'http://www.deskcar.com/desktop/fengjing/2012613231539/13.jpg', '0');
INSERT INTO `food` VALUES ('10000', '1', 'cookies', '20.00', '18.00', '/Public/img/goods/23.jpg', 'http://120.26.76.252:8080/ForyouImage/food/14505437863731467028565.jpg', '2015-12-20 00:49:46', '1', null, '饼干', '0', '1', '4.00', '0', '0', '500', '0', null, null, '0');
INSERT INTO `food` VALUES ('10101', '1', 'noodle', '0.10', '0.10', '/Public/img/goods/9280c8519530206c.jpg', ',http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg,http://pic1.ooopic.com/uploadfilepic/sheying/2009-12-01/OOOPIC_yuer88521_20091201f5e08e4f6c8f5bc3.jpg,', '2015-09-21 13:29:48', '0', null, 'cake', '0', '106', null, '2', '0', '521', '0', 'cake', 'http://www.deskcar.com/desktop/fengjing/2011520220338/5.jpg', '1');
INSERT INTO `food` VALUES ('10101', '2', 'noodle', '0.10', '0.10', '/Public/img/goods/9280c8519530206c.jpg', ',http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg,http://pic1.ooopic.com/uploadfilepic/sheying/2009-12-01/OOOPIC_yuer88521_20091201f5e08e4f6c8f5bc3.jpg,', '2015-09-21 13:29:48', '0', null, 'cake', '0', '106', null, '1', '0', '500', '0', 'cake', 'http://www.deskcar.com/desktop/fengjing/2011520220338/5.jpg', '1');
INSERT INTO `food` VALUES ('10102', '1', 'noodle', '0.10', '0.10', '/Public/img/goods/23.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-05-26 22:52:30', '1', null, 'cake', '0', '101', null, '0', '0', '4208', '0', 'cake', null, '1');
INSERT INTO `food` VALUES ('10102', '2', 'noodle', '0.10', '0.10', '/Public/img/goods/23.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-05-26 22:52:30', '1', null, 'cake', '0', '101', null, '0', '0', '500', '0', 'cake', null, '1');
INSERT INTO `food` VALUES ('10103', '1', 'corn', '2.50', '2.30', '/Public/img/goods/10584128_131324463183_2.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-10-02 00:14:00', '1', null, '', '0', '105', null, '4', '1', '401', '1', 'cake', 'http://86bizhi.manmankan.com/bizhipic/201501/4972/1_1280x800.jpg', '1');
INSERT INTO `food` VALUES ('10103', '2', 'rice', '2.50', '2.30', '/Public/img/goods/10584128_131324463183_2.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-10-02 00:03:35', '1', null, 'cake', '0', '501', null, '0', '1', '500', '1', 'cake', 'http://86bizhi.manmankan.com/bizhipic/201501/4972/1_1280x800.jpg', '1');
INSERT INTO `food` VALUES ('10104', '1', 'beef', '2.60', '2.10', '/Public/img/goods/W020150327373576406347.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-09-07 22:08:37', '0', null, 'cake', '1', '107', null, '0', '0', '4172', '0', 'cake', null, '0');
INSERT INTO `food` VALUES ('10104', '2', 'beef', '2.60', '2.10', '/Public/img/goods/W020150327373576406347.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-09-07 22:08:37', '0', null, 'cake', '1', '107', null, '0', '0', '500', '0', 'cake', null, '0');
INSERT INTO `food` VALUES ('10105', '1', 'beef', '2.50', '2.30', '/Public/img/goods/23.jpg', ',http://www.enjoyfu.com.cn:7777/ForyouImage/food/14443733092781417138610.jpg,http://www.enjoyfu.com.cn:7777/ForyouImage/food/14443733092801846314212.jpg,http://www.enjoyfu.com.cn:7777/ForyouImage/food/1444373309282-2089297910.jpg', '2015-05-26 22:52:50', '1', null, 'cake', '0', '101', null, '7', '1', '4204', '0', 'cake', null, '1');
INSERT INTO `food` VALUES ('10105', '2', 'beef', '2.50', '2.30', '/Public/img/goods/23.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-05-26 22:52:50', '1', null, 'cake', '0', '101', null, '7', '1', '500', '0', 'cake', null, '1');
INSERT INTO `food` VALUES ('10106', '1', 'beef', '2.80', '2.30', '/Public/img/goods/9280c8519530206c.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-10-02 00:16:36', '0', null, '', '0', '105', null, '2', '1', '4174', '1', 'cake', 'http://www.deskcar.com/desktop/fengjing/2011520220338/5.jpg', '1');
INSERT INTO `food` VALUES ('10106', '2', 'bread', '2.80', '2.30', '/Public/img/goods/9280c8519530206c.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-10-02 00:04:34', '1', null, 'cake', '0', '501', null, '0', '1', '500', '1', 'cake', 'http://www.deskcar.com/desktop/fengjing/2011520220338/5.jpg', '1');
INSERT INTO `food` VALUES ('10107', '1', 'water', '2.50', '2.30', '/Public/img/goods/23.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-05-26 22:52:59', '1', null, 'cake', '0', '101', null, '3', '1', '4208', '0', 'cake', null, '1');
INSERT INTO `food` VALUES ('10107', '2', 'water', '2.50', '2.30', '/Public/img/goods/23.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-05-26 22:52:59', '1', null, 'cake', '0', '101', null, '3', '1', '500', '0', 'cake', null, '1');
INSERT INTO `food` VALUES ('10108', '1', 'dasani', '4.50', '4.00', '/Public/img/goods/10584128_131324463183_2.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-05-26 22:53:46', '1', null, 'cake', '1', '101', null, '0', '1', '4208', '0', 'cake', null, '1');
INSERT INTO `food` VALUES ('10108', '2', 'dasani', '4.50', '4.00', '/Public/img/goods/10584128_131324463183_2.jpg', 'http://pic29.nipic.com/20130525/5890690_184803578000_2.jpg,http://pica.nipic.com/2007-12-19/2007121911592513_2.jpg,http://pic22.nipic.com/20120720/8989765_092835333150_2.jpg', '2015-05-26 22:53:46', '1', null, 'cake', '1', '101', null, '0', '1', '500', '0', 'cake', null, '1');

-- ----------------------------
-- Table structure for food_category
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `campus_id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `serial` smallint(2) DEFAULT NULL,
  `is_open` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_id`,`campus_id`),
  KEY `campus_cateogry` (`campus_id`,`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4710 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_category
-- ----------------------------
INSERT INTO `food_category` VALUES ('105', '1', 'recommend', null, '0', '1', '5', '1');
INSERT INTO `food_category` VALUES ('106', '1', 'latest experience', null, '0', '1', '6', '0');
INSERT INTO `food_category` VALUES ('107', '1', 'Special Deals', null, '0', '1', '7', '1');
INSERT INTO `food_category` VALUES ('201', '1', 'home breakfast', null, '0', '1', '1', '1');
INSERT INTO `food_category` VALUES ('202', '1', 'more categories', null, '0', '1', '8', '1');
INSERT INTO `food_category` VALUES ('204', '1', 'fruit', null, '0', '1', '3', '0');
INSERT INTO `food_category` VALUES ('206', '1', 'beverages', null, '0', '1', null, '1');



-- ----------------------------
-- Table structure for food_comment
-- ----------------------------
DROP TABLE IF EXISTS `food_comment`;
CREATE TABLE `food_comment` (
  `food_id` bigint(20) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `grade` smallint(6) NOT NULL,
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `is_hidden` smallint(6) NOT NULL DEFAULT '0',
  `order_id` bigint(40) NOT NULL,
  PRIMARY KEY (`food_id`,`phone`,`date`,`campus_id`),
  KEY `campus_food_comment` (`campus_id`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_comment
-- ----------------------------
INSERT INTO `food_comment` VALUES ('0', '1', '18860902563', '2015-08-14 23:11:06', '', '0', '1', '0', '0');
INSERT INTO `food_comment` VALUES ('10101', '1', '15366031030', '2015-05-04 12:56:13', '', '5', '1', '0', '1430277616618');
INSERT INTO `food_comment` VALUES ('10101', '1', '15605159822', '2015-05-16 14:44:12', '', '4', '1', '0', '1431527057554');
INSERT INTO `food_comment` VALUES ('10101', '1', '15961685555', '2015-05-22 17:29:49', '', '5', '1', '0', '1431942287268');
INSERT INTO `food_comment` VALUES ('10101', '1', '18896554880', '2015-09-08 10:02:07', 'hhh', '3', '1', '0', '1441618148244');
INSERT INTO `food_comment` VALUES ('10101', '1', '18896554880', '2015-09-16 17:54:10', 'teat111', '4', '1', '1', '1442396980163');
INSERT INTO `food_comment` VALUES ('10101', '1', '18896554880', '2015-09-17 10:03:07', 'tesarqrc', '3', '1', '1', '1442397403658');
INSERT INTO `food_comment` VALUES ('10101', '1', '18896554880', '2015-09-17 10:08:30', '123', '4', '1', '1', '1441462499350');
INSERT INTO `food_comment` VALUES ('10101', '1', '18896554880', '2015-09-17 21:21:29', 'gggg', '5', '1', '0', '1442471782953');
INSERT INTO `food_comment` VALUES ('10101', '1', '18896554880', '2015-09-18 17:34:38', 'egeg', '1', '1', '0', '1442568342686');
INSERT INTO `food_comment` VALUES ('10103', '1', '18896554880', '2015-08-26 15:40:25', '', '4', '1', '1', '1440471430816');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-15 13:28:35', 'aaa', '2', '1', '1', '1429972765548');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-15 14:33:37', '', '2', '1', '1', '1429971769361');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-15 15:06:10', 'aaaa', '3', '1', '1', '1429971412825');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-15 15:26:43', 'egeg', '5', '1', '1', '1429811272143');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-22 09:52:05', '', '4', '1', '1', '1429971412825');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-22 09:59:46', '', '4', '1', '1', '1429811272143');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-22 10:50:31', '', '5', '1', '1', '1429972765548');
INSERT INTO `food_comment` VALUES ('10104', '1', '18896554880', '2015-08-25 10:58:59', '', '5', '1', '1', '1429861151991');
INSERT INTO `food_comment` VALUES ('10105', '1', '18896554880', '2015-08-26 15:43:59', '', '4', '1', '1', '1430044896102');
INSERT INTO `food_comment` VALUES ('10109', '1', '18896554880', '2015-08-25 09:47:53', '', '5', '1', '1', '48097897979');
INSERT INTO `food_comment` VALUES ('10109', '1', '18896554880', '2015-08-26 10:30:12', '', '5', '1', '1', '48097897979');
INSERT INTO `food_comment` VALUES ('10118', '1', '18896554880', '2015-08-25 09:47:25', '', '5', '1', '1', '461209120912');
INSERT INTO `food_comment` VALUES ('10118', '1', '18896554880', '2015-08-26 10:30:10', '', '5', '1', '1', '461209120912');
INSERT INTO `food_comment` VALUES ('10119', '1', '18896554880', '2015-08-26 10:30:06', '', '5', '1', '1', '412770912790');
INSERT INTO `food_comment` VALUES ('10119', '1', '18896554880', '2015-08-26 17:39:00', 'gege', '5', '1', '0', '412770912790');
INSERT INTO `food_comment` VALUES ('10134', '1', '18896554880', '2015-08-26 15:40:36', '', '3', '1', '1', '1440469181175');
INSERT INTO `food_comment` VALUES ('10141', '1', '18896554880', '2015-08-15 15:25:34', 'egeg', '5', '1', '1', '1429811965903');
INSERT INTO `food_comment` VALUES ('10145', '1', '18896554880', '2015-08-15 14:50:35', '', '4', '1', '1', '1429972027467');
INSERT INTO `food_comment` VALUES ('10145', '1', '18896554880', '2015-08-21 20:32:55', '', '5', '1', '1', '1429972027467');
INSERT INTO `food_comment` VALUES ('10145', '1', '18896554880', '2015-08-25 10:58:51', '', '5', '1', '1', '1429891519848');
INSERT INTO `food_comment` VALUES ('10145', '1', '18896554880', '2015-08-25 10:58:53', '', '5', '1', '1', '1429891519848');
INSERT INTO `food_comment` VALUES ('10205', '1', '18896554880', '2015-08-06 13:53:09', 'egeeg', '3', '1', '1', '1432022393885');
INSERT INTO `food_comment` VALUES ('10205', '1', '18896554880', '2015-08-06 14:47:17', '', '0', '1', '1', '1432022393885');
INSERT INTO `food_comment` VALUES ('10205', '1', '18896554880', '2015-08-06 14:50:23', '', '0', '1', '1', '1432022393885');
INSERT INTO `food_comment` VALUES ('10205', '1', '18896554880', '2015-08-06 14:57:23', '', '0', '1', '1', '1432022393885');
INSERT INTO `food_comment` VALUES ('10221', '1', '18896554880', '2015-08-14 15:03:26', '', '4', '1', '1', '1430139852697');
INSERT INTO `food_comment` VALUES ('10221', '1', '18896554880', '2015-08-21 20:17:59', '', '4', '1', '1', '1430139852697');
INSERT INTO `food_comment` VALUES ('10402', '1', '18896554880', '2015-08-20 14:36:25', 'goodstatus', '2', '1', '1', '1430143292642');
INSERT INTO `food_comment` VALUES ('10403', '1', '18896554880', '2015-08-14 15:57:28', '', '3', '1', '1', '1430139926629');
INSERT INTO `food_comment` VALUES ('10403', '1', '18896554880', '2015-08-20 09:58:40', '', '4', '1', '1', '1430139926629');
INSERT INTO `food_comment` VALUES ('10403', '1', '18896554880', '2015-08-21 19:59:34', '', '5', '1', '1', '1430139926629');
INSERT INTO `food_comment` VALUES ('10418', '1', '18896554880', '2015-08-07 10:40:44', '', '0', '1', '1', '1432114221348');
INSERT INTO `food_comment` VALUES ('10501', '1', '18896554880', '2015-09-16 17:35:25', '1231324123123', '4', '1', '1', '1440578968');
INSERT INTO `food_comment` VALUES ('10501', '1', '18896554880', '2015-09-16 17:35:41', '1234', '4', '1', '1', '1440578968');


-- ----------------------------
-- Table structure for hot_search
-- ----------------------------
DROP TABLE IF EXISTS `hot_search`;
CREATE TABLE `hot_search` (
  `hot_id` int(10) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL,
  `search_tag` varchar(255) NOT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `is_display` tinyint(4) NOT NULL DEFAULT '1',
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`hot_id`),
  KEY `index_search` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hot_search
-- ----------------------------
INSERT INTO `hot_search` VALUES ('1', 'fresh milk', 'milk', null, '1', '1');
INSERT INTO `hot_search` VALUES ('3', 'delicious bread', 'bread', null, '1', '1');
INSERT INTO `hot_search` VALUES ('4', 'Casual snacks', 'snacks', null, '1', '1');
INSERT INTO `hot_search` VALUES ('5', 'delicious drink', 'drink', null, '1', '1');
INSERT INTO `hot_search` VALUES ('6', 'Housekeeping', 'Housekeeping', null, '1', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` bigint(20) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `title` varchar(100) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`news_id`,`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1443714657869', '1', '2015-10-01 23:50:57', '', 'http://pic1.win4000.com/wallpaper/3/53ad42ed97f0a.jpg', '');
INSERT INTO `news` VALUES ('1443714679985', '1', '2015-10-01 23:51:19', '', 'http://img1.3lian.com/2015/a1/18/d/150.jpg', '');
INSERT INTO `news` VALUES ('1443714725063', '1', '2015-10-01 23:52:05', '', 'http://bizhi.4493.com/uploads/allimg/140924/4-140924104310.jpg', '');
INSERT INTO `news` VALUES ('1443715227770', '2', '2015-10-02 00:00:27', '', 'http://www.bz55.com/uploads/allimg/130207/1-13020F92228-50.jpg', '');
INSERT INTO `news` VALUES ('1443715243855', '2', '2015-10-02 00:00:43', '', 'http://pic2.ooopic.com/11/77/11/38bOOOPICdf_1024.jpg', '');
INSERT INTO `news` VALUES ('1443715273675', '2', '2015-10-02 00:01:13', '', 'http://pic41.nipic.com/20140519/18505720_094637688147_2.jpg', '');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` bigint(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `together_id` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `price` float(6,2) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `is_remarked` smallint(6) NOT NULL DEFAULT '0',
  `food_id` bigint(20) NOT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `together_date` datetime DEFAULT NULL,
  `admin_phone` varchar(20) DEFAULT NULL,
  `reserve_time` varchar(30) DEFAULT NULL COMMENT 'scheduled delivery time',
  `message` varchar(255) DEFAULT NULL COMMENT 'message',
  `tag` smallint(6) NOT NULL DEFAULT '1',
  `pay_way` smallint(6) DEFAULT '0',
  `prefere_id` int(11) DEFAULT NULL,
  `total_price` float(6,2) DEFAULT NULL,
  `charge_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`phone`),
  KEY `together_id_index` (`together_id`),
  KEY `admin_phone_index` (`admin_phone`),
  KEY `rank_index` (`rank`),
  KEY `create_time_index` (`create_time`),
  KEY `together_date_index` (`together_date`),
  KEY `food_id_index` (`food_id`),
  KEY `campus_order` (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1439459246', '18860902563', '1', '188609025631439459319', '2015-08-13 17:08:26', '9', null, '4', '0', '10703', null, '2015-08-13 17:08:39', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439459341', '18860902563', '1', '188609025631439468641', '2015-08-13 17:08:01', '1', null, '6', '1', '20203', null, '2015-08-13 20:08:01', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439459346', '18860902563', '1', '188609025631439468641', '2015-08-13 17:08:06', '1', null, '4', '1', '20102', null, '2015-08-13 20:08:01', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439459352', '18860902563', '1', '188609025631439468641', '2015-08-13 17:08:12', '3', null, '17', '0', '10705', null, '2015-08-13 20:08:01', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439468710', '18860902563', '1', '188609025631439469029', '2015-08-13 20:08:10', '3', null, '2', '0', '10604', null, '2015-08-13 20:08:29', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439468723', '18860902563', '1', '188609025631439469029', '2015-08-13 20:08:23', '4', null, '1', '0', '10601', null, '2015-08-13 20:08:29', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439468734', '18860902563', '1', '188609025631439469029', '2015-08-13 20:08:34', '5', null, '3', '0', '20101', null, '2015-08-13 20:08:29', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439468743', '18860902563', '1', '188609025631439469029', '2015-08-13 20:08:43', '5', null, '3', '0', '20302', null, '2015-08-13 20:08:29', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439469032', '18860902563', '1', '188609025631439469046', '2015-08-13 20:08:32', '5', null, '3', '0', '20302', '1427634635035', '2015-08-13 20:08:46', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439469040', '18860902563', '1', '188609025631439469046', '2015-08-13 20:08:40', '5', null, '1', '0', '20305', '1427634635035', '2015-08-13 20:08:46', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439469107', '18860902563', '1', '188609025631439951094000', '2015-08-13 20:08:47', '2', null, '37', '0', '20603', '1427634635035', '2015-08-19 10:08:54', null, null, null, '0', '0', null, '1.00', 'ch_Xsr7u35O3m1Gw4ed2ODmi4Lw');
INSERT INTO `orders` VALUES ('1439469122', '18860902563', '1', '188609025631439950450000', '2015-08-13 20:08:02', '1', null, '105', '0', '20601', '1427634635035', '2015-08-19 10:08:10', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439478522', '18860902563', '1', '188609025631439951229000', '2015-08-13 23:08:42', '0', null, '60', '0', '20303', '1427634635035', '2015-08-19 10:08:09', null, null, null, '1', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439790242', '18860902563', '1', '188609025631441009576544', '2015-08-17 13:08:02', '1', null, '1', '0', '10701', null, '2015-08-19 10:08:09', null, null, null, '1', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439950789', '18860902563', '1', '188609025631439951321000', '2015-08-19 10:08:49', '1', null, '1', '0', '10503', null, '2015-08-19 10:08:41', null, null, null, '0', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439968650', '13913287690', '1', '139132876901439971207000', '2015-08-19 15:08:30', '0', null, '1', '0', '10602', null, '2015-08-19 16:08:07', null, null, null, '1', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439968654', '13913287690', '1', '139132876901439971207000', '2015-08-19 15:08:34', '0', null, '2', '0', '10601', null, '2015-08-19 16:08:07', null, null, null, '1', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439968702', '13913287690', '1', null, '2015-08-19 15:08:22', '0', null, '1', '0', '20102', null, null, null, null, null, '1', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1439968710', '13913287690', '1', '139132876901439969468000', '2015-08-19 15:08:30', '0', null, '1', '0', '20203', null, '2015-08-19 15:08:08', null, null, null, '1', '0', null, '100.00', null);
INSERT INTO `orders` VALUES ('1441000098', '18896554883', '1', '188965548831441000662000', '2015-08-31 13:08:18', '1', null, '2', '0', '10601', '1441014994756', '2015-08-31 13:08:42', null, null, null, '1', '1', null, null, null);
INSERT INTO `orders` VALUES ('1441012991', '18896554883', '1', '188965548831441014181000', '2015-08-31 17:08:11', '1', null, '8', '0', '10103', '1441014994756', '2015-08-31 17:08:01', null, null, null, '1', '1', null, null, null);
-- ----------------------------
-- Table structure for order_pay
-- ----------------------------
DROP TABLE IF EXISTS `order_pay`;
CREATE TABLE `order_pay` (
  `pay_id` smallint(6) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_pay
-- ----------------------------
INSERT INTO `order_pay` VALUES ('1', 'Apple pay');
INSERT INTO `order_pay` VALUES ('2', 'Visa');

-- ----------------------------
-- Table structure for preferential
-- ----------------------------
DROP TABLE IF EXISTS `preferential`;
CREATE TABLE `preferential` (
  `preferential_id` int(11) NOT NULL AUTO_INCREMENT,
  `need_number` int(11) NOT NULL,
  `discount_num` int(11) NOT NULL DEFAULT '0',
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`preferential_id`),
  KEY `prefer_campus` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preferential
-- ----------------------------
INSERT INTO `preferential` VALUES ('1', '20', '3', '1');
INSERT INTO `preferential` VALUES ('2', '30', '5', '1');
INSERT INTO `preferential` VALUES ('3', '40', '12', '1');
INSERT INTO `preferential` VALUES ('4', '20', '6', '2');
INSERT INTO `preferential` VALUES ('5', '10', '2', '32');
INSERT INTO `preferential` VALUES ('6', '15', '3', '32');
INSERT INTO `preferential` VALUES ('7', '20', '5', '32');
INSERT INTO `preferential` VALUES ('8', '40', '8', '32');
INSERT INTO `preferential` VALUES ('9', '50', '20', '32');

-- ----------------------------
-- Table structure for receiver
-- ----------------------------
DROP TABLE IF EXISTS `receiver`;
CREATE TABLE `receiver` (
  `phone_id` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tag` smallint(6) DEFAULT '1',
  `rank` varchar(20) NOT NULL,
  `is_out` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is the address invalid',
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`rank`,`phone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receiver
-- ----------------------------
INSERT INTO `receiver` VALUES ('8798', '13040101273', 'ywx', 'One MetroTech Center, 19th Floor Brooklyn, NY', '0', '1234567890', '0', '1');
INSERT INTO `receiver` VALUES ('879833043', '13040101273', 'zwt', 'One MetroTech Center, 19th Floor Brooklyn, NY', '1', '1234567890', '0', '1');
INSERT INTO `receiver` VALUES ('18762885079', '18762885079', 'zdg', 'One MetroTech Center, 19th Floor Brooklyn, NY', '1', '1427300541891', '1', '3');
INSERT INTO `receiver` VALUES ('18260108169', '18896554880', 'zym', 'One MetroTech Center, 19th Floor Brooklyn, NY', '1', '1427308019083', '1', '1');
INSERT INTO `receiver` VALUES ('15151883571', '15151883571', 'xy', 'One MetroTech Center, 19th Floor Brooklyn, NY', '0', '1427634635035', '0', '0');
INSERT INTO `receiver` VALUES ('18751889986', '18751889986', 'cnm', 'One MetroTech Center, 19th Floor Brooklyn, NY', '0', '1427647922718', '0', '0');
INSERT INTO `receiver` VALUES ('15151883572', '15151883572', 'nmsl', 'One MetroTech Center, 19th Floor Brooklyn, NY', '0', '1427691760293', '0', '0');
INSERT INTO `receiver` VALUES ('17712915379', '17712915379', 'sxc', '50 West 4th Street,New York, NY', '0', '1427701806534', '0', '1');
INSERT INTO `receiver` VALUES ('15295567537', '15295567537', 'll', '50 West 4th Street,New York, NY', '0', '1428134772134', '0', '0');
INSERT INTO `receiver` VALUES ('18762885079', '18896554880', 'dz', '50 West 4th Street,New York, NY', '1', '1428311194447', '1', '0');
INSERT INTO `receiver` VALUES ('18762885079', '18260108169', '2', '50 West 4th Street,New York, NY', '1', '1428312246582', '0', '0');
INSERT INTO `receiver` VALUES ('18896554880', '18260108169', 'gal', '50 West 4th Street,New York, NY', '1', '1428421699524', '1', '1');



-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `phone` varchar(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  `create_time` date NOT NULL COMMENT 'Registration time',
  `nickname` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `last_login_date` date DEFAULT NULL,
  `token` varchar(256) DEFAULT NULL,
  `sex` smallint(1) DEFAULT NULL,
  `academy` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `last_campus` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`phone`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `mail_2` (`mail`),
  KEY `campus_index` (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '2017-07-21', 'test', null, null, null, null, null, null, null, null, '1', '1');

-- ----------------------------
-- Table structure for users_type
-- ----------------------------
DROP TABLE IF EXISTS `users_type`;
CREATE TABLE `users_type` (
  `user_type` smallint(6) NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_type
-- ----------------------------
INSERT INTO `users_type` VALUES ('0', 'super administrator');
INSERT INTO `users_type` VALUES ('1', 'administrator');
INSERT INTO `users_type` VALUES ('2', 'general user');

-- ----------------------------
-- View structure for detail_order
-- ----------------------------
DROP VIEW IF EXISTS `detail_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_order` AS select `orders`.`together_id` AS `together_id`,`orders`.`campus_id` AS `campus_id`,`food`.`name` AS `food_name`,`food`.`price` AS `price`,`food`.`discount_price` AS `discount_price`,`food`.`is_discount` AS `is_discount`,`orders`.`order_count` AS `order_count`,`orders`.`status` AS `status` from (`orders` join `food`) where ((`orders`.`food_id` = `food`.`food_id`) and (`orders`.`status` <> 0) and (`food`.`campus_id` = `orders`.`campus_id`) and (`orders`.`tag` = 1)) ;

-- ----------------------------
-- View structure for order_food_receiver
-- ----------------------------
DROP VIEW IF EXISTS `order_food_receiver`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_food_receiver` AS select `orders`.`phone` AS `phone`,`orders`.`campus_id` AS `campus_id`,`orders`.`together_id` AS `together_id`,`orders`.`order_count` AS `order_count`,`orders`.`food_id` AS `food_id`,`orders`.`rank` AS `rank`,`orders`.`together_date` AS `together_date`,`orders`.`admin_phone` AS `admin_phone`,`orders`.`reserve_time` AS `reserve_time`,`orders`.`tag` AS `tag`,`food`.`name` AS `foodName`,`food`.`price` AS `price`,`food`.`discount_price` AS `discount_price`,`food`.`img_url` AS `img_url`,`food`.`status` AS `status`,`food`.`is_discount` AS `is_discount`,`food`.`message` AS `message`,`receiver`.`phone_id` AS `customer_phone`,`receiver`.`name` AS `receiverName`,`receiver`.`address` AS `address`,`receiver`.`is_out` AS `is_out` from ((`orders` join `food`) join `receiver`) where ((`orders`.`food_id` = `food`.`food_id`) and (`orders`.`phone` = `receiver`.`phone`)) ;

-- ----------------------------
-- View structure for together_order
-- ----------------------------
DROP VIEW IF EXISTS `together_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `together_order` AS select `orders`.`phone` AS `phone`,`orders`.`together_id` AS `together_id`,`orders`.`campus_id` AS `campus_id`,`receiver`.`name` AS `nickname`,`receiver`.`phone` AS `custome_phone`,`orders`.`together_date` AS `together_date`,`users`.`nickname` AS `admin_name`,`orders`.`reserve_time` AS `reserve_time`,`orders`.`message` AS `message`,`orders`.`status` AS `STATUS`,`orders`.`tag` AS `tag`,`orders`.`admin_phone` AS `admin_phone`,`orders`.`total_price` AS `total_price`,`receiver`.`address` AS `address`,`orders`.`charge_id` AS `charge_id`,`orders`.`pay_way` AS `pay_way` from ((`orders` left join `receiver` on(((`orders`.`phone` = `receiver`.`phone_id`) and (`orders`.`rank` = `receiver`.`rank`)))) left join `users` on((`users`.`phone` = `orders`.`admin_phone`))) group by `orders`.`together_id` having (`orders`.`status` <> 0) ;
