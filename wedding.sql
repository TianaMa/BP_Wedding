/*
Navicat MySQL Data Transfer

Source Server         : myList
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : wedding

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2012-06-06 18:45:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'hjgang', 'hjgang');
INSERT INTO `admin` VALUES ('4', 'malina', '881005');
INSERT INTO `admin` VALUES ('5', 'lilei', '123456');

-- ----------------------------
-- Table structure for `cart_company`
-- ----------------------------
DROP TABLE IF EXISTS `cart_company`;
CREATE TABLE `cart_company` (
  `cart_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`,`company_id`),
  KEY `FK21483E5E93F1734D` (`cart_id`),
  KEY `FK21483E5E9BCA45AF` (`company_id`),
  CONSTRAINT `FK21483E5E93F1734D` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`cart_id`),
  CONSTRAINT `FK21483E5E9BCA45AF` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cart_company
-- ----------------------------

-- ----------------------------
-- Table structure for `cart_hotel`
-- ----------------------------
DROP TABLE IF EXISTS `cart_hotel`;
CREATE TABLE `cart_hotel` (
  `cart_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`,`hotel_id`),
  KEY `FK88F7C7D593F1734D` (`cart_id`),
  KEY `FK88F7C7D5FBC0678F` (`hotel_id`),
  CONSTRAINT `FK88F7C7D593F1734D` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`cart_id`),
  CONSTRAINT `FK88F7C7D5FBC0678F` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cart_hotel
-- ----------------------------
INSERT INTO `cart_hotel` VALUES ('1', '2');

-- ----------------------------
-- Table structure for `cart_server`
-- ----------------------------
DROP TABLE IF EXISTS `cart_server`;
CREATE TABLE `cart_server` (
  `cart_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`,`server_id`),
  KEY `FKA838ED4293F1734D` (`cart_id`),
  KEY `FKA838ED4291850F25` (`server_id`),
  CONSTRAINT `FKA838ED4291850F25` FOREIGN KEY (`server_id`) REFERENCES `server` (`server_id`),
  CONSTRAINT `FKA838ED4293F1734D` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cart_server
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordered` bit(1) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('4', '艾妮婚礼公司', '天津南马路633', '												\r\n												', '022-12345678', '11', '2345', 'http://localhost:8081/', '');
INSERT INTO `company` VALUES ('5', '爱情', '南开区', '很好', '', '0', '12345', '', '');
INSERT INTO `company` VALUES ('6', '我的公司', 'ddd', 'sacfg', '123456789', '0', '1223', '', '');
INSERT INTO `company` VALUES ('7', '我', '试试', '2我鹅鹅鹅 ', '1223334444', '1', '4444', 'http://imgsrc.baidu.com/baike/pic/item/7a8a144664a427206a63e542.jpg', '');
INSERT INTO `company` VALUES ('8', '啊', '', '', '', '0', '0', '', '');
INSERT INTO `company` VALUES ('9', '啊', '133', '', '', '0', '0', '', '');
INSERT INTO `company` VALUES ('10', '啊', '133', '', '却往往', '0', '0', '', '');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wedding` datetime DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `FK27FBE3FE69CE216F` (`message_id`),
  CONSTRAINT `FK27FBE3FE69CE216F` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'malina', '881005', '12345678901', 'qqqqqqqq', null, null, '13@q.com', null);
INSERT INTO `customer` VALUES ('2', 'liii', '123456', '13031935772', 'wwwww', null, null, '123@qq.com', null);

-- ----------------------------
-- Table structure for `hotel`
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordered` bit(1) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`),
  KEY `FK42AD1949BCA45AF` (`company_id`),
  CONSTRAINT `FK42AD1949BCA45AF` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1', '津滨国际', '', '水上公园附近', '', '0', '0', '', '', null);
INSERT INTO `hotel` VALUES ('2', '京东酒店', '12343556', '水上', '不错', '5', '1234', '', '', null);
INSERT INTO `hotel` VALUES ('3', '我的家', '', '南开', '很好', '0', '0', '', '', null);
INSERT INTO `hotel` VALUES ('4', '恩恩', '恩恩', '', '', '0', '0', '', '', null);
INSERT INTO `hotel` VALUES ('5', '何氏酒店', '13888888888', 'XXXX', 'XXXX', '5', '88', 'D:\\apache-tomcat-6.0.33\\work\\Catalina\\localhost\\wedding-service\\upload__7006cf13_137bd3a0736__8000_00000005.tmp', '', '5');
INSERT INTO `hotel` VALUES ('6', 'asdasd', '122323', '天津工业大学软件学院', 'xxxxx', '12', '21', 'D:\\apache-tomcat-6.0.33\\webapps\\wedding-service\\upload0127b2bced37455ab1923983cd912a3d.tmp', '', null);

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releaser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'aaaaaaaaaaa', 'malina', '2012-05-16 10:27:22', 'aaaaaaaaaaa', 'COMPANY');
INSERT INTO `message` VALUES ('2', 'sssss', 'malina', '2012-05-16 10:27:35', 'ddddddddddd', 'HOTEL');
INSERT INTO `message` VALUES ('3', '真好', 'malina', '2012-05-17 09:55:36', '秀太不错啊', 'COMPANY');
INSERT INTO `message` VALUES ('4', '还可以', 'malina', '2012-05-17 09:55:55', '这个酒店不错啊', 'HOTEL');
INSERT INTO `message` VALUES ('5', '好吧', 'malina', '2012-05-17 09:56:11', '你知道，还行', 'OTHERS');
INSERT INTO `message` VALUES ('6', 'eeeeee', 'malina', '2012-05-09 09:56:48', 'aaaaaaaaaa', 'OTHERS');
INSERT INTO `message` VALUES ('7', 'ddddd', 'malina', '2012-05-17 10:20:35', 'dddddddd', 'OTHERS');
INSERT INTO `message` VALUES ('8', 'eeeeeeeeeeeeeee', 'malina', '2012-05-17 10:20:45', 'eeeeeeeeeeee', 'OTHERS');
INSERT INTO `message` VALUES ('9', 'fffffffffffffffffff', 'malina', '2012-05-17 10:20:57', 'fffffffffffffffff', 'OTHERS');
INSERT INTO `message` VALUES ('10', 'hhhhhhhhhhh', 'malina', '2012-05-17 10:21:08', 'hhhhhhhhhhhhhhh', 'OTHERS');
INSERT INTO `message` VALUES ('11', 'gggggggggggggggg', 'malina', '2012-05-17 10:21:18', 'ggggggggg', 'OTHERS');
INSERT INTO `message` VALUES ('12', 'iiiiiiiii', 'malina', '2012-05-17 10:21:26', 'iiiiiiiiii', 'OTHERS');
INSERT INTO `message` VALUES ('13', 'ggggggggggggggggg', 'malina', '2012-05-17 10:21:36', 'ggggggggggggggggg', 'OTHERS');
INSERT INTO `message` VALUES ('14', 'qqqqqqqqq', 'malina', '2012-05-17 10:21:43', 'qqqqqqqqqqqq', 'OTHERS');
INSERT INTO `message` VALUES ('15', 'eeeeeqqq', 'malina', '2012-05-17 10:21:52', 'qqqqqqqqq', 'OTHERS');
INSERT INTO `message` VALUES ('16', '', 'malina', '2012-05-17 10:22:01', '', 'OTHERS');
INSERT INTO `message` VALUES ('17', 'aaaaaaaaaaaaa', 'malina', '2012-05-17 10:22:22', 'aaaaaaaaaaaaaa', 'OTHERS');
INSERT INTO `message` VALUES ('18', 'aaaaaaaaaa', 'malina', '2012-05-17 10:22:33', 'aaaaaaaaaaaa', 'OTHERS');
INSERT INTO `message` VALUES ('19', 'wwwwwwwwwww', 'malina', '2012-05-17 10:22:51', 'wwwwwwwww', 'OTHERS');
INSERT INTO `message` VALUES ('20', 'sssssssssssssss', 'malina', '2012-05-17 10:23:21', 'aaaaaaaaaaa', 'OTHERS');
INSERT INTO `message` VALUES ('21', '您好', 'malina', '2012-05-17 13:49:37', '很好', 'COMPANY');
INSERT INTO `message` VALUES ('22', '', 'malina', '2012-05-17 13:51:53', '', 'OTHERS');

-- ----------------------------
-- Table structure for `orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `o_time` datetime DEFAULT NULL,
  `o_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `o_status` bit(1) DEFAULT NULL,
  `o_total` double DEFAULT NULL,
  `c_index` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `h_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKE8B294FC9BCA45AF` (`company_id`),
  KEY `FKE8B294FCFBC0678F` (`hotel_id`),
  KEY `FKE8B294FCDA089E85` (`customer_id`),
  CONSTRAINT `FKE8B294FC9BCA45AF` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `FKE8B294FCDA089E85` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FKE8B294FCFBC0678F` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('4', null, '5', '1', '2012-05-17 13:47:37', '7e35c4c0-6e56-4c13-ab5b-9e85cde6f830', '', '12345', '0', '2', null);

-- ----------------------------
-- Table structure for `order_server`
-- ----------------------------
DROP TABLE IF EXISTS `order_server`;
CREATE TABLE `order_server` (
  `server_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`server_id`,`order_id`),
  KEY `FK3D46715491850F25` (`server_id`),
  KEY `FK3D46715456B4494F` (`order_id`),
  CONSTRAINT `FK3D46715456B4494F` FOREIGN KEY (`order_id`) REFERENCES `orderinfo` (`order_id`),
  CONSTRAINT `FK3D46715491850F25` FOREIGN KEY (`server_id`) REFERENCES `server` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order_server
-- ----------------------------

-- ----------------------------
-- Table structure for `reply_map`
-- ----------------------------
DROP TABLE IF EXISTS `reply_map`;
CREATE TABLE `reply_map` (
  `reply_map_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`reply_map_id`,`reply_message`),
  KEY `FKE62B6287E154AEEF` (`reply_map_id`),
  CONSTRAINT `FKE62B6287E154AEEF` FOREIGN KEY (`reply_map_id`) REFERENCES `message` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reply_map
-- ----------------------------

-- ----------------------------
-- Table structure for `server`
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `server_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `ordered` bit(1) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`server_id`),
  KEY `FK93671B639BCA45AF` (`company_id`),
  CONSTRAINT `FK93671B639BCA45AF` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO `server` VALUES ('1', '', null, '', '0', '', null, '', '0', '0', '', null);
INSERT INTO `server` VALUES ('2', '宝马车队', null, '', '0', '', 'WC', '', '0', '0', '', null);
INSERT INTO `server` VALUES ('3', '逍遥', null, '', '0', '', 'MC', '', '0', '0', '', null);
INSERT INTO `server` VALUES ('4', '京东策划', null, '', '0', '', 'PlANNER', '', '0', '0', '', null);

-- ----------------------------
-- Table structure for `shopping_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `sh_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `FK9DB7E397DA089E85` (`customer_id`),
  CONSTRAINT `FK9DB7E397DA089E85` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES ('1', '1', null);
INSERT INTO `shopping_cart` VALUES ('2', null, null);

-- ----------------------------
-- Table structure for `tb_scheduled`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scheduled`;
CREATE TABLE `tb_scheduled` (
  `hotel_id` int(11) NOT NULL,
  `time` date DEFAULT NULL,
  `h_index` int(11) NOT NULL,
  PRIMARY KEY (`hotel_id`,`h_index`),
  KEY `FK19B8181CFBC0678F` (`hotel_id`),
  CONSTRAINT `FK19B8181CFBC0678F` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_scheduled
-- ----------------------------
