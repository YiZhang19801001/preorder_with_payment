-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2018-12-18 00:37:46
-- 服务器版本： 10.1.36-MariaDB
-- PHP 版本： 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `yx`
--

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_10_23_004511_create_temp_picked_option', 1),
(2, '2018_10_23_012909_add_column_option_id_into_temp_options', 2),
(3, '2018_10_23_014458_add_col_product_option_value_id_into_temp_option', 3),
(4, '2018_10_23_030423_add_col_price_into_temp_option', 4),
(5, '2018_10_24_005223_add_col_names_into_category_description', 5),
(6, '2018_10_24_010110_add_col_names_into_option_description', 6),
(7, '2018_10_24_010429_add_col_names_into_option_value_description', 7),
(8, '2018_10_24_010916_add_col_names_into_product_add_type', 8),
(9, '2018_10_24_011231_add_col_names_into_product_description', 9),
(10, '2018_10_24_014046_add_col_names_into_oc_product_ext', 10);

-- --------------------------------------------------------

--
-- 表的结构 `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `address_3` varchar(128) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL,
  `suburb_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `address_1`, `address_2`, `address_3`, `country_id`, `state_id`, `suburb_id`) VALUES
(1, 1, '1232', '123', '123', 1, 2, 5),
(2, 2, '123123', '123', '123123', 1, 1, 2),
(3, 3, '1', '1', '1', 1, 2, 5),
(4, 4, '38', '0', '0', 1, 2, 5),
(5, 5, '', '', '', 1, 1, 3),
(6, 1, '1232', '123', '123', 1, 2, 5),
(7, 2, '', '', '', 0, 0, 0),
(8, 3, '', '', '', 0, 0, 0),
(9, 4, '38', '0', '0', 1, 2, 5),
(10, 5, '', '', '', 0, 0, 0),
(11, 2, '', '', '', 1, 2, 6),
(12, 3, '', '', '', 1, 1, 2),
(13, 4, '38', '0', '0', 1, 2, 5),
(14, 5, '', '', '', 1, 2, 2),
(15, 6, '', '', '', 1, 2, 4),
(16, 7, '', '', '', 1, 2, 4),
(17, 8, '', '', '', 1, 2, 4),
(18, 9, '1', '0', '0', 1, 2, 7),
(19, 10, 'George St', 'George St', 'George St', 1, 2, 2),
(20, 11, '123', 'George St', 'Pitt St', 1, 2, 4),
(21, 12, '123', '123123', '123123', 1, 2, 8),
(22, 13, '', '', '', 1, 2, 4);

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate`
--

CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
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
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_activity`
--

CREATE TABLE `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_login`
--

CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_transaction`
--

CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `firstname`, `lastname`, `password`, `status`, `date_added`, `date_modified`) VALUES
(1, '1JDZ0NS8jRnrGh3iCsZ9eCD9CNKBwcjDTfmhsjKdlWhSDGkApgpDhylaQtvi5c7b', '', '', 'Iuii7wZzBTzwYhqVqLSA8dhs2Ht8cUtsU02ak2AEyIeIH0IiEtSzwAz40XFQWF214zjLk0AM80gWMC7nzJqg8Zf7MgxanrY30qny7qWLgZ5cpGKl8baFgqi26h3cRMRwLaEUrZGDb2safCubdmihc09qCaXXTkii2C3ryANxtM2Rs0rJWpE0v2wWgLNKszMM6gF7TdrZYYZAThCtmk6Cbw75Xzbze7NtY2oGLyi3bdTlQFuLQXMHfifVlVCWn7mH', 1, '2017-03-17 11:52:03', '2017-03-17 11:52:03');

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(79, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image_description`
--

CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(79, 1, 7, 'iPhone 6'),
(87, 1, 6, 'HP Banner'),
(93, 1, 8, 'Canon'),
(92, 1, 8, 'Burger King'),
(91, 1, 8, 'Coca Cola'),
(90, 1, 8, 'Disney'),
(89, 1, 8, 'Dell'),
(80, 1, 7, 'MacBookAir'),
(88, 1, 8, 'Harley Davidson'),
(94, 1, 8, 'NFL'),
(95, 1, 8, 'RedBull'),
(96, 1, 8, 'Sony'),
(97, 1, 8, 'Starbucks'),
(98, 1, 8, 'Nintendo');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `location_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, NULL, 0, 4, 0, 1, 0, 1, '2018-12-06 18:38:18', '2018-12-06 18:38:18'),
(3, NULL, 0, 4, 0, 1, 2, 1, '2018-12-06 18:38:26', '2018-12-06 18:38:26'),
(2, NULL, 0, 4, 0, 1, 1, 1, '2018-12-06 18:38:30', '2018-12-06 18:38:30'),
(4, NULL, 0, 4, 0, 1, 3, 1, '2018-12-06 18:38:32', '2018-12-06 18:38:32'),
(5, NULL, 0, 4, 0, 1, 4, 1, '2018-12-06 18:38:33', '2018-12-06 18:38:33'),
(7, NULL, 0, 4, 0, 1, 6, 1, '2018-12-06 18:38:36', '2018-12-06 18:38:36'),
(6, NULL, 0, 4, 0, 1, 5, 1, '2018-12-06 18:38:42', '2018-12-06 18:38:42'),
(8, NULL, 0, 4, 0, 1, 7, 1, '2018-12-06 18:38:51', '2018-12-06 18:38:51'),
(9, NULL, 0, 4, 0, 1, 8, 1, '2018-12-06 18:39:10', '2018-12-06 18:39:10'),
(10, NULL, 0, 4, 0, 1, 9, 1, '2018-12-06 18:39:13', '2018-12-06 18:39:13'),
(11, NULL, 0, 4, 0, 1, 10, 1, '2018-12-06 18:39:17', '2018-12-06 18:39:17'),
(12, NULL, 0, 4, 0, 1, 11, 1, '2018-12-06 18:39:21', '2018-12-06 18:39:21');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `name_2` varchar(255) NOT NULL,
  `name_3` varchar(255) NOT NULL,
  `name_4` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `name_2`, `name_3`, `name_4`) VALUES
(1, 1, '锅底', ' ', '锅底', ' ', ' ', '', '', ''),
(1, 2, 'Soup Base', ' ', 'Soup Base', ' ', ' ', '', '', ''),
(3, 1, '丸滑类', ' ', '丸滑类', ' ', ' ', '', '', ''),
(3, 2, ' ', ' ', ' ', ' ', ' ', '', '', ''),
(2, 1, '涮肉类', ' ', '涮肉类', ' ', ' ', '', '', ''),
(2, 2, ' ', ' ', ' ', ' ', ' ', '', '', ''),
(4, 1, '海鲜类', ' ', '海鲜类', ' ', ' ', '', '', ''),
(4, 2, 'Seafood', ' ', 'Seafood', ' ', ' ', '', '', ''),
(5, 1, '吃货系列', ' ', '吃货系列', ' ', ' ', '', '', ''),
(5, 2, 'Gourmet', ' ', 'Gourmet', ' ', ' ', '', '', ''),
(7, 1, '特色小吃', ' ', '特色小吃', ' ', ' ', '', '', ''),
(7, 2, 'Refreshments', ' ', 'Refreshments', ' ', ' ', '', '', ''),
(6, 1, '素食类', ' ', '素食类', ' ', ' ', '', '', ''),
(6, 2, 'Vegetarian', ' ', 'Vegetarian', ' ', ' ', '', '', ''),
(8, 1, '饮料', ' ', '饮料', ' ', ' ', '', '', ''),
(8, 2, ' ', ' ', ' ', ' ', ' ', '', '', ''),
(9, 1, '山珍类', ' ', '山珍类', ' ', ' ', '', '', ''),
(9, 2, 'Mushrooms', ' ', 'Mushrooms', ' ', ' ', '', '', ''),
(10, 1, '其它', ' ', '其它', ' ', ' ', '', '', ''),
(10, 2, ' ', ' ', ' ', ' ', ' ', '', '', ''),
(11, 1, '主食', ' ', '主食', ' ', ' ', '', '', ''),
(11, 2, 'Staple Food', ' ', 'Staple Food', ' ', ' ', '', '', ''),
(12, 1, '活海鲜/ VIP精品', ' ', '活海鲜/ VIP精品', ' ', ' ', '', '', ''),
(12, 2, 'Seafood', ' ', 'Seafood', ' ', ' ', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(3, 3, 0),
(2, 2, 0),
(4, 4, 0),
(5, 5, 0),
(7, 7, 0),
(6, 6, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 11, 0),
(12, 12, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(3, 0, 0),
(2, 0, 0),
(4, 0, 0),
(5, 0, 0),
(7, 0, 0),
(6, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Australia', '', '', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
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
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'AU Dollar', 'AUD', '$', '', '2', 1.00000000, 1, '2018-12-07 02:21:13');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `upload_id` int(11) NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `alias`, `email`, `telephone`, `fax`, `password`, `salt`, `upload_id`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 1, 0, '', '', '', '123@qq.com', '', '', 'a0d6daab2d9a12be77615dca9945b77e8ec51f79', '037fc7394', 0, 0, 0, '', '182.111.155.151', 1, 1, 1, '', '2017-05-11 11:28:09'),
(2, 1, 0, '', '', '', 'admin@qq.com', '', '', 'b7d74ff457f74b8c3ba36be6c957539c4f0ceae1', '12900f2cd', 0, 0, 11, '', '115.151.184.54', 1, 1, 1, '', '2017-05-20 10:24:13'),
(3, 1, 0, '', '', '', '1232@qq.com', '', '', 'b74bf2b71eb0770275626bb339c46dd5479460df', '34703150f', 0, 0, 12, '', '103.253.25.137', 1, 1, 1, '', '2017-05-20 10:46:11'),
(4, 1, 0, 'John', 'Smith', 'Johnrating', 'grantedwins5@hotmail.com', '(02) 8090 1234', '0452 123 456', 'ee3d06811d55e869b87a9bb493af4952cf668349', 'e9517ecb4', 0, 0, 13, '', '120.26.192.76', 1, 1, 1, '', '2017-05-25 10:50:26'),
(5, 1, 0, '', '', '', '1234@qq.com', '', '', '2b3fff460afcc8241b5e5ef25855c8e71ef29b26', 'fb34c454b', 0, 0, 14, '', '127.0.0.1', 1, 1, 1, '', '2017-06-14 10:05:44'),
(6, 1, 0, '', '', '', 'qq@hotmail.com', '', '', '34ec9da24b548ea5609beffe4721ce6306ed3d03', 'b81959c10', 0, 0, 15, '', '101.187.98.39', 1, 1, 1, '', '2017-06-14 10:17:49'),
(7, 1, 0, '', '', '', '12345@qq.com', '', '', 'c5f0a2f0761dbbd356471556506f330a53f138e5', '8e4529ea2', 0, 0, 16, '', '182.111.155.151', 1, 1, 1, '', '2017-06-16 08:53:29'),
(8, 1, 0, '', '', '', 'mkl@hotmail.com', '', '', '8aa85a799766cc75958770706c64a26c1deb094a', 'fab2212e5', 0, 0, 17, '', '101.187.98.39', 1, 1, 1, '', '2017-06-16 11:50:59'),
(9, 1, 0, 'asdfqwer', 'asdfqwer', 'asdfqwer', 'asdfqwer@hotmail.com', '(02) 8090 1234', '0452 123 123', 'd3431302e1ef67d46f13883b31af58f25c7e2c2a', '63f1eaba0', 0, 0, 18, '', '101.187.98.39', 1, 1, 1, '', '2017-07-20 09:54:55'),
(10, 1, 0, '', '', '', '1122@qq.com', '', '', '45aac951f061656c2f6e45b054dc136d9ea86059', 'b0394aef3', 0, 0, 19, '', '115.151.186.216', 1, 1, 1, '', '2017-07-20 10:02:42'),
(11, 1, 0, 'aaaa', 'aaaa', 'aaaa', 'aaaa@hotmail.com', '(02) 1234 1234', '1234 123 123', 'fe2684ef66f0b59cf4ffbb88b60318e3fdc3f3ee', '306b50412', 0, 0, 20, '', '101.187.98.39', 1, 1, 1, '', '2017-07-20 10:03:59'),
(12, 1, 0, '', '', '', 'sirius@qq.com', '', '', '7676399515195083cf26a85108f026311429b22a', '7f5282878', 0, 0, 21, '', '127.0.0.1', 1, 1, 1, '', '2017-07-28 09:08:21'),
(13, 1, 0, '', '', '', 'harry@gmail.com', '', '', '48d7ac7e59de81742d0daf22949fa0d847a737b1', '100024b07', 0, 0, 22, '', '192.168.1.220', 1, 1, 1, '', '2017-08-01 17:23:09');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', 'a:2:{s:11:\"customer_id\";i:1;s:5:\"email\";s:10:\"123@qq.com\";}', '127.0.0.1', '2017-05-11 11:28:09'),
(2, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:1;}', '127.0.0.1', '2017-05-11 11:29:58'),
(3, 0, 'order_guest', 'a:2:{s:4:\"name\";s:7:\"132 123\";s:8:\"order_id\";i:3;}', '127.0.0.1', '2017-05-12 16:22:58'),
(4, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '127.0.0.1', '2017-05-18 15:45:40'),
(5, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '127.0.0.1', '2017-05-18 15:48:41'),
(6, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '127.0.0.1', '2017-05-18 15:53:31'),
(7, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '127.0.0.1', '2017-05-19 15:10:34'),
(8, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '127.0.0.1', '2017-05-19 15:16:52'),
(9, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '127.0.0.1', '2017-05-19 15:44:09'),
(10, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '115.151.184.54', '2017-05-20 10:20:51'),
(11, 2, 'register', 'a:2:{s:11:\"customer_id\";i:2;s:5:\"email\";s:12:\"admin@qq.com\";}', '115.151.184.54', '2017-05-20 10:24:13'),
(12, 3, 'register', 'a:2:{s:11:\"customer_id\";i:3;s:5:\"email\";s:11:\"1232@qq.com\";}', '103.253.25.137', '2017-05-20 10:46:11'),
(13, 0, 'order_guest', 'a:2:{s:4:\"name\";s:6:\"111 11\";s:8:\"order_id\";i:1;}', '101.187.98.39', '2017-05-22 10:07:36'),
(14, 0, 'order_guest', 'a:2:{s:4:\"name\";s:6:\"1111 1\";s:8:\"order_id\";i:2;}', '101.187.98.39', '2017-05-22 10:08:58'),
(15, 4, 'register', 'a:2:{s:11:\"customer_id\";i:4;s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-05-25 10:50:26'),
(16, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '117.44.132.159', '2017-05-25 13:24:37'),
(17, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"11 1\";s:8:\"order_id\";i:16;}', '101.187.98.39', '2017-05-26 07:47:13'),
(18, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:17;}', '101.187.98.39', '2017-05-26 07:48:27'),
(19, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-05-26 08:01:17'),
(20, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:18;}', '101.187.98.39', '2017-05-26 08:04:18'),
(21, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-05-26 08:51:22'),
(22, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:19;}', '101.187.98.39', '2017-05-26 08:52:16'),
(23, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:20;}', '101.187.98.39', '2017-05-26 10:54:04'),
(24, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-05-26 10:57:41'),
(25, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:21;}', '101.187.98.39', '2017-05-26 10:58:14'),
(26, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-05-26 12:25:48'),
(27, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-05-26 12:26:41'),
(28, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:22;}', '101.187.98.39', '2017-05-31 09:07:23'),
(29, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-02 08:00:14'),
(30, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-02 08:21:30'),
(31, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"3123 12312@\";s:8:\"order_id\";i:28;}', '182.103.241.63', '2017-06-02 11:53:31'),
(32, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '182.103.241.63', '2017-06-03 17:57:10'),
(33, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:29;}', '182.103.241.63', '2017-06-03 17:57:17'),
(34, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:30;}', '101.187.98.39', '2017-06-05 11:33:17'),
(35, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-05 11:33:46'),
(36, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:31;}', '101.187.98.39', '2017-06-05 11:37:11'),
(37, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:32;}', '101.187.98.39', '2017-06-05 12:19:55'),
(38, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:34;}', '101.187.98.39', '2017-06-05 12:21:00'),
(39, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:35;}', '101.187.98.39', '2017-06-05 12:24:59'),
(40, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:36;}', '101.187.98.39', '2017-06-05 14:09:56'),
(41, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:38;}', '101.187.98.39', '2017-06-06 08:28:07'),
(42, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '182.111.154.134', '2017-06-06 08:39:00'),
(43, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"RICHIE WANG\";s:8:\"order_id\";i:39;}', '101.187.98.39', '2017-06-06 09:56:41'),
(44, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-06 15:46:10'),
(45, 0, 'order_guest', 'a:2:{s:4:\"name\";s:7:\"213 123\";s:8:\"order_id\";i:40;}', '182.111.154.134', '2017-06-06 15:48:22'),
(46, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"123213 213\";s:8:\"order_id\";i:41;}', '182.111.154.134', '2017-06-06 15:53:08'),
(47, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '182.111.154.134', '2017-06-06 15:53:17'),
(48, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:42;}', '182.111.154.134', '2017-06-06 15:53:30'),
(49, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"1 11\";s:8:\"order_id\";i:43;}', '101.187.98.39', '2017-06-07 08:57:26'),
(50, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-07 09:52:58'),
(51, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:45;}', '101.187.98.39', '2017-06-07 09:53:30'),
(52, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:46;}', '101.187.98.39', '2017-06-07 09:53:56'),
(53, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:47;}', '101.187.98.39', '2017-06-07 10:13:21'),
(54, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"RICHIE WANG\";s:8:\"order_id\";i:48;}', '101.187.98.39', '2017-06-07 11:11:49'),
(55, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-07 11:24:29'),
(56, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"1 11\";s:8:\"order_id\";i:50;}', '101.187.98.39', '2017-06-07 11:26:23'),
(57, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:51;}', '101.187.98.39', '2017-06-07 14:11:55'),
(58, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '117.44.133.166', '2017-06-07 16:40:34'),
(59, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-13 14:02:45'),
(60, 0, 'order_guest', 'a:2:{s:4:\"name\";s:7:\"123 123\";s:8:\"order_id\";i:52;}', '182.103.241.202', '2017-06-13 14:05:21'),
(61, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:53;}', '101.187.98.39', '2017-06-13 14:06:23'),
(62, 0, 'order_guest', 'a:2:{s:4:\"name\";s:7:\"123 123\";s:8:\"order_id\";i:54;}', '182.103.241.202', '2017-06-13 14:07:38'),
(63, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '182.103.241.202', '2017-06-13 14:09:05'),
(64, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:55;}', '182.103.241.202', '2017-06-13 14:09:41'),
(65, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:56;}', '101.187.98.39', '2017-06-13 14:13:02'),
(66, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:57;}', '101.187.98.39', '2017-06-13 14:20:46'),
(67, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"123123 1231\";s:8:\"order_id\";i:58;}', '117.44.133.8', '2017-06-13 16:51:44'),
(68, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"123123 1231\";s:8:\"order_id\";i:59;}', '117.44.133.8', '2017-06-13 16:51:57'),
(69, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"123123 1231\";s:8:\"order_id\";i:60;}', '117.44.133.8', '2017-06-13 16:55:13'),
(70, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '117.44.133.8', '2017-06-13 16:56:21'),
(71, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-14 09:15:31'),
(72, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:61;}', '101.187.98.39', '2017-06-14 09:15:43'),
(73, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '117.44.133.8', '2017-06-14 09:58:23'),
(74, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-14 10:05:37'),
(75, 5, 'register', 'a:2:{s:11:\"customer_id\";i:5;s:5:\"email\";s:11:\"1234@qq.com\";}', '117.44.133.8', '2017-06-14 10:05:44'),
(76, 5, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:11:\"1234@qq.com\";}', '117.44.133.8', '2017-06-14 10:07:03'),
(77, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:62;}', '117.44.133.8', '2017-06-14 10:07:15'),
(78, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:63;}', '117.44.133.8', '2017-06-14 10:08:59'),
(79, 6, 'register', 'a:2:{s:11:\"customer_id\";i:6;s:5:\"email\";s:14:\"qq@hotmail.com\";}', '101.187.98.39', '2017-06-14 10:17:49'),
(80, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:64;}', '101.187.98.39', '2017-06-14 10:18:20'),
(81, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:66;}', '101.187.98.39', '2017-06-15 07:47:50'),
(82, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:67;}', '101.187.98.39', '2017-06-15 07:49:02'),
(83, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:69;}', '101.187.98.39', '2017-06-15 07:49:39'),
(84, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:70;}', '101.187.98.39', '2017-06-15 07:50:01'),
(85, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:71;}', '101.187.98.39', '2017-06-15 07:50:27'),
(86, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:72;}', '101.187.98.39', '2017-06-15 08:10:41'),
(87, 6, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:73;}', '101.187.98.39', '2017-06-15 08:15:39'),
(88, 5, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:11:\"1234@qq.com\";}', '117.44.133.8', '2017-06-15 08:40:34'),
(89, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:74;}', '117.44.133.8', '2017-06-15 08:56:40'),
(90, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:75;}', '117.44.133.8', '2017-06-15 08:56:54'),
(91, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:76;}', '117.44.133.8', '2017-06-15 08:57:08'),
(92, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:77;}', '117.44.133.8', '2017-06-15 08:57:14'),
(93, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:78;}', '117.44.133.8', '2017-06-15 08:57:32'),
(94, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:79;}', '117.44.133.8', '2017-06-15 08:57:45'),
(95, 5, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:80;}', '117.44.133.8', '2017-06-15 09:00:13'),
(96, 5, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:11:\"1234@qq.com\";}', '117.44.133.8', '2017-06-15 15:58:09'),
(97, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-16 08:35:25'),
(98, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:82;}', '101.187.98.39', '2017-06-16 08:36:04'),
(99, 7, 'register', 'a:2:{s:11:\"customer_id\";i:7;s:5:\"email\";s:12:\"12345@qq.com\";}', '182.111.155.151', '2017-06-16 08:53:29'),
(100, 0, 'order_guest', 'a:2:{s:4:\"name\";s:12:\"12321 123213\";s:8:\"order_id\";i:83;}', '182.111.155.151', '2017-06-16 08:55:06'),
(101, 7, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:12:\"12345@qq.com\";}', '182.111.155.151', '2017-06-16 08:55:17'),
(102, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:84;}', '182.111.155.151', '2017-06-16 08:55:27'),
(103, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:85;}', '182.111.155.151', '2017-06-16 08:56:48'),
(104, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:86;}', '182.111.155.151', '2017-06-16 08:57:29'),
(105, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:87;}', '182.111.155.151', '2017-06-16 08:57:39'),
(106, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:88;}', '182.111.155.151', '2017-06-16 08:57:48'),
(107, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:89;}', '182.111.155.151', '2017-06-16 08:57:57'),
(108, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:90;}', '182.111.155.151', '2017-06-16 08:58:03'),
(109, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:91;}', '182.111.155.151', '2017-06-16 08:58:13'),
(110, 7, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"7\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:92;}', '182.111.155.151', '2017-06-16 08:58:30'),
(111, 8, 'register', 'a:2:{s:11:\"customer_id\";i:8;s:5:\"email\";s:15:\"mkl@hotmail.com\";}', '101.187.98.39', '2017-06-16 11:50:59'),
(112, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:93;}', '101.187.98.39', '2017-06-16 11:51:34'),
(113, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:94;}', '101.187.98.39', '2017-06-16 11:53:31'),
(114, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:95;}', '101.187.98.39', '2017-06-16 11:53:55'),
(115, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:96;}', '101.187.98.39', '2017-06-16 11:54:13'),
(116, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:97;}', '101.187.98.39', '2017-06-16 11:54:30'),
(117, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:99;}', '101.187.98.39', '2017-06-16 11:54:57'),
(118, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:100;}', '101.187.98.39', '2017-06-16 11:55:23'),
(119, 1, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:10:\"123@qq.com\";}', '182.111.155.151', '2017-06-16 11:55:37'),
(120, 8, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:15:\"mkl@hotmail.com\";}', '101.187.98.39', '2017-06-16 11:56:43'),
(121, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:101;}', '101.187.98.39', '2017-06-16 11:59:34'),
(122, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:102;}', '101.187.98.39', '2017-06-16 11:59:57'),
(123, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:103;}', '182.111.155.151', '2017-06-16 12:02:32'),
(124, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:104;}', '182.111.155.151', '2017-06-16 12:02:45'),
(125, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:105;}', '182.111.155.151', '2017-06-16 12:02:56'),
(126, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:106;}', '182.111.155.151', '2017-06-16 12:03:06'),
(127, 1, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:107;}', '182.111.155.151', '2017-06-16 12:03:13'),
(128, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:108;}', '101.187.98.39', '2017-06-16 12:06:18'),
(129, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:109;}', '101.187.98.39', '2017-06-16 12:06:54'),
(130, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:110;}', '101.187.98.39', '2017-06-16 12:07:09'),
(131, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:111;}', '101.187.98.39', '2017-06-16 12:07:32'),
(132, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:112;}', '101.187.98.39', '2017-06-16 12:07:50'),
(133, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:113;}', '101.187.98.39', '2017-06-16 12:08:04'),
(134, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:114;}', '101.187.98.39', '2017-06-16 12:08:25'),
(135, 8, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"8\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:115;}', '101.187.98.39', '2017-06-16 12:11:59'),
(136, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-16 12:33:49'),
(137, 0, 'order_guest', 'a:2:{s:4:\"name\";s:14:\"1231231 123123\";s:8:\"order_id\";i:127;}', '182.111.155.151', '2017-06-16 13:57:33'),
(138, 0, 'order_guest', 'a:2:{s:4:\"name\";s:14:\"1231231 123123\";s:8:\"order_id\";i:136;}', '182.111.155.151', '2017-06-16 14:18:20'),
(139, 0, 'order_guest', 'a:2:{s:4:\"name\";s:14:\"1231231 123123\";s:8:\"order_id\";i:142;}', '182.111.155.151', '2017-06-16 14:19:50'),
(140, 0, 'order_guest', 'a:2:{s:4:\"name\";s:14:\"1231231 123123\";s:8:\"order_id\";i:148;}', '182.111.155.151', '2017-06-16 14:34:31'),
(141, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:153;}', '101.187.98.39', '2017-06-16 15:20:44'),
(142, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-21 15:13:58'),
(143, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-22 08:15:23'),
(144, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-23 08:34:14'),
(145, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-23 09:30:08'),
(146, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-23 09:33:57'),
(147, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-06-23 10:24:27'),
(148, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:165;}', '101.187.98.39', '2017-06-27 09:02:28'),
(149, 0, 'order_guest', 'a:2:{s:4:\"name\";s:12:\"firsts lasts\";s:8:\"order_id\";i:169;}', '115.151.186.5', '2017-06-30 16:38:47'),
(150, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-03 08:19:53'),
(151, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:171;}', '101.187.98.39', '2017-07-03 08:31:43'),
(152, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:173;}', '101.187.98.39', '2017-07-03 10:43:49'),
(153, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-03 11:30:28'),
(154, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"Harry Chen\";s:8:\"order_id\";i:174;}', '101.187.98.39', '2017-07-03 11:59:06'),
(155, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-03 12:54:18'),
(156, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:177;}', '101.187.98.39', '2017-07-03 12:57:00'),
(157, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-03 14:55:10'),
(158, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:180;}', '101.187.98.39', '2017-07-04 09:37:25'),
(159, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:181;}', '101.187.98.39', '2017-07-04 10:27:11'),
(160, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:1;}', '101.187.98.39', '2017-07-11 08:27:11'),
(161, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:15;}', '101.187.98.39', '2017-07-11 12:41:15'),
(162, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-11 13:42:01'),
(163, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-11 13:43:02'),
(164, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-11 13:43:36'),
(165, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:18;}', '101.187.98.39', '2017-07-11 13:53:40'),
(166, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:19;}', '101.187.98.39', '2017-07-11 14:43:50'),
(167, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-11 15:01:31'),
(168, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-11 15:01:53'),
(169, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-11 15:05:17'),
(170, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:20;}', '101.187.98.39', '2017-07-11 15:07:38'),
(171, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:21;}', '101.187.98.39', '2017-07-11 15:23:48'),
(172, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-11 15:26:51'),
(173, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:22;}', '101.187.98.39', '2017-07-11 15:28:33'),
(174, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-12 08:34:36'),
(175, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:23;}', '101.187.98.39', '2017-07-12 08:36:12'),
(176, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:24;}', '101.187.98.39', '2017-07-12 08:38:39'),
(177, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:26;}', '101.187.98.39', '2017-07-12 08:41:05'),
(178, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:27;}', '101.187.98.39', '2017-07-12 08:43:48'),
(179, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-12 08:57:05'),
(180, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:28;}', '101.187.98.39', '2017-07-12 08:59:11'),
(181, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:29;}', '101.187.98.39', '2017-07-12 09:28:16'),
(182, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:32;}', '115.151.186.197', '2017-07-17 10:20:23'),
(183, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:33;}', '115.151.186.197', '2017-07-17 10:22:00'),
(184, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:34;}', '115.151.186.197', '2017-07-17 10:29:15'),
(185, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:35;}', '115.151.186.197', '2017-07-17 10:38:11'),
(186, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:36;}', '101.187.98.39', '2017-07-18 08:11:10'),
(187, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:38;}', '101.187.98.39', '2017-07-18 08:14:32'),
(188, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-18 08:24:07'),
(189, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:39;}', '101.187.98.39', '2017-07-18 08:26:21'),
(190, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-18 08:36:39'),
(191, 0, 'order_guest', 'a:2:{s:4:\"name\";s:9:\"fist last\";s:8:\"order_id\";i:40;}', '115.151.186.216', '2017-07-19 19:17:05'),
(192, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-20 08:10:18'),
(193, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:41;}', '101.187.98.39', '2017-07-20 08:10:23'),
(194, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:44;}', '101.187.98.39', '2017-07-20 08:29:54'),
(195, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-20 08:30:29'),
(196, 4, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:5:\"email\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-20 08:31:24'),
(197, 4, 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:10:\"John Smith\";s:8:\"order_id\";i:45;}', '101.187.98.39', '2017-07-20 08:42:08'),
(198, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-20 09:54:08'),
(199, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-20 09:54:22'),
(200, 9, 'register', 'a:2:{s:11:\"customer_id\";i:9;s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-20 09:54:55'),
(201, 9, 'detail', 'a:2:{s:11:\"customer_id\";s:1:\"9\";s:5:\"email\";s:20:\"asdfqwer@hotmail.com\";}', '101.187.98.39', '2017-07-20 09:55:32'),
(202, 10, 'register', 'a:2:{s:11:\"customer_id\";i:10;s:5:\"email\";s:11:\"1122@qq.com\";}', '115.151.186.216', '2017-07-20 10:02:42'),
(203, 10, 'detail', 'a:2:{s:11:\"customer_id\";s:2:\"10\";s:5:\"email\";s:11:\"1122@qq.com\";}', '115.151.186.216', '2017-07-20 10:02:50'),
(204, 11, 'register', 'a:2:{s:11:\"customer_id\";i:11;s:5:\"email\";s:16:\"aaaa@hotmail.com\";}', '101.187.98.39', '2017-07-20 10:03:59'),
(205, 11, 'detail', 'a:2:{s:11:\"customer_id\";s:2:\"11\";s:5:\"email\";s:16:\"aaaa@hotmail.com\";}', '101.187.98.39', '2017-07-20 10:04:40'),
(206, 11, 'detail', 'a:2:{s:11:\"customer_id\";s:2:\"11\";s:5:\"email\";s:16:\"aaaa@hotmail.com\";}', '101.187.98.39', '2017-07-20 10:04:45'),
(207, 10, 'detail', 'a:2:{s:11:\"customer_id\";s:2:\"10\";s:5:\"email\";s:11:\"1122@qq.com\";}', '115.151.186.216', '2017-07-20 10:06:30'),
(208, 10, 'detail', 'a:2:{s:11:\"customer_id\";s:2:\"10\";s:5:\"email\";s:11:\"1122@qq.com\";}', '115.151.186.216', '2017-07-20 10:08:13'),
(209, 11, 'detail', 'a:2:{s:11:\"customer_id\";s:2:\"11\";s:5:\"email\";s:16:\"aaaa@hotmail.com\";}', '101.187.98.39', '2017-07-20 10:08:41'),
(210, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:47;}', '101.187.98.39', '2017-07-21 09:45:28'),
(211, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:48;}', '101.187.98.39', '2017-07-21 09:46:25'),
(212, 4, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"4\";s:4:\"name\";s:24:\"grantedwins5@hotmail.com\";}', '101.187.98.39', '2017-07-21 09:56:36'),
(213, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"1 1\";s:8:\"order_id\";i:54;}', '101.187.98.39', '2017-07-21 11:57:30'),
(214, 0, 'order_guest', 'a:2:{s:4:\"name\";s:9:\"fist last\";s:8:\"order_id\";i:58;}', '127.0.0.1', '2017-07-24 14:37:48'),
(215, 0, 'order_guest', 'a:2:{s:4:\"name\";s:9:\"fist last\";s:8:\"order_id\";i:60;}', '127.0.0.1', '2017-07-24 14:45:03'),
(216, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:61;}', '127.0.0.1', '2017-07-24 15:34:27'),
(217, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:62;}', '127.0.0.1', '2017-07-24 15:56:54'),
(218, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:65;}', '127.0.0.1', '2017-07-24 16:25:52'),
(219, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:66;}', '127.0.0.1', '2017-07-24 16:32:33'),
(220, 12, 'register', 'a:2:{s:11:\"customer_id\";i:12;s:5:\"email\";s:13:\"sirius@qq.com\";}', '127.0.0.1', '2017-07-28 09:08:21'),
(221, 12, 'detail', 'a:2:{s:11:\"customer_id\";s:2:\"12\";s:5:\"email\";s:13:\"sirius@qq.com\";}', '127.0.0.1', '2017-07-28 09:09:59'),
(222, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"first first\";s:8:\"order_id\";i:67;}', '127.0.0.1', '2017-07-28 14:44:45'),
(223, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"first first\";s:8:\"order_id\";i:68;}', '127.0.0.1', '2017-07-28 14:52:40'),
(224, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"first first\";s:8:\"order_id\";i:69;}', '127.0.0.1', '2017-07-28 14:56:53'),
(225, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"first first\";s:8:\"order_id\";i:70;}', '127.0.0.1', '2017-07-28 15:14:42'),
(226, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"first first\";s:8:\"order_id\";i:71;}', '127.0.0.1', '2017-07-28 15:39:59'),
(227, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"first first\";s:8:\"order_id\";i:72;}', '127.0.0.1', '2017-07-28 15:49:19'),
(228, 0, 'order_guest', 'a:2:{s:4:\"name\";s:11:\"first first\";s:8:\"order_id\";i:74;}', '127.0.0.1', '2017-07-28 16:00:31'),
(229, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:75;}', '127.0.0.1', '2017-07-28 16:16:55'),
(230, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:76;}', '127.0.0.1', '2017-07-28 16:24:47'),
(231, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:77;}', '127.0.0.1', '2017-07-28 17:08:36'),
(232, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:78;}', '127.0.0.1', '2017-07-28 17:12:57'),
(233, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:79;}', '127.0.0.1', '2017-07-28 17:15:59'),
(234, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:80;}', '127.0.0.1', '2017-07-28 17:17:08'),
(235, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"first last\";s:8:\"order_id\";i:81;}', '127.0.0.1', '2017-07-28 17:32:11'),
(236, 5, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:11:\"1234@qq.com\";}', '127.0.0.1', '2017-07-31 09:20:17'),
(237, 5, 'login', 'a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:11:\"1234@qq.com\";}', '127.0.0.1', '2017-07-31 09:25:17'),
(238, 0, 'order_guest', 'a:2:{s:4:\"name\";s:14:\"1laost fitlsar\";s:8:\"order_id\";i:85;}', '127.0.0.1', '2017-07-31 12:55:40'),
(239, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:1;}', '192.168.1.220', '2017-08-01 17:18:48'),
(240, 13, 'register', 'a:2:{s:11:\"customer_id\";i:13;s:5:\"email\";s:15:\"harry@gmail.com\";}', '192.168.1.220', '2017-08-01 17:23:09'),
(241, 13, 'order_account', 'a:3:{s:11:\"customer_id\";s:2:\"13\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:2;}', '192.168.1.220', '2017-08-01 17:23:34'),
(242, 13, 'order_account', 'a:3:{s:11:\"customer_id\";s:2:\"13\";s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:3;}', '192.168.1.220', '2017-08-01 17:35:14'),
(243, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:4;}', '192.168.1.220', '2017-08-02 11:07:52'),
(244, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:5;}', '192.168.1.220', '2017-08-02 15:26:14'),
(245, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:6;}', '192.168.1.220', '2017-08-02 15:33:00'),
(246, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:7;}', '192.168.1.220', '2017-08-02 15:39:38'),
(247, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"a badafdsa\";s:8:\"order_id\";i:8;}', '192.168.1.220', '2017-08-04 11:38:40'),
(248, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"a badafdsa\";s:8:\"order_id\";i:11;}', '192.168.1.220', '2017-08-04 12:02:48'),
(249, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"a badafdsa\";s:8:\"order_id\";i:12;}', '192.168.1.220', '2017-08-04 12:14:57'),
(250, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:13;}', '192.168.1.220', '2017-08-09 12:26:37'),
(251, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:14;}', '192.168.1.220', '2017-08-09 12:32:38'),
(252, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:15;}', '192.168.1.220', '2017-08-09 12:34:15'),
(253, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:16;}', '192.168.1.220', '2017-08-10 11:52:12'),
(254, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:17;}', '192.168.1.220', '2017-08-16 17:50:49'),
(255, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:18;}', '192.168.1.220', '2017-08-16 17:58:02'),
(256, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:19;}', '192.168.1.220', '2017-08-16 18:23:56'),
(257, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:20;}', '192.168.1.220', '2017-08-17 10:35:37'),
(258, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:21;}', '192.168.1.220', '2017-08-17 10:41:40'),
(259, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:22;}', '192.168.1.220', '2017-08-22 13:18:59'),
(260, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:23;}', '192.168.1.220', '2017-08-22 13:20:35'),
(261, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:24;}', '192.168.1.220', '2017-08-22 14:00:26'),
(262, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"s s\";s:8:\"order_id\";i:25;}', '192.168.1.220', '2017-08-25 16:50:44'),
(263, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"s s\";s:8:\"order_id\";i:26;}', '192.168.1.220', '2017-08-25 16:57:08'),
(264, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"s s\";s:8:\"order_id\";i:27;}', '192.168.1.220', '2017-08-25 16:59:16'),
(265, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"s s\";s:8:\"order_id\";i:28;}', '192.168.1.220', '2017-08-25 17:43:05'),
(266, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"s s\";s:8:\"order_id\";i:29;}', '192.168.1.220', '2017-08-25 18:01:16'),
(267, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"a2 b\";s:8:\"order_id\";i:30;}', '192.168.1.220', '2017-08-28 15:56:12'),
(268, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"a2 b\";s:8:\"order_id\";i:31;}', '192.168.1.220', '2017-08-28 16:08:49'),
(269, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"a2 b\";s:8:\"order_id\";i:32;}', '192.168.1.220', '2017-08-29 17:13:55'),
(270, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"a2 b\";s:8:\"order_id\";i:33;}', '192.168.1.220', '2017-08-29 17:49:54'),
(271, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"a2 b\";s:8:\"order_id\";i:34;}', '192.168.1.220', '2017-08-29 17:52:08'),
(272, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:35;}', '192.168.1.220', '2017-09-07 16:36:19'),
(273, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:36;}', '192.168.1.220', '2017-09-07 17:02:35'),
(274, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:37;}', '192.168.1.220', '2017-09-07 17:06:53'),
(275, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:38;}', '192.168.1.220', '2017-09-07 17:11:07'),
(276, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:39;}', '192.168.1.220', '2017-09-07 17:11:55'),
(277, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:40;}', '192.168.1.220', '2017-09-07 17:19:02'),
(278, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:41;}', '192.168.1.220', '2017-09-07 17:58:27'),
(279, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:42;}', '192.168.1.220', '2017-09-07 18:04:43'),
(280, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:43;}', '192.168.1.220', '2017-09-07 18:13:37'),
(281, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:44;}', '192.168.1.220', '2017-09-07 18:23:55'),
(282, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:45;}', '192.168.1.220', '2017-09-07 18:29:41'),
(283, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:46;}', '192.168.1.220', '2017-09-07 18:34:45'),
(284, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:47;}', '192.168.1.220', '2017-09-07 18:41:21'),
(285, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:48;}', '192.168.1.220', '2017-09-07 18:43:08'),
(286, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:49;}', '192.168.1.220', '2017-09-07 18:45:13'),
(287, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:50;}', '192.168.1.220', '2017-09-07 18:51:54'),
(288, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:51;}', '192.168.1.220', '2017-09-07 18:53:38'),
(289, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:52;}', '192.168.1.220', '2017-09-07 18:55:53'),
(290, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:53;}', '192.168.1.220', '2017-09-08 10:41:13'),
(291, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:54;}', '192.168.1.220', '2017-09-08 10:50:20'),
(292, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:55;}', '192.168.1.220', '2017-09-08 10:53:57'),
(293, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:56;}', '192.168.1.220', '2017-09-13 15:29:06'),
(294, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:57;}', '192.168.1.220', '2017-09-13 16:11:16'),
(295, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:58;}', '192.168.1.220', '2017-09-13 16:16:42'),
(296, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:59;}', '192.168.1.220', '2017-09-13 16:18:58'),
(297, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:60;}', '192.168.1.220', '2017-09-13 16:23:12'),
(298, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:61;}', '192.168.1.220', '2017-09-13 16:24:54'),
(299, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:62;}', '192.168.1.220', '2017-09-13 16:25:34'),
(300, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:63;}', '192.168.1.220', '2017-09-13 16:58:51'),
(301, 0, 'order_guest', 'a:2:{s:4:\"name\";s:4:\"a2 b\";s:8:\"order_id\";i:64;}', '192.168.1.220', '2017-09-14 13:55:38'),
(302, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:65;}', '192.168.1.220', '2017-09-20 11:07:17'),
(303, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:66;}', '192.168.1.220', '2017-09-20 11:15:15'),
(304, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:67;}', '192.168.1.220', '2017-09-28 14:38:15'),
(305, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:68;}', '192.168.1.220', '2017-09-29 18:41:08'),
(306, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:69;}', '192.168.1.220', '2017-09-29 18:54:59'),
(307, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:70;}', '192.168.1.220', '2017-09-29 19:00:45'),
(308, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:71;}', '192.168.1.220', '2017-09-29 19:04:54'),
(309, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:73;}', '192.168.1.220', '2017-09-29 19:11:39'),
(310, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:74;}', '192.168.1.220', '2017-09-29 19:17:28'),
(311, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:75;}', '192.168.1.220', '2017-09-29 19:20:23'),
(312, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:76;}', '192.168.1.220', '2017-09-29 19:28:43'),
(313, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:77;}', '192.168.1.220', '2017-09-29 19:32:40'),
(314, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:78;}', '192.168.1.220', '2017-09-29 19:35:49'),
(315, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:79;}', '192.168.1.220', '2017-09-29 19:51:40'),
(316, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:80;}', '192.168.1.220', '2017-09-29 19:58:04'),
(317, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:81;}', '192.168.1.220', '2017-09-29 20:00:20'),
(318, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:82;}', '192.168.1.220', '2017-09-29 20:02:22'),
(319, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:83;}', '192.168.1.220', '2017-09-29 20:06:19'),
(320, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:84;}', '192.168.1.220', '2017-09-29 20:07:35'),
(321, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:85;}', '192.168.1.220', '2017-10-03 10:01:56'),
(322, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:86;}', '192.168.1.220', '2017-10-03 10:05:34'),
(323, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:87;}', '192.168.1.220', '2017-10-03 10:08:24'),
(324, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:88;}', '192.168.1.220', '2017-10-03 10:17:50'),
(325, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:89;}', '192.168.1.220', '2017-10-03 10:19:12'),
(326, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:90;}', '192.168.1.220', '2017-10-03 10:22:53'),
(327, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:91;}', '192.168.1.220', '2017-10-03 10:31:27'),
(328, 0, 'order_guest', 'a:2:{s:4:\"name\";s:10:\"a badafdsa\";s:8:\"order_id\";i:92;}', '192.168.1.220', '2017-10-20 11:43:02'),
(329, 0, 'order_guest', 'a:2:{s:4:\"name\";s:5:\"a2 a3\";s:8:\"order_id\";i:93;}', '192.168.1.220', '2017-10-23 12:50:41'),
(330, 0, 'order_guest', 'a:2:{s:4:\"name\";s:5:\"a2 a3\";s:8:\"order_id\";i:94;}', '192.168.1.220', '2017-10-23 12:52:29'),
(331, 0, 'order_guest', 'a:2:{s:4:\"name\";s:5:\"a2 a3\";s:8:\"order_id\";i:95;}', '192.168.1.220', '2017-10-23 12:54:12'),
(332, 0, 'order_guest', 'a:2:{s:4:\"name\";s:5:\"a2 a3\";s:8:\"order_id\";i:96;}', '192.168.1.220', '2017-10-23 12:55:58'),
(333, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:97;}', '192.168.1.220', '2017-10-24 11:11:31'),
(334, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:98;}', '192.168.1.220', '2017-10-24 12:24:14'),
(335, 0, 'order_guest', 'a:2:{s:4:\"name\";s:9:\"test test\";s:8:\"order_id\";i:99;}', '192.168.1.220', '2017-11-17 12:03:57'),
(336, 0, 'order_guest', 'a:2:{s:4:\"name\";s:9:\"test test\";s:8:\"order_id\";i:101;}', '192.168.1.220', '2017-11-17 12:10:17'),
(337, 0, 'order_guest', 'a:2:{s:4:\"name\";s:9:\"test test\";s:8:\"order_id\";i:102;}', '192.168.1.220', '2017-11-17 12:12:46'),
(338, 0, 'order_guest', 'a:2:{s:4:\"name\";s:9:\"test test\";s:8:\"order_id\";i:103;}', '192.168.1.220', '2017-11-17 12:19:56'),
(339, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"s s\";s:8:\"order_id\";i:104;}', '192.168.1.220', '2017-11-17 18:39:34'),
(340, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"s s\";s:8:\"order_id\";i:105;}', '192.168.1.220', '2017-11-17 18:42:50'),
(341, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:106;}', '192.168.1.220', '2018-01-10 12:09:34'),
(342, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"f a\";s:8:\"order_id\";i:107;}', '192.168.1.220', '2018-01-12 12:38:15'),
(343, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"f a\";s:8:\"order_id\";i:108;}', '192.168.1.220', '2018-01-12 12:40:12'),
(344, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:109;}', '192.168.1.220', '2018-01-17 14:13:27'),
(345, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:110;}', '192.168.1.220', '2018-01-17 14:21:10'),
(346, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a b\";s:8:\"order_id\";i:111;}', '192.168.1.220', '2018-01-17 14:22:27'),
(347, 0, 'order_guest', 'a:2:{s:4:\"name\";s:3:\"a a\";s:8:\"order_id\";i:112;}', '192.168.1.220', '2018-01-19 15:51:33'),
(348, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:113;}', '192.168.1.220', '2018-01-19 15:58:11'),
(349, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:113;}', '192.168.1.220', '2018-01-19 15:59:18'),
(350, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:114;}', '192.168.1.220', '2018-01-19 16:00:04'),
(351, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:114;}', '192.168.1.220', '2018-01-19 16:01:27'),
(352, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:115;}', '192.168.1.220', '2018-01-19 16:02:07'),
(353, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:116;}', '192.168.1.220', '2018-01-19 16:13:28'),
(354, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:117;}', '192.168.1.220', '2018-01-19 16:19:07'),
(355, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:118;}', '192.168.1.220', '2018-01-19 16:23:46'),
(356, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:121;}', '192.168.1.220', '2018-01-19 16:30:36'),
(357, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:122;}', '192.168.1.220', '2018-01-22 12:50:22'),
(358, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:123;}', '192.168.1.220', '2018-01-22 12:51:20'),
(359, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:124;}', '192.168.1.220', '2018-01-22 12:52:41'),
(360, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:125;}', '192.168.1.220', '2018-01-22 12:58:46'),
(361, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:126;}', '192.168.1.220', '2018-01-22 13:47:34'),
(362, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:127;}', '192.168.1.220', '2018-01-22 15:12:19'),
(363, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:128;}', '192.168.1.220', '2018-01-22 15:12:42'),
(364, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:129;}', '192.168.1.220', '2018-01-22 15:13:24'),
(365, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:130;}', '192.168.1.220', '2018-01-22 15:14:45'),
(366, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:131;}', '192.168.1.220', '2018-01-22 15:18:15'),
(367, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:132;}', '192.168.1.220', '2018-01-22 15:31:31'),
(368, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:133;}', '192.168.1.246', '2018-01-24 20:04:04'),
(369, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:134;}', '192.168.1.246', '2018-01-24 20:07:00'),
(370, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:135;}', '192.168.1.209', '2018-01-25 12:22:06'),
(371, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:136;}', '192.168.1.220', '2018-01-25 13:04:25'),
(372, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:137;}', '192.168.1.220', '2018-01-25 13:23:02'),
(373, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:138;}', '192.168.1.220', '2018-01-25 13:24:38'),
(374, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:139;}', '192.168.1.220', '2018-01-25 14:22:20');
INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(375, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:140;}', '192.168.1.220', '2018-01-25 14:46:21'),
(376, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:141;}', '192.168.1.220', '2018-06-20 18:17:37'),
(377, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:142;}', '192.168.1.220', '2018-06-20 18:19:03'),
(378, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:143;}', '192.168.1.220', '2018-06-20 18:30:11'),
(379, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:144;}', '192.168.1.220', '2018-06-20 19:08:47'),
(380, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:145;}', '192.168.1.220', '2018-06-20 19:19:49'),
(381, 0, 'order_guest', 'a:2:{s:4:\"name\";s:1:\" \";s:8:\"order_id\";i:146;}', '192.168.1.220', '2018-06-20 19:34:55');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_ban_ip`
--

CREATE TABLE `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2017-05-11 11:28:09'),
(2, 1, '115.151.184.54', '2017-05-20 10:20:51'),
(3, 2, '115.151.184.54', '2017-05-20 10:24:14'),
(4, 3, '103.253.25.137', '2017-05-20 10:46:11'),
(5, 4, '101.187.98.39', '2017-05-25 10:50:26'),
(6, 1, '117.44.132.159', '2017-05-25 13:24:37'),
(7, 1, '182.103.241.63', '2017-06-03 17:57:10'),
(8, 1, '182.111.154.134', '2017-06-06 08:39:01'),
(9, 4, '120.26.192.76', '2017-06-07 10:05:24'),
(10, 1, '117.44.133.166', '2017-06-07 16:40:34'),
(11, 1, '182.103.241.202', '2017-06-13 14:09:05'),
(12, 1, '117.44.133.8', '2017-06-13 16:56:21'),
(13, 5, '117.44.133.8', '2017-06-14 10:05:44'),
(14, 6, '101.187.98.39', '2017-06-14 10:17:50'),
(15, 7, '182.111.155.151', '2017-06-16 08:53:29'),
(16, 8, '101.187.98.39', '2017-06-16 11:51:00'),
(17, 1, '182.111.155.151', '2017-06-16 11:55:38'),
(18, 9, '101.187.98.39', '2017-07-20 09:54:55'),
(19, 10, '115.151.186.216', '2017-07-20 10:02:42'),
(20, 11, '101.187.98.39', '2017-07-20 10:04:00'),
(21, 12, '127.0.0.1', '2017-07-28 09:08:21'),
(22, 5, '127.0.0.1', '2017-07-31 09:20:17'),
(23, 13, '192.168.1.220', '2017-08-01 17:23:09');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(3, 'qzwxecrv@hotmail.com', '101.187.98.39', 1, '2017-05-25 02:48:09', '2017-05-25 02:48:09'),
(4, 'wxecrvtb@hotmail.com', '101.187.98.39', 5, '2017-05-25 02:48:15', '2017-05-25 02:48:30'),
(5, 'asdf@hotmail.com', '101.187.98.39', 2, '2017-05-26 00:00:57', '2017-05-26 00:01:02'),
(6, 'test123', '182.103.241.202', 3, '2017-06-13 06:08:31', '2017-06-13 06:08:36'),
(11, 'richad521@hotmail.com', '101.187.98.39', 2, '2017-06-23 02:23:56', '2017-06-23 02:24:04'),
(10, '', '174.127.133.44', 1, '2017-06-19 21:28:28', '2017-06-19 21:28:28');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow'),
(428, 'shipping', 'auspost'),
(430, 'module', 'store'),
(431, 'payment', 'pp_pro'),
(432, 'shipping', 'free'),
(433, 'payment', 'pp_standard'),
(434, 'payment', 'pp_express');

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(1, 'Monkey King Thai Restaurant', 'Monkey King Thai Restaurant', '2017-07-03 12:14:10', '2017-04-21 11:59:50');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(67, 1, 'carousel.29', 'content_top', 3),
(66, 1, 'slideshow.27', 'content_top', 1),
(65, 1, 'featured.28', 'content_top', 2),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
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
-- 表的结构 `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- 表的结构 `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- 表的结构 `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  `tag_ids` varchar(25) NOT NULL COMMENT '标签ids',
  `consume` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费',
  `coupon_ids` varchar(25) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `isopen` tinyint(1) NOT NULL DEFAULT '1',
  `bgimage` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `color1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_location`
--

INSERT INTO `oc_location` (`location_id`, `name`, `address`, `telephone`, `fax`, `geocode`, `image`, `open`, `comment`, `tag_ids`, `consume`, `coupon_ids`, `geo_zone_id`, `isopen`, `bgimage`, `user_id`, `color`, `color1`) VALUES
(4, 'Monkey King Thai Restaurant', '338 Pacific Hwy, Lindfield NSW 2070', '(02) 9416 9301', '', 'BDF', 'catalog/Hanuman-Thai--Lindfield_Orderonline.png', '11:00-22:00', 'Monkey King Thai  is one of the best known ethnic restaurants in the Sydney area. ', '4,8', '10.00', '7,8,9,10,11', 1, 1, 'catalog/demo/gift-voucher-birthday.jpg', 1, '', ''),
(5, '', '', '', '', '', NULL, '', '', '', '0.00', '', 0, 1, '', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', 'a:5:{s:4:\"name\";s:17:\"Banner - Category\";s:9:\"banner_id\";s:1:\"6\";s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"300\";s:6:\"status\";s:1:\"1\";}'),
(29, 'Home Page', 'carousel', 'a:5:{s:4:\"name\";s:20:\"Carousel - Home Page\";s:9:\"banner_id\";s:1:\"8\";s:5:\"width\";s:3:\"130\";s:6:\"height\";s:3:\"100\";s:6:\"status\";s:1:\"1\";}'),
(28, 'Home Page', 'featured', 'a:6:{s:4:\"name\";s:20:\"Featured - Home Page\";s:7:\"product\";a:4:{i:0;s:2:\"43\";i:1;s:2:\"40\";i:2;s:2:\"42\";i:3;s:2:\"30\";}s:5:\"limit\";s:1:\"4\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}'),
(27, 'Home Page', 'slideshow', 'a:5:{s:4:\"name\";s:21:\"Slideshow - Home Page\";s:9:\"banner_id\";s:1:\"7\";s:5:\"width\";s:4:\"1140\";s:6:\"height\";s:3:\"380\";s:6:\"status\";s:1:\"1\";}');

-- --------------------------------------------------------

--
-- 表的结构 `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 0),
(2, 'radio', 0),
(3, 'radio', 0),
(4, 'radio', 4),
(5, 'radio', 5);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `name_2` varchar(255) NOT NULL,
  `name_3` varchar(255) NOT NULL,
  `name_4` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`, `name_2`, `name_3`, `name_4`) VALUES
(1, 1, 'sweet', '甜度', '', ''),
(2, 1, 'S2', '型号2', '', ''),
(3, 1, 'sweet2', '甜度2', '', ''),
(4, 1, 'S1', '型号1', '', ''),
(5, 1, 'Size', '型号', '', ''),
(5, 2, '型号', '型号', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(2, 1, '', 2),
(1, 1, '', 1),
(5, 2, '', 3),
(4, 2, '', 2),
(3, 2, '', 1),
(7, 3, '', 2),
(6, 3, '', 1),
(8, 4, '', 8),
(9, 4, '', 9),
(10, 4, '', 10),
(11, 4, '', 11),
(12, 4, '', 12),
(13, 4, '', 13),
(14, 4, '', 14),
(15, 4, '', 15),
(16, 4, '', 16),
(17, 4, '', 17),
(18, 4, '', 18),
(19, 5, '', 19),
(20, 5, '', 20),
(21, 5, '', 21),
(22, 5, '', 22),
(23, 5, '', 23),
(24, 5, '', 24),
(25, 5, '', 25),
(26, 5, '', 26),
(27, 5, '', 27),
(28, 5, '', 28),
(29, 5, '', 29),
(30, 5, '', 30),
(31, 5, '', 31),
(32, 5, '', 32),
(33, 5, '', 33),
(34, 5, '', 34),
(35, 5, '', 35),
(36, 5, '', 36);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `name_2` varchar(255) NOT NULL,
  `name_3` varchar(255) NOT NULL,
  `name_4` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`, `name_2`, `name_3`, `name_4`) VALUES
(2, 1, 1, 't', 't级', '', ''),
(1, 1, 1, 'm', 'm级', '', ''),
(5, 1, 2, 'Large', '大', '', ''),
(4, 1, 2, 'Medium', '中', '', ''),
(3, 1, 2, 'Small', '小', '', ''),
(7, 1, 3, 'sw2', 'sw2级', '', ''),
(6, 1, 3, 'sw1', 'sw1级', '', ''),
(8, 1, 4, 'Small', '小', '', ''),
(9, 1, 4, 'Big', '大', '', ''),
(10, 1, 4, 'Large', '很大', '', ''),
(11, 1, 4, 'Big2', '大2', '', ''),
(12, 1, 4, 'Medium', '中', '', ''),
(13, 1, 4, 'Extra Big', '加大', '', ''),
(14, 1, 4, 'Medium1', '中1', '', ''),
(15, 1, 4, 'Big1', '大1', '', ''),
(16, 1, 4, 'Small1', '小1', '', ''),
(17, 1, 4, 'Big3', '大3', '', ''),
(18, 1, 4, 'Medium2', '中2', '', ''),
(19, 1, 5, 'Medium2', '中2', '', ''),
(20, 1, 5, 'Big3', '大3', '', ''),
(21, 1, 5, 'Large', '很大', '', ''),
(22, 1, 5, 'medium', '中', '', ''),
(23, 1, 5, 'Small', '小', '', ''),
(24, 1, 5, 'ExtraSmall', '超小', '', ''),
(25, 1, 5, 'Extra Big', '超大', '', ''),
(26, 1, 5, 'medium1', '', '', ''),
(27, 1, 5, 'Small2', '', '', ''),
(28, 1, 5, 'Big3b', '', '', ''),
(29, 1, 5, 'Medium2a', '', '', ''),
(30, 1, 5, 'Small8', '', '', ''),
(8, 2, 4, '小', '小', '', ''),
(17, 2, 4, '大3', '大3', '', ''),
(18, 2, 4, '中2', '中2', '', ''),
(3, 2, 2, '小', '小', '', ''),
(23, 2, 4, '小', '小', '', ''),
(19, 2, 5, '中2', '中2', '', ''),
(20, 2, 5, '大3', '大3', '', ''),
(31, 1, 5, '热', '', '', ''),
(32, 1, 5, '冷', '', '', ''),
(33, 1, 5, '常温', '', '', ''),
(34, 1, 5, '少', '', '', ''),
(35, 1, 5, '多', '', '', ''),
(36, 1, 5, '不要', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
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
  `payment_state` varchar(128) NOT NULL,
  `payment_state_id` int(11) NOT NULL,
  `payment_suburb` varchar(128) NOT NULL,
  `payment_suburb_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_email` varchar(255) NOT NULL,
  `shipping_telephone` varchar(255) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_state` varchar(128) NOT NULL,
  `shipping_state_id` int(11) NOT NULL,
  `shipping_suburb` varchar(128) NOT NULL,
  `shipping_suburb_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_orderTime` varchar(128) NOT NULL,
  `shipping_orderDate` varchar(128) NOT NULL,
  `shipping_orderWhen` varchar(128) NOT NULL,
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
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_coupon`
--

CREATE TABLE `oc_order_coupon` (
  `order_coupon_id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_custom_field`
--

CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_ext`
--

CREATE TABLE `oc_order_ext` (
  `order_ext_id` int(11) UNSIGNED NOT NULL,
  `product_ext_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
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
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Accepted'),
(3, 1, 'Finished'),
(4, 1, 'Cancelling'),
(5, 1, 'Refunded');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
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
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_paypal_order`
--

CREATE TABLE `oc_paypal_order` (
  `paypal_order_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `capture_status` enum('Complete','NotComplete') DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `authorization_id` varchar(30) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_paypal_order_transaction`
--

CREATE TABLE `oc_paypal_order_transaction` (
  `paypal_order_transaction_id` int(11) NOT NULL,
  `paypal_order_id` int(11) NOT NULL,
  `transaction_id` char(20) NOT NULL,
  `parent_transaction_id` char(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `msgsubid` char(38) NOT NULL,
  `receipt_id` char(20) NOT NULL,
  `payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `payment_status` char(20) NOT NULL,
  `pending_reason` char(50) NOT NULL,
  `transaction_entity` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `debug_data` text NOT NULL,
  `call_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
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
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `product_tags` varchar(20) NOT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `product_tags`, `is_discount`) VALUES
(10, '1', '0110', '0110', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 5, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(4, '1', '0104', '0104', '', '', '', '', '', 999999, 6, NULL, 0, 1, '10.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 6, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(11, '1', '0111', '0111', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 7, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(6, '1', '0106', '0106', '', '', '', '', '', 999999, 6, NULL, 0, 1, '10.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 8, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(7, '1', '0107', '0107', '', '', '', '', '', 999999, 6, NULL, 0, 1, '10.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 10, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(138, '1', '0114', '0114', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 11, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(178, '1', '0119', '0119', '', '', '', '', '', 999999, 6, NULL, 0, 1, '13.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 13, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(5, '1', '0105', '0105', '', '', '', '', '', 999999, 6, NULL, 0, 1, '14.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 14, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(139, '1', '0115', '0115', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 15, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(185, '1', '0122', '0122', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 16, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(140, '1', '0116', '0116', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 17, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 1),
(286, '1', '01123', '01123', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 18, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(287, '1', '01124', '01124', '', '', '', '', '', 999999, 6, NULL, 0, 1, '11.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 19, 1, 0, '2018-12-06 18:38:24', '2018-12-06 18:38:24', '', 0),
(17, '1', '', '0205', '', '', '', '', '', 999999, 6, NULL, 0, 1, '16.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(18, '1', '', '0206', '', '', '', '', '', 999999, 6, NULL, 0, 1, '11.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 4, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(19, '1', '', '0207', '', '', '', '', '', 999999, 6, NULL, 0, 1, '15.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 5, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(21, '1', '', '0209', '', '', '', '', '', 999999, 6, NULL, 0, 1, '8.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 7, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(23, '1', '', '0211', '', '', '', '', '', 999999, 6, NULL, 0, 1, '14.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 9, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(135, '1', '', '0212', '', '', '', '', '', 999999, 6, NULL, 0, 1, '8.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 10, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(51, '1', '', '05080', '', '', '', '', '', 999999, 6, NULL, 0, 1, '8.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 11, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(166, '1', '', '0520', '', '', '', '', '', 999999, 6, NULL, 0, 1, '10.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 12, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(299, '1', '', '05210', '', '', '', '', '', 999999, 6, NULL, 0, 1, '13.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 13, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(300, '1', '', '05211', '', '', '', '', '', 999999, 6, NULL, 0, 1, '16.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 14, 1, 0, '2018-12-06 18:38:30', '2018-12-06 18:38:30', '', 1),
(24, '1', '0301', '0301', '', '', '', '', '', 999999, 6, '24.jpg', 0, 1, '48.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, 0, '2018-12-06 18:38:31', '2018-12-06 18:38:31', '', 1),
(26, '1', '0303', '0303', '', '', '', '', '', 999999, 6, NULL, 0, 1, '9.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 2, 1, 0, '2018-12-06 18:38:31', '2018-12-06 18:38:31', '', 1),
(38, '1', '', '0407', '', '', '', '', '', 999999, 6, NULL, 0, 1, '11.5000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:38:32', '2018-12-06 18:38:32', '', 1),
(301, '1', '', '0530', '', '', '', '', '', 999999, 6, NULL, 0, 1, '128.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 8, 1, 0, '2018-12-06 18:38:33', '2018-12-06 18:38:33', '', 0),
(56, '1', '', '0513', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 10, -1, 0, '2018-12-06 18:38:35', '2018-12-06 18:38:35', '', 1),
(145, '1', '', '0731', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 14, 1, 0, '2018-12-06 18:38:35', '2018-12-06 18:38:35', '', 1),
(190, '1', '', '0525', '', '', '', '', '', 999999, 6, NULL, 0, 1, '9.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 15, 1, 0, '2018-12-06 18:38:35', '2018-12-06 18:38:35', '', 1),
(189, '1', '', '0523', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 18, 1, 0, '2018-12-06 18:38:35', '2018-12-06 18:38:35', '', 1),
(198, '1', '', '0526', '', '', '', '', '', 999999, 6, NULL, 0, 1, '17.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 20, 1, 0, '2018-12-06 18:38:36', '2018-12-06 18:38:36', '', 1),
(206, '1', '', '0528', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 21, 1, 0, '2018-12-06 18:38:36', '2018-12-06 18:38:36', '', 1),
(285, '1', '', '0820', '', '', '', '', '', 999999, 6, NULL, 0, 1, '18.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 23, 1, 0, '2018-12-06 18:38:36', '2018-12-06 18:38:36', '', 1),
(305, '1', '', '0529', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 24, -1, 0, '2018-12-06 18:38:36', '2018-12-06 18:38:36', '', 1),
(98, '1', '', '0801', '', '', '', '', '', 999999, 6, NULL, 0, 1, '8.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(99, '1', '', '0802', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 1, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(131, '1', '', '0806', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 2, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(156, '1', '', '0811', '', '', '', '', '', 999999, 6, NULL, 0, 1, '4.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(154, '1', '', '0809', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 4, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(157, '1', '', '0812', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 5, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(101, '1', '', '0804', '', '', '', '', '', 999999, 6, NULL, 0, 1, '9.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 6, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(296, '1', '', '01', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 7, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(312, '1', '', '02', '', '', '', '', '', 999999, 6, NULL, 0, 1, '8.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 8, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(329, '1', '', '05', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 9, 1, 0, '2018-12-06 18:38:41', '2018-12-06 18:38:41', '', 1),
(68, '1', '', '0701', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, 0, '2018-12-06 18:38:49', '2018-12-06 18:38:49', '', 1),
(69, '1', '', '0702', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 1, 1, 0, '2018-12-06 18:38:49', '2018-12-06 18:38:49', '', 1),
(70, '1', '', '0703', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 2, 1, 0, '2018-12-06 18:38:49', '2018-12-06 18:38:49', '', 1),
(71, '1', '', '0704', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:38:49', '2018-12-06 18:38:49', '', 1),
(72, '1', '', '0705', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 4, 1, 0, '2018-12-06 18:38:49', '2018-12-06 18:38:49', '', 1),
(75, '1', '', '0708', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 7, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(77, '1', '', '0710', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.5000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 9, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(79, '1', '', '0712', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 11, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(81, '1', '', '0714', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 13, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(82, '1', '', '0715', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.5000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 14, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(83, '1', '', '0716', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 15, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(86, '1', '', '0719', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 17, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(87, '1', '', '0720', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.5000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 18, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(88, '1', '', '0721', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.5000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 19, -1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(90, '1', '', '0723', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 21, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(92, '1', '', '0725', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 23, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(93, '1', '', '0726', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 24, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(94, '1', '', '0727', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.5000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 25, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(180, '1', '', '0734', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 28, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(96, '1', '', '0729', '', '', '', '', '', 999999, 6, NULL, 0, 1, '16.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 29, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(97, '1', '', '0730', '', '', '', '', '', 999999, 6, NULL, 0, 1, '18.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 30, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(304, '1', '', '0533', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 31, 1, 0, '2018-12-06 18:38:50', '2018-12-06 18:38:50', '', 1),
(109, '1', '', '1001', '', '', '', '', '', 999999, 6, NULL, 0, 1, '12.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 0),
(110, '1', '', '1002', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 1, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 0),
(111, '1', '', '1003', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 2, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 0),
(112, '1', '', '1004', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 0),
(113, '1', '', '1005', '', '', '', '', '', 999999, 6, NULL, 0, 1, '9.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 5, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '', 1),
(114, '1', '', '1006', '', '', '', '', '', 999999, 6, NULL, 0, 1, '4.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 6, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '', 1),
(115, '1', '', '1007', '', '', '', '', '', 999999, 6, NULL, 0, 1, '4.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 7, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 1),
(192, '1', '', '1027', '', '', '', '', '', 999999, 6, NULL, 0, 1, '18.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 8, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '', 1),
(117, '1', '', '1009', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 9, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 1),
(119, '1', '', '1011', '', '', '', '', '', 999999, 6, NULL, 0, 1, '3.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 10, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 1),
(118, '1', '', '1010', '', '', '', '', '', 999999, 6, NULL, 0, 1, '3.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 11, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 1),
(172, '1', '', '1022', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 12, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 1),
(173, '1', '', '1023', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 13, 1, 0, '2018-12-06 18:39:07', '2018-12-06 18:39:07', '热', 1),
(174, '1', '', '1024', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 14, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '热', 1),
(176, '1', '', '1026', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 16, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '热', 1),
(121, '1', '', '1013', '', '', '', '', '', 999999, 6, NULL, 0, 1, '3.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 17, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '热', 1),
(120, '1', '', '1012', '', '', '', '', '', 999999, 6, NULL, 0, 1, '3.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 18, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '热', 1),
(122, '1', '', '1014', '', '', '', '', '', 999999, 6, NULL, 0, 1, '8.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 19, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '热', 1),
(123, '1', '', '1015', '', '', '', '', '', 999999, 6, NULL, 0, 1, '8.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 20, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '热', 1),
(280, '1', '', '1034', '', '', '', '', '', 999999, 6, NULL, 0, 1, '14.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 26, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '', 0),
(322, '1', '', '1043', '', '', '', '', '', 999999, 6, NULL, 0, 1, '15.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 29, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '', 1),
(281, '1', '', '1035', '', '', '', '', '', 999999, 6, NULL, 0, 1, '14.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 31, 1, 0, '2018-12-06 18:39:08', '2018-12-06 18:39:08', '', 0),
(59, '1', '', '0601', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, 0, '2018-12-06 18:39:12', '2018-12-06 18:39:12', '', 1),
(60, '1', '', '0602', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 1, -1, 0, '2018-12-06 18:39:12', '2018-12-06 18:39:12', '', 1),
(62, '1', '', '0604', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:39:12', '2018-12-06 18:39:12', '', 1),
(63, '1', '', '0605', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 4, 1, 0, '2018-12-06 18:39:13', '2018-12-06 18:39:13', '', 1),
(65, '1', '', '0607', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 6, 1, 0, '2018-12-06 18:39:13', '2018-12-06 18:39:13', '', 1),
(67, '1', '', '0609', '', '', '', '', '', 999999, 6, NULL, 0, 1, '18.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 8, 1, 0, '2018-12-06 18:39:13', '2018-12-06 18:39:13', '', 1),
(220, '1', '', '1101up', '', '', '', '', '', 999999, 6, NULL, 0, 1, '3.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, 0, '2018-12-06 18:39:16', '2018-12-06 18:39:16', '', 1),
(128, '1', '', 'open', '', '', '', '', '', 999999, 6, NULL, 0, 1, '0.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 1, 1, 0, '2018-12-06 18:39:17', '2018-12-06 18:39:17', '', 1),
(137, '1', '', '1102', '', '', '', '', '', 999999, 6, NULL, 0, 1, '3.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 2, 1, 0, '2018-12-06 18:39:17', '2018-12-06 18:39:17', '少', 1),
(143, '1', '', '1103', '', '', '', '', '', 999999, 6, NULL, 0, 1, '0.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:39:17', '2018-12-06 18:39:17', '', 1),
(169, '1', '', '1104', '', '', '', '', '', 999999, 6, NULL, 0, 1, '0.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 4, 1, 0, '2018-12-06 18:39:17', '2018-12-06 18:39:17', '', 1),
(186, '1', '', '1105', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 5, 1, 0, '2018-12-06 18:39:17', '2018-12-06 18:39:17', '', 1),
(187, '1', '', '1106', '', '', '', '', '', 999999, 6, NULL, 0, 1, '0.5000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 6, 1, 0, '2018-12-06 18:39:17', '2018-12-06 18:39:17', '', 1),
(207, '1', '', '1107', '', '', '', '', '', 999999, 6, NULL, 0, 1, '30.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 7, 1, 0, '2018-12-06 18:39:17', '2018-12-06 18:39:17', '', 1),
(144, '1', '', '1203', '', '', '', '', '', 999999, 6, NULL, 0, 1, '1.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 1, 1, 0, '2018-12-06 18:39:20', '2018-12-06 18:39:20', '', 1),
(148, '1', '', '1204', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 2, 1, 0, '2018-12-06 18:39:21', '2018-12-06 18:39:21', '', 1),
(149, '1', '', '1205', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:39:21', '2018-12-06 18:39:21', '', 1),
(193, '1', '', '1206', '', '', '', '', '', 999999, 6, NULL, 0, 1, '6.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 4, 1, 0, '2018-12-06 18:39:21', '2018-12-06 18:39:21', '', 1),
(270, '1', '', '1207', '', '', '', '', '', 999999, 6, NULL, 0, 1, '5.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 5, 1, 0, '2018-12-06 18:39:21', '2018-12-06 18:39:21', '', 1),
(330, '1', '', '06', '', '', '', '', '', 999999, 6, NULL, 0, 1, '7.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 6, 1, 0, '2018-12-06 18:39:21', '2018-12-06 18:39:21', '', 1),
(200, '1', '', '0413', '', '', '', '', '', 999999, 6, NULL, 0, 1, '248.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 0, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(201, '1', '', '0414', '', '', '', '', '', 999999, 6, NULL, 0, 1, '188.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 1, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(202, '1', '', '0415', '', '', '', '', '', 999999, 6, NULL, 0, 1, '188.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 2, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(205, '1', '', '0416', '', '', '', '', '', 999999, 6, NULL, 0, 1, '28.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 3, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(208, '1', '', '0417', '', '', '', '', '', 999999, 6, NULL, 0, 1, '58.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 4, -1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(212, '1', '', '0418', '', '', '', '', '', 999999, 6, NULL, 0, 1, '168.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 5, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(213, '1', '', '0419', '', '', '', '', '', 999999, 6, NULL, 0, 1, '108.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 6, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(267, '1', '', '0421', '', '', '', '', '', 999999, 6, NULL, 0, 1, '98.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 7, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(41, '1', '', '0410', '', '', '', '', '', 999999, 6, NULL, 0, 1, '34.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 8, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 1),
(297, '1', '', '0424', '', '', '', '', '', 999999, 6, NULL, 0, 1, '198.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 10, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(279, '1', '', '0423', '', '', '', '', '', 999999, 6, NULL, 0, 1, '158.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 11, 1, 0, '2018-12-06 18:39:26', '2018-12-06 18:39:26', '', 0),
(210, '1', '', '0311', '', '', '', '', '', 999999, 6, NULL, 0, 1, '16.8000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 12, 1, 0, '2018-12-06 18:39:27', '2018-12-06 18:39:27', '', 1),
(203, '1', '', '0312', '', '', '', '', '', 999999, 6, NULL, 0, 1, '29.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 13, 1, 0, '2018-12-06 18:39:27', '2018-12-06 18:39:27', '', 1),
(214, '1', '', '0420', '', '', '', '', '', 999999, 6, NULL, 0, 1, '40.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 14, 1, 0, '2018-12-06 18:39:27', '2018-12-06 18:39:27', '', 0),
(268, '1', '', '0422', '', '', '', '', '', 999999, 6, NULL, 0, 1, '0.0000', 0, 11, '0000-00-00', '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 1, 1, 15, 1, 0, '2018-12-06 18:39:27', '2018-12-06 18:39:27', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_add_type`
--

CREATE TABLE `oc_product_add_type` (
  `add_type_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checkbox` tinyint(1) NOT NULL DEFAULT '0',
  `name_2` varchar(255) NOT NULL,
  `name_3` varchar(255) NOT NULL,
  `name_4` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_add_type`
--

INSERT INTO `oc_product_add_type` (`add_type_id`, `name`, `type`, `required`, `checkbox`, `name_2`, `name_3`, `name_4`) VALUES
(9998, 'Option', 1, 0, 1, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `name_2` varchar(255) NOT NULL,
  `name_3` varchar(255) NOT NULL,
  `name_4` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `name_2`, `name_3`, `name_4`) VALUES
(10, 1, '番茄牛尾+麻辣', '', '', ' ', ' ', ' ', '', '', ''),
(10, 2, 'Oxtail Tomato + Spicy Soup', '', '', ' ', ' ', ' ', '', '', ''),
(4, 1, '番茄牛尾锅', '', '', ' ', ' ', ' ', '', '', ''),
(4, 2, 'Oxtail Tomato Soup', '', '', ' ', ' ', ' ', '', '', ''),
(11, 1, '药膳鸡+麻辣', '', '', ' ', ' ', ' ', '', '', ''),
(11, 2, 'Chicken Soup + Spicy Soup', '', '', ' ', ' ', ' ', '', '', ''),
(6, 1, '药膳土鸡锅', '', '', ' ', ' ', ' ', '', '', ''),
(6, 2, 'Chicken Soup', '', '', ' ', ' ', ' ', '', '', ''),
(7, 1, '酸菜鱼片锅', '', '', ' ', ' ', ' ', '', '', ''),
(7, 2, 'Pickled Fish Soup', '', '', ' ', ' ', ' ', '', '', ''),
(138, 1, '酸菜鱼+麻辣', '', '', ' ', ' ', ' ', '', '', ''),
(138, 2, 'Pickled Fish Soup + Spicy Soup', '', '', ' ', ' ', ' ', '', '', ''),
(178, 1, '番茄牛尾+酸菜鱼', '', '', ' ', ' ', ' ', '', '', ''),
(178, 2, 'Oxtail Tomato +Pickled Fish Soup', '', '', ' ', ' ', ' ', '', '', ''),
(5, 1, '鲍鱼土鸡锅', '', '', ' ', ' ', ' ', '', '', ''),
(5, 2, 'Abalone + Chicken Soup', '', '', ' ', ' ', ' ', '', '', ''),
(139, 1, '番茄牛尾+菌汤', '', '', ' ', ' ', ' ', '', '', ''),
(139, 2, 'Oxtail Tomato Soup + Mushroom Soup', '', '', ' ', ' ', ' ', '', '', ''),
(185, 1, '全素锅', '', '', ' ', ' ', ' ', '', '', ''),
(185, 2, 'Vegetarian Soup', '', '', ' ', ' ', ' ', '', '', ''),
(140, 1, '药膳鸡+菌汤', '', '', ' ', ' ', ' ', '', '', ''),
(140, 2, 'Chicken Soup + Mushroom Soup', '', '', ' ', ' ', ' ', '', '', ''),
(286, 1, '招牌青麻椒锅', '', '', ' ', ' ', ' ', '', '', ''),
(286, 2, 'Green Pepper Soup', '', '', ' ', ' ', ' ', '', '', ''),
(287, 1, '青椒+菌汤', '', '', ' ', ' ', ' ', '', '', ''),
(287, 2, 'Green Pepper & Mushroom Soup', '', '', ' ', ' ', ' ', '', '', ''),
(17, 1, '火鍋料組合', '', '', ' ', ' ', ' ', '', '', ''),
(17, 2, 'QQ Ball Combo', '', '', ' ', ' ', ' ', '', '', ''),
(18, 1, '特製魚糕', '', '', ' ', ' ', ' ', '', '', ''),
(18, 2, 'Fish Meatball', '', '', ' ', ' ', ' ', '', '', ''),
(19, 1, '蘇式牛肉丸', '', '', ' ', ' ', ' ', '', '', ''),
(19, 2, 'Prawn Meatball', '', '', ' ', ' ', ' ', '', '', ''),
(21, 1, '蛋餃', '', '', ' ', ' ', ' ', '', '', ''),
(21, 2, 'Egg Dumpling', '', '', ' ', ' ', ' ', '', '', ''),
(23, 1, '双味糕組合', '', '', ' ', ' ', ' ', '', '', ''),
(23, 2, 'Meatcakes Combo', '', '', ' ', ' ', ' ', '', '', ''),
(135, 1, '鱼包蛋', '', '', ' ', ' ', ' ', '', '', ''),
(135, 2, 'Fish Ball', '', '', ' ', ' ', ' ', '', '', ''),
(51, 1, '魚豆腐', '', '', ' ', ' ', ' ', '', '', ''),
(51, 2, 'Fish Tofu', '', '', ' ', ' ', ' ', '', '', ''),
(166, 1, '福袋', '', '', ' ', ' ', ' ', '', '', ''),
(166, 2, 'Luck Bag', '', '', ' ', ' ', ' ', '', '', ''),
(299, 1, '开花牛筋丸', '', '', ' ', ' ', ' ', '', '', ''),
(299, 2, 'Beef Meatball', '', '', ' ', ' ', ' ', '', '', ''),
(300, 1, '海苔墨鱼丸', '', '', ' ', ' ', ' ', '', '', ''),
(300, 2, 'Seaweed Cuttlefish Ball', '', '', ' ', ' ', ' ', '', '', ''),
(24, 1, '手切M8和牛 ', '', '', ' ', ' ', ' ', '', '', ''),
(24, 2, 'M9 Wagyu Short Ribs', '', '', ' ', ' ', ' ', '', '', ''),
(26, 1, '五花肉 ', '', '', ' ', ' ', ' ', '', '', ''),
(26, 2, 'Pork Belly Slice', '', '', ' ', ' ', ' ', '', '', ''),
(38, 1, '青口貝', '', '', ' ', ' ', ' ', '', '', ''),
(38, 2, 'Mussels', '', '', ' ', ' ', ' ', '', '', ''),
(301, 1, '玉鲈（活鱼）', '', '', ' ', ' ', ' ', '', '', ''),
(301, 2, 'Medium Star Grouper', '', '', ' ', ' ', ' ', '', '', ''),
(56, 1, '豬紅', '', '', ' ', ' ', ' ', '', '', ''),
(56, 2, 'Pork Blood Jelly', '', '', ' ', ' ', ' ', '', '', ''),
(145, 1, '魔芋丝', '', '', ' ', ' ', ' ', '', '', ''),
(145, 2, 'High Fibre Thread', '', '', ' ', ' ', ' ', '', '', ''),
(190, 1, '嫩鸭血', '', '', ' ', ' ', ' ', '', '', ''),
(190, 2, 'Duck Blood Jelly', '', '', ' ', ' ', ' ', '', '', ''),
(189, 1, '黃喉', '', '', ' ', ' ', ' ', '', '', ''),
(189, 2, 'Board Muscle', '', '', ' ', ' ', ' ', '', '', ''),
(198, 1, '脆鸭肠', '', '', ' ', ' ', ' ', '', '', ''),
(198, 2, 'Duck Intestines', '', '', ' ', ' ', ' ', '', '', ''),
(206, 1, '脑花', '', '', ' ', ' ', ' ', '', '', ''),
(206, 2, 'Porcine Brains', '', '', ' ', ' ', ' ', '', '', ''),
(285, 1, '极品鲜毛肚', '', '', ' ', ' ', ' ', '', '', ''),
(285, 2, 'Beef Omasum', '', '', ' ', ' ', ' ', '', '', ''),
(305, 1, '鲜鸭血', '', '', ' ', ' ', ' ', '', '', ''),
(305, 2, 'Duck Blood', '', '', ' ', ' ', ' ', '', '', ''),
(98, 1, '家鄉酥肉 ', '', '', ' ', ' ', ' ', '', '', ''),
(98, 2, 'Fried Pork', '', '', ' ', ' ', ' ', '', '', ''),
(99, 1, '涼麵', '', '', ' ', ' ', ' ', '', '', ''),
(99, 2, 'Cold Noodle With Chiil Sauce', '', '', ' ', ' ', ' ', '', '', ''),
(131, 1, '酸辣粉', '', '', ' ', ' ', ' ', '', '', ''),
(131, 2, 'Hot Sour Rice Noodle', '', '', ' ', ' ', ' ', '', '', ''),
(156, 1, '葱油饼', '', '', ' ', ' ', ' ', '', '', ''),
(156, 2, 'Scallion Pancake', '', '', ' ', ' ', ' ', '', '', ''),
(154, 1, '枸杞银耳羹', '', '', ' ', ' ', ' ', '', '', ''),
(154, 2, 'Wlofberry Tremella Soup', '', '', ' ', ' ', ' ', '', '', ''),
(157, 1, '炼乳小馒头', '', '', ' ', ' ', ' ', '', '', ''),
(157, 2, 'Whipped Fried Buns', '', '', ' ', ' ', ' ', '', '', ''),
(101, 1, '香烤鸭脖', '', '', ' ', ' ', ' ', '', '', ''),
(101, 2, 'Roast Duck Neck', '', '', ' ', ' ', ' ', '', '', ''),
(296, 1, '冰粉', '', '', ' ', ' ', ' ', '', '', ''),
(296, 2, 'Ice Jelly', '', '', ' ', ' ', ' ', '', '', ''),
(312, 1, '红糖糍粑', '', '', ' ', ' ', ' ', '', '', ''),
(312, 2, 'brown sugar cake', '', '', ' ', ' ', ' ', '', '', ''),
(329, 1, '双味糯米凉糕', '', '', ' ', ' ', ' ', '', '', ''),
(329, 2, 'Ice cake', '', '', ' ', ' ', ' ', '', '', ''),
(68, 1, '凍豆腐', '', '', ' ', ' ', ' ', '', '', ''),
(68, 2, 'Frozen Tofu', '', '', ' ', ' ', ' ', '', '', ''),
(69, 1, '油麵筋', '', '', ' ', ' ', ' ', '', '', ''),
(69, 2, 'Oil Gluten Ball', '', '', ' ', ' ', ' ', '', '', ''),
(70, 1, '油豆腐', '', '', ' ', ' ', ' ', '', '', ''),
(70, 2, 'Fried Tofu', '', '', ' ', ' ', ' ', '', '', ''),
(71, 1, '粉丝', '', '', ' ', ' ', ' ', '', '', ''),
(71, 2, 'Rice Vermicelli', '', '', ' ', ' ', ' ', '', '', ''),
(72, 1, '鲜豆腐', '', '', ' ', ' ', ' ', '', '', ''),
(72, 2, 'Fresh Tofu', '', '', ' ', ' ', ' ', '', '', ''),
(75, 1, '豆腐皮', '', '', ' ', ' ', ' ', '', '', ''),
(75, 2, 'Bean Curd Shin', '', '', ' ', ' ', ' ', '', '', ''),
(77, 1, '年糕', '', '', ' ', ' ', ' ', '', '', ''),
(77, 2, 'Rice Cakes', '', '', ' ', ' ', ' ', '', '', ''),
(79, 1, '土豆', '', '', ' ', ' ', ' ', '', '', ''),
(79, 2, 'Potato', '', '', ' ', ' ', ' ', '', '', ''),
(81, 1, '藕片', '', '', ' ', ' ', ' ', '', '', ''),
(81, 2, 'Fresh Lotus Root', '', '', ' ', ' ', ' ', '', '', ''),
(82, 1, '白蘿蔔', '', '', ' ', ' ', ' ', '', '', ''),
(82, 2, 'White Radish', '', '', ' ', ' ', ' ', '', '', ''),
(83, 1, '黄瓜', '', '', ' ', ' ', ' ', '', '', ''),
(83, 2, 'Cucumber Slice', '', '', ' ', ' ', ' ', '', '', ''),
(86, 1, '南瓜', '', '', ' ', ' ', ' ', '', '', ''),
(86, 2, 'Pumpkin', '', '', ' ', ' ', ' ', '', '', ''),
(87, 1, '嫩白菜', '', '', ' ', ' ', ' ', '', '', ''),
(87, 2, 'Chinese Cabbage', '', '', ' ', ' ', ' ', '', '', ''),
(88, 1, '菠菜', '', '', ' ', ' ', ' ', '', '', ''),
(88, 2, 'Spinach', '', '', ' ', ' ', ' ', '', '', ''),
(90, 1, '上海青菜', '', '', ' ', ' ', ' ', '', '', ''),
(90, 2, 'Pork Choy', '', '', ' ', ' ', ' ', '', '', ''),
(92, 1, '白花菜', '', '', ' ', ' ', ' ', '', '', ''),
(92, 2, 'Cauliflower', '', '', ' ', ' ', ' ', '', '', ''),
(93, 1, '番茄', '', '', ' ', ' ', ' ', '', '', ''),
(93, 2, 'Tomato Slice', '', '', ' ', ' ', ' ', '', '', ''),
(94, 1, '生菜', '', '', ' ', ' ', ' ', '', '', ''),
(94, 2, 'Lettuce', '', '', ' ', ' ', ' ', '', '', ''),
(180, 1, '红薯', '', '', ' ', ' ', ' ', '', '', ''),
(180, 2, 'Sweet Potato', '', '', ' ', ' ', ' ', '', '', ''),
(96, 1, '粉豆拼盆', '', '', ' ', ' ', ' ', '', '', ''),
(96, 2, 'Tofu Noodle Combo', '', '', ' ', ' ', ' ', '', '', ''),
(97, 1, '蔬菜拼盆', '', '', ' ', ' ', ' ', '', '', ''),
(97, 2, 'Vegetable Combo', '', '', ' ', ' ', ' ', '', '', ''),
(304, 1, '炸腐皮', '', '', ' ', ' ', ' ', '', '', ''),
(304, 2, 'fried bean curd skin', '', '', ' ', ' ', ' ', '', '', ''),
(109, 1, 'VB', '', '', ' ', ' ', ' ', '', '', ''),
(109, 2, 'Taiwanese Beer', '', '', ' ', ' ', ' ', '', '', ''),
(110, 1, '青島', '', '', ' ', ' ', ' ', '', '', ''),
(110, 2, 'Tsingtao', '', '', ' ', ' ', ' ', '', '', ''),
(111, 1, 'Corona', '', '', ' ', ' ', ' ', '', '', ''),
(111, 2, 'Corona', '', '', ' ', ' ', ' ', '', '', ''),
(112, 1, 'Sapporo', '', '', ' ', ' ', ' ', '', '', ''),
(112, 2, 'Sapporo', '', '', ' ', ' ', ' ', '', '', ''),
(113, 1, '酸梅湯（紮Jug）', '', '', ' ', ' ', ' ', '', '', ''),
(113, 2, 'Plum Juice Jug', '', '', ' ', ' ', ' ', '', '', ''),
(114, 1, '酸梅汤 （瓶装）', '', '', ' ', ' ', ' ', '', '', ''),
(114, 2, 'Plum Juice Bottle', '', '', ' ', ' ', ' ', '', '', ''),
(115, 1, '加多寶涼茶', '', '', ' ', ' ', ' ', '', '', ''),
(115, 2, 'Herbal Tea', '', '', ' ', ' ', ' ', '', '', ''),
(192, 1, '西瓜汁（紮）', '', '', ' ', ' ', ' ', '', '', ''),
(192, 2, 'Watermelon Juice Jug', '', '', ' ', ' ', ' ', '', '', ''),
(117, 1, '鮮榨西瓜汁（杯）', '', '', ' ', ' ', ' ', '', '', ''),
(117, 2, 'Watermelon Juice', '', '', ' ', ' ', ' ', '', '', ''),
(119, 1, '冰豆奶 （有糖）', '', '', ' ', ' ', ' ', '', '', ''),
(119, 2, 'Soymilk', '', '', ' ', ' ', ' ', '', '', ''),
(118, 1, '豆奶（無糖）', '', '', ' ', ' ', ' ', '', '', ''),
(118, 2, 'Soymilk Sugar Free', '', '', ' ', ' ', ' ', '', '', ''),
(172, 1, '可樂瓶裝', '', '', ' ', ' ', ' ', '', '', ''),
(172, 2, 'Coke Bottled', '', '', ' ', ' ', ' ', '', '', ''),
(173, 1, '雪碧瓶裝', '', '', ' ', ' ', ' ', '', '', ''),
(173, 2, 'Sprite Bottled', '', '', ' ', ' ', ' ', '', '', ''),
(174, 1, '芬達瓶裝', '', '', ' ', ' ', ' ', '', '', ''),
(174, 2, 'Fanta Bottled', '', '', ' ', ' ', ' ', '', '', ''),
(176, 1, '可樂No sugar瓶裝', '', '', ' ', ' ', ' ', '', '', ''),
(176, 2, 'Coke No Sugar Bottled', '', '', ' ', ' ', ' ', '', '', ''),
(121, 1, '礦泉水', '', '', ' ', ' ', ' ', '', '', ''),
(121, 2, 'Still Water', '', '', ' ', ' ', ' ', '', '', ''),
(120, 1, '氣泡水', '', '', ' ', ' ', ' ', '', '', ''),
(120, 2, 'Sparkling Water', '', '', ' ', ' ', ' ', '', '', ''),
(122, 1, '菊花茶（現泡）', '', '', ' ', ' ', ' ', '', '', ''),
(122, 2, 'Chrysanthemum Tea', '', '', ' ', ' ', ' ', '', '', ''),
(123, 1, '大麥茶（現泡）', '', '', ' ', ' ', ' ', '', '', ''),
(123, 2, 'Barley Tea', '', '', ' ', ' ', ' ', '', '', ''),
(280, 1, 'SHIRAZ', '', '', ' ', ' ', ' ', '', '', ''),
(280, 2, 'Peach Soju', '', '', ' ', ' ', ' ', '', '', ''),
(322, 1, '铁观音(2F)', '', '', ' ', ' ', ' ', '', '', ''),
(322, 2, 'Tie Guan Yin', '', '', ' ', ' ', ' ', '', '', ''),
(281, 1, 'CABERNET', '', '', ' ', ' ', ' ', '', '', ''),
(281, 2, 'Original Soju', '', '', ' ', ' ', ' ', '', '', ''),
(59, 1, '金针菇', '', '', ' ', ' ', ' ', '', '', ''),
(59, 2, 'Enoki Mushroom', '', '', ' ', ' ', ' ', '', '', ''),
(60, 1, '鲍鱼菇', '', '', ' ', ' ', ' ', '', '', ''),
(60, 2, 'Oyster Mushroom', '', '', ' ', ' ', ' ', '', '', ''),
(62, 1, '珊瑚菇', '', '', ' ', ' ', ' ', '', '', ''),
(62, 2, 'Shimeji Mushroom', '', '', ' ', ' ', ' ', '', '', ''),
(63, 1, '鲜香菇', '', '', ' ', ' ', ' ', '', '', ''),
(63, 2, 'Shii-take', '', '', ' ', ' ', ' ', '', '', ''),
(65, 1, '春笋', '', '', ' ', ' ', ' ', '', '', ''),
(65, 2, 'Spring Bamboo Shoots', '', '', ' ', ' ', ' ', '', '', ''),
(67, 1, '山珍拼盤', '', '', ' ', ' ', ' ', '', '', ''),
(67, 2, 'Mushroom Combo', '', '', ' ', ' ', ' ', '', '', ''),
(220, 1, '调料', '', '', ' ', ' ', ' ', '', '', ''),
(220, 2, 'Sauce', '', '', ' ', ' ', ' ', '', '', ''),
(128, 1, 'Open Item', '', '', ' ', ' ', ' ', '', '', ''),
(128, 2, 'Open Item', '', '', ' ', ' ', ' ', '', '', ''),
(137, 1, 'BYO($3)', '', '', ' ', ' ', ' ', '', '', ''),
(137, 2, 'BYO($3)', '', '', ' ', ' ', ' ', '', '', ''),
(143, 1, '加工費', '', '', ' ', ' ', ' ', '', '', ''),
(143, 2, 'Service Fee', '', '', ' ', ' ', ' ', '', '', ''),
(169, 1, 'Surcharge', '', '', ' ', ' ', ' ', '', '', ''),
(169, 2, 'Surcharge', '', '', ' ', ' ', ' ', '', '', ''),
(186, 1, '共鍋費', '', '', ' ', ' ', ' ', '', '', ''),
(186, 2, 'Share Fee', '', '', ' ', ' ', ' ', '', '', ''),
(187, 1, '打包盒', '', '', ' ', ' ', ' ', '', '', ''),
(187, 2, 'Take Away Box', '', '', ' ', ' ', ' ', '', '', ''),
(207, 1, 'BYO（WINE）', '', '', ' ', ' ', ' ', '', '', ''),
(207, 2, 'BYO（WINE）', '', '', ' ', ' ', ' ', '', '', ''),
(144, 1, '生雞蛋', '', '', ' ', ' ', ' ', '', '', ''),
(144, 2, 'Egg', '', '', ' ', ' ', ' ', '', '', ''),
(148, 1, '鲜虾猪肉水餃', '', '', ' ', ' ', ' ', '', '', ''),
(148, 2, 'Prawn Pork Dumplings', '', '', ' ', ' ', ' ', '', '', ''),
(149, 1, '韭菜豬肉水餃', '', '', ' ', ' ', ' ', '', '', ''),
(149, 2, 'Chive Pork Dumpling', '', '', ' ', ' ', ' ', '', '', ''),
(193, 1, '乌冬面', '', '', ' ', ' ', ' ', '', '', ''),
(193, 2, 'Udon Noodle', '', '', ' ', ' ', ' ', '', '', ''),
(270, 1, '白面', '', '', ' ', ' ', ' ', '', '', ''),
(270, 2, 'White Noodle', '', '', ' ', ' ', ' ', '', '', ''),
(330, 1, '手工鲜虾小馄饨', '', '', ' ', ' ', ' ', '', '', ''),
(330, 2, '手工鲜虾小馄饨', '', '', ' ', ' ', ' ', '', '', ''),
(200, 1, '龙虾', '', '', ' ', ' ', ' ', '', '', ''),
(200, 2, 'Lobster', '', '', ' ', ' ', ' ', '', '', ''),
(201, 1, '大鲍鱼', '', '', ' ', ' ', ' ', '', '', ''),
(201, 2, 'Abalone', '', '', ' ', ' ', ' ', '', '', ''),
(202, 1, '东星斑', '', '', ' ', ' ', ' ', '', '', ''),
(202, 2, 'Large Star Grouper', '', '', ' ', ' ', ' ', '', '', ''),
(205, 1, '玉鲈', '', '', ' ', ' ', ' ', '', '', ''),
(205, 2, 'Live Jade Perch', '', '', ' ', ' ', ' ', '', '', ''),
(208, 1, '白鳝', '', '', ' ', ' ', ' ', '', '', ''),
(208, 2, 'Flower Eel', '', '', ' ', ' ', ' ', '', '', ''),
(212, 1, '雪蟹', '', '', ' ', ' ', ' ', '', '', ''),
(212, 2, 'Live Crystal Crab', '', '', ' ', ' ', ' ', '', '', ''),
(213, 1, '膏蟹', '', '', ' ', ' ', ' ', '', '', ''),
(213, 2, 'Live Mud Crab', '', '', ' ', ' ', ' ', '', '', ''),
(267, 1, '黄螺', '', '', ' ', ' ', ' ', '', '', ''),
(267, 2, 'Yellow Spiral Shell', '', '', ' ', ' ', ' ', '', '', ''),
(41, 1, '鮑魚仔', '', '', ' ', ' ', ' ', '', '', ''),
(41, 2, 'Baby Abalone', '', '', ' ', ' ', ' ', '', '', ''),
(297, 1, '青边鲍', '', '', ' ', ' ', ' ', '', '', ''),
(297, 2, 'Green side abalone', '', '', ' ', ' ', ' ', '', '', ''),
(279, 1, '游水虾', '', '', ' ', ' ', ' ', '', '', ''),
(279, 2, 'Live Prawn', '', '', ' ', ' ', ' ', '', '', ''),
(210, 1, '海苔墨鱼球', '', '', ' ', ' ', ' ', '', '', ''),
(210, 2, 'Seaweed Cuttlefish Ball', '', '', ' ', ' ', ' ', '', '', ''),
(203, 1, '玫瑰松阪肉', '', '', ' ', ' ', ' ', '', '', ''),
(203, 2, 'Matsuzaka Meat Slices', '', '', ' ', ' ', ' ', '', '', ''),
(214, 1, '醉虾', '', '', ' ', ' ', ' ', '', '', ''),
(214, 2, 'Inebriate Shrimp', '', '', ' ', ' ', ' ', '', '', ''),
(268, 1, '麻辣小龙虾', '', '', ' ', ' ', ' ', '', '', ''),
(268, 2, 'Spicy Little Lobster', '', '', ' ', ' ', ' ', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_ext`
--

CREATE TABLE `oc_product_ext` (
  `product_ext_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `name_2` varchar(255) NOT NULL,
  `name_3` varchar(255) NOT NULL,
  `name_4` varchar(255) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_ext`
--

INSERT INTO `oc_product_ext` (`product_ext_id`, `product_id`, `type`, `name`, `price`, `name_2`, `name_3`, `name_4`, `barcode`) VALUES
(10195, 10, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(10328, 10, 9998, '走牛尾', '0.00', '', '', '', 'E29'),
(4195, 4, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(4328, 4, 9998, '走牛尾', '0.00', '', '', '', 'E29'),
(11195, 11, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(6195, 6, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(7195, 7, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(138195, 138, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(178195, 178, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(178328, 178, 9998, '走牛尾', '0.00', '', '', '', 'E29'),
(5195, 5, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(139195, 139, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(139328, 139, 9998, '走牛尾', '0.00', '', '', '', 'E29'),
(185195, 185, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(140195, 140, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(286195, 286, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(287195, 287, 9998, '走鱼片', '0.00', 'No Fish', '', '', 'E15'),
(98163, 98, 9998, '后', '0.00', '', '', '', 'E12'),
(98162, 98, 9998, '先', '0.00', '', '', '', 'E11'),
(99163, 99, 9998, '后', '0.00', '', '', '', 'E12'),
(99162, 99, 9998, '先', '0.00', '', '', '', 'E11'),
(131163, 131, 9998, '后', '0.00', '', '', '', 'E12'),
(131162, 131, 9998, '先', '0.00', '', '', '', 'E11'),
(156163, 156, 9998, '后', '0.00', '', '', '', 'E12'),
(156162, 156, 9998, '先', '0.00', '', '', '', 'E11'),
(154163, 154, 9998, '后', '0.00', '', '', '', 'E12'),
(154162, 154, 9998, '先', '0.00', '', '', '', 'E11'),
(157197, 157, 9998, '蒸', '0.00', '', '', '', '0812-2'),
(157196, 157, 9998, '炼乳分开', '0.00', '', '', '', '0812-1'),
(157163, 157, 9998, '后', '0.00', '', '', '', 'E12'),
(101163, 101, 9998, '后', '0.00', '', '', '', 'E12'),
(101162, 101, 9998, '先', '0.00', '', '', '', 'E11'),
(296163, 296, 9998, '后', '0.00', '', '', '', 'E12'),
(296162, 296, 9998, '先', '0.00', '', '', '', 'E11'),
(312163, 312, 9998, '后', '0.00', '', '', '', 'E12'),
(312162, 312, 9998, '先', '0.00', '', '', '', 'E11'),
(329163, 329, 9998, '后', '0.00', '', '', '', 'E12'),
(329162, 329, 9998, '先', '0.00', '', '', '', 'E11'),
(109277, 109, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(109276, 109, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(109275, 109, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(109274, 109, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(110277, 110, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(110276, 110, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(110275, 110, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(110274, 110, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(111177, 111, 9998, '常温', '0.00', '', '', '', 'E13'),
(111161, 111, 9998, '冷', '0.00', '', '', '', 'E10'),
(111160, 111, 9998, '热', '0.00', '', '', '', 'E09'),
(112277, 112, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(112276, 112, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(112275, 112, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(112274, 112, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(113277, 113, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(113276, 113, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(113275, 113, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(113274, 113, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(114277, 114, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(114276, 114, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(114275, 114, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(114274, 114, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(115277, 115, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(115276, 115, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(115275, 115, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(115274, 115, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(192277, 192, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(192276, 192, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(192275, 192, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(192274, 192, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(117277, 117, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(117276, 117, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(117275, 117, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(117274, 117, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(119277, 119, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(119276, 119, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(119275, 119, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(119274, 119, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(118277, 118, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(118276, 118, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(118275, 118, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(118274, 118, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(172277, 172, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(172276, 172, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(172275, 172, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(172274, 172, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(173277, 173, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(173276, 173, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(173275, 173, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(173274, 173, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(174277, 174, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(174276, 174, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(174275, 174, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(174274, 174, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(176277, 176, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(176276, 176, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(176275, 176, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(176274, 176, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(121277, 121, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(121276, 121, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(121275, 121, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(121274, 121, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(120277, 120, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(120276, 120, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(120275, 120, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(120274, 120, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(122277, 122, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(122276, 122, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(122275, 122, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(122274, 122, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(123277, 123, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(123276, 123, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(123275, 123, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(123274, 123, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(280327, 280, 9998, 'Handpicked', '0.00', '', '', '', 'E28'),
(322277, 322, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(322276, 322, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(322275, 322, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(322274, 322, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(281277, 281, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(281276, 281, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(281275, 281, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(281274, 281, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(137278, 137, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(137277, 137, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(137276, 137, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(137275, 137, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(207278, 207, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(207277, 207, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(207276, 207, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(207275, 207, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(144277, 144, 9998, '西瓜味', '0.00', '', '', '', 'E19'),
(144276, 144, 9998, '草莓味', '0.00', '', '', '', 'E18'),
(144275, 144, 9998, '梨子味', '0.00', '', '', '', 'E17'),
(144274, 144, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(148163, 148, 9998, '后', '0.00', '', '', '', 'E12'),
(148162, 148, 9998, '先', '0.00', '', '', '', 'E11'),
(149163, 149, 9998, '后', '0.00', '', '', '', 'E12'),
(149162, 149, 9998, '先', '0.00', '', '', '', 'E11'),
(193163, 193, 9998, '后', '0.00', '', '', '', 'E12'),
(193162, 193, 9998, '先', '0.00', '', '', '', 'E11'),
(270163, 270, 9998, '后', '0.00', '', '', '', 'E12'),
(270162, 270, 9998, '先', '0.00', '', '', '', 'E11'),
(10194, 10, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(4194, 4, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(11108, 11, 9998, '特麻', '0.00', '', '', '', 'E06'),
(6108, 6, 9998, '特麻', '0.00', '', '', '', 'E06'),
(7108, 7, 9998, '特麻', '0.00', '', '', '', 'E06'),
(138108, 138, 9998, '特麻', '0.00', '', '', '', 'E06'),
(178194, 178, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(5108, 5, 9998, '特麻', '0.00', '', '', '', 'E06'),
(139194, 139, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(185108, 185, 9998, '特麻', '0.00', '', '', '', 'E06'),
(140108, 140, 9998, '特麻', '0.00', '', '', '', 'E06'),
(286108, 286, 9998, '特麻', '0.00', '', '', '', 'E06'),
(287108, 287, 9998, '特麻', '0.00', '', '', '', 'E06'),
(10108, 10, 9998, '特麻', '0.00', '', '', '', 'E06'),
(4108, 4, 9998, '特麻', '0.00', '', '', '', 'E06'),
(178108, 178, 9998, '特麻', '0.00', '', '', '', 'E06'),
(139108, 139, 9998, '特麻', '0.00', '', '', '', 'E06'),
(109177, 109, 9998, '常温', '0.00', '', '', '', 'E13'),
(109161, 109, 9998, '冷', '0.00', '', '', '', 'E10'),
(110177, 110, 9998, '常温', '0.00', '', '', '', 'E13'),
(110161, 110, 9998, '冷', '0.00', '', '', '', 'E10'),
(111147, 111, 9998, '少冰', '0.00', '', '', '', 'E08'),
(112177, 112, 9998, '常温', '0.00', '', '', '', 'E13'),
(112161, 112, 9998, '冷', '0.00', '', '', '', 'E10'),
(113177, 113, 9998, '常温', '0.00', '', '', '', 'E13'),
(113161, 113, 9998, '冷', '0.00', '', '', '', 'E10'),
(114177, 114, 9998, '常温', '0.00', '', '', '', 'E13'),
(114161, 114, 9998, '冷', '0.00', '', '', '', 'E10'),
(115177, 115, 9998, '常温', '0.00', '', '', '', 'E13'),
(115161, 115, 9998, '冷', '0.00', '', '', '', 'E10'),
(192177, 192, 9998, '常温', '0.00', '', '', '', 'E13'),
(192161, 192, 9998, '冷', '0.00', '', '', '', 'E10'),
(117177, 117, 9998, '常温', '0.00', '', '', '', 'E13'),
(117161, 117, 9998, '冷', '0.00', '', '', '', 'E10'),
(119177, 119, 9998, '常温', '0.00', '', '', '', 'E13'),
(119161, 119, 9998, '冷', '0.00', '', '', '', 'E10'),
(118177, 118, 9998, '常温', '0.00', '', '', '', 'E13'),
(118161, 118, 9998, '冷', '0.00', '', '', '', 'E10'),
(172177, 172, 9998, '常温', '0.00', '', '', '', 'E13'),
(172161, 172, 9998, '冷', '0.00', '', '', '', 'E10'),
(173177, 173, 9998, '常温', '0.00', '', '', '', 'E13'),
(173161, 173, 9998, '冷', '0.00', '', '', '', 'E10'),
(174177, 174, 9998, '常温', '0.00', '', '', '', 'E13'),
(174161, 174, 9998, '冷', '0.00', '', '', '', 'E10'),
(176177, 176, 9998, '常温', '0.00', '', '', '', 'E13'),
(176161, 176, 9998, '冷', '0.00', '', '', '', 'E10'),
(121177, 121, 9998, '常温', '0.00', '', '', '', 'E13'),
(121161, 121, 9998, '冷', '0.00', '', '', '', 'E10'),
(120177, 120, 9998, '常温', '0.00', '', '', '', 'E13'),
(120161, 120, 9998, '冷', '0.00', '', '', '', 'E10'),
(122177, 122, 9998, '常温', '0.00', '', '', '', 'E13'),
(122161, 122, 9998, '冷', '0.00', '', '', '', 'E10'),
(123177, 123, 9998, '常温', '0.00', '', '', '', 'E13'),
(123161, 123, 9998, '冷', '0.00', '', '', '', 'E10'),
(322177, 322, 9998, '常温', '0.00', '', '', '', 'E13'),
(322161, 322, 9998, '冷', '0.00', '', '', '', 'E10'),
(281177, 281, 9998, '常温', '0.00', '', '', '', 'E13'),
(281161, 281, 9998, '冷', '0.00', '', '', '', 'E10'),
(137274, 137, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(137177, 137, 9998, '常温', '0.00', '', '', '', 'E13'),
(207274, 207, 9998, '苹果味', '0.00', '', '', '', 'E16'),
(207177, 207, 9998, '常温', '0.00', '', '', '', 'E13'),
(144177, 144, 9998, '常温', '0.00', '', '', '', 'E13'),
(144161, 144, 9998, '冷', '0.00', '', '', '', 'E10'),
(10105, 10, 9998, '特辣', '0.00', '', '', '', 'E03'),
(4105, 4, 9998, '特辣', '0.00', '', '', '', 'E03'),
(11104, 11, 9998, '加麻', '0.00', '', '', '', 'E02'),
(6104, 6, 9998, '加麻', '0.00', '', '', '', 'E02'),
(7104, 7, 9998, '加麻', '0.00', '', '', '', 'E02'),
(138104, 138, 9998, '加麻', '0.00', '', '', '', 'E02'),
(178105, 178, 9998, '特辣', '0.00', '', '', '', 'E03'),
(5104, 5, 9998, '加麻', '0.00', '', '', '', 'E02'),
(139105, 139, 9998, '特辣', '0.00', '', '', '', 'E03'),
(185104, 185, 9998, '加麻', '0.00', '', '', '', 'E02'),
(140104, 140, 9998, '加麻', '0.00', '', '', '', 'E02'),
(286104, 286, 9998, '加麻', '0.00', '', '', '', 'E02'),
(287104, 287, 9998, '加麻', '0.00', '', '', '', 'E02'),
(10104, 10, 9998, '加麻', '0.00', '', '', '', 'E02'),
(4104, 4, 9998, '加麻', '0.00', '', '', '', 'E02'),
(11105, 11, 9998, '特辣', '0.00', '', '', '', 'E03'),
(6105, 6, 9998, '特辣', '0.00', '', '', '', 'E03'),
(7105, 7, 9998, '特辣', '0.00', '', '', '', 'E03'),
(138105, 138, 9998, '特辣', '0.00', '', '', '', 'E03'),
(178104, 178, 9998, '加麻', '0.00', '', '', '', 'E02'),
(5105, 5, 9998, '特辣', '0.00', '', '', '', 'E03'),
(139104, 139, 9998, '加麻', '0.00', '', '', '', 'E02'),
(185105, 185, 9998, '特辣', '0.00', '', '', '', 'E03'),
(140105, 140, 9998, '特辣', '0.00', '', '', '', 'E03'),
(286105, 286, 9998, '特辣', '0.00', '', '', '', 'E03'),
(287105, 287, 9998, '特辣', '0.00', '', '', '', 'E03'),
(10103, 10, 9998, '加辣', '0.00', '', '', '', 'E01'),
(4103, 4, 9998, '加辣', '0.00', '', '', '', 'E01'),
(11194, 11, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(11103, 11, 9998, '加辣', '0.00', '', '', '', 'E01'),
(6194, 6, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(6103, 6, 9998, '加辣', '0.00', '', '', '', 'E01'),
(7194, 7, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(7103, 7, 9998, '加辣', '0.00', '', '', '', 'E01'),
(138194, 138, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(138103, 138, 9998, '加辣', '0.00', '', '', '', 'E01'),
(178103, 178, 9998, '加辣', '0.00', '', '', '', 'E01'),
(5194, 5, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(5103, 5, 9998, '加辣', '0.00', '', '', '', 'E01'),
(139103, 139, 9998, '加辣', '0.00', '', '', '', 'E01'),
(185194, 185, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(185103, 185, 9998, '加辣', '0.00', '', '', '', 'E01'),
(140194, 140, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(140103, 140, 9998, '加辣', '0.00', '', '', '', 'E01'),
(286194, 286, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(286103, 286, 9998, '加辣', '0.00', '', '', '', 'E01'),
(287194, 287, 9998, '走葱', '0.00', 'No Shallot', '', '', 'E14'),
(287103, 287, 9998, '加辣', '0.00', '', '', '', 'E01'),
(98161, 98, 9998, '冷', '0.00', '', '', '', 'E10'),
(98160, 98, 9998, '热', '0.00', '', '', '', 'E09'),
(99161, 99, 9998, '冷', '0.00', '', '', '', 'E10'),
(99160, 99, 9998, '热', '0.00', '', '', '', 'E09'),
(131161, 131, 9998, '冷', '0.00', '', '', '', 'E10'),
(131160, 131, 9998, '热', '0.00', '', '', '', 'E09'),
(156161, 156, 9998, '冷', '0.00', '', '', '', 'E10'),
(156160, 156, 9998, '热', '0.00', '', '', '', 'E09'),
(154161, 154, 9998, '冷', '0.00', '', '', '', 'E10'),
(154160, 154, 9998, '热', '0.00', '', '', '', 'E09'),
(157162, 157, 9998, '先', '0.00', '', '', '', 'E11'),
(157161, 157, 9998, '冷', '0.00', '', '', '', 'E10'),
(157160, 157, 9998, '热', '0.00', '', '', '', 'E09'),
(101161, 101, 9998, '冷', '0.00', '', '', '', 'E10'),
(101160, 101, 9998, '热', '0.00', '', '', '', 'E09'),
(296161, 296, 9998, '冷', '0.00', '', '', '', 'E10'),
(296160, 296, 9998, '热', '0.00', '', '', '', 'E09'),
(312161, 312, 9998, '冷', '0.00', '', '', '', 'E10'),
(312160, 312, 9998, '热', '0.00', '', '', '', 'E09'),
(329161, 329, 9998, '冷', '0.00', '', '', '', 'E10'),
(329160, 329, 9998, '热', '0.00', '', '', '', 'E09'),
(109160, 109, 9998, '热', '0.00', '', '', '', 'E09'),
(109147, 109, 9998, '少冰', '0.00', '', '', '', 'E08'),
(109146, 109, 9998, '去冰', '0.00', '', '', '', 'E07'),
(110160, 110, 9998, '热', '0.00', '', '', '', 'E09'),
(110147, 110, 9998, '少冰', '0.00', '', '', '', 'E08'),
(110146, 110, 9998, '去冰', '0.00', '', '', '', 'E07'),
(111146, 111, 9998, '去冰', '0.00', '', '', '', 'E07'),
(112160, 112, 9998, '热', '0.00', '', '', '', 'E09'),
(112147, 112, 9998, '少冰', '0.00', '', '', '', 'E08'),
(112146, 112, 9998, '去冰', '0.00', '', '', '', 'E07'),
(113160, 113, 9998, '热', '0.00', '', '', '', 'E09'),
(113147, 113, 9998, '少冰', '0.00', '', '', '', 'E08'),
(113146, 113, 9998, '去冰', '0.00', '', '', '', 'E07'),
(114160, 114, 9998, '热', '0.00', '', '', '', 'E09'),
(114147, 114, 9998, '少冰', '0.00', '', '', '', 'E08'),
(114146, 114, 9998, '去冰', '0.00', '', '', '', 'E07'),
(115160, 115, 9998, '热', '0.00', '', '', '', 'E09'),
(115147, 115, 9998, '少冰', '0.00', '', '', '', 'E08'),
(115146, 115, 9998, '去冰', '0.00', '', '', '', 'E07'),
(192160, 192, 9998, '热', '0.00', '', '', '', 'E09'),
(192147, 192, 9998, '少冰', '0.00', '', '', '', 'E08'),
(192146, 192, 9998, '去冰', '0.00', '', '', '', 'E07'),
(117160, 117, 9998, '热', '0.00', '', '', '', 'E09'),
(117147, 117, 9998, '少冰', '0.00', '', '', '', 'E08'),
(117146, 117, 9998, '去冰', '0.00', '', '', '', 'E07'),
(119160, 119, 9998, '热', '0.00', '', '', '', 'E09'),
(119147, 119, 9998, '少冰', '0.00', '', '', '', 'E08'),
(119146, 119, 9998, '去冰', '0.00', '', '', '', 'E07'),
(118160, 118, 9998, '热', '0.00', '', '', '', 'E09'),
(118147, 118, 9998, '少冰', '0.00', '', '', '', 'E08'),
(118146, 118, 9998, '去冰', '0.00', '', '', '', 'E07'),
(172160, 172, 9998, '热', '0.00', '', '', '', 'E09'),
(172147, 172, 9998, '少冰', '0.00', '', '', '', 'E08'),
(172146, 172, 9998, '去冰', '0.00', '', '', '', 'E07'),
(173160, 173, 9998, '热', '0.00', '', '', '', 'E09'),
(173147, 173, 9998, '少冰', '0.00', '', '', '', 'E08'),
(173146, 173, 9998, '去冰', '0.00', '', '', '', 'E07'),
(174160, 174, 9998, '热', '0.00', '', '', '', 'E09'),
(174147, 174, 9998, '少冰', '0.00', '', '', '', 'E08'),
(174146, 174, 9998, '去冰', '0.00', '', '', '', 'E07'),
(176160, 176, 9998, '热', '0.00', '', '', '', 'E09'),
(176147, 176, 9998, '少冰', '0.00', '', '', '', 'E08'),
(176146, 176, 9998, '去冰', '0.00', '', '', '', 'E07'),
(121160, 121, 9998, '热', '0.00', '', '', '', 'E09'),
(121147, 121, 9998, '少冰', '0.00', '', '', '', 'E08'),
(121146, 121, 9998, '去冰', '0.00', '', '', '', 'E07'),
(120160, 120, 9998, '热', '0.00', '', '', '', 'E09'),
(120147, 120, 9998, '少冰', '0.00', '', '', '', 'E08'),
(120146, 120, 9998, '去冰', '0.00', '', '', '', 'E07'),
(122160, 122, 9998, '热', '0.00', '', '', '', 'E09'),
(122147, 122, 9998, '少冰', '0.00', '', '', '', 'E08'),
(122146, 122, 9998, '去冰', '0.00', '', '', '', 'E07'),
(123160, 123, 9998, '热', '0.00', '', '', '', 'E09'),
(123147, 123, 9998, '少冰', '0.00', '', '', '', 'E08'),
(123146, 123, 9998, '去冰', '0.00', '', '', '', 'E07'),
(280326, 280, 9998, 'W1912', '0.00', '', '', '', 'E27'),
(322160, 322, 9998, '热', '0.00', '', '', '', 'E09'),
(322147, 322, 9998, '少冰', '0.00', '', '', '', 'E08'),
(322146, 322, 9998, '去冰', '0.00', '', '', '', 'E07'),
(281160, 281, 9998, '热', '0.00', '', '', '', 'E09'),
(281147, 281, 9998, '少冰', '0.00', '', '', '', 'E08'),
(281146, 281, 9998, '去冰', '0.00', '', '', '', 'E07'),
(137161, 137, 9998, '冷', '0.00', '', '', '', 'E10'),
(137160, 137, 9998, '热', '0.00', '', '', '', 'E09'),
(137147, 137, 9998, '少冰', '0.00', '', '', '', 'E08'),
(207161, 207, 9998, '冷', '0.00', '', '', '', 'E10'),
(207160, 207, 9998, '热', '0.00', '', '', '', 'E09'),
(207147, 207, 9998, '少冰', '0.00', '', '', '', 'E08'),
(144160, 144, 9998, '热', '0.00', '', '', '', 'E09'),
(144147, 144, 9998, '少冰', '0.00', '', '', '', 'E08'),
(144146, 144, 9998, '去冰', '0.00', '', '', '', 'E07'),
(148161, 148, 9998, '冷', '0.00', '', '', '', 'E10'),
(148160, 148, 9998, '热', '0.00', '', '', '', 'E09'),
(149161, 149, 9998, '冷', '0.00', '', '', '', 'E10'),
(149160, 149, 9998, '热', '0.00', '', '', '', 'E09'),
(193161, 193, 9998, '冷', '0.00', '', '', '', 'E10'),
(193160, 193, 9998, '热', '0.00', '', '', '', 'E09'),
(270161, 270, 9998, '冷', '0.00', '', '', '', 'E10'),
(270160, 270, 9998, '热', '0.00', '', '', '', 'E09'),
(109278, 109, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(110278, 110, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(112278, 112, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(113278, 113, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(114278, 114, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(115278, 115, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(192278, 192, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(117278, 117, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(119278, 119, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(118278, 118, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(172278, 172, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(173278, 173, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(174278, 174, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(176278, 176, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(121278, 121, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(120278, 120, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(122278, 122, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(123278, 123, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(322278, 322, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(281278, 281, 9998, '菠萝味', '0.00', '', '', '', 'E20'),
(137146, 137, 9998, '去冰', '0.00', '', '', '', 'E07'),
(207146, 207, 9998, '去冰', '0.00', '', '', '', 'E07'),
(144278, 144, 9998, '菠萝味', '0.00', '', '', '', 'E20');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(1, 323, 1, '', 0),
(7, 1, 5, '', 0),
(4, 324, 1, '', 1),
(8, 325, 5, '', 0),
(6, 1, 4, '', 0),
(5, 325, 3, '', 0),
(10, 139, 5, '', 1),
(11, 326, 5, '', 0),
(12, 109, 5, '', 0),
(13, 110, 5, '', 0),
(14, 111, 5, '', 0),
(15, 112, 5, '', 0),
(16, 115, 5, '', 0),
(17, 117, 5, '', 0),
(18, 119, 5, '', 0),
(19, 118, 5, '', 0),
(20, 172, 5, '', 0),
(21, 173, 5, '', 0),
(22, 174, 5, '', 0),
(23, 176, 5, '', 0),
(24, 121, 5, '', 0),
(25, 120, 5, '', 0),
(26, 122, 5, '', 0),
(27, 123, 5, '', 0),
(28, 137, 5, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
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
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  `display` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`, `display`) VALUES
(1, 1, 323, 1, 1, 0, 1, '1.0000', '+', 1, '+', '1.00000000', '+', 1),
(2, 1, 323, 1, 2, 0, 1, '-2.0000', '+', 0, '+', '0.00000000', '+', 1),
(9, 4, 324, 1, 2, 1, 1, '2.0000', '+', 2, '+', '2.00000000', '+', 1),
(8, 4, 324, 1, 1, 1, 1, '1.0000', '+', 1, '+', '1.00000000', '+', 1),
(22, 8, 325, 5, 23, 0, 1, '2.0000', '+', 0, '+', '0.00000000', '+', 0),
(21, 8, 325, 5, 22, 0, 1, '7.0000', '+', 0, '+', '0.00000000', '+', 0),
(14, 6, 1, 4, 11, 0, 1, '5.5000', '+', 0, '+', '0.00000000', '+', 0),
(12, 6, 1, 4, 14, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+', 0),
(13, 6, 1, 4, 15, -1, 1, '2.0000', '+', 0, '+', '0.00000000', '+', 0),
(16, 6, 1, 4, 17, 0, 1, '6.5000', '+', 0, '+', '0.00000000', '+', 0),
(15, 6, 1, 4, 16, 0, 1, '3.5000', '+', 0, '+', '0.00000000', '+', 0),
(17, 6, 1, 4, 18, 0, 1, '1.1000', '+', 0, '+', '0.00000000', '+', 0),
(18, 7, 1, 5, 19, 0, 1, '1.1000', '+', 0, '+', '1.00000000', '+', 0),
(19, 7, 1, 5, 20, 0, 1, '6.5000', '+', 0, '+', '0.00000000', '+', 0),
(20, 8, 325, 5, 21, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+', 0),
(10, 5, 325, 3, 6, -9, 1, '1.0000', '+', 1, '+', '1.00000000', '+', 0),
(11, 5, 325, 3, 7, -5, 1, '1.0000', '+', 1, '+', '1.00000000', '+', 0),
(23, 8, 325, 5, 24, -7, 1, '11.0000', '+', 0, '+', '1.00000000', '+', 1),
(24, 8, 325, 5, 25, 0, 1, '13.0000', '+', 0, '+', '0.00000000', '+', 0),
(25, 8, 325, 5, 20, -7, 1, '15.0000', '+', 0, '+', '4.00000000', '+', 1),
(26, 7, 1, 5, 28, 0, 1, '6.5000', '+', 0, '+', '2.00000000', '+', 1),
(27, 7, 1, 5, 29, 0, 1, '3.5000', '+', 0, '+', '3.00000000', '+', 1),
(28, 7, 1, 5, 30, -4, 1, '2.4000', '+', 0, '+', '4.00000000', '+', 1),
(30, 10, 139, 5, 20, 0, 1, '2.0000', '+', 0, '+', '2.00000000', '+', 0),
(31, 10, 139, 5, 19, 0, 1, '1.0000', '+', 0, '+', '1.00000000', '+', 0),
(32, 10, 139, 5, 23, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+', 0),
(33, 11, 326, 5, 20, 0, 1, '4.8000', '+', 0, '+', '4.00000000', '+', 1),
(34, 12, 109, 5, 31, 0, 1, '0.0000', '+', 0, '+', '2.00000000', '+', 1),
(35, 12, 109, 5, 32, 0, 1, '0.0000', '+', 0, '+', '3.00000000', '+', 1),
(36, 12, 109, 5, 33, 0, 1, '-12.0000', '+', 0, '+', '4.00000000', '+', 1),
(37, 13, 110, 5, 31, 0, 1, '0.0000', '+', 0, '+', '2.00000000', '+', 1),
(38, 13, 110, 5, 32, 0, 1, '0.0000', '+', 0, '+', '3.00000000', '+', 1),
(39, 13, 110, 5, 33, 0, 1, '-7.0000', '+', 0, '+', '4.00000000', '+', 1),
(40, 14, 111, 5, 31, 0, 1, '0.0000', '+', 0, '+', '2.00000000', '+', 1),
(41, 14, 111, 5, 32, 0, 1, '0.0000', '+', 0, '+', '3.00000000', '+', 1),
(42, 14, 111, 5, 33, 0, 1, '-7.0000', '+', 0, '+', '4.00000000', '+', 1),
(43, 15, 112, 5, 31, 0, 1, '0.0000', '+', 0, '+', '2.00000000', '+', 1),
(44, 15, 112, 5, 32, 0, 1, '0.0000', '+', 0, '+', '3.00000000', '+', 1),
(45, 15, 112, 5, 33, 0, 1, '-7.0000', '+', 0, '+', '4.00000000', '+', 1),
(46, 16, 115, 5, 31, 0, 1, '0.0000', '+', 0, '+', '2.00000000', '+', 1),
(47, 16, 115, 5, 32, 0, 1, '0.0000', '+', 0, '+', '3.00000000', '+', 1),
(48, 16, 115, 5, 33, 0, 1, '-4.0000', '+', 0, '+', '4.00000000', '+', 1),
(49, 17, 117, 5, 31, 0, 1, '-6.0000', '+', 0, '+', '2.00000000', '+', 1),
(50, 17, 117, 5, 32, 0, 1, '-6.0000', '+', 0, '+', '3.00000000', '+', 1),
(51, 17, 117, 5, 33, 0, 1, '-6.0000', '+', 0, '+', '4.00000000', '+', 1),
(52, 18, 119, 5, 32, 0, 1, '0.0000', '+', 0, '+', '1.00000000', '+', 1),
(53, 18, 119, 5, 31, 0, 1, '0.0000', '+', 0, '+', '2.00000000', '+', 1),
(54, 19, 118, 5, 32, 0, 1, '0.0000', '+', 0, '+', '1.00000000', '+', 1),
(55, 19, 118, 5, 31, 0, 1, '0.0000', '+', 0, '+', '2.00000000', '+', 1),
(56, 20, 172, 5, 31, 0, 1, '-5.0000', '+', 0, '+', '2.00000000', '+', 1),
(57, 20, 172, 5, 32, 0, 1, '-5.0000', '+', 0, '+', '3.00000000', '+', 1),
(58, 20, 172, 5, 33, 0, 1, '-5.0000', '+', 0, '+', '4.00000000', '+', 1),
(59, 21, 173, 5, 31, 0, 1, '-5.0000', '+', 0, '+', '2.00000000', '+', 1),
(60, 21, 173, 5, 32, 0, 1, '-5.0000', '+', 0, '+', '3.00000000', '+', 1),
(61, 21, 173, 5, 33, 0, 1, '-5.0000', '+', 0, '+', '4.00000000', '+', 1),
(62, 22, 174, 5, 31, 0, 1, '-5.0000', '+', 0, '+', '2.00000000', '+', 1),
(63, 22, 174, 5, 32, 0, 1, '-5.0000', '+', 0, '+', '3.00000000', '+', 1),
(64, 22, 174, 5, 33, 0, 1, '-5.0000', '+', 0, '+', '4.00000000', '+', 1),
(65, 23, 176, 5, 31, 0, 1, '-5.0000', '+', 0, '+', '2.00000000', '+', 1),
(66, 23, 176, 5, 32, 0, 1, '-5.0000', '+', 0, '+', '3.00000000', '+', 1),
(67, 23, 176, 5, 33, 0, 1, '-5.0000', '+', 0, '+', '4.00000000', '+', 1),
(68, 24, 121, 5, 31, 0, 1, '-3.0000', '+', 0, '+', '2.00000000', '+', 1),
(69, 24, 121, 5, 32, 0, 1, '-3.0000', '+', 0, '+', '3.00000000', '+', 1),
(70, 24, 121, 5, 33, 0, 1, '-3.0000', '+', 0, '+', '4.00000000', '+', 1),
(71, 25, 120, 5, 31, 0, 1, '-3.0000', '+', 0, '+', '2.00000000', '+', 1),
(72, 25, 120, 5, 32, 0, 1, '-3.0000', '+', 0, '+', '3.00000000', '+', 1),
(73, 25, 120, 5, 33, 0, 1, '-3.0000', '+', 0, '+', '4.00000000', '+', 1),
(74, 26, 122, 5, 31, 0, 1, '-8.0000', '+', 0, '+', '2.00000000', '+', 1),
(75, 26, 122, 5, 32, 0, 1, '-8.0000', '+', 0, '+', '3.00000000', '+', 1),
(76, 26, 122, 5, 33, 0, 1, '-8.0000', '+', 0, '+', '4.00000000', '+', 1),
(77, 27, 123, 5, 31, 0, 1, '-8.0000', '+', 0, '+', '2.00000000', '+', 1),
(78, 27, 123, 5, 32, 0, 1, '-8.0000', '+', 0, '+', '3.00000000', '+', 1),
(79, 27, 123, 5, 33, 0, 1, '-8.0000', '+', 0, '+', '4.00000000', '+', 1),
(80, 28, 137, 5, 34, 0, 1, '-3.0000', '+', 0, '+', '2.00000000', '+', 1),
(81, 28, 137, 5, 35, 0, 1, '-3.0000', '+', 0, '+', '3.00000000', '+', 1),
(82, 28, 137, 5, 36, 0, 1, '-3.0000', '+', 0, '+', '4.00000000', '+', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_tag`
--

CREATE TABLE `oc_product_tag` (
  `product_tag_id` int(11) UNSIGNED NOT NULL COMMENT '属性id',
  `name` varchar(32) NOT NULL COMMENT '属性名称',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '属性排序',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_tag`
--

INSERT INTO `oc_product_tag` (`product_tag_id`, `name`, `sort`, `addtime`, `status`) VALUES
(1, 'popular', 0, '2017-04-25 09:48:51', 1),
(2, 'hot', 0, '2017-04-25 09:52:03', 1),
(3, 'veg', 0, '2017-04-25 09:52:13', 1),
(4, 'health', 0, '2017-04-25 09:52:22', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(10, 1),
(11, 1),
(17, 3),
(18, 3),
(19, 3),
(21, 3),
(23, 3),
(24, 2),
(26, 2),
(38, 4),
(41, 12),
(51, 3),
(56, 5),
(59, 9),
(60, 9),
(62, 9),
(63, 9),
(65, 9),
(67, 9),
(68, 6),
(69, 6),
(70, 6),
(71, 6),
(72, 6),
(75, 6),
(77, 6),
(79, 6),
(81, 6),
(82, 6),
(83, 6),
(86, 6),
(87, 6),
(88, 6),
(90, 6),
(92, 6),
(93, 6),
(94, 6),
(96, 6),
(97, 6),
(98, 7),
(99, 7),
(101, 7),
(109, 8),
(110, 8),
(111, 8),
(112, 8),
(113, 8),
(114, 8),
(115, 8),
(117, 8),
(118, 8),
(119, 8),
(120, 8),
(121, 8),
(122, 8),
(123, 8),
(128, 10),
(131, 7),
(135, 3),
(137, 10),
(138, 1),
(139, 1),
(140, 1),
(143, 10),
(144, 11),
(145, 5),
(148, 11),
(149, 11),
(154, 7),
(156, 7),
(157, 7),
(166, 3),
(169, 10),
(172, 8),
(173, 8),
(174, 8),
(176, 8),
(178, 1),
(180, 6),
(185, 1),
(186, 10),
(187, 10),
(189, 5),
(190, 5),
(192, 8),
(193, 11),
(198, 5),
(200, 12),
(201, 12),
(202, 12),
(203, 12),
(205, 12),
(206, 5),
(207, 10),
(208, 12),
(210, 12),
(212, 12),
(213, 12),
(214, 12),
(220, 10),
(267, 12),
(268, 12),
(270, 11),
(279, 12),
(280, 8),
(281, 8),
(285, 5),
(286, 1),
(287, 1),
(296, 7),
(297, 12),
(299, 3),
(300, 3),
(301, 4),
(304, 6),
(305, 5),
(312, 7),
(322, 8),
(329, 7),
(330, 11);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(10, 0, 0),
(4, 0, 0),
(11, 0, 0),
(6, 0, 0),
(7, 0, 0),
(138, 0, 0),
(178, 0, 0),
(5, 0, 0),
(139, 0, 0),
(185, 0, 0),
(140, 0, 0),
(286, 0, 0),
(287, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(21, 0, 0),
(23, 0, 0),
(135, 0, 0),
(51, 0, 0),
(166, 0, 0),
(299, 0, 0),
(300, 0, 0),
(24, 0, 0),
(26, 0, 0),
(38, 0, 0),
(301, 0, 0),
(56, 0, 0),
(145, 0, 0),
(190, 0, 0),
(189, 0, 0),
(198, 0, 0),
(206, 0, 0),
(285, 0, 0),
(305, 0, 0),
(98, 0, 0),
(99, 0, 0),
(131, 0, 0),
(156, 0, 0),
(154, 0, 0),
(157, 0, 0),
(101, 0, 0),
(296, 0, 0),
(312, 0, 0),
(329, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(75, 0, 0),
(77, 0, 0),
(79, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(90, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0),
(180, 0, 0),
(96, 0, 0),
(97, 0, 0),
(304, 0, 0),
(109, 0, 0),
(110, 0, 0),
(111, 0, 0),
(112, 0, 0),
(113, 0, 0),
(114, 0, 0),
(115, 0, 0),
(192, 0, 0),
(117, 0, 0),
(119, 0, 0),
(118, 0, 0),
(172, 0, 0),
(173, 0, 0),
(174, 0, 0),
(176, 0, 0),
(121, 0, 0),
(120, 0, 0),
(122, 0, 0),
(123, 0, 0),
(280, 0, 0),
(322, 0, 0),
(281, 0, 0),
(59, 0, 0),
(60, 0, 0),
(62, 0, 0),
(63, 0, 0),
(65, 0, 0),
(67, 0, 0),
(220, 0, 0),
(128, 0, 0),
(137, 0, 0),
(143, 0, 0),
(169, 0, 0),
(186, 0, 0),
(187, 0, 0),
(207, 0, 0),
(144, 0, 0),
(148, 0, 0),
(149, 0, 0),
(193, 0, 0),
(270, 0, 0),
(330, 0, 0),
(200, 0, 0),
(201, 0, 0),
(202, 0, 0),
(205, 0, 0),
(208, 0, 0),
(212, 0, 0),
(213, 0, 0),
(267, 0, 0),
(41, 0, 0),
(297, 0, 0),
(279, 0, 0),
(210, 0, 0),
(203, 0, 0),
(214, 0, 0),
(268, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(10, 0),
(11, 0),
(17, 0),
(18, 0),
(19, 0),
(21, 0),
(23, 0),
(24, 0),
(26, 0),
(38, 0),
(41, 0),
(51, 0),
(56, 0),
(59, 0),
(60, 0),
(62, 0),
(63, 0),
(65, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(75, 0),
(77, 0),
(79, 0),
(81, 0),
(82, 0),
(83, 0),
(86, 0),
(87, 0),
(88, 0),
(90, 0),
(92, 0),
(93, 0),
(94, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(101, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(128, 0),
(131, 0),
(135, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(143, 0),
(144, 0),
(145, 0),
(148, 0),
(149, 0),
(154, 0),
(156, 0),
(157, 0),
(166, 0),
(169, 0),
(172, 0),
(173, 0),
(174, 0),
(176, 0),
(178, 0),
(180, 0),
(185, 0),
(186, 0),
(187, 0),
(189, 0),
(190, 0),
(192, 0),
(193, 0),
(198, 0),
(200, 0),
(201, 0),
(202, 0),
(203, 0),
(205, 0),
(206, 0),
(207, 0),
(208, 0),
(210, 0),
(212, 0),
(213, 0),
(214, 0),
(220, 0),
(267, 0),
(268, 0),
(270, 0),
(279, 0),
(280, 0),
(281, 0),
(285, 0),
(286, 0),
(287, 0),
(296, 0),
(297, 0),
(299, 0),
(300, 0),
(301, 0),
(304, 0),
(305, 0),
(312, 0),
(322, 0),
(329, 0),
(330, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
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
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- 表的结构 `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `rating1` int(1) NOT NULL,
  `rating2` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_review`
--

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `order_id`, `author`, `text`, `rating`, `rating1`, `rating2`, `status`, `date_added`, `date_modified`) VALUES
(1, 4, 4, 3, 's', '123123123', 5, 5, 5, 1, '2017-05-05 15:03:43', '0000-00-00 00:00:00'),
(2, 4, 4, 2, 's', '12312312速度223123', 7, 6, 9, 1, '2017-05-05 15:04:38', '0000-00-00 00:00:00'),
(3, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 0, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(4, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(5, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(6, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(7, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(8, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(9, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(10, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(11, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 1, '2017-05-05 15:47:44', '0000-00-00 00:00:00'),
(12, 4, 4, 1, 's', '123213213s123123', 8, 3, 2, 0, '2017-05-05 15:47:44', '2017-06-02 14:06:19'),
(13, 4, 4, 18, 'Test review auther', 'Fake Review for testing purpose.', 10, 10, 10, 1, '2017-05-26 08:05:53', '2017-06-06 08:23:09'),
(14, 4, 4, 21, '', 'asdf', 5, 5, 5, 0, '2017-05-26 11:04:41', '0000-00-00 00:00:00'),
(15, 4, 4, 31, 'Johnrating', '', 5, 5, 5, 0, '2017-06-05 11:38:06', '0000-00-00 00:00:00'),
(16, 4, 4, 36, 'Johnrating', '', 5, 5, 5, 1, '2017-06-05 14:10:14', '2017-06-06 08:17:54'),
(17, 4, 1, 29, '', '', 5, 5, 5, 0, '2017-06-06 15:53:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(5538, 0, 'pp_standard', 'pp_standard_reversed_status_id', '2', 0),
(5655, 0, 'config', 'config_google_captcha_secret', '', 0),
(5537, 0, 'pp_standard', 'pp_standard_refunded_status_id', '2', 0),
(5656, 0, 'config', 'config_google_captcha_status', '0', 0),
(5654, 0, 'config', 'config_google_captcha_public', '', 0),
(5653, 0, 'config', 'config_google_analytics_status', '0', 0),
(5652, 0, 'config', 'config_google_analytics', '', 0),
(5651, 0, 'config', 'config_error_filename', 'error.log', 0),
(5650, 0, 'config', 'config_error_log', '1', 0),
(5648, 0, 'config', 'config_compression', '0', 0),
(5649, 0, 'config', 'config_error_display', '1', 0),
(5639, 0, 'config', 'config_shared', '0', 0),
(5640, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(5645, 0, 'config', 'config_maintenance', '0', 0),
(5646, 0, 'config', 'config_password', '1', 0),
(5647, 0, 'config', 'config_encryption', '404ccc2699da4381c0f685c7a354bacb', 0),
(5644, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(5641, 0, 'config', 'config_seo_url', '0', 0),
(5642, 0, 'config', 'config_file_max_size', '300000', 0),
(5643, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(5536, 0, 'pp_standard', 'pp_standard_processed_status_id', '2', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(5638, 0, 'config', 'config_secure', '0', 0),
(5637, 0, 'config', 'config_mail_alert', '', 0),
(5636, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(5635, 0, 'config', 'config_mail_smtp_port', '26', 0),
(5633, 0, 'config', 'config_mail_smtp_username', 'ogden@aupos.com.au', 0),
(5634, 0, 'config', 'config_mail_smtp_password', 'aupos2016', 0),
(5632, 0, 'config', 'config_mail_smtp_hostname', 'mail.aupos.com.au', 0),
(5631, 0, 'config', 'config_mail_parameter', 'ogden@aupos.com.au', 0),
(5630, 0, 'config', 'config_mail_protocol', 'smtp', 0),
(5629, 0, 'config', 'config_ftp_status', '0', 0),
(5628, 0, 'config', 'config_ftp_root', '', 0),
(5627, 0, 'config', 'config_ftp_password', '', 0),
(5626, 0, 'config', 'config_ftp_username', '', 0),
(5625, 0, 'config', 'config_ftp_port', '21', 0),
(5624, 0, 'config', 'config_ftp_hostname', 'mk.l.onebound.cn', 0),
(5623, 0, 'config', 'config_image_location_height', '120', 0),
(5622, 0, 'config', 'config_image_location_width', '120', 0),
(5621, 0, 'config', 'config_image_cart_height', '47', 0),
(5620, 0, 'config', 'config_image_cart_width', '47', 0),
(5619, 0, 'config', 'config_image_wishlist_height', '47', 0),
(5618, 0, 'config', 'config_image_wishlist_width', '47', 0),
(5617, 0, 'config', 'config_image_compare_height', '90', 0),
(5616, 0, 'config', 'config_image_compare_width', '90', 0),
(5615, 0, 'config', 'config_image_related_height', '80', 0),
(5614, 0, 'config', 'config_image_related_width', '80', 0),
(5613, 0, 'config', 'config_image_additional_height', '74', 0),
(5612, 0, 'config', 'config_image_additional_width', '74', 0),
(5611, 0, 'config', 'config_image_product_height', '228', 0),
(5610, 0, 'config', 'config_image_product_width', '228', 0),
(5609, 0, 'config', 'config_image_popup_height', '500', 0),
(5608, 0, 'config', 'config_image_popup_width', '500', 0),
(5607, 0, 'config', 'config_image_thumb_height', '228', 0),
(5606, 0, 'config', 'config_image_thumb_width', '228', 0),
(5605, 0, 'config', 'config_image_category_height', '80', 0),
(5604, 0, 'config', 'config_image_category_width', '80', 0),
(5603, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(5602, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(5601, 0, 'config', 'config_return_status_id', '2', 0),
(5600, 0, 'config', 'config_return_id', '0', 0),
(5599, 0, 'config', 'config_affiliate_mail', '0', 0),
(5598, 0, 'config', 'config_affiliate_id', '4', 0),
(5597, 0, 'config', 'config_affiliate_commission', '5', 0),
(5596, 0, 'config', 'config_affiliate_auto', '0', 0),
(5595, 0, 'config', 'config_affiliate_approval', '0', 0),
(5594, 0, 'config', 'config_stock_checkout', '0', 0),
(5593, 0, 'config', 'config_stock_warning', '0', 0),
(5592, 0, 'config', 'config_stock_display', '0', 0),
(5591, 0, 'config', 'config_order_mail', '0', 0),
(5590, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:\"5\";}', 1),
(5588, 0, 'config', 'config_order_status_id', '1', 0),
(5589, 0, 'config', 'config_processing_status', 'a:2:{i:0;s:1:\"2\";i:1;s:1:\"1\";}', 1),
(5587, 0, 'config', 'config_checkout_id', '5', 0),
(5586, 0, 'config', 'config_checkout_guest', '1', 0),
(5584, 0, 'config', 'config_api_id', '1', 0),
(5585, 0, 'config', 'config_cart_weight', '1', 0),
(5583, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(5579, 0, 'config', 'config_customer_price', '0', 0),
(5580, 0, 'config', 'config_login_attempts', '5', 0),
(5581, 0, 'config', 'config_account_id', '3', 0),
(5582, 0, 'config', 'config_account_mail', '0', 0),
(5578, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:\"1\";}', 1),
(5577, 0, 'config', 'config_customer_group_id', '1', 0),
(5576, 0, 'config', 'config_customer_online', '0', 0),
(5575, 0, 'config', 'config_tax_customer', 'shipping', 0),
(5574, 0, 'config', 'config_tax_default', 'shipping', 0),
(5573, 0, 'config', 'config_tax', '1', 0),
(5572, 0, 'config', 'config_voucher_max', '1000', 0),
(5571, 0, 'config', 'config_voucher_min', '1', 0),
(5570, 0, 'config', 'config_review_mail', '0', 0),
(5569, 0, 'config', 'config_review_guest', '1', 0),
(5568, 0, 'config', 'config_review_status', '1', 0),
(5567, 0, 'config', 'config_limit_admin', '20', 0),
(5566, 0, 'config', 'config_product_description_length', '100', 0),
(5565, 0, 'config', 'config_product_limit', '20', 0),
(5563, 0, 'config', 'config_weight_class_id', '1', 0),
(5564, 0, 'config', 'config_product_count', '1', 0),
(5562, 0, 'config', 'config_length_class_id', '1', 0),
(5561, 0, 'config', 'config_currency_auto', '1', 0),
(5560, 0, 'config', 'config_currency', 'AUD', 0),
(5559, 0, 'config', 'config_admin_language', 'en', 0),
(5558, 0, 'config', 'config_language', 'en', 0),
(5557, 0, 'config', 'config_zone_id', '0', 0),
(5556, 0, 'config', 'config_country_id', '1', 0),
(5551, 0, 'config', 'config_meta_title', 'Monkey King Thai Restaurant', 0),
(5552, 0, 'config', 'config_meta_description', '', 0),
(5553, 0, 'config', 'config_meta_keyword', '', 0),
(5554, 0, 'config', 'config_template', 'menulog', 0),
(5555, 0, 'config', 'config_layout_id', '4', 0),
(5550, 0, 'config', 'config_location', 'a:1:{i:0;s:1:\"4\";}', 1),
(5549, 0, 'config', 'config_comment', '', 0),
(5548, 0, 'config', 'config_open', '', 0),
(5544, 0, 'config', 'config_email', 'sales@monkeyking.com.au', 0),
(5547, 0, 'config', 'config_image', '', 0),
(5546, 0, 'config', 'config_fax', '', 0),
(5545, 0, 'config', 'config_telephone', '(02) 9416 9301', 0),
(5534, 0, 'pp_standard', 'pp_standard_failed_status_id', '2', 0),
(5535, 0, 'pp_standard', 'pp_standard_pending_status_id', '1', 0),
(5533, 0, 'pp_standard', 'pp_standard_expired_status_id', '2', 0),
(5532, 0, 'pp_standard', 'pp_standard_denied_status_id', '2', 0),
(5531, 0, 'pp_standard', 'pp_standard_completed_status_id', '2', 0),
(5529, 0, 'pp_standard', 'pp_standard_status', '1', 0),
(5530, 0, 'pp_standard', 'pp_standard_canceled_reversal_status_id', '2', 0),
(5528, 0, 'pp_standard', 'pp_standard_geo_zone_id', '0', 0),
(5527, 0, 'pp_standard', 'pp_standard_sort_order', '', 0),
(5526, 0, 'pp_standard', 'pp_standard_total', '', 0),
(5525, 0, 'pp_standard', 'pp_standard_transaction', '0', 0),
(5524, 0, 'pp_standard', 'pp_standard_debug', '1', 0),
(5523, 0, 'pp_standard', 'pp_standard_test', '1', 0),
(5542, 0, 'config', 'config_address', '338 Pacific highway, Lindfield NSW 2070', 0),
(5543, 0, 'config', 'config_geocode', '', 0),
(5541, 0, 'config', 'config_owner', 'Store Owner', 0),
(5540, 0, 'config', 'config_name', 'Monkey King Thai Restaurant', 0),
(5522, 0, 'pp_standard', 'pp_standard_email', 'lxq73061-facilitator@qq.com', 0),
(5539, 0, 'pp_standard', 'pp_standard_voided_status_id', '2', 0),
(5657, 0, 'low_order_fee', 'low_order_fee_total', '', 0),
(5658, 0, 'low_order_fee', 'low_order_fee_fee', '', 0),
(5659, 0, 'low_order_fee', 'low_order_fee_tax_class_id', '0', 0),
(5660, 0, 'low_order_fee', 'low_order_fee_status', '1', 0),
(5661, 0, 'low_order_fee', 'low_order_fee_sort_order', '8', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_shop_coupon`
--

CREATE TABLE `oc_shop_coupon` (
  `shop_coupon_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `times` int(11) NOT NULL DEFAULT '0',
  `total` decimal(15,4) NOT NULL,
  `max_amount` decimal(10,4) NOT NULL,
  `coupon_product_ids` varchar(25) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `info` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `oc_shop_coupon`
--

INSERT INTO `oc_shop_coupon` (`shop_coupon_id`, `name`, `type`, `discount`, `times`, `total`, `max_amount`, `coupon_product_ids`, `date_start`, `date_end`, `status`, `info`, `sort_order`, `date_added`) VALUES
(11, '10% OFF YOUR 1ST ORDER', 1, '10.0000', 1, '0.0000', '0.0000', '', '2017-06-06', '2018-06-06', 1, 'Not available with other offers or meal deals.', 1, '2017-06-06 14:00:36'),
(7, 'ORDER 8 TIMES 9TH IS FREE', 3, '12.5000', 8, '0.0000', '0.0000', '', '2017-06-06', '2018-06-06', 1, 'Not available with other offers. Delivery fee excluded. Loyalty discount is tracked only once a day(user must login before order is submitted). Your loyalty discount is limited to the average order value of your past loyalty orders.', 2, '2017-04-11 09:17:06'),
(8, 'Bonus FREE 1 x BONUS Free Prawn Chips', 2, '0.0000', 0, '50.0000', '75.0000', '1', '2017-06-06', '2018-06-06', 1, 'Order between $50 and $75 for Free Prawn Chips.\r\n\r\nNot available with other offers. ', 3, '2017-04-11 09:18:16'),
(9, 'Bonus FREE 1 x BONUS Free Seafood Salad or Prawn Chips', 2, '0.0000', 0, '75.0000', '100.0000', '2,1', '2017-06-06', '2018-06-06', 1, 'Order between $75 and $100 for Free Seafood Salad.\r\n\r\nNot available with other offers. ', 4, '2017-05-26 11:18:56'),
(10, 'Bonus FREE 1 x BONUS Free Garlic Bread', 2, '0.0000', 0, '100.0000', '0.0000', '3', '2017-06-06', '2018-06-06', 1, 'Order $100 or more for Free Garlic Bread.\r\n\r\nNot available with other offers. ', 5, '2017-05-26 11:19:10');

-- --------------------------------------------------------

--
-- 表的结构 `oc_shop_coupon_product`
--

CREATE TABLE `oc_shop_coupon_product` (
  `product_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_shop_coupon_product`
--

INSERT INTO `oc_shop_coupon_product` (`product_id`, `name`, `date_added`) VALUES
(1, 'Prawn Chips', '2017-05-19 15:56:00'),
(2, 'Seafood Salad', '2017-05-26 14:35:43'),
(3, 'Garlic Bread', '2017-05-26 14:36:04');

-- --------------------------------------------------------

--
-- 表的结构 `oc_shop_image`
--

CREATE TABLE `oc_shop_image` (
  `shop_image_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_shop_image`
--

INSERT INTO `oc_shop_image` (`shop_image_id`, `location_id`, `image`, `sort_order`) VALUES
(6, 5, 'catalog/logo.png', 0),
(864, 4, '', 1),
(863, 4, '', 2),
(862, 4, '', 3),
(861, 4, '', 4),
(860, 4, '', 5),
(859, 4, '', 6),
(858, 4, '', 7),
(857, 4, '', 8);

-- --------------------------------------------------------

--
-- 表的结构 `oc_shop_info`
--

CREATE TABLE `oc_shop_info` (
  `shop_info_id` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) NOT NULL,
  `info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_shop_info`
--

INSERT INTO `oc_shop_info` (`shop_info_id`, `location_id`, `info`) VALUES
(175, 4, 'Note: “OPEN 7 Days!!!“'),
(176, 4, 'Order now for later when restaurant opens.');

-- --------------------------------------------------------

--
-- 表的结构 `oc_shop_tag`
--

CREATE TABLE `oc_shop_tag` (
  `tag_id` int(11) UNSIGNED NOT NULL COMMENT '标签id',
  `name` varchar(32) NOT NULL COMMENT '标签名称',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标签排序',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_shop_tag`
--

INSERT INTO `oc_shop_tag` (`tag_id`, `name`, `sort`, `addtime`, `status`) VALUES
(4, 'Thai', 2, '2017-03-21 19:47:41', 1),
(8, 'Asian', 1, '2017-03-22 10:47:22', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_shop_time`
--

CREATE TABLE `oc_shop_time` (
  `shop_time_id` int(11) UNSIGNED NOT NULL COMMENT '时间表id',
  `location_id` int(11) NOT NULL COMMENT '店铺id',
  `times` text NOT NULL,
  `unavailable` text NOT NULL,
  `pretime` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_shop_time`
--

INSERT INTO `oc_shop_time` (`shop_time_id`, `location_id`, `times`, `unavailable`, `pretime`) VALUES
(115, 4, 'a:6:{i:0;a:9:{s:4:\"week\";s:1:\"2\";s:12:\"md_begintime\";s:5:\"00:00\";s:10:\"md_endtime\";s:5:\"21:30\";s:12:\"nd_begintime\";s:0:\"\";s:10:\"nd_endtime\";s:0:\"\";s:12:\"mt_begintime\";s:5:\"00:00\";s:10:\"mt_endtime\";s:5:\"22:00\";s:12:\"nt_begintime\";s:0:\"\";s:10:\"nt_endtime\";s:0:\"\";}i:1;a:9:{s:4:\"week\";s:1:\"3\";s:12:\"md_begintime\";s:5:\"00:00\";s:10:\"md_endtime\";s:5:\"21:30\";s:12:\"nd_begintime\";s:0:\"\";s:10:\"nd_endtime\";s:0:\"\";s:12:\"mt_begintime\";s:5:\"00:00\";s:10:\"mt_endtime\";s:5:\"22:00\";s:12:\"nt_begintime\";s:0:\"\";s:10:\"nt_endtime\";s:0:\"\";}i:2;a:9:{s:4:\"week\";s:1:\"4\";s:12:\"md_begintime\";s:5:\"00:00\";s:10:\"md_endtime\";s:5:\"21:30\";s:12:\"nd_begintime\";s:0:\"\";s:10:\"nd_endtime\";s:0:\"\";s:12:\"mt_begintime\";s:5:\"00:00\";s:10:\"mt_endtime\";s:5:\"22:00\";s:12:\"nt_begintime\";s:0:\"\";s:10:\"nt_endtime\";s:0:\"\";}i:3;a:9:{s:4:\"week\";s:1:\"6\";s:12:\"md_begintime\";s:5:\"00:00\";s:10:\"md_endtime\";s:5:\"21:30\";s:12:\"nd_begintime\";s:0:\"\";s:10:\"nd_endtime\";s:0:\"\";s:12:\"mt_begintime\";s:5:\"00:00\";s:10:\"mt_endtime\";s:5:\"22:00\";s:12:\"nt_begintime\";s:0:\"\";s:10:\"nt_endtime\";s:0:\"\";}i:4;a:9:{s:4:\"week\";s:1:\"5\";s:12:\"md_begintime\";s:5:\"00:00\";s:10:\"md_endtime\";s:5:\"23:00\";s:12:\"nd_begintime\";s:0:\"\";s:10:\"nd_endtime\";s:0:\"\";s:12:\"mt_begintime\";s:5:\"00:00\";s:10:\"mt_endtime\";s:5:\"23:43\";s:12:\"nt_begintime\";s:0:\"\";s:10:\"nt_endtime\";s:0:\"\";}i:5;a:9:{s:4:\"week\";s:1:\"1\";s:12:\"md_begintime\";s:5:\"00:00\";s:10:\"md_endtime\";s:5:\"23:59\";s:12:\"nd_begintime\";s:0:\"\";s:10:\"nd_endtime\";s:0:\"\";s:12:\"mt_begintime\";s:5:\"00:00\";s:10:\"mt_endtime\";s:5:\"23:43\";s:12:\"nt_begintime\";s:0:\"\";s:10:\"nt_endtime\";s:0:\"\";}}', 'N;', 'a:2:{s:8:\"delivery\";s:2:\"45\";s:6:\"pickup\";s:2:\"30\";}');

-- --------------------------------------------------------

--
-- 表的结构 `oc_state`
--

CREATE TABLE `oc_state` (
  `state_id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_state`
--

INSERT INTO `oc_state` (`state_id`, `country_id`, `name`, `status`) VALUES
(2, 1, 'New South Wales', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- 表的结构 `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_suburb`
--

CREATE TABLE `oc_suburb` (
  `suburb_id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_suburb`
--

INSERT INTO `oc_suburb` (`suburb_id`, `country_id`, `state_id`, `name`, `status`) VALUES
(2, 1, 2, 'Chatswood West', 1),
(3, 1, 2, 'Killara', 1),
(4, 1, 2, 'Chatswood', 1),
(5, 1, 2, 'Roseville', 1),
(6, 1, 2, 'East Lindfield', 1),
(7, 1, 2, 'Lindfield', 1),
(8, 1, 2, 'East Killara', 1),
(9, 1, 2, 'Gordon', 1),
(10, 1, 2, 'Roseville Chase', 1),
(11, 1, 2, 'West Pymble', 1),
(12, 1, 2, 'Lindfield West', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_table_link`
--

CREATE TABLE `oc_table_link` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `table_link` varchar(300) NOT NULL,
  `site_id` int(11) NOT NULL,
  `table_code` varchar(128) NOT NULL,
  `pos_saleId` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `link_generate_time` datetime NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `validation` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_table_link`
--

INSERT INTO `oc_table_link` (`link_id`, `table_link`, `site_id`, `table_code`, `pos_saleId`, `status`, `link_generate_time`, `add_time`, `validation`) VALUES
(1, '17 1 VIP-2 20180102030405', 0, 'VIP-2', 1, 0, '2018-12-18 00:00:00', NULL, 'abc'),
(2, '17 1 01 20180102030405', 1, '01', 2, 0, '2018-01-24 01:00:00', NULL, NULL),
(3, '19 1 02 20180102030406', 1, '02', 19, 0, '2018-01-25 00:00:00', NULL, NULL),
(4, '9 59', 0, '9', 59, 0, '2018-10-29 16:20:49', NULL, NULL),
(5, '10 60', 0, '10', 60, 0, '2018-10-29 16:25:57', NULL, 'we23'),
(20, '20 40', 0, '20', 157, 0, '2018-11-19 10:00:00', NULL, 'v20181116131900'),
(21, '11 162', 1, '11', 162, 0, '2018-11-21 17:41:27', NULL, '2018112116140111'),
(22, '11 165', 1, '11', 165, 0, '2018-11-22 14:46:28', NULL, '2018112214453811'),
(23, '12 166', 1, '12', 166, 0, '2018-11-22 14:51:09', NULL, '2018112214480312'),
(24, '11 167', 1, '11', 167, -1, '2018-11-22 15:39:34', NULL, ''),
(25, '11 168', 1, '11', 168, -1, '2018-11-22 15:40:53', NULL, '2018112215402211'),
(26, '15 170', 1, '15', 170, 0, '2018-11-22 16:21:49', NULL, '2018112215514515'),
(27, '25 171', 1, '25', 171, 0, '2018-11-22 16:21:49', NULL, '2018112215532325'),
(28, '12 172', 1, '12', 172, -1, '2018-11-22 16:21:49', NULL, '2018112216211212'),
(29, '12 175', 1, '12', 175, 0, '2018-11-23 12:46:49', NULL, '2018112312462112');

-- --------------------------------------------------------

--
-- 表的结构 `oc_table_linksub`
--

CREATE TABLE `oc_table_linksub` (
  `link_id` int(11) NOT NULL,
  `linksub_id` int(10) UNSIGNED NOT NULL,
  `downloaded` tinyint(1) DEFAULT '0',
  `order_id` int(11) DEFAULT '-1',
  `sub_status` tinyint(1) DEFAULT '0',
  `client_browser` varchar(500) DEFAULT '',
  `client_ip` varchar(50) DEFAULT '',
  `order_items_qrcode_string` varchar(5000) DEFAULT '',
  `sub_add_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_table_linksub`
--

INSERT INTO `oc_table_linksub` (`link_id`, `linksub_id`, `downloaded`, `order_id`, `sub_status`, `client_browser`, `client_ip`, `order_items_qrcode_string`, `sub_add_time`) VALUES
(1, 1, 1, 138, 10, '', '192.168.1.220', '', NULL),
(2, 1, 1, 17, 10, '', '192.168.1.220', '', NULL),
(3, 1, 1, 19, 10, '', '192.168.1.220', '', NULL),
(20, 1, 1, 172, 0, '', '', '', '2018-11-19 00:00:00'),
(20, 2, 1, 173, 0, '', '', '', '2018-11-19 00:00:00'),
(21, 1, 1, 174, 0, '', '', '', '2018-11-21 05:46:18'),
(21, 2, 1, 175, 0, '', '', '', '2018-11-21 05:48:54'),
(21, 3, 1, 176, 0, '', '', '', '2018-11-22 02:21:29'),
(21, 4, 1, 177, 0, '', '', '', '2018-11-22 02:27:52'),
(21, 5, 1, 178, 0, '', '', '', '2018-11-22 02:43:42'),
(21, 6, 1, 179, 0, '', '', '', '2018-11-22 02:44:51'),
(21, 7, 1, 180, 0, '', '', '', '2018-11-22 02:46:26'),
(23, 1, 1, 181, 0, '', '', '', '2018-11-22 02:52:12'),
(28, 1, 1, 182, 0, '', '', '', '2018-11-22 04:22:50');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `approve` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `approve`, `date_added`, `date_modified`) VALUES
(12, 'FRE', 'GST free', 0, '2017-06-27 11:46:56', '2017-06-27 11:47:14'),
(11, 'GST', 'Goods And Services Tax', 1, '2017-05-30 08:52:14', '2017-07-20 08:34:14');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(89, 1, 'FRE', '0.0000', 'P', '2017-06-27 11:49:37', '2017-07-03 10:25:56'),
(88, 1, 'GST', '10.0000', 'P', '2017-05-30 08:52:45', '2017-06-27 11:49:44');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(88, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_upload`
--

INSERT INTO `oc_upload` (`upload_id`, `name`, `filename`, `code`, `date_added`) VALUES
(1, '1.jpg', '1.jpg.cfc9a2b5320fb782ab9caab2e1ba7a8d', '5f4b96edb0a2feae88b1ab1896f406e4fb5db8cc', '2017-05-05 16:24:07'),
(2, '541169c816a71.jpg', '541169c816a71.jpg.965234384db46a99ef4d341142bfc9dd', 'fa10c13133607059bbe5a323d47502c132cbbcd7', '2017-05-11 10:54:50'),
(3, 'printer.bmp', 'printer.bmp.35ebcb18e3cc84d046db12b9a63dc55e', '27db3e65e5364ad389fd0777cd0d5a26d83cbb49', '2017-05-26 12:21:13');

-- --------------------------------------------------------

--
-- 表的结构 `oc_url_alias`
--

CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(772, 'information_id=4', 'about_us'),
(925, 'product_id=95', ''),
(828, 'manufacturer_id=9', 'canon'),
(846, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(927, 'product_id=97', ''),
(928, 'product_id=98', ''),
(929, 'product_id=99', ''),
(930, 'product_id=100', ''),
(931, 'product_id=101', ''),
(932, 'product_id=102', ''),
(933, 'product_id=103', ''),
(934, 'product_id=104', ''),
(935, 'product_id=105', ''),
(937, 'product_id=107', ''),
(938, 'product_id=108', ''),
(939, 'product_id=109', ''),
(940, 'product_id=110', ''),
(942, 'product_id=112', ''),
(943, 'product_id=113', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
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
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '0220cc6b3973b88e7c8c7ea92141bfe021b2a66c', 'e68e40456', 'John', 'Doe', 'grantedwins5@hotmail.com', '', '', '127.0.0.1', 1, '2017-03-17 11:52:03'),
(2, 1, 'Owner', '0f03127303e4b9164ff29224b4c21278d471a337', '285fc0403', 'David', 'Smith', 'grantedwins@gmail.com', '', '', '', 1, '2017-07-06 10:22:44');

-- --------------------------------------------------------

--
-- 表的结构 `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', 'a:2:{s:6:\"access\";a:191:{i:0;s:16:\"catalog/add_type\";i:1;s:17:\"catalog/attribute\";i:2;s:23:\"catalog/attribute_group\";i:3;s:16:\"catalog/category\";i:4;s:16:\"catalog/download\";i:5;s:14:\"catalog/filter\";i:6;s:19:\"catalog/information\";i:7;s:20:\"catalog/manufacturer\";i:8;s:14:\"catalog/option\";i:9;s:15:\"catalog/product\";i:10;s:19:\"catalog/product_tag\";i:11;s:17:\"catalog/recurring\";i:12;s:14:\"catalog/review\";i:13;s:11:\"catalog/tag\";i:14;s:18:\"common/column_left\";i:15;s:18:\"common/filemanager\";i:16;s:11:\"common/menu\";i:17;s:14:\"common/profile\";i:18;s:12:\"common/stats\";i:19;s:13:\"design/banner\";i:20;s:13:\"design/layout\";i:21;s:14:\"extension/feed\";i:22;s:15:\"extension/fraud\";i:23;s:19:\"extension/installer\";i:24;s:22:\"extension/modification\";i:25;s:16:\"extension/module\";i:26;s:17:\"extension/openbay\";i:27;s:17:\"extension/payment\";i:28;s:18:\"extension/shipping\";i:29;s:15:\"extension/total\";i:30;s:16:\"feed/google_base\";i:31;s:19:\"feed/google_sitemap\";i:32;s:15:\"feed/openbaypro\";i:33;s:18:\"fraud/fraudlabspro\";i:34;s:13:\"fraud/maxmind\";i:35;s:20:\"localisation/country\";i:36;s:19:\"localisation/coupon\";i:37;s:21:\"localisation/currency\";i:38;s:21:\"localisation/geo_zone\";i:39;s:21:\"localisation/language\";i:40;s:25:\"localisation/length_class\";i:41;s:21:\"localisation/location\";i:42;s:25:\"localisation/order_status\";i:43;s:20:\"localisation/product\";i:44;s:26:\"localisation/return_action\";i:45;s:26:\"localisation/return_reason\";i:46;s:26:\"localisation/return_status\";i:47;s:19:\"localisation/review\";i:48;s:18:\"localisation/state\";i:49;s:25:\"localisation/stock_status\";i:50;s:19:\"localisation/suburb\";i:51;s:22:\"localisation/tax_class\";i:52;s:21:\"localisation/tax_rate\";i:53;s:25:\"localisation/weight_class\";i:54;s:17:\"localisation/zone\";i:55;s:19:\"marketing/affiliate\";i:56;s:17:\"marketing/contact\";i:57;s:16:\"marketing/coupon\";i:58;s:19:\"marketing/marketing\";i:59;s:14:\"module/account\";i:60;s:16:\"module/affiliate\";i:61;s:20:\"module/amazon_button\";i:62;s:19:\"module/amazon_login\";i:63;s:17:\"module/amazon_pay\";i:64;s:13:\"module/banner\";i:65;s:17:\"module/bestseller\";i:66;s:15:\"module/carousel\";i:67;s:15:\"module/category\";i:68;s:19:\"module/ebay_listing\";i:69;s:15:\"module/featured\";i:70;s:13:\"module/filter\";i:71;s:22:\"module/google_hangouts\";i:72;s:11:\"module/html\";i:73;s:18:\"module/information\";i:74;s:13:\"module/latest\";i:75;s:16:\"module/pp_button\";i:76;s:15:\"module/pp_login\";i:77;s:16:\"module/slideshow\";i:78;s:14:\"module/special\";i:79;s:12:\"module/store\";i:80;s:14:\"openbay/amazon\";i:81;s:22:\"openbay/amazon_listing\";i:82;s:22:\"openbay/amazon_product\";i:83;s:16:\"openbay/amazonus\";i:84;s:24:\"openbay/amazonus_listing\";i:85;s:24:\"openbay/amazonus_product\";i:86;s:12:\"openbay/ebay\";i:87;s:20:\"openbay/ebay_profile\";i:88;s:21:\"openbay/ebay_template\";i:89;s:12:\"openbay/etsy\";i:90;s:20:\"openbay/etsy_product\";i:91;s:21:\"openbay/etsy_shipping\";i:92;s:17:\"openbay/etsy_shop\";i:93;s:23:\"payment/amazon_checkout\";i:94;s:24:\"payment/amazon_login_pay\";i:95;s:24:\"payment/authorizenet_aim\";i:96;s:24:\"payment/authorizenet_sim\";i:97;s:21:\"payment/bank_transfer\";i:98;s:22:\"payment/bluepay_hosted\";i:99;s:24:\"payment/bluepay_redirect\";i:100;s:14:\"payment/cheque\";i:101;s:11:\"payment/cod\";i:102;s:17:\"payment/firstdata\";i:103;s:24:\"payment/firstdata_remote\";i:104;s:21:\"payment/free_checkout\";i:105;s:14:\"payment/g2apay\";i:106;s:17:\"payment/globalpay\";i:107;s:24:\"payment/globalpay_remote\";i:108;s:22:\"payment/klarna_account\";i:109;s:22:\"payment/klarna_invoice\";i:110;s:14:\"payment/liqpay\";i:111;s:14:\"payment/nochex\";i:112;s:15:\"payment/paymate\";i:113;s:16:\"payment/paypoint\";i:114;s:13:\"payment/payza\";i:115;s:26:\"payment/perpetual_payments\";i:116;s:18:\"payment/pp_express\";i:117;s:18:\"payment/pp_payflow\";i:118;s:25:\"payment/pp_payflow_iframe\";i:119;s:14:\"payment/pp_pro\";i:120;s:21:\"payment/pp_pro_iframe\";i:121;s:19:\"payment/pp_standard\";i:122;s:14:\"payment/realex\";i:123;s:21:\"payment/realex_remote\";i:124;s:22:\"payment/sagepay_direct\";i:125;s:22:\"payment/sagepay_server\";i:126;s:18:\"payment/sagepay_us\";i:127;s:24:\"payment/securetrading_pp\";i:128;s:24:\"payment/securetrading_ws\";i:129;s:14:\"payment/skrill\";i:130;s:19:\"payment/twocheckout\";i:131;s:28:\"payment/web_payment_software\";i:132;s:16:\"payment/worldpay\";i:133;s:16:\"report/affiliate\";i:134;s:25:\"report/affiliate_activity\";i:135;s:22:\"report/affiliate_login\";i:136;s:24:\"report/customer_activity\";i:137;s:22:\"report/customer_credit\";i:138;s:21:\"report/customer_login\";i:139;s:22:\"report/customer_online\";i:140;s:21:\"report/customer_order\";i:141;s:22:\"report/customer_reward\";i:142;s:16:\"report/marketing\";i:143;s:24:\"report/product_purchased\";i:144;s:21:\"report/product_viewed\";i:145;s:18:\"report/sale_coupon\";i:146;s:17:\"report/sale_order\";i:147;s:18:\"report/sale_return\";i:148;s:20:\"report/sale_shipping\";i:149;s:15:\"report/sale_tax\";i:150;s:17:\"sale/custom_field\";i:151;s:13:\"sale/customer\";i:152;s:20:\"sale/customer_ban_ip\";i:153;s:19:\"sale/customer_group\";i:154;s:10:\"sale/order\";i:155;s:14:\"sale/recurring\";i:156;s:11:\"sale/return\";i:157;s:12:\"sale/voucher\";i:158;s:18:\"sale/voucher_theme\";i:159;s:15:\"setting/setting\";i:160;s:13:\"setting/store\";i:161;s:16:\"shipping/auspost\";i:162;s:17:\"shipping/citylink\";i:163;s:14:\"shipping/fedex\";i:164;s:13:\"shipping/flat\";i:165;s:13:\"shipping/free\";i:166;s:13:\"shipping/item\";i:167;s:23:\"shipping/parcelforce_48\";i:168;s:15:\"shipping/pickup\";i:169;s:19:\"shipping/royal_mail\";i:170;s:12:\"shipping/ups\";i:171;s:13:\"shipping/usps\";i:172;s:15:\"shipping/weight\";i:173;s:11:\"tool/backup\";i:174;s:14:\"tool/error_log\";i:175;s:11:\"tool/upload\";i:176;s:12:\"total/coupon\";i:177;s:12:\"total/credit\";i:178;s:14:\"total/handling\";i:179;s:16:\"total/klarna_fee\";i:180;s:19:\"total/low_order_fee\";i:181;s:12:\"total/reward\";i:182;s:14:\"total/shipping\";i:183;s:15:\"total/sub_total\";i:184;s:9:\"total/tax\";i:185;s:11:\"total/total\";i:186;s:13:\"total/voucher\";i:187;s:8:\"user/api\";i:188;s:9:\"user/user\";i:189;s:20:\"user/user_permission\";i:190;s:18:\"payment/pp_express\";}s:6:\"modify\";a:191:{i:0;s:16:\"catalog/add_type\";i:1;s:17:\"catalog/attribute\";i:2;s:23:\"catalog/attribute_group\";i:3;s:16:\"catalog/category\";i:4;s:16:\"catalog/download\";i:5;s:14:\"catalog/filter\";i:6;s:19:\"catalog/information\";i:7;s:20:\"catalog/manufacturer\";i:8;s:14:\"catalog/option\";i:9;s:15:\"catalog/product\";i:10;s:19:\"catalog/product_tag\";i:11;s:17:\"catalog/recurring\";i:12;s:14:\"catalog/review\";i:13;s:11:\"catalog/tag\";i:14;s:18:\"common/column_left\";i:15;s:18:\"common/filemanager\";i:16;s:11:\"common/menu\";i:17;s:14:\"common/profile\";i:18;s:12:\"common/stats\";i:19;s:13:\"design/banner\";i:20;s:13:\"design/layout\";i:21;s:14:\"extension/feed\";i:22;s:15:\"extension/fraud\";i:23;s:19:\"extension/installer\";i:24;s:22:\"extension/modification\";i:25;s:16:\"extension/module\";i:26;s:17:\"extension/openbay\";i:27;s:17:\"extension/payment\";i:28;s:18:\"extension/shipping\";i:29;s:15:\"extension/total\";i:30;s:16:\"feed/google_base\";i:31;s:19:\"feed/google_sitemap\";i:32;s:15:\"feed/openbaypro\";i:33;s:18:\"fraud/fraudlabspro\";i:34;s:13:\"fraud/maxmind\";i:35;s:20:\"localisation/country\";i:36;s:19:\"localisation/coupon\";i:37;s:21:\"localisation/currency\";i:38;s:21:\"localisation/geo_zone\";i:39;s:21:\"localisation/language\";i:40;s:25:\"localisation/length_class\";i:41;s:21:\"localisation/location\";i:42;s:25:\"localisation/order_status\";i:43;s:20:\"localisation/product\";i:44;s:26:\"localisation/return_action\";i:45;s:26:\"localisation/return_reason\";i:46;s:26:\"localisation/return_status\";i:47;s:19:\"localisation/review\";i:48;s:18:\"localisation/state\";i:49;s:25:\"localisation/stock_status\";i:50;s:19:\"localisation/suburb\";i:51;s:22:\"localisation/tax_class\";i:52;s:21:\"localisation/tax_rate\";i:53;s:25:\"localisation/weight_class\";i:54;s:17:\"localisation/zone\";i:55;s:19:\"marketing/affiliate\";i:56;s:17:\"marketing/contact\";i:57;s:16:\"marketing/coupon\";i:58;s:19:\"marketing/marketing\";i:59;s:14:\"module/account\";i:60;s:16:\"module/affiliate\";i:61;s:20:\"module/amazon_button\";i:62;s:19:\"module/amazon_login\";i:63;s:17:\"module/amazon_pay\";i:64;s:13:\"module/banner\";i:65;s:17:\"module/bestseller\";i:66;s:15:\"module/carousel\";i:67;s:15:\"module/category\";i:68;s:19:\"module/ebay_listing\";i:69;s:15:\"module/featured\";i:70;s:13:\"module/filter\";i:71;s:22:\"module/google_hangouts\";i:72;s:11:\"module/html\";i:73;s:18:\"module/information\";i:74;s:13:\"module/latest\";i:75;s:16:\"module/pp_button\";i:76;s:15:\"module/pp_login\";i:77;s:16:\"module/slideshow\";i:78;s:14:\"module/special\";i:79;s:12:\"module/store\";i:80;s:14:\"openbay/amazon\";i:81;s:22:\"openbay/amazon_listing\";i:82;s:22:\"openbay/amazon_product\";i:83;s:16:\"openbay/amazonus\";i:84;s:24:\"openbay/amazonus_listing\";i:85;s:24:\"openbay/amazonus_product\";i:86;s:12:\"openbay/ebay\";i:87;s:20:\"openbay/ebay_profile\";i:88;s:21:\"openbay/ebay_template\";i:89;s:12:\"openbay/etsy\";i:90;s:20:\"openbay/etsy_product\";i:91;s:21:\"openbay/etsy_shipping\";i:92;s:17:\"openbay/etsy_shop\";i:93;s:23:\"payment/amazon_checkout\";i:94;s:24:\"payment/amazon_login_pay\";i:95;s:24:\"payment/authorizenet_aim\";i:96;s:24:\"payment/authorizenet_sim\";i:97;s:21:\"payment/bank_transfer\";i:98;s:22:\"payment/bluepay_hosted\";i:99;s:24:\"payment/bluepay_redirect\";i:100;s:14:\"payment/cheque\";i:101;s:11:\"payment/cod\";i:102;s:17:\"payment/firstdata\";i:103;s:24:\"payment/firstdata_remote\";i:104;s:21:\"payment/free_checkout\";i:105;s:14:\"payment/g2apay\";i:106;s:17:\"payment/globalpay\";i:107;s:24:\"payment/globalpay_remote\";i:108;s:22:\"payment/klarna_account\";i:109;s:22:\"payment/klarna_invoice\";i:110;s:14:\"payment/liqpay\";i:111;s:14:\"payment/nochex\";i:112;s:15:\"payment/paymate\";i:113;s:16:\"payment/paypoint\";i:114;s:13:\"payment/payza\";i:115;s:26:\"payment/perpetual_payments\";i:116;s:18:\"payment/pp_express\";i:117;s:18:\"payment/pp_payflow\";i:118;s:25:\"payment/pp_payflow_iframe\";i:119;s:14:\"payment/pp_pro\";i:120;s:21:\"payment/pp_pro_iframe\";i:121;s:19:\"payment/pp_standard\";i:122;s:14:\"payment/realex\";i:123;s:21:\"payment/realex_remote\";i:124;s:22:\"payment/sagepay_direct\";i:125;s:22:\"payment/sagepay_server\";i:126;s:18:\"payment/sagepay_us\";i:127;s:24:\"payment/securetrading_pp\";i:128;s:24:\"payment/securetrading_ws\";i:129;s:14:\"payment/skrill\";i:130;s:19:\"payment/twocheckout\";i:131;s:28:\"payment/web_payment_software\";i:132;s:16:\"payment/worldpay\";i:133;s:16:\"report/affiliate\";i:134;s:25:\"report/affiliate_activity\";i:135;s:22:\"report/affiliate_login\";i:136;s:24:\"report/customer_activity\";i:137;s:22:\"report/customer_credit\";i:138;s:21:\"report/customer_login\";i:139;s:22:\"report/customer_online\";i:140;s:21:\"report/customer_order\";i:141;s:22:\"report/customer_reward\";i:142;s:16:\"report/marketing\";i:143;s:24:\"report/product_purchased\";i:144;s:21:\"report/product_viewed\";i:145;s:18:\"report/sale_coupon\";i:146;s:17:\"report/sale_order\";i:147;s:18:\"report/sale_return\";i:148;s:20:\"report/sale_shipping\";i:149;s:15:\"report/sale_tax\";i:150;s:17:\"sale/custom_field\";i:151;s:13:\"sale/customer\";i:152;s:20:\"sale/customer_ban_ip\";i:153;s:19:\"sale/customer_group\";i:154;s:10:\"sale/order\";i:155;s:14:\"sale/recurring\";i:156;s:11:\"sale/return\";i:157;s:12:\"sale/voucher\";i:158;s:18:\"sale/voucher_theme\";i:159;s:15:\"setting/setting\";i:160;s:13:\"setting/store\";i:161;s:16:\"shipping/auspost\";i:162;s:17:\"shipping/citylink\";i:163;s:14:\"shipping/fedex\";i:164;s:13:\"shipping/flat\";i:165;s:13:\"shipping/free\";i:166;s:13:\"shipping/item\";i:167;s:23:\"shipping/parcelforce_48\";i:168;s:15:\"shipping/pickup\";i:169;s:19:\"shipping/royal_mail\";i:170;s:12:\"shipping/ups\";i:171;s:13:\"shipping/usps\";i:172;s:15:\"shipping/weight\";i:173;s:11:\"tool/backup\";i:174;s:14:\"tool/error_log\";i:175;s:11:\"tool/upload\";i:176;s:12:\"total/coupon\";i:177;s:12:\"total/credit\";i:178;s:14:\"total/handling\";i:179;s:16:\"total/klarna_fee\";i:180;s:19:\"total/low_order_fee\";i:181;s:12:\"total/reward\";i:182;s:14:\"total/shipping\";i:183;s:15:\"total/sub_total\";i:184;s:9:\"total/tax\";i:185;s:11:\"total/total\";i:186;s:13:\"total/voucher\";i:187;s:8:\"user/api\";i:188;s:9:\"user/user\";i:189;s:20:\"user/user_permission\";i:190;s:18:\"payment/pp_express\";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
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
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL DEFAULT '0',
  `suburb_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `state_id`, `suburb_id`, `geo_zone_id`, `fee`, `sort_order`, `date_added`, `date_modified`) VALUES
(129, 1, 2, 4, 1, '5.00', 1, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(128, 1, 2, 2, 1, '6.00', 2, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(127, 1, 2, 8, 1, '5.00', 3, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(126, 1, 2, 6, 1, '5.00', 4, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(125, 1, 2, 9, 1, '5.00', 5, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(124, 1, 2, 3, 1, '3.00', 6, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(123, 1, 2, 7, 1, '0.00', 7, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(122, 1, 2, 12, 1, '5.00', 8, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(121, 1, 2, 5, 1, '3.00', 9, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(120, 1, 2, 10, 1, '6.00', 10, '2017-07-03 12:14:10', '0000-00-00 00:00:00'),
(119, 1, 2, 11, 1, '8.00', 11, '2017-07-03 12:14:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `temp_orders`
--

CREATE TABLE `temp_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_number` varchar(50) NOT NULL,
  `order_list_string` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `temp_orders`
--

INSERT INTO `temp_orders` (`id`, `table_number`, `order_list_string`, `created_at`, `updated_at`) VALUES
(2417, 'A02', '[{\"item\":{\"product_id\":4,\"name\":\"\\u756a\\u8304\\u725b\\u5c3e\\u9505\",\"price\":\"10.80\",\"upc\":\"0104\",\"description\":null,\"image\":\"default_product.jpg\",\"choices\":[{\"type_id\":9998,\"type\":\"Option\",\"choices\":[{\"product_ext_id\":4195,\"name\":\"\\u8d70\\u9c7c\\u7247\",\"price\":\"0.00\",\"barcode\":\"E15\"},{\"product_ext_id\":4328,\"name\":\"\\u8d70\\u725b\\u5c3e\",\"price\":\"0.00\",\"barcode\":\"E29\"},{\"product_ext_id\":4194,\"name\":\"\\u8d70\\u8471\",\"price\":\"0.00\",\"barcode\":\"E14\"},{\"product_ext_id\":4108,\"name\":\"\\u7279\\u9ebb\",\"price\":\"0.00\",\"barcode\":\"E06\"},{\"product_ext_id\":4105,\"name\":\"\\u7279\\u8fa3\",\"price\":\"0.00\",\"barcode\":\"E03\"},{\"product_ext_id\":4104,\"name\":\"\\u52a0\\u9ebb\",\"price\":\"0.00\",\"barcode\":\"E02\"},{\"product_ext_id\":4103,\"name\":\"\\u52a0\\u8fa3\",\"price\":\"0.00\",\"barcode\":\"E01\"}],\"pickedChoice\":\"{\\\"product_ext_id\\\":4328,\\\"name\\\":\\\"\\u8d70\\u725b\\u5c3e\\\",\\\"price\\\":\\\"0.00\\\",\\\"barcode\\\":\\\"E29\\\"}\"}],\"options\":[]},\"quantity\":4}]', '2018-12-16 12:55:57', '2018-12-16 12:55:57');

-- --------------------------------------------------------

--
-- 表的结构 `temp_order_items`
--

CREATE TABLE `temp_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `oc_order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `temp_order_items`
--

INSERT INTO `temp_order_items` (`id`, `quantity`, `product_id`, `created_at`, `updated_at`, `order_id`, `oc_order_id`) VALUES
(1, 1, 4, '2018-12-16 14:03:03', '2018-12-16 14:03:03', 2417, NULL),
(2, 1, 7, '2018-12-16 14:08:35', '2018-12-16 14:08:35', 2417, NULL),
(3, 1, 5, '2018-12-16 14:09:17', '2018-12-16 14:09:17', 2417, NULL),
(4, 1, 6, '2018-12-16 14:16:04', '2018-12-16 14:16:04', 2417, NULL),
(5, 1, 6, '2018-12-16 14:17:02', '2018-12-16 14:17:02', 2417, NULL),
(6, 1, 6, '2018-12-16 14:18:02', '2018-12-16 14:18:02', 2417, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `temp_pickedchoices`
--

CREATE TABLE `temp_pickedchoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_ext_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `choice_type` varchar(255) NOT NULL,
  `picked_Choice` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `temp_pickedchoices`
--

INSERT INTO `temp_pickedchoices` (`id`, `product_ext_id`, `order_item_id`, `choice_type`, `picked_Choice`, `price`, `created_at`, `updated_at`) VALUES
(1, 5108, 3, 'Option', '特麻', 0, '2018-12-16 14:09:17', '2018-12-16 14:09:17'),
(2, 6108, 4, 'Option', '特麻', 0, '2018-12-16 14:16:04', '2018-12-16 14:16:04'),
(3, 6108, 5, 'Option', '特麻', 0, '2018-12-16 14:17:02', '2018-12-16 14:17:02'),
(4, 6108, 6, 'Option', '特麻', 0, '2018-12-16 14:18:02', '2018-12-16 14:18:02');

-- --------------------------------------------------------

--
-- 表的结构 `temp_pickedoptions`
--

CREATE TABLE `temp_pickedoptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `pickedOption` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- 表的索引 `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- 表的索引 `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- 表的索引 `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- 表的索引 `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- 表的索引 `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- 表的索引 `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- 表的索引 `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- 表的索引 `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- 表的索引 `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- 表的索引 `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- 表的索引 `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- 表的索引 `oc_banner_image_description`
--
ALTER TABLE `oc_banner_image_description`
  ADD PRIMARY KEY (`banner_image_id`,`language_id`);

--
-- 表的索引 `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- 表的索引 `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- 表的索引 `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- 表的索引 `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- 表的索引 `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- 表的索引 `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- 表的索引 `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- 表的索引 `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- 表的索引 `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- 表的索引 `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- 表的索引 `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- 表的索引 `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- 表的索引 `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- 表的索引 `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- 表的索引 `oc_customer_ban_ip`
--
ALTER TABLE `oc_customer_ban_ip`
  ADD PRIMARY KEY (`customer_ban_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- 表的索引 `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- 表的索引 `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- 表的索引 `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- 表的索引 `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- 表的索引 `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- 表的索引 `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- 表的索引 `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- 表的索引 `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- 表的索引 `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- 表的索引 `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- 表的索引 `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- 表的索引 `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- 表的索引 `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- 表的索引 `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- 表的索引 `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- 表的索引 `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- 表的索引 `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- 表的索引 `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- 表的索引 `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- 表的索引 `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- 表的索引 `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- 表的索引 `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- 表的索引 `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- 表的索引 `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- 表的索引 `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- 表的索引 `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- 表的索引 `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- 表的索引 `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- 表的索引 `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- 表的索引 `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- 表的索引 `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- 表的索引 `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- 表的索引 `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- 表的索引 `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- 表的索引 `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- 表的索引 `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- 表的索引 `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- 表的索引 `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- 表的索引 `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- 表的索引 `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- 表的索引 `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- 表的索引 `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- 表的索引 `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- 表的索引 `oc_order_coupon`
--
ALTER TABLE `oc_order_coupon`
  ADD PRIMARY KEY (`order_coupon_id`);

--
-- 表的索引 `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- 表的索引 `oc_order_ext`
--
ALTER TABLE `oc_order_ext`
  ADD PRIMARY KEY (`order_ext_id`);

--
-- 表的索引 `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- 表的索引 `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- 表的索引 `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- 表的索引 `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- 表的索引 `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- 表的索引 `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- 表的索引 `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 表的索引 `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- 表的索引 `oc_paypal_order`
--
ALTER TABLE `oc_paypal_order`
  ADD PRIMARY KEY (`paypal_order_id`);

--
-- 表的索引 `oc_paypal_order_transaction`
--
ALTER TABLE `oc_paypal_order_transaction`
  ADD PRIMARY KEY (`paypal_order_transaction_id`);

--
-- 表的索引 `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- 表的索引 `oc_product_add_type`
--
ALTER TABLE `oc_product_add_type`
  ADD PRIMARY KEY (`add_type_id`);

--
-- 表的索引 `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- 表的索引 `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- 表的索引 `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 表的索引 `oc_product_ext`
--
ALTER TABLE `oc_product_ext`
  ADD PRIMARY KEY (`product_ext_id`);

--
-- 表的索引 `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- 表的索引 `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 表的索引 `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- 表的索引 `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- 表的索引 `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- 表的索引 `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- 表的索引 `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- 表的索引 `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 表的索引 `oc_product_tag`
--
ALTER TABLE `oc_product_tag`
  ADD PRIMARY KEY (`product_tag_id`);

--
-- 表的索引 `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- 表的索引 `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- 表的索引 `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- 表的索引 `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- 表的索引 `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- 表的索引 `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- 表的索引 `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- 表的索引 `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- 表的索引 `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- 表的索引 `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- 表的索引 `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- 表的索引 `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 表的索引 `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- 表的索引 `oc_shop_coupon`
--
ALTER TABLE `oc_shop_coupon`
  ADD PRIMARY KEY (`shop_coupon_id`);

--
-- 表的索引 `oc_shop_coupon_product`
--
ALTER TABLE `oc_shop_coupon_product`
  ADD PRIMARY KEY (`product_id`);

--
-- 表的索引 `oc_shop_image`
--
ALTER TABLE `oc_shop_image`
  ADD PRIMARY KEY (`shop_image_id`),
  ADD KEY `shop_id` (`location_id`);

--
-- 表的索引 `oc_shop_info`
--
ALTER TABLE `oc_shop_info`
  ADD PRIMARY KEY (`shop_info_id`);

--
-- 表的索引 `oc_shop_tag`
--
ALTER TABLE `oc_shop_tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- 表的索引 `oc_shop_time`
--
ALTER TABLE `oc_shop_time`
  ADD PRIMARY KEY (`shop_time_id`);

--
-- 表的索引 `oc_state`
--
ALTER TABLE `oc_state`
  ADD PRIMARY KEY (`state_id`);

--
-- 表的索引 `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- 表的索引 `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- 表的索引 `oc_suburb`
--
ALTER TABLE `oc_suburb`
  ADD PRIMARY KEY (`suburb_id`);

--
-- 表的索引 `oc_table_link`
--
ALTER TABLE `oc_table_link`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `table_link` (`table_link`,`status`);

--
-- 表的索引 `oc_table_linksub`
--
ALTER TABLE `oc_table_linksub`
  ADD PRIMARY KEY (`link_id`,`linksub_id`),
  ADD KEY `table_linksub` (`downloaded`,`sub_status`,`client_ip`,`order_id`);

--
-- 表的索引 `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- 表的索引 `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- 表的索引 `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- 表的索引 `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- 表的索引 `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- 表的索引 `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- 表的索引 `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- 表的索引 `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- 表的索引 `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- 表的索引 `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- 表的索引 `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- 表的索引 `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- 表的索引 `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- 表的索引 `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- 表的索引 `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- 表的索引 `temp_orders`
--
ALTER TABLE `temp_orders`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `temp_order_items`
--
ALTER TABLE `temp_order_items`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `temp_pickedchoices`
--
ALTER TABLE `temp_pickedchoices`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `temp_pickedoptions`
--
ALTER TABLE `temp_pickedoptions`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- 使用表AUTO_INCREMENT `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- 使用表AUTO_INCREMENT `oc_customer_ban_ip`
--
ALTER TABLE `oc_customer_ban_ip`
  MODIFY `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- 使用表AUTO_INCREMENT `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- 使用表AUTO_INCREMENT `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用表AUTO_INCREMENT `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- 使用表AUTO_INCREMENT `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_coupon`
--
ALTER TABLE `oc_order_coupon`
  MODIFY `order_coupon_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_ext`
--
ALTER TABLE `oc_order_ext`
  MODIFY `order_ext_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_paypal_order`
--
ALTER TABLE `oc_paypal_order`
  MODIFY `paypal_order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_paypal_order_transaction`
--
ALTER TABLE `oc_paypal_order_transaction`
  MODIFY `paypal_order_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- 使用表AUTO_INCREMENT `oc_product_add_type`
--
ALTER TABLE `oc_product_add_type`
  MODIFY `add_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9999;

--
-- 使用表AUTO_INCREMENT `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_product_ext`
--
ALTER TABLE `oc_product_ext`
  MODIFY `product_ext_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329164;

--
-- 使用表AUTO_INCREMENT `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- 使用表AUTO_INCREMENT `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_product_tag`
--
ALTER TABLE `oc_product_tag`
  MODIFY `product_tag_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '属性id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5662;

--
-- 使用表AUTO_INCREMENT `oc_shop_coupon`
--
ALTER TABLE `oc_shop_coupon`
  MODIFY `shop_coupon_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `oc_shop_coupon_product`
--
ALTER TABLE `oc_shop_coupon_product`
  MODIFY `product_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `oc_shop_image`
--
ALTER TABLE `oc_shop_image`
  MODIFY `shop_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=865;

--
-- 使用表AUTO_INCREMENT `oc_shop_info`
--
ALTER TABLE `oc_shop_info`
  MODIFY `shop_info_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- 使用表AUTO_INCREMENT `oc_shop_tag`
--
ALTER TABLE `oc_shop_tag`
  MODIFY `tag_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id', AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `oc_shop_time`
--
ALTER TABLE `oc_shop_time`
  MODIFY `shop_time_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '时间表id', AUTO_INCREMENT=116;

--
-- 使用表AUTO_INCREMENT `oc_state`
--
ALTER TABLE `oc_state`
  MODIFY `state_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_suburb`
--
ALTER TABLE `oc_suburb`
  MODIFY `suburb_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `oc_table_link`
--
ALTER TABLE `oc_table_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用表AUTO_INCREMENT `oc_table_linksub`
--
ALTER TABLE `oc_table_linksub`
  MODIFY `linksub_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- 使用表AUTO_INCREMENT `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=948;

--
-- 使用表AUTO_INCREMENT `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- 使用表AUTO_INCREMENT `temp_orders`
--
ALTER TABLE `temp_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2418;

--
-- 使用表AUTO_INCREMENT `temp_order_items`
--
ALTER TABLE `temp_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `temp_pickedchoices`
--
ALTER TABLE `temp_pickedchoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `temp_pickedoptions`
--
ALTER TABLE `temp_pickedoptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
