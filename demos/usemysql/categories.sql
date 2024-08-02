-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2024-05-23 08:08:13
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
-- 表的结构 `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryID` char(10) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CategoryID` (`CategoryID`),
  KEY `CategoryName` (`CategoryName`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=17 ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
