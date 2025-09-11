-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+deb12u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 11, 2025 at 12:17 PM
-- Server version: 10.11.11-MariaDB-0+deb12u1
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librebooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `accessory_id` smallint(5) UNSIGNED NOT NULL,
  `accessory_name` varchar(85) NOT NULL,
  `accessory_quantity` smallint(5) UNSIGNED DEFAULT NULL,
  `legacyid` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`accessory_id`, `accessory_name`, `accessory_quantity`, `legacyid`) VALUES
(1, 'Accessory', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_activation`
--

CREATE TABLE `account_activation` (
  `account_activation_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `activation_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcementid` mediumint(8) UNSIGNED NOT NULL,
  `announcement_text` text NOT NULL,
  `priority` mediumint(8) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `display_page` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_groups`
--

CREATE TABLE `announcement_groups` (
  `announcementid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_resources`
--

CREATE TABLE `announcement_resources` (
  `announcementid` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blackout_instances`
--

CREATE TABLE `blackout_instances` (
  `blackout_instance_id` int(10) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `blackout_series_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blackout_series`
--

CREATE TABLE `blackout_series` (
  `blackout_series_id` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(85) NOT NULL,
  `description` text DEFAULT NULL,
  `owner_id` mediumint(8) UNSIGNED NOT NULL,
  `legacyid` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `repeat_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `repeat_options` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blackout_series_resources`
--

CREATE TABLE `blackout_series_resources` (
  `blackout_series_id` int(10) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_log`
--

CREATE TABLE `credit_log` (
  `credit_log_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `original_credit_count` decimal(7,2) DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT NULL,
  `credit_note` varchar(1000) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_attributes`
--

CREATE TABLE `custom_attributes` (
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `display_label` varchar(50) NOT NULL,
  `display_type` tinyint(2) UNSIGNED NOT NULL,
  `attribute_category` tinyint(2) UNSIGNED NOT NULL,
  `validation_regex` varchar(50) DEFAULT NULL,
  `is_required` tinyint(1) UNSIGNED NOT NULL,
  `possible_values` text DEFAULT NULL,
  `sort_order` tinyint(2) UNSIGNED DEFAULT NULL,
  `admin_only` tinyint(1) UNSIGNED DEFAULT NULL,
  `secondary_category` tinyint(2) UNSIGNED DEFAULT NULL,
  `secondary_entity_ids` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_private` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_attribute_entities`
--

CREATE TABLE `custom_attribute_entities` (
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `entity_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_attribute_values`
--

CREATE TABLE `custom_attribute_values` (
  `custom_attribute_value_id` int(8) UNSIGNED NOT NULL,
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `attribute_value` text NOT NULL,
  `entity_id` mediumint(8) UNSIGNED NOT NULL,
  `attribute_category` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_time_blocks`
--

CREATE TABLE `custom_time_blocks` (
  `custom_time_block_id` smallint(5) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `layout_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dbversion`
--

CREATE TABLE `dbversion` (
  `version_number` double UNSIGNED NOT NULL DEFAULT 0,
  `version_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dbversion`
--

INSERT INTO `dbversion` (`version_number`, `version_date`) VALUES
(2.1, '2025-09-09 17:00:42'),
(2.2, '2025-09-09 17:00:42'),
(2.3, '2025-09-09 17:00:43'),
(2.4, '2025-09-09 17:00:43'),
(2.5, '2025-09-09 17:00:43'),
(2.6, '2025-09-09 17:00:43'),
(2.7, '2025-09-09 17:00:44'),
(2.8, '2025-09-09 17:00:44'),
(2.9, '2025-09-09 17:00:44'),
(3, '2025-09-09 17:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `admin_group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `legacyid` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isdefault` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `admin_group_id`, `legacyid`, `isdefault`) VALUES
(1, 'Administrators', NULL, NULL, 0),

-- --------------------------------------------------------

--
-- Table structure for table `group_resource_permissions`
--

CREATE TABLE `group_resource_permissions` (
  `group_id` smallint(5) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `permission_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_roles`
--

CREATE TABLE `group_roles` (
  `group_id` smallint(8) UNSIGNED NOT NULL,
  `role_id` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_roles`
--

INSERT INTO `group_roles` (`group_id`, `role_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `layouts`
--

CREATE TABLE `layouts` (
  `layout_id` mediumint(8) UNSIGNED NOT NULL,
  `timezone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `layout_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layouts`
--

INSERT INTO `layouts` (`layout_id`, `timezone`, `layout_type`) VALUES
(1, '__TIMEZONE__', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_area`
--

CREATE TABLE `mrbs_area` (
  `id` int(11) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `area_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_admin_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `default_duration` int(11) DEFAULT NULL,
  `default_duration_all_day` tinyint(4) NOT NULL DEFAULT 0,
  `morningstarts` int(11) DEFAULT NULL,
  `morningstarts_minutes` int(11) DEFAULT NULL,
  `eveningends` int(11) DEFAULT NULL,
  `eveningends_minutes` int(11) DEFAULT NULL,
  `private_enabled` tinyint(4) DEFAULT NULL,
  `private_default` tinyint(4) DEFAULT NULL,
  `private_mandatory` tinyint(4) DEFAULT NULL,
  `private_override` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_create_ahead_enabled` tinyint(4) DEFAULT NULL,
  `min_create_ahead_secs` int(11) DEFAULT NULL,
  `max_create_ahead_enabled` tinyint(4) DEFAULT NULL,
  `max_create_ahead_secs` int(11) DEFAULT NULL,
  `min_delete_ahead_enabled` tinyint(4) DEFAULT NULL,
  `min_delete_ahead_secs` int(11) DEFAULT NULL,
  `max_delete_ahead_enabled` tinyint(4) DEFAULT NULL,
  `max_delete_ahead_secs` int(11) DEFAULT NULL,
  `max_per_day_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_per_day` int(11) NOT NULL DEFAULT 0,
  `max_per_week_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_per_week` int(11) NOT NULL DEFAULT 0,
  `max_per_month_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_per_month` int(11) NOT NULL DEFAULT 0,
  `max_per_year_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_per_year` int(11) NOT NULL DEFAULT 0,
  `max_per_future_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_per_future` int(11) NOT NULL DEFAULT 0,
  `max_secs_per_day_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_secs_per_day` int(11) NOT NULL DEFAULT 0,
  `max_secs_per_week_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_secs_per_week` int(11) NOT NULL DEFAULT 0,
  `max_secs_per_month_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_secs_per_month` int(11) NOT NULL DEFAULT 0,
  `max_secs_per_year_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_secs_per_year` int(11) NOT NULL DEFAULT 0,
  `max_secs_per_future_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_secs_per_future` int(11) NOT NULL DEFAULT 0,
  `max_duration_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `max_duration_secs` int(11) NOT NULL DEFAULT 0,
  `max_duration_periods` int(11) NOT NULL DEFAULT 0,
  `custom_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_enabled` tinyint(4) DEFAULT NULL,
  `reminders_enabled` tinyint(4) DEFAULT NULL,
  `enable_periods` tinyint(4) DEFAULT NULL,
  `periods` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_enabled` tinyint(4) DEFAULT NULL,
  `confirmed_default` tinyint(4) DEFAULT NULL,
  `times_along_top` tinyint(4) NOT NULL DEFAULT 0,
  `default_type` char(1) NOT NULL DEFAULT 'E'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mrbs_area`
--

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `sort_key`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_create_ahead_enabled`, `min_create_ahead_secs`, `max_create_ahead_enabled`, `max_create_ahead_secs`, `min_delete_ahead_enabled`, `min_delete_ahead_secs`, `max_delete_ahead_enabled`, `max_delete_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `max_secs_per_day_enabled`, `max_secs_per_day`, `max_secs_per_week_enabled`, `max_secs_per_week`, `max_secs_per_month_enabled`, `max_secs_per_month`, `max_secs_per_year_enabled`, `max_secs_per_year`, `max_secs_per_future_enabled`, `max_secs_per_future`, `max_duration_enabled`, `max_duration_secs`, `max_duration_periods`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `periods`, `confirmation_enabled`, `confirmed_default`, `times_along_top`, `default_type`) VALUES
(1, 0, 'base', 'base', '__TIMEZONE__', NULL, 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 0, 36000, 0, 90000, 0, 360000, 0, 360000, 0, 7200, 2, NULL, 0, 1, 0, '[\"Period 1\",\"Period 2\"]', 1, 1, 0, 'I');

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_entry`
--

CREATE TABLE `mrbs_entry` (
  `id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT 'Unix timestamp',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT 'Unix timestamp',
  `entry_type` int(11) NOT NULL DEFAULT 0,
  `repeat_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL DEFAULT 1,
  `timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ical_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT 0,
  `ical_recur_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_registration` tinyint(4) NOT NULL DEFAULT 0,
  `registrant_limit` int(11) NOT NULL DEFAULT 0,
  `registrant_limit_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `registration_opens` int(11) NOT NULL DEFAULT 1209600 COMMENT 'Seconds before the start time',
  `registration_opens_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `registration_closes` int(11) NOT NULL DEFAULT 0 COMMENT 'Seconds before the start_time',
  `registration_closes_enabled` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_participants`
--

CREATE TABLE `mrbs_participants` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_repeat`
--

CREATE TABLE `mrbs_repeat` (
  `id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT 'Unix timestamp',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT 'Unix timestamp',
  `rep_type` int(11) NOT NULL DEFAULT 0,
  `end_date` int(11) NOT NULL DEFAULT 0 COMMENT 'Unix timestamp',
  `rep_opt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `room_id` int(11) NOT NULL DEFAULT 1,
  `timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rep_interval` smallint(6) NOT NULL DEFAULT 1,
  `month_absolute` smallint(6) DEFAULT NULL,
  `month_relative` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ical_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_room`
--

CREATE TABLE `mrbs_room` (
  `id` int(11) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `area_id` int(11) NOT NULL DEFAULT 0,
  `room_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sort_key` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `room_admin_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalid_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON encoded',
  `custom_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mrbs_room`
--

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `invalid_types`, `custom_html`) VALUES
(1, 0, 1, 'room1', 'room1', '', 0, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_sessions`
--

CREATE TABLE `mrbs_sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED DEFAULT NULL COMMENT 'Unix timestamp',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `mrbs_users`
--

CREATE TABLE `mrbs_users` (
  `id` int(11) NOT NULL,
  `level` smallint(6) NOT NULL DEFAULT 0,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` int(11) NOT NULL DEFAULT 0,
  `reset_key_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_key_expiry` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mrbs_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_variables`
--

CREATE TABLE `mrbs_variables` (
  `id` int(11) NOT NULL,
  `variable_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mrbs_variables`
--

INSERT INTO `mrbs_variables` (`id`, `variable_name`, `variable_content`) VALUES
(1, 'db_version', '82'),
(2, 'local_db_version', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_zoneinfo`
--

CREATE TABLE `mrbs_zoneinfo` (
  `id` int(11) NOT NULL,
  `timezone` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `outlook_compatible` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `vtimezone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_updated` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_configuration`
--

CREATE TABLE `payment_configuration` (
  `credit_cost` decimal(7,2) UNSIGNED NOT NULL,
  `credit_currency` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `credit_count` int(10) UNSIGNED NOT NULL DEFAULT 1 CHECK (`credit_count` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_configuration`
--

INSERT INTO `payment_configuration` (`credit_cost`, `credit_currency`, `credit_count`) VALUES
(0.00, 'USD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_settings`
--

CREATE TABLE `payment_gateway_settings` (
  `gateway_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `setting_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `setting_value` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transaction_log`
--

CREATE TABLE `payment_transaction_log` (
  `payment_transaction_log_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `invoice_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `subtotal_amount` decimal(7,2) NOT NULL,
  `tax_amount` decimal(7,2) NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  `transaction_fee` decimal(7,2) DEFAULT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `transaction_href` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `refund_href` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `gateway_date_created` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `payment_response` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peak_times`
--

CREATE TABLE `peak_times` (
  `peak_times_id` mediumint(8) UNSIGNED NOT NULL,
  `schedule_id` smallint(5) UNSIGNED NOT NULL,
  `all_day` tinyint(1) UNSIGNED NOT NULL,
  `start_time` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `end_time` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `every_day` tinyint(1) UNSIGNED NOT NULL,
  `peak_days` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `all_year` tinyint(1) UNSIGNED NOT NULL,
  `begin_month` tinyint(1) UNSIGNED NOT NULL,
  `begin_day` tinyint(1) UNSIGNED NOT NULL,
  `end_month` tinyint(1) UNSIGNED NOT NULL,
  `end_day` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotas`
--

CREATE TABLE `quotas` (
  `quota_id` mediumint(8) UNSIGNED NOT NULL,
  `quota_limit` decimal(7,2) UNSIGNED NOT NULL,
  `unit` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `duration` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `resource_id` smallint(5) UNSIGNED DEFAULT NULL,
  `group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `schedule_id` smallint(5) UNSIGNED DEFAULT NULL,
  `enforced_days` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `enforced_time_start` time DEFAULT NULL,
  `enforced_time_end` time DEFAULT NULL,
  `scope` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transaction_log`
--

CREATE TABLE `refund_transaction_log` (
  `refund_transaction_log_id` int(10) UNSIGNED NOT NULL,
  `payment_transaction_log_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total_refund_amount` decimal(7,2) NOT NULL,
  `payment_refund_amount` decimal(7,2) DEFAULT NULL,
  `fee_refund_amount` decimal(7,2) DEFAULT NULL,
  `transaction_href` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `gateway_date_created` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `refund_response` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `reminder_id` int(11) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `message` text NOT NULL,
  `sendtime` datetime NOT NULL,
  `refnumber` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_accessories`
--

CREATE TABLE `reservation_accessories` (
  `series_id` int(10) UNSIGNED NOT NULL,
  `accessory_id` smallint(5) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_color_rules`
--

CREATE TABLE `reservation_color_rules` (
  `reservation_color_rule_id` mediumint(8) UNSIGNED NOT NULL,
  `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL,
  `attribute_type` smallint(5) UNSIGNED DEFAULT NULL,
  `required_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `comparison_type` smallint(5) UNSIGNED DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_files`
--

CREATE TABLE `reservation_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `series_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `file_type` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_size` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `file_extension` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_guests`
--

CREATE TABLE `reservation_guests` (
  `reservation_instance_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `reservation_user_level` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_instances`
--

CREATE TABLE `reservation_instances` (
  `reservation_instance_id` int(10) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reference_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `series_id` int(10) UNSIGNED NOT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `checkout_date` datetime DEFAULT NULL,
  `previous_end_date` datetime DEFAULT NULL,
  `credit_count` decimal(7,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_reminders`
--

CREATE TABLE `reservation_reminders` (
  `reminder_id` int(11) UNSIGNED NOT NULL,
  `series_id` int(10) UNSIGNED NOT NULL,
  `minutes_prior` int(10) UNSIGNED NOT NULL,
  `reminder_type` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_resources`
--

CREATE TABLE `reservation_resources` (
  `series_id` int(10) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `resource_level_id` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_series`
--

CREATE TABLE `reservation_series` (
  `series_id` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allow_participation` tinyint(1) UNSIGNED NOT NULL,
  `allow_anon_participation` tinyint(1) UNSIGNED NOT NULL,
  `type_id` tinyint(2) UNSIGNED NOT NULL,
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `repeat_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `repeat_options` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `owner_id` mediumint(8) UNSIGNED NOT NULL,
  `legacyid` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_action_by` mediumint(8) UNSIGNED DEFAULT NULL,
  `terms_date_accepted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_statuses`
--

CREATE TABLE `reservation_statuses` (
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `label` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_statuses`
--

INSERT INTO `reservation_statuses` (`status_id`, `label`) VALUES
(1, 'Created'),
(2, 'Deleted'),
(3, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_types`
--

CREATE TABLE `reservation_types` (
  `type_id` tinyint(2) UNSIGNED NOT NULL,
  `label` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_types`
--

INSERT INTO `reservation_types` (`type_id`, `label`) VALUES
(1, 'Reservation'),
(2, 'Blackout');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_users`
--

CREATE TABLE `reservation_users` (
  `reservation_instance_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `reservation_user_level` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_waitlist_requests`
--

CREATE TABLE `reservation_waitlist_requests` (
  `reservation_waitlist_request_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `min_duration` int(11) DEFAULT NULL,
  `min_increment` int(11) DEFAULT NULL,
  `max_duration` int(11) DEFAULT NULL,
  `unit_cost` decimal(7,2) DEFAULT NULL,
  `autoassign` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `requires_approval` tinyint(1) UNSIGNED NOT NULL,
  `allow_multiday_reservations` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `max_participants` mediumint(8) UNSIGNED DEFAULT NULL,
  `min_notice_time_add` int(11) DEFAULT NULL,
  `max_notice_time` int(11) DEFAULT NULL,
  `image_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `schedule_id` smallint(5) UNSIGNED NOT NULL,
  `legacyid` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `admin_group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `public_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` smallint(5) UNSIGNED DEFAULT NULL,
  `resource_type_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `status_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `resource_status_reason_id` smallint(5) UNSIGNED DEFAULT NULL,
  `buffer_time` int(10) UNSIGNED DEFAULT NULL,
  `enable_check_in` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `auto_release_minutes` smallint(5) UNSIGNED DEFAULT NULL,
  `color` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `allow_display` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `credit_count` decimal(7,2) UNSIGNED DEFAULT NULL,
  `peak_credit_count` decimal(7,2) UNSIGNED DEFAULT NULL,
  `min_notice_time_update` int(11) DEFAULT NULL,
  `min_notice_time_delete` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `additional_properties` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resource_id`, `name`, `location`, `contact_info`, `description`, `notes`, `min_duration`, `min_increment`, `max_duration`, `unit_cost`, `autoassign`, `requires_approval`, `allow_multiday_reservations`, `max_participants`, `min_notice_time_add`, `max_notice_time`, `image_name`, `schedule_id`, `legacyid`, `admin_group_id`, `public_id`, `allow_calendar_subscription`, `sort_order`, `resource_type_id`, `status_id`, `resource_status_reason_id`, `buffer_time`, `enable_check_in`, `auto_release_minutes`, `color`, `allow_display`, `credit_count`, `peak_credit_count`, `min_notice_time_update`, `min_notice_time_delete`, `date_created`, `last_modified`, `additional_properties`) VALUES
(1, 'Room', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-09-09 17:04:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource_accessories`
--

CREATE TABLE `resource_accessories` (
  `resource_accessory_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `accessory_id` smallint(5) UNSIGNED NOT NULL,
  `minimum_quantity` smallint(6) DEFAULT NULL,
  `maximum_quantity` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_groups`
--

CREATE TABLE `resource_groups` (
  `resource_group_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_group_name` varchar(75) DEFAULT NULL,
  `parent_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `public_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_group_assignment`
--

CREATE TABLE `resource_group_assignment` (
  `resource_group_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_images`
--

CREATE TABLE `resource_images` (
  `resource_image_id` smallint(5) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `image_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_status_reasons`
--

CREATE TABLE `resource_status_reasons` (
  `resource_status_reason_id` smallint(5) UNSIGNED NOT NULL,
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_types`
--

CREATE TABLE `resource_types` (
  `resource_type_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_type_name` varchar(75) DEFAULT NULL,
  `resource_type_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_type_assignment`
--

CREATE TABLE `resource_type_assignment` (
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `resource_type_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` tinyint(2) UNSIGNED NOT NULL,
  `name` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role_level` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `role_level`) VALUES
(1, 'Group Admin', 1),
(2, 'Application Admin', 2),
(3, 'Resource Admin', 3),
(4, 'Schedule Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `saved_reports`
--

CREATE TABLE `saved_reports` (
  `saved_report_id` mediumint(8) UNSIGNED NOT NULL,
  `report_name` varchar(50) DEFAULT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `report_details` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `isdefault` tinyint(1) UNSIGNED NOT NULL,
  `weekdaystart` tinyint(2) UNSIGNED NOT NULL,
  `daysvisible` tinyint(2) UNSIGNED NOT NULL DEFAULT 7,
  `layout_id` mediumint(8) UNSIGNED NOT NULL,
  `legacyid` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `public_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `admin_group_id` smallint(5) UNSIGNED DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `allow_concurrent_bookings` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `default_layout` tinyint(4) NOT NULL DEFAULT 0,
  `total_concurrent_reservations` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `max_resources_per_reservation` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `additional_properties` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `name`, `isdefault`, `weekdaystart`, `daysvisible`, `layout_id`, `legacyid`, `public_id`, `allow_calendar_subscription`, `admin_group_id`, `start_date`, `end_date`, `allow_concurrent_bookings`, `default_layout`, `total_concurrent_reservations`, `max_resources_per_reservation`, `additional_properties`, `notes`, `published`) VALUES
(1, 'Default', 1, 0, 7, 1, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `terms_of_service`
--

CREATE TABLE `terms_of_service` (
  `terms_of_service_id` int(10) UNSIGNED NOT NULL,
  `terms_text` text DEFAULT NULL,
  `terms_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `terms_file` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `applicability` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_blocks`
--

CREATE TABLE `time_blocks` (
  `block_id` mediumint(8) UNSIGNED NOT NULL,
  `label` varchar(85) DEFAULT NULL,
  `end_label` varchar(85) DEFAULT NULL,
  `availability_code` tinyint(2) UNSIGNED NOT NULL,
  `layout_id` mediumint(8) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_blocks`
--

INSERT INTO `time_blocks` (`block_id`, `label`, `end_label`, `availability_code`, `layout_id`, `start_time`, `end_time`, `day_of_week`) VALUES
(1, NULL, NULL, 2, 1, '00:00:00', '08:00:00', NULL),
(2, NULL, NULL, 1, 1, '08:00:00', '08:30:00', NULL),
(3, NULL, NULL, 1, 1, '08:30:00', '09:00:00', NULL),
(4, NULL, NULL, 1, 1, '09:00:00', '09:30:00', NULL),
(5, NULL, NULL, 1, 1, '09:30:00', '10:00:00', NULL),
(6, NULL, NULL, 1, 1, '10:00:00', '10:30:00', NULL),
(7, NULL, NULL, 1, 1, '10:30:00', '11:00:00', NULL),
(8, NULL, NULL, 1, 1, '11:00:00', '11:30:00', NULL),
(9, NULL, NULL, 1, 1, '11:30:00', '12:00:00', NULL),
(10, NULL, NULL, 1, 1, '12:00:00', '12:30:00', NULL),
(11, NULL, NULL, 1, 1, '12:30:00', '13:00:00', NULL),
(12, NULL, NULL, 1, 1, '13:00:00', '13:30:00', NULL),
(13, NULL, NULL, 1, 1, '13:30:00', '14:00:00', NULL),
(14, NULL, NULL, 1, 1, '14:00:00', '14:30:00', NULL),
(15, NULL, NULL, 1, 1, '14:30:00', '15:00:00', NULL),
(16, NULL, NULL, 1, 1, '15:00:00', '15:30:00', NULL),
(17, NULL, NULL, 1, 1, '15:30:00', '16:00:00', NULL),
(18, NULL, NULL, 1, 1, '16:00:00', '16:30:00', NULL),
(19, NULL, NULL, 1, 1, '16:30:00', '17:00:00', NULL),
(20, NULL, NULL, 1, 1, '17:00:00', '17:30:00', NULL),
(21, NULL, NULL, 1, 1, '17:30:00', '18:00:00', NULL),
(22, NULL, NULL, 2, 1, '18:00:00', '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `fname` varchar(85) DEFAULT NULL,
  `lname` varchar(85) DEFAULT NULL,
  `username` varchar(85) DEFAULT NULL,
  `email` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `salt` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `organization` varchar(85) DEFAULT NULL,
  `position` varchar(85) DEFAULT NULL,
  `phone` varchar(85) DEFAULT NULL,
  `timezone` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `language` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `homepageid` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `legacyid` char(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `legacypassword` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `public_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `default_schedule_id` smallint(5) UNSIGNED DEFAULT NULL,
  `credit_count` decimal(7,2) DEFAULT 0.00,
  `terms_date_accepted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_email_preferences`
--

CREATE TABLE `user_email_preferences` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `event_category` varchar(45) CHARACTER SET latin1 COLLATE utf8mb4_general_ci NOT NULL,
  `event_type` varchar(45) CHARACTER SET latin1 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_email_preferences`
--

INSERT INTO `user_email_preferences` (`user_id`, `event_category`, `event_type`) VALUES
(2, 'reservation', 'approved'),
(2, 'reservation', 'created'),
(2, 'reservation', 'deleted'),
(2, 'reservation', 'participation_changed'),
(2, 'reservation', 'series_ending'),
(2, 'reservation', 'updated');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_id`, `group_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `user_preferences_id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`user_preferences_id`, `user_id`, `name`, `value`) VALUES
(2, 1, 'CalendarFilter', '||'),
(5, 2, 'CalendarFilter', '||');

-- --------------------------------------------------------

--
-- Table structure for table `user_resource_permissions`
--

CREATE TABLE `user_resource_permissions` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_id` smallint(5) UNSIGNED NOT NULL,
  `permission_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `permission_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_session`
--

CREATE TABLE `user_session` (
  `user_session_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `last_modified` datetime NOT NULL,
  `session_token` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_session_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_statuses`
--

CREATE TABLE `user_statuses` (
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `description` varchar(85) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_statuses`
--

INSERT INTO `user_statuses` (`status_id`, `description`) VALUES
(1, 'Active'),
(2, 'Awaiting'),
(3, 'Inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`accessory_id`);

--
-- Indexes for table `account_activation`
--
ALTER TABLE `account_activation`
  ADD PRIMARY KEY (`account_activation_id`),
  ADD UNIQUE KEY `activation_code_2` (`activation_code`),
  ADD KEY `activation_code` (`activation_code`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcementid`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `display_page` (`display_page`);

--
-- Indexes for table `announcement_groups`
--
ALTER TABLE `announcement_groups`
  ADD PRIMARY KEY (`announcementid`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `announcement_resources`
--
ALTER TABLE `announcement_resources`
  ADD PRIMARY KEY (`announcementid`,`resource_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indexes for table `blackout_instances`
--
ALTER TABLE `blackout_instances`
  ADD PRIMARY KEY (`blackout_instance_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `blackout_series_id` (`blackout_series_id`);

--
-- Indexes for table `blackout_series`
--
ALTER TABLE `blackout_series`
  ADD PRIMARY KEY (`blackout_series_id`);

--
-- Indexes for table `blackout_series_resources`
--
ALTER TABLE `blackout_series_resources`
  ADD PRIMARY KEY (`blackout_series_id`,`resource_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indexes for table `credit_log`
--
ALTER TABLE `credit_log`
  ADD PRIMARY KEY (`credit_log_id`);

--
-- Indexes for table `custom_attributes`
--
ALTER TABLE `custom_attributes`
  ADD PRIMARY KEY (`custom_attribute_id`),
  ADD KEY `attribute_category` (`attribute_category`),
  ADD KEY `display_label` (`display_label`);

--
-- Indexes for table `custom_attribute_entities`
--
ALTER TABLE `custom_attribute_entities`
  ADD PRIMARY KEY (`custom_attribute_id`,`entity_id`);

--
-- Indexes for table `custom_attribute_values`
--
ALTER TABLE `custom_attribute_values`
  ADD PRIMARY KEY (`custom_attribute_value_id`),
  ADD KEY `custom_attribute_id` (`custom_attribute_id`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `attribute_category` (`attribute_category`);

--
-- Indexes for table `custom_time_blocks`
--
ALTER TABLE `custom_time_blocks`
  ADD PRIMARY KEY (`custom_time_block_id`),
  ADD KEY `layout_id` (`layout_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `admin_group_id` (`admin_group_id`),
  ADD KEY `isdefault` (`isdefault`);

--
-- Indexes for table `group_resource_permissions`
--
ALTER TABLE `group_resource_permissions`
  ADD PRIMARY KEY (`group_id`,`resource_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `group_id_2` (`group_id`),
  ADD KEY `resource_id_2` (`resource_id`);

--
-- Indexes for table `group_roles`
--
ALTER TABLE `group_roles`
  ADD PRIMARY KEY (`group_id`,`role_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `layouts`
--
ALTER TABLE `layouts`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `mrbs_area`
--
ALTER TABLE `mrbs_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_area_name` (`area_name`);

--
-- Indexes for table `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repeat_id` (`repeat_id`),
  ADD KEY `idxStartTime` (`start_time`),
  ADD KEY `idxEndTime` (`end_time`),
  ADD KEY `idxRoomStartEnd` (`room_id`,`start_time`,`end_time`);

--
-- Indexes for table `mrbs_participants`
--
ALTER TABLE `mrbs_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_entryid_username` (`entry_id`,`username`);

--
-- Indexes for table `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `mrbs_room`
--
ALTER TABLE `mrbs_room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_room_name` (`area_id`,`room_name`),
  ADD KEY `idxSortKey` (`sort_key`);

--
-- Indexes for table `mrbs_sessions`
--
ALTER TABLE `mrbs_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idxAccess` (`access`);

--
-- Indexes for table `mrbs_users`
--
ALTER TABLE `mrbs_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_name` (`name`);

--
-- Indexes for table `mrbs_variables`
--
ALTER TABLE `mrbs_variables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_variable_name` (`variable_name`);

--
-- Indexes for table `mrbs_zoneinfo`
--
ALTER TABLE `mrbs_zoneinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_timezone` (`timezone`,`outlook_compatible`);

--
-- Indexes for table `payment_configuration`
--
ALTER TABLE `payment_configuration`
  ADD PRIMARY KEY (`credit_count`);

--
-- Indexes for table `payment_gateway_settings`
--
ALTER TABLE `payment_gateway_settings`
  ADD PRIMARY KEY (`gateway_type`,`setting_name`);

--
-- Indexes for table `payment_transaction_log`
--
ALTER TABLE `payment_transaction_log`
  ADD PRIMARY KEY (`payment_transaction_log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoice_number` (`invoice_number`);

--
-- Indexes for table `peak_times`
--
ALTER TABLE `peak_times`
  ADD PRIMARY KEY (`peak_times_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `quotas`
--
ALTER TABLE `quotas`
  ADD PRIMARY KEY (`quota_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `refund_transaction_log`
--
ALTER TABLE `refund_transaction_log`
  ADD PRIMARY KEY (`refund_transaction_log_id`),
  ADD KEY `payment_transaction_log_id` (`payment_transaction_log_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`reminder_id`),
  ADD KEY `reminders_user_id` (`user_id`);

--
-- Indexes for table `reservation_accessories`
--
ALTER TABLE `reservation_accessories`
  ADD PRIMARY KEY (`series_id`,`accessory_id`),
  ADD KEY `accessory_id` (`accessory_id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `reservation_color_rules`
--
ALTER TABLE `reservation_color_rules`
  ADD PRIMARY KEY (`reservation_color_rule_id`),
  ADD KEY `custom_attribute_id` (`custom_attribute_id`);

--
-- Indexes for table `reservation_files`
--
ALTER TABLE `reservation_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `reservation_guests`
--
ALTER TABLE `reservation_guests`
  ADD PRIMARY KEY (`reservation_instance_id`,`email`),
  ADD KEY `reservation_guests_reservation_instance_id` (`reservation_instance_id`),
  ADD KEY `reservation_guests_email_address` (`email`),
  ADD KEY `reservation_guests_reservation_user_level` (`reservation_user_level`);

--
-- Indexes for table `reservation_instances`
--
ALTER TABLE `reservation_instances`
  ADD PRIMARY KEY (`reservation_instance_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `reference_number` (`reference_number`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `checkin_date` (`checkin_date`);

--
-- Indexes for table `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  ADD PRIMARY KEY (`reminder_id`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `reminder_type` (`reminder_type`);

--
-- Indexes for table `reservation_resources`
--
ALTER TABLE `reservation_resources`
  ADD PRIMARY KEY (`series_id`,`resource_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `reservation_series`
--
ALTER TABLE `reservation_series`
  ADD PRIMARY KEY (`series_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `reservations_owner` (`owner_id`);

--
-- Indexes for table `reservation_statuses`
--
ALTER TABLE `reservation_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `reservation_types`
--
ALTER TABLE `reservation_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `reservation_users`
--
ALTER TABLE `reservation_users`
  ADD PRIMARY KEY (`reservation_instance_id`,`user_id`),
  ADD KEY `reservation_instance_id` (`reservation_instance_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reservation_user_level` (`reservation_user_level`);

--
-- Indexes for table `reservation_waitlist_requests`
--
ALTER TABLE `reservation_waitlist_requests`
  ADD PRIMARY KEY (`reservation_waitlist_request_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resource_id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `admin_group_id` (`admin_group_id`),
  ADD KEY `resource_type_id` (`resource_type_id`),
  ADD KEY `resource_status_reason_id` (`resource_status_reason_id`),
  ADD KEY `auto_release_minutes` (`auto_release_minutes`);

--
-- Indexes for table `resource_accessories`
--
ALTER TABLE `resource_accessories`
  ADD PRIMARY KEY (`resource_accessory_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `accessory_id` (`accessory_id`);

--
-- Indexes for table `resource_groups`
--
ALTER TABLE `resource_groups`
  ADD PRIMARY KEY (`resource_group_id`),
  ADD KEY `resource_groups_parent_id` (`parent_id`);

--
-- Indexes for table `resource_group_assignment`
--
ALTER TABLE `resource_group_assignment`
  ADD PRIMARY KEY (`resource_group_id`,`resource_id`),
  ADD KEY `resource_group_assignment_resource_id` (`resource_id`),
  ADD KEY `resource_group_assignment_resource_group_id` (`resource_group_id`);

--
-- Indexes for table `resource_images`
--
ALTER TABLE `resource_images`
  ADD PRIMARY KEY (`resource_image_id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indexes for table `resource_status_reasons`
--
ALTER TABLE `resource_status_reasons`
  ADD PRIMARY KEY (`resource_status_reason_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `resource_types`
--
ALTER TABLE `resource_types`
  ADD PRIMARY KEY (`resource_type_id`);

--
-- Indexes for table `resource_type_assignment`
--
ALTER TABLE `resource_type_assignment`
  ADD PRIMARY KEY (`resource_id`,`resource_type_id`),
  ADD KEY `resource_type_id` (`resource_type_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `saved_reports`
--
ALTER TABLE `saved_reports`
  ADD PRIMARY KEY (`saved_report_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `layout_id` (`layout_id`),
  ADD KEY `schedules_groups_admin_group_id` (`admin_group_id`);

--
-- Indexes for table `terms_of_service`
--
ALTER TABLE `terms_of_service`
  ADD PRIMARY KEY (`terms_of_service_id`);

--
-- Indexes for table `time_blocks`
--
ALTER TABLE `time_blocks`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `layout_id` (`layout_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `user_email_preferences`
--
ALTER TABLE `user_email_preferences`
  ADD PRIMARY KEY (`user_id`,`event_category`,`event_type`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`user_preferences_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_resource_permissions`
--
ALTER TABLE `user_resource_permissions`
  ADD PRIMARY KEY (`user_id`,`resource_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `resource_id_2` (`resource_id`);

--
-- Indexes for table `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`user_session_id`),
  ADD KEY `user_session_user_id` (`user_id`),
  ADD KEY `user_session_session_token` (`session_token`);

--
-- Indexes for table `user_statuses`
--
ALTER TABLE `user_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `accessory_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_activation`
--
ALTER TABLE `account_activation`
  MODIFY `account_activation_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcementid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blackout_instances`
--
ALTER TABLE `blackout_instances`
  MODIFY `blackout_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blackout_series`
--
ALTER TABLE `blackout_series`
  MODIFY `blackout_series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_log`
--
ALTER TABLE `credit_log`
  MODIFY `credit_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_attributes`
--
ALTER TABLE `custom_attributes`
  MODIFY `custom_attribute_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_attribute_values`
--
ALTER TABLE `custom_attribute_values`
  MODIFY `custom_attribute_value_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_time_blocks`
--
ALTER TABLE `custom_time_blocks`
  MODIFY `custom_time_block_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `layouts`
--
ALTER TABLE `layouts`
  MODIFY `layout_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mrbs_area`
--
ALTER TABLE `mrbs_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mrbs_participants`
--
ALTER TABLE `mrbs_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mrbs_room`
--
ALTER TABLE `mrbs_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mrbs_users`
--
ALTER TABLE `mrbs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mrbs_variables`
--
ALTER TABLE `mrbs_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mrbs_zoneinfo`
--
ALTER TABLE `mrbs_zoneinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_transaction_log`
--
ALTER TABLE `payment_transaction_log`
  MODIFY `payment_transaction_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peak_times`
--
ALTER TABLE `peak_times`
  MODIFY `peak_times_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotas`
--
ALTER TABLE `quotas`
  MODIFY `quota_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transaction_log`
--
ALTER TABLE `refund_transaction_log`
  MODIFY `refund_transaction_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `reminder_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_color_rules`
--
ALTER TABLE `reservation_color_rules`
  MODIFY `reservation_color_rule_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_files`
--
ALTER TABLE `reservation_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_instances`
--
ALTER TABLE `reservation_instances`
  MODIFY `reservation_instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  MODIFY `reminder_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_series`
--
ALTER TABLE `reservation_series`
  MODIFY `series_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_waitlist_requests`
--
ALTER TABLE `reservation_waitlist_requests`
  MODIFY `reservation_waitlist_request_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `resource_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resource_accessories`
--
ALTER TABLE `resource_accessories`
  MODIFY `resource_accessory_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_groups`
--
ALTER TABLE `resource_groups`
  MODIFY `resource_group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_images`
--
ALTER TABLE `resource_images`
  MODIFY `resource_image_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_status_reasons`
--
ALTER TABLE `resource_status_reasons`
  MODIFY `resource_status_reason_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_types`
--
ALTER TABLE `resource_types`
  MODIFY `resource_type_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_reports`
--
ALTER TABLE `saved_reports`
  MODIFY `saved_report_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms_of_service`
--
ALTER TABLE `terms_of_service`
  MODIFY `terms_of_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_blocks`
--
ALTER TABLE `time_blocks`
  MODIFY `block_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `user_preferences_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_session`
--
ALTER TABLE `user_session`
  MODIFY `user_session_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_activation`
--
ALTER TABLE `account_activation`
  ADD CONSTRAINT `account_activation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `announcement_groups`
--
ALTER TABLE `announcement_groups`
  ADD CONSTRAINT `announcement_groups_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE;

--
-- Constraints for table `announcement_resources`
--
ALTER TABLE `announcement_resources`
  ADD CONSTRAINT `announcement_resources_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Constraints for table `blackout_instances`
--
ALTER TABLE `blackout_instances`
  ADD CONSTRAINT `blackout_instances_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE;

--
-- Constraints for table `blackout_series_resources`
--
ALTER TABLE `blackout_series_resources`
  ADD CONSTRAINT `blackout_series_resources_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blackout_series_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_attribute_entities`
--
ALTER TABLE `custom_attribute_entities`
  ADD CONSTRAINT `custom_attribute_entities_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_time_blocks`
--
ALTER TABLE `custom_time_blocks`
  ADD CONSTRAINT `custom_time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`);

--
-- Constraints for table `group_resource_permissions`
--
ALTER TABLE `group_resource_permissions`
  ADD CONSTRAINT `group_resource_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_roles`
--
ALTER TABLE `group_roles`
  ADD CONSTRAINT `group_roles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  ADD CONSTRAINT `mrbs_entry_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mrbs_entry_ibfk_2` FOREIGN KEY (`repeat_id`) REFERENCES `mrbs_repeat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_participants`
--
ALTER TABLE `mrbs_participants`
  ADD CONSTRAINT `mrbs_participants_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `mrbs_entry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  ADD CONSTRAINT `mrbs_repeat_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_room`
--
ALTER TABLE `mrbs_room`
  ADD CONSTRAINT `mrbs_room_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `mrbs_area` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `peak_times`
--
ALTER TABLE `peak_times`
  ADD CONSTRAINT `peak_times_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE;

--
-- Constraints for table `quotas`
--
ALTER TABLE `quotas`
  ADD CONSTRAINT `quotas_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotas_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quotas_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refund_transaction_log`
--
ALTER TABLE `refund_transaction_log`
  ADD CONSTRAINT `refund_transaction_log_ibfk_1` FOREIGN KEY (`payment_transaction_log_id`) REFERENCES `payment_transaction_log` (`payment_transaction_log_id`) ON DELETE CASCADE;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_accessories`
--
ALTER TABLE `reservation_accessories`
  ADD CONSTRAINT `reservation_accessories_ibfk_1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_accessories_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_color_rules`
--
ALTER TABLE `reservation_color_rules`
  ADD CONSTRAINT `reservation_color_rules_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_files`
--
ALTER TABLE `reservation_files`
  ADD CONSTRAINT `reservation_files_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_guests`
--
ALTER TABLE `reservation_guests`
  ADD CONSTRAINT `reservation_guests_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_instances`
--
ALTER TABLE `reservation_instances`
  ADD CONSTRAINT `reservations_series` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_reminders`
--
ALTER TABLE `reservation_reminders`
  ADD CONSTRAINT `reservation_reminders_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_resources`
--
ALTER TABLE `reservation_resources`
  ADD CONSTRAINT `reservation_resources_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_resources_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_series`
--
ALTER TABLE `reservation_series`
  ADD CONSTRAINT `reservations_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_status` FOREIGN KEY (`status_id`) REFERENCES `reservation_statuses` (`status_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_type` FOREIGN KEY (`type_id`) REFERENCES `reservation_types` (`type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `reservation_users`
--
ALTER TABLE `reservation_users`
  ADD CONSTRAINT `reservation_users_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_waitlist_requests`
--
ALTER TABLE `reservation_waitlist_requests`
  ADD CONSTRAINT `reservation_waitlist_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_waitlist_requests_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Constraints for table `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`resource_status_reason_id`) REFERENCES `resource_status_reasons` (`resource_status_reason_id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_accessories`
--
ALTER TABLE `resource_accessories`
  ADD CONSTRAINT `resource_accessories_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resource_accessories_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE;

--
-- Constraints for table `resource_groups`
--
ALTER TABLE `resource_groups`
  ADD CONSTRAINT `resource_groups_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `resource_group_assignment`
--
ALTER TABLE `resource_group_assignment`
  ADD CONSTRAINT `resource_group_assignment_ibfk_1` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resource_group_assignment_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Constraints for table `resource_images`
--
ALTER TABLE `resource_images`
  ADD CONSTRAINT `resource_images_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_type_assignment`
--
ALTER TABLE `resource_type_assignment`
  ADD CONSTRAINT `resource_type_assignment_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resource_type_assignment_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_reports`
--
ALTER TABLE `saved_reports`
  ADD CONSTRAINT `saved_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_groups_admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `time_blocks`
--
ALTER TABLE `time_blocks`
  ADD CONSTRAINT `time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `user_statuses` (`status_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_email_preferences`
--
ALTER TABLE `user_email_preferences`
  ADD CONSTRAINT `user_email_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_resource_permissions`
--
ALTER TABLE `user_resource_permissions`
  ADD CONSTRAINT `user_resource_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_session`
--
ALTER TABLE `user_session`
  ADD CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
