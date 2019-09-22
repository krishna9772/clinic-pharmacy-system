-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2019 at 06:53 AM
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
(1, 4, '<p>hell owrld</p>', '2019-09-21 07:48:15', '2019-09-21 08:33:51', '1', '2019-09-21 08:33:51'),
(2, 4, '<p><ul><li>ill</li><li>something</li><li>havent</li><li>cold</li><li>fever</li></ul></p>', '2019-09-21 08:34:10', '2019-09-21 08:34:14', '1', '2019-09-21 08:34:14'),
(3, 4, '<p>something is really going to right</p>', '2019-09-21 08:40:55', '2019-09-21 08:45:55', '1', '2019-09-21 08:45:55'),
(4, 4, '<p><ul><li>doing what evere</li><li>what ups</li><li>what the fuck is happening</li><li>what the heck are you doing</li><li>is everthing ok</li><li>i m sorry thtat it can\'t be done</li></ul></p>', '2019-09-21 08:45:50', '2019-09-21 08:45:50', '0', '0000-00-00 00:00:00'),
(5, 4, '<p><ul><li>aadsfadsfsdf</li></ul></p>', '2019-09-21 09:47:13', '2019-09-21 09:47:15', '1', '2019-09-21 09:47:15'),
(6, 7, '<p><ul><li>very ill very</li></ul></p>', '2019-09-21 16:17:43', '2019-09-21 16:17:43', '0', '0000-00-00 00:00:00'),
(7, 8, '<p><ul><li>Very very depressed for wife</li><li>and something that is very very&nbsp;</li></ul><p>?<br></p></p>', '2019-09-22 03:50:52', '2019-09-22 03:51:03', '1', '2019-09-22 03:51:03'),
(8, 8, '<p><ul><li>Very very depressed for wife</li><li>and something that is very very</li></ul></p>', '2019-09-22 03:51:08', '2019-09-22 03:51:08', '0', '0000-00-00 00:00:00'),
(9, 5, '<p>Something is very very wrong</p>', '2019-09-22 03:53:13', '2019-09-22 03:53:13', '0', '0000-00-00 00:00:00');

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
(1, 'Hypertension'),
(2, 'somehitng'),
(3, 'Obesity'),
(4, 'somethingg'),
(5, 'fever'),
(6, 'Cold'),
(7, 'somehign'),
(8, 'sdf'),
(9, 'sdfsdf'),
(10, 'high fever'),
(11, 'new type'),
(12, 'all new type'),
(13, 'somehting'),
(14, 'all new typeee'),
(15, 'add new thing'),
(16, 'add new diagnosis'),
(17, 'olo'),
(18, 'hsdgg'),
(19, 'somethingfadfadsf');

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
(1, 4, 'Obesity', '2019-09-19 14:16:36', '1', '2019-09-21 13:25:30'),
(2, 4, 'new type', '2019-09-19 14:18:42', '0', '0000-00-00 00:00:00'),
(3, 4, '', '2019-09-19 14:21:21', '1', '2019-09-21 09:29:24'),
(4, 4, 'all new typeee', '2019-09-19 14:22:13', '1', '2019-09-21 09:29:22'),
(5, 4, 'sdfsdf', '2019-09-19 14:23:44', '1', '2019-09-21 09:29:22'),
(6, 4, 'somehitng', '2019-09-19 14:26:31', '1', '2019-09-21 09:29:21'),
(7, 4, 'Cold', '2019-09-19 14:28:15', '1', '2019-09-21 09:29:20'),
(8, 4, 'somethingg,Cold', '2019-09-19 14:28:19', '1', '2019-09-21 09:29:19'),
(9, 4, 'high fever', '2019-09-19 14:30:42', '1', '2019-09-21 09:29:19'),
(10, 4, 'somehitng', '2019-09-19 14:40:14', '1', '2019-09-21 09:29:18'),
(11, 4, 'high fever,new type', '2019-09-19 14:49:44', '1', '2019-09-21 09:29:18'),
(12, 4, 'Hypertension,somehign', '2019-09-19 14:54:43', '1', '2019-09-21 09:29:17'),
(13, 4, 'sdf,sdfsdf', '2019-09-19 14:55:23', '1', '2019-09-21 09:29:16'),
(14, 4, 'high fever', '2019-09-19 14:55:35', '1', '2019-09-21 09:29:15'),
(15, 4, 'add new thing', '2019-09-19 15:27:12', '1', '2019-09-21 09:29:06'),
(16, 4, 'add new diagnosis', '2019-09-20 02:55:15', '1', '2019-09-21 09:29:05'),
(17, 4, 'sdf,high fever,add new thing', '2019-09-20 09:18:41', '1', '2019-09-21 09:29:04'),
(18, 4, 'Hypertension,fever,Cold', '2019-09-20 09:44:45', '1', '2019-09-21 09:29:03'),
(19, 4, 'Hypertension,somehitng,Obesity', '2019-09-21 05:15:07', '1', '2019-09-21 09:29:02'),
(20, 4, 'somehting', '2019-09-21 09:29:32', '1', '2019-09-21 09:29:35'),
(21, 4, 'somethingfadfadsf', '2019-09-21 09:29:55', '1', '2019-09-21 09:29:58'),
(22, 4, 'Cold,somehign,sdf', '2019-09-21 09:47:03', '1', '2019-09-21 09:47:05'),
(23, 4, 'all new type', '2019-09-21 13:25:26', '1', '2019-09-21 13:25:28');

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

INSERT INTO `ra_exa_patient` (`id`, `patient_id`, `s_bp`, `d_bp`, `pr`, `temp`, `spo2`, `weight`, `height`, `bmi`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 1, 110, 70, 80, 98, 90, 120, '33', '50', '2019-09-11 14:34:15', '0', '0000-00-00 00:00:00'),
(2, 1, 110, 70, 80, 98, 90, 86, '33', '33', '2019-09-11 14:58:08', '0', '0000-00-00 00:00:00'),
(3, 2, 110, 33, 80, 98, 90, 120, '2.10', '33', '2019-09-11 14:59:02', '0', '0000-00-00 00:00:00'),
(4, 2, 110, 70, 80, 98, 90, 120, '2.10', '33', '2019-09-11 15:00:29', '0', '0000-00-00 00:00:00'),
(5, 2, 110, 70, 0, 98, 0, 0, '', '0', '2019-09-11 15:00:57', '0', '0000-00-00 00:00:00'),
(6, 1, 333, 70, 80, 100, 77, 86, '2.10', '33', '2019-09-11 15:02:16', '0', '0000-00-00 00:00:00'),
(7, 4, 110, 70, 80, 98, 90, 86, '33', '33', '2019-09-13 07:11:56', '0', '0000-00-00 00:00:00'),
(8, 4, 11, 11, 0, 98, 0, 0, '', '0', '2019-09-13 16:58:05', '1', '2019-09-21 13:09:42'),
(9, 4, 11, 11, 0, 98, 0, 0, '', '0', '2019-09-13 16:58:14', '1', '2019-09-21 13:09:39'),
(10, 4, 11, 11, 0, 98, 0, 0, '', '0', '2019-09-13 16:58:15', '1', '2019-09-21 13:09:38'),
(11, 4, 11, 11, 0, 98, 0, 0, '', '0', '2019-09-13 16:58:29', '1', '2019-09-21 13:09:37'),
(12, 4, 11, 11, 0, 98, 0, 0, '', '0', '2019-09-13 16:58:56', '1', '2019-09-21 13:09:36'),
(13, 4, 44, 44, 0, 98, 0, 0, '', '0', '2019-09-13 17:00:40', '1', '2019-09-21 13:09:34'),
(14, 4, 110, 70, 80, 98, 98, 178, '5.3', '30', '2019-09-17 05:05:17', '0', '0000-00-00 00:00:00'),
(15, 5, 110, 70, 80, 98, 40, 110, '3.11', '0', '2019-09-18 16:31:51', '0', '0000-00-00 00:00:00'),
(16, 4, 110, 90, 0, 98, 0, 0, '', '', '2019-09-20 04:29:54', '1', '2019-09-21 13:18:51'),
(17, 4, 110, 90, 80, 98, 60, 110, '6.8', '11.6', '2019-09-20 04:30:13', '1', '2019-09-21 13:08:16'),
(18, 4, 110, 70, 0, 98, 0, 200, '2.7', '133.9', '2019-09-21 05:13:47', '0', '0000-00-00 00:00:00'),
(19, 4, 110, 70, 0, 98, 0, 0, '', '', '2019-09-21 13:10:35', '1', '2019-09-21 13:11:09'),
(20, 4, 110, 70, 0, 98, 0, 0, '', '', '2019-09-21 13:11:05', '1', '2019-09-21 13:11:08');

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
(1, 1, 'sdfsdf', '2019-09-13 16:32:23', '0', '0000-00-00 00:00:00'),
(2, 1, 'lkjlkj', '2019-09-13 16:33:40', '0', '0000-00-00 00:00:00'),
(3, 4, '<p>sdsfds</p>', '2019-09-13 16:58:56', '1', '2019-09-21 09:06:31'),
(4, 4, '<p>sdfasdfsdfadsf</p>', '2019-09-13 17:01:12', '1', '2019-09-21 09:06:29'),
(5, 1, '<p><p><ul><li><i>?This guy is going to be cool one day with his all tentions being altered than that kind of sort of thing</i></li></ul><p><i>?<br></i></p></p></p>', '2019-09-14 05:41:01', '0', '0000-00-00 00:00:00'),
(6, 1, '<p><p><ul><li><i>?This guy is goingto be cool one day with his all tentions being altered than that kind of sort of thing</i></li></ul></p></p>', '2019-09-14 05:41:17', '0', '0000-00-00 00:00:00'),
(7, 1, '<p><ul><li>sdfsdf</li></ul></p>', '2019-09-14 08:04:19', '0', '0000-00-00 00:00:00'),
(8, 4, '<p><a href=\"http://www.google.com\" title=\"Link: http://www.google.com\">http://www.google.com/</a> <br></p>', '2019-09-16 16:43:45', '1', '2019-09-21 09:06:00'),
(9, 4, '<p>khjlkj</p>', '2019-09-21 09:09:08', '0', '0000-00-00 00:00:00'),
(10, 4, '<p>sdfsef</p>', '2019-09-21 09:09:52', '1', '2019-09-21 09:09:59'),
(11, 4, '<p>sdfsefsdfsdfsd</p>', '2019-09-21 09:09:55', '1', '2019-09-21 09:10:02'),
(12, 4, '<p>sdfsefsdfsdfsdfsdfsdfsdf</p>', '2019-09-21 09:09:57', '1', '2019-09-21 09:10:07');

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
(1, 4, '<p>adsafadsfasdf</p>', '2019-09-21 09:46:42', '0', '0000-00-00 00:00:00'),
(2, 4, '<p>adsafadsfasdfadsf</p>', '2019-09-21 09:46:48', '0', '0000-00-00 00:00:00'),
(3, 4, '<p>adsafadsfasdasdfadffadsf</p>', '2019-09-21 09:46:50', '1', '2019-09-21 09:46:53'),
(4, 4, '<p>adsafadsfasdasdfadffadsf</p>', '2019-09-21 09:46:50', '1', '2019-09-21 09:46:55'),
(5, 4, '<p>adsafadsfasdaadsafsdsdfadffadsf</p>', '2019-09-21 09:46:51', '1', '2019-09-21 09:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `ra_med_patient`
--

CREATE TABLE `ra_med_patient` (
  `med_patient_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_med_patient`
--

INSERT INTO `ra_med_patient` (`med_patient_id`, `patient_id`, `med_id`, `quantity`, `total_cost`, `assign_date`) VALUES
(13, 2, 1, 21, 14700, 1568359428),
(16, 1, 1, 3, 2100, 1568627345),
(18, 5, 2, 1, 80, 1568824556),
(21, 4, 2, 1, 80, 1569042869),
(24, 4, 4, 1, 800, 1569072499),
(25, 4, 5, 1, 700, 1569072499);

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
(1, 'Krishna Aryal', 8, 0, 0, 1, 'kandaw', '2019-09-09 03:27:17', '2019-09-16 10:23:37', '2019-09-16 10:23:37', '1'),
(2, 'Pawan', 20, 0, 0, 1, 'No 16 53rd lower street', '2019-09-09 03:29:09', '2019-09-09 06:36:24', '0000-00-00 00:00:00', '0'),
(3, 'Kid', 0, 6, 0, 1, 'No 16 53rd lower street', '2019-09-09 03:31:44', '2019-09-09 08:00:54', '2019-09-09 08:00:54', '1'),
(4, 'Suraj Thapa', 20, 0, 0, 1, 'kandaw', '2019-09-09 06:46:19', '2019-09-09 06:46:19', '0000-00-00 00:00:00', '0'),
(5, 'admin', 31, 5, 13, 1, 'No 16 53rd lower street', '2019-09-09 15:04:01', '2019-09-09 15:04:01', '0000-00-00 00:00:00', '0'),
(6, 'krishna', 16, 2, 16, 1, 'No 16 53rd lower street', '2019-09-10 03:02:51', '2019-09-16 10:25:01', '2019-09-16 10:25:01', '1'),
(7, 'Sefsdf', 20, 0, 0, 0, 'kandaw', '2019-09-13 17:04:46', '2019-09-16 15:35:34', '0000-00-00 00:00:00', '0'),
(8, 'Kyaw Kyaw', 32, 0, 0, 1, 'Aung ChanThar', '2019-09-22 03:50:18', '2019-09-22 03:50:18', '0000-00-00 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ra_pharmacy`
--

CREATE TABLE `ra_pharmacy` (
  `id` int(100) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `used_quantity` int(10) NOT NULL,
  `remain_quantity` int(10) NOT NULL,
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

INSERT INTO `ra_pharmacy` (`id`, `medicine_name`, `quantity`, `used_quantity`, `remain_quantity`, `register_date`, `expire_date`, `description`, `sell_type`, `actual_price`, `selling_price`, `profit_price`, `status`, `is_deleted`, `created_date`, `modified_date`, `deleted_date`) VALUES
(1, 'Paracetemol', 30, 30, 0, '2019-09-05', '2019-09-12', '', 'Bot', 600, 700, '100(17%)', '1', '0', '0000-00-00 00:00:00', '2019-09-16 03:39:51', NULL),
(2, 'mom', 5, 5, 0, '2019-09-05', '2019-09-20', '', 'Stp', 60, 80, '20(33%)', '1', '0', '0000-00-00 00:00:00', '2019-09-20 07:54:14', NULL),
(3, 'bio', 30, 2, 28, '2019-09-05', '2019-09-13', '', 'Tube', 55, 88, '33(60%)', '0', '0', '0000-00-00 00:00:00', '2019-09-15 14:41:43', NULL),
(4, 'Something', 500, 1, 499, '2019-09-20', '2019-09-21', '', 'Stp', 600, 800, '200(33%)', '1', '0', '2019-09-20 09:17:14', NULL, NULL),
(5, 'Someting', 490, 1, 489, '2019-09-21', '2020-07-09', '', 'Inj', 600, 700, '100(17%)', '1', '0', '0000-00-00 00:00:00', '2019-09-21 13:27:07', NULL);

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
(2, 'admin', '$2y$10$NQqqebbQcvX/wzdziVNWn.P5BmwzKGqQd/yZ7WzzVdOWeyhmnSKNm', 'r@gmail.com', 'r', 'r', '2000', 1);

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
-- Indexes for table `ra_pharmacy`
--
ALTER TABLE `ra_pharmacy`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ra_diagnosis`
--
ALTER TABLE `ra_diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ra_diag_patient`
--
ALTER TABLE `ra_diag_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ra_exa_patient`
--
ALTER TABLE `ra_exa_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ra_group`
--
ALTER TABLE `ra_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_history`
--
ALTER TABLE `ra_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ra_investigation`
--
ALTER TABLE `ra_investigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ra_med_patient`
--
ALTER TABLE `ra_med_patient`
  MODIFY `med_patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ra_patient`
--
ALTER TABLE `ra_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ra_pharmacy`
--
ALTER TABLE `ra_pharmacy`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
