-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2024-08-21 13:08:27
-- 服务器版本： 8.3.0
-- PHP 版本： 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `demo`
--

DELIMITER $$
--
-- 存储过程
--
DROP PROCEDURE IF EXISTS `InsertTables`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTables` ()   BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 20 DO
    IF i NOT IN (4, 7) THEN
      INSERT INTO `tables` (`category_id`, `table_number`, `table_name`, `table_shape`, `default_capacity`) 
      VALUES ($category_id, i, CONCAT('桌台 ', i), 'round', 4);
    END IF;
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` char(10) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CategoryID` (`CategoryID`),
  KEY `CategoryName` (`CategoryName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `categories`
--

INSERT INTO `categories` (`ID`, `CategoryID`, `CategoryName`) VALUES
(1, 'TJXP', '推荐新品'),
(2, 'BDKY', '必点烤鱼'),
(3, 'TC', '套餐'),
(4, 'KYPC', '烤鱼配菜'),
(5, 'JMRC', '精美热菜'),
(6, 'JMLP', '精美冷盘'),
(7, 'JDRC', '经典热菜'),
(8, 'ZSTG', '主食汤羹'),
(9, 'GF', '盖饭'),
(10, 'BJ', '白酒'),
(11, 'PJ', '啤酒'),
(12, 'YP', '饮品'),
(13, 'MTTC', '美团套餐'),
(14, 'DYTC', '抖音套餐'),
(15, 'LBTJ', '老板推荐'),
(16, 'QT', '其他');

-- --------------------------------------------------------

--
-- 表的结构 `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `MembershipNumber` varchar(30) NOT NULL,
  `SignUpDate` date NOT NULL,
  `WeChat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `MembershipNumber` (`MembershipNumber`),
  KEY `idx_CustomerName` (`CustomerName`(191)),
  KEY `idx_Phone` (`Phone`),
  KEY `idx_MembershipNumber` (`MembershipNumber`),
  KEY `idx_WeChat` (`WeChat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` varchar(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `HireDate` date NOT NULL,
  `WeChat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EmployeeID` (`EmployeeID`),
  KEY `idx_name` (`Name`(191)),
  KEY `idx_phone` (`Phone`),
  KEY `idx_wechat` (`WeChat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE IF NOT EXISTS `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`id`, `name`, `type`, `price`) VALUES
(1, 'Apple Pie', 'Dessert', 19.99),
(2, 'Burger', 'Main Course', 29.99),
(3, 'Caesar Salad', 'Salad', 15.99);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MenuItemID` varchar(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `CategoryID` varchar(10) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`ID`, `MenuItemID`, `Name`, `CategoryID`, `Price`, `Description`) VALUES
(1, 'NFCJ', '农夫炒鸡', 'TJXP', 68.00, NULL),
(2, 'KGCD', '苦瓜炒蛋', 'TJXP', 24.00, NULL),
(3, 'XZPG', '香炸平菇', 'TJXP', 22.00, NULL),
(4, 'XLQJY', '香辣清江鱼', 'BDKY', 128.00, NULL),
(5, 'TZQJY', '藤椒清江鱼', 'BDKY', 128.00, NULL),
(6, 'SXQJY', '蒜香清江鱼', 'BDKY', 128.00, NULL),
(7, 'DCQJY', '豆豉清江鱼', 'BDKY', 128.00, NULL),
(8, 'MLQJY', '麻辣清江鱼', 'BDKY', 128.00, NULL),
(9, 'SCQJY', '酸菜清江鱼', 'BDKY', 128.00, NULL),
(10, 'JXQJY', '酱香清江鱼', 'BDKY', 128.00, NULL),
(11, 'XLCY', '香辣草鱼', 'BDKY', 98.00, NULL),
(12, 'TJCY', '藤椒草鱼', 'BDKY', 98.00, NULL),
(13, 'SXCY', '蒜香草鱼', 'BDKY', 98.00, NULL),
(14, 'DCCY', '豆豉草鱼', 'BDKY', 98.00, NULL),
(15, 'MLCY', '麻辣草鱼', 'BDKY', 98.00, NULL),
(16, 'SCCY', '酸菜草鱼', 'BDKY', 98.00, NULL),
(17, 'JXCY', '酱香草鱼', 'BDKY', 98.00, NULL),
(18, 'DP', '豆皮', 'KYPC', 10.00, NULL),
(19, 'OP', '藕片', 'KYPC', 10.00, NULL),
(20, 'YX', '鸭血', 'KYPC', 12.00, NULL),
(21, 'YSC', '圆生菜', 'KYPC', 10.00, NULL),
(22, 'KGF', '宽粉', 'KYPC', 10.00, NULL),
(23, 'ME', '木耳', 'KYPC', 12.00, NULL),
(24, 'QS', '青笋', 'KYPC', 10.00, NULL),
(25, 'TDP', '土豆片', 'KYPC', 10.00, NULL),
(26, 'JZG', '金针菇', 'KYPC', 12.00, NULL),
(27, 'WWC', '娃娃菜', 'KYPC', 10.00, NULL),
(28, 'QYDF', '千页豆腐', 'KYPC', 12.00, NULL),
(29, 'WCR', '午餐肉', 'KYPC', 16.00, NULL),
(30, 'YDF', '鱼豆腐', 'KYPC', 15.00, NULL),
(31, 'FZ', '腐竹', 'KYPC', 12.00, NULL),
(32, 'MYS', '魔芋丝', 'KYPC', 12.00, NULL),
(33, 'ZSNW', '紫苏牛蛙', 'JMRC', 98.00, NULL),
(34, 'GGYT', '干锅鸭头', 'JMRC', 68.00, NULL),
(35, 'CQMXW', '重庆毛血旺', 'JMRC', 68.00, NULL),
(36, 'SZY', '水煮鱼', 'JMRC', 128.00, NULL),
(37, 'STFN', '酸汤肥牛', 'JMRC', 68.00, NULL),
(38, 'HMYK', '黄焖鱼块', 'JMRC', 88.00, NULL),
(39, 'CXSCY', '川香酸菜鱼', 'JMRC', 88.00, NULL),
(40, 'CBLF', '川北凉粉', 'JMLP', 22.00, NULL),
(41, 'LBDDS', '凉拌豆腐丝', 'JMLP', 16.00, NULL),
(42, 'PHG', '拍黄瓜', 'JMLP', 16.00, NULL),
(43, 'KSJ', '口水鸡', 'JMLP', 38.00, NULL),
(44, 'YBTJZ', '盐帮土鸡爪', 'JMLP', 28.00, NULL),
(45, 'LBDPP', '凉菜大拼盘', 'JMLP', 18.00, NULL),
(46, 'XQFZ', '西芹腐竹', 'JMLP', 18.00, NULL),
(47, 'PDDF', '皮蛋豆腐', 'JMLP', 18.00, NULL),
(48, 'TJCZJ', '藤椒炒仔鸡', 'JDRC', 38.00, NULL),
(49, 'XCHNR', '小炒黄牛肉', 'JDRC', 58.00, NULL),
(50, 'SLJZ', '酸辣鸡杂', 'JDRC', 42.00, NULL),
(51, 'XHSNR', '西红柿牛腩', 'JDRC', 58.00, NULL),
(52, 'LWYS', '腊味烟笋', 'JDRC', 38.00, NULL),
(53, 'TLJCHZR', '土辣椒炒黑猪肉', 'JDRC', 38.00, NULL),
(54, 'GGLRG', '干锅鹿茸菇', 'JDRC', 42.00, NULL),
(55, 'GGFC', '干锅肥肠', 'JDRC', 58.00, NULL),
(56, 'JYDX', '椒盐大虾', 'JDRC', 88.00, NULL),
(57, 'SZNR', '水煮牛肉', 'JDRC', 58.00, NULL),
(58, 'TJY', '藤椒鱼', 'JDRC', 88.00, NULL),
(59, 'CTSZR', '传统水煮肉', 'JDRC', 42.00, NULL),
(60, 'WNCCJD', '外婆菜炒鸡蛋', 'JDRC', 26.00, NULL),
(61, 'XCJDF', '乡村煎豆腐', 'JDRC', 28.00, NULL),
(62, 'CQLZJ', '重庆辣子鸡', 'JDRC', 68.00, NULL),
(63, 'HGR', '回锅肉', 'JDRC', 38.00, NULL),
(64, 'YGXR', '腰果虾仁', 'JDRC', 68.00, NULL),
(65, 'MLXG', '麻辣香锅', 'JDRC', 68.00, NULL),
(66, 'CDJSQZ', '长豆角烧茄子', 'JDRC', 28.00, NULL),
(67, 'MXR', '木须肉', 'JDRC', 28.00, NULL),
(68, 'XCOS', '小炒藕丝', 'JDRC', 26.00, NULL),
(69, 'SLZG', '酸辣猪肝', 'JDRC', 38.00, NULL),
(70, 'GBJD', '宫保鸡丁', 'JDRC', 28.00, NULL),
(71, 'GZXSR', '干炸小酥肉', 'JDRC', 38.00, NULL),
(72, 'JJRS', '京酱肉丝', 'JDRC', 32.00, NULL),
(73, 'MPDF', '麻婆豆腐', 'JDRC', 18.00, NULL),
(74, 'YXRS', '鱼香肉丝', 'JDRC', 32.00, NULL),
(75, 'TCLJ', '糖醋里脊', 'JDRC', 38.00, NULL),
(76, 'XCBDS', '湘炒扁豆丝', 'JDRC', 28.00, NULL),
(77, 'GGTDP', '干锅土豆片', 'JDRC', 28.00, NULL),
(78, 'GGYJCH', '干锅有机菜花', 'JDRC', 26.00, NULL),
(79, 'GGQYDF', '干锅千页豆腐', 'JDRC', 28.00, NULL),
(80, 'MESY', '木耳山药', 'JDRC', 28.00, NULL),
(81, 'CHC', '炒合菜', 'JDRC', 26.00, NULL),
(82, 'XGRP', '香菇肉片', 'JDRC', 36.00, NULL),
(83, 'CLTDS', '醋溜土豆丝', 'JDRC', 18.00, NULL),
(84, 'XHSCJD', '西红柿鸡蛋', 'JDRC', 22.00, NULL),
(85, 'XCZG', '小炒猪肝', 'JDRC', 38.00, NULL),
(86, 'XCJZ', '小炒鸡杂', 'JDRC', 42.00, NULL),
(87, 'XQRS', '香芹肉丝', 'JDRC', 32.00, NULL),
(88, 'JJRS', '尖椒肉丝', 'JDRC', 32.00, NULL),
(89, 'JJCJD', '尖椒炒鸡蛋', 'JDRC', 22.00, NULL),
(90, 'HSDF', '红烧豆腐', 'JDRC', 18.00, NULL),
(91, 'XGYC', '香菇油菜', 'JDRC', 26.00, NULL),
(92, 'DSX', '地三鲜', 'JDRC', 26.00, NULL),
(93, 'JJDP', '尖椒豆皮', 'JDRC', 26.00, NULL),
(94, 'QCYMC', '清炒油麦菜', 'JDRC', 20.00, NULL),
(95, 'DCCJD', '大葱炒鸡蛋', 'JDRC', 22.00, NULL),
(96, 'CHDB', '葱花蛋饼', 'JDRC', 22.00, NULL),
(97, 'KGCR', '苦瓜炒肉', 'JDRC', 26.00, NULL),
(98, 'DHC', '蛋炒饭', 'ZSTG', 15.00, NULL),
(99, 'GDT', '疙瘩汤', 'ZSTG', 22.00, NULL),
(100, 'JYCF', '酱油炒饭', 'ZSTG', 16.00, NULL),
(101, 'QCDFT', '青菜豆腐汤', 'ZSTG', 18.00, NULL),
(102, 'CQXM', '重庆小面', 'ZSTG', 15.00, NULL),
(103, 'NGB', '南瓜饼', 'ZSTG', 16.00, NULL),
(104, 'QTM', '清汤面', 'ZSTG', 15.00, NULL),
(105, 'HTZB', '红糖糍粑', 'ZSTG', 18.00, NULL),
(106, 'HTBF', '红糖冰粉', 'ZSTG', 8.00, NULL),
(107, 'LZTY', '醪糟汤圆', 'ZSTG', 8.00, NULL),
(108, 'MF', '米饭', 'ZSTG', 3.00, NULL),
(109, 'DPMF', '大盆米饭', 'ZSTG', 10.00, NULL),
(110, 'SLT', '酸辣汤', 'ZSTG', 22.00, NULL),
(111, 'GBJDGF', '宫保鸡丁盖饭', 'GF', 18.00, NULL),
(112, 'YXRSGF', '鱼香肉丝盖饭', 'GF', 18.00, NULL),
(113, 'NJXCRGF', '农家小炒肉盖饭', 'GF', 25.00, NULL),
(114, 'MPFGF', '麻婆豆腐盖饭', 'GF', 16.00, NULL),
(115, 'XCZGGF', '小炒猪肝盖饭', 'GF', 18.00, NULL),
(116, 'XCXGGF', '小炒香干盖饭', 'GF', 16.00, NULL),
(117, 'XCJZGF', '小炒鸡杂盖饭', 'GF', 20.00, NULL),
(118, 'SSBCGF', '手撕包菜盖饭', 'GF', 16.00, NULL),
(119, 'MSRGF', '木须肉盖饭', 'GF', 18.00, NULL),
(120, 'SLTDSGF', '酸辣土豆丝盖饭', 'GF', 15.00, NULL),
(121, 'XHSJDGF', '西红柿鸡蛋盖饭', 'GF', 16.00, NULL),
(122, 'HGRGF', '回锅肉盖饭', 'GF', 25.00, NULL),
(123, 'XQRSGF', '香芹肉丝盖饭', 'GF', 20.00, NULL),
(124, 'JJRSGF', '尖椒肉丝盖饭', 'GF', 20.00, NULL),
(125, 'DSXGF', '地三鲜盖饭', 'GF', 18.00, NULL),
(126, 'JJJDGF', '尖椒鸡蛋盖饭', 'GF', 16.00, NULL),
(127, 'JJDPGF', '尖椒豆皮盖饭', 'GF', 16.00, NULL),
(128, 'HSDFGF', '红烧豆腐盖饭', 'GF', 16.00, NULL),
(129, 'RMSDJGF', '肉末酸豆角盖饭', 'GF', 18.00, NULL),
(130, 'XGRPGF', '香菇肉片盖饭', 'GF', 20.00, NULL),
(131, 'JCJDGF', '韭菜鸡蛋盖饭', 'GF', 16.00, NULL),
(132, 'XGYCGF', '香菇油菜盖饭', 'GF', 16.00, NULL),
(133, 'SLZGGF', '酸辣猪肝盖饭', 'GF', 18.00, NULL),
(134, 'SLJZGF', '酸辣鸡杂盖饭', 'GF', 20.00, NULL),
(135, 'CLTDSGF', '醋溜土豆丝盖饭', 'GF', 16.00, NULL),
(136, 'WPCCJDGF', '外婆菜炒鸡蛋盖饭', 'GF', 16.00, NULL),
(137, 'YZCF', '扬州炒饭', 'GF', 18.00, NULL),
(138, 'LZJDGF', '辣子鸡丁盖饭', 'GF', 18.00, NULL),
(139, 'KGCRGF', '苦瓜炒肉盖饭', 'GF', 18.00, NULL),
(140, 'DBNE', '大白牛二', 'BJ', 22.00, NULL),
(141, 'XBNE', '小白牛二', 'BJ', 12.00, NULL),
(142, 'HXEGTBNCN5', '红星二锅头八年陈酿500ML', 'BJ', 58.00, NULL),
(143, 'HXEGTBNCN2', '红星二锅头八年陈酿250ML', 'BJ', 32.00, NULL),
(144, 'BJEGTFP', '北京二锅头（方瓶）', 'BJ', 38.00, NULL),
(145, 'HX56DXBP', '红星56度（小扁瓶）', 'BJ', 10.00, NULL),
(146, 'XLJWZ', '小郎酒歪嘴', 'BJ', 22.00, NULL),
(147, 'LJ500', '郎酒500ML', 'BJ', 59.00, NULL),
(148, 'BJEGTLP', '北京二锅头蓝瓶', 'BJ', 42.00, NULL),
(149, 'YJU8', '燕京U8', 'PJ', 8.00, NULL),
(150, 'YJCS', '燕京纯生', 'PJ', 15.00, NULL),
(151, 'YJXP', '燕京鲜啤', 'PJ', 10.00, NULL),
(152, 'XHYC', '雪花勇闯', 'PJ', 8.00, NULL),
(153, 'BBY', '北冰洋', 'YP', 6.00, NULL),
(154, 'DY', '大窑', 'YP', 6.00, NULL),
(155, 'WLJ', '王老吉', 'YP', 6.00, NULL),
(156, 'DKL', '大可乐', 'YP', 12.00, NULL),
(157, 'DXB', '大雪碧', 'YP', 12.00, NULL),
(158, 'DGL', '大果粒', 'YP', 15.00, NULL),
(159, 'SMT', '酸梅汤', 'YP', 8.00, NULL),
(160, 'NFSQ', '农夫山泉', 'YP', 3.00, NULL),
(161, 'LMQPS', '蓝莓汽泡水', 'YP', 25.00, NULL),
(162, 'CMQPS', '草莓汽泡水', 'YP', 25.00, NULL),
(163, 'XXB', '小雪碧', 'YP', 4.00, NULL),
(164, 'XKL', '小可乐', 'YP', 4.00, NULL),
(165, 'JHC', '菊花茶', 'YP', 25.00, NULL),
(166, 'DXMJ', '稻香米浆', 'YP', 25.00, NULL),
(167, 'BBYXP', '北冰洋新品', 'YP', 8.00, NULL),
(168, 'YGL', '摇果粒', 'YP', 8.00, NULL),
(169, 'BHC', '冰红茶', 'YP', 5.00, NULL),
(170, 'QMLC', '青梅绿茶', 'YP', 5.00, NULL),
(171, 'DBH', '打包盒', 'QT', 1.00, NULL),
(172, 'CWF', '餐位费', 'QT', 1.00, NULL),
(173, 'CJYY', '差价1元', 'QT', 1.00, NULL),
(174, 'KYJRDBTZ', '烤鱼加热打包套装', 'QT', 10.00, NULL),
(175, 'HYXK', '活鱼现烤', 'MTTC', 128.00, NULL),
(176, 'ZXSRC', '尊享四人餐', 'MTTC', 482.00, NULL),
(177, 'KYTHDP', '鮰鱼特惠单品', 'MTTC', 128.00, NULL),
(178, 'MXW23RC', '毛血旺2-3人餐', 'MTTC', 150.00, NULL),
(179, 'NFCJ2RC', '农夫炒鸡2人餐', 'MTTC', 100.00, NULL),
(180, 'NWSRC', '牛蛙双人餐', 'MTTC', 174.00, NULL),
(181, 'KYRSC', '51烤鱼双人餐', 'MTTC', 200.00, NULL),
(182, 'KYSRC', '烤鱼双人餐', 'DYTC', 209.00, NULL),
(183, 'MXW23RTC', '毛血旺2-3人套餐', 'DYTC', 175.00, NULL),
(184, 'ZXSRC', '尊享4人餐', 'DYTC', 482.00, NULL),
(185, 'KYTHDP', '鮰鱼特惠单品', 'DYTC', 128.00, NULL),
(186, 'CJ2RC', '炒鸡2人餐', 'DYTC', 100.00, NULL),
(187, 'HXBF', '红糖冰粉', 'DYTC', 8.00, NULL),
(188, 'TJCZJ', '藤椒炒仔鸡套餐', 'DYTC', 45.00, NULL),
(189, 'TSKY34RC', '特色烤鱼3-4人餐', 'DYTC', 168.00, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `elegant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL DEFAULT '4',
  `category_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `tables`
--

INSERT INTO `tables` (`id`, `name`, `elegant_name`, `capacity`, `category_id`) VALUES
(8, '桌台1', '优雅桌台1', 4, 'DT'),
(9, '桌台2', '优雅桌台2', 4, 'DT'),
(10, '桌台3', '优雅桌台3', 4, 'DT'),
(11, '桌台5', '优雅桌台5', 4, 'DT'),
(12, '桌台6', '优雅桌台6', 4, 'DT'),
(13, '桌台8', '优雅桌台8', 4, 'DT'),
(14, '桌台9', '优雅桌台9', 4, 'DT'),
(15, '桌台10', '优雅桌台10', 4, 'DT'),
(16, '桌台11', '优雅桌台11', 4, 'DT'),
(17, '桌台12', '优雅桌台12', 4, 'DT'),
(18, '桌台13', '优雅桌台13', 4, 'DT'),
(19, '桌台14', '优雅桌台14', 4, 'DT'),
(20, '桌台15', '优雅桌台15', 4, 'DT'),
(21, '桌台16', '优雅桌台16', 4, 'DT'),
(22, '桌台17', '优雅桌台17', 4, 'DT'),
(23, '桌台18', '优雅桌台18', 4, 'DT'),
(24, '桌台19', '优雅桌台19', 4, 'DT'),
(25, '桌台20', '优雅桌台20', 4, 'DT');

-- --------------------------------------------------------

--
-- 表的结构 `table_categories`
--

DROP TABLE IF EXISTS `table_categories`;
CREATE TABLE IF NOT EXISTS `table_categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `table_categories`
--

INSERT INTO `table_categories` (`id`, `category_id`, `category_name`, `is_active`) VALUES
(1, 'DT', '大堂', 1),
(2, 'BX', '包厢', 1),
(3, 'HHBX', '豪华包厢', 1),
(4, 'YXQ', '吸烟区', 1),
(5, 'YHT', '宴会厅', 1),
(6, 'ZZCTQ', '自助餐厅区', 1),
(7, 'ZTQ', '主题区', 1),
(8, 'JGCZW', '观景窗座位', 1),
(9, 'KCZ', '快餐桌', 1);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) NOT NULL,
  `UserType` enum('customer','staff','cashier') NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
