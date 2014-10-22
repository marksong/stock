# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.20)
# Database: stock
# Generation Time: 2014-10-22 12:42:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(500) NOT NULL DEFAULT '',
  `password` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `username`, `password`)
VALUES
	(1,'admin','admin');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(500) DEFAULT NULL,
  `name_en` varchar(500) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `hierarchy_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name_zh`, `name_en`, `sort_order`, `hierarchy_num`)
VALUES
	(1,'ASTM','ASTM',1,1),
	(2,'EN10254-3','EN10254-3',2,1),
	(3,'GB','GB',3,1),
	(4,'JIS','JIS',4,1),
	(5,'DIN','DIN',5,1),
	(6,'无缝','Seamless',1,2),
	(7,'焊接','Weled',2,2),
	(8,'焊接拍片','Weled-Xray',3,2),
	(9,'无缝热轧','Hot rolling',4,2),
	(10,'TP304L','TP304L',1,3),
	(11,'TP316L','TP316L',2,3),
	(12,'WP304/304L','WP304/304L',3,3),
	(13,'WP316/316L','WP316/316L',4,3),
	(14,'WP310S','WP310S',5,3),
	(15,'WP321H','WP321H',6,3),
	(16,'else','else',7,3),
	(17,'90度长径弯头','90°Long Radius Elbows',1,4),
	(18,'90度短径弯头','90°Short Radius Elbows',2,4),
	(19,'45度长径弯头','45°Long Radius Elbows',3,4),
	(20,'180度弯头','180°Long Radius Elbows',4,4),
	(21,'同心大小头','Concentric Reducers',5,4),
	(22,'偏心大小头','Eccentric Reducers',6,4),
	(23,'等径三通','Equal Tees',7,4),
	(24,'异径三通','Reducing Tees',8,4),
	(25,'翻边 A型','Stub Ends Type A长型',9,4),
	(26,'翻边 B型','Stub Ends Type B短型',10,4),
	(27,'管帽','Caps',11,4),
	(28,'不锈钢钢管加厚','Stainless Steel Pipes (thick)',12,4),
	(29,'不锈钢钢管','Stainless Steel Pipes',13,4),
	(30,'不锈钢板材','Stainless Steel Plates',14,4),
	(31,'等径四通','Reducing Cross',15,4),
	(32,'60度长径弯头','60°Long Radius Elbows',16,4),
	(33,'1/4','1/4',1,5),
	(34,'3/8','3/8',2,5),
	(35,'1/2','1/2',3,5),
	(36,'3/4','3/4',4,5),
	(37,'1','1',5,5),
	(38,'1 1/4','1 1/4',6,5),
	(39,'1 1/2','1 1/2',7,5),
	(40,'2','2',8,5),
	(41,'2 1/2','2 1/2',9,5),
	(42,'3','3',10,5),
	(43,'3 1/2','3 1/2',11,5),
	(44,'4','4',12,5),
	(45,'5','5',13,5),
	(46,'6','6',14,5),
	(47,'8','8',15,5),
	(48,'10','10',16,5),
	(49,'12','12',17,5),
	(50,'14','14',18,5),
	(51,'16','16',19,5),
	(52,'18','18',20,5),
	(53,'20','20',21,5),
	(54,'22','22',22,5),
	(55,'24','24',23,5),
	(56,'SCH  5','SCH  5',1,6),
	(57,'SCH  5S','SCH  5S',2,6),
	(58,'SCH  10','SCH  10',3,6),
	(59,'SCH  10S','SCH  10S',4,6),
	(60,'SCH  40','SCH  40',5,6),
	(61,'SCH  40S','SCH  40S',6,6),
	(62,'SCH  80','SCH  80',7,6),
	(63,'SCH  80S','SCH  80S',8,6),
	(64,'SCH  160','SCH  160',9,6),
	(65,'SCH  XXS','SCH  XXS',10,6);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(500) DEFAULT NULL,
  `name_en` varchar(500) DEFAULT NULL,
  `product_code` varchar(500) DEFAULT NULL,
  `material` varchar(500) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `outer_diameter` varchar(500) DEFAULT NULL,
  `wall_thickness` varchar(500) DEFAULT NULL,
  `product_standards` varchar(500) DEFAULT NULL,
  `product_standards_fq_zh` varchar(500) DEFAULT NULL,
  `product_standards_fq_en` varchar(500) DEFAULT NULL,
  `type_fq_zh` varchar(500) DEFAULT NULL,
  `type_fq_en` varchar(500) DEFAULT NULL,
  `material_fq_zh` varchar(500) DEFAULT NULL,
  `material_fq_en` varchar(500) DEFAULT NULL,
  `name_fq_zh` varchar(500) DEFAULT NULL,
  `name_fq_en` varchar(500) DEFAULT NULL,
  `outer_diameter_fq_zh` varchar(500) DEFAULT NULL,
  `outer_diameter_fq_en` varchar(500) DEFAULT NULL,
  `wall_thickness_fq_zh` varchar(500) DEFAULT NULL,
  `wall_thickness_fq_en` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
