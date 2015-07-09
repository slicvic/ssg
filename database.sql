-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jul 09, 2015 at 05:00 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ssg`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `address1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `company_id` (`company_id`),
  KEY `user_id_2` (`user_id`),
  KEY `company_id_2` (`company_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `company_id`, `address1`, `address2`, `city`, `state`, `postal_code`, `country_id`, `created_at`, `updated_at`) VALUES
(29, 1020, NULL, '', '', '', '', '', 1, '2015-07-07 16:59:43', '2015-07-07 16:59:43'),
(30, 1060, NULL, '', '', '', '', '', 1, '2015-07-07 20:30:59', '2015-07-07 20:30:59'),
(36, NULL, 1, '', '', '', '', '', 1, '2015-07-08 13:15:48', '2015-07-08 13:15:48'),
(41, NULL, 2, '', '', '', '', '', 1, '2015-07-08 20:07:47', '2015-07-08 20:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

CREATE TABLE `carriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_companyid_and_name` (`company_id`,`name`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `carriers`
--

INSERT INTO `carriers` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
(16, NULL, 'UPS', '0000-00-00 00:00:00', '2015-07-08 15:06:50'),
(17, NULL, 'USPS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, NULL, 'FedEx', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, NULL, 'LaserShip', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, NULL, 'KKKLK', '2015-07-08 21:24:16', '2015-07-08 21:24:16'),
(38, 1, 'HELLOMOTTO', '2015-07-08 21:30:37', '2015-07-08 21:30:37'),
(39, 1, 'MACCCY', '2015-07-08 21:56:23', '2015-07-08 21:56:23'),
(40, 1, 'BYEBYE', '2015-07-08 22:17:29', '2015-07-08 22:17:29'),
(41, 1, 'PPPPPPP', '2015-07-08 22:19:34', '2015-07-08 22:19:34'),
(42, 1, 'FEDCULO', '2015-07-08 22:27:03', '2015-07-08 22:27:03'),
(43, 1, 'KAKAKA', '2015-07-08 22:37:40', '2015-07-08 22:37:40'),
(44, 1, 'MESSI', '2015-07-08 22:37:52', '2015-07-08 22:37:52'),
(45, 1, 'MESSSSS', '2015-07-08 22:59:11', '2015-07-08 22:59:11'),
(46, 1, 'IIIIII', '2015-07-08 22:59:15', '2015-07-08 22:59:15'),
(47, 1, 'NNN', '2015-07-08 22:59:53', '2015-07-08 22:59:53'),
(48, 1, 'XXXX444', '2015-07-08 23:06:33', '2015-07-08 23:06:33'),
(49, 1, 'DASDASDASD', '2015-07-09 12:14:43', '2015-07-09 12:14:43'),
(50, 1, 'ASDASDASD', '2015-07-09 12:14:59', '2015-07-09 12:14:59'),
(51, 1, 'XXXXX333', '2015-07-09 12:58:56', '2015-07-09 12:58:56'),
(52, 1, 'SDASDASDASDAS', '2015-07-09 13:01:17', '2015-07-09 13:01:17'),
(53, 1, 'JKGHKGJK', '2015-07-09 13:10:06', '2015-07-09 13:10:06'),
(54, 1, 'KHKHKLLK', '2015-07-09 13:10:56', '2015-07-09 13:10:56'),
(55, 1, 'KLKHLHLHLKH', '2015-07-09 13:12:29', '2015-07-09 13:12:29'),
(56, 1, 'ASDSDSDSD', '2015-07-09 13:25:43', '2015-07-09 13:25:43'),
(57, 1, 'SDASDSDSD', '2015-07-09 13:27:36', '2015-07-09 13:27:36'),
(58, 1, 'WQEQWEW', '2015-07-09 13:34:41', '2015-07-09 13:34:41'),
(59, 1, 'JKGHJKG', '2015-07-09 13:36:09', '2015-07-09 13:36:09'),
(60, 1, 'KJHJKB', '2015-07-09 14:16:04', '2015-07-09 14:16:04'),
(62, 2, 'HELLOMOTTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `corp_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `corp_code`, `phone`, `fax`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Lantigua Group', 'LG', '1234567', '7654321', 'hello@gmail.com', '2015-03-23 22:58:37', '2015-07-08 02:21:36'),
(2, 'Sion Services Group', 'SSG', '', '', '', '2015-03-23 22:59:07', '2015-07-09 14:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `containers`
--

CREATE TABLE `containers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `receipt_type_id` int(10) unsigned NOT NULL,
  `receipt_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `carrier` varchar(32) NOT NULL,
  `departed_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tracking_number` (`receipt_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `containers`
--

INSERT INTO `containers` (`id`, `company_id`, `receipt_type_id`, `receipt_number`, `carrier`, `departed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'FLIGHT 2244242', '', '2015-07-07 19:57:35', '2015-07-07 19:57:38', '2015-07-07 20:19:10');

-- --------------------------------------------------------

--
-- Table structure for table `container_receipt_types`
--

CREATE TABLE `container_receipt_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `container_receipt_types`
--

INSERT INTO `container_receipt_types` (`id`, `code`, `name`) VALUES
(3, 'AWB', 'Air waybill'),
(4, 'BL', 'Bill of Lading');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'United States'),
(2, 'Colombia');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `type_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `length` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `invoice_amount` decimal(12,4) NOT NULL,
  `tracking_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ship` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `type_id` (`type_id`),
  KEY `status_id` (`status_id`),
  KEY `type_id_2` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `warehouse_id`, `type_id`, `status_id`, `length`, `width`, `height`, `weight`, `description`, `invoice_number`, `invoice_amount`, `tracking_number`, `ship`, `created_at`, `updated_at`) VALUES
(98, 54, 1, 5, 0, 0, 0, 0, '', '', 0.0000, '', 1, '2015-07-09 14:16:04', '2015-07-09 14:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `package_statuses`
--

CREATE TABLE `package_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `is_default` tinyint(3) unsigned NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `package_statuses`
--

INSERT INTO `package_statuses` (`id`, `company_id`, `is_default`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Recibido USA', '0000-00-00 00:00:00', '2015-07-08 13:21:02'),
(2, 1, 0, 'En proceso de despacho USA', '0000-00-00 00:00:00', '2015-07-08 13:21:02'),
(3, 1, 0, 'Despachado desde USA', '0000-00-00 00:00:00', '2015-07-08 13:21:02'),
(4, 1, 0, 'Recibido Colombia', '0000-00-00 00:00:00', '2015-07-08 13:21:02'),
(5, 1, 1, 'En reparto Nacional', '0000-00-00 00:00:00', '2015-07-08 13:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `package_types`
--

CREATE TABLE `package_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `package_types`
--

INSERT INTO `package_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Box', '2015-03-23 01:29:12', '2015-07-08 01:30:03'),
(2, 'Piece', '2015-03-23 02:10:00', '2015-03-26 03:30:45'),
(3, 'Bundle', '2015-03-23 02:10:07', '2015-03-26 03:30:50'),
(4, 'Carton', '2015-03-23 02:11:07', '2015-03-26 03:30:54'),
(5, 'Roll', '2015-03-23 02:11:19', '2015-03-26 03:30:59'),
(6, 'Crate', '2015-03-23 02:11:31', '2015-03-26 03:31:03'),
(7, 'Pallet', '2015-03-23 02:11:39', '2015-03-23 02:11:39'),
(8, 'Drum', '2015-03-23 02:11:42', '2015-03-26 03:31:28'),
(9, 'Tube', '2015-03-23 02:11:48', '2015-03-23 02:11:48'),
(10, 'Envolope', '2015-07-08 01:32:53', '2015-07-08 01:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'login', 'Login privileges', '0000-00-00 00:00:00', '2015-07-02 17:16:48'),
(2, 'admin', 'Administrative user, has access to everything.', '0000-00-00 00:00:00', '2015-03-21 17:34:02'),
(3, 'agent', 'A worker of registered company', '0000-00-00 00:00:00', '2015-07-08 03:36:44'),
(4, 'client', 'A customer of registered company', '0000-00-00 00:00:00', '2015-07-08 03:36:54'),
(5, 'shipper', 'A shipper of registered company', '0000-00-00 00:00:00', '2015-07-08 03:37:09'),
(6, 'consignee', 'A consignee', '2015-07-08 14:44:27', '2015-07-08 14:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE `roles_users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1020, 1),
(1020, 2),
(1060, 1),
(1060, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `company_id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Master', 'Master', '2015-03-23 23:20:35', '2015-04-16 12:48:30'),
(2, 2, 'SionBox', 'SionBox Display Name', '2015-03-23 23:05:44', '2015-07-06 18:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `id_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobile_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `autoship_packages` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1073 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `site_id`, `company_id`, `email`, `password`, `company_name`, `first_name`, `last_name`, `dob`, `id_number`, `phone`, `mobile_phone`, `autoship_packages`, `remember_token`, `logins`, `last_login`, `created_at`, `updated_at`) VALUES
(1020, 1, 1, 'admin@gmail.com', '$2y$10$VFv1evnTm9yjB5Vk/ehQPe/BB0gi6Br74WpXLa9EizyJBBJfqnCui', '', 'Victor', 'Admin', '2011-11-11', '13212121212', '1234567', '7654321', 1, 'IGmLCLbQ0hPq0kpTYfBWeacgbxBb44bK4MHU5bmJ8EjIDatO5uhByHzGDlRq', 107, '2015-07-09 12:12:41', '2015-01-29 04:41:09', '2015-07-09 12:12:41'),
(1060, NULL, 2, 'agent@gmail.com', '$2y$10$/KHLLdkQiLuyV6h/bcVjGOk2bK0CETqQxsIF/baD6d6MsZs2/HDrO', '', 'Jose', 'Agent', '0000-00-00', '', '', '', 1, 'dKx4aWyXyJ8FMMfO6MHCdgl0HUaBkOAVsUtqAIBppRIvbWP80OOP1lk7woF9', 4, '2015-07-08 19:26:47', '2015-07-07 20:30:59', '2015-07-08 20:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `shipper_user_id` bigint(20) unsigned NOT NULL,
  `consignee_user_id` bigint(20) unsigned NOT NULL,
  `carrier_id` bigint(20) unsigned DEFAULT NULL,
  `notes` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `arrived_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`carrier_id`),
  KEY `company_id` (`company_id`),
  KEY `shipper_user_id` (`shipper_user_id`),
  KEY `consignee_user_id` (`consignee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `company_id`, `shipper_user_id`, `consignee_user_id`, `carrier_id`, `notes`, `arrived_at`, `created_at`, `updated_at`) VALUES
(54, 1, 1020, 1020, 60, '', '2015-07-09 14:15:00', '2015-07-09 14:16:04', '2015-07-09 14:16:04');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_countries_countryid` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `fk_addresses_companies_companyid` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_addresses_users_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carriers`
--
ALTER TABLE `carriers`
  ADD CONSTRAINT `carriers_companies_companyid` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `fk_packages_warehouses_warehouseid` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `fk_packages_packagestatuses_statusid` FOREIGN KEY (`status_id`) REFERENCES `package_statuses` (`id`),
  ADD CONSTRAINT `fk_packages_packagetypes_typeid` FOREIGN KEY (`type_id`) REFERENCES `package_types` (`id`);

--
-- Constraints for table `package_statuses`
--
ALTER TABLE `package_statuses`
  ADD CONSTRAINT `packagestatuses_companies_companyid` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `fk_rolesusers_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_companies_companyid` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_sites_siteid` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `users_companies_companyid` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `fk_warehouses_carriers_carrierid` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`),
  ADD CONSTRAINT `fk_warehouses_companies_companyid` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `fk_warehouses_users_consigneeid` FOREIGN KEY (`consignee_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_warehouses_users_shipperuserid` FOREIGN KEY (`shipper_user_id`) REFERENCES `users` (`id`);
