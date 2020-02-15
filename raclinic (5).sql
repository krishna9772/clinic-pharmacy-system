-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2020 at 03:16 PM
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
(1, 1, 'fever sneezing cough', '2020-01-26 14:49:57', '2020-01-26 14:49:57', '0', '0000-00-00 00:00:00'),
(2, 1, 'only', '2020-01-27 03:58:54', '2020-01-27 03:58:54', '0', '0000-00-00 00:00:00'),
(3, 9, 'whats up man', '2020-01-28 13:09:37', '2020-01-28 13:09:37', '0', '0000-00-00 00:00:00'),
(4, 3, 'fever', '2020-01-28 13:19:59', '2020-01-29 15:22:46', '1', '2020-01-29 15:22:46'),
(5, 4, 'coughing', '2020-01-28 13:32:05', '2020-01-28 13:32:05', '0', '0000-00-00 00:00:00'),
(6, 10, 'what about someting', '2020-01-29 04:41:21', '2020-01-29 04:41:21', '0', '0000-00-00 00:00:00'),
(7, 4, 'something', '2020-01-29 14:28:47', '2020-01-29 14:28:47', '0', '0000-00-00 00:00:00'),
(8, 3, 'fever', '2020-01-29 15:16:08', '2020-01-29 15:45:43', '1', '2020-01-29 15:45:43'),
(9, 11, 'something', '2020-01-29 15:41:37', '2020-01-29 15:41:37', '0', '0000-00-00 00:00:00');

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
(1, 'fever'),
(2, 'sneezing');

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
(1, 1, 'fever', '2020-01-26 14:49:57', '0', '0000-00-00 00:00:00'),
(2, 4, 'fever', '2020-01-29 14:28:48', '0', '0000-00-00 00:00:00'),
(3, 3, 'sneezing', '2020-01-29 15:16:08', '1', '2020-01-29 15:45:36'),
(4, 11, 'sneezing', '2020-01-29 15:41:37', '0', '0000-00-00 00:00:00');

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
(1, 1, 110, 90, 80, 98, 90, 80, 120, '5.2', '21.7', '2020-01-26 14:49:58', '0', '0000-00-00 00:00:00'),
(2, 4, 110, 80, 80, 98, 0, 0, 0, '', '', '2020-01-29 14:28:48', '0', '0000-00-00 00:00:00'),
(3, 3, 110, 70, 0, 98, 0, 0, 0, '', '', '2020-01-29 15:16:08', '1', '2020-01-29 15:45:38'),
(4, 11, 110, 70, 0, 98, 0, 0, 0, '', '', '2020-01-29 15:41:38', '0', '0000-00-00 00:00:00');

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
(1, 1, 'white dotte on the skin', '2020-01-26 14:49:57', '0', '0000-00-00 00:00:00'),
(2, 1, 'somethig', '2020-01-27 03:58:54', '0', '0000-00-00 00:00:00'),
(3, 9, 'eveerything is good what about yours', '2020-01-28 13:09:37', '0', '0000-00-00 00:00:00'),
(4, 4, 'something', '2020-01-28 13:32:05', '0', '0000-00-00 00:00:00'),
(5, 10, 'is this ok for you all to believe', '2020-01-29 04:41:21', '0', '0000-00-00 00:00:00'),
(6, 4, 'something', '2020-01-29 14:28:46', '0', '0000-00-00 00:00:00'),
(7, 3, 'online', '2020-01-29 15:16:08', '1', '2020-01-29 15:45:44'),
(8, 11, 'is', '2020-01-29 15:41:37', '0', '0000-00-00 00:00:00');

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
(1, 1, 'broken bone', '2020-01-26 14:49:58', '0', '0000-00-00 00:00:00'),
(2, 10, 'hello everyone', '2020-01-29 04:41:21', '0', '0000-00-00 00:00:00'),
(3, 4, 'investigation', '2020-01-29 14:28:47', '0', '0000-00-00 00:00:00'),
(4, 3, 'nothing', '2020-01-29 15:16:08', '1', '2020-01-29 15:45:46'),
(5, 11, 'where', '2020-01-29 15:41:37', '0', '0000-00-00 00:00:00');

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
  `highlighted` enum('0','1') NOT NULL,
  `assign_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_med_patient`
--

INSERT INTO `ra_med_patient` (`med_patient_id`, `patient_id`, `med_id`, `quantity`, `total_cost`, `highlighted`, `assign_date`) VALUES
(1, 1, 1, 3, 2700, '1', 1580050208),
(5, 2, 1, 3, 2700, '0', 1580112991),
(6, 3, 2, 1, 400, '0', 1580393601),
(7, 3, 3, 1, 500, '1', 1580393601);

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
(1, 'Zaw Zaw', 30, 0, 0, 1, 'aung tharyar', '2020-01-26 14:48:25', '2020-01-27 09:08:54', '2020-01-27 09:08:54', '1'),
(2, 'Kion', 61, 0, 0, 1, 'aung tharyar', '2020-01-27 03:03:13', '2020-01-27 09:08:54', '2020-01-27 09:08:54', '1'),
(3, 'Kyaw Kyaw', 30, 0, 0, 1, 'shwebonthar', '2020-01-27 04:20:03', '2020-01-27 09:07:49', '2020-01-27 08:28:47', '0'),
(4, 'U Tun Oo', 45, 0, 0, 1, 'shwebonthar', '2020-01-27 04:20:18', '2020-01-27 09:07:53', '2020-01-27 08:28:47', '0'),
(5, 'Kanchi', 35, 0, 0, 1, 'lae oo', '2020-01-27 04:20:33', '2020-01-27 09:20:56', '2020-01-27 09:20:56', '1'),
(6, 'U Kyaw Htun', 80, 0, 0, 1, 'lae oo', '2020-01-27 04:20:48', '2020-01-28 11:09:35', '2020-01-28 11:09:35', '1'),
(7, 'Zaw Kyaw Htun', 70, 0, 0, 1, 'shwebonthar', '2020-01-27 04:21:06', '2020-01-27 09:08:09', '2020-01-27 08:43:38', '0'),
(8, 'Krishna Aryal', 21, 0, 0, 1, 'myoma', '2020-01-27 04:21:26', '2020-01-27 09:08:54', '2020-01-27 09:08:54', '1'),
(9, 'Something Is Very Fishy', 50, 0, 0, 1, 'shwebonthar', '2020-01-27 09:21:24', '2020-01-27 09:21:24', '0000-00-00 00:00:00', '0'),
(10, 'Pawwan Bhattari', 20, 0, 0, 1, 'Australia', '2020-01-29 04:40:57', '2020-01-29 04:40:57', '0000-00-00 00:00:00', '0'),
(11, 'Zaw Zaw', 48, 0, 0, 1, 'myoma', '2020-01-29 15:41:08', '2020-01-29 15:41:08', '0000-00-00 00:00:00', '0'),
(12, 'Krishna', 41, 0, 0, 1, 'shwebonthar', '2020-01-30 08:46:53', '2020-01-30 08:46:53', '0000-00-00 00:00:00', '0');

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
(1, 1, '2019-12-19 14:49:58'),
(2, 1, '2020-01-27 03:58:54'),
(3, 2, '2020-01-24 17:30:00'),
(4, 3, '2020-01-24 04:21:51'),
(5, 4, '2020-01-23 04:21:58'),
(6, 5, '2020-02-22 04:22:05'),
(7, 6, '2020-01-20 17:30:00'),
(8, 7, '2020-01-20 17:30:00'),
(9, 8, '2020-01-21 17:30:00'),
(10, 9, '2020-01-28 13:09:37'),
(11, 3, '2020-01-28 13:19:59'),
(12, 4, '2020-01-28 13:32:05'),
(13, 10, '2020-01-29 04:41:22'),
(14, 4, '2020-01-29 14:28:48'),
(15, 3, '2020-01-29 15:16:07'),
(16, 11, '2020-01-29 15:41:37');

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
(1, 'Paracetemol', 80, 6, 74, '2020-01-26', '2020-01-30', '', 'Bot', 800, 900, '100(13%)', '0', '0', '0000-00-00 00:00:00', '2020-01-29 15:23:58', NULL),
(2, 'Citizen', 200, 1, 199, '2020-01-28', '2020-03-12', '', 'Tab', 300, 400, '100(33%)', '1', '0', '2020-01-28 13:55:47', '2020-01-30 14:13:21', NULL),
(3, 'Online', 100, 1, 99, '2020-01-29', '2020-03-18', '', 'Stp', 100, 500, '400(400%)', '1', '0', '2020-01-29 15:23:39', '2020-01-30 14:13:21', NULL);

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
(2, 2, 'something', 3, '0', 1580112245);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ra_diagnosis`
--
ALTER TABLE `ra_diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_diag_patient`
--
ALTER TABLE `ra_diag_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ra_exa_patient`
--
ALTER TABLE `ra_exa_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ra_group`
--
ALTER TABLE `ra_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_history`
--
ALTER TABLE `ra_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ra_investigation`
--
ALTER TABLE `ra_investigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ra_med_patient`
--
ALTER TABLE `ra_med_patient`
  MODIFY `med_patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ra_patient`
--
ALTER TABLE `ra_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ra_patient_visit`
--
ALTER TABLE `ra_patient_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ra_pharmacy`
--
ALTER TABLE `ra_pharmacy`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
