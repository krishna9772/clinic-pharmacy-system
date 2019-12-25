-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2019 at 09:07 AM
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
(1, 1, '<ul><li>loss of appetite</li></ul>', '2019-12-05 15:38:16', '2019-12-05 15:38:16', '0', '0000-00-00 00:00:00'),
(2, 1, '<ul><li>sneezing</li><li>nausea</li><li>nausea</li></ul>', '2019-12-14 07:55:00', '2019-12-14 07:55:00', '0', '0000-00-00 00:00:00');

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
(1, 'biolkj');

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
(1, 1, 'biolkj', '2019-12-14 07:55:18', '1', '2019-12-14 07:55:20');

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
(1, 2, 100, 20, 40, 98, 40, 4, 98, '2.11', '', '2019-12-10 04:34:55', '1', '2019-12-10 04:35:04'),
(2, 2, 100, 20, 40, 98, 40, 4, 98, '2.11', '107.5', '2019-12-10 04:35:01', '0', '0000-00-00 00:00:00');

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
(1, 1, '<p>bio</p><p><br></p>', '2019-12-14 07:55:30', '0', '0000-00-00 00:00:00');

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
(1, 1, 1, 1, 900, 1575560404);

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
(1, 'Kin Nio', 21, 0, 0, 1, 'myoma', '2019-12-05 15:37:52', '2019-12-05 15:37:52', '0000-00-00 00:00:00', '0'),
(2, 'Su Hlaing', 16, 0, 0, 0, 'shwebonthar', '2019-12-10 04:34:20', '2019-12-10 04:34:20', '0000-00-00 00:00:00', '0');

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
(1, 'Hono', 90, 1, 89, '2019-12-05', '2020-01-05', '', 'Inj', 800, 900, '100(13%)', '1', '0', '2019-12-05 15:39:30', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_diagnosis`
--
ALTER TABLE `ra_diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_diag_patient`
--
ALTER TABLE `ra_diag_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_exa_patient`
--
ALTER TABLE `ra_exa_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_group`
--
ALTER TABLE `ra_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_history`
--
ALTER TABLE `ra_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ra_investigation`
--
ALTER TABLE `ra_investigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_med_patient`
--
ALTER TABLE `ra_med_patient`
  MODIFY `med_patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_patient`
--
ALTER TABLE `ra_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_pharmacy`
--
ALTER TABLE `ra_pharmacy`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
