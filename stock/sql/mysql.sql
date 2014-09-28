CREATE DATABASE stock;

USE stock;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `company` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `user` VALUES ('1', 'Maxfitting', '小王', '11111111111', '上海市福建路', '123@123.com');
INSERT INTO `user` VALUES ('2', 'Maxfitting2', '小王2', '11111111111', '上海市福建路', '123@123.com');
INSERT INTO `user` VALUES ('3', 'Maxfitting3', '小王3', '11111111111', '上海市福建路', '123@123.com');
INSERT INTO `user` VALUES ('4', 'Maxfitting4', '小王4', '11111111111', '上海市福建路', '123@123.com');
INSERT INTO `user` VALUES ('5', 'Maxfitting5', '小王5', '11111111111', '上海市福建路', '123@123.com');
INSERT INTO `user` VALUES ('6', 'Maxfitting6', '小王6', '11111111111', '上海市福建路', '123@123.com');
INSERT INTO `user` VALUES ('7', 'Maxfitting7', '小王7', '11111111111', '上海市福建路', '123@123.com');