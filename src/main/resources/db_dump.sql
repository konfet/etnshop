-- phpMyAdmin SQL Dump
-- version 2.7.0-pl2
-- http://www.phpmyadmin.net
CREATE DATABASE `etnshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE etnshop;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `msk_fulltext` (`name`,`serial`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;


INSERT INTO `product` VALUES (1, 'Product 01', '1111 Miop');
INSERT INTO `product` VALUES (2, '02 Mishaf', '2222n Len');
INSERT INTO `product` VALUES (3, 'Product 03 LENTA', 'ara mish');
INSERT INTO `product` VALUES (10, 'Product 10 s mishoo', '00987 Lepenie');
INSERT INTO `product` VALUES (11, 'Product 11', '8876554 LEN2 migel');
INSERT INTO `product` VALUES (12, 'Product 12 Leninmi', '8999');
INSERT INTO `product` VALUES (14, 'LENTA', 'ara miska');
INSERT INTO `product` VALUES (15, 'j Misha15', '2222n Lenalll');
INSERT INTO `product` VALUES (26, 'last', 'without');
INSERT INTO `product` VALUES (24, 'Novy Product  Mishi', '456789000');
INSERT INTO `product` VALUES (25, 'another prod', 'from Miso');
INSERT INTO `product` VALUES (19, 'Product 02 Misha', '2222n Lenahhh');
