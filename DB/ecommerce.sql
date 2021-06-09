-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2021 at 06:19 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT 1,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'admin@email.com', '$2y$10$kWxHZoXuhxBiFY/vdokU0u9REwpd7EWV7kekYFaS6Kd9ro6fLwK4S', '65756756', 1, '1', '2020-10-28 12:11:44', '2021-01-31 04:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `key_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_taxonomies`
--

CREATE TABLE `attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_taxonomies`
--

INSERT INTO `attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `status`, `attribute_public`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'color', 'select', 'menu_order', 1, 1, '2021-01-28 16:16:54', '2021-01-28 16:16:54'),
(2, 'Size', 'size', 'select', 'menu_order', 1, 1, '2021-01-28 16:17:41', '2021-01-28 16:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `expire_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_amount`, `coupon_type`, `expire_date`, `status`, `created_at`, `updated_at`) VALUES
(2, '65', '100', '1', '2021-02-03', 1, NULL, NULL),
(3, '85', '10', '2', '2021-02-03', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_termmeta`
--

CREATE TABLE `ecommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL,
  `ecommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_07_11_100407_create_admins_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 2),
(5, '2020_09_14_100203_create_wishlist', 2),
(10, '2020_10_28_105612_create_roles_table', 3),
(11, '2020_10_28_105713_create_permissions_table', 3),
(12, '2020_10_28_152329_create_permissions_table', 4),
(13, '2020_10_28_152345_create_roles_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'Delivery Condition', '4000', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `order_itemmeta`
--

CREATE TABLE `order_itemmeta` (
  `meta_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_itemmeta`
--

INSERT INTO `order_itemmeta` (`meta_id`, `order_item_id`, `meta_key`, `meta_value`, `order_id`, `order_date`, `customer_id`, `product_id`, `product_parent`) VALUES
(1, 1, '_tax_class', '', '7', '2021-01-28', '1', '5', '5'),
(2, 1, '_qty', '1', '7', '2021-01-28', '1', '5', '5'),
(3, 1, '_product_id', '5', '7', '2021-01-28', '1', '5', '5'),
(4, 1, '_variation_id', '', '7', '2021-01-28', '1', '5', '5'),
(5, 1, '_line_subtotal', '375', '7', '2021-01-28', '1', '5', '5'),
(6, 1, '_line_total', '375', '7', '2021-01-28', '1', '5', '5'),
(7, 1, '_line_subtotal_tax', '', '7', '2021-01-28', '1', '5', '5'),
(8, 1, '_line_tax', '', '7', '2021-01-28', '1', '5', '5'),
(9, 1, '_line_tax_data', '2021-01-28 23:35:38', '7', '2021-01-28', '1', '5', '5'),
(10, 1, 'delivery_charge', '100', '7', '2021-01-28', '1', '5', '5'),
(11, 1, 'coupon_code', NULL, '7', '2021-01-28', '1', '5', '5'),
(12, 1, 'coupon_taka', '0', '7', '2021-01-28', '1', '5', '5'),
(13, 1, 'attribute_parent', '5', '7', '2021-01-28', '1', '5', '5'),
(14, 1, 'user_district', 'Dhaka', '7', '2021-01-28', '1', '5', '5'),
(15, 1, 'user_city', 'Rampura', '7', '2021-01-28', '1', '5', '5'),
(16, 1, 'user_zip', '1400', '7', '2021-01-28', '1', '5', '5'),
(17, 2, '_tax_class', '', '10', '2021-01-28', '1', '4', '4'),
(18, 2, '_qty', '1', '10', '2021-01-28', '1', '4', '4'),
(19, 2, '_product_id', '4', '10', '2021-01-28', '1', '4', '4'),
(20, 2, '_variation_id', '', '10', '2021-01-28', '1', '4', '4'),
(21, 2, '_line_subtotal', '275', '10', '2021-01-28', '1', '4', '4'),
(22, 2, '_line_total', '275', '10', '2021-01-28', '1', '4', '4'),
(23, 2, '_line_subtotal_tax', '', '10', '2021-01-28', '1', '4', '4'),
(24, 2, '_line_tax', '', '10', '2021-01-28', '1', '4', '4'),
(25, 2, '_line_tax_data', '2021-01-28 23:43:31', '10', '2021-01-28', '1', '4', '4'),
(26, 2, 'delivery_charge', '100', '10', '2021-01-28', '1', '4', '4'),
(27, 2, 'coupon_code', NULL, '10', '2021-01-28', '1', '4', '4'),
(28, 2, 'coupon_taka', '0', '10', '2021-01-28', '1', '4', '4'),
(29, 2, 'attribute_parent', '4', '10', '2021-01-28', '1', '4', '4'),
(30, 2, 'user_district', 'Dhaka', '10', '2021-01-28', '1', '4', '4'),
(31, 2, 'user_city', 'Rampura', '10', '2021-01-28', '1', '4', '4'),
(32, 2, 'user_zip', '1400', '10', '2021-01-28', '1', '4', '4'),
(33, 3, '_tax_class', '', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(34, 3, '_qty', '1', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(35, 3, '_product_id', '14', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(36, 3, '_variation_id', '', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(37, 3, '_line_subtotal', '320', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(38, 3, '_line_total', '320', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(39, 3, '_line_subtotal_tax', '', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(40, 3, '_line_tax', '', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(41, 3, '_line_tax_data', '2021-01-31 19:28:48', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(42, 3, 'delivery_charge', '200', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(43, 3, 'coupon_code', 'Offer', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(44, 3, 'coupon_taka', '100', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(45, 3, 'attribute_parent', '14', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(46, 3, 'user_district', 'Chitagong', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(47, 3, 'user_city', 'Bayazid Thana', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(48, 3, 'user_zip', '2100', '19', '2021-01-31', 'f4ouoej6ovd1uu4ksc5u3tq6d8', '14', '14'),
(49, 4, '_tax_class', '', '22', '2021-01-31', '1', '13', '13'),
(50, 4, '_qty', '4', '22', '2021-01-31', '1', '13', '13'),
(51, 4, '_product_id', '13', '22', '2021-01-31', '1', '13', '13'),
(52, 4, '_variation_id', '', '22', '2021-01-31', '1', '13', '13'),
(53, 4, '_line_subtotal', '720', '22', '2021-01-31', '1', '13', '13'),
(54, 4, '_line_total', '720', '22', '2021-01-31', '1', '13', '13'),
(55, 4, '_line_subtotal_tax', '', '22', '2021-01-31', '1', '13', '13'),
(56, 4, '_line_tax', '', '22', '2021-01-31', '1', '13', '13'),
(57, 4, '_line_tax_data', '2021-01-31 19:47:11', '22', '2021-01-31', '1', '13', '13'),
(58, 4, 'delivery_charge', '200', '22', '2021-01-31', '1', '13', '13'),
(59, 4, 'coupon_code', 'Offer', '22', '2021-01-31', '1', '13', '13'),
(60, 4, 'coupon_taka', '100', '22', '2021-01-31', '1', '13', '13'),
(61, 4, 'attribute_parent', '13', '22', '2021-01-31', '1', '13', '13'),
(62, 4, 'user_district', 'Chitagong', '22', '2021-01-31', '1', '13', '13'),
(63, 4, 'user_city', 'Bayazid Thana', '22', '2021-01-31', '1', '13', '13'),
(64, 4, 'user_zip', '2100', '22', '2021-01-31', '1', '13', '13'),
(65, 5, '_tax_class', '', '26', '2021-01-31', '5', '13', '13'),
(66, 5, '_qty', '1', '26', '2021-01-31', '5', '13', '13'),
(67, 5, '_product_id', '13', '26', '2021-01-31', '5', '13', '13'),
(68, 5, '_variation_id', '', '26', '2021-01-31', '5', '13', '13'),
(69, 5, '_line_subtotal', '180', '26', '2021-01-31', '5', '13', '13'),
(70, 5, '_line_total', '180', '26', '2021-01-31', '5', '13', '13'),
(71, 5, '_line_subtotal_tax', '', '26', '2021-01-31', '5', '13', '13'),
(72, 5, '_line_tax', '', '26', '2021-01-31', '5', '13', '13'),
(73, 5, '_line_tax_data', '2021-01-31 22:57:43', '26', '2021-01-31', '5', '13', '13'),
(74, 5, 'delivery_charge', '200', '26', '2021-01-31', '5', '13', '13'),
(75, 5, 'coupon_code', 'Offer', '26', '2021-01-31', '5', '13', '13'),
(76, 5, 'coupon_taka', '100', '26', '2021-01-31', '5', '13', '13'),
(77, 5, 'attribute_parent', '13', '26', '2021-01-31', '5', '13', '13'),
(78, 5, 'user_district', 'Chitagong', '26', '2021-01-31', '5', '13', '13'),
(79, 5, 'user_city', 'Bayazid Thana', '26', '2021-01-31', '5', '13', '13'),
(80, 5, 'user_zip', '2100', '26', '2021-01-31', '5', '13', '13'),
(81, 6, '_tax_class', '', '26', '2021-01-31', '5', '14', '14'),
(82, 6, '_qty', '1', '26', '2021-01-31', '5', '14', '14'),
(83, 6, '_product_id', '14', '26', '2021-01-31', '5', '14', '14'),
(84, 6, '_variation_id', '', '26', '2021-01-31', '5', '14', '14'),
(85, 6, '_line_subtotal', '320', '26', '2021-01-31', '5', '14', '14'),
(86, 6, '_line_total', '320', '26', '2021-01-31', '5', '14', '14'),
(87, 6, '_line_subtotal_tax', '', '26', '2021-01-31', '5', '14', '14'),
(88, 6, '_line_tax', '', '26', '2021-01-31', '5', '14', '14'),
(89, 6, '_line_tax_data', '2021-01-31 22:57:43', '26', '2021-01-31', '5', '14', '14'),
(90, 6, 'delivery_charge', '200', '26', '2021-01-31', '5', '14', '14'),
(91, 6, 'coupon_code', 'Offer', '26', '2021-01-31', '5', '14', '14'),
(92, 6, 'coupon_taka', '100', '26', '2021-01-31', '5', '14', '14'),
(93, 6, 'attribute_parent', '14', '26', '2021-01-31', '5', '14', '14'),
(94, 6, 'user_district', 'Chitagong', '26', '2021-01-31', '5', '14', '14'),
(95, 6, 'user_city', 'Bayazid Thana', '26', '2021-01-31', '5', '14', '14'),
(96, 6, 'user_zip', '2100', '26', '2021-01-31', '5', '14', '14'),
(97, 7, '_tax_class', '', '26', '2021-01-31', '5', '5', '5'),
(98, 7, '_qty', '1', '26', '2021-01-31', '5', '5', '5'),
(99, 7, '_product_id', '5', '26', '2021-01-31', '5', '5', '5'),
(100, 7, '_variation_id', '', '26', '2021-01-31', '5', '5', '5'),
(101, 7, '_line_subtotal', '375', '26', '2021-01-31', '5', '5', '5'),
(102, 7, '_line_total', '375', '26', '2021-01-31', '5', '5', '5'),
(103, 7, '_line_subtotal_tax', '', '26', '2021-01-31', '5', '5', '5'),
(104, 7, '_line_tax', '', '26', '2021-01-31', '5', '5', '5'),
(105, 7, '_line_tax_data', '2021-01-31 22:57:43', '26', '2021-01-31', '5', '5', '5'),
(106, 7, 'delivery_charge', '200', '26', '2021-01-31', '5', '5', '5'),
(107, 7, 'coupon_code', 'Offer', '26', '2021-01-31', '5', '5', '5'),
(108, 7, 'coupon_taka', '100', '26', '2021-01-31', '5', '5', '5'),
(109, 7, 'attribute_parent', '5', '26', '2021-01-31', '5', '5', '5'),
(110, 7, 'user_district', 'Chitagong', '26', '2021-01-31', '5', '5', '5'),
(111, 7, 'user_city', 'Bayazid Thana', '26', '2021-01-31', '5', '5', '5'),
(112, 7, 'user_zip', '2100', '26', '2021-01-31', '5', '5', '5'),
(113, 8, '_tax_class', '', '26', '2021-01-31', '5', '2', '2'),
(114, 8, '_qty', '1', '26', '2021-01-31', '5', '2', '2'),
(115, 8, '_product_id', '2', '26', '2021-01-31', '5', '2', '2'),
(116, 8, '_variation_id', '', '26', '2021-01-31', '5', '2', '2'),
(117, 8, '_line_subtotal', '580', '26', '2021-01-31', '5', '2', '2'),
(118, 8, '_line_total', '580', '26', '2021-01-31', '5', '2', '2'),
(119, 8, '_line_subtotal_tax', '', '26', '2021-01-31', '5', '2', '2'),
(120, 8, '_line_tax', '', '26', '2021-01-31', '5', '2', '2'),
(121, 8, '_line_tax_data', '2021-01-31 22:57:43', '26', '2021-01-31', '5', '2', '2'),
(122, 8, 'delivery_charge', '200', '26', '2021-01-31', '5', '2', '2'),
(123, 8, 'coupon_code', 'Offer', '26', '2021-01-31', '5', '2', '2'),
(124, 8, 'coupon_taka', '100', '26', '2021-01-31', '5', '2', '2'),
(125, 8, 'attribute_parent', '2', '26', '2021-01-31', '5', '2', '2'),
(126, 8, 'user_district', 'Chitagong', '26', '2021-01-31', '5', '2', '2'),
(127, 8, 'user_city', 'Bayazid Thana', '26', '2021-01-31', '5', '2', '2'),
(128, 8, 'user_zip', '2100', '26', '2021-01-31', '5', '2', '2'),
(129, 9, '_tax_class', '', '27', '2021-01-31', '2', '14', '14'),
(130, 9, '_qty', '0', '27', '2021-01-31', '2', '14', '14'),
(131, 9, '_product_id', '14', '27', '2021-01-31', '2', '14', '14'),
(132, 9, '_variation_id', '', '27', '2021-01-31', '2', '14', '14'),
(133, 9, '_line_subtotal', '0', '27', '2021-01-31', '2', '14', '14'),
(134, 9, '_line_total', '320', '27', '2021-01-31', '2', '14', '14'),
(135, 9, '_line_subtotal_tax', '', '27', '2021-01-31', '2', '14', '14'),
(136, 9, '_line_tax', '', '27', '2021-01-31', '2', '14', '14'),
(137, 9, '_line_tax_data', '2021-01-31 23:03:52', '27', '2021-01-31', '2', '14', '14'),
(138, 9, 'delivery_charge', '100', '27', '2021-01-31', '2', '14', '14'),
(139, 9, 'coupon_code', 'Offer', '27', '2021-01-31', '2', '14', '14'),
(140, 9, 'coupon_taka', '0', '27', '2021-01-31', '2', '14', '14'),
(141, 9, 'attribute_parent', '14', '27', '2021-01-31', '2', '14', '14'),
(142, 9, 'user_district', 'Dhaka', '27', '2021-01-31', '2', '14', '14'),
(143, 9, 'user_city', 'Rampura', '27', '2021-01-31', '2', '14', '14'),
(144, 9, 'user_zip', '1400', '27', '2021-01-31', '2', '14', '14'),
(145, 10, '_tax_class', '', '27', '2021-01-31', '2', '1', '1'),
(146, 10, '_qty', '0', '27', '2021-01-31', '2', '1', '1'),
(147, 10, '_product_id', '1', '27', '2021-01-31', '2', '1', '1'),
(148, 10, '_variation_id', '', '27', '2021-01-31', '2', '1', '1'),
(149, 10, '_line_subtotal', '0', '27', '2021-01-31', '2', '1', '1'),
(150, 10, '_line_total', '80', '27', '2021-01-31', '2', '1', '1'),
(151, 10, '_line_subtotal_tax', '', '27', '2021-01-31', '2', '1', '1'),
(152, 10, '_line_tax', '', '27', '2021-01-31', '2', '1', '1'),
(153, 10, '_line_tax_data', '2021-01-31 23:03:52', '27', '2021-01-31', '2', '1', '1'),
(154, 10, 'delivery_charge', '100', '27', '2021-01-31', '2', '1', '1'),
(155, 10, 'coupon_code', 'Offer', '27', '2021-01-31', '2', '1', '1'),
(156, 10, 'coupon_taka', '0', '27', '2021-01-31', '2', '1', '1'),
(157, 10, 'attribute_parent', '1', '27', '2021-01-31', '2', '1', '1'),
(158, 10, 'user_district', 'Dhaka', '27', '2021-01-31', '2', '1', '1'),
(159, 10, 'user_city', 'Rampura', '27', '2021-01-31', '2', '1', '1'),
(160, 10, 'user_zip', '1400', '27', '2021-01-31', '2', '1', '1'),
(161, 11, '_tax_class', '', '27', '2021-01-31', '2', '6', '6'),
(162, 11, '_qty', '0', '27', '2021-01-31', '2', '6', '6'),
(163, 11, '_product_id', '6', '27', '2021-01-31', '2', '6', '6'),
(164, 11, '_variation_id', '', '27', '2021-01-31', '2', '6', '6'),
(165, 11, '_line_subtotal', '0', '27', '2021-01-31', '2', '6', '6'),
(166, 11, '_line_total', '100', '27', '2021-01-31', '2', '6', '6'),
(167, 11, '_line_subtotal_tax', '', '27', '2021-01-31', '2', '6', '6'),
(168, 11, '_line_tax', '', '27', '2021-01-31', '2', '6', '6'),
(169, 11, '_line_tax_data', '2021-01-31 23:03:52', '27', '2021-01-31', '2', '6', '6'),
(170, 11, 'delivery_charge', '100', '27', '2021-01-31', '2', '6', '6'),
(171, 11, 'coupon_code', 'Offer', '27', '2021-01-31', '2', '6', '6'),
(172, 11, 'coupon_taka', '0', '27', '2021-01-31', '2', '6', '6'),
(173, 11, 'attribute_parent', '6', '27', '2021-01-31', '2', '6', '6'),
(174, 11, 'user_district', 'Dhaka', '27', '2021-01-31', '2', '6', '6'),
(175, 11, 'user_city', 'Rampura', '27', '2021-01-31', '2', '6', '6'),
(176, 11, 'user_zip', '1400', '27', '2021-01-31', '2', '6', '6'),
(177, 12, '_tax_class', '', '28', '2021-01-31', '2', '2', '2'),
(178, 12, '_qty', '0', '28', '2021-01-31', '2', '2', '2'),
(179, 12, '_product_id', '2', '28', '2021-01-31', '2', '2', '2'),
(180, 12, '_variation_id', '', '28', '2021-01-31', '2', '2', '2'),
(181, 12, '_line_subtotal', '0', '28', '2021-01-31', '2', '2', '2'),
(182, 12, '_line_total', '580', '28', '2021-01-31', '2', '2', '2'),
(183, 12, '_line_subtotal_tax', '', '28', '2021-01-31', '2', '2', '2'),
(184, 12, '_line_tax', '', '28', '2021-01-31', '2', '2', '2'),
(185, 12, '_line_tax_data', '2021-01-31 23:11:43', '28', '2021-01-31', '2', '2', '2'),
(186, 12, 'delivery_charge', '100', '28', '2021-01-31', '2', '2', '2'),
(187, 12, 'coupon_code', 'Offer', '28', '2021-01-31', '2', '2', '2'),
(188, 12, 'coupon_taka', '0', '28', '2021-01-31', '2', '2', '2'),
(189, 12, 'attribute_parent', '2', '28', '2021-01-31', '2', '2', '2'),
(190, 12, 'user_district', 'Dhaka', '28', '2021-01-31', '2', '2', '2'),
(191, 12, 'user_city', 'Rampura', '28', '2021-01-31', '2', '2', '2'),
(192, 12, 'user_zip', '1400', '28', '2021-01-31', '2', '2', '2'),
(193, 13, '_tax_class', '', '28', '2021-01-31', '2', '3', '3'),
(194, 13, '_qty', '0', '28', '2021-01-31', '2', '3', '3'),
(195, 13, '_product_id', '3', '28', '2021-01-31', '2', '3', '3'),
(196, 13, '_variation_id', '', '28', '2021-01-31', '2', '3', '3'),
(197, 13, '_line_subtotal', '0', '28', '2021-01-31', '2', '3', '3'),
(198, 13, '_line_total', '300', '28', '2021-01-31', '2', '3', '3'),
(199, 13, '_line_subtotal_tax', '', '28', '2021-01-31', '2', '3', '3'),
(200, 13, '_line_tax', '', '28', '2021-01-31', '2', '3', '3'),
(201, 13, '_line_tax_data', '2021-01-31 23:11:43', '28', '2021-01-31', '2', '3', '3'),
(202, 13, 'delivery_charge', '100', '28', '2021-01-31', '2', '3', '3'),
(203, 13, 'coupon_code', 'Offer', '28', '2021-01-31', '2', '3', '3'),
(204, 13, 'coupon_taka', '0', '28', '2021-01-31', '2', '3', '3'),
(205, 13, 'attribute_parent', '3', '28', '2021-01-31', '2', '3', '3'),
(206, 13, 'user_district', 'Dhaka', '28', '2021-01-31', '2', '3', '3'),
(207, 13, 'user_city', 'Rampura', '28', '2021-01-31', '2', '3', '3'),
(208, 13, 'user_zip', '1400', '28', '2021-01-31', '2', '3', '3'),
(209, 14, '_tax_class', '', '29', '2021-01-31', '2', '5', '5'),
(210, 14, '_qty', '2', '29', '2021-01-31', '2', '5', '5'),
(211, 14, '_product_id', '5', '29', '2021-01-31', '2', '5', '5'),
(212, 14, '_variation_id', '', '29', '2021-01-31', '2', '5', '5'),
(213, 14, '_line_subtotal', '750', '29', '2021-01-31', '2', '5', '5'),
(214, 14, '_line_total', '750', '29', '2021-01-31', '2', '5', '5'),
(215, 14, '_line_subtotal_tax', '', '29', '2021-01-31', '2', '5', '5'),
(216, 14, '_line_tax', '', '29', '2021-01-31', '2', '5', '5'),
(217, 14, '_line_tax_data', '2021-01-31 23:17:34', '29', '2021-01-31', '2', '5', '5'),
(218, 14, 'delivery_charge', '200', '29', '2021-01-31', '2', '5', '5'),
(219, 14, 'coupon_code', '65', '29', '2021-01-31', '2', '5', '5'),
(220, 14, 'coupon_taka', '100', '29', '2021-01-31', '2', '5', '5'),
(221, 14, 'attribute_parent', '5', '29', '2021-01-31', '2', '5', '5'),
(222, 14, 'user_district', 'Chitagong', '29', '2021-01-31', '2', '5', '5'),
(223, 14, 'user_city', 'Bayazid Thana', '29', '2021-01-31', '2', '5', '5'),
(224, 14, 'user_zip', '2100', '29', '2021-01-31', '2', '5', '5'),
(225, 15, '_tax_class', '', '29', '2021-01-31', '2', '6', '6'),
(226, 15, '_qty', '1', '29', '2021-01-31', '2', '6', '6'),
(227, 15, '_product_id', '6', '29', '2021-01-31', '2', '6', '6'),
(228, 15, '_variation_id', '', '29', '2021-01-31', '2', '6', '6'),
(229, 15, '_line_subtotal', '100', '29', '2021-01-31', '2', '6', '6'),
(230, 15, '_line_total', '100', '29', '2021-01-31', '2', '6', '6'),
(231, 15, '_line_subtotal_tax', '', '29', '2021-01-31', '2', '6', '6'),
(232, 15, '_line_tax', '', '29', '2021-01-31', '2', '6', '6'),
(233, 15, '_line_tax_data', '2021-01-31 23:17:34', '29', '2021-01-31', '2', '6', '6'),
(234, 15, 'delivery_charge', '200', '29', '2021-01-31', '2', '6', '6'),
(235, 15, 'coupon_code', '65', '29', '2021-01-31', '2', '6', '6'),
(236, 15, 'coupon_taka', '100', '29', '2021-01-31', '2', '6', '6'),
(237, 15, 'attribute_parent', '6', '29', '2021-01-31', '2', '6', '6'),
(238, 15, 'user_district', 'Chitagong', '29', '2021-01-31', '2', '6', '6'),
(239, 15, 'user_city', 'Bayazid Thana', '29', '2021-01-31', '2', '6', '6'),
(240, 15, 'user_zip', '2100', '29', '2021-01-31', '2', '6', '6'),
(241, 16, '_tax_class', '', '30', '2021-01-31', '2', '14', '14'),
(242, 16, '_qty', '0', '30', '2021-01-31', '2', '14', '14'),
(243, 16, '_product_id', '14', '30', '2021-01-31', '2', '14', '14'),
(244, 16, '_variation_id', '', '30', '2021-01-31', '2', '14', '14'),
(245, 16, '_line_subtotal', '0', '30', '2021-01-31', '2', '14', '14'),
(246, 16, '_line_total', '0', '30', '2021-01-31', '2', '14', '14'),
(247, 16, '_line_subtotal_tax', '', '30', '2021-01-31', '2', '14', '14'),
(248, 16, '_line_tax', '', '30', '2021-01-31', '2', '14', '14'),
(249, 16, '_line_tax_data', '2021-01-31 23:28:19', '30', '2021-01-31', '2', '14', '14'),
(250, 16, 'delivery_charge', '0', '30', '2021-01-31', '2', '14', '14'),
(251, 16, 'coupon_code', '85', '30', '2021-01-31', '2', '14', '14'),
(252, 16, 'coupon_taka', '790', '30', '2021-01-31', '2', '14', '14'),
(253, 16, 'attribute_parent', '14', '30', '2021-01-31', '2', '14', '14'),
(254, 16, 'user_district', 'Dhaka', '30', '2021-01-31', '2', '14', '14'),
(255, 16, 'user_city', 'Rampura', '30', '2021-01-31', '2', '14', '14'),
(256, 16, 'user_zip', '1400', '30', '2021-01-31', '2', '14', '14'),
(257, 17, '_tax_class', '', '30', '2021-01-31', '2', '1', '1'),
(258, 17, '_qty', '65', '30', '2021-01-31', '2', '1', '1'),
(259, 17, '_product_id', '1', '30', '2021-01-31', '2', '1', '1'),
(260, 17, '_variation_id', '', '30', '2021-01-31', '2', '1', '1'),
(261, 17, '_line_subtotal', '5200', '30', '2021-01-31', '2', '1', '1'),
(262, 17, '_line_total', '5200', '30', '2021-01-31', '2', '1', '1'),
(263, 17, '_line_subtotal_tax', '', '30', '2021-01-31', '2', '1', '1'),
(264, 17, '_line_tax', '', '30', '2021-01-31', '2', '1', '1'),
(265, 17, '_line_tax_data', '2021-01-31 23:28:19', '30', '2021-01-31', '2', '1', '1'),
(266, 17, 'delivery_charge', '0', '30', '2021-01-31', '2', '1', '1'),
(267, 17, 'coupon_code', '85', '30', '2021-01-31', '2', '1', '1'),
(268, 17, 'coupon_taka', '790', '30', '2021-01-31', '2', '1', '1'),
(269, 17, 'attribute_parent', '1', '30', '2021-01-31', '2', '1', '1'),
(270, 17, 'user_district', 'Dhaka', '30', '2021-01-31', '2', '1', '1'),
(271, 17, 'user_city', 'Rampura', '30', '2021-01-31', '2', '1', '1'),
(272, 17, 'user_zip', '1400', '30', '2021-01-31', '2', '1', '1'),
(273, 18, '_tax_class', '', '30', '2021-01-31', '2', '3', '3'),
(274, 18, '_qty', '9', '30', '2021-01-31', '2', '3', '3'),
(275, 18, '_product_id', '3', '30', '2021-01-31', '2', '3', '3'),
(276, 18, '_variation_id', '', '30', '2021-01-31', '2', '3', '3'),
(277, 18, '_line_subtotal', '2700', '30', '2021-01-31', '2', '3', '3'),
(278, 18, '_line_total', '2700', '30', '2021-01-31', '2', '3', '3'),
(279, 18, '_line_subtotal_tax', '', '30', '2021-01-31', '2', '3', '3'),
(280, 18, '_line_tax', '', '30', '2021-01-31', '2', '3', '3'),
(281, 18, '_line_tax_data', '2021-01-31 23:28:19', '30', '2021-01-31', '2', '3', '3'),
(282, 18, 'delivery_charge', '0', '30', '2021-01-31', '2', '3', '3'),
(283, 18, 'coupon_code', '85', '30', '2021-01-31', '2', '3', '3'),
(284, 18, 'coupon_taka', '790', '30', '2021-01-31', '2', '3', '3'),
(285, 18, 'attribute_parent', '3', '30', '2021-01-31', '2', '3', '3'),
(286, 18, 'user_district', 'Dhaka', '30', '2021-01-31', '2', '3', '3'),
(287, 18, 'user_city', 'Rampura', '30', '2021-01-31', '2', '3', '3'),
(288, 18, 'user_zip', '1400', '30', '2021-01-31', '2', '3', '3'),
(289, 0, 'cancel_quantity_default', '1', '28', NULL, NULL, NULL, '2'),
(290, 0, 'cancel_default_product', '2', '28', NULL, NULL, NULL, NULL),
(291, 0, 'cancel_quantity_default', '1', '28', NULL, NULL, NULL, '3'),
(292, 0, 'cancel_default_product', '3', '28', NULL, NULL, NULL, NULL),
(293, 0, 'cancel_quantity_default', '1', '27', NULL, NULL, NULL, '14'),
(294, 0, 'cancel_default_product', '14', '27', NULL, NULL, NULL, NULL),
(295, 0, 'cancel_quantity_default', '1', '27', NULL, NULL, NULL, '1'),
(296, 0, 'cancel_default_product', '1', '27', NULL, NULL, NULL, NULL),
(297, 0, 'cancel_quantity_default', '1', '27', NULL, NULL, NULL, '6'),
(298, 0, 'cancel_default_product', '6', '27', NULL, NULL, NULL, NULL),
(299, 19, '_tax_class', '', '34', '2021-01-31', '2', '3', '3'),
(300, 19, '_qty', '0', '34', '2021-01-31', '2', '3', '3'),
(301, 19, '_product_id', '3', '34', '2021-01-31', '2', '3', '3'),
(302, 19, '_variation_id', '', '34', '2021-01-31', '2', '3', '3'),
(303, 19, '_line_subtotal', '0', '34', '2021-01-31', '2', '3', '3'),
(304, 19, '_line_total', '300', '34', '2021-01-31', '2', '3', '3'),
(305, 19, '_line_subtotal_tax', '', '34', '2021-01-31', '2', '3', '3'),
(306, 19, '_line_tax', '', '34', '2021-01-31', '2', '3', '3'),
(307, 19, '_line_tax_data', '2021-01-31 23:40:52', '34', '2021-01-31', '2', '3', '3'),
(308, 19, 'delivery_charge', '100', '34', '2021-01-31', '2', '3', '3'),
(309, 19, 'coupon_code', '85', '34', '2021-01-31', '2', '3', '3'),
(310, 19, 'coupon_taka', '0', '34', '2021-01-31', '2', '3', '3'),
(311, 19, 'attribute_parent', '3', '34', '2021-01-31', '2', '3', '3'),
(312, 19, 'user_district', 'Dhaka', '34', '2021-01-31', '2', '3', '3'),
(313, 19, 'user_city', 'Rampura', '34', '2021-01-31', '2', '3', '3'),
(314, 19, 'user_zip', '1400', '34', '2021-01-31', '2', '3', '3'),
(315, 20, '_tax_class', '', '34', '2021-01-31', '2', '5', '5'),
(316, 20, '_qty', '0', '34', '2021-01-31', '2', '5', '5'),
(317, 20, '_product_id', '5', '34', '2021-01-31', '2', '5', '5'),
(318, 20, '_variation_id', '', '34', '2021-01-31', '2', '5', '5'),
(319, 20, '_line_subtotal', '0', '34', '2021-01-31', '2', '5', '5'),
(320, 20, '_line_total', '375', '34', '2021-01-31', '2', '5', '5'),
(321, 20, '_line_subtotal_tax', '', '34', '2021-01-31', '2', '5', '5'),
(322, 20, '_line_tax', '', '34', '2021-01-31', '2', '5', '5'),
(323, 20, '_line_tax_data', '2021-01-31 23:40:52', '34', '2021-01-31', '2', '5', '5'),
(324, 20, 'delivery_charge', '100', '34', '2021-01-31', '2', '5', '5'),
(325, 20, 'coupon_code', '85', '34', '2021-01-31', '2', '5', '5'),
(326, 20, 'coupon_taka', '0', '34', '2021-01-31', '2', '5', '5'),
(327, 20, 'attribute_parent', '5', '34', '2021-01-31', '2', '5', '5'),
(328, 20, 'user_district', 'Dhaka', '34', '2021-01-31', '2', '5', '5'),
(329, 20, 'user_city', 'Rampura', '34', '2021-01-31', '2', '5', '5'),
(330, 20, 'user_zip', '1400', '34', '2021-01-31', '2', '5', '5'),
(331, 21, '_tax_class', '', '37', '2021-01-31', '2', '13', '13'),
(332, 21, '_qty', '0', '37', '2021-01-31', '2', '13', '13'),
(333, 21, '_product_id', '13', '37', '2021-01-31', '2', '13', '13'),
(334, 21, '_variation_id', '', '37', '2021-01-31', '2', '13', '13'),
(335, 21, '_line_subtotal', '0', '37', '2021-01-31', '2', '13', '13'),
(336, 21, '_line_total', '0', '37', '2021-01-31', '2', '13', '13'),
(337, 21, '_line_subtotal_tax', '', '37', '2021-01-31', '2', '13', '13'),
(338, 21, '_line_tax', '', '37', '2021-01-31', '2', '13', '13'),
(339, 21, '_line_tax_data', '2021-01-31 23:41:56', '37', '2021-01-31', '2', '13', '13'),
(340, 21, 'delivery_charge', '100', '37', '2021-01-31', '2', '13', '13'),
(341, 21, 'coupon_code', NULL, '37', '2021-01-31', '2', '13', '13'),
(342, 21, 'coupon_taka', '0', '37', '2021-01-31', '2', '13', '13'),
(343, 21, 'attribute_parent', '13', '37', '2021-01-31', '2', '13', '13'),
(344, 21, 'user_district', 'Dhaka', '37', '2021-01-31', '2', '13', '13'),
(345, 21, 'user_city', 'Rampura', '37', '2021-01-31', '2', '13', '13'),
(346, 21, 'user_zip', '1400', '37', '2021-01-31', '2', '13', '13'),
(347, 22, '_tax_class', '', '37', '2021-01-31', '2', '1', '1'),
(348, 22, '_qty', '0', '37', '2021-01-31', '2', '1', '1'),
(349, 22, '_product_id', '1', '37', '2021-01-31', '2', '1', '1'),
(350, 22, '_variation_id', '', '37', '2021-01-31', '2', '1', '1'),
(351, 22, '_line_subtotal', '0', '37', '2021-01-31', '2', '1', '1'),
(352, 22, '_line_total', '0', '37', '2021-01-31', '2', '1', '1'),
(353, 22, '_line_subtotal_tax', '', '37', '2021-01-31', '2', '1', '1'),
(354, 22, '_line_tax', '', '37', '2021-01-31', '2', '1', '1'),
(355, 22, '_line_tax_data', '2021-01-31 23:41:56', '37', '2021-01-31', '2', '1', '1'),
(356, 22, 'delivery_charge', '100', '37', '2021-01-31', '2', '1', '1'),
(357, 22, 'coupon_code', NULL, '37', '2021-01-31', '2', '1', '1'),
(358, 22, 'coupon_taka', '0', '37', '2021-01-31', '2', '1', '1'),
(359, 22, 'attribute_parent', '1', '37', '2021-01-31', '2', '1', '1'),
(360, 22, 'user_district', 'Dhaka', '37', '2021-01-31', '2', '1', '1'),
(361, 22, 'user_city', 'Rampura', '37', '2021-01-31', '2', '1', '1'),
(362, 22, 'user_zip', '1400', '37', '2021-01-31', '2', '1', '1'),
(363, 23, '_tax_class', '', '40', '2021-01-31', '2', '13', '13'),
(364, 23, '_qty', '1', '40', '2021-01-31', '2', '13', '13'),
(365, 23, '_product_id', '13', '40', '2021-01-31', '2', '13', '13'),
(366, 23, '_variation_id', '', '40', '2021-01-31', '2', '13', '13'),
(367, 23, '_line_subtotal', '180', '40', '2021-01-31', '2', '13', '13'),
(368, 23, '_line_total', '180', '40', '2021-01-31', '2', '13', '13'),
(369, 23, '_line_subtotal_tax', '', '40', '2021-01-31', '2', '13', '13'),
(370, 23, '_line_tax', '', '40', '2021-01-31', '2', '13', '13'),
(371, 23, '_line_tax_data', '2021-01-31 23:43:03', '40', '2021-01-31', '2', '13', '13'),
(372, 23, 'delivery_charge', '100', '40', '2021-01-31', '2', '13', '13'),
(373, 23, 'coupon_code', NULL, '40', '2021-01-31', '2', '13', '13'),
(374, 23, 'coupon_taka', '0', '40', '2021-01-31', '2', '13', '13'),
(375, 23, 'attribute_parent', '13', '40', '2021-01-31', '2', '13', '13'),
(376, 23, 'user_district', 'Dhaka', '40', '2021-01-31', '2', '13', '13'),
(377, 23, 'user_city', 'Rampura', '40', '2021-01-31', '2', '13', '13'),
(378, 23, 'user_zip', '1400', '40', '2021-01-31', '2', '13', '13'),
(379, 20, 'product_status', 'cancel', '34', '2021-01-31', '2', NULL, NULL),
(380, 21, 'cancel_quantity', '1', '37', '2021-01-31', '2', NULL, NULL),
(381, 22, 'cancel_quantity', '1', '37', '2021-01-31', '2', NULL, NULL),
(382, 0, 'cancel_quantity_default', '1', '34', NULL, NULL, NULL, '3'),
(383, 0, 'cancel_default_product', '3', '34', NULL, NULL, NULL, NULL),
(384, 0, 'cancel_quantity_default', '0', '34', NULL, NULL, NULL, '5'),
(385, 0, 'cancel_default_product', '5', '34', NULL, NULL, NULL, NULL),
(386, 24, '_tax_class', '', '47', '2021-02-01', '2', '13', '13'),
(387, 24, '_qty', '1', '47', '2021-02-01', '2', '13', '13'),
(388, 24, '_product_id', '13', '47', '2021-02-01', '2', '13', '13'),
(389, 24, '_variation_id', '', '47', '2021-02-01', '2', '13', '13'),
(390, 24, '_line_subtotal', '180', '47', '2021-02-01', '2', '13', '13'),
(391, 24, '_line_total', '180', '47', '2021-02-01', '2', '13', '13'),
(392, 24, '_line_subtotal_tax', '', '47', '2021-02-01', '2', '13', '13'),
(393, 24, '_line_tax', '', '47', '2021-02-01', '2', '13', '13'),
(394, 24, '_line_tax_data', '2021-02-01 15:57:09', '47', '2021-02-01', '2', '13', '13'),
(395, 24, 'delivery_charge', '100', '47', '2021-02-01', '2', '13', '13'),
(396, 24, 'coupon_code', '85', '47', '2021-02-01', '2', '13', '13'),
(397, 24, 'coupon_taka', '18', '47', '2021-02-01', '2', '13', '13'),
(398, 24, 'attribute_parent', '13', '47', '2021-02-01', '2', '13', '13'),
(399, 24, 'user_district', 'Dhaka', '47', '2021-02-01', '2', '13', '13'),
(400, 24, 'user_city', 'Rampura', '47', '2021-02-01', '2', '13', '13'),
(401, 24, 'user_zip', '1400', '47', '2021-02-01', '2', '13', '13'),
(402, 25, '_tax_class', '', '48', '2021-02-01', '2', '13', '13'),
(403, 25, '_qty', '0', '48', '2021-02-01', '2', '13', '13'),
(404, 25, '_product_id', '13', '48', '2021-02-01', '2', '13', '13'),
(405, 25, '_variation_id', '', '48', '2021-02-01', '2', '13', '13'),
(406, 25, '_line_subtotal', '0', '48', '2021-02-01', '2', '13', '13'),
(407, 25, '_line_total', '0', '48', '2021-02-01', '2', '13', '13'),
(408, 25, '_line_subtotal_tax', '', '48', '2021-02-01', '2', '13', '13'),
(409, 25, '_line_tax', '', '48', '2021-02-01', '2', '13', '13'),
(410, 25, '_line_tax_data', '2021-02-01 15:57:44', '48', '2021-02-01', '2', '13', '13'),
(411, 25, 'delivery_charge', '200', '48', '2021-02-01', '2', '13', '13'),
(412, 25, 'coupon_code', NULL, '48', '2021-02-01', '2', '13', '13'),
(413, 25, 'coupon_taka', '0', '48', '2021-02-01', '2', '13', '13'),
(414, 25, 'attribute_parent', '13', '48', '2021-02-01', '2', '13', '13'),
(415, 25, 'user_district', 'Chitagong', '48', '2021-02-01', '2', '13', '13'),
(416, 25, 'user_city', 'Bayazid Thana', '48', '2021-02-01', '2', '13', '13'),
(417, 25, 'user_zip', '2100', '48', '2021-02-01', '2', '13', '13'),
(418, 26, '_tax_class', '', '48', '2021-02-01', '2', '1', '1'),
(419, 26, '_qty', '0', '48', '2021-02-01', '2', '1', '1'),
(420, 26, '_product_id', '1', '48', '2021-02-01', '2', '1', '1'),
(421, 26, '_variation_id', '', '48', '2021-02-01', '2', '1', '1'),
(422, 26, '_line_subtotal', '0', '48', '2021-02-01', '2', '1', '1'),
(423, 26, '_line_total', '0', '48', '2021-02-01', '2', '1', '1'),
(424, 26, '_line_subtotal_tax', '', '48', '2021-02-01', '2', '1', '1'),
(425, 26, '_line_tax', '', '48', '2021-02-01', '2', '1', '1'),
(426, 26, '_line_tax_data', '2021-02-01 15:57:44', '48', '2021-02-01', '2', '1', '1'),
(427, 26, 'delivery_charge', '200', '48', '2021-02-01', '2', '1', '1'),
(428, 26, 'coupon_code', NULL, '48', '2021-02-01', '2', '1', '1'),
(429, 26, 'coupon_taka', '0', '48', '2021-02-01', '2', '1', '1'),
(430, 26, 'attribute_parent', '1', '48', '2021-02-01', '2', '1', '1'),
(431, 26, 'user_district', 'Chitagong', '48', '2021-02-01', '2', '1', '1'),
(432, 26, 'user_city', 'Bayazid Thana', '48', '2021-02-01', '2', '1', '1'),
(433, 26, 'user_zip', '2100', '48', '2021-02-01', '2', '1', '1'),
(434, 25, 'cancel_quantity', '1', '48', '2021-02-01', '2', NULL, NULL),
(435, 27, '_tax_class', '', '49', '2021-02-01', '2', '2', '2'),
(436, 27, '_qty', '4', '49', '2021-02-01', '2', '2', '2'),
(437, 27, '_product_id', '2', '49', '2021-02-01', '2', '2', '2'),
(438, 27, '_variation_id', '', '49', '2021-02-01', '2', '2', '2'),
(439, 27, '_line_subtotal', '2320', '49', '2021-02-01', '2', '2', '2'),
(440, 27, '_line_total', '2320', '49', '2021-02-01', '2', '2', '2'),
(441, 27, '_line_subtotal_tax', '', '49', '2021-02-01', '2', '2', '2'),
(442, 27, '_line_tax', '', '49', '2021-02-01', '2', '2', '2'),
(443, 27, '_line_tax_data', '2021-02-01 16:00:21', '49', '2021-02-01', '2', '2', '2'),
(444, 27, 'delivery_charge', '100', '49', '2021-02-01', '2', '2', '2'),
(445, 27, 'coupon_code', '85', '49', '2021-02-01', '2', '2', '2'),
(446, 27, 'coupon_taka', '397', '49', '2021-02-01', '2', '2', '2'),
(447, 27, 'attribute_parent', '2', '49', '2021-02-01', '2', '2', '2'),
(448, 27, 'user_district', 'Dhaka', '49', '2021-02-01', '2', '2', '2'),
(449, 27, 'user_city', 'Rampura', '49', '2021-02-01', '2', '2', '2'),
(450, 27, 'user_zip', '1400', '49', '2021-02-01', '2', '2', '2'),
(451, 28, '_tax_class', '', '49', '2021-02-01', '2', '4', '4'),
(452, 28, '_qty', '6', '49', '2021-02-01', '2', '4', '4'),
(453, 28, '_product_id', '4', '49', '2021-02-01', '2', '4', '4'),
(454, 28, '_variation_id', '', '49', '2021-02-01', '2', '4', '4'),
(455, 28, '_line_subtotal', '1650', '49', '2021-02-01', '2', '4', '4'),
(456, 28, '_line_total', '1650', '49', '2021-02-01', '2', '4', '4'),
(457, 28, '_line_subtotal_tax', '', '49', '2021-02-01', '2', '4', '4'),
(458, 28, '_line_tax', '', '49', '2021-02-01', '2', '4', '4'),
(459, 28, '_line_tax_data', '2021-02-01 16:00:21', '49', '2021-02-01', '2', '4', '4'),
(460, 28, 'delivery_charge', '100', '49', '2021-02-01', '2', '4', '4'),
(461, 28, 'coupon_code', '85', '49', '2021-02-01', '2', '4', '4'),
(462, 28, 'coupon_taka', '397', '49', '2021-02-01', '2', '4', '4'),
(463, 28, 'attribute_parent', '4', '49', '2021-02-01', '2', '4', '4'),
(464, 28, 'user_district', 'Dhaka', '49', '2021-02-01', '2', '4', '4'),
(465, 28, 'user_city', 'Rampura', '49', '2021-02-01', '2', '4', '4'),
(466, 28, 'user_zip', '1400', '49', '2021-02-01', '2', '4', '4'),
(467, 29, '_tax_class', '', '52', '2021-02-07', '2', '13', '13'),
(468, 29, '_qty', '1', '52', '2021-02-07', '2', '13', '13'),
(469, 29, '_product_id', '13', '52', '2021-02-07', '2', '13', '13'),
(470, 29, '_variation_id', '', '52', '2021-02-07', '2', '13', '13'),
(471, 29, '_line_subtotal', '180', '52', '2021-02-07', '2', '13', '13'),
(472, 29, '_line_total', '180', '52', '2021-02-07', '2', '13', '13'),
(473, 29, '_line_subtotal_tax', '', '52', '2021-02-07', '2', '13', '13'),
(474, 29, '_line_tax', '', '52', '2021-02-07', '2', '13', '13'),
(475, 29, '_line_tax_data', '2021-02-07 23:14:55', '52', '2021-02-07', '2', '13', '13'),
(476, 29, 'delivery_charge', '100', '52', '2021-02-07', '2', '13', '13'),
(477, 29, 'coupon_code', NULL, '52', '2021-02-07', '2', '13', '13'),
(478, 29, 'coupon_taka', '0', '52', '2021-02-07', '2', '13', '13'),
(479, 29, 'attribute_parent', '13', '52', '2021-02-07', '2', '13', '13'),
(480, 29, 'user_district', 'Dhaka', '52', '2021-02-07', '2', '13', '13'),
(481, 29, 'user_city', 'Rampura', '52', '2021-02-07', '2', '13', '13'),
(482, 29, 'user_zip', '1400', '52', '2021-02-07', '2', '13', '13'),
(483, 30, '_tax_class', '', '53', '2021-02-07', '2', '13', '13'),
(484, 30, '_qty', '1', '53', '2021-02-07', '2', '13', '13'),
(485, 30, '_product_id', '13', '53', '2021-02-07', '2', '13', '13'),
(486, 30, '_variation_id', '', '53', '2021-02-07', '2', '13', '13'),
(487, 30, '_line_subtotal', '180', '53', '2021-02-07', '2', '13', '13'),
(488, 30, '_line_total', '180', '53', '2021-02-07', '2', '13', '13'),
(489, 30, '_line_subtotal_tax', '', '53', '2021-02-07', '2', '13', '13'),
(490, 30, '_line_tax', '', '53', '2021-02-07', '2', '13', '13'),
(491, 30, '_line_tax_data', '2021-02-07 23:38:20', '53', '2021-02-07', '2', '13', '13'),
(492, 30, 'delivery_charge', '100', '53', '2021-02-07', '2', '13', '13'),
(493, 30, 'coupon_code', NULL, '53', '2021-02-07', '2', '13', '13'),
(494, 30, 'coupon_taka', '0', '53', '2021-02-07', '2', '13', '13'),
(495, 30, 'attribute_parent', '13', '53', '2021-02-07', '2', '13', '13'),
(496, 30, 'user_district', 'Dhaka', '53', '2021-02-07', '2', '13', '13'),
(497, 30, 'user_city', 'Rampura', '53', '2021-02-07', '2', '13', '13'),
(498, 30, 'user_zip', '1400', '53', '2021-02-07', '2', '13', '13'),
(499, 31, '_tax_class', '', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(500, 31, '_qty', '2', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(501, 31, '_product_id', '54', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(502, 31, '_variation_id', '', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(503, 31, '_line_subtotal', '1140', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(504, 31, '_line_total', '1140', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(505, 31, '_line_subtotal_tax', '', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(506, 31, '_line_tax', '', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(507, 31, '_line_tax_data', '2021-02-08 23:14:02', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(508, 31, 'delivery_charge', '200', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(509, 31, 'coupon_code', NULL, '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(510, 31, 'coupon_taka', '0', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(511, 31, 'attribute_parent', '54', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(512, 31, 'user_district', 'Chitagong', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(513, 31, 'user_city', 'Bayazid Thana', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(514, 31, 'user_zip', '2100', '55', '2021-02-08', 'cho5fdkg4rh0vgtc6kvsujfsol', '54', '54'),
(515, 32, '_tax_class', '', '59', '2021-04-27', '4', '57', '57'),
(516, 32, '_qty', '1', '59', '2021-04-27', '4', '57', '57'),
(517, 32, '_product_id', '57', '59', '2021-04-27', '4', '57', '57'),
(518, 32, '_variation_id', '', '59', '2021-04-27', '4', '57', '57'),
(519, 32, '_line_subtotal', '3000', '59', '2021-04-27', '4', '57', '57'),
(520, 32, '_line_total', '3000', '59', '2021-04-27', '4', '57', '57'),
(521, 32, '_line_subtotal_tax', '', '59', '2021-04-27', '4', '57', '57'),
(522, 32, '_line_tax', '', '59', '2021-04-27', '4', '57', '57'),
(523, 32, '_line_tax_data', '2021-04-27 14:23:43', '59', '2021-04-27', '4', '57', '57'),
(524, 32, 'delivery_charge', '200', '59', '2021-04-27', '4', '57', '57'),
(525, 32, 'coupon_code', NULL, '59', '2021-04-27', '4', '57', '57'),
(526, 32, 'coupon_taka', '0', '59', '2021-04-27', '4', '57', '57'),
(527, 32, 'attribute_parent', '57', '59', '2021-04-27', '4', '57', '57'),
(528, 32, 'user_district', 'Chitagong', '59', '2021-04-27', '4', '57', '57'),
(529, 32, 'user_city', 'Bayazid Thana', '59', '2021-04-27', '4', '57', '57'),
(530, 32, 'user_zip', '2100', '59', '2021-04-27', '4', '57', '57'),
(531, 33, '_tax_class', '', '60', '2021-04-27', '4', '13', '13'),
(532, 33, '_qty', '3', '60', '2021-04-27', '4', '13', '13'),
(533, 33, '_product_id', '13', '60', '2021-04-27', '4', '13', '13'),
(534, 33, '_variation_id', '', '60', '2021-04-27', '4', '13', '13'),
(535, 33, '_line_subtotal', '540', '60', '2021-04-27', '4', '13', '13'),
(536, 33, '_line_total', '540', '60', '2021-04-27', '4', '13', '13'),
(537, 33, '_line_subtotal_tax', '', '60', '2021-04-27', '4', '13', '13'),
(538, 33, '_line_tax', '', '60', '2021-04-27', '4', '13', '13'),
(539, 33, '_line_tax_data', '2021-04-27 14:27:25', '60', '2021-04-27', '4', '13', '13'),
(540, 33, 'delivery_charge', '100', '60', '2021-04-27', '4', '13', '13'),
(541, 33, 'coupon_code', NULL, '60', '2021-04-27', '4', '13', '13'),
(542, 33, 'coupon_taka', '0', '60', '2021-04-27', '4', '13', '13'),
(543, 33, 'attribute_parent', '13', '60', '2021-04-27', '4', '13', '13'),
(544, 33, 'user_district', 'Dhaka', '60', '2021-04-27', '4', '13', '13'),
(545, 33, 'user_city', 'Rampura', '60', '2021-04-27', '4', '13', '13'),
(546, 33, 'user_zip', '1400', '60', '2021-04-27', '4', '13', '13'),
(547, 34, '_tax_class', '', '60', '2021-04-27', '4', '14', '14'),
(548, 34, '_qty', '5', '60', '2021-04-27', '4', '14', '14'),
(549, 34, '_product_id', '14', '60', '2021-04-27', '4', '14', '14'),
(550, 34, '_variation_id', '', '60', '2021-04-27', '4', '14', '14'),
(551, 34, '_line_subtotal', '1600', '60', '2021-04-27', '4', '14', '14'),
(552, 34, '_line_total', '1600', '60', '2021-04-27', '4', '14', '14'),
(553, 34, '_line_subtotal_tax', '', '60', '2021-04-27', '4', '14', '14'),
(554, 34, '_line_tax', '', '60', '2021-04-27', '4', '14', '14'),
(555, 34, '_line_tax_data', '2021-04-27 14:27:25', '60', '2021-04-27', '4', '14', '14'),
(556, 34, 'delivery_charge', '100', '60', '2021-04-27', '4', '14', '14'),
(557, 34, 'coupon_code', NULL, '60', '2021-04-27', '4', '14', '14'),
(558, 34, 'coupon_taka', '0', '60', '2021-04-27', '4', '14', '14'),
(559, 34, 'attribute_parent', '14', '60', '2021-04-27', '4', '14', '14'),
(560, 34, 'user_district', 'Dhaka', '60', '2021-04-27', '4', '14', '14'),
(561, 34, 'user_city', 'Rampura', '60', '2021-04-27', '4', '14', '14'),
(562, 34, 'user_zip', '1400', '60', '2021-04-27', '4', '14', '14');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` bigint(20) NOT NULL,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `product_id`, `order_id`, `product_parent`) VALUES
(1, 'Capsicum (Red)', 'line-item', '5', 7, '5'),
(2, 'Chicken Leg Only', 'line-item', '4', 10, '4'),
(3, 'Hilsha Fish', 'line-item', '14', 19, '14'),
(4, 'Apple', 'line-item', '13', 22, '13'),
(5, 'Apple', 'line-item', '13', 26, '13'),
(6, 'Hilsha Fish', 'line-item', '14', 26, '14'),
(7, 'Capsicum (Red)', 'line-item', '5', 26, '5'),
(8, 'Beef', 'line-item', '2', 26, '2'),
(9, 'Hilsha Fish', 'line-item', '14', 27, '14'),
(10, 'Banana', 'line-item', '1', 27, '1'),
(11, 'Special Vegetable', 'line-item', '6', 27, '6'),
(12, 'Beef', 'line-item', '2', 28, '2'),
(13, 'Broiler Chicken', 'line-item', '3', 28, '3'),
(14, 'Capsicum (Red)', 'line-item', '5', 29, '5'),
(15, 'Special Vegetable', 'line-item', '6', 29, '6'),
(16, 'Hilsha Fish', 'line-item', '14', 30, '14'),
(17, 'Banana', 'line-item', '1', 30, '1'),
(18, 'Broiler Chicken', 'line-item', '3', 30, '3'),
(19, 'Broiler Chicken', 'line-item', '3', 34, '3'),
(20, 'Capsicum (Red)', 'line-item', '5', 34, '5'),
(21, 'Apple', 'line-item', '13', 37, '13'),
(22, 'Banana', 'line-item', '1', 37, '1'),
(23, 'Apple', 'line-item', '13', 40, '13'),
(24, 'Apple', 'line-item', '13', 47, '13'),
(25, 'Apple', 'line-item', '13', 48, '13'),
(26, 'Banana', 'line-item', '1', 48, '1'),
(27, 'Beef', 'line-item', '2', 49, '2'),
(28, 'Chicken Leg Only', 'line-item', '4', 49, '4'),
(29, 'Apple', 'line-item', '13', 52, '13'),
(30, 'Apple', 'line-item', '13', 53, '13'),
(31, 'Beef', 'line-item', '54', 55, '54'),
(32, 'aminul', 'line-item', '57', 59, '57'),
(33, 'Apple', 'line-item', '13', 60, '13'),
(34, 'Hilsha Fish', 'line-item', '14', 60, '14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('parthokar90@gmail.com', '$2y$10$UUrtTc333wwAHCTL5v0D1Ov4uGY9uze3gyQ7bJlOkiQgi.gjEcUT.', '2020-12-09 02:11:45'),
('reeda3596@gmail.com', '$2y$10$pS9gvP2PKyNGdFB9laS11e.XVncBJzqN3pdgcladRSZQ.YEk6L5b6', '2021-01-28 20:08:58'),
('hm.sohelrana95@gmail.com', '$2y$10$NPysSIeonRUZBTeXvEvG2e.zACucJgjVJ4TxHIwIfY4iDPf2yIO/6', '2021-01-31 10:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `payment_tokenmeta`
--

CREATE TABLE `payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_tokens`
--

CREATE TABLE `payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'manage-dashboard', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(2, 'Category', 'create-category', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(3, 'Tag', 'manage-tag', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(4, 'Attribute', 'manage-attribute', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(5, 'Product', 'manage-product', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(6, 'Quick Report', 'quick-report', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(7, 'Order History', 'order-history', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(8, 'Send Parcel', 'send-parcel', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(9, 'Reject', 'manage-reject', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(10, 'Manage Stock', 'manage-stock', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(11, 'Customer List', 'manage-customer', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(13, 'Settings', 'manage-settings', '2020-10-28 10:48:52', '2020-10-28 10:48:52'),
(14, 'Report', 'manage-report', '2020-10-28 10:48:52', '2020-10-28 10:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `postmeta`
--

CREATE TABLE `postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postmeta`
--

INSERT INTO `postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'stock_status', 'instock'),
(2, 1, 'regular_price', '100'),
(3, 1, 'sale_price', '80'),
(4, 1, 'weight', NULL),
(5, 1, 'length', NULL),
(6, 1, 'width', NULL),
(7, 1, 'height', NULL),
(8, 1, 'product_stock', '70'),
(9, 1, 'start_stock', '70'),
(10, 1, 'default_qty', '135'),
(11, 1, 'alert_qty', '50'),
(12, 1, '_sku', '823'),
(13, 1, 'attached_file', '1612154939.jpg'),
(14, 1, 'gallery_file', '371-1.png'),
(15, 1, 'gallery_file', '371-2.png'),
(16, 2, 'stock_status', 'instock'),
(17, 2, 'regular_price', '600'),
(18, 2, 'sale_price', '580'),
(19, 2, 'weight', '1kg'),
(20, 2, 'length', NULL),
(21, 2, 'width', NULL),
(22, 2, 'height', NULL),
(23, 2, 'product_stock', '550'),
(24, 2, 'start_stock', '550'),
(25, 2, 'default_qty', '0'),
(26, 2, 'alert_qty', '15'),
(27, 2, '_sku', '493'),
(28, 2, 'attached_file', '1611831965.jpg'),
(29, 2, 'gallery_file', 'beef_3.jpg'),
(30, 2, 'gallery_file', 'beef_3-410x410.jpg'),
(31, 3, 'stock_status', 'instock'),
(32, 3, 'regular_price', '320'),
(33, 3, 'sale_price', '300'),
(34, 3, 'weight', '1kg'),
(35, 3, 'length', NULL),
(36, 3, 'width', NULL),
(37, 3, 'height', NULL),
(38, 3, 'product_stock', '270'),
(39, 3, 'start_stock', '270'),
(40, 3, 'default_qty', '1'),
(41, 3, 'alert_qty', '10'),
(42, 3, '_sku', '325'),
(43, 3, 'attached_file', '1612155482.jpg'),
(44, 3, 'gallery_file', '32 (1).jpg'),
(45, 3, 'gallery_file', '32.jpg'),
(46, 4, 'stock_status', 'instock'),
(47, 4, 'regular_price', '295'),
(48, 4, 'sale_price', '275'),
(49, 4, 'weight', NULL),
(50, 4, 'length', NULL),
(51, 4, 'width', NULL),
(52, 4, 'height', NULL),
(53, 4, 'product_stock', '260'),
(54, 4, 'start_stock', '260'),
(55, 4, 'default_qty', '194'),
(56, 4, 'alert_qty', '5'),
(57, 4, '_sku', '160'),
(58, 4, 'attached_file', '1612155555.jpg'),
(59, 4, 'gallery_file', '405 (1).png'),
(60, 4, 'gallery_file', '405.png'),
(61, 5, 'stock_status', 'instock'),
(62, 5, 'regular_price', '390'),
(63, 5, 'sale_price', '375'),
(64, 5, 'weight', '1kg'),
(65, 5, 'length', NULL),
(66, 5, 'width', NULL),
(67, 5, 'height', NULL),
(68, 5, 'product_stock', '350'),
(69, 5, 'start_stock', '350'),
(70, 5, 'default_qty', '296'),
(71, 5, 'alert_qty', '25'),
(72, 5, '_sku', '276'),
(73, 5, 'attached_file', '1612154372.jpg'),
(74, 5, 'gallery_file', '068.jpg'),
(75, 5, 'gallery_file', 'raw_food_diet.jpg'),
(76, 6, 'stock_status', 'instock'),
(77, 6, 'regular_price', '120'),
(78, 6, 'sale_price', '100'),
(79, 6, 'weight', '1kg'),
(80, 6, 'length', NULL),
(81, 6, 'width', NULL),
(82, 6, 'height', NULL),
(83, 6, 'product_stock', '80'),
(84, 6, 'start_stock', '80'),
(85, 6, 'default_qty', '99'),
(86, 6, 'alert_qty', '10'),
(87, 6, '_sku', '913'),
(88, 6, 'attached_file', '1612155218.jpg'),
(89, 6, 'gallery_file', '5b0c21e374313.image.jpg'),
(90, 6, 'gallery_file', 'vegetables-name-in-english-3.jpg'),
(91, 7, 'first_name', 'Aminul'),
(92, 7, 'last_name', 'Islam'),
(93, 7, 'address_one', 'Dhaka'),
(94, 7, 'address_two', 'Dhaka'),
(95, 7, 'phone', '01752719574'),
(96, 7, 'email', 'a.soton7@gmail.com'),
(97, 7, 'country', 'Bangladesh'),
(98, 7, 'state', 'Dhaka'),
(99, 7, 'city', 'Rampura'),
(100, 7, 'zip', '1400'),
(101, 7, '_customer_user', '1'),
(102, 7, '_billing_postcode', '1400'),
(103, 7, '_billing_company', NULL),
(104, 7, '_billing_last_name', NULL),
(105, 7, '_billing_first_name', NULL),
(106, 7, 'payment_method', 'Cash On Delivery'),
(107, 7, 'processing_date', '2021-01-28'),
(108, 10, 'first_name', 'Aminul'),
(109, 10, 'last_name', 'Islam'),
(110, 10, 'address_one', 'Dhaka'),
(111, 10, 'address_two', 'Dhaka'),
(112, 10, 'phone', '01752719574'),
(113, 10, 'email', 'a.soton7@gmail.com'),
(114, 10, 'country', 'Bangladesh'),
(115, 10, 'state', 'Dhaka'),
(116, 10, 'city', 'Rampura'),
(117, 10, 'zip', '1400'),
(118, 10, '_customer_user', '1'),
(119, 10, '_billing_postcode', '1400'),
(120, 10, '_billing_company', NULL),
(121, 10, '_billing_last_name', NULL),
(122, 10, '_billing_first_name', NULL),
(123, 10, 'payment_method', 'Cash On Delivery'),
(124, 10, 'processing_date', '2021-01-28'),
(125, 13, 'stock_status', 'instock'),
(126, 13, 'regular_price', '200'),
(127, 13, 'sale_price', '180'),
(128, 13, 'weight', '1kg'),
(129, 13, 'length', NULL),
(130, 13, 'width', NULL),
(131, 13, 'height', NULL),
(132, 13, 'product_stock', '160'),
(133, 13, 'start_stock', '160'),
(134, 13, 'default_qty', '88'),
(135, 13, 'alert_qty', '10'),
(136, 13, '_sku', '484'),
(137, 13, 'attached_file', '1612154655.jpg'),
(138, 13, 'gallery_file', '370 (1).png'),
(139, 13, 'gallery_file', '370.png'),
(140, 14, 'stock_status', 'instock'),
(141, 14, 'regular_price', '350'),
(142, 14, 'sale_price', '320'),
(143, 14, 'weight', '1kg'),
(144, 14, 'length', NULL),
(145, 14, 'width', NULL),
(146, 14, 'height', NULL),
(147, 14, 'product_stock', '300'),
(148, 14, 'start_stock', '300'),
(149, 14, 'default_qty', '193'),
(150, 14, 'alert_qty', '10'),
(151, 14, '_sku', '878'),
(152, 14, 'attached_file', '1612155313.jpg'),
(153, 14, 'gallery_file', '49226239866_cb2e5f76fb_c.jpg'),
(154, 14, 'gallery_file', 'Brainers.jpg'),
(155, 15, 'slider_img', '1612062621.png'),
(156, 15, 'slider_url', NULL),
(157, 16, 'slider_img', '1612062628.png'),
(158, 16, 'slider_url', NULL),
(161, 18, 'slider_img', '1612068430.jpg'),
(160, 17, 'slider_url', NULL),
(162, 18, 'slider_url', NULL),
(163, 19, 'first_name', 'Aminul'),
(164, 19, 'last_name', 'Islam'),
(165, 19, 'address_one', 'Chitagong'),
(166, 19, 'address_two', 'Chitagong'),
(167, 19, 'phone', '01752719574'),
(168, 19, 'email', 'a.soton7@gmail.com'),
(169, 19, 'country', 'Bangladesh'),
(170, 19, 'state', 'Chitagong'),
(171, 19, 'city', 'Bayazid Thana'),
(172, 19, 'zip', '2100'),
(173, 19, '_customer_user', 'f4ouoej6ovd1uu4ksc5u3tq6d8'),
(174, 19, '_billing_postcode', '2100'),
(175, 19, '_billing_company', NULL),
(176, 19, '_billing_last_name', NULL),
(177, 19, '_billing_first_name', NULL),
(178, 19, 'payment_method', 'Cash On Delivery'),
(179, 19, 'processing_date', '2021-01-31'),
(180, 22, 'first_name', 'Aminul'),
(181, 22, 'last_name', 'Islam'),
(182, 22, 'address_one', 'Chitagong'),
(183, 22, 'address_two', 'Chitagong'),
(184, 22, 'phone', '01752719574'),
(185, 22, 'email', 'a.soton7@gmail.com'),
(186, 22, 'country', 'Bangladesh'),
(187, 22, 'state', 'Chitagong'),
(188, 22, 'city', 'Bayazid Thana'),
(189, 22, 'zip', '2100'),
(190, 22, '_customer_user', '1'),
(191, 22, '_billing_postcode', '2100'),
(192, 22, '_billing_company', NULL),
(193, 22, '_billing_last_name', NULL),
(194, 22, '_billing_first_name', NULL),
(195, 22, 'payment_method', 'Cash On Delivery'),
(196, 22, 'processing_date', '2021-01-31'),
(197, 26, 'first_name', 'shahin'),
(198, 26, 'last_name', 'khan'),
(199, 26, 'address_one', 'dhaka'),
(200, 26, 'address_two', 'dhaka'),
(201, 26, 'phone', '0'),
(202, 26, 'email', 'hm.sohelrana95@gmail.com'),
(203, 26, 'country', 'Bangladesh'),
(204, 26, 'state', 'Chitagong'),
(205, 26, 'city', 'Bayazid Thana'),
(206, 26, 'zip', '2100'),
(207, 26, '_customer_user', '5'),
(208, 26, '_billing_postcode', '2100'),
(209, 26, '_billing_company', NULL),
(210, 26, '_billing_last_name', NULL),
(211, 26, '_billing_first_name', NULL),
(212, 26, 'payment_method', 'Cash On Delivery'),
(213, 27, 'first_name', 'sohel'),
(214, 27, 'last_name', 'rana'),
(215, 27, 'address_one', 'Chandpur'),
(216, 27, 'address_two', 'Chandpur'),
(217, 27, 'phone', '01981368525'),
(218, 27, 'email', 'sohelahmeditebd@gmail.com'),
(219, 27, 'country', 'Bangladesh'),
(220, 27, 'state', 'Dhaka'),
(221, 27, 'city', 'Rampura'),
(222, 27, 'zip', '1400'),
(223, 27, '_customer_user', '2'),
(224, 27, '_billing_postcode', '1400'),
(225, 27, '_billing_company', NULL),
(226, 27, '_billing_last_name', NULL),
(227, 27, '_billing_first_name', NULL),
(228, 27, 'payment_method', 'Cash On Delivery'),
(229, 28, 'first_name', 'sohel'),
(230, 28, 'last_name', 'rana'),
(231, 28, 'address_one', 'dhaka'),
(232, 28, 'address_two', 'dhaka'),
(233, 28, 'phone', '01981368525'),
(234, 28, 'email', 'sohelahmeditebd@gmail.com'),
(235, 28, 'country', 'Bangladesh'),
(236, 28, 'state', 'Dhaka'),
(237, 28, 'city', 'Rampura'),
(238, 28, 'zip', '1400'),
(239, 28, '_customer_user', '2'),
(240, 28, '_billing_postcode', '1400'),
(241, 28, '_billing_company', NULL),
(242, 28, '_billing_last_name', NULL),
(243, 28, '_billing_first_name', NULL),
(244, 28, 'payment_method', 'Cash On Delivery'),
(245, 29, 'first_name', 'sohel'),
(246, 29, 'last_name', 'rana'),
(247, 29, 'address_one', 'dhaka'),
(248, 29, 'address_two', 'dhaka'),
(249, 29, 'phone', '01981368525'),
(250, 29, 'email', 'sohelahmeditebd@gmail.com'),
(251, 29, 'country', 'Bangladesh'),
(252, 29, 'state', 'Chitagong'),
(253, 29, 'city', 'Bayazid Thana'),
(254, 29, 'zip', '2100'),
(255, 29, '_customer_user', '2'),
(256, 29, '_billing_postcode', '2100'),
(257, 29, '_billing_company', NULL),
(258, 29, '_billing_last_name', NULL),
(259, 29, '_billing_first_name', NULL),
(260, 29, 'payment_method', 'Cash On Delivery'),
(261, 30, 'first_name', 'sohel'),
(262, 30, 'last_name', 'rana'),
(263, 30, 'address_one', 'dhaka'),
(264, 30, 'address_two', 'dhaka'),
(265, 30, 'phone', '01981368525'),
(266, 30, 'email', 'sohelahmeditebd@gmail.com'),
(267, 30, 'country', 'Bangladesh'),
(268, 30, 'state', 'Dhaka'),
(269, 30, 'city', 'Rampura'),
(270, 30, 'zip', '1400'),
(271, 30, '_customer_user', '2'),
(272, 30, '_billing_postcode', '1400'),
(273, 30, '_billing_company', NULL),
(274, 30, '_billing_last_name', NULL),
(275, 30, '_billing_first_name', NULL),
(276, 30, 'payment_method', 'Cash On Delivery'),
(277, 30, 'processing_date', '2021-01-31'),
(278, 29, 'processing_date', '2021-01-31'),
(279, 27, 'processing_date', '2021-01-31'),
(280, 26, 'processing_date', '2021-01-31'),
(281, 34, 'first_name', 'sohel'),
(282, 34, 'last_name', 'rana'),
(283, 34, 'address_one', 'dhaka'),
(284, 34, 'address_two', 'dhaka'),
(285, 34, 'phone', '01981368525'),
(286, 34, 'email', 'sohelahmeditebd@gmail.com'),
(287, 34, 'country', 'Bangladesh'),
(288, 34, 'state', 'Dhaka'),
(289, 34, 'city', 'Rampura'),
(290, 34, 'zip', '1400'),
(291, 34, '_customer_user', '2'),
(292, 34, '_billing_postcode', '1400'),
(293, 34, '_billing_company', NULL),
(294, 34, '_billing_last_name', NULL),
(295, 34, '_billing_first_name', NULL),
(296, 34, 'payment_method', 'Cash On Delivery'),
(297, 34, 'processing_date', '2021-01-31'),
(298, 37, 'first_name', 'sohel'),
(299, 37, 'last_name', 'rana'),
(300, 37, 'address_one', 'dhaka'),
(301, 37, 'address_two', 'dhaka'),
(302, 37, 'phone', '01981368525'),
(303, 37, 'email', 'sohelahmeditebd@gmail.com'),
(304, 37, 'country', 'Bangladesh'),
(305, 37, 'state', 'Dhaka'),
(306, 37, 'city', 'Rampura'),
(307, 37, 'zip', '1400'),
(308, 37, '_customer_user', '2'),
(309, 37, '_billing_postcode', '1400'),
(310, 37, '_billing_company', NULL),
(311, 37, '_billing_last_name', NULL),
(312, 37, '_billing_first_name', NULL),
(313, 37, 'payment_method', 'Cash On Delivery'),
(314, 37, 'processing_date', '2021-01-31'),
(315, 40, 'first_name', 'sohel'),
(316, 40, 'last_name', 'rana'),
(317, 40, 'address_one', 'dhaka'),
(318, 40, 'address_two', 'dhaka'),
(319, 40, 'phone', '01981368525'),
(320, 40, 'email', 'sohelahmeditebd@gmail.com'),
(321, 40, 'country', 'Bangladesh'),
(322, 40, 'state', 'Dhaka'),
(323, 40, 'city', 'Rampura'),
(324, 40, 'zip', '1400'),
(325, 40, '_customer_user', '2'),
(326, 40, '_billing_postcode', '1400'),
(327, 40, '_billing_company', NULL),
(328, 40, '_billing_last_name', NULL),
(329, 40, '_billing_first_name', NULL),
(330, 40, 'payment_method', 'Cash On Delivery'),
(331, 40, 'processing_date', '2021-01-31'),
(332, 4, 'product_status', 'reject'),
(333, 4, 'reject_date', '2021-01-31'),
(334, 4, 'reject_qty', '19'),
(335, 47, 'first_name', 'sohel'),
(336, 47, 'last_name', 'rana'),
(337, 47, 'address_one', 'dhaka'),
(338, 47, 'address_two', 'dhaka'),
(339, 47, 'phone', '01981368525'),
(340, 47, 'email', 'sohelahmeditebd@gmail.com'),
(341, 47, 'country', 'Bangladesh'),
(342, 47, 'state', 'Dhaka'),
(343, 47, 'city', 'Rampura'),
(344, 47, 'zip', '1400'),
(345, 47, '_customer_user', '2'),
(346, 47, '_billing_postcode', '1400'),
(347, 47, '_billing_company', NULL),
(348, 47, '_billing_last_name', NULL),
(349, 47, '_billing_first_name', NULL),
(350, 47, 'payment_method', 'Cash On Delivery'),
(351, 48, 'first_name', 'sohel'),
(352, 48, 'last_name', 'rana'),
(353, 48, 'address_one', 'dhaka'),
(354, 48, 'address_two', 'dhaka'),
(355, 48, 'phone', '01981368525'),
(356, 48, 'email', 'sohelahmeditebd@gmail.com'),
(357, 48, 'country', 'Bangladesh'),
(358, 48, 'state', 'Chitagong'),
(359, 48, 'city', 'Bayazid Thana'),
(360, 48, 'zip', '2100'),
(361, 48, '_customer_user', '2'),
(362, 48, '_billing_postcode', '2100'),
(363, 48, '_billing_company', NULL),
(364, 48, '_billing_last_name', NULL),
(365, 48, '_billing_first_name', NULL),
(366, 48, 'payment_method', 'Cash On Delivery'),
(367, 49, 'first_name', 'sohel'),
(368, 49, 'last_name', 'rana'),
(369, 49, 'address_one', 'dhaka'),
(370, 49, 'address_two', 'dhaka'),
(371, 49, 'phone', '01981368525'),
(372, 49, 'email', 'sohelahmeditebd@gmail.com'),
(373, 49, 'country', 'Bangladesh'),
(374, 49, 'state', 'Dhaka'),
(375, 49, 'city', 'Rampura'),
(376, 49, 'zip', '1400'),
(377, 49, '_customer_user', '2'),
(378, 49, '_billing_postcode', '1400'),
(379, 49, '_billing_company', NULL),
(380, 49, '_billing_last_name', NULL),
(381, 49, '_billing_first_name', NULL),
(382, 49, 'payment_method', 'Cash On Delivery'),
(383, 2, 'product_status', 'reject'),
(384, 2, 'reject_date', '2021-02-01'),
(385, 2, 'reject_qty', '145'),
(386, 3, 'product_status', 'reject'),
(387, 3, 'reject_date', '2021-02-01'),
(388, 3, 'reject_qty', '40'),
(389, 50, 'stock_status', 'instock'),
(390, 50, 'regular_price', '130'),
(391, 50, 'sale_price', '120'),
(392, 50, 'weight', '500g'),
(393, 50, 'length', NULL),
(394, 50, 'width', NULL),
(395, 50, 'height', NULL),
(396, 50, 'product_stock', '110'),
(397, 50, 'start_stock', '110'),
(398, 50, 'default_qty', '100'),
(399, 50, 'alert_qty', '10'),
(400, 50, '_sku', '100'),
(401, 50, 'attached_file', '1612153707.jpg'),
(402, 50, 'gallery_file', '33-300x200.jpg'),
(403, 50, 'gallery_file', '34-1-300x200.jpg'),
(404, 52, 'first_name', 'sohel'),
(405, 52, 'last_name', 'rana'),
(406, 52, 'address_one', 'dhaka'),
(407, 52, 'address_two', 'dhaka'),
(408, 52, 'phone', '01981368525'),
(409, 52, 'email', 'sohelahmeditebd@gmail.com'),
(410, 52, 'country', 'Bangladesh'),
(411, 52, 'state', 'Dhaka'),
(412, 52, 'city', 'Rampura'),
(413, 52, 'zip', '1400'),
(414, 52, '_customer_user', '2'),
(415, 52, '_billing_postcode', '1400'),
(416, 52, '_billing_company', NULL),
(417, 52, '_billing_last_name', NULL),
(418, 52, '_billing_first_name', NULL),
(419, 52, 'payment_method', 'Cash On Delivery'),
(420, 53, 'first_name', 'sohel'),
(421, 53, 'last_name', 'rana'),
(422, 53, 'address_one', 'dhaka'),
(423, 53, 'address_two', 'dhaka'),
(424, 53, 'phone', '01981368525'),
(425, 53, 'email', 'sohelahmeditebd@gmail.com'),
(426, 53, 'country', 'Bangladesh'),
(427, 53, 'state', 'Dhaka'),
(428, 53, 'city', 'Rampura'),
(429, 53, 'zip', '1400'),
(430, 53, '_customer_user', '2'),
(431, 53, '_billing_postcode', '1400'),
(432, 53, '_billing_company', NULL),
(433, 53, '_billing_last_name', NULL),
(434, 53, '_billing_first_name', NULL),
(435, 53, 'payment_method', 'Cash On Delivery'),
(436, 54, 'stock_status', 'instock'),
(437, 54, 'regular_price', '580'),
(438, 54, 'sale_price', '570'),
(439, 54, 'weight', NULL),
(440, 54, 'length', NULL),
(441, 54, 'width', NULL),
(442, 54, 'height', NULL),
(443, 54, 'product_stock', '520'),
(444, 54, 'start_stock', '520'),
(445, 54, 'default_qty', '8'),
(446, 54, 'alert_qty', '4'),
(447, 54, '_sku', '651'),
(448, 54, 'attached_file', '1612782617.jpg'),
(449, 54, 'gallery_file', '44.jpg'),
(450, 55, 'first_name', 'ইনোভেটিভ টেকনোলজিmehe'),
(451, 55, 'last_name', 'ইন্জিনিয়ারিং'),
(452, 55, 'address_one', 'House# 622, Block# G, Road# 07, Bashundhara Residential Area, Baridhara'),
(453, 55, 'address_two', 'House# 622, Block# G, Road# 07, Bashundhara Residential Area, Baridhara'),
(454, 55, 'phone', '01313010180'),
(455, 55, 'email', 'mehedi@itebd.com'),
(456, 55, 'country', 'Bangladesh'),
(457, 55, 'state', 'Chitagong'),
(458, 55, 'city', 'Bayazid Thana'),
(459, 55, 'zip', '2100'),
(460, 55, '_customer_user', 'cho5fdkg4rh0vgtc6kvsujfsol'),
(461, 55, '_billing_postcode', '2100'),
(462, 55, '_billing_company', NULL),
(463, 55, '_billing_last_name', NULL),
(464, 55, '_billing_first_name', NULL),
(465, 55, 'payment_method', 'Cash On Delivery'),
(466, 56, 'stock_status', 'instock'),
(467, 56, 'regular_price', '5000'),
(468, 56, 'sale_price', '3000'),
(469, 56, 'weight', NULL),
(470, 56, 'length', NULL),
(471, 56, 'width', NULL),
(472, 56, 'height', NULL),
(473, 56, 'product_stock', '1000'),
(474, 56, 'start_stock', '1000'),
(475, 56, 'default_qty', '100'),
(476, 56, 'alert_qty', '16'),
(477, 56, '_sku', '222'),
(478, 56, 'attached_file', '1616319900.jpg'),
(479, 56, 'gallery_file', 'Scarve 1 - Copy.jpg'),
(480, 56, 'gallery_file', 'Scarve 1.jpg'),
(481, 57, 'stock_status', 'instock'),
(482, 57, 'regular_price', '5000'),
(483, 57, 'sale_price', '3000'),
(484, 57, 'weight', NULL),
(485, 57, 'length', NULL),
(486, 57, 'width', NULL),
(487, 57, 'height', NULL),
(488, 57, 'product_stock', '1000'),
(489, 57, 'start_stock', '1000'),
(490, 57, 'default_qty', '99'),
(491, 57, 'alert_qty', '1'),
(492, 57, '_sku', '193'),
(493, 57, 'attached_file', '1616320029.jpg'),
(494, 57, 'gallery_file', '1612154372.jpg'),
(495, 58, 'stock_status', 'instock'),
(496, 58, 'regular_price', '5000'),
(497, 58, 'sale_price', '3000'),
(498, 58, 'weight', NULL),
(499, 58, 'length', NULL),
(500, 58, 'width', NULL),
(501, 58, 'height', NULL),
(502, 58, 'product_stock', '1000'),
(503, 58, 'start_stock', '1000'),
(504, 58, 'default_qty', '109'),
(505, 58, 'alert_qty', '30'),
(506, 58, '_sku', '183'),
(507, 58, 'attached_file', '1616320786.jpg'),
(508, 58, 'gallery_file', '1612154372.jpg'),
(509, 55, 'processing_date', '2021-03-21'),
(510, 59, 'first_name', 'Demo'),
(511, 59, 'last_name', 'User'),
(512, 59, 'address_one', 'dsfdsfsdfsdfsd'),
(513, 59, 'address_two', 'dsfdsfsdfsdfsd'),
(514, 59, 'phone', '0'),
(515, 59, 'email', 'demo@email.com'),
(516, 59, 'country', 'Bangladesh'),
(517, 59, 'state', 'Chitagong'),
(518, 59, 'city', 'Bayazid Thana'),
(519, 59, 'zip', '2100'),
(520, 59, '_customer_user', '4'),
(521, 59, '_billing_postcode', '2100'),
(522, 59, '_billing_company', NULL),
(523, 59, '_billing_last_name', NULL),
(524, 59, '_billing_first_name', NULL),
(525, 59, 'payment_method', 'Cash On Delivery'),
(526, 60, 'first_name', 'Demo'),
(527, 60, 'last_name', 'User'),
(528, 60, 'address_one', 'dsfdsfsdfsdfsd'),
(529, 60, 'address_two', 'dsfdsfsdfsdfsd'),
(530, 60, 'phone', '0'),
(531, 60, 'email', 'demo@email.com'),
(532, 60, 'country', 'Bangladesh'),
(533, 60, 'state', 'Dhaka'),
(534, 60, 'city', 'Rampura'),
(535, 60, 'zip', '1400'),
(536, 60, '_customer_user', '4'),
(537, 60, '_billing_postcode', '1400'),
(538, 60, '_billing_company', NULL),
(539, 60, '_billing_last_name', NULL),
(540, 60, '_billing_first_name', NULL),
(541, 60, 'payment_method', 'Cash On Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime DEFAULT current_timestamp(),
  `post_date_gmt` datetime DEFAULT current_timestamp(),
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime DEFAULT current_timestamp(),
  `post_modified_gmt` datetime NOT NULL DEFAULT current_timestamp(),
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 2, '2021-01-28 16:22:00', '2021-01-28 22:22:00', '<h3 class=\"product_title entry-title\">Banana (সাগর কলা) per piece</h3>', 'Banana', '<h1 class=\"product_title entry-title\">Banana (সাগর কলা) per piece<br />Brand : Other</h1>\r\n<p>per piece<br />our price ৳ 12<br />Stock Available</p>', 'publish', 'open', 'open', '', 'Banana', '', '', '2021-01-28 16:25:18', '2021-01-28 16:25:18', '', 0, 'Banana', 0, 'product', 'featured', 0),
(2, 2, '2021-01-28 16:51:00', '2021-01-28 22:51:00', '<div class=\"clearfix title-cat-wishlist-wrapper\">\r\n<h3 class=\"product_title entry-title\">Beef Premium 1 Kg</h3>\r\n</div>\r\n<div class=\"woocommerce-product-details__short-description-wrapper v2\">\r\n<div class=\"woocommerce-product-details__short-description hideContent\">\r\n<p>Beef Premium per kg<br />Stock Available</p>\r\n</div>\r\n</div>', 'Beef', '<p>Beef Premium per kg<br />Stock Available&nbsp;</p>\r\n<p>latest shop and special offers.</p>', 'publish', 'open', 'open', '', 'Beef', '', '', '2021-01-28 16:54:11', '2021-01-28 16:54:11', '', 0, 'Beef', 0, 'product', 'featured', 0),
(3, 2, '2021-01-28 16:58:00', '2021-01-28 22:58:00', '<div class=\"clearfix title-cat-wishlist-wrapper\">\r\n<h3 class=\"product_title entry-title\">Broiler Chicken Leg 1 Kg</h3>\r\n</div>\r\n<div class=\"woocommerce-product-details__short-description-wrapper v2\">\r\n<div class=\"woocommerce-product-details__short-description showContent\">\r\n<div class=\"leftpane\">\r\n<div id=\"divImgContainer\" class=\"container6\">\r\n<div class=\"ctl_productlagreimg\">\r\n<div class=\"productlagreimg\">\r\n<div id=\"bankImageDiv\" class=\"productimagediv\">\r\n<div class=\"zoomPad\">Broiler Chicken Leg Per Kg 1 Kg</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"rightpane bucket\">\r\n<div class=\"aboutproduct\">\r\n<div class=\"container9\">\r\n<div class=\"ctl_aboutbrand\">\r\n<div class=\"productbrand\"><label class=\"brandlabel\">Brand</label>&nbsp;<strong>:&nbsp;</strong><span class=\"brandlname\">Other</span></div>\r\n</div>\r\n<div class=\"r_bottom\">\r\n<div class=\"l_bottom\">per kg (Final cost based on weight)</div>\r\n</div>\r\n</div>\r\n<div class=\"container11\">\r\n<div class=\"ctl_aboutproduct\">\r\n<p class=\"product_desc\">Stock Available</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Broiler Chicken', '<div class=\"clearfix title-cat-wishlist-wrapper\">\r\n<h1 class=\"product_title entry-title\">Broiler Chicken Leg 1 Kg</h1>\r\n</div>\r\n<div class=\"woocommerce-product-details__short-description-wrapper v2\">\r\n<div class=\"woocommerce-product-details__short-description showContent\">\r\n<div class=\"leftpane\">\r\n<div id=\"divImgContainer\" class=\"container6\">\r\n<div class=\"ctl_productlagreimg\">\r\n<div class=\"productlagreimg\">\r\n<div id=\"bankImageDiv\" class=\"productimagediv\">\r\n<div class=\"zoomPad\">Broiler Chicken Leg Per Kg 1 Kg</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"rightpane bucket\">\r\n<div class=\"aboutproduct\">\r\n<div class=\"container9\">\r\n<div class=\"ctl_aboutbrand\">\r\n<div class=\"productbrand\"><label class=\"brandlabel\">Brand</label>&nbsp;<strong>:&nbsp;</strong><span class=\"brandlname\">Other</span></div>\r\n</div>\r\n<div class=\"r_bottom\">\r\n<div class=\"l_bottom\">per kg (Final cost based on weight)</div>\r\n</div>\r\n</div>\r\n<div class=\"container11\">\r\n<div class=\"ctl_aboutproduct\">\r\n<p class=\"product_desc\">Stock Available</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'publish', 'open', 'open', '', 'Broiler Chicken', '', '', '2021-01-28 17:04:06', '2021-01-28 17:04:06', '', 0, 'BroilerChicken', 0, 'product', 'featured', 0),
(4, 2, '2021-01-28 17:06:00', '2021-01-28 23:06:00', '<p>Broiler Chicken Without Skin per 1Kg<br />Brand : Other<br />per kg (Final cost based on weight)<br />our price ৳ 250<br />Stock Available</p>', 'Chicken Leg Only', '<p>Broiler Chicken Without Skin per 1Kg<br />Brand : Other<br />per kg (Final cost based on weight)<br />our price ৳ 250<br />Stock Available</p>', 'publish', 'open', 'open', '', 'Chicken Leg Only', '', '', '2021-01-28 17:11:17', '2021-01-28 17:11:17', '', 0, 'ChickenLegOnly', 0, 'product', 'featured', 0),
(5, 2, '2021-01-28 17:14:00', '2021-01-28 23:14:00', '<div class=\"leftpane\">\r\n<div id=\"divImgContainer\" class=\"container6\">\r\n<div class=\"ctl_productlagreimg\">\r\n<div class=\"productlagreimg\">\r\n<div id=\"bankImageDiv\" class=\"productimagediv\">\r\n<div class=\"zoomPad\">Capsicum (Red) 1 Kg</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"rightpane bucket\">\r\n<div class=\"aboutproduct\">\r\n<div class=\"container9\">\r\n<div class=\"ctl_aboutbrand\">\r\n<div class=\"productbrand\">per kg (final cost based on weight)</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Capsicum (Red)', '<div class=\"leftpane\">\r\n<div id=\"divImgContainer\" class=\"container6\">\r\n<div class=\"ctl_productlagreimg\">\r\n<div class=\"productlagreimg\">\r\n<div id=\"bankImageDiv\" class=\"productimagediv\">\r\n<div class=\"zoomPad\">Capsicum (Red) 1 Kg</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"rightpane bucket\">\r\n<div class=\"aboutproduct\">\r\n<div class=\"container9\">\r\n<div class=\"ctl_aboutbrand\">\r\n<div class=\"productbrand\">per kg (final cost based on weight)</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'publish', 'open', 'open', '', 'Capsicum (Red)', '', '', '2021-01-28 17:20:45', '2021-01-28 17:20:45', '', 0, 'Capsicum(Red)', 0, 'product', 'featured', 0),
(6, 2, '2021-01-28 17:23:00', '2021-01-28 23:23:00', '<p>Special Vegetable<br />per kg (final cost based on weight)<br />Stock Available</p>', 'Special Vegetable', '<p>Special Vegetable<br />per kg (final cost based on weight)<br />Stock Available</p>', 'publish', 'open', 'open', '', 'Special Vegetable', '', '', '2021-01-28 17:27:10', '2021-01-28 17:27:10', '', 0, 'SpecialVegetable', 0, 'product', 'featured', 0),
(7, 1, '2021-01-28 00:00:00', '2021-01-28 23:35:38', '', 'Order2021-01-28 17:35:38', '', 'delivered', 'open', 'close', 'order_1247', 'order-Jan-28-2021-1701', '', '', '2021-01-28 17:42:25', '2021-01-28 17:35:38', 'Sundarban', 0, NULL, 0, 'shop_order', NULL, 0),
(8, 2, '2021-01-28 17:40:55', '2021-01-28 23:40:55', '7', 'invoice', '', 'publish', 'open', 'open', '', 'inv-1', '', '', '2021-01-28 17:40:55', '2021-01-28 17:40:55', 'Sundarban', 0, NULL, 0, 'invoice', NULL, 0),
(9, 2, '2021-01-28 17:40:55', '2021-01-28 23:40:55', '', '7', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-28 17:40:55', '2021-01-28 17:40:55', 'Sundarban', 8, NULL, 0, 'invoice_order', NULL, 0),
(10, 1, '2021-01-28 00:00:00', '2021-01-28 23:43:31', '', 'Order2021-01-28 17:43:31', '', 'delivered', 'open', 'open', 'order_1247', 'order-Jan-28-2021-1701', '', '', '2021-01-28 17:45:20', '2021-01-28 17:43:31', 'SA Paribahan', 0, NULL, 0, 'shop_order', NULL, 0),
(11, 2, '2021-01-28 17:44:31', '2021-01-28 23:44:31', '10', 'invoice', '', 'publish', 'open', 'open', '', 'inv-2', '', '', '2021-01-28 17:44:31', '2021-01-28 17:44:31', 'SA Paribahan', 0, NULL, 0, 'invoice', NULL, 0),
(12, 2, '2021-01-28 17:44:31', '2021-01-28 23:44:31', '', '10', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-28 17:44:31', '2021-01-28 17:44:31', 'SA Paribahan', 11, NULL, 0, 'invoice_order', NULL, 0),
(13, 2, '2021-01-28 17:52:00', '2021-01-28 23:52:00', '<div class=\"leftpane\">\r\n<div id=\"divImgContainer\" class=\"container6\">\r\n<div class=\"ctl_productlagreimg\">\r\n<div class=\"productlagreimg\">\r\n<div id=\"bankImageDiv\" class=\"productimagediv\">\r\n<div class=\"zoomPad\">Apple Fuji (Per) kg</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"rightpane bucket\">\r\n<div class=\"aboutproduct\">\r\n<div class=\"container9\">\r\n<div class=\"ctl_aboutbrand\">\r\n<div class=\"productbrand\"><label class=\"brandlabel\">Brand</label>&nbsp;<strong>:&nbsp;</strong><span class=\"brandlname\">n/a</span></div>\r\n</div>\r\n<div class=\"r_bottom\">\r\n<div class=\"l_bottom\">\r\n<p class=\"product_desc\">Per Kg</p>\r\n<p class=\"product_desc\">Stock Available</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Apple', '<div class=\"leftpane\">\r\n<div id=\"divImgContainer\" class=\"container6\">\r\n<div class=\"ctl_productlagreimg\">\r\n<div class=\"productlagreimg\">\r\n<div id=\"bankImageDiv\" class=\"productimagediv\">\r\n<div class=\"zoomPad\">Apple Fuji (Per) kg</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"rightpane bucket\">\r\n<div class=\"aboutproduct\">\r\n<div class=\"container9\">\r\n<div class=\"ctl_aboutbrand\">\r\n<div class=\"productbrand\"><label class=\"brandlabel\">Brand</label>&nbsp;<strong>:&nbsp;</strong><span class=\"brandlname\">n/a</span></div>\r\n</div>\r\n<div class=\"r_bottom\">\r\n<div class=\"l_bottom\">\r\n<p class=\"product_desc\">Per Kg</p>\r\n<p class=\"product_desc\">Stock Available</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'publish', 'open', 'open', '', 'Apple', '', '', '2021-01-28 17:52:54', '2021-01-28 17:52:54', '', 0, 'Apple', 0, 'product', 'featured', 0),
(14, 2, '2021-01-28 17:58:00', '2021-01-28 23:58:00', '<div class=\"ctl_aboutbrand\">\r\n<h3>Hilsha Fish (0.700 &ndash; 0.799 Kg)</h3>\r\n<div class=\"productbrand\"><label class=\"brandlabel\">Brand</label><strong>:&nbsp;</strong><span class=\"brandlname\">Innovative Agro</span></div>\r\n</div>\r\n<div class=\"r_bottom\">\r\n<div class=\"l_bottom\">Stock Available</div>\r\n</div>', 'Hilsha Fish', '<div class=\"ctl_aboutbrand\">\r\n<h5>Hilsha Fish (0.700 &ndash; 0.799 Kg)</h5>\r\n<div class=\"productbrand\"><label class=\"brandlabel\">Brand</label><strong>:&nbsp;</strong><span class=\"brandlname\">Innovative Agro</span></div>\r\n</div>\r\n<div class=\"r_bottom\">\r\n<div class=\"l_bottom\">Stock Available</div>\r\n</div>', 'publish', 'open', 'open', '', 'Hilsha Fish', '', '', '2021-01-28 18:00:48', '2021-01-28 18:00:48', '', 0, 'HilshaFish', 0, 'product', 'featured', 0),
(15, 2, '2021-01-31 09:10:00', '2021-01-31 15:10:00', 'slider Image', 'slider Image', 'slider Image', 'publish', 'open', 'open', '', 'slider Image', '', '', '2021-01-31 09:10:21', '2021-01-31 09:10:21', '', 0, NULL, 0, 'slider', NULL, 0),
(16, 2, '2021-01-31 09:10:00', '2021-01-31 15:10:00', 'slider Image', 'slider Image', 'slider Image', 'publish', 'open', 'open', '', 'slider Image', '', '', '2021-01-31 09:10:28', '2021-01-31 09:10:28', '', 0, NULL, 0, 'slider', NULL, 0),
(18, 2, '2021-01-31 10:47:00', '2021-01-31 16:47:00', 'slider Image', 'slider Image', 'slider Image', 'publish', 'open', 'open', '', 'slider Image', '', '', '2021-01-31 10:47:10', '2021-01-31 10:47:10', '', 0, NULL, 0, 'slider', NULL, 0),
(19, 0, '2021-01-31 00:00:00', '2021-01-31 19:28:48', '', 'Order2021-01-31 13:28:48', '', 'delivered', 'open', 'open', 'order_1247', 'order-Jan-31-2021-1301', '', '', '2021-01-31 13:33:32', '2021-01-31 13:28:48', 'DHL', 0, NULL, 0, 'shop_order', NULL, 0),
(20, 2, '2021-01-31 13:31:27', '2021-01-31 19:31:27', '19', 'invoice', '', 'publish', 'open', 'open', '', 'inv-3', '', '', '2021-01-31 13:31:27', '2021-01-31 13:31:27', 'DHL', 0, NULL, 0, 'invoice', NULL, 0),
(21, 2, '2021-01-31 13:31:27', '2021-01-31 19:31:27', '', '19', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 13:31:27', '2021-01-31 13:31:27', 'DHL', 20, NULL, 0, 'invoice_order', NULL, 0),
(22, 1, '2021-01-31 00:00:00', '2021-01-31 19:47:11', '', 'Order2021-01-31 13:47:11', '', 'delivered', 'open', 'close', 'order_1247', 'order-Jan-31-2021-1301', '', '', '2021-01-31 13:58:22', '2021-01-31 13:47:11', 'Continental', 0, NULL, 0, 'shop_order', NULL, 0),
(23, 2, '2021-01-31 13:54:11', '2021-01-31 19:54:11', '22', 'invoice', '', 'publish', 'open', 'open', '', 'inv-4', '', '', '2021-01-31 13:54:11', '2021-01-31 13:54:11', 'Continental', 0, NULL, 0, 'invoice', NULL, 0),
(24, 2, '2021-01-31 13:54:11', '2021-01-31 19:54:11', '', '22', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 13:54:11', '2021-01-31 13:54:11', 'Continental', 23, NULL, 0, 'invoice_order', NULL, 0),
(25, 1, '2021-01-31 14:09:36', '2021-01-31 14:09:36', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Help', 'ok thanks', 'publish', 'open', 'open', '', '', '', '', '2021-01-31 14:09:36', '2021-01-31 14:09:36', '', 0, NULL, 0, 'genarel_quiry', NULL, 0),
(26, 5, '2021-01-31 00:00:00', '2021-01-31 22:57:43', '', 'Order2021-01-31 16:57:43', '', 'delivered', 'open', 'close', 'order_1247', 'order-Jan-31-2021-1601', '', '', '2021-01-31 17:47:03', '2021-01-31 16:57:43', 'partho', 0, NULL, 0, 'shop_order', NULL, 0),
(27, 2, '2021-01-31 00:00:00', '2021-01-31 23:03:52', '', 'Order2021-01-31 17:03:52', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Jan-31-2021-1701', '', '', '2021-01-31 05:35:13', '2021-01-31 17:03:52', '', 0, NULL, 0, 'shop_order', NULL, 0),
(28, 2, '2021-01-31 00:00:00', '2021-01-31 23:11:43', '', 'Order2021-01-31 17:11:43', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Jan-31-2021-1701', '', '', '2021-01-31 05:32:17', '2021-01-31 17:11:43', '', 0, NULL, 0, 'shop_order', NULL, 0),
(29, 2, '2021-01-31 00:00:00', '2021-01-31 23:17:34', '', 'Order2021-01-31 17:17:34', '', 'dispatch', 'open', 'close', 'order_1247', 'order-Jan-31-2021-1701', '', '', '2021-01-31 17:39:40', '2021-01-31 17:17:34', 'agro', 0, NULL, 0, 'shop_order', NULL, 0),
(30, 2, '2021-01-31 00:00:00', '2021-01-31 23:28:19', '', 'Order2021-01-31 17:28:19', '', 'dispatch', 'open', 'close', 'order_1247', 'order-Jan-31-2021-1701', '', '', '2021-01-31 17:39:40', '2021-01-31 17:28:19', 'agro', 0, NULL, 0, 'shop_order', NULL, 0),
(31, 2, '2021-01-31 17:39:40', '2021-01-31 23:39:40', '29,30', 'invoice', '', 'publish', 'open', 'open', '', 'inv-5', '', '', '2021-01-31 17:39:40', '2021-01-31 17:39:40', 'agro', 0, NULL, 0, 'invoice', NULL, 0),
(32, 2, '2021-01-31 17:39:40', '2021-01-31 23:39:40', '', '29', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 17:39:40', '2021-01-31 17:39:40', 'agro', 31, NULL, 0, 'invoice_order', NULL, 0),
(33, 2, '2021-01-31 17:39:40', '2021-01-31 23:39:40', '', '30', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 17:39:40', '2021-01-31 17:39:40', 'agro', 31, NULL, 0, 'invoice_order', NULL, 0),
(34, 2, '2021-01-31 00:00:00', '2021-01-31 23:40:52', '', 'Order2021-01-31 17:40:52', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Jan-31-2021-1701', '', '', '2021-02-01 09:56:08', '2021-01-31 17:40:52', 'dfs', 0, NULL, 0, 'shop_order', NULL, 0),
(35, 2, '2021-01-31 17:41:21', '2021-01-31 23:41:21', '34', 'invoice', '', 'publish', 'open', 'open', '', 'inv-6', '', '', '2021-01-31 17:41:21', '2021-01-31 17:41:21', 'dfs', 0, NULL, 0, 'invoice', NULL, 0),
(36, 2, '2021-01-31 17:41:21', '2021-01-31 23:41:21', '', '34', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 17:41:21', '2021-01-31 17:41:21', 'dfs', 35, NULL, 0, 'invoice_order', NULL, 0),
(37, 2, '2021-01-31 00:00:00', '2021-01-31 23:41:56', '', 'Order2021-01-31 17:41:56', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Jan-31-2021-1701', '', '', '2021-02-01 09:53:00', '2021-01-31 17:41:56', 'aminul', 0, NULL, 0, 'shop_order', NULL, 0),
(38, 2, '2021-01-31 17:42:36', '2021-01-31 23:42:36', '37', 'invoice', '', 'publish', 'open', 'open', '', 'inv-7', '', '', '2021-01-31 17:42:36', '2021-01-31 17:42:36', 'aminul', 0, NULL, 0, 'invoice', NULL, 0),
(39, 2, '2021-01-31 17:42:36', '2021-01-31 23:42:36', '', '37', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 17:42:36', '2021-01-31 17:42:36', 'aminul', 38, NULL, 0, 'invoice_order', NULL, 0),
(40, 2, '2021-01-31 00:00:00', '2021-01-31 23:43:03', '', 'Order2021-01-31 17:43:03', '', 'delivered', 'open', 'open', 'order_1247', 'order-Jan-31-2021-1701', '', '', '2021-01-31 17:48:17', '2021-01-31 17:43:03', 'ddd', 0, NULL, 0, 'shop_order', NULL, 0),
(41, 2, '2021-01-31 17:43:52', '2021-01-31 23:43:52', '40', 'invoice', '', 'publish', 'open', 'open', '', 'inv-8', '', '', '2021-01-31 17:43:52', '2021-01-31 17:43:52', 'ddd', 0, NULL, 0, 'invoice', NULL, 0),
(42, 2, '2021-01-31 17:43:52', '2021-01-31 23:43:52', '', '40', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 17:43:52', '2021-01-31 17:43:52', 'ddd', 41, NULL, 0, 'invoice_order', NULL, 0),
(43, 2, '2021-01-31 17:46:04', '2021-01-31 23:46:04', '26', 'invoice', '', 'publish', 'open', 'open', '', 'inv-9', '', '', '2021-01-31 17:46:04', '2021-01-31 17:46:04', 'partho', 0, NULL, 0, 'invoice', NULL, 0),
(44, 2, '2021-01-31 17:46:04', '2021-01-31 23:46:04', '', '26', '', 'publish', 'open', 'open', '', 'invoice_order', '', '', '2021-01-31 17:46:04', '2021-01-31 17:46:04', 'partho', 43, NULL, 0, 'invoice_order', NULL, 0),
(45, 2, '2021-02-01 09:50:37', '2021-02-01 09:50:37', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget ornare odio. Pellentesque vulputate rhoncus lorem, vel mattis risus volutpat eget. Quisque elementum neque eget magna tempus, eu laoreet nulla viverra', 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget ornare odio. Pellentesque vulputate rhoncus lorem', 'publish', 'open', 'open', '', '', '', '', '2021-02-01 09:50:37', '2021-02-01 09:50:37', '', 0, NULL, 0, 'genarel_quiry', NULL, 0),
(46, 2, '2021-02-01 09:51:35', '2021-02-01 09:51:35', 'Proin vitae elit erat. Morbi commodo euismod ligula non ultricies. Nulla facilisi. Vivamus rhoncus, ex vitae malesuada imperdiet, tellus nibh rutrum sem, et fermentum risus nulla non arcu. Phasellus sed purus consequat, mattis massa sed, tincidunt quam. Morbi sollicitudin nunc risus, ut porttitor leo laoreet at. Aenean finibus non purus sed pellentesque. Morbi at risus at orci euismod fringilla. Proin pretium dictum orci et lobortis. Aenean ut dui arcu. In tortor magna, mattis eu neque ac, malesuada vestibulum urna. Aenean non arcu lacus.', 'some text', 'Proin vitae elit erat. Morbi commodo euismod ligula non ultricies. Nulla facilisi. Vivamus rhoncus, ex vitae malesuada imperdiet, tellus nibh rutrum sem, et fermentum risus nulla non arcu. Phasellus sed purus consequat, mattis massa sed, tincidunt quam. Morbi sollicitudin nunc risus, ut porttitor leo laoreet at. Aenean finibus non purus sed pellentesque. Morbi at risus at orci euismod fringilla. Proin pretium dictum orci et lobortis. Aenean ut dui arcu. In tortor magna, mattis eu neque ac, malesuada vestibulum urna. Aenean non arcu lacus.Proin vitae elit erat. Morbi commodo euismod ligula non ultricies. Nulla facilisi. Vivamus rhoncus, ex vitae malesuada imperdiet, tellus nibh rutrum sem, et fermentum risus nulla non arcu. Phasellus sed purus consequat, mattis massa sed, tincidunt quam. Morbi sollicitudin nunc risus, ut porttitor leo laoreet at. Aenean finibus non purus sed pellentesque. Morbi at risus at orci euismod fringilla. Proin pretium dictum orci et lobortis. Aenean ut dui arcu. In tortor magna, mattis eu neque ac, malesuada vestibulum urna. Aenean non arcu lacus.', 'publish', 'open', 'open', '', '', '', '', '2021-02-01 09:51:35', '2021-02-01 09:51:35', '', 0, NULL, 0, 'genarel_quiry', NULL, 0),
(47, 2, '2021-02-01 00:00:00', '2021-02-01 15:57:09', '', 'Order2021-02-01 09:57:09', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Feb-01-2021-0902', '', '', '2021-02-01 09:57:09', '2021-02-01 09:57:09', '', 0, NULL, 0, 'shop_order', NULL, 0),
(48, 2, '2021-02-01 00:00:00', '2021-02-01 15:57:44', '', 'Order2021-02-01 09:57:44', '', 'cancelled', 'open', 'open', 'order_1247', 'order-Feb-01-2021-0902', '', '', '2021-02-01 09:58:00', '2021-02-01 09:57:44', '', 0, NULL, 0, 'shop_order', NULL, 0),
(49, 2, '2021-02-01 00:00:00', '2021-02-01 16:00:21', '', 'Order2021-02-01 10:00:21', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Feb-01-2021-1002', '', '', '2021-02-01 10:00:21', '2021-02-01 10:00:21', '', 0, NULL, 0, 'shop_order', NULL, 0),
(50, 2, '2021-02-01 10:24:00', '2021-02-01 16:24:00', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget ornare odio. Pellentesque vulputate rhoncus lorem, vel mattis risus volutpat eget.&nbsp;</p>', 'milk', '<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed auctor at felis ut ornare. Ut blandit dolor eget magna laoreet, eu auctor mi vehicula. Aenean in convallis nunc. Suspendisse in dolor lectus. Suspendisse potenti. Pellentesque nec dignissim justo. Suspendisse potenti. Sed sed eros malesuada</p>', 'unpublish', 'open', 'open', '', 'milk', '', '', '2021-02-01 10:28:27', '2021-02-01 10:28:27', '', 0, 'milk', 0, 'product', NULL, 0),
(51, 1, '2021-02-01 11:01:27', '2021-02-01 11:01:27', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'support', 'Lorem Ipsum', 'publish', 'open', 'open', '', '', '', '', '2021-02-01 11:01:27', '2021-02-01 11:01:27', '', 0, NULL, 0, 'genarel_quiry', NULL, 0),
(52, 2, '2021-02-07 00:00:00', '2021-02-07 23:14:55', '', 'Order2021-02-07 17:14:55', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Feb-07-2021-1702', '', '', '2021-02-07 17:14:55', '2021-02-07 17:14:55', '', 0, NULL, 0, 'shop_order', NULL, 0),
(53, 2, '2021-02-07 00:00:00', '2021-02-07 23:38:20', '', 'Order2021-02-07 17:38:20', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Feb-07-2021-1702', '', '', '2021-02-07 17:38:20', '2021-02-07 17:38:20', '', 0, NULL, 0, 'shop_order', NULL, 0),
(54, 2, '2021-02-08 17:09:00', '2021-02-08 23:09:00', '<p>beef&nbsp;</p>\r\n<p>1kg</p>', 'Beef', '<p>Beef</p>\r\n<p>1kg</p>', 'publish', 'open', 'open', '', 'Beef', '', '', '2021-02-08 17:10:17', '2021-02-08 17:10:17', '', 0, 'Beef', 0, 'product', NULL, 0),
(55, 0, '2021-02-08 00:00:00', '2021-02-08 23:14:02', '', 'Order2021-02-08 17:14:02', '', 'processing', 'open', 'open', 'order_1247', 'order-Feb-08-2021-1702', '', '', '2021-03-21 16:46:49', '2021-02-08 17:14:02', '', 0, NULL, 0, 'shop_order', NULL, 0),
(56, 2, '2021-03-21 15:42:00', '2021-03-21 21:42:00', '<p>xczxczxczx</p>', 'multiple item', '<p>zxczxczxczxc</p>', 'publish', 'open', 'open', '', 'multiple item', '', '', '2021-03-21 15:45:00', '2021-03-21 15:45:00', '', 0, 'multipleitem', 0, 'product', NULL, 0),
(57, 2, '2021-03-21 15:46:00', '2021-03-21 21:46:00', '<p>sadasdasd</p>', 'aminul', '<p>fgdfgdfg</p>', 'publish', 'open', 'open', '', 'aminul', '', '', '2021-03-21 15:47:09', '2021-03-21 15:47:09', '', 0, 'aminul', 0, 'product', NULL, 0),
(58, 2, '2021-03-21 15:58:00', '2021-03-21 21:58:00', '<p>ghfghfhg</p>', 'sohel', '<p>lkjhlkjlkj</p>', 'publish', 'open', 'open', '', 'sohel', '', '', '2021-03-21 15:59:46', '2021-03-21 15:59:46', '', 0, 'sohel', 0, 'product', NULL, 0),
(59, 4, '2021-04-27 00:00:00', '2021-04-27 14:23:43', '', 'Order2021-04-27 08:23:43', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Apr-27-2021-0804', '', '', '2021-04-27 08:23:43', '2021-04-27 08:23:43', '', 0, NULL, 0, 'shop_order', NULL, 0),
(60, 4, '2021-04-27 00:00:00', '2021-04-27 14:27:25', '', 'Order2021-04-27 08:27:25', '', 'on-hold', 'open', 'open', 'order_1247', 'order-Apr-27-2021-0804', '', '', '2021-04-27 08:27:25', '2021-04-27 08:27:25', '', 0, NULL, 0, 'shop_order', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_attibutes`
--

CREATE TABLE `product_attibutes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `product_parent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxonomy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2020-10-28 10:48:52', '2021-01-28 07:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 13),
(1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` bigint(20) NOT NULL,
  `session_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zones`
--

CREATE TABLE `shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zone_locations`
--

CREATE TABLE `shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_zone_methods`
--

CREATE TABLE `shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL,
  `tax_rate_country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_locations`
--

CREATE TABLE `tax_rate_locations` (
  `location_id` bigint(20) NOT NULL,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_attribute_stock`
--

CREATE TABLE `temp_attribute_stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termmeta`
--

CREATE TABLE `termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cat_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `cat_status` tinyint(4) NOT NULL DEFAULT 1,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `name`, `slug`, `cat_image`, `term_group`, `status`, `cat_status`, `createdDate`) VALUES
(1, 'Nut', 'nut', '1612952195.jpg', 0, 1, 1, '2021-01-28 14:57:39'),
(2, 'Egg', 'egg', '1612952406.jpeg', 0, 1, 1, '2021-01-28 15:00:09'),
(3, 'Dairy Product', 'dairy-product', '1612951571.jpg', 0, 1, 1, '2021-01-28 16:12:49'),
(4, 'Vegetable & Fruit', 'vegetable-fruit', '1612784130.jpg', 0, 1, 1, '2021-01-28 16:14:13'),
(5, 'Green', 'green', NULL, 0, 1, 1, '2021-01-28 16:17:10'),
(6, 'Red', 'red', NULL, 0, 1, 1, '2021-01-28 16:17:19'),
(7, 'Xl', 'xl', NULL, 0, 1, 1, '2021-01-28 16:17:57'),
(8, 'M', 'm', NULL, 0, 1, 1, '2021-01-28 16:18:02'),
(9, 'S', 's', NULL, 0, 1, 1, '2021-01-28 16:18:06'),
(10, 'Meat', 'meat', '1612953104.jpg', 0, 1, 1, '2021-01-28 16:41:22'),
(11, 'Dhaka', 'dhaka', NULL, 0, 1, 1, '2021-01-28 17:34:41'),
(12, 'Rampura', 'rampura', NULL, 0, 1, 1, '2021-01-28 17:35:06'),
(13, 'Fish', 'fish', '1612953310.jpg', 0, 1, 1, '2021-01-28 17:57:54'),
(14, 'XXl', 'xxl', NULL, 0, 1, 1, '2021-01-31 10:30:23'),
(15, 'Chitagong', 'chitagong', NULL, 0, 1, 1, '2021-01-31 10:40:00'),
(16, 'Bayazid Thana', 'bayazid Thana', NULL, 0, 1, 1, '2021-01-31 10:41:26'),
(17, 'Blue', 'blue', NULL, 0, 1, 1, '2021-02-01 11:14:18'),
(18, 'Cooking Item', 'cooking-item', '1612952848.jpg', 0, 1, 1, '2021-02-08 16:59:22'),
(19, 'Offer', 'offer', '1612783800.jpg', 0, 1, 1, '2021-02-08 17:01:22'),
(20, 'Baby Food & Care', 'baby-food-care', '1612951400.jpg', 18, 1, 1, '2021-02-08 17:03:21'),
(21, 'Personal Care', 'personal-care', '1612953591.png', 0, 1, 1, '2021-02-10 16:39:51'),
(22, 'Snacks Item', 'snacks-item', '1612953991.jpg', 0, 1, 1, '2021-02-10 16:46:31'),
(23, 'Dry Vegetable', 'dry-vegetable', '1612958599.jpg', 18, 1, 1, '2021-02-10 18:03:19'),
(24, 'Lentil or Dal', 'lentil-or-dal', '1612958826.png', 18, 1, 1, '2021-02-10 18:07:06'),
(25, 'Salt & Sugar', 'salt-sugar', '1612959009.png', 18, 1, 1, '2021-02-10 18:10:09'),
(26, 'Flour (Atta & Moyda)', 'flour-atta-moyda', '1612959192.png', 18, 1, 1, '2021-02-10 18:13:12'),
(27, 'Egg 1', 'egg-1', '1616319219.jpg', 2, 0, 0, '2021-03-21 15:29:59'),
(28, 'Egg 2', 'egg-2', '1616319211.jpg', 2, 0, 0, '2021-03-21 15:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `term_relationships`
--

CREATE TABLE `term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_relationships`
--

INSERT INTO `term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 4, 0),
(2, 10, 0),
(3, 10, 0),
(4, 10, 0),
(5, 3, 0),
(6, 3, 0),
(13, 4, 0),
(14, 13, 0),
(50, 3, 0),
(54, 20, 0),
(56, 3, 0),
(56, 2, 0),
(56, 1, 0),
(57, 1, 0),
(57, 2, 0),
(57, 3, 0),
(57, 4, 0),
(56, 4, 0),
(58, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `term_taxonomy`
--

CREATE TABLE `term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_taxonomy`
--

INSERT INTO `term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`, `createdDate`) VALUES
(1, 1, 'product_cat', '', 0, 0, '2021-01-28 14:57:39'),
(2, 2, 'product_cat', '', 0, 0, '2021-01-28 15:00:09'),
(3, 3, 'product_cat', '', 0, 0, '2021-01-28 16:12:49'),
(4, 4, 'product_cat', '', 0, 0, '2021-01-28 16:14:13'),
(5, 5, 'color', '', 0, 0, '2021-01-28 16:17:10'),
(6, 6, 'color', '', 0, 0, '2021-01-28 16:17:19'),
(7, 7, 'size', '', 0, 0, '2021-01-28 16:17:57'),
(8, 8, 'size', '', 0, 0, '2021-01-28 16:18:02'),
(9, 9, 'size', '', 0, 0, '2021-01-28 16:18:06'),
(10, 10, 'product_cat', '', 0, 0, '2021-01-28 16:41:22'),
(11, 11, 'district', '100', 0, 0, '2021-01-28 17:34:41'),
(12, 12, 'city', NULL, 11, 0, '2021-01-28 17:35:06'),
(13, 12, 'postcode', '1400', 12, 0, '2021-01-28 17:35:06'),
(14, 13, 'product_cat', '', 0, 0, '2021-01-28 17:57:54'),
(15, 14, 'size', '', 0, 0, '2021-01-31 10:30:23'),
(16, 15, 'district', '200', 0, 0, '2021-01-31 10:40:00'),
(17, 16, 'city', NULL, 15, 0, '2021-01-31 10:41:26'),
(18, 16, 'postcode', '2100', 16, 0, '2021-01-31 10:41:26'),
(19, 17, 'color', '', 0, 0, '2021-02-01 11:14:18'),
(20, 18, 'product_cat', '', 0, 0, '2021-02-08 16:59:22'),
(21, 19, 'product_cat', '', 0, 1, '2021-02-08 17:01:22'),
(22, 20, 'product_cat', '', 0, 0, '2021-02-08 17:03:21'),
(23, 21, 'product_cat', '', 0, 0, '2021-02-10 16:39:51'),
(24, 22, 'product_cat', '', 0, 0, '2021-02-10 16:46:31'),
(25, 23, 'product_cat', '', 0, 0, '2021-02-10 18:03:19'),
(26, 24, 'product_cat', '', 0, 0, '2021-02-10 18:07:06'),
(27, 25, 'product_cat', '', 0, 0, '2021-02-10 18:10:09'),
(28, 26, 'product_cat', '', 0, 0, '2021-02-10 18:13:12'),
(29, 27, 'product_cat', '', 0, 0, '2021-03-21 15:29:59'),
(30, 28, 'product_cat', '', 0, 0, '2021-03-21 15:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `usermeta`
--

CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usermeta`
--

INSERT INTO `usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(51, '1', 'first_name', 'Aminul'),
(52, '1', 'last_name', 'Islam'),
(3, '1', 'address_two', 'Uttara,Dhaka'),
(53, '1', 'phone', '01752719574'),
(5, '1', 'user_image', 'user.png'),
(47, '1', 'address_one', 'Chitagong'),
(48, '1', 'district', '15'),
(49, '1', 'city', '16'),
(50, '1', 'zip', '2100'),
(54, '1', 'user_email', 'a.soton7@gmail.com'),
(163, '2', 'first_name', 'sohel'),
(164, '2', 'last_name', 'rana'),
(24, '2', 'address_two', 'Uttara,Dhaka'),
(165, '2', 'phone', '01981368525'),
(26, '2', 'user_image', 'user.png'),
(28, '', 'mail_subscribe', 'reeda3596@gmail.com'),
(29, '3', 'first_name', 'iVsGNxSY'),
(30, '3', 'last_name', 'khxHrzXNZYEf'),
(31, '3', 'address_two', 'Uttara,Dhaka'),
(32, '3', 'phone', '0'),
(33, '3', 'user_image', 'user.png'),
(187, '4', 'first_name', 'Demo'),
(188, '4', 'last_name', 'User'),
(36, '4', 'address_two', 'weqwewqe'),
(189, '4', 'phone', '0'),
(38, '4', 'user_image', 'user.png'),
(39, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'address_one', 'Chitagong'),
(40, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'district', '15'),
(41, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'city', '16'),
(42, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'zip', '2100'),
(43, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'first_name', 'Aminul'),
(44, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'last_name', 'Islam'),
(45, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'phone', '01752719574'),
(46, 'f4ouoej6ovd1uu4ksc5u3tq6d8', 'user_email', 'a.soton7@gmail.com'),
(55, '', 'mail_subscribe', 'a.soton7@gmail.com'),
(65, '5', 'first_name', 'shahin'),
(66, '5', 'last_name', 'khan'),
(58, '5', 'address_two', 'Uttara,Dhaka'),
(67, '5', 'phone', '0'),
(60, '5', 'user_image', 'user.png'),
(61, '5', 'address_one', 'dhaka'),
(62, '5', 'district', '15'),
(63, '5', 'city', '16'),
(64, '5', 'zip', '2100'),
(68, '5', 'user_email', 'hm.sohelrana95@gmail.com'),
(159, '2', 'address_one', 'dhaka'),
(160, '2', 'district', '11'),
(161, '2', 'city', '12'),
(162, '2', 'zip', '1400'),
(166, '2', 'user_email', 'sohelahmeditebd@gmail.com'),
(149, '', 'mail_subscribe', 'khan@gmail.com'),
(150, '', 'mail_subscribe', 'sohelahmeditebd@gmail.com'),
(167, 'cho5fdkg4rh0vgtc6kvsujfsol', 'address_one', 'House# 622, Block# G, Road# 07, Bashundhara Residential Area, Baridhara'),
(168, 'cho5fdkg4rh0vgtc6kvsujfsol', 'district', '15'),
(169, 'cho5fdkg4rh0vgtc6kvsujfsol', 'city', '16'),
(170, 'cho5fdkg4rh0vgtc6kvsujfsol', 'zip', '2100'),
(171, 'cho5fdkg4rh0vgtc6kvsujfsol', 'first_name', 'ইনোভেটিভ টেকনোলজিmehe'),
(172, 'cho5fdkg4rh0vgtc6kvsujfsol', 'last_name', 'ইন্জিনিয়ারিং'),
(173, 'cho5fdkg4rh0vgtc6kvsujfsol', 'phone', '01313010180'),
(174, 'cho5fdkg4rh0vgtc6kvsujfsol', 'user_email', 'mehedi@itebd.com'),
(183, '4', 'address_one', 'dsfdsfsdfsdfsd'),
(184, '4', 'district', '11'),
(185, '4', 'city', '12'),
(186, '4', 'zip', '1400'),
(190, '4', 'user_email', 'demo@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aminul', 'Islam', 'a.soton7@gmail.com', NULL, '$2y$10$nqfj4B0lGvMjezUk2tUMoeSxFtD.NbYiaW4JpS3.amfAXxqFwF6j6', NULL, NULL, NULL, 1, '2021-01-28 11:32:53', '2021-01-28 11:32:53'),
(2, 'sohel', 'rana', 'sohelahmeditebd@gmail.com', NULL, '$2y$10$BRJrZFjUx5NDDJbTUnh7NerZY03RJEVfoqYjZUzCGWvH22xquZjjS', NULL, NULL, NULL, 1, '2021-01-28 11:59:26', '2021-01-28 11:59:26'),
(3, 'iVsGNxSY', 'khxHrzXNZYEf', 'reeda3596@gmail.com', NULL, '$2y$10$5csTwbS/gtJxG2RhL/UvRu7wTkp3M5jJvAoMOP0fBxPO.1QCo2DWm', NULL, NULL, NULL, 1, '2021-01-28 20:08:42', '2021-01-28 20:08:42'),
(4, 'Demo', 'User', 'demo@email.com', NULL, '$2y$10$btBFRHsZd4c6ZPD0aNXJauscEDYd1FltdIfDySW7krzyvUx1DTUc.', NULL, NULL, NULL, 1, '2021-01-31 03:03:42', '2021-01-31 03:03:42'),
(5, 'shahin', 'khan', 'hm.sohelrana95@gmail.com', NULL, '$2y$10$bfO/zrGkOjhENRjnt6t2dekTOk5zRZqqOw7Rv0IvhaxVSLlk0vHHq', NULL, NULL, NULL, 1, '2021-01-31 10:44:12', '2021-01-31 10:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_permissions`
--

INSERT INTO `users_permissions` (`user_id`, `permission_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 13),
(2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_cart`
--

CREATE TABLE `user_cart` (
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 4, 6, NULL, NULL),
(2, 5, 13, NULL, NULL),
(3, 5, 1, NULL, NULL),
(4, 5, 3, NULL, NULL),
(5, 5, 14, NULL, NULL),
(6, 5, 5, NULL, NULL),
(7, 5, 6, NULL, NULL),
(8, 2, 4, NULL, NULL),
(9, 2, 1, NULL, NULL),
(10, 2, 14, NULL, NULL),
(11, 2, 13, NULL, NULL),
(12, 4, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_commentmeta`
--

INSERT INTO `wp_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'customer_review', '3'),
(2, 2, 'customer_review', '5'),
(3, 3, 'customer_review', '5'),
(4, 4, 'customer_review', NULL),
(5, 5, 'customer_review', '4');

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '2021-01-17 23:59:59',
  `comment_date_gmt` datetime NOT NULL DEFAULT '2021-01-17 23:59:59',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 13, 'sohel', 'sohelahmeditebd@gmail.com', '', '', '2021-01-28 00:00:00', '2021-01-17 23:59:59', 'nice', 0, '1', '', 'product_review', 0, 2),
(2, 6, 'sohel', 'sohelahmeditebd@gmail.com', '', '', '2021-01-28 00:00:00', '2021-01-17 23:59:59', 'beautiful', 0, '1', '', 'product_review', 0, 2),
(3, 5, 'sohel', 'sohelahmeditebd@gmail.com', '', '', '2021-01-28 00:00:00', '2021-01-17 23:59:59', 'nice', 0, '1', '', 'product_review', 0, 2),
(4, 14, 'sohel', 'sohelahmeditebd@gmail.com', '', '', '2021-01-28 00:00:00', '2021-01-17 23:59:59', 'thank for delivery at time', 0, '1', '', 'product_review', 0, 2),
(5, 4, 'Demo', 'demo@email.com', '', '', '2021-04-27 00:00:00', '2021-01-17 23:59:59', 'fdssdfsdf', 0, '0', '', 'product_review', 0, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `attribute_taxonomies`
--
ALTER TABLE `attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(191));

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecommerce_termmeta`
--
ALTER TABLE `ecommerce_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `meta_key` (`meta_key`(250)),
  ADD KEY `woocommerce_term_id` (`ecommerce_term_id`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `order_itemmeta`
--
ALTER TABLE `order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_tokenmeta`
--
ALTER TABLE `payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `payment_tokens`
--
ALTER TABLE `payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postmeta`
--
ALTER TABLE `postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `product_attibutes`
--
ALTER TABLE `product_attibutes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `post_id` (`post_id`) USING BTREE,
  ADD KEY `meta_key` (`taxonomy`(191)) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `shipping_zone_locations`
--
ALTER TABLE `shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_type_code` (`location_type`,`location_code`(90));

--
-- Indexes for table `shipping_zone_methods`
--
ALTER TABLE `shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(191)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(191)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `tax_rate_locations`
--
ALTER TABLE `tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type` (`location_type`),
  ADD KEY `location_type_code` (`location_type`,`location_code`(90));

--
-- Indexes for table `temp_attribute_stock`
--
ALTER TABLE `temp_attribute_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `termmeta`
--
ALTER TABLE `termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `term_relationships`
--
ALTER TABLE `term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `usermeta`
--
ALTER TABLE `usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`(250)),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user_cart`
--
ALTER TABLE `user_cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`) USING BTREE,
  ADD KEY `comment_id` (`comment_id`) USING BTREE,
  ADD KEY `meta_key` (`meta_key`(191)) USING BTREE;

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`) USING BTREE,
  ADD KEY `comment_post_ID` (`comment_post_ID`) USING BTREE,
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`) USING BTREE,
  ADD KEY `comment_date_gmt` (`comment_date_gmt`) USING BTREE,
  ADD KEY `comment_parent` (`comment_parent`) USING BTREE,
  ADD KEY `comment_author_email` (`comment_author_email`(10)) USING BTREE,
  ADD KEY `woo_idx_comment_type` (`comment_type`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `key_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_taxonomies`
--
ALTER TABLE `attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ecommerce_termmeta`
--
ALTER TABLE `ecommerce_termmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_itemmeta`
--
ALTER TABLE `order_itemmeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=563;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payment_tokenmeta`
--
ALTER TABLE `payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_tokens`
--
ALTER TABLE `payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `postmeta`
--
ALTER TABLE `postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product_attibutes`
--
ALTER TABLE `product_attibutes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `shipping_zones`
--
ALTER TABLE `shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zone_locations`
--
ALTER TABLE `shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_zone_methods`
--
ALTER TABLE `shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rate_locations`
--
ALTER TABLE `tax_rate_locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_attribute_stock`
--
ALTER TABLE `temp_attribute_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `termmeta`
--
ALTER TABLE `termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `usermeta`
--
ALTER TABLE `usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_cart`
--
ALTER TABLE `user_cart`
  MODIFY `cart_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
