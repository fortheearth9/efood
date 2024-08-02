-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2024-05-23 16:40:39
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
-- 表的结构 `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `elegant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT '4',
  `category_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=26 ;

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

--
-- 限制导出的表
--

--
-- 限制表 `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `table_categories` (`category_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
