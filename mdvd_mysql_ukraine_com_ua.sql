-- phpMyAdmin SQL Dump
-- version 4.0.10.12
-- http://www.phpmyadmin.net
--
-- Хост: mdvd.mysql.ukraine.com.ua
-- Час створення: Трв 03 2016 р., 10:40
-- Версія сервера: 5.6.27-75.0-log
-- Версія PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `mdvd_db`
--

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_address`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mdvdoc_address`
--

INSERT INTO `mdvdoc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'ловиа', 'лцаці', '', 'Київ', '', 'Київ', '', 220, 3491, '');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_affiliate`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_api`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mdvdoc_api`
--

INSERT INTO `mdvdoc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'XjGDJx6tUcX992HJfUNVUa2ltoULOp9QhlyUymLw2MGymZcKxbNCdDPwKxhGqhuPT4CODLMwH9Uf1Ydm0zK8l2FAVnllWFBbprRxRld51u2s12mUUDhTT8CYwKnig1rhsX8fwbKXiyhgoHWTOIdp9Gbo5UCmxS58kBujYKSlQH8dOc8ftlXxyjXLCiOekxe6YBkoIjVnUrwseYUg4HN3j3E9qEkWu6mmCfWeYlpEDC5Px3mxTPPtiW314jeHlLEZ', 1, '2016-04-21 10:34:40', '2016-04-21 10:34:40');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_api_ip`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_api_session`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_attribute`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп даних таблиці `mdvdoc_attribute`
--

INSERT INTO `mdvdoc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_attribute_description`
--

INSERT INTO `mdvdoc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `mdvdoc_attribute_group`
--

INSERT INTO `mdvdoc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_attribute_group_description`
--

INSERT INTO `mdvdoc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(4, 1, 'Technical'),
(3, 3, 'Пам''ять'),
(4, 2, 'Technical'),
(5, 3, 'Материнська плата'),
(6, 3, 'Процесор'),
(3, 1, 'Память'),
(4, 3, 'Technical'),
(5, 1, 'Материнская плата'),
(6, 1, 'Процессор'),
(5, 2, 'Motherboard'),
(3, 2, 'Memory'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_banner`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `mdvdoc_banner`
--

INSERT INTO `mdvdoc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'Продукція HP', 1),
(7, 'Слайдшоу на головній', 0),
(8, 'Виробники', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_banner_image`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

--
-- Дамп даних таблиці `mdvdoc_banner_image`
--

INSERT INTO `mdvdoc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(116, 7, 'index.php?route=common/home', 'catalog/demo/banners/rotator4.jpg', 0),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(112, 8, '', 'catalog/demo/manufacturer/8_0.jpg', 0),
(111, 8, '', 'catalog/demo/manufacturer/7_0.jpg', 0),
(110, 8, '', 'catalog/demo/manufacturer/19_0.jpg', 0),
(109, 8, '', 'catalog/demo/manufacturer/6_0.jpg', 0),
(108, 8, '', 'catalog/demo/manufacturer/5_0.jpg', 0),
(107, 8, '', 'catalog/demo/manufacturer/4_0.jpg', 0),
(106, 8, '', 'catalog/demo/manufacturer/3_0.jpg', 0),
(117, 7, 'index.php?route=common/home', 'catalog/demo/banners/rotator5.jpg', 0),
(105, 8, '', 'catalog/demo/manufacturer/2_0.jpg', 0),
(104, 8, '', 'catalog/demo/manufacturer/19_0.jpg', 0),
(115, 7, 'index.php?route=common/home', 'catalog/demo/banners/rotator3.jpg', 0),
(114, 7, 'index.php?route=common/home', 'catalog/demo/banners/rotator1.jpg', 0),
(113, 7, 'index.php?route=common/home', 'catalog/demo/banners/rotator2.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_banner_image_description`
--

INSERT INTO `mdvdoc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(117, 3, 7, 'МДВД'),
(87, 1, 6, 'HP Banner'),
(111, 3, 8, 'Dell'),
(111, 2, 8, 'Dell'),
(111, 1, 8, 'Dell'),
(110, 3, 8, 'Harley Davidson'),
(117, 2, 7, 'MDVD'),
(110, 2, 8, 'Harley Davidson'),
(110, 1, 8, 'Harley Davidson'),
(109, 3, 8, 'Canon'),
(117, 1, 7, 'МДВД'),
(87, 2, 6, 'HP Banner'),
(109, 2, 8, 'Canon'),
(109, 1, 8, 'Canon'),
(108, 3, 8, 'Burger King'),
(108, 2, 8, 'Burger King'),
(116, 3, 7, 'МДВД'),
(108, 1, 8, 'Burger King'),
(107, 3, 8, 'Coca Cola'),
(107, 2, 8, 'Coca Cola'),
(116, 2, 7, 'MDVD'),
(87, 3, 6, 'HP Banner'),
(107, 1, 8, 'Coca Cola'),
(106, 3, 8, 'Sony'),
(106, 2, 8, 'Sony'),
(106, 1, 8, 'Sony'),
(105, 3, 8, 'RedBull'),
(116, 1, 7, 'МДВД'),
(105, 2, 8, 'RedBull'),
(105, 1, 8, 'RedBull'),
(104, 3, 8, 'NFL'),
(104, 2, 8, 'NFL'),
(104, 1, 8, 'NFL'),
(115, 3, 7, 'МДВД'),
(115, 2, 7, 'MDVD'),
(115, 1, 7, 'МДВД'),
(114, 3, 7, 'МДВД'),
(114, 2, 7, 'MDVD'),
(114, 1, 7, 'МДВД'),
(113, 3, 7, 'МДВД'),
(113, 2, 7, 'MDVD'),
(113, 1, 7, 'МДВД'),
(112, 1, 8, 'Disney'),
(112, 2, 8, 'Disney'),
(112, 3, 8, 'Disney');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_cart`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_category`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Дамп даних таблиці `mdvdoc_category`
--

INSERT INTO `mdvdoc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-07-16 02:14:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_category_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_category_description`
--

INSERT INTO `mdvdoc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Мониторы', '', '', '', '', ''),
(29, 2, 'Mice and Trackballs', '', '', '', '', ''),
(27, 1, 'Mac', '', '', '', '', ''),
(26, 1, 'PC', '', '', '', '', ''),
(20, 2, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Example of category description', '', '', ''),
(35, 1, 'test 1', '', '', '', '', ''),
(36, 1, 'test 2', '', '', '', '', ''),
(37, 1, 'test 5', '', '', '', '', ''),
(38, 1, 'test 4', '', '', '', '', ''),
(39, 1, 'test 6', '', '', '', '', ''),
(40, 1, 'test 7', '', '', '', '', ''),
(41, 1, 'test 8', '', '', '', '', ''),
(42, 1, 'test 9', '', '', '', '', ''),
(43, 1, 'test 11', '', '', '', '', ''),
(34, 2, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(18, 1, 'Ноутбуки', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(44, 1, 'test 12', '', '', '', '', ''),
(45, 1, 'Windows', '', '', '', '', ''),
(46, 1, 'Macs', '', '', '', '', ''),
(47, 1, 'test 15', '', '', '', '', ''),
(48, 1, 'test 16', '', '', '', '', ''),
(49, 1, 'test 17', '', '', '', '', ''),
(50, 1, 'test 18', '', '', '', '', ''),
(51, 1, 'test 19', '', '', '', '', ''),
(52, 1, 'test 20', '', '', '', '', ''),
(53, 1, 'test 21', '', '', '', '', ''),
(54, 1, 'test 22', '', '', '', '', ''),
(55, 1, 'test 23', '', '', '', '', ''),
(56, 1, 'test 24', '', '', '', '', ''),
(58, 1, 'test 25', '', '', '', '', ''),
(28, 3, 'Монітори', '', '', '', '', ''),
(33, 3, 'Камери', '', '', '', '', ''),
(32, 3, 'Веб-камери', '', '', '', '', ''),
(31, 3, 'Сканери', '', '', '', '', ''),
(30, 3, 'Принтери', '', '', '', '', ''),
(29, 3, 'Миші', '', '', '', '', ''),
(27, 2, 'Mac', '', '', '', '', ''),
(26, 2, 'PC', '', '', '', '', ''),
(17, 3, 'Програмне забезпечення', '', '', '', '', ''),
(25, 3, 'Компоненти', '', '', '', '', ''),
(24, 3, 'Телефони и PDA', '', '', '', '', ''),
(20, 3, 'Комп''ютери', '&lt;p&gt;\r\n	Приклад тексту в опису категорії&lt;/p&gt;\r\n', 'H1 заголовок Комп''ютерів', '', '', ''),
(35, 2, 'test 1', '', '', '', '', ''),
(36, 2, 'test 2', '', '', '', '', ''),
(37, 2, 'test 5', '', '', '', '', ''),
(38, 2, 'test 4', '', '', '', '', ''),
(39, 2, 'test 6', '', '', '', '', ''),
(40, 2, 'test 7', '', '', '', '', ''),
(41, 2, 'test 8', '', '', '', '', ''),
(42, 2, 'test 9', '', '', '', '', ''),
(43, 2, 'test 11', '', '', '', '', ''),
(34, 3, 'MP3 Плеєри', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(18, 2, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(44, 2, 'test 12', '', '', '', '', ''),
(45, 2, 'Windows', '', '', '', '', ''),
(46, 2, 'Macs', '', '', '', '', ''),
(47, 2, 'test 15', '', '', '', '', ''),
(48, 2, 'test 16', '', '', '', '', ''),
(49, 2, 'test 17', '', '', '', '', ''),
(50, 2, 'test 18', '', '', '', '', ''),
(51, 2, 'test 19', '', '', '', '', ''),
(52, 2, 'test 20', '', '', '', '', ''),
(53, 2, 'test 21', '', '', '', '', ''),
(54, 2, 'test 22', '', '', '', '', ''),
(55, 2, 'test 23', '', '', '', '', ''),
(56, 2, 'test 24', '', '', '', '', ''),
(57, 3, 'Планшети', '', '', '', '', ''),
(58, 2, 'test 25', '', '', '', '', ''),
(28, 2, 'Monitors', '', '', '', '', ''),
(33, 1, 'Камеры', '', '', '', '', ''),
(32, 1, 'Веб-камеры', '', '', '', '', ''),
(31, 1, 'Сканеры', '', '', '', '', ''),
(30, 1, 'Принтеры', '', '', '', '', ''),
(29, 1, 'Мышки', '', '', '', '', ''),
(27, 3, 'Mac', '', '', '', '', ''),
(26, 3, 'PC', '', '', '', '', ''),
(17, 1, 'Програмное обеспечение', '', '', '', '', ''),
(25, 1, 'Компоненты', '', '', '', '', ''),
(24, 1, 'Телефоны и PDA', '', '', '', '', ''),
(20, 1, 'Компьютеры', '&lt;p&gt;\r\n	Пример текста в описания категории&lt;/p&gt;\r\n', 'H1 заголовок Комьпютеров', '', '', ''),
(35, 3, 'test 1', '', '', '', '', ''),
(36, 3, 'test 2', '', '', '', '', ''),
(37, 3, 'test 5', '', '', '', '', ''),
(38, 3, 'test 4', '', '', '', '', ''),
(39, 3, 'test 6', '', '', '', '', ''),
(40, 3, 'test 7', '', '', '', '', ''),
(41, 3, 'test 8', '', '', '', '', ''),
(42, 3, 'test 9', '', '', '', '', ''),
(43, 3, 'test 11', '', '', '', '', ''),
(34, 1, 'MP3 Плееры', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(18, 3, 'Ноутбуки', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', '', ''),
(44, 3, 'test 12', '', '', '', '', ''),
(45, 3, 'Windows', '', '', '', '', ''),
(46, 3, 'Macs', '', '', '', '', ''),
(47, 3, 'test 15', '', '', '', '', ''),
(48, 3, 'test 16', '', '', '', '', ''),
(49, 3, 'test 17', '', '', '', '', ''),
(50, 3, 'test 18', '', '', '', '', ''),
(51, 3, 'test 19', '', '', '', '', ''),
(52, 3, 'test 20', '', '', '', '', ''),
(53, 3, 'test 21', '', '', '', '', ''),
(54, 3, 'test 22', '', '', '', '', ''),
(55, 3, 'test 23', '', '', '', '', ''),
(56, 3, 'test 24', '', '', '', '', ''),
(57, 1, 'Планшеты', '', '', '', '', ''),
(58, 3, 'test 25', '', '', '', '', ''),
(25, 2, 'Components', '', '', '', '', ''),
(57, 2, 'Tablets', '', '', '', '', ''),
(17, 2, 'Software', '', '', '', '', ''),
(24, 2, 'Phones &amp; PDAs', '', '', '', '', ''),
(33, 2, 'Cameras', '', '', '', '', ''),
(32, 2, 'Web Cameras', '', '', '', '', ''),
(30, 2, 'Printers', '', '', '', '', ''),
(31, 2, 'Scanners', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_category_filter`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_category_path`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_category_path`
--

INSERT INTO `mdvdoc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_category_to_store`
--

INSERT INTO `mdvdoc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_country`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Дамп даних таблиці `mdvdoc_country`
--

INSERT INTO `mdvdoc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Афганістан', 'AF', 'AFG', '', 0, 1),
(2, 'Албанія', 'AL', 'ALB', '', 0, 1),
(3, 'Алжир', 'DZ', 'DZA', '', 0, 1),
(4, 'Східне Самоа', 'AS', 'ASM', '', 0, 1),
(5, 'Андорра', 'AD', 'AND', '', 0, 1),
(6, 'Ангола', 'AO', 'AGO', '', 0, 1),
(7, 'Ангілья', 'AI', 'AIA', '', 0, 1),
(8, 'Антарктида', 'AQ', 'ATA', '', 0, 1),
(9, 'Антигуа і Барбуда', 'AG', 'ATG', '', 0, 1),
(10, 'Аргентина', 'AR', 'ARG', '', 0, 1),
(11, 'Вірменія', 'AM', 'ARM', '', 0, 1),
(12, 'Аруба', 'AW', 'ABW', '', 0, 1),
(13, 'Австралія', 'AU', 'AUS', '', 0, 1),
(14, 'Австрія', 'AT', 'AUT', '', 0, 1),
(15, 'Азербайджан', 'AZ', 'AZE', '', 0, 1),
(16, 'Багамські острови', 'BS', 'BHS', '', 0, 1),
(17, 'Бахрейн', 'BH', 'BHR', '', 0, 1),
(18, 'Бангладеш', 'BD', 'BGD', '', 0, 1),
(19, 'Барбадос', 'BB', 'BRB', '', 0, 1),
(20, 'Білорусія (Білорусь)', 'BY', 'BLR', '', 0, 1),
(21, 'Бельгія', 'BE', 'BEL', '', 0, 1),
(22, 'Беліз', 'BZ', 'BLZ', '', 0, 1),
(23, 'Бенін', 'BJ', 'BEN', '', 0, 1),
(24, 'Бермудські острови', 'BM', 'BMU', '', 0, 1),
(25, 'Бутан', 'BT', 'BTN', '', 0, 1),
(26, 'Болівія', 'BO', 'BOL', '', 0, 1),
(27, 'Боснія і Герцеговина', 'BA', 'BIH', '', 0, 1),
(28, 'Ботсвана', 'BW', 'BWA', '', 0, 1),
(29, 'Острів Буве', 'BV', 'BVT', '', 0, 1),
(30, 'Бразилія', 'BR', 'BRA', '', 0, 1),
(31, 'Британська територія в Індійському океані', 'IO', 'IOT', '', 0, 1),
(32, 'Бруней', 'BN', 'BRN', '', 0, 1),
(33, 'Болгарія', 'BG', 'BGR', '', 0, 1),
(34, 'Буркіна-Фасо', 'BF', 'BFA', '', 0, 1),
(35, 'Бурунді', 'BI', 'BDI', '', 0, 1),
(36, 'Камбоджа', 'KH', 'KHM', '', 0, 1),
(37, 'Камерун', 'CM', 'CMR', '', 0, 1),
(38, 'Канада', 'CA', 'CAN', '', 0, 1),
(39, 'Кабо-Верде', 'CV', 'CPV', '', 0, 1),
(40, 'Кайманові острови', 'KY', 'CYM', '', 0, 1),
(41, 'Центрально-Африканська Республіка', 'CF', 'CAF', '', 0, 1),
(42, 'Чад', 'TD', 'TCD', '', 0, 1),
(43, 'Чилі', 'CL', 'CHL', '', 0, 1),
(44, 'Китайська Народна Республіка', 'CN', 'CHN', '', 0, 1),
(45, 'Острів Різдва', 'CX', 'CXR', '', 0, 1),
(46, 'Кокосові острови', 'CC', 'CCK', '', 0, 1),
(47, 'Колумбія', 'CO', 'COL', '', 0, 1),
(48, 'Коморські острови', 'KM', 'COM', '', 0, 1),
(49, 'Конго', 'CG', 'COG', '', 0, 1),
(50, 'Острови Кука', 'CK', 'COK', '', 0, 1),
(51, 'Коста-Ріка', 'CR', 'CRI', '', 0, 1),
(52, 'Кот д''Івуар', 'CI', 'CIV', '', 0, 1),
(53, 'Хорватія', 'HR', 'HRV', '', 0, 1),
(54, 'Куба', 'CU', 'CUB', '', 0, 1),
(55, 'Кіпр', 'CY', 'CYP', '', 0, 1),
(56, 'Чехія', 'CZ', 'CZE', '', 0, 1),
(57, 'Данія', 'DK', 'DNK', '', 0, 1),
(58, 'Джібуті', 'DJ', 'DJI', '', 0, 1),
(59, 'Домініка', 'DM', 'DMA', '', 0, 1),
(60, 'Домініканська Республіка', 'DO', 'DOM', '', 0, 1),
(61, 'Східний Тимор', 'TP', 'TMP', '', 0, 1),
(62, 'Еквадор', 'EC', 'ECU', '', 0, 1),
(63, 'Єгипет', 'EG', 'EGY', '', 0, 1),
(64, 'Сальвадор', 'SV', 'SLV', '', 0, 1),
(65, 'Екваторіальна Гвінея', 'GQ', 'GNQ', '', 0, 1),
(66, 'Еритрея', 'ER', 'ERI', '', 0, 1),
(67, 'Естонія', 'EE', 'EST', '', 0, 1),
(68, 'Ефіопія', 'ET', 'ETH', '', 0, 1),
(69, 'Фолклендські (Мальвінські) острови', 'FK', 'FLK', '', 0, 1),
(70, 'Фарерські острови', 'FO', 'FRO', '', 0, 1),
(71, 'Фіджі', 'FJ', 'FJI', '', 0, 1),
(72, 'Фінляндія', 'FI', 'FIN', '', 0, 1),
(73, 'Франція', 'FR', 'FRA', '', 0, 1),
(74, 'Франція, Метрополія', 'FX', 'FXX', '', 0, 1),
(75, 'Французька Гвіана', 'GF', 'GUF', '', 0, 1),
(76, 'Французька Полінезія', 'PF', 'PYF', '', 0, 1),
(77, 'Французькі Південні території', 'TF', 'ATF', '', 0, 1),
(78, 'Габон', 'GA', 'GAB', '', 0, 1),
(79, 'Гамбія', 'GM', 'GMB', '', 0, 1),
(80, 'Грузія', 'GE', 'GEO', '', 0, 1),
(81, 'Німеччина', 'DE', 'DEU', '{company}  r  n {firstname} {lastname}  r  n {address_1}  r  n {address_2}  r  n {postcode} {city}  r  n {country} ', 0, 1),
(82, 'Гана', 'GH', 'GHA', '', 0, 1),
(83, 'Гібралтар', 'GI', 'GIB', '', 0, 1),
(84, 'Греція', 'GR', 'GRC', '', 0, 1),
(85, 'Гренландія', 'GL', 'GRL', '', 0, 1),
(86, 'Гренада', 'GD', 'GRD', '', 0, 1),
(87, 'Гваделупа', 'GP', 'GLP', '', 0, 1),
(88, 'Гуам', 'GU', 'GUM', '', 0, 1),
(89, 'Гватемала', 'GT', 'GTM', '', 0, 1),
(90, 'Гвінея', 'GN', 'GIN', '', 0, 1),
(91, 'Гвінея-Бісау', 'GW', 'GNB', '', 0, 1),
(92, 'Гайана', 'GY', 'GUY', '', 0, 1),
(93, 'Гаїті', 'HT', 'HTI', '', 0, 1),
(94, 'Херд і Макдональд, острови', 'HM', 'HMD', '', 0, 1),
(95, 'Гондурас', 'HN', 'HND', '', 0, 1),
(96, 'Гонконг', 'HK', 'HKG', '', 0, 1),
(97, 'Угорщина', 'HU', 'HUN', '', 0, 1),
(98, 'Ісландія', 'IS', 'ISL', '', 0, 1),
(99, 'Індія', 'IN', 'IND', '', 0, 1),
(100, 'Індонезія', 'ID', 'IDN', '', 0, 1),
(101, 'Іран', 'IR', 'IRN', '', 0, 1),
(102, 'Ірак', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ірландія', 'IE', 'IRL', '', 0, 1),
(104, 'Ізраїль', 'IL', 'ISR', '', 0, 1),
(105, 'Італія', 'IT', 'ITA', '', 0, 1),
(106, 'Ямайка', 'JM', 'JAM', '', 0, 1),
(107, 'Японія', 'JP', 'JPN', '', 0, 1),
(108, 'Йорданія', 'JO', 'JOR', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(110, 'Кенія', 'KE', 'KEN', '', 0, 1),
(111, 'Кірібаті', 'KI', 'KIR', '', 0, 1),
(112, 'Корейська Народно-Демократична Республіка', 'KP', 'PRK', '', 0, 1),
(113, 'Республіка Корея', 'KR', 'KOR', '', 0, 1),
(114, 'Кувейт', 'KW', 'KWT', '', 0, 1),
(115, 'Киргизія (Киргизстан)', 'KG', 'KGZ', '', 0, 1),
(116, 'Лаос', 'LA', 'LAO', '', 0, 1),
(117, 'Латвія', 'LV', 'LVA', '', 0, 1),
(118, 'Ліван', 'LB', 'LBN', '', 0, 1),
(119, 'Лесото', 'LS', 'LSO', '', 0, 1),
(120, 'Ліберія', 'LR', 'LBR', '', 0, 1),
(121, 'Лівія', 'LY', 'LBY', '', 0, 1),
(122, 'Ліхтенштейн', 'LI', 'LIE', '', 0, 1),
(123, 'Литва', 'LT', 'LTU', '', 0, 1),
(124, 'Люксембург', 'LU', 'LUX', '', 0, 1),
(125, 'Макао', 'MO', 'MAC', '', 0, 1),
(126, 'Македонія', 'MK', 'MKD', '', 0, 1),
(127, 'Мадагаскар', 'MG', 'MDG', '', 0, 1),
(128, 'Малаві', 'MW', 'MWI', '', 0, 1),
(129, 'Малайзія', 'MY', 'MYS', '', 0, 1),
(130, 'Мальдіви', 'MV', 'MDV', '', 0, 1),
(131, 'Малі', 'ML', 'MLI', '', 0, 1),
(132, 'Мальта', 'MT', 'MLT', '', 0, 1),
(133, 'Маршаллові острови', 'MH', 'MHL', '', 0, 1),
(134, 'Мартинюк', 'MQ', 'MTQ', '', 0, 1),
(135, 'Мавританія', 'MR', 'MRT', '', 0, 1),
(136, 'Маврикій', 'MU', 'MUS', '', 0, 1),
(137, 'Майотта', 'YT', 'MYT', '', 0, 1),
(138, 'Мексика', 'MX', 'MEX', '', 0, 1),
(139, 'Мікронезія', 'FM', 'FSM', '', 0, 1),
(140, 'Молдова', 'MD', 'MDA', '', 0, 1),
(141, 'Монако', 'MC', 'MCO', '', 0, 1),
(142, 'Монголія', 'MN', 'MNG', '', 0, 1),
(143, 'Монтсеррат', 'MS', 'MSR', '', 0, 1),
(144, 'Марокко', 'MA', 'MAR', '', 0, 1),
(145, 'Мозамбік', 'MZ', 'MOZ', '', 0, 1),
(146, 'М''янма', 'MM', 'MMR', '', 0, 1),
(147, 'Намібія', 'NA', 'NAM', '', 0, 1),
(148, 'Науру', 'NR', 'NRU', '', 0, 1),
(149, 'Непал', 'NP', 'NPL', '', 0, 1),
(150, 'Нідерланди', 'NL', 'NLD', '', 0, 1),
(151, 'Антильські (Нідерландські) острови', 'AN', 'ANT', '', 0, 1),
(152, 'Нова Каледонія', 'NC', 'NCL', '', 0, 1),
(153, 'Нова Зеландія', 'NZ', 'NZL', '', 0, 1),
(154, 'Нікарагуа', 'NI', 'NIC', '', 0, 1),
(155, 'Нігер', 'NE', 'NER', '', 0, 1),
(156, 'Нігерія', 'NG', 'NGA', '', 0, 1),
(157, 'Ніуе', 'NU', 'NIU', '', 0, 1),
(158, 'Острів Норфолк', 'NF', 'NFK', '', 0, 1),
(159, 'Північні Маріанські острови', 'MP', 'MNP', '', 0, 1),
(160, 'Норвегія', 'NO', 'NOR', '', 0, 1),
(161, 'Оман', 'OM', 'OMN', '', 0, 1),
(162, 'Пакистан', 'PK', 'PAK', '', 0, 1),
(163, 'Палау', 'PW', 'PLW', '', 0, 1),
(164, 'Панама', 'PA', 'PAN', '', 0, 1),
(165, 'Папуа - Нова Гвінея', 'PG', 'PNG', '', 0, 1),
(166, 'Парагвай', 'PY', 'PRY', '', 0, 1),
(167, 'Перу', 'PE', 'PER', '', 0, 1),
(168, 'Філіппіни', 'PH', 'PHL', '', 0, 1),
(169, 'Острови Піткерн', 'PN', 'PCN', '', 0, 1),
(170, 'Польща', 'PL', 'POL', '', 0, 1),
(171, 'Португалія', 'PT', 'PRT', '', 0, 1),
(172, 'Пуерто-Ріко', 'PR', 'PRI', '', 0, 1),
(173, 'Катар', 'QA', 'QAT', '', 0, 1),
(174, 'Реюньон', 'RE', 'REU', '', 0, 1),
(175, 'Румунія', 'RO', 'ROM', '', 0, 1),
(176, 'Російська Федерація', 'RU', 'RUS', '', 0, 1),
(177, 'Руанда', 'RW', 'RWA', '', 0, 1),
(178, 'Сент-Кіттс і Невіс', 'KN', 'KNA', '', 0, 1),
(179, 'Сент-Люсія', 'LC', 'LCA', '', 0, 1),
(180, 'Сент-Вінсент і Гренадини', 'VC', 'VCT', '', 0, 1),
(181, 'Західне Самоа', 'WS', 'WSM', '', 0, 1),
(182, 'Сан-Марино', 'SM', 'SMR', '', 0, 1),
(183, 'Сан-Томе і Принсіпі', 'ST', 'STP', '', 0, 1),
(184, 'Саудівська Аравія', 'SA', 'SAU', '', 0, 1),
(185, 'Сенегал', 'SN', 'SEN', '', 0, 1),
(186, 'Сейшельські острови', 'SC', 'SYC', '', 0, 1),
(187, 'Сьєрра-Леоне', 'SL', 'SLE', '', 0, 1),
(188, 'Сінгапур', 'SG', 'SGP', '', 0, 1),
(189, 'Словаччина', 'SK', 'SVK', '{firstname} {lastname}  r  n {company}  r  n {address_1}  r  n {address_2}  r  n {city} {postcode}  r  n {zone}  r  n {country} ', 0, 1),
(190, 'Словенія', 'SI', 'SVN', '', 0, 1),
(191, 'Соломонові острови', 'SB', 'SLB', '', 0, 1),
(192, 'Сомалі', 'SO', 'SOM', '', 0, 1),
(193, 'Південно-Африканська Республіка', 'ZA', 'ZAF', '', 0, 1),
(194, 'Південна Джорджія і Південні Сандвічеві острови', 'GS', 'SGS', '', 0, 1),
(195, 'Іспанія', 'ES', 'ESP', '', 0, 1),
(196, 'Шрі-Ланка', 'LK', 'LKA', '', 0, 1),
(197, 'Острів Святої Єлени', 'SH', 'SHN', '', 0, 1),
(198, 'Сен-П''єр і Мікелон', 'PM', 'SPM', '', 0, 1),
(199, 'Судан', 'SD', 'SDN', '', 0, 1),
(200, 'Сурінам', 'SR', 'SUR', '', 0, 1),
(201, 'Шпіцберген і Ян Майєн', 'SJ', 'SJM', '', 0, 1),
(202, 'Свазіленд', 'SZ', 'SWZ', '', 0, 1),
(203, 'Швеція', 'SE', 'SWE', '', 0, 1),
(204, 'Швейцарія', 'CH', 'CHE', '', 0, 1),
(205, 'Сирія', 'SY', 'SYR', '', 0, 1),
(206, 'Тайвань (провінція Китаю)', 'TW', 'TWN', '', 0, 1),
(207, 'Таджикистан', 'TJ', 'TJK', '', 0, 1),
(208, 'Танзанія', 'TZ', 'TZA', '', 0, 1),
(209, 'Таїланд', 'TH', 'THA', '', 0, 1),
(210, 'Того', 'TG', 'TGO', '', 0, 1),
(211, 'Токелау', 'TK', 'TKL', '', 0, 1),
(212, 'Тонга', 'TO', 'TON', '', 0, 1),
(213, 'Тринідад і Тобаго', 'TT', 'TTO', '', 0, 1),
(214, 'Туніс', 'TN', 'TUN', '', 0, 1),
(215, 'Туреччина', 'TR', 'TUR', '', 0, 1),
(216, 'Туркменістан', 'TM', 'TKM', '', 0, 1),
(217, 'Острови Теркс і Кайкос', 'TC', 'TCA', '', 0, 1),
(218, 'Тувалу', 'TV', 'TUV', '', 0, 1),
(219, 'Уганда', 'UG', 'UGA', '', 0, 1),
(220, 'Україна', 'UA', 'UKR', '', 0, 1),
(221, 'Об''єднані Арабські Емірати', 'AE', 'ARE', '', 0, 1),
(222, 'Великобританія', 'GB', 'GBR', '', 1, 1),
(223, 'Сполучені Штати Америки', 'US', 'USA', '{firstname} {lastname}  r  n {company}  r  n {address_1}  r  n {address_2}  r  n { city}, {zone} {postcode}  r  n {country} ', 0, 1),
(224, 'Дрібні віддалені острови США', 'UM', 'UMI', '', 0, 1),
(225, 'Уругвай', 'UY', 'URY', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1),
(227, 'Вануату', 'VU', 'VUT', '', 0, 1),
(228, 'Ватикан', 'VA', 'VAT', '', 0, 1),
(229, 'Венесуела', 'VE', 'VEN', '', 0, 1),
(230, 'В''єтнам', 'VN', 'VNM', '', 0, 1),
(231, 'Віргінські острови (Британські)', 'VG', 'VGB', '', 0, 1),
(232, 'Віргінські острови (США)', 'VI', 'VIR', '', 0, 1),
(233, 'Уолліс Футуна', 'WF', 'WLF', '', 0, 1),
(234, 'Західна Сахара', 'EH', 'ESH', '', 0, 1),
(235, 'Ємен', 'YE', 'YEM', '', 0, 1),
(236, 'Сербія і Чорногорія', 'CS', 'SCG', '', 0, 1),
(237, 'Заїр', 'ZR', 'ZAR', '', 0, 1),
(238, 'Замбія', 'ZM', 'ZMB', '', 0, 1),
(239, 'Зімбабве', 'ZW', 'ZWE', '', 0, 1),
(242, 'Чорногорія', 'ME', 'MNE', '', 0, 1),
(243, 'Сербія', 'RS', 'SRB', '', 0, 1),
(244, 'Аландські острови', 'AX', 'ALA', '', 0, 1),
(245, 'Бонайре, Сінт-Естатіус і Саба', 'BQ', 'BES', '', 0, 1),
(246, 'Кюрасао', 'CW', 'CUW', '', 0, 1),
(247, 'Палестинська територія, окупована', 'PS', 'PSE', '', 0, 1),
(248, 'Південний Судан', 'SS', 'SSD', '', 0, 1),
(249, 'Санкт-Бартелемі', 'BL', 'BLM', '', 0, 1),
(250, 'Санкт-Мартін (французька частина)', 'MF', 'MAF', '', 0, 1),
(251, 'Канарські Острови', 'IC', 'ICA', '', 0, 1),
(252, 'Острів Вознесіння (Великобританія)', 'AC', 'ASC', '', 0, 1),
(253, 'Косово, Республіка', 'XK', 'UNK', '', 0, 1),
(254, 'Острів Мен', 'IM', 'IMN', '', 0, 1),
(255, 'Тристан-да-Кунья', 'TA', 'SHN', '', 0, 1),
(256, 'Острів Гернсі', 'GG', 'GGY', '', 0, 1),
(257, 'Острів Джерсі', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_coupon`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `mdvdoc_coupon`
--

INSERT INTO `mdvdoc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% знижка', '2222', 'P', '10.0000', 0, 0, '0.0000', '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Безкоштовна доставка', '3333', 'P', '0.0000', 0, 1, '100.0000', '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 знижка', '1111', 'F', '10.0000', 0, 0, '10.0000', '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_currency`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mdvdoc_currency`
--

INSERT INTO `mdvdoc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Гривня', 'UAH', '', ' ₴', '2', 1.00000000, 1, '2016-04-29 12:14:27'),
(2, 'US Dollar', 'USD', '$', '', '2', 0.03970000, 1, '2016-04-28 18:42:20'),
(3, 'Euro', 'EUR', '', '€', '2', 0.03500000, 1, '2016-04-28 18:42:20');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_custom_field`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mdvdoc_customer`
--

INSERT INTO `mdvdoc_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 0, 0, 'ловиа', 'лцаці', 'titar@email.ua', '1231214232', '', '56d3bcd1ff5110c69014d8b530c59072d0e8fc22', 'ox8gLc9oe', NULL, NULL, 1, 1, '', '176.36.111.41', 1, 1, 0, '', '2016-04-29 11:09:37');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `mdvdoc_customer_activity`
--

INSERT INTO `mdvdoc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', '{"customer_id":1,"name":"\\u043b\\u043e\\u0432\\u0438\\u0430 \\u043b\\u0446\\u0430\\u0446\\u0456"}', '46.174.166.167', '2016-04-29 11:09:37'),
(2, 1, 'edit', '{"customer_id":"1","name":"\\u043b\\u043e\\u0432\\u0438\\u0430 \\u043b\\u0446\\u0430\\u0446\\u0456"}', '46.174.166.167', '2016-04-29 11:10:37');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_group`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mdvdoc_customer_group`
--

INSERT INTO `mdvdoc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_customer_group_description`
--

INSERT INTO `mdvdoc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_history`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mdvdoc_customer_ip`
--

INSERT INTO `mdvdoc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '46.174.166.167', '2016-04-29 11:09:37'),
(2, 1, '77.47.198.24', '2016-04-29 20:57:12'),
(3, 1, '176.36.111.41', '2016-05-01 22:18:29');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_login`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_online`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_customer_wishlist`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_download`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_download_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_event`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mdvdoc_event`
--

INSERT INTO `mdvdoc_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_extension`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп даних таблиці `mdvdoc_extension`
--

INSERT INTO `mdvdoc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'module', 'information'),
(21, 'module', 'filter');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_filter`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_filter_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_filter_group`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mdvdoc_geo_zone`
--

INSERT INTO `mdvdoc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'ПДВ', 'Оподатковувані', '2016-01-11 18:26:51', '2009-01-06 23:26:25');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_information`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп даних таблиці `mdvdoc_information`
--

INSERT INTO `mdvdoc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_information_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_information_description`
--

INSERT INTO `mdvdoc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', '', ''),
(4, 3, 'Про нас', '&lt;p&gt;\r\n	Про нас&lt;/p&gt;\r\n', '', '', '', ''),
(5, 3, 'Умови угоди', '&lt;p&gt;\r\n	Умови угоди&lt;/p&gt;\r\n', '', '', '', ''),
(3, 3, 'Політика Безпеки', '&lt;p&gt;\r\n	Політика Безпеки&lt;/p&gt;\r\n', '', '', '', ''),
(6, 3, 'Інформація про доставку', '&lt;p&gt;\r\n	Інформація про доставку&lt;/p&gt;\r\n', '', '', '', ''),
(4, 1, 'О нас', '&lt;p&gt;\r\n	О нас&lt;/p&gt;\r\n', '', '', '', ''),
(5, 1, 'Условия соглашения', '&lt;p&gt;\r\n	Условия соглашения&lt;/p&gt;\r\n', '', '', '', ''),
(3, 1, 'Политика Безопасности', '&lt;p&gt;\r\n	Политика Безопасности&lt;/p&gt;\r\n', '', '', '', ''),
(6, 1, 'Информация о доставке', '&lt;p&gt;\r\n	Информация о доставке&lt;/p&gt;\r\n', '', '', '', ''),
(4, 2, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_information_to_store`
--

INSERT INTO `mdvdoc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_language`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mdvdoc_language`
--

INSERT INTO `mdvdoc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru.png', 'russian', 1, 1),
(2, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 2, 0),
(3, 'Українська', 'uk', 'uk_UA', 'ua.png', 'ukrainian', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_layout`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп даних таблиці `mdvdoc_layout`
--

INSERT INTO `mdvdoc_layout` (`layout_id`, `name`) VALUES
(1, 'Головна'),
(2, 'Продукт'),
(3, 'Категорія'),
(4, 'По умолчанию'),
(5, 'Виробник'),
(6, 'Акаунт'),
(7, 'Оформлення замовлення'),
(8, 'Контакти'),
(9, 'Карта сайту'),
(10, 'Партнерська програма'),
(11, 'Інформація'),
(12, 'Порівняння'),
(13, 'Пошук');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_layout_module`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- Дамп даних таблиці `mdvdoc_layout_module`
--

INSERT INTO `mdvdoc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(86, 1, 'featured.28', 'content_top', 2),
(85, 1, 'carousel.29', 'content_top', 3),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_layout_route`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Дамп даних таблиці `mdvdoc_layout_route`
--

INSERT INTO `mdvdoc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(58, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_length_class`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,2) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mdvdoc_length_class`
--

INSERT INTO `mdvdoc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00'),
(2, '10.00'),
(3, '0.39');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `mdvdoc_length_class_description`
--

INSERT INTO `mdvdoc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(1, 2, 'Centimeter', 'cm'),
(2, 3, 'Міліметр', 'мм'),
(1, 3, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм'),
(2, 2, 'Millimeter', 'mm');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_location`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп даних таблиці `mdvdoc_manufacturer`
--

INSERT INTO `mdvdoc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_manufacturer_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_manufacturer_description`
--

INSERT INTO `mdvdoc_manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(5, 3, '', 'HTC', '', '', ''),
(5, 1, '', 'HTC', '', '', ''),
(6, 1, '', 'Palm', '', '', ''),
(7, 3, '', 'Hewlett-Packard', '', '', ''),
(7, 1, '', 'Hewlett-Packard', '', '', ''),
(8, 3, '', 'Apple', '', '', ''),
(8, 1, '', 'Apple', '', '', ''),
(9, 3, '', 'Canon', '', '', ''),
(9, 1, 'Пример текста в описания производителя', 'Canon', '', '', ''),
(10, 3, '', 'Sony', '', '', ''),
(10, 1, '', 'Sony', '', '', ''),
(5, 2, '', 'HTC', '', '', ''),
(6, 3, '', 'Palm', '', '', ''),
(6, 2, '', 'Palm', '', '', ''),
(7, 2, '', 'Hewlett-Packard', '', '', ''),
(8, 2, '', 'Apple', '', '', ''),
(9, 2, 'Example of manufacturer description text', 'Canon', '', '', ''),
(10, 2, '', 'Sony', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_manufacturer_to_store`
--

INSERT INTO `mdvdoc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_marketing`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_modification`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_module`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп даних таблиці `mdvdoc_module`
--

INSERT INTO `mdvdoc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["43","40","42","30"],"limit":"4","width":"200","height":"200","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"380","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_option`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `mdvdoc_option`
--

INSERT INTO `mdvdoc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_option_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_option_description`
--

INSERT INTO `mdvdoc_option_description` (`option_id`, `language_id`, `name`) VALUES
(2, 1, 'Флажок'),
(4, 1, 'Текст'),
(8, 1, 'Дата'),
(7, 1, 'Файл'),
(10, 1, 'Дата и Время'),
(1, 3, 'Перемикач'),
(2, 3, 'Прапорець'),
(4, 2, 'Text'),
(6, 3, 'Текстова область'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 3, 'Перелік'),
(9, 1, 'Время'),
(10, 3, 'Дата та Час'),
(12, 3, 'Дата доставки'),
(11, 3, 'Розмір'),
(1, 1, 'Переключатель'),
(2, 2, 'Checkbox'),
(4, 3, 'Текст'),
(6, 1, 'Текстовая область'),
(8, 3, 'Дата'),
(7, 3, 'Файл'),
(5, 1, 'Список'),
(9, 3, 'Час'),
(10, 2, 'Date &amp; Time'),
(12, 1, 'Дата доставки'),
(11, 1, 'Размер'),
(12, 2, 'Delivery Date'),
(1, 2, 'Radio'),
(11, 2, 'Size'),
(5, 2, 'Select'),
(6, 2, 'Textarea'),
(9, 2, 'Time');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_option_value`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Дамп даних таблиці `mdvdoc_option_value`
--

INSERT INTO `mdvdoc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_option_value_description`
--

INSERT INTO `mdvdoc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 2, 1, 'Large'),
(43, 3, 1, 'Large'),
(45, 1, 2, 'Флажок 4'),
(44, 2, 2, 'Checkbox 3'),
(43, 1, 1, 'Large'),
(42, 1, 5, 'Желтый'),
(41, 2, 5, 'Green'),
(41, 3, 5, 'Зелений'),
(44, 1, 2, 'Флажок 3'),
(48, 2, 11, 'Large'),
(48, 3, 11, 'Large'),
(48, 1, 11, 'Large'),
(31, 2, 1, 'Medium'),
(31, 3, 1, 'Medium'),
(44, 3, 2, 'Прапорець 3'),
(24, 2, 2, 'Checkbox 2'),
(31, 1, 1, 'Medium'),
(41, 1, 5, 'Зеленый'),
(40, 2, 5, 'Blue'),
(24, 3, 2, 'Прапорець 2'),
(47, 2, 11, 'Medium'),
(47, 3, 11, 'Medium'),
(47, 1, 11, 'Medium'),
(32, 2, 1, 'Small'),
(32, 3, 1, 'Small'),
(24, 1, 2, 'Флажок 2'),
(23, 2, 2, 'Checkbox 1'),
(32, 1, 1, 'Small'),
(40, 3, 5, 'Синій'),
(40, 1, 5, 'Синий'),
(39, 2, 5, 'Red'),
(23, 3, 2, 'Прапорець 1'),
(46, 2, 11, 'Small'),
(46, 3, 11, 'Small'),
(46, 1, 11, 'Small'),
(39, 3, 5, 'Червоний'),
(39, 1, 5, 'Красный'),
(23, 1, 2, 'Флажок 1'),
(45, 3, 2, 'Прапорець 4'),
(45, 2, 2, 'Checkbox 4'),
(42, 3, 5, 'Жовтий'),
(42, 2, 5, 'Yellow');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_history`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_option`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_product`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_status`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп даних таблиці `mdvdoc_order_status`
--

INSERT INTO `mdvdoc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(13, 1, 'Полный возврат'),
(1, 3, 'Очікування'),
(2, 3, 'В обробці'),
(3, 3, 'Доставлене'),
(7, 3, 'Скасовано'),
(5, 3, 'Завершено'),
(8, 3, 'Повернення'),
(9, 3, 'Скасування та анулювання'),
(10, 3, 'Невдалий'),
(11, 3, 'Відшкодований'),
(12, 3, 'Повністю змінений'),
(13, 3, 'Повне повернення'),
(1, 1, 'Ожидание'),
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(2, 2, 'Processing'),
(8, 2, 'Denied'),
(11, 2, 'Refunded'),
(3, 2, 'Shipped'),
(10, 2, 'Failed'),
(1, 2, 'Pending'),
(9, 2, 'Canceled Reversal'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(5, 2, 'Complete'),
(7, 2, 'Canceled');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_total`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,2) NOT NULL DEFAULT '0.00',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,2) NOT NULL DEFAULT '0.00',
  `width` decimal(15,2) NOT NULL DEFAULT '0.00',
  `height` decimal(15,2) NOT NULL DEFAULT '0.00',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Дамп даних таблиці `mdvdoc_product`
--

INSERT INTO `mdvdoc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Товар 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40', 2, '0.00', '0.00', '0.00', 1, 1, 1, 0, 1, 5, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Товар 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00', 2, '0.00', '0.00', '0.00', 3, 1, 1, 0, 1, 1, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Товар 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00', 1, '0.00', '0.00', '0.00', 1, 1, 1, 0, 1, 7, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 'Товар 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00', 1, '0.00', '0.00', '0.00', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Товар 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00', 1, '0.00', '0.00', '0.00', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Товар 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Товар 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Товар 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00', 1, '0.00', '0.00', '0.00', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Товар 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'Товар 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00', 1, '0.00', '0.00', '0.00', 1, 1, 1, 0, 1, 2, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 'Товар 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00', 1, '0.00', '0.00', '0.00', 1, 1, 1, 0, 1, 13, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Товар 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50', 1, '1.00', '2.00', '3.00', 1, 1, 2, 0, 1, 9, '2009-02-03 21:07:37', '2011-09-30 00:46:19'),
(43, 'Товар 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 10, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Товар 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Товар 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Товар 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Товар 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00', 1, '0.00', '0.00', '0.00', 1, 0, 1, 0, 1, 4, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'Товар 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00', 1, '0.00', '0.00', '0.00', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00', 1, '0.00', '0.00', '0.00', 1, 1, 1, 1, 1, 5, '2011-04-26 08:57:34', '2011-09-30 01:06:23');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_product_attribute`
--

INSERT INTO `mdvdoc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 2, 1, '4'),
(43, 4, 1, '8гб'),
(42, 3, 1, '100мгц'),
(47, 4, 1, '16ГБ'),
(43, 2, 2, '1'),
(47, 2, 2, '4'),
(43, 4, 2, '8gb'),
(42, 3, 2, '100mhz'),
(47, 4, 2, '16GB');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_product_description`
--

INSERT INTO `mdvdoc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30&quot;', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'Canon EOS 5D', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', 'iPod Touch', '', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'HTC Touch HD', '', '', ''),
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;&lt;h3 style=&quot;font-family: ''Open Sans'', sans-serif; color: rgb(102, 102, 102);&quot;&gt;Features:&lt;/h3&gt;&lt;p&gt;Unrivaled display performance&lt;/p&gt;&lt;ul&gt;&lt;li&gt;30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;&lt;li&gt;Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;&lt;li&gt;Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;&lt;li&gt;Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;&lt;li&gt;Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;&lt;li&gt;Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;&lt;li&gt;Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Simple setup and operation&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;&lt;li&gt;Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;&lt;li&gt;Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Sleek, elegant design&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Huge virtual workspace, very small footprint.&lt;/li&gt;&lt;li&gt;Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;&lt;li&gt;Unique hinge design for effortless adjustment&lt;/li&gt;&lt;li&gt;Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;&lt;/ul&gt;&lt;h3 style=&quot;font-family: ''Open Sans'', sans-serif; color: rgb(102, 102, 102);&quot;&gt;Technical specifications&lt;/h3&gt;&lt;p&gt;&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;2560 x 1600 pixels (optimum resolution)&lt;/li&gt;&lt;li&gt;2048 x 1280&lt;/li&gt;&lt;li&gt;1920 x 1200&lt;/li&gt;&lt;li&gt;1280 x 800&lt;/li&gt;&lt;li&gt;1024 x 640&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;16.7 million&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;170° horizontal; 170° vertical&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;700:1&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;16 ms&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Antiglare hardcoat&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Display Power,&lt;/li&gt;&lt;li&gt;System sleep, wake&lt;/li&gt;&lt;li&gt;Brightness&lt;/li&gt;&lt;li&gt;Monitor tilt&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;Cable&lt;/p&gt;&lt;ul&gt;&lt;li&gt;DVI (Digital Visual Interface)&lt;/li&gt;&lt;li&gt;FireWire 400&lt;/li&gt;&lt;li&gt;USB 2.0&lt;/li&gt;&lt;li&gt;DC power (24 V)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Connectors&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Two-port, self-powered USB 2.0 hub&lt;/li&gt;&lt;li&gt;Two FireWire 400 ports&lt;/li&gt;&lt;li&gt;Kensington security port&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;&lt;li&gt;Maximum power when operating: 150W&lt;/li&gt;&lt;li&gt;Energy saver mode: 3W or less&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;&lt;li&gt;Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;&lt;li&gt;Operating humidity: 20% to 80% noncondensing&lt;/li&gt;&lt;li&gt;Maximum operating altitude: 10,000 feet&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;FCC Part 15 Class B&lt;/li&gt;&lt;li&gt;EN55022 Class B&lt;/li&gt;&lt;li&gt;EN55024&lt;/li&gt;&lt;li&gt;VCCI Class B&lt;/li&gt;&lt;li&gt;AS/NZS 3548 Class B&lt;/li&gt;&lt;li&gt;CNS 13438 Class B&lt;/li&gt;&lt;li&gt;ICES-003 Class B&lt;/li&gt;&lt;li&gt;ISO 13406 part 2&lt;/li&gt;&lt;li&gt;MPR II&lt;/li&gt;&lt;li&gt;IEC 60950&lt;/li&gt;&lt;li&gt;UL 60950&lt;/li&gt;&lt;li&gt;CSA 60950&lt;/li&gt;&lt;li&gt;EN60950&lt;/li&gt;&lt;li&gt;ENERGY STAR&lt;/li&gt;&lt;li&gt;TCO ''03&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;30-inch Apple Cinema HD Display&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Height: 21.3 inches (54.3 cm)&lt;/li&gt;&lt;li&gt;Width: 27.2 inches (68.8 cm)&lt;/li&gt;&lt;li&gt;Depth: 8.46 inches (21.5 cm)&lt;/li&gt;&lt;li&gt;Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Mac Pro, all graphic options&lt;/li&gt;&lt;li&gt;MacBook Pro&lt;/li&gt;&lt;li&gt;Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;&lt;li&gt;Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;&lt;li&gt;PowerBook G4 with dual-link DVI support&lt;/li&gt;&lt;li&gt;Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;&lt;/ul&gt;', '', 'Apple Cinema 30&quot;', '', '', ''),
(30, 2, 'Canon EOS 5D', '&lt;p&gt;Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;br&gt;&lt;/p&gt;', '', 'Canon EOS 5D', '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(31, 2, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', '', ''),
(44, 2, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', '', ''),
(45, 2, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', '');
INSERT INTO `mdvdoc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(36, 2, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', '', ''),
(46, 2, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', 'iPod Touch', '', '', ''),
(41, 2, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 2, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 2, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(35, 2, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(48, 2, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', '', ''),
(40, 2, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'HTC Touch HD', '', '', ''),
(42, 3, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30&quot;', '', '', ''),
(30, 3, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'Canon EOS 5D', '', '', ''),
(49, 3, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', '', ''),
(31, 3, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', '', ''),
(44, 3, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', '', ''),
(45, 3, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', '', ''),
(29, 3, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', '', ''),
(36, 3, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', '', ''),
(46, 3, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', '', ''),
(47, 3, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', '', ''),
(32, 3, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', 'iPod Touch', '', '', ''),
(41, 3, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', '', ''),
(33, 3, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', '', ''),
(34, 3, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', '', ''),
(43, 3, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', '', ''),
(35, 3, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', '', ''),
(48, 3, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', '', ''),
(40, 3, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', '', ''),
(28, 3, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'HTC Touch HD', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_discount`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=441 ;

--
-- Дамп даних таблиці `mdvdoc_product_discount`
--

INSERT INTO `mdvdoc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(440, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(439, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(438, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_filter`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_image`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2352 ;

--
-- Дамп даних таблиці `mdvdoc_product_image`
--

INSERT INTO `mdvdoc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2345, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2344, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2317, 42, 'catalog/demo/canon_logo.jpg', 0),
(2316, 42, 'catalog/demo/hp_1.jpg', 0),
(2315, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2314, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2313, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_option`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Дамп даних таблиці `mdvdoc_product_option`
--

INSERT INTO `mdvdoc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 'test', 1),
(219, 42, 8, '2011-02-20', 1),
(222, 42, 7, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(226, 30, 5, '', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,2) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп даних таблиці `mdvdoc_product_option_value`
--

INSERT INTO `mdvdoc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00', '+'),
(15, 226, 30, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00', '+');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_related`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_product_related`
--

INSERT INTO `mdvdoc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_reward`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=546 ;

--
-- Дамп даних таблиці `mdvdoc_product_reward`
--

INSERT INTO `mdvdoc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(515, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(539, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_special`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

--
-- Дамп даних таблиці `mdvdoc_product_special`
--

INSERT INTO `mdvdoc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(419, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_product_to_category`
--

INSERT INTO `mdvdoc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(28, 20, 0),
(28, 24, 0),
(29, 20, 0),
(29, 24, 0),
(30, 20, 0),
(30, 33, 0),
(31, 33, 0),
(32, 34, 0),
(33, 20, 0),
(33, 28, 0),
(34, 34, 0),
(35, 20, 0),
(36, 34, 0),
(40, 20, 0),
(40, 24, 0),
(41, 27, 0),
(42, 20, 0),
(42, 28, 0),
(43, 18, 0),
(43, 20, 0),
(44, 18, 0),
(44, 20, 0),
(45, 18, 0),
(46, 18, 0),
(46, 20, 0),
(47, 18, 0),
(47, 20, 0),
(48, 20, 0),
(48, 34, 0),
(49, 57, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_product_to_store`
--

INSERT INTO `mdvdoc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_recurring`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_return`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_return_action`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mdvdoc_return_action`
--

INSERT INTO `mdvdoc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 3, 'Повернуто кошти'),
(2, 3, 'Виданий в кредит'),
(3, 3, 'Відправлена заміна (відправлений інший товар для заміни)'),
(1, 1, 'Возвращены средства'),
(2, 1, 'Выдан в кредит'),
(3, 1, 'Отправлена замена (отправлен другой товар для замены)'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_return_history`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_return_reason`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп даних таблиці `mdvdoc_return_reason`
--

INSERT INTO `mdvdoc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен/доставлен неисправным (сломанным)'),
(4, 1, 'Ошибочный, пожалуйста, укажите/приложите подробности'),
(5, 1, 'Другое (другая причина), пожалуйста, укажите/приложите подробности'),
(1, 3, 'Отримано / доставлений несправним (зламаним)'),
(2, 3, 'Отриманий не той (помилковий) товар'),
(4, 3, 'Помилковий, будь ласка, вкажіть / вкажіть подробиці'),
(5, 3, 'Інше (інша причина), будь ласка, вкажіть / вкажіть подробиці'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details'),
(2, 2, 'Received Wrong Item'),
(1, 2, 'Dead On Arrival');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_return_status`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mdvdoc_return_status`
--

INSERT INTO `mdvdoc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(2, 2, 'Awaiting Products'),
(1, 3, 'В очікуванні'),
(3, 3, 'Готовий/ Завершений'),
(1, 1, 'Рассматриваемый'),
(3, 1, 'Готов  / Завершен'),
(2, 1, 'Заказ '),
(2, 3, 'Замовлення'),
(3, 2, 'Complete'),
(1, 2, 'Pending');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_review`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_setting`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1901 ;

--
-- Дамп даних таблиці `mdvdoc_setting`
--

INSERT INTO `mdvdoc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(967, 0, 'tax', 'tax_sort_order', '5', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(966, 0, 'tax', 'tax_status', '0', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(963, 0, 'coupon', 'coupon_sort_order', '4', 0),
(962, 0, 'coupon', 'coupon_status', '0', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(965, 0, 'reward', 'reward_sort_order', '2', 0),
(964, 0, 'reward', 'reward_status', '0', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(1876, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(1900, 0, 'config', 'config_sms_gate_password', '', 0),
(1899, 0, 'config', 'config_sms_gate_username', '', 0),
(1898, 0, 'config', 'config_sms_message', '', 0),
(1897, 0, 'config', 'config_sms_copy', '', 0),
(1887, 0, 'config', 'config_error_display', '1', 0),
(1888, 0, 'config', 'config_error_log', '1', 0),
(1889, 0, 'config', 'config_error_filename', 'error.log', 0),
(1890, 0, 'config', 'config_google_captcha_public', '', 0),
(1891, 0, 'config', 'config_google_captcha_secret', '', 0),
(1892, 0, 'config', 'config_google_captcha_status', '0', 0),
(1893, 0, 'config', 'config_sms_alert', '0', 0),
(1894, 0, 'config', 'config_sms_gatename', 'testsms', 0),
(1895, 0, 'config', 'config_sms_from', '', 0),
(1896, 0, 'config', 'config_sms_to', '', 0),
(1886, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(1884, 0, 'config', 'config_file_max_size', '300000', 0),
(1885, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(1102, 0, 'filter', 'filter_status', '1', 0),
(961, 0, 'voucher', 'voucher_sort_order', '8', 0),
(960, 0, 'voucher', 'voucher_status', '0', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(1883, 0, 'config', 'config_encryption', 'kiWmuxoICl4YVZQVXIKSL0bsL6PkA7c4X1GHFBarCzAoXGhY4DvHTervOqlOQc8UquEWYrb3uXq1buK3KwOhOFGLP8iZDQOKTG3dhJuy67NxcZJGUWlTxmkzBjRGDUzaZTqMmUH9j0OTC00nW1Z6Qs19EWvAq2BpgjgwDYBY3yrFJaD9ufHLnuaSXoV574vSFxs1bzknam3NqaiiW36XnyP8cu7rJllIQIKQkQMl8nzjdXvPiH5xlDwZOXowE1sV8TPygO0X0z2qiPEXn8x5wXpcBn1yPqdF3dr2N3bJbygWouziBcBnfN64u9NNNPHvDO9g4JVe8jcxlp248uBGnjICFIK5gOPltm6zTUSX1CE0yCKebtiN8XfH8GphRXcLCqx4ChJjcV19AgXsmn69ATwsjvYxH4GNlECJ1WCBc1H9zSdo9eEzIHnwnIVmcCaX2726P9KfnWv56ya1Os1kLFiXI2iY9b4IjthluhATcPs4JrHHesyL4HBHfG4afpTSkdetKBy7v3GTrEaW4yFhdMic7JsxsM1N7Eg4BQItwSc62M9ArSXBFkHSqEebdstTSPs2sccOoRpAKAgPqU4w8grlbworDEMiQFOfdI33iwis8QKHGMSbSP6Tp6COD3QBRsSA3G1gBnIZbNSnj6zawuqVHtmZf77e4DvN2Ou6O9RCNsRO5ksNBLUbhRRpXgCDlvBLCrZX9yUS5TAR6jMsTSb9GjZCzqaLKtJlhDPLhmLzodKfTHOC6B82udkLwsyvSGoN9dLyRkVJZXMq5LaMjtjAdprkmiOqVEMi9qYDNzzITpCIsaAspINd7BJduVzeDchDAcfUc9HMwC1Bv5eqEc0bVRSyr4Dw4V5xJl1xCE3g4fYCOUDQDKivZ3yWjcjMzumFDdsBPQ3YvVq9XldunfrV8QLZaLLXJ2jSzUmlUADqSEHcxxv1pS1tQifk1t4u8XTq55yV7ZuqxpMj5fO1PiMbOMW4OnDyqv1TTXgMnXsWQ5NDTQ5I2BF4TdQ8FVG8', 0),
(1882, 0, 'config', 'config_shared', '0', 0),
(1880, 0, 'config', 'config_secure', '0', 0),
(1881, 0, 'config', 'config_password', '1', 0),
(1877, 0, 'config', 'config_compression', '0', 0),
(1878, 0, 'config', 'config_mail_regexp', '/^[^@]+@.*.[a-z]{2,15}$/i', 0),
(1879, 0, 'config', 'config_editor_default', '0', 0),
(1875, 0, 'config', 'config_seo_url_postfix', '', 0),
(1872, 0, 'config', 'config_seo_url', '0', 0),
(1873, 0, 'config', 'config_seo_url_type', 'seo_url', 0),
(1874, 0, 'config', 'config_seo_url_include_path', '0', 0),
(1871, 0, 'config', 'config_maintenance', '0', 0),
(1870, 0, 'config', 'config_mail_alert', '', 0),
(1869, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(1868, 0, 'config', 'config_mail_smtp_port', '25', 0),
(1867, 0, 'config', 'config_mail_smtp_password', '', 0),
(1866, 0, 'config', 'config_mail_smtp_username', '', 0),
(1865, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(1864, 0, 'config', 'config_mail_parameter', '', 0),
(1863, 0, 'config', 'config_mail_protocol', 'mail', 0),
(1862, 0, 'config', 'config_ftp_status', '0', 0),
(1861, 0, 'config', 'config_ftp_root', '', 0),
(1860, 0, 'config', 'config_ftp_password', '', 0),
(1859, 0, 'config', 'config_ftp_username', '', 0),
(1857, 0, 'config', 'config_ftp_hostname', '821116.mdvd.web.hosting-test.net', 0),
(1858, 0, 'config', 'config_ftp_port', '21', 0),
(1856, 0, 'config', 'config_image_location_height', '50', 0),
(1855, 0, 'config', 'config_image_location_width', '268', 0),
(1854, 0, 'config', 'config_image_cart_height', '47', 0),
(1853, 0, 'config', 'config_image_cart_width', '47', 0),
(1852, 0, 'config', 'config_image_wishlist_height', '47', 0),
(1849, 0, 'config', 'config_image_compare_width', '90', 0),
(1851, 0, 'config', 'config_image_wishlist_width', '47', 0),
(1850, 0, 'config', 'config_image_compare_height', '90', 0),
(1848, 0, 'config', 'config_image_related_height', '80', 0),
(1847, 0, 'config', 'config_image_related_width', '80', 0),
(1846, 0, 'config', 'config_image_additional_height', '74', 0),
(1844, 0, 'config', 'config_image_product_height', '228', 0),
(1845, 0, 'config', 'config_image_additional_width', '74', 0),
(1842, 0, 'config', 'config_image_popup_height', '500', 0),
(1843, 0, 'config', 'config_image_product_width', '228', 0),
(1841, 0, 'config', 'config_image_popup_width', '500', 0),
(1840, 0, 'config', 'config_image_thumb_height', '228', 0),
(1838, 0, 'config', 'config_image_category_height', '80', 0),
(1839, 0, 'config', 'config_image_thumb_width', '228', 0),
(1837, 0, 'config', 'config_image_category_width', '80', 0),
(1836, 0, 'config', 'config_icon', 'catalog/222.png', 0),
(1835, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(1834, 0, 'config', 'config_captcha_page', '["review","return","contact"]', 1),
(1833, 0, 'config', 'config_captcha', '', 0),
(1832, 0, 'config', 'config_return_status_id', '2', 0),
(1831, 0, 'config', 'config_return_id', '0', 0),
(1830, 0, 'config', 'config_affiliate_mail', '0', 0),
(1829, 0, 'config', 'config_affiliate_id', '4', 0),
(1828, 0, 'config', 'config_affiliate_commission', '5', 0),
(1827, 0, 'config', 'config_affiliate_auto', '0', 0),
(1826, 0, 'config', 'config_affiliate_approval', '0', 0),
(1825, 0, 'config', 'config_stock_checkout', '0', 0),
(1824, 0, 'config', 'config_stock_warning', '0', 0),
(1823, 0, 'config', 'config_stock_display', '0', 0),
(1822, 0, 'config', 'config_api_id', '1', 0),
(1821, 0, 'config', 'config_order_mail', '0', 0),
(1820, 0, 'config', 'config_fraud_status_id', '2', 0),
(1819, 0, 'config', 'config_complete_status', '["3","5"]', 1),
(1818, 0, 'config', 'config_processing_status', '["2","3","5","1","12"]', 1),
(1817, 0, 'config', 'config_order_status_id', '1', 0),
(1816, 0, 'config', 'config_checkout_id', '5', 0),
(1815, 0, 'config', 'config_checkout_guest', '1', 0),
(1814, 0, 'config', 'config_cart_weight', '1', 0),
(1813, 0, 'config', 'config_invoice_prefix', 'INV-2016-00', 0),
(1812, 0, 'config', 'config_account_mail', '0', 0),
(1811, 0, 'config', 'config_account_id', '3', 0),
(1810, 0, 'config', 'config_login_attempts', '5', 0),
(1809, 0, 'config', 'config_customer_price', '0', 0),
(1808, 0, 'config', 'config_customer_online', '0', 0),
(1807, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1806, 0, 'config', 'config_tax_default', 'shipping', 0),
(1805, 0, 'config', 'config_tax', '1', 0),
(1804, 0, 'config', 'config_voucher_max', '1000', 0),
(1803, 0, 'config', 'config_voucher_min', '1', 0),
(1802, 0, 'config', 'config_review_mail', '0', 0),
(1801, 0, 'config', 'config_review_guest', '1', 0),
(1798, 0, 'config', 'config_product_isbn_hide', '0', 0),
(1799, 0, 'config', 'config_product_mpn_hide', '0', 0),
(1800, 0, 'config', 'config_review_status', '1', 0),
(1797, 0, 'config', 'config_product_jan_hide', '0', 0),
(1796, 0, 'config', 'config_product_ean_hide', '0', 0),
(1795, 0, 'config', 'config_product_upc_hide', '0', 0),
(1794, 0, 'config', 'config_limit_admin', '20', 0),
(1793, 0, 'config', 'config_product_description_length', '100', 0),
(1792, 0, 'config', 'config_product_limit', '15', 0),
(1791, 0, 'config', 'config_product_count', '1', 0),
(1790, 0, 'config', 'config_weight_class_id', '1', 0),
(1789, 0, 'config', 'config_length_class_id', '1', 0),
(1788, 0, 'config', 'config_currency_auto', '1', 0),
(1787, 0, 'config', 'config_currency', 'UAH', 0),
(1786, 0, 'config', 'config_admin_language', 'uk', 0),
(1785, 0, 'config', 'config_language', 'uk', 0),
(1784, 0, 'config', 'config_zone_id', '3491', 0),
(1783, 0, 'config', 'config_country_id', '220', 0),
(1782, 0, 'config', 'config_comment', '', 0),
(1781, 0, 'config', 'config_open', '10:00-19:00', 0),
(1780, 0, 'config', 'config_image', 'catalog/logo.png', 0),
(1779, 0, 'config', 'config_fax', '', 0),
(1778, 0, 'config', 'config_telephone', '063-879-87-77', 0),
(1775, 0, 'config', 'config_address', 'МДВДУкраїна, Київ, бульвар Івана Лепсе, 16', 0),
(1777, 0, 'config', 'config_email', 'titar.serge@gmail.com', 0),
(1776, 0, 'config', 'config_geocode', '50.4402914,30.407694', 0),
(1770, 0, 'config', 'config_meta_keyword', '', 0),
(1771, 0, 'config', 'config_template', 'default', 0),
(1772, 0, 'config', 'config_layout_id', '4', 0),
(1773, 0, 'config', 'config_name', 'МДВД', 0),
(968, 0, 'information', 'information_status', '1', 0),
(1774, 0, 'config', 'config_owner', 'Моє Ім''я', 0),
(1769, 0, 'config', 'config_meta_description', 'МДВД продаж меблів', 0),
(1768, 0, 'config', 'config_meta_title', 'МДВД', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_stock_status`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `mdvdoc_stock_status`
--

INSERT INTO `mdvdoc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(6, 1, 'Ожидание 2-3 дня'),
(7, 3, 'В наявності'),
(8, 3, 'Попереднє замовлення'),
(5, 3, 'Немає в наявності'),
(6, 3, 'Очікування 2-3 дні'),
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(7, 2, 'In Stock'),
(5, 2, 'Out Of Stock'),
(6, 2, '2 - 3 Days'),
(8, 2, 'Pre-Order');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_store`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_tax_class`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп даних таблиці `mdvdoc_tax_class`
--

INSERT INTO `mdvdoc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Податки', 'Оподатковувані', '2009-01-06 23:21:53', '2016-01-11 18:25:37'),
(10, 'Цифрові товари', 'Цифрові', '2011-09-21 22:19:39', '2016-01-11 18:25:16');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Дамп даних таблиці `mdvdoc_tax_rate`
--

INSERT INTO `mdvdoc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'ПДВ (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2016-01-11 18:25:52'),
(87, 3, 'Екологічний податок (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2016-01-11 18:26:28');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_tax_rate_to_customer_group`
--

INSERT INTO `mdvdoc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Дамп даних таблиці `mdvdoc_tax_rule`
--

INSERT INTO `mdvdoc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_upload`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_url_alias`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=845 ;

--
-- Дамп даних таблиці `mdvdoc_url_alias`
--

INSERT INTO `mdvdoc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(601, 'account/voucher', 'vouchers'),
(602, 'account/wishlist', 'wishlist'),
(603, 'account/account', 'my-account'),
(604, 'checkout/cart', 'cart'),
(605, 'checkout/checkout', 'checkout'),
(606, 'account/login', 'login'),
(607, 'account/logout', 'logout'),
(608, 'account/order', 'order-history'),
(609, 'account/newsletter', 'newsletter'),
(610, 'product/special', 'specials'),
(611, 'affiliate/account', 'affiliates'),
(612, 'checkout/voucher', 'gift-vouchers'),
(613, 'product/manufacturer', 'brands'),
(614, 'information/contact', 'contact-us'),
(615, 'account/return/insert', 'request-return'),
(616, 'information/sitemap', 'sitemap'),
(617, 'account/forgotten', 'forgot-password'),
(618, 'account/download', 'downloads'),
(619, 'account/return', 'returns'),
(620, 'account/transaction', 'transactions'),
(621, 'account/register', 'create-account'),
(622, 'product/compare', 'compare-products'),
(623, 'product/search', 'search'),
(624, 'account/edit', 'edit-account'),
(625, 'account/password', 'change-password'),
(626, 'account/address', 'address-book'),
(627, 'account/reward', 'reward-points'),
(628, 'affiliate/edit', 'edit-affiliate-account'),
(629, 'affiliate/password', 'change-affiliate-password'),
(630, 'affiliate/payment', 'affiliate-payment-options'),
(631, 'affiliate/tracking', 'affiliate-tracking-code'),
(632, 'affiliate/transaction', 'affiliate-transactions'),
(633, 'affiliate/logout', 'affiliate-logout'),
(634, 'affiliate/forgotten', 'affiliate-forgot-password'),
(635, 'affiliate/register', 'create-affiliate-account'),
(636, 'affiliate/login', 'affiliate-login'),
(637, 'account/return/add', 'add-return'),
(638, 'common/home', ''),
(824, 'product_id=48', 'ipod-classic'),
(836, 'category_id=20', 'desktops'),
(834, 'category_id=26', 'pc'),
(835, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(768, 'product_id=42', 'test'),
(789, 'category_id=34', 'mp3-players'),
(781, 'category_id=36', 'test2'),
(774, 'category_id=18', 'laptop-notebook'),
(775, 'category_id=46', 'macs'),
(776, 'category_id=45', 'windows'),
(777, 'category_id=25', 'component'),
(778, 'category_id=29', 'mouse'),
(779, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(782, 'category_id=30', 'printer'),
(783, 'category_id=31', 'scanner'),
(784, 'category_id=32', 'web-camera'),
(785, 'category_id=57', 'tablet'),
(786, 'category_id=17', 'software'),
(787, 'category_id=24', 'smartphone'),
(788, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(797, 'category_id=52', 'test20'),
(798, 'category_id=58', 'test25'),
(799, 'category_id=53', 'test21'),
(800, 'category_id=54', 'test22'),
(801, 'category_id=55', 'test23'),
(802, 'category_id=56', 'test24'),
(803, 'category_id=38', 'test4'),
(804, 'category_id=37', 'test5'),
(805, 'category_id=39', 'test6'),
(806, 'category_id=40', 'test7'),
(807, 'category_id=41', 'test8'),
(808, 'category_id=42', 'test9'),
(809, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(812, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(823, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_user`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mdvdoc_user`
--

INSERT INTO `mdvdoc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'solovcom', '0a9478711b123a9900ce0c1de5e99bb8213b0690', 'AoUeysfIM', 'John', 'Doe', 'titar.serge@gmail.com', '', '', '176.36.111.41', 1, '2016-04-21 10:34:40');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_user_group`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп даних таблиці `mdvdoc_user_group`
--

INSERT INTO `mdvdoc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","module\\/unisender","octeam\\/toolset","octeam_tools\\/cache","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/qiwi_rest","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/sberbank_transfer","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/information","module\\/filter"],"modify":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","module\\/unisender","octeam\\/toolset","octeam_tools\\/cache","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/qiwi_rest","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/sberbank_transfer","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/information","module\\/filter"],"hiden":["module\\/amazon_login","module\\/amazon_pay","module\\/ebay_listing","module\\/pp_button","module\\/pp_login","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/firstdata","payment\\/firstdata_remote","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","shipping\\/auspost","shipping\\/by_total","shipping\\/citylink","shipping\\/fedex","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_voucher`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `mdvdoc_voucher_theme`
--

INSERT INTO `mdvdoc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mdvdoc_voucher_theme_description`
--

INSERT INTO `mdvdoc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 3, 'Різдво'),
(7, 3, 'День народження'),
(8, 3, 'Основний'),
(6, 1, 'Рождество'),
(7, 1, 'День рождения'),
(8, 1, 'Основной'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_weight_class`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `mdvdoc_weight_class`
--

INSERT INTO `mdvdoc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00'),
(2, '1000.00'),
(5, '2.20'),
(6, '35.27');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `mdvdoc_weight_class_description`
--

INSERT INTO `mdvdoc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 3, 'Кілограми', 'кг'),
(2, 3, 'Грами', 'г'),
(1, 1, 'Килограммы', 'кг'),
(2, 1, 'Граммы', 'г'),
(2, 2, 'Gram', 'g'),
(1, 2, 'Kilogram', 'kg');

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_zone`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4224 ;

--
-- Дамп даних таблиці `mdvdoc_zone`
--

INSERT INTO `mdvdoc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'BDS', 'Badakhshan', 1),
(2, 1, 'BDG', 'Badghis', 1),
(3, 1, 'BGL', 'Baghlan', 1),
(4, 1, 'BAL', 'Balkh', 1),
(5, 1, 'BAM', 'Bamian', 1),
(6, 1, 'FRA', 'Farah', 1),
(7, 1, 'FYB', 'Faryab', 1),
(8, 1, 'GHA', 'Ghazni', 1),
(9, 1, 'GHO', 'Ghowr', 1),
(10, 1, 'HEL', 'Helmand', 1),
(11, 1, 'HER', 'Herat', 1),
(12, 1, 'JOW', 'Jowzjan', 1),
(13, 1, 'KAB', 'Kabul', 1),
(14, 1, 'KAN', 'Kandahar', 1),
(15, 1, 'KAP', 'Kapisa', 1),
(16, 1, 'KHO', 'Khost', 1),
(17, 1, 'KNR', 'Konar', 1),
(18, 1, 'KDZ', 'Kondoz', 1),
(19, 1, 'LAG', 'Laghman', 1),
(20, 1, 'LOW', 'Lowgar', 1),
(21, 1, 'NAN', 'Nangrahar', 1),
(22, 1, 'NIM', 'Nimruz', 1),
(23, 1, 'NUR', 'Nurestan', 1),
(24, 1, 'ORU', 'Oruzgan', 1),
(25, 1, 'PIA', 'Paktia', 1),
(26, 1, 'PKA', 'Paktika', 1),
(27, 1, 'PAR', 'Parwan', 1),
(28, 1, 'SAM', 'Samangan', 1),
(29, 1, 'SAR', 'Sar-e Pol', 1),
(30, 1, 'TAK', 'Takhar', 1),
(31, 1, 'WAR', 'Wardak', 1),
(32, 1, 'ZAB', 'Zabol', 1),
(33, 2, 'BR', 'Berat', 1),
(34, 2, 'BU', 'Bulqize', 1),
(35, 2, 'DL', 'Delvine', 1),
(36, 2, 'DV', 'Devoll', 1),
(37, 2, 'DI', 'Diber', 1),
(38, 2, 'DR', 'Durres', 1),
(39, 2, 'EL', 'Elbasan', 1),
(40, 2, 'ER', 'Kolonje', 1),
(41, 2, 'FR', 'Fier', 1),
(42, 2, 'GJ', 'Gjirokaster', 1),
(43, 2, 'GR', 'Gramsh', 1),
(44, 2, 'HA', 'Has', 1),
(45, 2, 'KA', 'Kavaje', 1),
(46, 2, 'KB', 'Kurbin', 1),
(47, 2, 'KC', 'Kucove', 1),
(48, 2, 'KO', 'Korce', 1),
(49, 2, 'KR', 'Kruje', 1),
(50, 2, 'KU', 'Kukes', 1),
(51, 2, 'LB', 'Librazhd', 1),
(52, 2, 'LE', 'Lezhe', 1),
(53, 2, 'LU', 'Lushnje', 1),
(54, 2, 'MM', 'Malesi e Madhe', 1),
(55, 2, 'MK', 'Mallakaster', 1),
(56, 2, 'MT', 'Mat', 1),
(57, 2, 'MR', 'Mirdite', 1),
(58, 2, 'PQ', 'Peqin', 1),
(59, 2, 'PR', 'Permet', 1),
(60, 2, 'PG', 'Pogradec', 1),
(61, 2, 'PU', 'Puke', 1),
(62, 2, 'SH', 'Shkoder', 1),
(63, 2, 'SK', 'Skrapar', 1),
(64, 2, 'SR', 'Sarande', 1),
(65, 2, 'TE', 'Tepelene', 1),
(66, 2, 'TP', 'Tropoje', 1),
(67, 2, 'TR', 'Tirane', 1),
(68, 2, 'VL', 'Vlore', 1),
(69, 3, 'ADR', 'Adrar', 1),
(70, 3, 'ADE', 'Ain Defla', 1),
(71, 3, 'ATE', 'Ain Temouchent', 1),
(72, 3, 'ALG', 'Alger', 1),
(73, 3, 'ANN', 'Annaba', 1),
(74, 3, 'BAT', 'Batna', 1),
(75, 3, 'BEC', 'Bechar', 1),
(76, 3, 'BEJ', 'Bejaia', 1),
(77, 3, 'BIS', 'Biskra', 1),
(78, 3, 'BLI', 'Blida', 1),
(79, 3, 'BBA', 'Bordj Bou Arreridj', 1),
(80, 3, 'BOA', 'Bouira', 1),
(81, 3, 'BMD', 'Boumerdes', 1),
(82, 3, 'CHL', 'Chlef', 1),
(83, 3, 'CON', 'Constantine', 1),
(84, 3, 'DJE', 'Djelfa', 1),
(85, 3, 'EBA', 'El Bayadh', 1),
(86, 3, 'EOU', 'El Oued', 1),
(87, 3, 'ETA', 'El Tarf', 1),
(88, 3, 'GHA', 'Ghardaia', 1),
(89, 3, 'GUE', 'Guelma', 1),
(90, 3, 'ILL', 'Illizi', 1),
(91, 3, 'JIJ', 'Jijel', 1),
(92, 3, 'KHE', 'Khenchela', 1),
(93, 3, 'LAG', 'Laghouat', 1),
(94, 3, 'MUA', 'Muaskar', 1),
(95, 3, 'MED', 'Medea', 1),
(96, 3, 'MIL', 'Mila', 1),
(97, 3, 'MOS', 'Mostaganem', 1),
(98, 3, 'MSI', 'M''Sila', 1),
(99, 3, 'NAA', 'Naama', 1),
(100, 3, 'ORA', 'Oran', 1),
(101, 3, 'OUA', 'Ouargla', 1),
(102, 3, 'OEB', 'Oum el-Bouaghi', 1),
(103, 3, 'REL', 'Relizane', 1),
(104, 3, 'SAI', 'Saida', 1),
(105, 3, 'SET', 'Setif', 1),
(106, 3, 'SBA', 'Sidi Bel Abbes', 1),
(107, 3, 'SKI', 'Skikda', 1),
(108, 3, 'SAH', 'Souk Ahras', 1),
(109, 3, 'TAM', 'Tamanghasset', 1),
(110, 3, 'TEB', 'Tebessa', 1),
(111, 3, 'TIA', 'Tiaret', 1),
(112, 3, 'TIN', 'Tindouf', 1),
(113, 3, 'TIP', 'Tipaza', 1),
(114, 3, 'TIS', 'Tissemsilt', 1),
(115, 3, 'TOU', 'Tizi Ouzou', 1),
(116, 3, 'TLE', 'Tlemcen', 1),
(117, 4, 'E', 'Eastern', 1),
(118, 4, 'M', 'Manu''a', 1),
(119, 4, 'R', 'Rose Island', 1),
(120, 4, 'S', 'Swains Island', 1),
(121, 4, 'W', 'Western', 1),
(122, 5, 'ALV', 'Andorra la Vella', 1),
(123, 5, 'CAN', 'Canillo', 1),
(124, 5, 'ENC', 'Encamp', 1),
(125, 5, 'ESE', 'Escaldes-Engordany', 1),
(126, 5, 'LMA', 'La Massana', 1),
(127, 5, 'ORD', 'Ordino', 1),
(128, 5, 'SJL', 'Sant Julia de Loria', 1),
(129, 6, 'BGO', 'Bengo', 1),
(130, 6, 'BGU', 'Benguela', 1),
(131, 6, 'BIE', 'Bie', 1),
(132, 6, 'CAB', 'Cabinda', 1),
(133, 6, 'CCU', 'Cuando-Cubango', 1),
(134, 6, 'CNO', 'Cuanza Norte', 1),
(135, 6, 'CUS', 'Cuanza Sul', 1),
(136, 6, 'CNN', 'Cunene', 1),
(137, 6, 'HUA', 'Huambo', 1),
(138, 6, 'HUI', 'Huila', 1),
(139, 6, 'LUA', 'Luanda', 1),
(140, 6, 'LNO', 'Lunda Norte', 1),
(141, 6, 'LSU', 'Lunda Sul', 1),
(142, 6, 'MAL', 'Malange', 1),
(143, 6, 'MOX', 'Moxico', 1),
(144, 6, 'NAM', 'Namibe', 1),
(145, 6, 'UIG', 'Uige', 1),
(146, 6, 'ZAI', 'Zaire', 1),
(147, 9, 'ASG', 'Saint George', 1),
(148, 9, 'ASJ', 'Saint John', 1),
(149, 9, 'ASM', 'Saint Mary', 1),
(150, 9, 'ASL', 'Saint Paul', 1),
(151, 9, 'ASR', 'Saint Peter', 1),
(152, 9, 'ASH', 'Saint Philip', 1),
(153, 9, 'BAR', 'Barbuda', 1),
(154, 9, 'RED', 'Redonda', 1),
(155, 10, 'AN', 'Antartida e Islas del Atlantico', 1),
(156, 10, 'BA', 'Buenos Aires', 1),
(157, 10, 'CA', 'Catamarca', 1),
(158, 10, 'CH', 'Chaco', 1),
(159, 10, 'CU', 'Chubut', 1),
(160, 10, 'CO', 'Cordoba', 1),
(161, 10, 'CR', 'Corrientes', 1),
(162, 10, 'DF', 'Distrito Federal', 1),
(163, 10, 'ER', 'Entre Rios', 1),
(164, 10, 'FO', 'Formosa', 1),
(165, 10, 'JU', 'Jujuy', 1),
(166, 10, 'LP', 'La Pampa', 1),
(167, 10, 'LR', 'La Rioja', 1),
(168, 10, 'ME', 'Mendoza', 1),
(169, 10, 'MI', 'Misiones', 1),
(170, 10, 'NE', 'Neuquen', 1),
(171, 10, 'RN', 'Rio Negro', 1),
(172, 10, 'SA', 'Salta', 1),
(173, 10, 'SJ', 'San Juan', 1),
(174, 10, 'SL', 'San Luis', 1),
(175, 10, 'SC', 'Santa Cruz', 1),
(176, 10, 'SF', 'Santa Fe', 1),
(177, 10, 'SD', 'Santiago del Estero', 1),
(178, 10, 'TF', 'Tierra del Fuego', 1),
(179, 10, 'TU', 'Tucuman', 1),
(180, 11, 'AGT', 'Aragatsotn', 1),
(181, 11, 'ARR', 'Ararat', 1),
(182, 11, 'ARM', 'Armavir', 1),
(183, 11, 'GEG', 'Geghark''unik''', 1),
(184, 11, 'KOT', 'Kotayk''', 1),
(185, 11, 'LOR', 'Lorri', 1),
(186, 11, 'SHI', 'Shirak', 1),
(187, 11, 'SYU', 'Syunik''', 1),
(188, 11, 'TAV', 'Tavush', 1),
(189, 11, 'VAY', 'Vayots'' Dzor', 1),
(190, 11, 'YER', 'Yerevan', 1),
(191, 13, 'ACT', 'Australian Capital Territory', 1),
(192, 13, 'NSW', 'New South Wales', 1),
(193, 13, 'NT', 'Northern Territory', 1),
(194, 13, 'QLD', 'Queensland', 1),
(195, 13, 'SA', 'South Australia', 1),
(196, 13, 'TAS', 'Tasmania', 1),
(197, 13, 'VIC', 'Victoria', 1),
(198, 13, 'WA', 'Western Australia', 1),
(199, 14, 'BUR', 'Burgenland', 1),
(200, 14, 'KAR', 'Kärnten', 1),
(201, 14, 'NOS', 'Nieder&ouml;sterreich', 1),
(202, 14, 'OOS', 'Ober&ouml;sterreich', 1),
(203, 14, 'SAL', 'Salzburg', 1),
(204, 14, 'STE', 'Steiermark', 1),
(205, 14, 'TIR', 'Tirol', 1),
(206, 14, 'VOR', 'Vorarlberg', 1),
(207, 14, 'WIE', 'Wien', 1),
(208, 15, 'AB', 'Ali Bayramli', 1),
(209, 15, 'ABS', 'Abseron', 1),
(210, 15, 'AGC', 'AgcabAdi', 1),
(211, 15, 'AGM', 'Agdam', 1),
(212, 15, 'AGS', 'Agdas', 1),
(213, 15, 'AGA', 'Agstafa', 1),
(214, 15, 'AGU', 'Agsu', 1),
(215, 15, 'AST', 'Astara', 1),
(216, 15, 'BA', 'Baki', 1),
(217, 15, 'BAB', 'BabAk', 1),
(218, 15, 'BAL', 'BalakAn', 1),
(219, 15, 'BAR', 'BArdA', 1),
(220, 15, 'BEY', 'Beylaqan', 1),
(221, 15, 'BIL', 'Bilasuvar', 1),
(222, 15, 'CAB', 'Cabrayil', 1),
(223, 15, 'CAL', 'Calilabab', 1),
(224, 15, 'CUL', 'Culfa', 1),
(225, 15, 'DAS', 'Daskasan', 1),
(226, 15, 'DAV', 'Davaci', 1),
(227, 15, 'FUZ', 'Fuzuli', 1),
(228, 15, 'GA', 'Ganca', 1),
(229, 15, 'GAD', 'Gadabay', 1),
(230, 15, 'GOR', 'Goranboy', 1),
(231, 15, 'GOY', 'Goycay', 1),
(232, 15, 'HAC', 'Haciqabul', 1),
(233, 15, 'IMI', 'Imisli', 1),
(234, 15, 'ISM', 'Ismayilli', 1),
(235, 15, 'KAL', 'Kalbacar', 1),
(236, 15, 'KUR', 'Kurdamir', 1),
(237, 15, 'LA', 'Lankaran', 1),
(238, 15, 'LAC', 'Lacin', 1),
(239, 15, 'LAN', 'Lankaran', 1),
(240, 15, 'LER', 'Lerik', 1),
(241, 15, 'MAS', 'Masalli', 1),
(242, 15, 'MI', 'Mingacevir', 1),
(243, 15, 'NA', 'Naftalan', 1),
(244, 15, 'NEF', 'Neftcala', 1),
(245, 15, 'OGU', 'Oguz', 1),
(246, 15, 'ORD', 'Ordubad', 1),
(247, 15, 'QAB', 'Qabala', 1),
(248, 15, 'QAX', 'Qax', 1),
(249, 15, 'QAZ', 'Qazax', 1),
(250, 15, 'QOB', 'Qobustan', 1),
(251, 15, 'QBA', 'Quba', 1),
(252, 15, 'QBI', 'Qubadli', 1),
(253, 15, 'QUS', 'Qusar', 1),
(254, 15, 'SA', 'Saki', 1),
(255, 15, 'SAT', 'Saatli', 1),
(256, 15, 'SAB', 'Sabirabad', 1),
(257, 15, 'SAD', 'Sadarak', 1),
(258, 15, 'SAH', 'Sahbuz', 1),
(259, 15, 'SAK', 'Saki', 1),
(260, 15, 'SAL', 'Salyan', 1),
(261, 15, 'SM', 'Sumqayit', 1),
(262, 15, 'SMI', 'Samaxi', 1),
(263, 15, 'SKR', 'Samkir', 1),
(264, 15, 'SMX', 'Samux', 1),
(265, 15, 'SAR', 'Sarur', 1),
(266, 15, 'SIY', 'Siyazan', 1),
(267, 15, 'SS', 'Susa', 1),
(268, 15, 'SUS', 'Susa', 1),
(269, 15, 'TAR', 'Tartar', 1),
(270, 15, 'TOV', 'Tovuz', 1),
(271, 15, 'UCA', 'Ucar', 1),
(272, 15, 'XA', 'Xankandi', 1),
(273, 15, 'XAC', 'Xacmaz', 1),
(274, 15, 'XAN', 'Xanlar', 1),
(275, 15, 'XIZ', 'Xizi', 1),
(276, 15, 'XCI', 'Xocali', 1),
(277, 15, 'XVD', 'Xocavand', 1),
(278, 15, 'YAR', 'Yardimli', 1),
(279, 15, 'YEV', 'Yevlax', 1),
(280, 15, 'ZAN', 'Zangilan', 1),
(281, 15, 'ZAQ', 'Zaqatala', 1),
(282, 15, 'ZAR', 'Zardab', 1),
(283, 15, 'NX', 'Naxcivan', 1),
(284, 16, 'ACK', 'Acklins', 1),
(285, 16, 'BER', 'Berry Islands', 1),
(286, 16, 'BIM', 'Bimini', 1),
(287, 16, 'BLK', 'Black Point', 1),
(288, 16, 'CAT', 'Cat Island', 1),
(289, 16, 'CAB', 'Central Abaco', 1),
(290, 16, 'CAN', 'Central Andros', 1),
(291, 16, 'CEL', 'Central Eleuthera', 1),
(292, 16, 'FRE', 'City of Freeport', 1),
(293, 16, 'CRO', 'Crooked Island', 1),
(294, 16, 'EGB', 'East Grand Bahama', 1),
(295, 16, 'EXU', 'Exuma', 1),
(296, 16, 'GRD', 'Grand Cay', 1),
(297, 16, 'HAR', 'Harbour Island', 1),
(298, 16, 'HOP', 'Hope Town', 1),
(299, 16, 'INA', 'Inagua', 1),
(300, 16, 'LNG', 'Long Island', 1),
(301, 16, 'MAN', 'Mangrove Cay', 1),
(302, 16, 'MAY', 'Mayaguana', 1),
(303, 16, 'MOO', 'Moore''s Island', 1),
(304, 16, 'NAB', 'North Abaco', 1),
(305, 16, 'NAN', 'North Andros', 1),
(306, 16, 'NEL', 'North Eleuthera', 1),
(307, 16, 'RAG', 'Ragged Island', 1),
(308, 16, 'RUM', 'Rum Cay', 1),
(309, 16, 'SAL', 'San Salvador', 1),
(310, 16, 'SAB', 'South Abaco', 1),
(311, 16, 'SAN', 'South Andros', 1),
(312, 16, 'SEL', 'South Eleuthera', 1),
(313, 16, 'SWE', 'Spanish Wells', 1),
(314, 16, 'WGB', 'West Grand Bahama', 1),
(315, 17, 'CAP', 'Capital', 1),
(316, 17, 'CEN', 'Central', 1),
(317, 17, 'MUH', 'Muharraq', 1),
(318, 17, 'NOR', 'Northern', 1),
(319, 17, 'SOU', 'Southern', 1),
(320, 18, 'BAR', 'Barisal', 1),
(321, 18, 'CHI', 'Chittagong', 1),
(322, 18, 'DHA', 'Dhaka', 1),
(323, 18, 'KHU', 'Khulna', 1),
(324, 18, 'RAJ', 'Rajshahi', 1),
(325, 18, 'SYL', 'Sylhet', 1),
(326, 19, 'CC', 'Christ Church', 1),
(327, 19, 'AND', 'Saint Andrew', 1),
(328, 19, 'GEO', 'Saint George', 1),
(329, 19, 'JAM', 'Saint James', 1),
(330, 19, 'JOH', 'Saint John', 1),
(331, 19, 'JOS', 'Saint Joseph', 1),
(332, 19, 'LUC', 'Saint Lucy', 1),
(333, 19, 'MIC', 'Saint Michael', 1),
(334, 19, 'PET', 'Saint Peter', 1),
(335, 19, 'PHI', 'Saint Philip', 1),
(336, 19, 'THO', 'Saint Thomas', 1),
(337, 20, 'BR', 'Брэсцкая вобласць', 1),
(338, 20, 'VI', 'Віцебская вобласць', 1),
(339, 20, 'HO', 'Гомельская вобласць', 1),
(340, 20, 'HR', 'Гродзенская вобласць', 1),
(341, 20, 'HM', 'Мінск', 1),
(342, 20, 'MI', 'Мінская вобласць', 1),
(343, 20, 'MA', 'Магілёўская вобласць', 1),
(344, 21, 'VAN', 'Antwerpen', 1),
(345, 21, 'WBR', 'Brabant Wallon', 1),
(346, 21, 'WHT', 'Hainaut', 1),
(347, 21, 'WLG', 'Liège', 1),
(348, 21, 'VLI', 'Limburg', 1),
(349, 21, 'WLX', 'Luxembourg', 1),
(350, 21, 'WNA', 'Namur', 1),
(351, 21, 'VOV', 'Oost-Vlaanderen', 1),
(352, 21, 'VBR', 'Vlaams Brabant', 1),
(353, 21, 'VWV', 'West-Vlaanderen', 1),
(354, 22, 'BZ', 'Belize', 1),
(355, 22, 'CY', 'Cayo', 1),
(356, 22, 'CR', 'Corozal', 1),
(357, 22, 'OW', 'Orange Walk', 1),
(358, 22, 'SC', 'Stann Creek', 1),
(359, 22, 'TO', 'Toledo', 1),
(360, 23, 'AL', 'Alibori', 1),
(361, 23, 'AK', 'Atakora', 1),
(362, 23, 'AQ', 'Atlantique', 1),
(363, 23, 'BO', 'Borgou', 1),
(364, 23, 'CO', 'Collines', 1),
(365, 23, 'DO', 'Donga', 1),
(366, 23, 'KO', 'Kouffo', 1),
(367, 23, 'LI', 'Littoral', 1),
(368, 23, 'MO', 'Mono', 1),
(369, 23, 'OU', 'Oueme', 1),
(370, 23, 'PL', 'Plateau', 1),
(371, 23, 'ZO', 'Zou', 1),
(372, 24, 'DS', 'Devonshire', 1),
(373, 24, 'HC', 'Hamilton City', 1),
(374, 24, 'HA', 'Hamilton', 1),
(375, 24, 'PG', 'Paget', 1),
(376, 24, 'PB', 'Pembroke', 1),
(377, 24, 'GC', 'Saint George City', 1),
(378, 24, 'SG', 'Saint George''s', 1),
(379, 24, 'SA', 'Sandys', 1),
(380, 24, 'SM', 'Smith''s', 1),
(381, 24, 'SH', 'Southampton', 1),
(382, 24, 'WA', 'Warwick', 1),
(383, 25, 'BUM', 'Bumthang', 1),
(384, 25, 'CHU', 'Chukha', 1),
(385, 25, 'DAG', 'Dagana', 1),
(386, 25, 'GAS', 'Gasa', 1),
(387, 25, 'HAA', 'Haa', 1),
(388, 25, 'LHU', 'Lhuntse', 1),
(389, 25, 'MON', 'Mongar', 1),
(390, 25, 'PAR', 'Paro', 1),
(391, 25, 'PEM', 'Pemagatshel', 1),
(392, 25, 'PUN', 'Punakha', 1),
(393, 25, 'SJO', 'Samdrup Jongkhar', 1),
(394, 25, 'SAT', 'Samtse', 1),
(395, 25, 'SAR', 'Sarpang', 1),
(396, 25, 'THI', 'Thimphu', 1),
(397, 25, 'TRG', 'Trashigang', 1),
(398, 25, 'TRY', 'Trashiyangste', 1),
(399, 25, 'TRO', 'Trongsa', 1),
(400, 25, 'TSI', 'Tsirang', 1),
(401, 25, 'WPH', 'Wangdue Phodrang', 1),
(402, 25, 'ZHE', 'Zhemgang', 1),
(403, 26, 'BEN', 'Beni', 1),
(404, 26, 'CHU', 'Chuquisaca', 1),
(405, 26, 'COC', 'Cochabamba', 1),
(406, 26, 'LPZ', 'La Paz', 1),
(407, 26, 'ORU', 'Oruro', 1),
(408, 26, 'PAN', 'Pando', 1),
(409, 26, 'POT', 'Potosi', 1),
(410, 26, 'SCZ', 'Santa Cruz', 1),
(411, 26, 'TAR', 'Tarija', 1),
(412, 27, 'BRO', 'Brcko district', 1),
(413, 27, 'FUS', 'Unsko-Sanski Kanton', 1),
(414, 27, 'FPO', 'Posavski Kanton', 1),
(415, 27, 'FTU', 'Tuzlanski Kanton', 1),
(416, 27, 'FZE', 'Zenicko-Dobojski Kanton', 1),
(417, 27, 'FBP', 'Bosanskopodrinjski Kanton', 1),
(418, 27, 'FSB', 'Srednjebosanski Kanton', 1),
(419, 27, 'FHN', 'Hercegovacko-neretvanski Kanton', 1),
(420, 27, 'FZH', 'Zapadnohercegovacka Zupanija', 1),
(421, 27, 'FSA', 'Kanton Sarajevo', 1),
(422, 27, 'FZA', 'Zapadnobosanska', 1),
(423, 27, 'SBL', 'Banja Luka', 1),
(424, 27, 'SDO', 'Doboj', 1),
(425, 27, 'SBI', 'Bijeljina', 1),
(426, 27, 'SVL', 'Vlasenica', 1),
(427, 27, 'SSR', 'Sarajevo-Romanija or Sokolac', 1),
(428, 27, 'SFO', 'Foca', 1),
(429, 27, 'STR', 'Trebinje', 1),
(430, 28, 'CE', 'Central', 1),
(431, 28, 'GH', 'Ghanzi', 1),
(432, 28, 'KD', 'Kgalagadi', 1),
(433, 28, 'KT', 'Kgatleng', 1),
(434, 28, 'KW', 'Kweneng', 1),
(435, 28, 'NG', 'Ngamiland', 1),
(436, 28, 'NE', 'North East', 1),
(437, 28, 'NW', 'North West', 1),
(438, 28, 'SE', 'South East', 1),
(439, 28, 'SO', 'Southern', 1),
(440, 30, 'AC', 'Acre', 1),
(441, 30, 'AL', 'Alagoas', 1),
(442, 30, 'AP', 'Amapá', 1),
(443, 30, 'AM', 'Amazonas', 1),
(444, 30, 'BA', 'Bahia', 1),
(445, 30, 'CE', 'Ceará', 1),
(446, 30, 'DF', 'Distrito Federal', 1),
(447, 30, 'ES', 'Espírito Santo', 1),
(448, 30, 'GO', 'Goiás', 1),
(449, 30, 'MA', 'Maranhão', 1),
(450, 30, 'MT', 'Mato Grosso', 1),
(451, 30, 'MS', 'Mato Grosso do Sul', 1),
(452, 30, 'MG', 'Minas Gerais', 1),
(453, 30, 'PA', 'Pará', 1),
(454, 30, 'PB', 'Paraíba', 1),
(455, 30, 'PR', 'Paraná', 1),
(456, 30, 'PE', 'Pernambuco', 1),
(457, 30, 'PI', 'Piauí', 1),
(458, 30, 'RJ', 'Rio de Janeiro', 1),
(459, 30, 'RN', 'Rio Grande do Norte', 1),
(460, 30, 'RS', 'Rio Grande do Sul', 1),
(461, 30, 'RO', 'Rondônia', 1),
(462, 30, 'RR', 'Roraima', 1),
(463, 30, 'SC', 'Santa Catarina', 1),
(464, 30, 'SP', 'São Paulo', 1),
(465, 30, 'SE', 'Sergipe', 1),
(466, 30, 'TO', 'Tocantins', 1),
(467, 31, 'PB', 'Peros Banhos', 1),
(468, 31, 'SI', 'Salomon Islands', 1),
(469, 31, 'NI', 'Nelsons Island', 1),
(470, 31, 'TB', 'Three Brothers', 1),
(471, 31, 'EA', 'Eagle Islands', 1),
(472, 31, 'DI', 'Danger Island', 1),
(473, 31, 'EG', 'Egmont Islands', 1),
(474, 31, 'DG', 'Diego Garcia', 1),
(475, 32, 'BEL', 'Belait', 1),
(476, 32, 'BRM', 'Brunei and Muara', 1),
(477, 32, 'TEM', 'Temburong', 1),
(478, 32, 'TUT', 'Tutong', 1),
(479, 33, '', 'Blagoevgrad', 1),
(480, 33, '', 'Burgas', 1),
(481, 33, '', 'Dobrich', 1),
(482, 33, '', 'Gabrovo', 1),
(483, 33, '', 'Haskovo', 1),
(484, 33, '', 'Kardjali', 1),
(485, 33, '', 'Kyustendil', 1),
(486, 33, '', 'Lovech', 1),
(487, 33, '', 'Montana', 1),
(488, 33, '', 'Pazardjik', 1),
(489, 33, '', 'Pernik', 1),
(490, 33, '', 'Pleven', 1),
(491, 33, '', 'Plovdiv', 1),
(492, 33, '', 'Razgrad', 1),
(493, 33, '', 'Shumen', 1),
(494, 33, '', 'Silistra', 1),
(495, 33, '', 'Sliven', 1),
(496, 33, '', 'Smolyan', 1),
(497, 33, '', 'Sofia', 1),
(498, 33, '', 'Sofia - town', 1),
(499, 33, '', 'Stara Zagora', 1),
(500, 33, '', 'Targovishte', 1),
(501, 33, '', 'Varna', 1),
(502, 33, '', 'Veliko Tarnovo', 1),
(503, 33, '', 'Vidin', 1),
(504, 33, '', 'Vratza', 1),
(505, 33, '', 'Yambol', 1),
(506, 34, 'BAL', 'Bale', 1),
(507, 34, 'BAM', 'Bam', 1),
(508, 34, 'BAN', 'Banwa', 1),
(509, 34, 'BAZ', 'Bazega', 1),
(510, 34, 'BOR', 'Bougouriba', 1),
(511, 34, 'BLG', 'Boulgou', 1),
(512, 34, 'BOK', 'Boulkiemde', 1),
(513, 34, 'COM', 'Comoe', 1),
(514, 34, 'GAN', 'Ganzourgou', 1),
(515, 34, 'GNA', 'Gnagna', 1),
(516, 34, 'GOU', 'Gourma', 1),
(517, 34, 'HOU', 'Houet', 1),
(518, 34, 'IOA', 'Ioba', 1),
(519, 34, 'KAD', 'Kadiogo', 1),
(520, 34, 'KEN', 'Kenedougou', 1),
(521, 34, 'KOD', 'Komondjari', 1),
(522, 34, 'KOP', 'Kompienga', 1),
(523, 34, 'KOS', 'Kossi', 1),
(524, 34, 'KOL', 'Koulpelogo', 1),
(525, 34, 'KOT', 'Kouritenga', 1),
(526, 34, 'KOW', 'Kourweogo', 1),
(527, 34, 'LER', 'Leraba', 1),
(528, 34, 'LOR', 'Loroum', 1),
(529, 34, 'MOU', 'Mouhoun', 1),
(530, 34, 'NAH', 'Nahouri', 1),
(531, 34, 'NAM', 'Namentenga', 1),
(532, 34, 'NAY', 'Nayala', 1),
(533, 34, 'NOU', 'Noumbiel', 1),
(534, 34, 'OUB', 'Oubritenga', 1),
(535, 34, 'OUD', 'Oudalan', 1),
(536, 34, 'PAS', 'Passore', 1),
(537, 34, 'PON', 'Poni', 1),
(538, 34, 'SAG', 'Sanguie', 1),
(539, 34, 'SAM', 'Sanmatenga', 1),
(540, 34, 'SEN', 'Seno', 1),
(541, 34, 'SIS', 'Sissili', 1),
(542, 34, 'SOM', 'Soum', 1),
(543, 34, 'SOR', 'Sourou', 1),
(544, 34, 'TAP', 'Tapoa', 1),
(545, 34, 'TUY', 'Tuy', 1),
(546, 34, 'YAG', 'Yagha', 1),
(547, 34, 'YAT', 'Yatenga', 1),
(548, 34, 'ZIR', 'Ziro', 1),
(549, 34, 'ZOD', 'Zondoma', 1),
(550, 34, 'ZOW', 'Zoundweogo', 1),
(551, 35, 'BB', 'Bubanza', 1),
(552, 35, 'BJ', 'Bujumbura', 1),
(553, 35, 'BR', 'Bururi', 1),
(554, 35, 'CA', 'Cankuzo', 1),
(555, 35, 'CI', 'Cibitoke', 1),
(556, 35, 'GI', 'Gitega', 1),
(557, 35, 'KR', 'Karuzi', 1),
(558, 35, 'KY', 'Kayanza', 1),
(559, 35, 'KI', 'Kirundo', 1),
(560, 35, 'MA', 'Makamba', 1),
(561, 35, 'MU', 'Muramvya', 1),
(562, 35, 'MY', 'Muyinga', 1),
(563, 35, 'MW', 'Mwaro', 1),
(564, 35, 'NG', 'Ngozi', 1),
(565, 35, 'RT', 'Rutana', 1),
(566, 35, 'RY', 'Ruyigi', 1),
(567, 36, 'PP', 'Phnom Penh', 1),
(568, 36, 'PS', 'Preah Seihanu (Kompong Som or Si', 1),
(569, 36, 'PA', 'Pailin', 1),
(570, 36, 'KB', 'Keb', 1),
(571, 36, 'BM', 'Banteay Meanchey', 1),
(572, 36, 'BA', 'Battambang', 1),
(573, 36, 'KM', 'Kampong Cham', 1),
(574, 36, 'KN', 'Kampong Chhnang', 1),
(575, 36, 'KU', 'Kampong Speu', 1),
(576, 36, 'KO', 'Kampong Som', 1),
(577, 36, 'KT', 'Kampong Thom', 1),
(578, 36, 'KP', 'Kampot', 1),
(579, 36, 'KL', 'Kandal', 1),
(580, 36, 'KK', 'Kaoh Kong', 1),
(581, 36, 'KR', 'Kratie', 1),
(582, 36, 'MK', 'Mondul Kiri', 1),
(583, 36, 'OM', 'Oddar Meancheay', 1),
(584, 36, 'PU', 'Pursat', 1),
(585, 36, 'PR', 'Preah Vihear', 1),
(586, 36, 'PG', 'Prey Veng', 1),
(587, 36, 'RK', 'Ratanak Kiri', 1),
(588, 36, 'SI', 'Siemreap', 1),
(589, 36, 'ST', 'Stung Treng', 1),
(590, 36, 'SR', 'Svay Rieng', 1),
(591, 36, 'TK', 'Takeo', 1),
(592, 37, 'ADA', 'Adamawa (Adamaoua)', 1),
(593, 37, 'CEN', 'Centre', 1),
(594, 37, 'EST', 'East (Est)', 1),
(595, 37, 'EXN', 'Extreme North (Extreme-Nord)', 1),
(596, 37, 'LIT', 'Littoral', 1),
(597, 37, 'NOR', 'North (Nord)', 1),
(598, 37, 'NOT', 'Northwest (Nord-Ouest)', 1),
(599, 37, 'OUE', 'West (Ouest)', 1),
(600, 37, 'SUD', 'South (Sud)', 1),
(601, 37, 'SOU', 'Southwest (Sud-Ouest).', 1),
(602, 38, 'AB', 'Alberta', 1),
(603, 38, 'BC', 'British Columbia', 1),
(604, 38, 'MB', 'Manitoba', 1),
(605, 38, 'NB', 'New Brunswick', 1),
(606, 38, 'NL', 'Newfoundland and Labrador', 1),
(607, 38, 'NT', 'Northwest Territories', 1),
(608, 38, 'NS', 'Nova Scotia', 1),
(609, 38, 'NU', 'Nunavut', 1),
(610, 38, 'ON', 'Ontario', 1),
(611, 38, 'PE', 'Prince Edward Island', 1),
(612, 38, 'QC', 'Qu&eacute;bec', 1),
(613, 38, 'SK', 'Saskatchewan', 1),
(614, 38, 'YT', 'Yukon Territory', 1),
(615, 39, 'BV', 'Boa Vista', 1),
(616, 39, 'BR', 'Brava', 1),
(617, 39, 'CS', 'Calheta de Sao Miguel', 1),
(618, 39, 'MA', 'Maio', 1),
(619, 39, 'MO', 'Mosteiros', 1),
(620, 39, 'PA', 'Paul', 1),
(621, 39, 'PN', 'Porto Novo', 1),
(622, 39, 'PR', 'Praia', 1),
(623, 39, 'RG', 'Ribeira Grande', 1),
(624, 39, 'SL', 'Sal', 1),
(625, 39, 'CA', 'Santa Catarina', 1),
(626, 39, 'CR', 'Santa Cruz', 1),
(627, 39, 'SD', 'Sao Domingos', 1),
(628, 39, 'SF', 'Sao Filipe', 1),
(629, 39, 'SN', 'Sao Nicolau', 1),
(630, 39, 'SV', 'Sao Vicente', 1),
(631, 39, 'TA', 'Tarrafal', 1),
(632, 40, 'CR', 'Creek', 1),
(633, 40, 'EA', 'Eastern', 1),
(634, 40, 'ML', 'Midland', 1),
(635, 40, 'ST', 'South Town', 1),
(636, 40, 'SP', 'Spot Bay', 1),
(637, 40, 'SK', 'Stake Bay', 1),
(638, 40, 'WD', 'West End', 1),
(639, 40, 'WN', 'Western', 1),
(640, 41, 'BBA', 'Bamingui-Bangoran', 1),
(641, 41, 'BKO', 'Basse-Kotto', 1),
(642, 41, 'HKO', 'Haute-Kotto', 1),
(643, 41, 'HMB', 'Haut-Mbomou', 1),
(644, 41, 'KEM', 'Kemo', 1),
(645, 41, 'LOB', 'Lobaye', 1),
(646, 41, 'MKD', 'Mambere-KadeÔ', 1),
(647, 41, 'MBO', 'Mbomou', 1),
(648, 41, 'NMM', 'Nana-Mambere', 1),
(649, 41, 'OMP', 'Ombella-M''Poko', 1),
(650, 41, 'OUK', 'Ouaka', 1),
(651, 41, 'OUH', 'Ouham', 1),
(652, 41, 'OPE', 'Ouham-Pende', 1),
(653, 41, 'VAK', 'Vakaga', 1),
(654, 41, 'NGR', 'Nana-Grebizi', 1),
(655, 41, 'SMB', 'Sangha-Mbaere', 1),
(656, 41, 'BAN', 'Bangui', 1),
(657, 42, 'BA', 'Batha', 1),
(658, 42, 'BI', 'Biltine', 1),
(659, 42, 'BE', 'Borkou-Ennedi-Tibesti', 1),
(660, 42, 'CB', 'Chari-Baguirmi', 1),
(661, 42, 'GU', 'Guera', 1),
(662, 42, 'KA', 'Kanem', 1),
(663, 42, 'LA', 'Lac', 1),
(664, 42, 'LC', 'Logone Occidental', 1),
(665, 42, 'LR', 'Logone Oriental', 1),
(666, 42, 'MK', 'Mayo-Kebbi', 1),
(667, 42, 'MC', 'Moyen-Chari', 1),
(668, 42, 'OU', 'Ouaddai', 1),
(669, 42, 'SA', 'Salamat', 1),
(670, 42, 'TA', 'Tandjile', 1),
(671, 43, 'AI', 'Aisen del General Carlos Ibanez', 1),
(672, 43, 'AN', 'Antofagasta', 1),
(673, 43, 'AR', 'Araucania', 1),
(674, 43, 'AT', 'Atacama', 1),
(675, 43, 'BI', 'Bio-Bio', 1),
(676, 43, 'CO', 'Coquimbo', 1),
(677, 43, 'LI', 'Libertador General Bernardo O''Hi', 1),
(678, 43, 'LL', 'Los Lagos', 1),
(679, 43, 'MA', 'Magallanes y de la Antartica Chi', 1),
(680, 43, 'ML', 'Maule', 1),
(681, 43, 'RM', 'Region Metropolitana', 1),
(682, 43, 'TA', 'Tarapaca', 1),
(683, 43, 'VS', 'Valparaiso', 1),
(684, 44, 'AN', 'Anhui', 1),
(685, 44, 'BE', 'Beijing', 1),
(686, 44, 'CH', 'Chongqing', 1),
(687, 44, 'FU', 'Fujian', 1),
(688, 44, 'GA', 'Gansu', 1),
(689, 44, 'GU', 'Guangdong', 1),
(690, 44, 'GX', 'Guangxi', 1),
(691, 44, 'GZ', 'Guizhou', 1),
(692, 44, 'HA', 'Hainan', 1),
(693, 44, 'HB', 'Hebei', 1),
(694, 44, 'HL', 'Heilongjiang', 1),
(695, 44, 'HE', 'Henan', 1),
(696, 44, 'HK', 'Hong Kong', 1),
(697, 44, 'HU', 'Hubei', 1),
(698, 44, 'HN', 'Hunan', 1),
(699, 44, 'IM', 'Inner Mongolia', 1),
(700, 44, 'JI', 'Jiangsu', 1),
(701, 44, 'JX', 'Jiangxi', 1),
(702, 44, 'JL', 'Jilin', 1),
(703, 44, 'LI', 'Liaoning', 1),
(704, 44, 'MA', 'Macau', 1),
(705, 44, 'NI', 'Ningxia', 1),
(706, 44, 'SH', 'Shaanxi', 1),
(707, 44, 'SA', 'Shandong', 1),
(708, 44, 'SG', 'Shanghai', 1),
(709, 44, 'SX', 'Shanxi', 1),
(710, 44, 'SI', 'Sichuan', 1),
(711, 44, 'TI', 'Tianjin', 1),
(712, 44, 'XI', 'Xinjiang', 1),
(713, 44, 'YU', 'Yunnan', 1),
(714, 44, 'ZH', 'Zhejiang', 1),
(715, 46, 'D', 'Direction Island', 1),
(716, 46, 'H', 'Home Island', 1),
(717, 46, 'O', 'Horsburgh Island', 1),
(718, 46, 'S', 'South Island', 1),
(719, 46, 'W', 'West Island', 1),
(720, 47, 'AMZ', 'Amazonas', 1),
(721, 47, 'ANT', 'Antioquia', 1),
(722, 47, 'ARA', 'Arauca', 1),
(723, 47, 'ATL', 'Atlantico', 1),
(724, 47, 'BDC', 'Bogota D.C.', 1),
(725, 47, 'BOL', 'Bolivar', 1),
(726, 47, 'BOY', 'Boyaca', 1),
(727, 47, 'CAL', 'Caldas', 1),
(728, 47, 'CAQ', 'Caqueta', 1),
(729, 47, 'CAS', 'Casanare', 1),
(730, 47, 'CAU', 'Cauca', 1),
(731, 47, 'CES', 'Cesar', 1),
(732, 47, 'CHO', 'Choco', 1),
(733, 47, 'COR', 'Cordoba', 1),
(734, 47, 'CAM', 'Cundinamarca', 1),
(735, 47, 'GNA', 'Guainia', 1),
(736, 47, 'GJR', 'Guajira', 1),
(737, 47, 'GVR', 'Guaviare', 1),
(738, 47, 'HUI', 'Huila', 1),
(739, 47, 'MAG', 'Magdalena', 1),
(740, 47, 'MET', 'Meta', 1),
(741, 47, 'NAR', 'Narino', 1),
(742, 47, 'NDS', 'Norte de Santander', 1),
(743, 47, 'PUT', 'Putumayo', 1),
(744, 47, 'QUI', 'Quindio', 1),
(745, 47, 'RIS', 'Risaralda', 1),
(746, 47, 'SAP', 'San Andres y Providencia', 1),
(747, 47, 'SAN', 'Santander', 1),
(748, 47, 'SUC', 'Sucre', 1),
(749, 47, 'TOL', 'Tolima', 1),
(750, 47, 'VDC', 'Valle del Cauca', 1),
(751, 47, 'VAU', 'Vaupes', 1),
(752, 47, 'VIC', 'Vichada', 1),
(753, 48, 'G', 'Grande Comore', 1),
(754, 48, 'A', 'Anjouan', 1),
(755, 48, 'M', 'Moheli', 1),
(756, 49, 'BO', 'Bouenza', 1),
(757, 49, 'BR', 'Brazzaville', 1),
(758, 49, 'CU', 'Cuvette', 1),
(759, 49, 'CO', 'Cuvette-Ouest', 1),
(760, 49, 'KO', 'Kouilou', 1),
(761, 49, 'LE', 'Lekoumou', 1),
(762, 49, 'LI', 'Likouala', 1),
(763, 49, 'NI', 'Niari', 1),
(764, 49, 'PL', 'Plateaux', 1),
(765, 49, 'PO', 'Pool', 1),
(766, 49, 'SA', 'Sangha', 1),
(767, 50, 'PU', 'Pukapuka', 1),
(768, 50, 'RK', 'Rakahanga', 1),
(769, 50, 'MK', 'Manihiki', 1),
(770, 50, 'PE', 'Penrhyn', 1),
(771, 50, 'NI', 'Nassau Island', 1),
(772, 50, 'SU', 'Surwarrow', 1),
(773, 50, 'PA', 'Palmerston', 1),
(774, 50, 'AI', 'Aitutaki', 1),
(775, 50, 'MA', 'Manuae', 1),
(776, 50, 'TA', 'Takutea', 1),
(777, 50, 'MT', 'Mitiaro', 1),
(778, 50, 'AT', 'Atiu', 1),
(779, 50, 'MU', 'Mauke', 1),
(780, 50, 'RR', 'Rarotonga', 1),
(781, 50, 'MG', 'Mangaia', 1),
(782, 51, 'AL', 'Alajuela', 1),
(783, 51, 'CA', 'Cartago', 1),
(784, 51, 'GU', 'Guanacaste', 1),
(785, 51, 'HE', 'Heredia', 1),
(786, 51, 'LI', 'Limon', 1),
(787, 51, 'PU', 'Puntarenas', 1),
(788, 51, 'SJ', 'San Jose', 1),
(789, 52, 'ABE', 'Abengourou', 1),
(790, 52, 'ABI', 'Abidjan', 1),
(791, 52, 'ABO', 'Aboisso', 1),
(792, 52, 'ADI', 'Adiake', 1),
(793, 52, 'ADZ', 'Adzope', 1),
(794, 52, 'AGB', 'Agboville', 1),
(795, 52, 'AGN', 'Agnibilekrou', 1),
(796, 52, 'ALE', 'Alepe', 1),
(797, 52, 'BOC', 'Bocanda', 1),
(798, 52, 'BAN', 'Bangolo', 1),
(799, 52, 'BEO', 'Beoumi', 1),
(800, 52, 'BIA', 'Biankouma', 1),
(801, 52, 'BDK', 'Bondoukou', 1),
(802, 52, 'BGN', 'Bongouanou', 1),
(803, 52, 'BFL', 'Bouafle', 1),
(804, 52, 'BKE', 'Bouake', 1),
(805, 52, 'BNA', 'Bouna', 1),
(806, 52, 'BDL', 'Boundiali', 1),
(807, 52, 'DKL', 'Dabakala', 1),
(808, 52, 'DBU', 'Dabou', 1),
(809, 52, 'DAL', 'Daloa', 1),
(810, 52, 'DAN', 'Danane', 1),
(811, 52, 'DAO', 'Daoukro', 1),
(812, 52, 'DIM', 'Dimbokro', 1),
(813, 52, 'DIV', 'Divo', 1),
(814, 52, 'DUE', 'Duekoue', 1),
(815, 52, 'FER', 'Ferkessedougou', 1),
(816, 52, 'GAG', 'Gagnoa', 1),
(817, 52, 'GBA', 'Grand-Bassam', 1),
(818, 52, 'GLA', 'Grand-Lahou', 1),
(819, 52, 'GUI', 'Guiglo', 1),
(820, 52, 'ISS', 'Issia', 1),
(821, 52, 'JAC', 'Jacqueville', 1),
(822, 52, 'KAT', 'Katiola', 1),
(823, 52, 'KOR', 'Korhogo', 1),
(824, 52, 'LAK', 'Lakota', 1),
(825, 52, 'MAN', 'Man', 1),
(826, 52, 'MKN', 'Mankono', 1),
(827, 52, 'MBA', 'Mbahiakro', 1),
(828, 52, 'ODI', 'Odienne', 1),
(829, 52, 'OUM', 'Oume', 1),
(830, 52, 'SAK', 'Sakassou', 1),
(831, 52, 'SPE', 'San-Pedro', 1),
(832, 52, 'SAS', 'Sassandra', 1),
(833, 52, 'SEG', 'Seguela', 1),
(834, 52, 'SIN', 'Sinfra', 1),
(835, 52, 'SOU', 'Soubre', 1),
(836, 52, 'TAB', 'Tabou', 1),
(837, 52, 'TAN', 'Tanda', 1),
(838, 52, 'TIE', 'Tiebissou', 1),
(839, 52, 'TIN', 'Tingrela', 1),
(840, 52, 'TIA', 'Tiassale', 1),
(841, 52, 'TBA', 'Touba', 1),
(842, 52, 'TLP', 'Toulepleu', 1),
(843, 52, 'TMD', 'Toumodi', 1),
(844, 52, 'VAV', 'Vavoua', 1),
(845, 52, 'YAM', 'Yamoussoukro', 1),
(846, 52, 'ZUE', 'Zuenoula', 1),
(847, 53, 'BB', 'Bjelovarsko-bilogorska', 1),
(848, 53, 'GZ', 'Grad Zagreb', 1),
(849, 53, 'DN', 'Dubrovačko-neretvanska', 1),
(850, 53, 'IS', 'Istarska', 1),
(851, 53, 'KA', 'Karlovačka', 1),
(852, 53, 'KK', 'Koprivničko-križevačka', 1),
(853, 53, 'KZ', 'Krapinsko-zagorska', 1),
(854, 53, 'LS', 'Ličko-senjska', 1),
(855, 53, 'ME', 'Međimurska', 1),
(856, 53, 'OB', 'Osječko-baranjska', 1),
(857, 53, 'PS', 'Požeško-slavonska', 1),
(858, 53, 'PG', 'Primorsko-goranska', 1),
(859, 53, 'SK', 'Šibensko-kninska', 1),
(860, 53, 'SM', 'Sisačko-moslavačka', 1),
(861, 53, 'BP', 'Brodsko-posavska', 1),
(862, 53, 'SD', 'Splitsko-dalmatinska', 1),
(863, 53, 'VA', 'Varaždinska', 1),
(864, 53, 'VP', 'Virovitičko-podravska', 1),
(865, 53, 'VS', 'Vukovarsko-srijemska', 1),
(866, 53, 'ZA', 'Zadarska', 1),
(867, 53, 'ZG', 'Zagrebačka', 1),
(868, 54, 'CA', 'Camaguey', 1),
(869, 54, 'CD', 'Ciego de Avila', 1),
(870, 54, 'CI', 'Cienfuegos', 1),
(871, 54, 'CH', 'Ciudad de La Habana', 1),
(872, 54, 'GR', 'Granma', 1),
(873, 54, 'GU', 'Guantanamo', 1),
(874, 54, 'HO', 'Holguin', 1),
(875, 54, 'IJ', 'Isla de la Juventud', 1),
(876, 54, 'LH', 'La Habana', 1),
(877, 54, 'LT', 'Las Tunas', 1),
(878, 54, 'MA', 'Matanzas', 1),
(879, 54, 'PR', 'Pinar del Rio', 1),
(880, 54, 'SS', 'Sancti Spiritus', 1),
(881, 54, 'SC', 'Santiago de Cuba', 1),
(882, 54, 'VC', 'Villa Clara', 1),
(883, 55, 'F', 'Famagusta', 1),
(884, 55, 'K', 'Kyrenia', 1),
(885, 55, 'A', 'Larnaca', 1),
(886, 55, 'I', 'Limassol', 1),
(887, 55, 'N', 'Nicosia', 1),
(888, 55, 'P', 'Paphos', 1),
(889, 56, 'U', 'Ústecký', 1),
(890, 56, 'C', 'Jihočeský', 1),
(891, 56, 'B', 'Jihomoravský', 1),
(892, 56, 'K', 'Karlovarský', 1),
(893, 56, 'H', 'Královehradecký', 1),
(894, 56, 'L', 'Liberecký', 1),
(895, 56, 'T', 'Moravskoslezský', 1),
(896, 56, 'M', 'Olomoucký', 1),
(897, 56, 'E', 'Pardubický', 1),
(898, 56, 'P', 'Plzeňský', 1),
(899, 56, 'A', 'Praha', 1),
(900, 56, 'S', 'Středočeský', 1),
(901, 56, 'J', 'Vysočina', 1),
(902, 56, 'Z', 'Zlínský', 1),
(903, 57, 'AR', 'Arhus', 1),
(904, 57, 'BH', 'Bornholm', 1),
(905, 57, 'CO', 'Copenhagen', 1),
(906, 57, 'FO', 'Faroe Islands', 1),
(907, 57, 'FR', 'Frederiksborg', 1),
(908, 57, 'FY', 'Fyn', 1),
(909, 57, 'KO', 'Kobenhavn', 1),
(910, 57, 'NO', 'Nordjylland', 1),
(911, 57, 'RI', 'Ribe', 1),
(912, 57, 'RK', 'Ringkobing', 1),
(913, 57, 'RO', 'Roskilde', 1),
(914, 57, 'SO', 'Sonderjylland', 1),
(915, 57, 'ST', 'Storstrom', 1),
(916, 57, 'VK', 'Vejle', 1),
(917, 57, 'VJ', 'Vestj&aelig;lland', 1),
(918, 57, 'VB', 'Viborg', 1),
(919, 58, 'S', '''Ali Sabih', 1),
(920, 58, 'K', 'Dikhil', 1),
(921, 58, 'J', 'Djibouti', 1),
(922, 58, 'O', 'Obock', 1),
(923, 58, 'T', 'Tadjoura', 1),
(924, 59, 'AND', 'Saint Andrew Parish', 1),
(925, 59, 'DAV', 'Saint David Parish', 1),
(926, 59, 'GEO', 'Saint George Parish', 1),
(927, 59, 'JOH', 'Saint John Parish', 1),
(928, 59, 'JOS', 'Saint Joseph Parish', 1),
(929, 59, 'LUK', 'Saint Luke Parish', 1),
(930, 59, 'MAR', 'Saint Mark Parish', 1),
(931, 59, 'PAT', 'Saint Patrick Parish', 1),
(932, 59, 'PAU', 'Saint Paul Parish', 1),
(933, 59, 'PET', 'Saint Peter Parish', 1),
(934, 60, 'DN', 'Distrito Nacional', 1),
(935, 60, 'AZ', 'Azua', 1),
(936, 60, 'BC', 'Baoruco', 1),
(937, 60, 'BH', 'Barahona', 1),
(938, 60, 'DJ', 'Dajabon', 1),
(939, 60, 'DU', 'Duarte', 1),
(940, 60, 'EL', 'Elias Pina', 1),
(941, 60, 'SY', 'El Seybo', 1),
(942, 60, 'ET', 'Espaillat', 1),
(943, 60, 'HM', 'Hato Mayor', 1),
(944, 60, 'IN', 'Independencia', 1),
(945, 60, 'AL', 'La Altagracia', 1),
(946, 60, 'RO', 'La Romana', 1),
(947, 60, 'VE', 'La Vega', 1),
(948, 60, 'MT', 'Maria Trinidad Sanchez', 1),
(949, 60, 'MN', 'Monsenor Nouel', 1),
(950, 60, 'MC', 'Monte Cristi', 1),
(951, 60, 'MP', 'Monte Plata', 1),
(952, 60, 'PD', 'Pedernales', 1),
(953, 60, 'PR', 'Peravia (Bani)', 1),
(954, 60, 'PP', 'Puerto Plata', 1),
(955, 60, 'SL', 'Salcedo', 1),
(956, 60, 'SM', 'Samana', 1),
(957, 60, 'SH', 'Sanchez Ramirez', 1),
(958, 60, 'SC', 'San Cristobal', 1),
(959, 60, 'JO', 'San Jose de Ocoa', 1),
(960, 60, 'SJ', 'San Juan', 1),
(961, 60, 'PM', 'San Pedro de Macoris', 1),
(962, 60, 'SA', 'Santiago', 1),
(963, 60, 'ST', 'Santiago Rodriguez', 1),
(964, 60, 'SD', 'Santo Domingo', 1),
(965, 60, 'VA', 'Valverde', 1),
(966, 61, 'AL', 'Aileu', 1),
(967, 61, 'AN', 'Ainaro', 1),
(968, 61, 'BA', 'Baucau', 1),
(969, 61, 'BO', 'Bobonaro', 1),
(970, 61, 'CO', 'Cova Lima', 1),
(971, 61, 'DI', 'Dili', 1),
(972, 61, 'ER', 'Ermera', 1),
(973, 61, 'LA', 'Lautem', 1),
(974, 61, 'LI', 'Liquica', 1),
(975, 61, 'MT', 'Manatuto', 1),
(976, 61, 'MF', 'Manufahi', 1),
(977, 61, 'OE', 'Oecussi', 1),
(978, 61, 'VI', 'Viqueque', 1),
(979, 62, 'AZU', 'Azuay', 1),
(980, 62, 'BOL', 'Bolivar', 1),
(981, 62, 'CAN', 'Ca&ntilde;ar', 1),
(982, 62, 'CAR', 'Carchi', 1),
(983, 62, 'CHI', 'Chimborazo', 1),
(984, 62, 'COT', 'Cotopaxi', 1),
(985, 62, 'EOR', 'El Oro', 1),
(986, 62, 'ESM', 'Esmeraldas', 1),
(987, 62, 'GPS', 'Gal&aacute;pagos', 1),
(988, 62, 'GUA', 'Guayas', 1),
(989, 62, 'IMB', 'Imbabura', 1),
(990, 62, 'LOJ', 'Loja', 1),
(991, 62, 'LRO', 'Los Rios', 1),
(992, 62, 'MAN', 'Manab&iacute;', 1),
(993, 62, 'MSA', 'Morona Santiago', 1),
(994, 62, 'NAP', 'Napo', 1),
(995, 62, 'ORE', 'Orellana', 1),
(996, 62, 'PAS', 'Pastaza', 1),
(997, 62, 'PIC', 'Pichincha', 1),
(998, 62, 'SUC', 'Sucumb&iacute;os', 1),
(999, 62, 'TUN', 'Tungurahua', 1),
(1000, 62, 'ZCH', 'Zamora Chinchipe', 1),
(1001, 63, 'DHY', 'Ad Daqahliyah', 1),
(1002, 63, 'BAM', 'Al Bahr al Ahmar', 1),
(1003, 63, 'BHY', 'Al Buhayrah', 1),
(1004, 63, 'FYM', 'Al Fayyum', 1),
(1005, 63, 'GBY', 'Al Gharbiyah', 1),
(1006, 63, 'IDR', 'Al Iskandariyah', 1),
(1007, 63, 'IML', 'Al Isma''iliyah', 1),
(1008, 63, 'JZH', 'Al Jizah', 1),
(1009, 63, 'MFY', 'Al Minufiyah', 1),
(1010, 63, 'MNY', 'Al Minya', 1),
(1011, 63, 'QHR', 'Al Qahirah', 1),
(1012, 63, 'QLY', 'Al Qalyubiyah', 1),
(1013, 63, 'WJD', 'Al Wadi al Jadid', 1),
(1014, 63, 'SHQ', 'Ash Sharqiyah', 1),
(1015, 63, 'SWY', 'As Suways', 1),
(1016, 63, 'ASW', 'Aswan', 1),
(1017, 63, 'ASY', 'Asyut', 1),
(1018, 63, 'BSW', 'Bani Suwayf', 1),
(1019, 63, 'BSD', 'Bur Sa''id', 1),
(1020, 63, 'DMY', 'Dumyat', 1),
(1021, 63, 'JNS', 'Janub Sina''', 1),
(1022, 63, 'KSH', 'Kafr ash Shaykh', 1),
(1023, 63, 'MAT', 'Matruh', 1),
(1024, 63, 'QIN', 'Qina', 1),
(1025, 63, 'SHS', 'Shamal Sina''', 1),
(1026, 63, 'SUH', 'Suhaj', 1),
(1027, 64, 'AH', 'Ahuachapan', 1),
(1028, 64, 'CA', 'Cabanas', 1),
(1029, 64, 'CH', 'Chalatenango', 1),
(1030, 64, 'CU', 'Cuscatlan', 1),
(1031, 64, 'LB', 'La Libertad', 1),
(1032, 64, 'PZ', 'La Paz', 1),
(1033, 64, 'UN', 'La Union', 1),
(1034, 64, 'MO', 'Morazan', 1),
(1035, 64, 'SM', 'San Miguel', 1),
(1036, 64, 'SS', 'San Salvador', 1),
(1037, 64, 'SV', 'San Vicente', 1),
(1038, 64, 'SA', 'Santa Ana', 1),
(1039, 64, 'SO', 'Sonsonate', 1),
(1040, 64, 'US', 'Usulutan', 1),
(1041, 65, 'AN', 'Provincia Annobon', 1),
(1042, 65, 'BN', 'Provincia Bioko Norte', 1),
(1043, 65, 'BS', 'Provincia Bioko Sur', 1),
(1044, 65, 'CS', 'Provincia Centro Sur', 1),
(1045, 65, 'KN', 'Provincia Kie-Ntem', 1),
(1046, 65, 'LI', 'Provincia Litoral', 1),
(1047, 65, 'WN', 'Provincia Wele-Nzas', 1),
(1048, 66, 'MA', 'Central (Maekel)', 1),
(1049, 66, 'KE', 'Anseba (Keren)', 1),
(1050, 66, 'DK', 'Southern Red Sea (Debub-Keih-Bah', 1),
(1051, 66, 'SK', 'Northern Red Sea (Semien-Keih-Ba', 1),
(1052, 66, 'DE', 'Southern (Debub)', 1),
(1053, 66, 'BR', 'Gash-Barka (Barentu)', 1),
(1054, 67, 'HA', 'Harjumaa (Tallinn)', 1),
(1055, 67, 'HI', 'Hiiumaa (Kardla)', 1),
(1056, 67, 'IV', 'Ida-Virumaa (Johvi)', 1),
(1057, 67, 'JA', 'Jarvamaa (Paide)', 1),
(1058, 67, 'JO', 'Jogevamaa (Jogeva)', 1),
(1059, 67, 'LV', 'Laane-Virumaa (Rakvere)', 1),
(1060, 67, 'LA', 'Laanemaa (Haapsalu)', 1),
(1061, 67, 'PA', 'Parnumaa (Parnu)', 1),
(1062, 67, 'PO', 'Polvamaa (Polva)', 1),
(1063, 67, 'RA', 'Raplamaa (Rapla)', 1),
(1064, 67, 'SA', 'Saaremaa (Kuessaare)', 1),
(1065, 67, 'TA', 'Tartumaa (Tartu)', 1),
(1066, 67, 'VA', 'Valgamaa (Valga)', 1),
(1067, 67, 'VI', 'Viljandimaa (Viljandi)', 1),
(1068, 67, 'VO', 'Vorumaa (Voru)', 1),
(1069, 68, 'AF', 'Afar', 1),
(1070, 68, 'AH', 'Amhara', 1),
(1071, 68, 'BG', 'Benishangul-Gumaz', 1),
(1072, 68, 'GB', 'Gambela', 1),
(1073, 68, 'HR', 'Hariai', 1),
(1074, 68, 'OR', 'Oromia', 1),
(1075, 68, 'SM', 'Somali', 1),
(1076, 68, 'SN', 'Southern Nations - Nationalities', 1),
(1077, 68, 'TG', 'Tigray', 1),
(1078, 68, 'AA', 'Addis Ababa', 1),
(1079, 68, 'DD', 'Dire Dawa', 1),
(1080, 71, 'C', 'Central Division', 1),
(1081, 71, 'N', 'Northern Division', 1),
(1082, 71, 'E', 'Eastern Division', 1),
(1083, 71, 'W', 'Western Division', 1),
(1084, 71, 'R', 'Rotuma', 1),
(1085, 72, 'AL', 'Ahvenanmaan lääni', 1),
(1086, 72, 'ES', 'Etelä-Suomen lääni', 1),
(1087, 72, 'IS', 'Itä-Suomen lääni', 1),
(1088, 72, 'LS', 'Länsi-Suomen lääni', 1),
(1089, 72, 'LA', 'Lapin lääni', 1),
(1090, 72, 'OU', 'Oulun lääni', 1),
(1114, 74, '01', 'Ain', 1),
(1115, 74, '02', 'Aisne', 1),
(1116, 74, '03', 'Allier', 1),
(1117, 74, '04', 'Alpes de Haute Provence', 1),
(1118, 74, '05', 'Hautes-Alpes', 1),
(1119, 74, '06', 'Alpes Maritimes', 1),
(1120, 74, '07', 'Ard&egrave;che', 1),
(1121, 74, '08', 'Ardennes', 1),
(1122, 74, '09', 'Ari&egrave;ge', 1),
(1123, 74, '10', 'Aube', 1),
(1124, 74, '11', 'Aude', 1),
(1125, 74, '12', 'Aveyron', 1),
(1126, 74, '13', 'Bouches du Rh&ocirc;ne', 1),
(1127, 74, '14', 'Calvados', 1),
(1128, 74, '15', 'Cantal', 1),
(1129, 74, '16', 'Charente', 1),
(1130, 74, '17', 'Charente Maritime', 1),
(1131, 74, '18', 'Cher', 1),
(1132, 74, '19', 'Corr&egrave;ze', 1),
(1133, 74, '2A', 'Corse du Sud', 1),
(1134, 74, '2B', 'Haute Corse', 1),
(1135, 74, '21', 'C&ocirc;te d&#039;or', 1),
(1136, 74, '22', 'C&ocirc;tes d&#039;Armor', 1),
(1137, 74, '23', 'Creuse', 1),
(1138, 74, '24', 'Dordogne', 1),
(1139, 74, '25', 'Doubs', 1),
(1140, 74, '26', 'Dr&ocirc;me', 1),
(1141, 74, '27', 'Eure', 1),
(1142, 74, '28', 'Eure et Loir', 1),
(1143, 74, '29', 'Finist&egrave;re', 1),
(1144, 74, '30', 'Gard', 1),
(1145, 74, '31', 'Haute Garonne', 1),
(1146, 74, '32', 'Gers', 1),
(1147, 74, '33', 'Gironde', 1),
(1148, 74, '34', 'H&eacute;rault', 1),
(1149, 74, '35', 'Ille et Vilaine', 1),
(1150, 74, '36', 'Indre', 1),
(1151, 74, '37', 'Indre et Loire', 1),
(1152, 74, '38', 'Is&eacute;re', 1),
(1153, 74, '39', 'Jura', 1),
(1154, 74, '40', 'Landes', 1),
(1155, 74, '41', 'Loir et Cher', 1),
(1156, 74, '42', 'Loire', 1),
(1157, 74, '43', 'Haute Loire', 1),
(1158, 74, '44', 'Loire Atlantique', 1),
(1159, 74, '45', 'Loiret', 1),
(1160, 74, '46', 'Lot', 1),
(1161, 74, '47', 'Lot et Garonne', 1),
(1162, 74, '48', 'Loz&egrave;re', 1),
(1163, 74, '49', 'Maine et Loire', 1),
(1164, 74, '50', 'Manche', 1),
(1165, 74, '51', 'Marne', 1),
(1166, 74, '52', 'Haute Marne', 1),
(1167, 74, '53', 'Mayenne', 1),
(1168, 74, '54', 'Meurthe et Moselle', 1),
(1169, 74, '55', 'Meuse', 1),
(1170, 74, '56', 'Morbihan', 1),
(1171, 74, '57', 'Moselle', 1),
(1172, 74, '58', 'Ni&egrave;vre', 1),
(1173, 74, '59', 'Nord', 1),
(1174, 74, '60', 'Oise', 1),
(1175, 74, '61', 'Orne', 1),
(1176, 74, '62', 'Pas de Calais', 1),
(1177, 74, '63', 'Puy de D&ocirc;me', 1),
(1178, 74, '64', 'Pyr&eacute;n&eacute;es Atlantiqu', 1),
(1179, 74, '65', 'Hautes Pyr&eacute;n&eacute;es', 1),
(1180, 74, '66', 'Pyr&eacute;n&eacute;es Orientale', 1),
(1181, 74, '67', 'Bas Rhin', 1),
(1182, 74, '68', 'Haut Rhin', 1),
(1183, 74, '69', 'Rh&ocirc;ne', 1),
(1184, 74, '70', 'Haute Sa&ocirc;ne', 1),
(1185, 74, '71', 'Sa&ocirc;ne et Loire', 1),
(1186, 74, '72', 'Sarthe', 1),
(1187, 74, '73', 'Savoie', 1),
(1188, 74, '74', 'Haute Savoie', 1),
(1189, 74, '75', 'Paris', 1),
(1190, 74, '76', 'Seine Maritime', 1),
(1191, 74, '77', 'Seine et Marne', 1),
(1192, 74, '78', 'Yvelines', 1),
(1193, 74, '79', 'Deux S&egrave;vres', 1),
(1194, 74, '80', 'Somme', 1),
(1195, 74, '81', 'Tarn', 1),
(1196, 74, '82', 'Tarn et Garonne', 1),
(1197, 74, '83', 'Var', 1),
(1198, 74, '84', 'Vaucluse', 1),
(1199, 74, '85', 'Vend&eacute;e', 1),
(1200, 74, '86', 'Vienne', 1),
(1201, 74, '87', 'Haute Vienne', 1),
(1202, 74, '88', 'Vosges', 1),
(1203, 74, '89', 'Yonne', 1),
(1204, 74, '90', 'Territoire de Belfort', 1),
(1205, 74, '91', 'Essonne', 1),
(1206, 74, '92', 'Hauts de Seine', 1),
(1207, 74, '93', 'Seine St-Denis', 1),
(1208, 74, '94', 'Val de Marne', 1),
(1209, 74, '95', 'Val d''Oise', 1),
(1210, 76, 'M', 'Archipel des Marquises', 1),
(1211, 76, 'T', 'Archipel des Tuamotu', 1),
(1212, 76, 'I', 'Archipel des Tubuai', 1),
(1213, 76, 'V', 'Iles du Vent', 1),
(1214, 76, 'S', 'Iles Sous-le-Vent', 1),
(1215, 77, 'C', 'Iles Crozet', 1),
(1216, 77, 'K', 'Iles Kerguelen', 1),
(1217, 77, 'A', 'Ile Amsterdam', 1),
(1218, 77, 'P', 'Ile Saint-Paul', 1),
(1219, 77, 'D', 'Adelie Land', 1),
(1220, 78, 'ES', 'Estuaire', 1),
(1221, 78, 'HO', 'Haut-Ogooue', 1),
(1222, 78, 'MO', 'Moyen-Ogooue', 1),
(1223, 78, 'NG', 'Ngounie', 1),
(1224, 78, 'NY', 'Nyanga', 1),
(1225, 78, 'OI', 'Ogooue-Ivindo', 1),
(1226, 78, 'OL', 'Ogooue-Lolo', 1),
(1227, 78, 'OM', 'Ogooue-Maritime', 1),
(1228, 78, 'WN', 'Woleu-Ntem', 1),
(1229, 79, 'BJ', 'Banjul', 1),
(1230, 79, 'BS', 'Basse', 1),
(1231, 79, 'BR', 'Brikama', 1),
(1232, 79, 'JA', 'Janjangbure', 1),
(1233, 79, 'KA', 'Kanifeng', 1),
(1234, 79, 'KE', 'Kerewan', 1),
(1235, 79, 'KU', 'Kuntaur', 1),
(1236, 79, 'MA', 'Mansakonko', 1),
(1237, 79, 'LR', 'Lower River', 1),
(1238, 79, 'CR', 'Central River', 1),
(1239, 79, 'NB', 'North Bank', 1),
(1240, 79, 'UR', 'Upper River', 1),
(1241, 79, 'WE', 'Western', 1),
(1242, 80, 'AB', 'Abkhazia', 1),
(1243, 80, 'AJ', 'Ajaria', 1),
(1244, 80, 'TB', 'Tbilisi', 1),
(1245, 80, 'GU', 'Guria', 1),
(1246, 80, 'IM', 'Imereti', 1),
(1247, 80, 'KA', 'Kakheti', 1),
(1248, 80, 'KK', 'Kvemo Kartli', 1),
(1249, 80, 'MM', 'Mtskheta-Mtianeti', 1),
(1250, 80, 'RL', 'Racha Lechkhumi and Kvemo Svanet', 1),
(1251, 80, 'SZ', 'Samegrelo-Zemo Svaneti', 1),
(1252, 80, 'SJ', 'Samtskhe-Javakheti', 1),
(1253, 80, 'SK', 'Shida Kartli', 1),
(1254, 81, 'BAW', 'Baden-W&uuml;rttemberg', 1),
(1255, 81, 'BAY', 'Bayern', 1),
(1256, 81, 'BER', 'Berlin', 1),
(1257, 81, 'BRG', 'Brandenburg', 1),
(1258, 81, 'BRE', 'Bremen', 1),
(1259, 81, 'HAM', 'Hamburg', 1),
(1260, 81, 'HES', 'Hessen', 1),
(1261, 81, 'MEC', 'Mecklenburg-Vorpommern', 1),
(1262, 81, 'NDS', 'Niedersachsen', 1),
(1263, 81, 'NRW', 'Nordrhein-Westfalen', 1),
(1264, 81, 'RHE', 'Rheinland-Pfalz', 1),
(1265, 81, 'SAR', 'Saarland', 1),
(1266, 81, 'SAS', 'Sachsen', 1),
(1267, 81, 'SAC', 'Sachsen-Anhalt', 1),
(1268, 81, 'SCN', 'Schleswig-Holstein', 1),
(1269, 81, 'THE', 'Th&uuml;ringen', 1),
(1270, 82, 'AS', 'Ashanti Region', 1),
(1271, 82, 'BA', 'Brong-Ahafo Region', 1),
(1272, 82, 'CE', 'Central Region', 1),
(1273, 82, 'EA', 'Eastern Region', 1),
(1274, 82, 'GA', 'Greater Accra Region', 1),
(1275, 82, 'NO', 'Northern Region', 1),
(1276, 82, 'UE', 'Upper East Region', 1),
(1277, 82, 'UW', 'Upper West Region', 1),
(1278, 82, 'VO', 'Volta Region', 1),
(1279, 82, 'WE', 'Western Region', 1),
(1280, 84, 'AT', 'Attica', 1),
(1281, 84, 'CN', 'Central Greece', 1),
(1282, 84, 'CM', 'Central Macedonia', 1),
(1283, 84, 'CR', 'Crete', 1),
(1284, 84, 'EM', 'East Macedonia and Thrace', 1),
(1285, 84, 'EP', 'Epirus', 1),
(1286, 84, 'II', 'Ionian Islands', 1),
(1287, 84, 'NA', 'North Aegean', 1),
(1288, 84, 'PP', 'Peloponnesos', 1),
(1289, 84, 'SA', 'South Aegean', 1),
(1290, 84, 'TH', 'Thessaly', 1),
(1291, 84, 'WG', 'West Greece', 1),
(1292, 84, 'WM', 'West Macedonia', 1),
(1293, 85, 'A', 'Avannaa', 1),
(1294, 85, 'T', 'Tunu', 1),
(1295, 85, 'K', 'Kitaa', 1),
(1296, 86, 'A', 'Saint Andrew', 1),
(1297, 86, 'D', 'Saint David', 1),
(1298, 86, 'G', 'Saint George', 1),
(1299, 86, 'J', 'Saint John', 1),
(1300, 86, 'M', 'Saint Mark', 1),
(1301, 86, 'P', 'Saint Patrick', 1),
(1302, 86, 'C', 'Carriacou', 1),
(1303, 86, 'Q', 'Petit Martinique', 1),
(1304, 89, 'AV', 'Alta Verapaz', 1),
(1305, 89, 'BV', 'Baja Verapaz', 1),
(1306, 89, 'CM', 'Chimaltenango', 1),
(1307, 89, 'CQ', 'Chiquimula', 1),
(1308, 89, 'PE', 'El Peten', 1),
(1309, 89, 'PR', 'El Progreso', 1),
(1310, 89, 'QC', 'El Quiche', 1),
(1311, 89, 'ES', 'Escuintla', 1),
(1312, 89, 'GU', 'Guatemala', 1),
(1313, 89, 'HU', 'Huehuetenango', 1),
(1314, 89, 'IZ', 'Izabal', 1),
(1315, 89, 'JA', 'Jalapa', 1),
(1316, 89, 'JU', 'Jutiapa', 1),
(1317, 89, 'QZ', 'Quetzaltenango', 1),
(1318, 89, 'RE', 'Retalhuleu', 1),
(1319, 89, 'ST', 'Sacatepequez', 1),
(1320, 89, 'SM', 'San Marcos', 1),
(1321, 89, 'SR', 'Santa Rosa', 1),
(1322, 89, 'SO', 'Solola', 1),
(1323, 89, 'SU', 'Suchitepequez', 1),
(1324, 89, 'TO', 'Totonicapan', 1),
(1325, 89, 'ZA', 'Zacapa', 1),
(1326, 90, 'CNK', 'Conakry', 1),
(1327, 90, 'BYL', 'Beyla', 1),
(1328, 90, 'BFA', 'Boffa', 1),
(1329, 90, 'BOK', 'Boke', 1),
(1330, 90, 'COY', 'Coyah', 1),
(1331, 90, 'DBL', 'Dabola', 1),
(1332, 90, 'DLB', 'Dalaba', 1),
(1333, 90, 'DGR', 'Dinguiraye', 1),
(1334, 90, 'DBR', 'Dubreka', 1),
(1335, 90, 'FRN', 'Faranah', 1),
(1336, 90, 'FRC', 'Forecariah', 1),
(1337, 90, 'FRI', 'Fria', 1),
(1338, 90, 'GAO', 'Gaoual', 1),
(1339, 90, 'GCD', 'Gueckedou', 1),
(1340, 90, 'KNK', 'Kankan', 1),
(1341, 90, 'KRN', 'Kerouane', 1),
(1342, 90, 'KND', 'Kindia', 1),
(1343, 90, 'KSD', 'Kissidougou', 1),
(1344, 90, 'KBA', 'Koubia', 1),
(1345, 90, 'KDA', 'Koundara', 1),
(1346, 90, 'KRA', 'Kouroussa', 1),
(1347, 90, 'LAB', 'Labe', 1),
(1348, 90, 'LLM', 'Lelouma', 1),
(1349, 90, 'LOL', 'Lola', 1),
(1350, 90, 'MCT', 'Macenta', 1),
(1351, 90, 'MAL', 'Mali', 1),
(1352, 90, 'MAM', 'Mamou', 1),
(1353, 90, 'MAN', 'Mandiana', 1),
(1354, 90, 'NZR', 'Nzerekore', 1),
(1355, 90, 'PIT', 'Pita', 1),
(1356, 90, 'SIG', 'Siguiri', 1),
(1357, 90, 'TLM', 'Telimele', 1),
(1358, 90, 'TOG', 'Tougue', 1),
(1359, 90, 'YOM', 'Yomou', 1),
(1360, 91, 'BF', 'Bafata Region', 1),
(1361, 91, 'BB', 'Biombo Region', 1),
(1362, 91, 'BS', 'Bissau Region', 1),
(1363, 91, 'BL', 'Bolama Region', 1),
(1364, 91, 'CA', 'Cacheu Region', 1),
(1365, 91, 'GA', 'Gabu Region', 1),
(1366, 91, 'OI', 'Oio Region', 1),
(1367, 91, 'QU', 'Quinara Region', 1),
(1368, 91, 'TO', 'Tombali Region', 1),
(1369, 92, 'BW', 'Barima-Waini', 1),
(1370, 92, 'CM', 'Cuyuni-Mazaruni', 1),
(1371, 92, 'DM', 'Demerara-Mahaica', 1),
(1372, 92, 'EC', 'East Berbice-Corentyne', 1),
(1373, 92, 'EW', 'Essequibo Islands-West Demerara', 1),
(1374, 92, 'MB', 'Mahaica-Berbice', 1),
(1375, 92, 'PM', 'Pomeroon-Supenaam', 1),
(1376, 92, 'PI', 'Potaro-Siparuni', 1),
(1377, 92, 'UD', 'Upper Demerara-Berbice', 1),
(1378, 92, 'UT', 'Upper Takutu-Upper Essequibo', 1),
(1379, 93, 'AR', 'Artibonite', 1),
(1380, 93, 'CE', 'Centre', 1),
(1381, 93, 'GA', 'Grand''Anse', 1),
(1382, 93, 'ND', 'Nord', 1),
(1383, 93, 'NE', 'Nord-Est', 1),
(1384, 93, 'NO', 'Nord-Ouest', 1),
(1385, 93, 'OU', 'Ouest', 1),
(1386, 93, 'SD', 'Sud', 1),
(1387, 93, 'SE', 'Sud-Est', 1),
(1388, 94, 'F', 'Flat Island', 1),
(1389, 94, 'M', 'McDonald Island', 1),
(1390, 94, 'S', 'Shag Island', 1),
(1391, 94, 'H', 'Heard Island', 1),
(1392, 95, 'AT', 'Atlantida', 1),
(1393, 95, 'CH', 'Choluteca', 1),
(1394, 95, 'CL', 'Colon', 1),
(1395, 95, 'CM', 'Comayagua', 1),
(1396, 95, 'CP', 'Copan', 1),
(1397, 95, 'CR', 'Cortes', 1),
(1398, 95, 'PA', 'El Paraiso', 1),
(1399, 95, 'FM', 'Francisco Morazan', 1),
(1400, 95, 'GD', 'Gracias a Dios', 1),
(1401, 95, 'IN', 'Intibuca', 1),
(1402, 95, 'IB', 'Islas de la Bahia (Bay Islands)', 1),
(1403, 95, 'PZ', 'La Paz', 1),
(1404, 95, 'LE', 'Lempira', 1),
(1405, 95, 'OC', 'Ocotepeque', 1),
(1406, 95, 'OL', 'Olancho', 1),
(1407, 95, 'SB', 'Santa Barbara', 1),
(1408, 95, 'VA', 'Valle', 1),
(1409, 95, 'YO', 'Yoro', 1),
(1410, 96, 'HCW', 'Central and Western Hong Kong Is', 1),
(1411, 96, 'HEA', 'Eastern Hong Kong Island', 1),
(1412, 96, 'HSO', 'Southern Hong Kong Island', 1),
(1413, 96, 'HWC', 'Wan Chai Hong Kong Island', 1),
(1414, 96, 'KKC', 'Kowloon City Kowloon', 1),
(1415, 96, 'KKT', 'Kwun Tong Kowloon', 1),
(1416, 96, 'KSS', 'Sham Shui Po Kowloon', 1),
(1417, 96, 'KWT', 'Wong Tai Sin Kowloon', 1),
(1418, 96, 'KYT', 'Yau Tsim Mong Kowloon', 1),
(1419, 96, 'NIS', 'Islands New Territories', 1),
(1420, 96, 'NKT', 'Kwai Tsing New Territories', 1),
(1421, 96, 'NNO', 'North New Territories', 1),
(1422, 96, 'NSK', 'Sai Kung New Territories', 1),
(1423, 96, 'NST', 'Sha Tin New Territories', 1),
(1424, 96, 'NTP', 'Tai Po New Territories', 1),
(1425, 96, 'NTW', 'Tsuen Wan New Territories', 1),
(1426, 96, 'NTM', 'Tuen Mun New Territories', 1),
(1427, 96, 'NYL', 'Yuen Long New Territories', 1),
(1467, 98, 'AL', 'Austurland', 1),
(1468, 98, 'HF', 'Hofuoborgarsvaeoi', 1),
(1469, 98, 'NE', 'Norourland eystra', 1),
(1470, 98, 'NV', 'Norourland vestra', 1),
(1471, 98, 'SL', 'Suourland', 1),
(1472, 98, 'SN', 'Suournes', 1),
(1473, 98, 'VF', 'Vestfiroir', 1),
(1474, 98, 'VL', 'Vesturland', 1),
(1475, 99, 'AN', 'Andaman and Nicobar Islands', 1),
(1476, 99, 'AP', 'Andhra Pradesh', 1),
(1477, 99, 'AR', 'Arunachal Pradesh', 1),
(1478, 99, 'AS', 'Assam', 1),
(1479, 99, 'BI', 'Bihar', 1),
(1480, 99, 'CH', 'Chandigarh', 1),
(1481, 99, 'DA', 'Dadra and Nagar Haveli', 1),
(1482, 99, 'DM', 'Daman and Diu', 1),
(1483, 99, 'DE', 'Delhi', 1),
(1484, 99, 'GO', 'Goa', 1),
(1485, 99, 'GU', 'Gujarat', 1),
(1486, 99, 'HA', 'Haryana', 1),
(1487, 99, 'HP', 'Himachal Pradesh', 1),
(1488, 99, 'JA', 'Jammu and Kashmir', 1),
(1489, 99, 'KA', 'Karnataka', 1),
(1490, 99, 'KE', 'Kerala', 1),
(1491, 99, 'LI', 'Lakshadweep Islands', 1),
(1492, 99, 'MP', 'Madhya Pradesh', 1),
(1493, 99, 'MA', 'Maharashtra', 1),
(1494, 99, 'MN', 'Manipur', 1),
(1495, 99, 'ME', 'Meghalaya', 1),
(1496, 99, 'MI', 'Mizoram', 1),
(1497, 99, 'NA', 'Nagaland', 1),
(1498, 99, 'OR', 'Orissa', 1),
(1499, 99, 'PO', 'Pondicherry', 1),
(1500, 99, 'PU', 'Punjab', 1),
(1501, 99, 'RA', 'Rajasthan', 1),
(1502, 99, 'SI', 'Sikkim', 1),
(1503, 99, 'TN', 'Tamil Nadu', 1),
(1504, 99, 'TR', 'Tripura', 1),
(1505, 99, 'UP', 'Uttar Pradesh', 1),
(1506, 99, 'WB', 'West Bengal', 1),
(1507, 100, 'AC', 'Aceh', 1),
(1508, 100, 'BA', 'Bali', 1),
(1509, 100, 'BT', 'Banten', 1),
(1510, 100, 'BE', 'Bengkulu', 1),
(1511, 100, 'BD', 'BoDeTaBek', 1),
(1512, 100, 'GO', 'Gorontalo', 1),
(1513, 100, 'JK', 'Jakarta Raya', 1),
(1514, 100, 'JA', 'Jambi', 1),
(1515, 100, 'JB', 'Jawa Barat', 1),
(1516, 100, 'JT', 'Jawa Tengah', 1),
(1517, 100, 'JI', 'Jawa Timur', 1),
(1518, 100, 'KB', 'Kalimantan Barat', 1),
(1519, 100, 'KS', 'Kalimantan Selatan', 1),
(1520, 100, 'KT', 'Kalimantan Tengah', 1),
(1521, 100, 'KI', 'Kalimantan Timur', 1),
(1522, 100, 'BB', 'Kepulauan Bangka Belitung', 1),
(1523, 100, 'LA', 'Lampung', 1),
(1524, 100, 'MA', 'Maluku', 1),
(1525, 100, 'MU', 'Maluku Utara', 1),
(1526, 100, 'NB', 'Nusa Tenggara Barat', 1),
(1527, 100, 'NT', 'Nusa Tenggara Timur', 1),
(1528, 100, 'PA', 'Papua', 1),
(1529, 100, 'RI', 'Riau', 1),
(1530, 100, 'SN', 'Sulawesi Selatan', 1),
(1531, 100, 'ST', 'Sulawesi Tengah', 1),
(1532, 100, 'SG', 'Sulawesi Tenggara', 1),
(1533, 100, 'SA', 'Sulawesi Utara', 1),
(1534, 100, 'SB', 'Sumatera Barat', 1),
(1535, 100, 'SS', 'Sumatera Selatan', 1),
(1536, 100, 'SU', 'Sumatera Utara', 1),
(1537, 100, 'YO', 'Yogyakarta', 1),
(1538, 101, 'TEH', 'Tehran', 1),
(1539, 101, 'QOM', 'Qom', 1),
(1540, 101, 'MKZ', 'Markazi', 1),
(1541, 101, 'QAZ', 'Qazvin', 1),
(1542, 101, 'GIL', 'Gilan', 1),
(1543, 101, 'ARD', 'Ardabil', 1),
(1544, 101, 'ZAN', 'Zanjan', 1),
(1545, 101, 'EAZ', 'East Azarbaijan', 1),
(1546, 101, 'WEZ', 'West Azarbaijan', 1),
(1547, 101, 'KRD', 'Kurdistan', 1),
(1548, 101, 'HMD', 'Hamadan', 1),
(1549, 101, 'KRM', 'Kermanshah', 1),
(1550, 101, 'ILM', 'Ilam', 1),
(1551, 101, 'LRS', 'Lorestan', 1),
(1552, 101, 'KZT', 'Khuzestan', 1),
(1553, 101, 'CMB', 'Chahar Mahaal and Bakhtiari', 1),
(1554, 101, 'KBA', 'Kohkiluyeh and Buyer Ahmad', 1),
(1555, 101, 'BSH', 'Bushehr', 1),
(1556, 101, 'FAR', 'Fars', 1),
(1557, 101, 'HRM', 'Hormozgan', 1),
(1558, 101, 'SBL', 'Sistan and Baluchistan', 1),
(1559, 101, 'KRB', 'Kerman', 1),
(1560, 101, 'YZD', 'Yazd', 1),
(1561, 101, 'EFH', 'Esfahan', 1),
(1562, 101, 'SMN', 'Semnan', 1),
(1563, 101, 'MZD', 'Mazandaran', 1),
(1564, 101, 'GLS', 'Golestan', 1),
(1565, 101, 'NKH', 'North Khorasan', 1),
(1566, 101, 'RKH', 'Razavi Khorasan', 1),
(1567, 101, 'SKH', 'South Khorasan', 1),
(1568, 102, 'BD', 'Baghdad', 1),
(1569, 102, 'SD', 'Salah ad Din', 1),
(1570, 102, 'DY', 'Diyala', 1),
(1571, 102, 'WS', 'Wasit', 1),
(1572, 102, 'MY', 'Maysan', 1),
(1573, 102, 'BA', 'Al Basrah', 1),
(1574, 102, 'DQ', 'Dhi Qar', 1),
(1575, 102, 'MU', 'Al Muthanna', 1),
(1576, 102, 'QA', 'Al Qadisyah', 1),
(1577, 102, 'BB', 'Babil', 1),
(1578, 102, 'KB', 'Al Karbala', 1),
(1579, 102, 'NJ', 'An Najaf', 1),
(1580, 102, 'AB', 'Al Anbar', 1),
(1581, 102, 'NN', 'Ninawa', 1),
(1582, 102, 'DH', 'Dahuk', 1),
(1583, 102, 'AL', 'Arbil', 1),
(1584, 102, 'TM', 'At Ta''mim', 1),
(1585, 102, 'SL', 'As Sulaymaniyah', 1),
(1586, 103, 'CA', 'Carlow', 1),
(1587, 103, 'CV', 'Cavan', 1),
(1588, 103, 'CL', 'Clare', 1),
(1589, 103, 'CO', 'Cork', 1),
(1590, 103, 'DO', 'Donegal', 1),
(1591, 103, 'DU', 'Dublin', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1);
INSERT INTO `mdvdoc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Алматы', 'ALA', 1),
(1717, 109, 'Астана', 'AST', 1),
(1718, 109, 'Алматинская область', 'ALM', 1),
(1719, 109, 'Акмолинская область', 'AKM', 1),
(1720, 109, 'Актюбинская область', 'AKT', 1),
(1721, 109, 'Атырауская область', 'ATY', 1),
(1722, 109, 'Восточно-Казахстанская область', 'VOS', 1),
(1723, 109, 'Жамбыльская область', 'ZHA', 1),
(1724, 109, 'Западно-Казахстанская область', 'ZAP', 1),
(1725, 109, 'Карагандинская область', 'KAR', 1),
(1726, 109, 'Костанайская область', 'KUS', 1),
(1727, 109, 'Кызылординская область', 'KZY', 1),
(1728, 109, 'Мангистауская область', 'MAN', 1),
(1729, 109, 'Павлодарская область', 'PAV', 1),
(1730, 109, 'Северо-Казахстанская область', 'SEV', 1),
(1731, 109, 'Южно-Казахстанская область', 'YUZ', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Алтайский край', 'ALT', 1),
(2722, 176, 'Амурская область', 'AMU', 1),
(2723, 176, 'Архангельская область', 'ARK', 1),
(2724, 176, 'Астраханская область', 'AST', 1),
(2725, 176, 'Белгородская область', 'BEL', 1),
(2726, 176, 'Брянская область', 'BRY', 1),
(2727, 176, 'Владимирская область', 'VLA', 1),
(2728, 176, 'Волгоградская область', 'VGG', 1),
(2729, 176, 'Вологодская область', 'VLG', 1),
(2730, 176, 'Воронежская область', 'VOR', 1),
(2731, 176, 'Еврейская АО', 'YEV', 1),
(2732, 176, 'Забайкальский край', 'ZAB', 1),
(2733, 176, 'Ивановская область', 'IVA', 1),
(2734, 176, 'Иркутская область', 'IRK', 1),
(2735, 176, 'Кабардино-Балкарская республика', 'KB', 1),
(2736, 176, 'Калининградская область', 'KGD', 1),
(2737, 176, 'Калужская область', 'KLU', 1),
(2738, 176, 'Камчатский край', 'KAM', 1),
(2739, 176, 'Карачаево-Черкесская республика', 'KC', 1),
(2740, 176, 'Кемеровская область', 'KEM', 1),
(2741, 176, 'Кировская область', 'KIR', 1),
(2742, 176, 'Костромская область', 'KOS', 1),
(2743, 176, 'Краснодарский край', 'KDA', 1),
(2744, 176, 'Красноярский край', 'KYA', 1),
(2745, 176, 'Курганская область', 'KGN', 1),
(2746, 176, 'Курская область', 'KRS', 1),
(2747, 176, 'Ленинградская область', 'LEN', 1),
(2748, 176, 'Липецкая область', 'LIP', 1),
(2749, 176, 'Магаданская область', 'MAG', 1),
(2750, 176, 'Москва', 'MOW', 1),
(2751, 176, 'Московская область', 'MOS', 1),
(2752, 176, 'Мурманская область', 'MUR', 1),
(2753, 176, 'Ненецкий АО', 'NEN', 1),
(2754, 176, 'Нижегородская область', 'NIZ', 1),
(2755, 176, 'Новгородская область', 'NGR', 1),
(2756, 176, 'Новосибирская область', 'NVS', 1),
(2757, 176, 'Омская область', 'OMS', 1),
(2758, 176, 'Оренбургская область', 'ORE', 1),
(2759, 176, 'Орловская область', 'ORL', 1),
(2760, 176, 'Пензенская область', 'PNZ', 1),
(2761, 176, 'Пермский край', 'PER', 1),
(2762, 176, 'Приморский край', 'PRI', 1),
(2763, 176, 'Псковская область', 'PSK', 1),
(2764, 176, 'Республика Адыгея', 'AD', 1),
(2765, 176, 'Республика Алтай', 'AL', 1),
(2766, 176, 'Республика Башкортостан', 'BA', 1),
(2767, 176, 'Республика Бурятия', 'BU', 1),
(2768, 176, 'Республика Дагестан', 'DA', 1),
(2769, 176, 'Республика Ингушетия', 'IN', 1),
(2770, 176, 'Республика Калмыкия', 'KL', 1),
(2771, 176, 'Республика Карелия', 'KR', 1),
(2772, 176, 'Республика Коми', 'KO', 1),
(2773, 176, 'Республика Крым', 'CR', 1),
(2774, 176, 'Республика Марий Эл', 'ME', 1),
(2775, 176, 'Республика Мордовия', 'MO', 1),
(2776, 176, 'Республика Саха (Якутия)', 'SA', 1),
(2777, 176, 'Республика Северная Осетия — Алания', 'SE', 1),
(2778, 176, 'Республика Татарстан', 'TA', 1),
(2779, 176, 'Республика Тыва', 'TY', 1),
(2780, 176, 'Республика Хакасия', 'KK', 1),
(2781, 176, 'Ростовская область', 'ROS', 1),
(2782, 176, 'Рязанская область', 'RYA', 1),
(2783, 176, 'Самарская область', 'SAM', 1),
(2784, 176, 'Санкт-Петербург', 'SPE', 1),
(2785, 176, 'Саратовская область', 'SAR', 1),
(2786, 176, 'Сахалинская область', 'SAK', 1),
(2787, 176, 'Свердловская область', 'SVE', 1),
(2788, 176, 'Севастополь', 'SEV', 1),
(2789, 176, 'Смоленская область', 'SMO', 1),
(2790, 176, 'Ставропольский край', 'STA', 1),
(2791, 176, 'Тамбовская область', 'TAM', 1),
(2792, 176, 'Тверская область', 'TVE', 1),
(2793, 176, 'Томская область', 'TOM', 1),
(2794, 176, 'Тульская область', 'TUL', 1),
(2795, 176, 'Тюменская область', 'TYU', 1),
(2796, 176, 'Удмуртская республика', 'UD', 1),
(2797, 176, 'Ульяновская область', 'ULY', 1),
(2798, 176, 'Хабаровский край', 'KHA', 1),
(2799, 176, 'Ханты-Мансийский АО-Югра', 'KHM', 1),
(2800, 176, 'Челябинская область', 'CHE', 1),
(2801, 176, 'Чеченская республика', 'CE', 1),
(2802, 176, 'Чувашская республика', 'CU', 1),
(2803, 176, 'Чукотский АО', 'CHU', 1),
(2804, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(2805, 176, 'Ярославская область', 'YAR', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1);
INSERT INTO `mdvdoc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Вінницька область', '05', 1),
(3481, 220, 'Волинська область', '07', 1),
(3482, 220, 'Луганская область', '09', 1),
(3483, 220, 'Дніпропетровська область', '12', 1),
(3484, 220, 'Донецкая область', '14', 1),
(3485, 220, 'Житомирська область', '18', 1),
(3486, 220, 'Рівненська область', '56', 1),
(3487, 220, 'Закарпатська область', '21', 1),
(3488, 220, 'Запорізька область', '23', 1),
(3489, 220, 'Івано-франківська область', '26', 1),
(3490, 220, 'Київ', '30', 1),
(3491, 220, 'Київська область', '32', 1),
(3492, 220, 'Кіровоградська область', '35', 1),
(3493, 220, 'Львівська область', '46', 1),
(3494, 220, 'Миколаївська область', '48', 1),
(3495, 220, 'Одеська область', '51', 1),
(3496, 220, 'Полтавська область', '53', 1),
(3497, 220, 'Сумська область', '59', 1),
(3498, 220, 'Тернопільська область', '61', 1),
(3499, 220, 'Харківська область', '63', 1),
(3500, 220, 'Херсонська область', '65', 1),
(3501, 220, 'Хмельницька область', '68', 1),
(3502, 220, 'Черкаська область', '71', 1),
(3503, 220, 'Чернігівська область', '74', 1),
(3504, 220, 'Чернівецька область', '77', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mdvdoc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `mdvdoc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Дамп даних таблиці `mdvdoc_zone_to_geo_zone`
--

INSERT INTO `mdvdoc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 176, 0, 3, '2015-11-11 15:56:24', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
