/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : stock

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2014-12-02 20:16:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `pic_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '17', '90_Degree_Long_Radius_Elbows');
INSERT INTO `picture` VALUES ('2', '18', '90_Degree_Short_Radius_Elbows');
INSERT INTO `picture` VALUES ('3', '19', '45_Degree_Long_Radius_Elbows');
INSERT INTO `picture` VALUES ('4', '20', '180_Degree_Long_Radius_Elbows');
INSERT INTO `picture` VALUES ('5', '21', 'Concentric_Reducers');
INSERT INTO `picture` VALUES ('6', '22', 'Eccentric_Reducers');
INSERT INTO `picture` VALUES ('7', '23', 'Equal_Tees');
INSERT INTO `picture` VALUES ('8', '24', 'Reducing_Tees');
INSERT INTO `picture` VALUES ('9', '25', 'Stub_Ends_Type_A');
INSERT INTO `picture` VALUES ('10', '26', 'Stub_Ends_Type_B');
INSERT INTO `picture` VALUES ('11', '27', 'Caps');
INSERT INTO `picture` VALUES ('12', '28', 'Stainless_Steel_Pipes_thick');
INSERT INTO `picture` VALUES ('13', '29', 'Stainless_Steel_Pipes');
INSERT INTO `picture` VALUES ('14', '30', 'Stainless_Steel_Plates');
INSERT INTO `picture` VALUES ('15', '31', 'Reducing_Cross');
INSERT INTO `picture` VALUES ('16', '32', '60_Degree_Long_Radius_Elbows');
