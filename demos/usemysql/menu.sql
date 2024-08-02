-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2024-05-23 16:39:54
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuItemID` varchar(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `CategoryID` varchar(10) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=190 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`ID`, `MenuItemID`, `Name`, `CategoryID`, `Price`, `Description`) VALUES
(1, 'NFCJ', '农夫炒鸡', 'TJXP', '68.00', NULL),
(2, 'KGCD', '苦瓜炒蛋', 'TJXP', '24.00', NULL),
(3, 'XZPG', '香炸平菇', 'TJXP', '22.00', NULL),
(4, 'XLQJY', '香辣清江鱼', 'BDKY', '128.00', NULL),
(5, 'TZQJY', '藤椒清江鱼', 'BDKY', '128.00', NULL),
(6, 'SXQJY', '蒜香清江鱼', 'BDKY', '128.00', NULL),
(7, 'DCQJY', '豆豉清江鱼', 'BDKY', '128.00', NULL),
(8, 'MLQJY', '麻辣清江鱼', 'BDKY', '128.00', NULL),
(9, 'SCQJY', '酸菜清江鱼', 'BDKY', '128.00', NULL),
(10, 'JXQJY', '酱香清江鱼', 'BDKY', '128.00', NULL),
(11, 'XLCY', '香辣草鱼', 'BDKY', '98.00', NULL),
(12, 'TJCY', '藤椒草鱼', 'BDKY', '98.00', NULL),
(13, 'SXCY', '蒜香草鱼', 'BDKY', '98.00', NULL),
(14, 'DCCY', '豆豉草鱼', 'BDKY', '98.00', NULL),
(15, 'MLCY', '麻辣草鱼', 'BDKY', '98.00', NULL),
(16, 'SCCY', '酸菜草鱼', 'BDKY', '98.00', NULL),
(17, 'JXCY', '酱香草鱼', 'BDKY', '98.00', NULL),
(18, 'DP', '豆皮', 'KYPC', '10.00', NULL),
(19, 'OP', '藕片', 'KYPC', '10.00', NULL),
(20, 'YX', '鸭血', 'KYPC', '12.00', NULL),
(21, 'YSC', '圆生菜', 'KYPC', '10.00', NULL),
(22, 'KGF', '宽粉', 'KYPC', '10.00', NULL),
(23, 'ME', '木耳', 'KYPC', '12.00', NULL),
(24, 'QS', '青笋', 'KYPC', '10.00', NULL),
(25, 'TDP', '土豆片', 'KYPC', '10.00', NULL),
(26, 'JZG', '金针菇', 'KYPC', '12.00', NULL),
(27, 'WWC', '娃娃菜', 'KYPC', '10.00', NULL),
(28, 'QYDF', '千页豆腐', 'KYPC', '12.00', NULL),
(29, 'WCR', '午餐肉', 'KYPC', '16.00', NULL),
(30, 'YDF', '鱼豆腐', 'KYPC', '15.00', NULL),
(31, 'FZ', '腐竹', 'KYPC', '12.00', NULL),
(32, 'MYS', '魔芋丝', 'KYPC', '12.00', NULL),
(33, 'ZSNW', '紫苏牛蛙', 'JMRC', '98.00', NULL),
(34, 'GGYT', '干锅鸭头', 'JMRC', '68.00', NULL),
(35, 'CQMXW', '重庆毛血旺', 'JMRC', '68.00', NULL),
(36, 'SZY', '水煮鱼', 'JMRC', '128.00', NULL),
(37, 'STFN', '酸汤肥牛', 'JMRC', '68.00', NULL),
(38, 'HMYK', '黄焖鱼块', 'JMRC', '88.00', NULL),
(39, 'CXSCY', '川香酸菜鱼', 'JMRC', '88.00', NULL),
(40, 'CBLF', '川北凉粉', 'JMLP', '22.00', NULL),
(41, 'LBDDS', '凉拌豆腐丝', 'JMLP', '16.00', NULL),
(42, 'PHG', '拍黄瓜', 'JMLP', '16.00', NULL),
(43, 'KSJ', '口水鸡', 'JMLP', '38.00', NULL),
(44, 'YBTJZ', '盐帮土鸡爪', 'JMLP', '28.00', NULL),
(45, 'LBDPP', '凉菜大拼盘', 'JMLP', '18.00', NULL),
(46, 'XQFZ', '西芹腐竹', 'JMLP', '18.00', NULL),
(47, 'PDDF', '皮蛋豆腐', 'JMLP', '18.00', NULL),
(48, 'TJCZJ', '藤椒炒仔鸡', 'JDRC', '38.00', NULL),
(49, 'XCHNR', '小炒黄牛肉', 'JDRC', '58.00', NULL),
(50, 'SLJZ', '酸辣鸡杂', 'JDRC', '42.00', NULL),
(51, 'XHSNR', '西红柿牛腩', 'JDRC', '58.00', NULL),
(52, 'LWYS', '腊味烟笋', 'JDRC', '38.00', NULL),
(53, 'TLJCHZR', '土辣椒炒黑猪肉', 'JDRC', '38.00', NULL),
(54, 'GGLRG', '干锅鹿茸菇', 'JDRC', '42.00', NULL),
(55, 'GGFC', '干锅肥肠', 'JDRC', '58.00', NULL),
(56, 'JYDX', '椒盐大虾', 'JDRC', '88.00', NULL),
(57, 'SZNR', '水煮牛肉', 'JDRC', '58.00', NULL),
(58, 'TJY', '藤椒鱼', 'JDRC', '88.00', NULL),
(59, 'CTSZR', '传统水煮肉', 'JDRC', '42.00', NULL),
(60, 'WNCCJD', '外婆菜炒鸡蛋', 'JDRC', '26.00', NULL),
(61, 'XCJDF', '乡村煎豆腐', 'JDRC', '28.00', NULL),
(62, 'CQLZJ', '重庆辣子鸡', 'JDRC', '68.00', NULL),
(63, 'HGR', '回锅肉', 'JDRC', '38.00', NULL),
(64, 'YGXR', '腰果虾仁', 'JDRC', '68.00', NULL),
(65, 'MLXG', '麻辣香锅', 'JDRC', '68.00', NULL),
(66, 'CDJSQZ', '长豆角烧茄子', 'JDRC', '28.00', NULL),
(67, 'MXR', '木须肉', 'JDRC', '28.00', NULL),
(68, 'XCOS', '小炒藕丝', 'JDRC', '26.00', NULL),
(69, 'SLZG', '酸辣猪肝', 'JDRC', '38.00', NULL),
(70, 'GBJD', '宫保鸡丁', 'JDRC', '28.00', NULL),
(71, 'GZXSR', '干炸小酥肉', 'JDRC', '38.00', NULL),
(72, 'JJRS', '京酱肉丝', 'JDRC', '32.00', NULL),
(73, 'MPDF', '麻婆豆腐', 'JDRC', '18.00', NULL),
(74, 'YXRS', '鱼香肉丝', 'JDRC', '32.00', NULL),
(75, 'TCLJ', '糖醋里脊', 'JDRC', '38.00', NULL),
(76, 'XCBDS', '湘炒扁豆丝', 'JDRC', '28.00', NULL),
(77, 'GGTDP', '干锅土豆片', 'JDRC', '28.00', NULL),
(78, 'GGYJCH', '干锅有机菜花', 'JDRC', '26.00', NULL),
(79, 'GGQYDF', '干锅千页豆腐', 'JDRC', '28.00', NULL),
(80, 'MESY', '木耳山药', 'JDRC', '28.00', NULL),
(81, 'CHC', '炒合菜', 'JDRC', '26.00', NULL),
(82, 'XGRP', '香菇肉片', 'JDRC', '36.00', NULL),
(83, 'CLTDS', '醋溜土豆丝', 'JDRC', '18.00', NULL),
(84, 'XHSCJD', '西红柿鸡蛋', 'JDRC', '22.00', NULL),
(85, 'XCZG', '小炒猪肝', 'JDRC', '38.00', NULL),
(86, 'XCJZ', '小炒鸡杂', 'JDRC', '42.00', NULL),
(87, 'XQRS', '香芹肉丝', 'JDRC', '32.00', NULL),
(88, 'JJRS', '尖椒肉丝', 'JDRC', '32.00', NULL),
(89, 'JJCJD', '尖椒炒鸡蛋', 'JDRC', '22.00', NULL),
(90, 'HSDF', '红烧豆腐', 'JDRC', '18.00', NULL),
(91, 'XGYC', '香菇油菜', 'JDRC', '26.00', NULL),
(92, 'DSX', '地三鲜', 'JDRC', '26.00', NULL),
(93, 'JJDP', '尖椒豆皮', 'JDRC', '26.00', NULL),
(94, 'QCYMC', '清炒油麦菜', 'JDRC', '20.00', NULL),
(95, 'DCCJD', '大葱炒鸡蛋', 'JDRC', '22.00', NULL),
(96, 'CHDB', '葱花蛋饼', 'JDRC', '22.00', NULL),
(97, 'KGCR', '苦瓜炒肉', 'JDRC', '26.00', NULL),
(98, 'DHC', '蛋炒饭', 'ZSTG', '15.00', NULL),
(99, 'GDT', '疙瘩汤', 'ZSTG', '22.00', NULL),
(100, 'JYCF', '酱油炒饭', 'ZSTG', '16.00', NULL),
(101, 'QCDFT', '青菜豆腐汤', 'ZSTG', '18.00', NULL),
(102, 'CQXM', '重庆小面', 'ZSTG', '15.00', NULL),
(103, 'NGB', '南瓜饼', 'ZSTG', '16.00', NULL),
(104, 'QTM', '清汤面', 'ZSTG', '15.00', NULL),
(105, 'HTZB', '红糖糍粑', 'ZSTG', '18.00', NULL),
(106, 'HTBF', '红糖冰粉', 'ZSTG', '8.00', NULL),
(107, 'LZTY', '醪糟汤圆', 'ZSTG', '8.00', NULL),
(108, 'MF', '米饭', 'ZSTG', '3.00', NULL),
(109, 'DPMF', '大盆米饭', 'ZSTG', '10.00', NULL),
(110, 'SLT', '酸辣汤', 'ZSTG', '22.00', NULL),
(111, 'GBJDGF', '宫保鸡丁盖饭', 'GF', '18.00', NULL),
(112, 'YXRSGF', '鱼香肉丝盖饭', 'GF', '18.00', NULL),
(113, 'NJXCRGF', '农家小炒肉盖饭', 'GF', '25.00', NULL),
(114, 'MPFGF', '麻婆豆腐盖饭', 'GF', '16.00', NULL),
(115, 'XCZGGF', '小炒猪肝盖饭', 'GF', '18.00', NULL),
(116, 'XCXGGF', '小炒香干盖饭', 'GF', '16.00', NULL),
(117, 'XCJZGF', '小炒鸡杂盖饭', 'GF', '20.00', NULL),
(118, 'SSBCGF', '手撕包菜盖饭', 'GF', '16.00', NULL),
(119, 'MSRGF', '木须肉盖饭', 'GF', '18.00', NULL),
(120, 'SLTDSGF', '酸辣土豆丝盖饭', 'GF', '15.00', NULL),
(121, 'XHSJDGF', '西红柿鸡蛋盖饭', 'GF', '16.00', NULL),
(122, 'HGRGF', '回锅肉盖饭', 'GF', '25.00', NULL),
(123, 'XQRSGF', '香芹肉丝盖饭', 'GF', '20.00', NULL),
(124, 'JJRSGF', '尖椒肉丝盖饭', 'GF', '20.00', NULL),
(125, 'DSXGF', '地三鲜盖饭', 'GF', '18.00', NULL),
(126, 'JJJDGF', '尖椒鸡蛋盖饭', 'GF', '16.00', NULL),
(127, 'JJDPGF', '尖椒豆皮盖饭', 'GF', '16.00', NULL),
(128, 'HSDFGF', '红烧豆腐盖饭', 'GF', '16.00', NULL),
(129, 'RMSDJGF', '肉末酸豆角盖饭', 'GF', '18.00', NULL),
(130, 'XGRPGF', '香菇肉片盖饭', 'GF', '20.00', NULL),
(131, 'JCJDGF', '韭菜鸡蛋盖饭', 'GF', '16.00', NULL),
(132, 'XGYCGF', '香菇油菜盖饭', 'GF', '16.00', NULL),
(133, 'SLZGGF', '酸辣猪肝盖饭', 'GF', '18.00', NULL),
(134, 'SLJZGF', '酸辣鸡杂盖饭', 'GF', '20.00', NULL),
(135, 'CLTDSGF', '醋溜土豆丝盖饭', 'GF', '16.00', NULL),
(136, 'WPCCJDGF', '外婆菜炒鸡蛋盖饭', 'GF', '16.00', NULL),
(137, 'YZCF', '扬州炒饭', 'GF', '18.00', NULL),
(138, 'LZJDGF', '辣子鸡丁盖饭', 'GF', '18.00', NULL),
(139, 'KGCRGF', '苦瓜炒肉盖饭', 'GF', '18.00', NULL),
(140, 'DBNE', '大白牛二', 'BJ', '22.00', NULL),
(141, 'XBNE', '小白牛二', 'BJ', '12.00', NULL),
(142, 'HXEGTBNCN5', '红星二锅头八年陈酿500ML', 'BJ', '58.00', NULL),
(143, 'HXEGTBNCN2', '红星二锅头八年陈酿250ML', 'BJ', '32.00', NULL),
(144, 'BJEGTFP', '北京二锅头（方瓶）', 'BJ', '38.00', NULL),
(145, 'HX56DXBP', '红星56度（小扁瓶）', 'BJ', '10.00', NULL),
(146, 'XLJWZ', '小郎酒歪嘴', 'BJ', '22.00', NULL),
(147, 'LJ500', '郎酒500ML', 'BJ', '59.00', NULL),
(148, 'BJEGTLP', '北京二锅头蓝瓶', 'BJ', '42.00', NULL),
(149, 'YJU8', '燕京U8', 'PJ', '8.00', NULL),
(150, 'YJCS', '燕京纯生', 'PJ', '15.00', NULL),
(151, 'YJXP', '燕京鲜啤', 'PJ', '10.00', NULL),
(152, 'XHYC', '雪花勇闯', 'PJ', '8.00', NULL),
(153, 'BBY', '北冰洋', 'YP', '6.00', NULL),
(154, 'DY', '大窑', 'YP', '6.00', NULL),
(155, 'WLJ', '王老吉', 'YP', '6.00', NULL),
(156, 'DKL', '大可乐', 'YP', '12.00', NULL),
(157, 'DXB', '大雪碧', 'YP', '12.00', NULL),
(158, 'DGL', '大果粒', 'YP', '15.00', NULL),
(159, 'SMT', '酸梅汤', 'YP', '8.00', NULL),
(160, 'NFSQ', '农夫山泉', 'YP', '3.00', NULL),
(161, 'LMQPS', '蓝莓汽泡水', 'YP', '25.00', NULL),
(162, 'CMQPS', '草莓汽泡水', 'YP', '25.00', NULL),
(163, 'XXB', '小雪碧', 'YP', '4.00', NULL),
(164, 'XKL', '小可乐', 'YP', '4.00', NULL),
(165, 'JHC', '菊花茶', 'YP', '25.00', NULL),
(166, 'DXMJ', '稻香米浆', 'YP', '25.00', NULL),
(167, 'BBYXP', '北冰洋新品', 'YP', '8.00', NULL),
(168, 'YGL', '摇果粒', 'YP', '8.00', NULL),
(169, 'BHC', '冰红茶', 'YP', '5.00', NULL),
(170, 'QMLC', '青梅绿茶', 'YP', '5.00', NULL),
(171, 'DBH', '打包盒', 'QT', '1.00', NULL),
(172, 'CWF', '餐位费', 'QT', '1.00', NULL),
(173, 'CJYY', '差价1元', 'QT', '1.00', NULL),
(174, 'KYJRDBTZ', '烤鱼加热打包套装', 'QT', '10.00', NULL),
(175, 'HYXK', '活鱼现烤', 'MTTC', '128.00', NULL),
(176, 'ZXSRC', '尊享四人餐', 'MTTC', '482.00', NULL),
(177, 'KYTHDP', '鮰鱼特惠单品', 'MTTC', '128.00', NULL),
(178, 'MXW23RC', '毛血旺2-3人餐', 'MTTC', '150.00', NULL),
(179, 'NFCJ2RC', '农夫炒鸡2人餐', 'MTTC', '100.00', NULL),
(180, 'NWSRC', '牛蛙双人餐', 'MTTC', '174.00', NULL),
(181, 'KYRSC', '51烤鱼双人餐', 'MTTC', '200.00', NULL),
(182, 'KYSRC', '烤鱼双人餐', 'DYTC', '209.00', NULL),
(183, 'MXW23RTC', '毛血旺2-3人套餐', 'DYTC', '175.00', NULL),
(184, 'ZXSRC', '尊享4人餐', 'DYTC', '482.00', NULL),
(185, 'KYTHDP', '鮰鱼特惠单品', 'DYTC', '128.00', NULL),
(186, 'CJ2RC', '炒鸡2人餐', 'DYTC', '100.00', NULL),
(187, 'HXBF', '红糖冰粉', 'DYTC', '8.00', NULL),
(188, 'TJCZJ', '藤椒炒仔鸡套餐', 'DYTC', '45.00', NULL),
(189, 'TSKY34RC', '特色烤鱼3-4人餐', 'DYTC', '168.00', NULL);

--
-- 限制导出的表
--

--
-- 限制表 `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
