-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2020 at 06:25 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `raclinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `ra_complaint`
--

CREATE TABLE `ra_complaint` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `complaint` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0',
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_complaint`
--

INSERT INTO `ra_complaint` (`id`, `patient_id`, `complaint`, `created_date`, `updated_date`, `is_deleted`, `deleted_date`) VALUES
(1, 3, 'fever', '2020-03-26 11:14:04', '2020-03-26 11:14:04', '0', '0000-00-00 00:00:00'),
(2, 4, 'This is collaborative the using energy of the world', '2020-04-01 11:40:28', '2020-04-01 11:40:28', '0', '0000-00-00 00:00:00'),
(3, 6, 'Krishna', '2020-04-27 03:25:04', '2020-04-27 03:25:04', '0', '0000-00-00 00:00:00'),
(4, 7, 'something', '2020-04-27 08:19:22', '2020-04-27 08:19:22', '0', '0000-00-00 00:00:00'),
(5, 7, 'name', '2020-04-27 09:19:22', '2020-04-27 09:19:22', '0', '0000-00-00 00:00:00'),
(6, 7, 'onlinee', '2020-04-27 09:26:52', '2020-04-27 09:26:52', '0', '0000-00-00 00:00:00'),
(7, 7, 'hi', '2020-04-27 09:37:31', '2020-04-27 09:37:31', '0', '0000-00-00 00:00:00'),
(8, 3, 'something', '2020-04-27 12:00:47', '2020-04-27 12:00:47', '0', '0000-00-00 00:00:00'),
(9, 3, 'something', '2020-04-27 12:12:48', '2020-04-27 12:12:48', '0', '0000-00-00 00:00:00'),
(10, 3, 'something', '2020-04-27 12:14:14', '2020-04-27 12:14:14', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_diagnosis`
--

CREATE TABLE `ra_diagnosis` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_diagnosis`
--

INSERT INTO `ra_diagnosis` (`id`, `name`) VALUES
(1, 'nothing'),
(2, 'something'),
(3, 'fever'),
(4, 'diabetes');

-- --------------------------------------------------------

--
-- Table structure for table `ra_diag_patient`
--

CREATE TABLE `ra_diag_patient` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_diag_patient`
--

INSERT INTO `ra_diag_patient` (`id`, `patient_id`, `diagnosis`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 3, 'nothing', '2020-03-26 11:14:10', '0', '0000-00-00 00:00:00'),
(2, 2, 'something', '2020-04-01 01:32:36', '0', '0000-00-00 00:00:00'),
(3, 4, 'nothing,something', '2020-04-01 11:40:28', '0', '0000-00-00 00:00:00'),
(4, 6, 'something', '2020-04-27 03:25:04', '0', '0000-00-00 00:00:00'),
(5, 7, 'nothing', '2020-04-27 08:19:22', '0', '0000-00-00 00:00:00'),
(6, 7, 'fever', '2020-04-27 09:19:23', '0', '0000-00-00 00:00:00'),
(7, 7, 'fever', '2020-04-27 09:26:52', '0', '0000-00-00 00:00:00'),
(8, 7, 'nothing', '2020-04-27 09:37:31', '1', '2020-04-28 03:57:15'),
(9, 3, 'something', '2020-04-27 12:00:47', '0', '0000-00-00 00:00:00'),
(10, 3, 'something', '2020-04-27 12:12:48', '0', '0000-00-00 00:00:00'),
(11, 3, 'diabetes', '2020-04-27 12:14:14', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_exa_patient`
--

CREATE TABLE `ra_exa_patient` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `s_bp` int(11) NOT NULL,
  `d_bp` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `temp` int(11) NOT NULL,
  `spo2` int(11) NOT NULL,
  `rbs` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `bmi` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_exa_patient`
--

INSERT INTO `ra_exa_patient` (`id`, `patient_id`, `s_bp`, `d_bp`, `pr`, `temp`, `spo2`, `rbs`, `weight`, `height`, `bmi`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 3, 110, 80, 80, 98, 0, 0, 0, '', '', '2020-03-26 11:14:05', '0', '0000-00-00 00:00:00'),
(2, 4, 110, 80, 80, 98, 0, 0, 0, '', '', '2020-04-01 11:40:28', '0', '0000-00-00 00:00:00'),
(3, 6, 110, 90, 0, 98, 0, 0, 0, '', '', '2020-04-27 03:25:04', '0', '0000-00-00 00:00:00'),
(4, 7, 110, 70, 80, 98, 0, 0, 0, '', '', '2020-04-27 08:19:22', '0', '0000-00-00 00:00:00'),
(5, 7, 110, 90, 80, 98, 0, 0, 0, '', '', '2020-04-27 09:19:23', '1', '2020-04-27 15:16:10'),
(6, 7, 110, 70, 80, 98, 0, 0, 0, '', '', '2020-04-27 09:26:52', '1', '2020-04-27 15:16:09'),
(7, 7, 110, 90, 0, 98, 0, 0, 0, '', '', '2020-04-27 09:37:30', '1', '2020-04-27 15:16:08'),
(8, 3, 119, 990, 80, 98, 90, 0, 978, '19.8', '12.2', '2020-04-27 12:00:48', '0', '0000-00-00 00:00:00'),
(9, 3, 110, 80, 0, 0, 0, 0, 120, '5', '23.4', '2020-04-27 12:12:48', '0', '0000-00-00 00:00:00'),
(10, 3, 110, 80, 80, 98, 0, 0, 0, '', '', '2020-04-27 12:14:14', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_group`
--

CREATE TABLE `ra_group` (
  `id` int(11) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_group`
--

INSERT INTO `ra_group` (`id`, `groupname`, `permission`) VALUES
(1, 'Administrator', 'a:36:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:11:\"createBrand\";i:9;s:11:\"updateBrand\";i:10;s:9:\"viewBrand\";i:11;s:11:\"deleteBrand\";i:12;s:14:\"createCategory\";i:13;s:14:\"updateCategory\";i:14;s:12:\"viewCategory\";i:15;s:14:\"deleteCategory\";i:16;s:11:\"createStore\";i:17;s:11:\"updateStore\";i:18;s:9:\"viewStore\";i:19;s:11:\"deleteStore\";i:20;s:15:\"createAttribute\";i:21;s:15:\"updateAttribute\";i:22;s:13:\"viewAttribute\";i:23;s:15:\"deleteAttribute\";i:24;s:13:\"createProduct\";i:25;s:13:\"updateProduct\";i:26;s:11:\"viewProduct\";i:27;s:13:\"deleteProduct\";i:28;s:11:\"createOrder\";i:29;s:11:\"updateOrder\";i:30;s:9:\"viewOrder\";i:31;s:11:\"deleteOrder\";i:32;s:11:\"viewReports\";i:33;s:13:\"updateCompany\";i:34;s:11:\"viewProfile\";i:35;s:13:\"updateSetting\";}'),
(2, 'Clinic', 'a:11:{i:0;s:13:\"createPatient\";i:1;s:13:\"updatePatient\";i:2;s:11:\"viewPatient\";i:3;s:13:\"deletePatient\";i:4;s:14:\"createPharmacy\";i:5;s:14:\"updatePharmacy\";i:6;s:12:\"viewPharmacy\";i:7;s:14:\"deletePharmacy\";i:8;s:11:\"viewReports\";i:9;s:11:\"viewProfile\";i:10;s:13:\"updateSetting\";}');

-- --------------------------------------------------------

--
-- Table structure for table `ra_history`
--

CREATE TABLE `ra_history` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `history` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_history`
--

INSERT INTO `ra_history` (`id`, `patient_id`, `history`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 3, 'something', '2020-03-26 11:14:05', '0', '0000-00-00 00:00:00'),
(2, 4, 'Hello the patient world', '2020-04-01 11:40:28', '0', '0000-00-00 00:00:00'),
(3, 6, 'aryal', '2020-04-27 03:25:04', '0', '0000-00-00 00:00:00'),
(4, 7, 'hi', '2020-04-27 08:19:21', '1', '2020-04-27 15:16:01'),
(5, 7, 'on', '2020-04-27 09:19:22', '1', '2020-04-27 15:16:03'),
(6, 7, 'movie', '2020-04-27 09:26:52', '1', '2020-04-27 15:16:04'),
(7, 7, 'something', '2020-04-27 09:37:30', '0', '0000-00-00 00:00:00'),
(8, 3, 'hello', '2020-04-27 12:00:47', '0', '0000-00-00 00:00:00'),
(9, 3, 'is', '2020-04-27 12:12:48', '0', '0000-00-00 00:00:00'),
(10, 3, 'online', '2020-04-27 12:14:14', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_investigation`
--

CREATE TABLE `ra_investigation` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `investigation` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_investigation`
--

INSERT INTO `ra_investigation` (`id`, `patient_id`, `investigation`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 3, 'hello', '2020-03-26 11:14:04', '0', '0000-00-00 00:00:00'),
(2, 4, 'Hi about your world fatty about that', '2020-04-01 11:40:28', '0', '0000-00-00 00:00:00'),
(3, 6, 'something', '2020-04-27 03:25:04', '0', '0000-00-00 00:00:00'),
(4, 7, 'hello mister kullo dai', '2020-04-27 08:19:21', '0', '0000-00-00 00:00:00'),
(5, 7, 'something', '2020-04-27 09:19:23', '0', '0000-00-00 00:00:00'),
(6, 7, 'is', '2020-04-27 09:26:52', '0', '0000-00-00 00:00:00'),
(7, 7, 'wityount', '2020-04-27 09:37:31', '0', '0000-00-00 00:00:00'),
(8, 3, 'nothing to prescirbe', '2020-04-27 12:00:46', '0', '0000-00-00 00:00:00'),
(9, 3, 'very', '2020-04-27 12:12:48', '0', '0000-00-00 00:00:00'),
(10, 3, 'just do it whenever you want to do something', '2020-04-27 12:14:14', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_med_patient`
--

CREATE TABLE `ra_med_patient` (
  `med_patient_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `highlighted` enum('0','1') NOT NULL,
  `assign_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_med_patient`
--

INSERT INTO `ra_med_patient` (`med_patient_id`, `patient_id`, `med_id`, `quantity`, `type`, `total_cost`, `highlighted`, `assign_date`) VALUES
(2, 3, 2, 1, 'Sachet', 500, '1', 1587989692);

-- --------------------------------------------------------

--
-- Table structure for table `ra_patient`
--

CREATE TABLE `ra_patient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL,
  `address` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_patient`
--

INSERT INTO `ra_patient` (`id`, `name`, `year`, `month`, `day`, `gender`, `address`, `created_date`, `updated_date`, `deleted_date`, `is_deleted`) VALUES
(1, 'Khushi', 8, 1, 1, 0, 'Gabaraye', '2020-01-25 03:09:03', '2020-04-27 07:06:52', '2020-04-27 07:06:52', '1'),
(2, 'Some One', 40, 7, 16, 1, 'Gabaraye', '2020-03-10 07:30:29', '2020-03-10 07:30:29', '0000-00-00 00:00:00', '0'),
(3, 'Zaw Zaw', 50, 0, 0, 1, 'myoma', '2020-03-26 11:13:41', '2020-03-26 11:13:41', '0000-00-00 00:00:00', '0'),
(4, 'Someonewillbe', 50, 4, 0, 1, 'Taung Kachin', '2020-04-01 11:39:42', '2020-04-01 11:39:42', '0000-00-00 00:00:00', '0'),
(5, 'Patient5', 19, 0, 0, 1, 'myoma', '2020-04-02 10:19:50', '2020-04-02 10:19:50', '0000-00-00 00:00:00', '0'),
(6, 'Krishna Aryal', 21, 0, 0, 1, 'Taung Kachin', '2020-04-27 03:24:29', '2020-04-27 07:06:52', '2020-04-27 07:06:52', '1'),
(7, 'Krishna', 8, 0, 0, 1, 'myoma', '2020-04-27 08:00:44', '2020-04-27 08:00:44', '0000-00-00 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ra_patient_visit`
--

CREATE TABLE `ra_patient_visit` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visited_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_patient_visit`
--

INSERT INTO `ra_patient_visit` (`id`, `patient_id`, `visited_date`) VALUES
(1, 3, '2020-03-26 11:14:04'),
(2, 3, '2020-03-26 11:14:10'),
(3, 2, '2020-04-24 01:32:36'),
(4, 4, '2020-04-25 17:30:00'),
(5, 6, '2020-04-25 03:25:04'),
(6, 6, '2020-04-27 03:55:14'),
(7, 7, '2020-04-27 08:19:22'),
(8, 7, '2020-04-27 08:20:19'),
(9, 7, '2020-04-27 08:39:45'),
(10, 7, '2020-04-27 08:39:46'),
(11, 7, '2020-04-27 09:19:23'),
(12, 7, '2020-04-27 09:26:52'),
(13, 7, '2020-04-27 09:36:22'),
(14, 7, '2020-04-27 09:37:31'),
(15, 3, '2020-04-27 12:00:47'),
(16, 3, '2020-04-27 12:12:48'),
(17, 3, '2020-04-27 12:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `ra_pharmacy`
--

CREATE TABLE `ra_pharmacy` (
  `id` int(100) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `tab_quantity` int(11) DEFAULT '0',
  `used_quantity` int(10) NOT NULL,
  `remain_quantity` int(10) NOT NULL,
  `remain_tab_quantity` int(11) DEFAULT '0',
  `register_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sell_type` varchar(100) NOT NULL,
  `actual_price` int(10) NOT NULL,
  `selling_price` int(10) NOT NULL,
  `profit_price` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `is_deleted` enum('1','0') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_pharmacy`
--

INSERT INTO `ra_pharmacy` (`id`, `medicine_name`, `quantity`, `tab_quantity`, `used_quantity`, `remain_quantity`, `remain_tab_quantity`, `register_date`, `expire_date`, `description`, `sell_type`, `actual_price`, `selling_price`, `profit_price`, `status`, `is_deleted`, `created_date`, `modified_date`, `deleted_date`) VALUES
(1, 'Ambcet Syrup', 40, 0, 0, 40, 0, '2020-01-28', '2021-09-30', '', 'Bot', 1300, 1500, '200(15%)', '1', '0', '2020-01-28 07:59:53', NULL, NULL),
(2, 'Electral Forte', 40, 0, 1, 39, 0, '2020-01-28', '2022-07-30', '', 'Sachet', 278, 500, '222(80%)', '1', '0', '2020-01-28 08:00:51', '2020-04-27 15:22:53', NULL),
(3, 'Flumoxy 500', 50, 0, 0, 50, 0, '2020-01-28', '2021-07-30', '', 'Stp', 1230, 1500, '270(22%)', '1', '0', '2020-01-28 08:01:52', NULL, NULL),
(4, 'Glypride 2', 10, 0, 0, 10, 0, '2020-01-28', '2021-07-30', '', 'Stp', 1740, 2000, '260(15%)', '1', '0', '2020-01-28 08:03:17', '2020-04-27 15:22:53', NULL),
(5, 'Metformin Denk 500', 40, 0, 0, 40, 0, '2020-01-28', '2024-05-30', '', 'Stp', 790, 1000, '210(27%)', '1', '0', '2020-01-28 08:04:09', NULL, NULL),
(6, 'Oleanz 5', 5, 0, 0, 5, 0, '2020-01-28', '2021-07-30', '', 'Stp', 872, 1000, '128(15%)', '1', '0', '2020-01-28 08:04:50', '2020-04-27 08:25:30', NULL),
(7, 'Statum Ointment', 10, 0, 0, 10, 0, '2020-01-28', '2021-08-30', '', 'Tube', 1230, 1500, '270(22%)', '1', '0', '2020-01-28 08:05:36', NULL, NULL),
(8, 'Amilin 10', 10, 0, 0, 10, 0, '2020-01-28', '2021-04-30', '', 'Stp', 279, 500, '221(79%)', '1', '0', '2020-01-28 08:06:32', NULL, NULL),
(9, 'Aminomin Syrup', 3, 0, 0, 3, 0, '2020-01-28', '2021-07-30', '', 'Bot', 3030, 3500, '470(16%)', '1', '0', '2020-01-28 08:07:24', '2020-04-27 15:22:53', NULL),
(10, 'Amlosun 5', 20, 0, 0, 20, 0, '2020-01-28', '2021-02-27', '', 'Stp', 754, 1000, '246(33%)', '1', '0', '2020-01-28 08:08:18', NULL, NULL),
(11, 'Appeton Taurine DHA Tab', 2, 0, 0, 2, 0, '2020-01-28', '2021-03-30', '', 'Bot', 14930, 17000, '2070(14%)', '1', '0', '2020-01-28 08:09:25', NULL, NULL),
(12, 'Babycough Syrup Black', 30, 0, 0, 30, 0, '2020-01-28', '2023-10-30', '', 'Bot', 830, 1000, '170(20%)', '1', '0', '2020-01-28 08:10:19', NULL, NULL),
(13, 'Bioplacenton Ointment', 5, 0, 0, 5, 0, '2020-01-28', '2023-06-30', '', 'Tube', 2335, 3000, '665(28%)', '1', '0', '2020-01-28 08:12:07', NULL, NULL),
(14, 'Bromhexine 1000', 3, 0, 0, 3, 0, '2020-01-28', '2021-03-30', '', 'Bot', 4150, 4150, '0(0%)', '1', '0', '2020-01-28 08:14:50', NULL, NULL),
(15, 'Calcium 625', 10, 0, 0, 10, 0, '2020-01-28', '2023-10-30', '', 'Stp', 560, 700, '140(25%)', '1', '0', '2020-01-28 08:16:01', NULL, NULL),
(16, 'C Vit Sweet T Man', 1, 0, 0, 1, 0, '2020-01-28', '2021-06-30', '', 'Bot', 5300, 5300, '0(0%)', '1', '0', '2020-01-28 08:16:58', NULL, NULL),
(17, 'Zifamclofen', 6, 0, 0, 6, 0, '2020-01-28', '2021-04-30', '', 'Stp', 1087, 1500, '413(38%)', '1', '0', '2020-01-28 08:18:06', NULL, NULL),
(18, 'Corbis 5', 6, 0, 0, 6, 0, '2020-01-28', '2022-03-30', '', 'Stp', 1227, 1500, '273(22%)', '1', '0', '2020-01-28 08:18:48', NULL, NULL),
(19, 'Cox Syrup', 30, 0, 0, 30, 0, '2020-01-28', '2021-11-30', '', 'Bot', 885, 1000, '115(13%)', '1', '0', '2020-01-28 08:19:24', NULL, NULL),
(20, 'Encorate 200', 10, 0, 0, 10, 0, '2020-01-28', '2022-07-30', '', 'Stp', 699, 800, '101(14%)', '1', '0', '2020-01-28 08:20:21', NULL, NULL),
(21, 'Folic Acid 100s', 10, 0, 0, 10, 0, '2020-01-28', '2021-10-30', '', 'Bot', 1320, 1500, '180(14%)', '1', '0', '2020-01-28 08:21:02', NULL, NULL),
(22, 'Heptopep Syrup', 2, 0, 0, 2, 0, '2020-01-28', '2022-12-02', '', 'Bot', 2890, 3500, '610(21%)', '1', '0', '2020-01-28 08:22:14', NULL, NULL),
(23, 'Repace 25', 110, 0, 0, 110, 0, '2020-01-28', '2022-05-30', '', 'Stp', 824, 1000, '176(21%)', '1', '0', '2020-01-28 08:23:02', NULL, NULL),
(24, 'Rowatinex', 15, 0, 0, 15, 0, '2020-01-28', '2024-01-30', '', 'Stp', 1294, 1500, '206(16%)', '1', '0', '2020-01-28 08:24:28', NULL, NULL),
(25, 'Siduol', 9, 0, 0, 9, 0, '2020-01-28', '2021-12-30', '', 'Stp', 1570, 2000, '430(27%)', '1', '0', '2020-01-28 08:25:16', NULL, NULL),
(26, 'Sizodon 1', 5, 0, 0, 5, 0, '2020-01-28', '2022-05-30', '', 'Stp', 426, 1000, '574(135%)', '1', '0', '0000-00-00 00:00:00', '2020-01-28 08:27:18', NULL),
(27, 'Sufretulle', 1, 0, 0, 1, 0, '2020-01-28', '2022-12-31', '', 'Box', 2450, 3000, '550(22%)', '1', '0', '2020-01-28 08:30:31', NULL, NULL),
(28, 'Zecuff Syrup', 10, 0, 0, 10, 0, '2020-01-28', '2024-07-30', '', 'Bot', 1330, 2000, '670(50%)', '1', '0', '2020-01-28 08:31:12', NULL, NULL),
(29, 'Atussin 1000s', 1, 0, 0, 1, 0, '2020-01-28', '2022-09-30', '', 'Bot', 20000, 20000, '0(0%)', '1', '0', '2020-01-28 08:31:52', NULL, NULL),
(30, 'Blucef P', 10, 0, 0, 10, 0, '2020-01-28', '2020-08-30', '', 'Stp', 950, 1500, '550(58%)', '1', '0', '2020-01-28 08:32:36', NULL, NULL),
(31, 'Doxycap', 20, 0, 0, 20, 0, '2020-01-28', '2021-12-30', '', 'Stp', 300, 300, '0(0%)', '1', '0', '2020-01-28 08:33:26', NULL, NULL),
(32, 'Roxley', 10, 0, 0, 10, 0, '2020-01-28', '2021-06-30', '', 'Stp', 530, 700, '170(32%)', '1', '0', '2020-01-28 08:35:48', NULL, NULL),
(33, 'TD', 80, 0, 0, 80, 0, '2020-01-28', '2023-08-30', '', 'Tab', 400, 500, '100(25%)', '1', '0', '2020-01-28 08:37:19', NULL, NULL),
(34, 'Diprophylline Jinj', 10, 0, 0, 10, 0, '2020-01-28', '2021-09-30', '', 'Inj', 70, 100, '30(43%)', '1', '0', '2020-01-28 08:38:30', '2020-04-27 15:22:53', NULL),
(35, 'ATT INJECT', 50, 0, 0, 50, 0, '2020-01-28', '2022-02-27', '', 'Inj', 3000, 3500, '500(17%)', '1', '0', '2020-01-28 08:40:01', NULL, NULL),
(36, 'Cefexol Powder', 20, 0, 0, 20, 0, '2020-01-28', '2022-08-30', '', 'Bot', 1500, 2000, '500(33%)', '1', '0', '2020-01-28 08:40:52', NULL, NULL),
(37, 'Nestotule Syrup', 11, 0, 0, 11, 0, '2020-01-28', '2021-09-30', '', 'Bot', 1500, 2000, '500(33%)', '1', '0', '2020-01-28 08:41:52', NULL, NULL),
(38, 'Colimix Syrup', 11, 0, 0, 11, 0, '2020-01-28', '2021-08-30', '', 'Bot', 3030, 3500, '470(16%)', '1', '0', '2020-01-28 08:42:44', NULL, NULL),
(39, 'Allagra Suspension', 11, 0, 0, 11, 0, '2020-01-28', '2021-08-30', '', 'Bot', 1300, 2000, '700(54%)', '1', '0', '2020-01-28 08:43:33', NULL, NULL),
(40, 'Simecol Drop', 11, 0, 0, 11, 0, '2020-01-28', '2021-04-30', '', 'Bot', 1490, 2500, '1010(68%)', '1', '0', '2020-01-28 08:44:19', NULL, NULL),
(41, 'Abivit Drop', 12, 0, 0, 12, 0, '2020-01-28', '2021-03-31', '', 'Bot', 1690, 2000, '310(18%)', '1', '0', '2020-01-28 08:45:01', NULL, NULL),
(42, 'Exicof Syrup', 10, 0, 0, 10, 0, '2020-01-28', '2022-09-30', '', 'Bot', 1080, 1500, '420(39%)', '1', '0', '2020-01-28 08:45:48', NULL, NULL),
(43, 'Colchicine 1mg', 20, 0, 0, 20, 0, '2020-01-28', '2022-02-27', '', 'Stp', 710, 1000, '290(41%)', '1', '0', '2020-01-28 08:46:43', NULL, NULL),
(44, 'Memorin', 100, 0, 0, 100, 0, '2020-01-28', '2024-09-30', '', 'Stp', 130, 200, '70(54%)', '1', '0', '2020-01-28 08:47:55', NULL, NULL),
(45, 'Pbtamol 120 Syrup', 10, 0, 0, 10, 0, '2020-01-28', '2022-09-30', '', 'Bot', 600, 700, '100(17%)', '1', '0', '2020-01-28 08:48:46', NULL, NULL),
(46, 'Easygluco', 2, 0, 0, 2, 0, '2020-01-28', '2021-06-30', '', 'Unit', 7300, 8000, '700(10%)', '1', '0', '2020-01-28 08:49:53', NULL, NULL),
(47, 'Aldactone', 10, 0, 0, 10, 0, '2020-01-28', '2021-01-31', '', 'Stp', 525, 600, '75(14%)', '1', '0', '2020-01-28 08:51:14', NULL, NULL),
(48, 'Lancet', 1, 0, 0, 1, 0, '2020-01-28', '2022-01-30', '', 'Box', 1200, 1200, '0(0%)', '1', '0', '2020-01-28 08:52:13', NULL, NULL),
(49, 'TDBPI', 200, 0, 0, 200, 0, '2020-01-28', '2020-06-30', '', 'Tab', 80, 80, '0(0%)', '1', '0', '2020-01-28 08:53:13', NULL, NULL),
(50, 'Zollium 0.25', 5, 0, 0, 5, 0, '2020-01-28', '2021-07-30', '', 'Stp', 4500, 5000, '500(11%)', '1', '0', '2020-01-28 08:54:38', NULL, NULL),
(51, 'Lignocaine Inj', 2, 0, 0, 2, 0, '2020-01-28', '2022-07-30', '', 'Bot', 1550, 1550, '0(0%)', '1', '0', '2020-01-28 08:55:54', NULL, NULL),
(52, 'T', 2, 0, 0, 2, 0, '2020-01-28', '2024-08-30', '', 'Stp', 4500, 5000, '500(11%)', '1', '0', '2020-01-28 08:57:02', NULL, NULL),
(53, 'Paracetemol', 12345, 89, 0, 12345, 1098705, '2020-03-10', '2020-07-16', '', 'Box', 100, 200, '100(100%)', '1', '0', '2020-03-10 07:28:15', NULL, NULL),
(54, 'Krishna', 130, 100, 0, 130, 13000, '2020-04-27', '2020-07-16', 'Something', 'Stp', 200, 250, '50(25%)', '1', '0', '0000-00-00 00:00:00', '2020-04-27 05:02:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ra_pres_patient`
--

CREATE TABLE `ra_pres_patient` (
  `pres_patient_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `pres_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `highlighted` enum('0','1') DEFAULT NULL,
  `assign_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_pres_patient`
--

INSERT INTO `ra_pres_patient` (`pres_patient_id`, `patient_id`, `pres_name`, `quantity`, `highlighted`, `assign_date`) VALUES
(1, 1, 'dompil  half', 3, '0', 1579945342),
(2, 7, 'paracetemol', 1, '1', 1588046385);

-- --------------------------------------------------------

--
-- Table structure for table `ra_pre_patient`
--

CREATE TABLE `ra_pre_patient` (
  `pre_patient_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `pre_name` int(11) NOT NULL,
  `routine` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ra_user`
--

CREATE TABLE `ra_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `c_fees` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_user`
--

INSERT INTO `ra_user` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `c_fees`, `gender`) VALUES
(1, 'adminknst', '$2y$10$yfi5nUQGXUZtMdl27dWAyOd/jMOmATBpiUvJDmUu9hJ5Ro6BE5wsK', 'admin@admin.com', 'john', 'doe', '80789998', 0),
(2, 'admin', '$2y$10$NQqqebbQcvX/wzdziVNWn.P5BmwzKGqQd/yZ7WzzVdOWeyhmnSKNm', 'r@gmail.com', 'admin', 'admin', '3000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ra_usergroup`
--

CREATE TABLE `ra_usergroup` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_usergroup`
--

INSERT INTO `ra_usergroup` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ra_complaint`
--
ALTER TABLE `ra_complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_diagnosis`
--
ALTER TABLE `ra_diagnosis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_diag_patient`
--
ALTER TABLE `ra_diag_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_exa_patient`
--
ALTER TABLE `ra_exa_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_group`
--
ALTER TABLE `ra_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_history`
--
ALTER TABLE `ra_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_investigation`
--
ALTER TABLE `ra_investigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_med_patient`
--
ALTER TABLE `ra_med_patient`
  ADD PRIMARY KEY (`med_patient_id`);

--
-- Indexes for table `ra_patient`
--
ALTER TABLE `ra_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_patient_visit`
--
ALTER TABLE `ra_patient_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_pharmacy`
--
ALTER TABLE `ra_pharmacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_pres_patient`
--
ALTER TABLE `ra_pres_patient`
  ADD PRIMARY KEY (`pres_patient_id`);

--
-- Indexes for table `ra_pre_patient`
--
ALTER TABLE `ra_pre_patient`
  ADD PRIMARY KEY (`pre_patient_id`);

--
-- Indexes for table `ra_user`
--
ALTER TABLE `ra_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ra_usergroup`
--
ALTER TABLE `ra_usergroup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ra_complaint`
--
ALTER TABLE `ra_complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ra_diagnosis`
--
ALTER TABLE `ra_diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ra_diag_patient`
--
ALTER TABLE `ra_diag_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ra_exa_patient`
--
ALTER TABLE `ra_exa_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ra_group`
--
ALTER TABLE `ra_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_history`
--
ALTER TABLE `ra_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ra_investigation`
--
ALTER TABLE `ra_investigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ra_med_patient`
--
ALTER TABLE `ra_med_patient`
  MODIFY `med_patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ra_patient`
--
ALTER TABLE `ra_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ra_patient_visit`
--
ALTER TABLE `ra_patient_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ra_pharmacy`
--
ALTER TABLE `ra_pharmacy`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `ra_pres_patient`
--
ALTER TABLE `ra_pres_patient`
  MODIFY `pres_patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_pre_patient`
--
ALTER TABLE `ra_pre_patient`
  MODIFY `pre_patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ra_user`
--
ALTER TABLE `ra_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_usergroup`
--
ALTER TABLE `ra_usergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
