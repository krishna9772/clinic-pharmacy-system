-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2022 at 05:42 AM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `ra_complaint`
--

CREATE TABLE `ra_complaint` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `complaint` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0',
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_complaint`
--

INSERT INTO `ra_complaint` (`id`, `patient_id`, `complaint`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 1, 'Demo complaint', '2022-03-19 05:39:05', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_diagnosis`
--

CREATE TABLE `ra_diagnosis` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_diagnosis`
--

INSERT INTO `ra_diagnosis` (`id`, `name`) VALUES
(1, 'diabetes'),
(2, 'demo data');

-- --------------------------------------------------------

--
-- Table structure for table `ra_diag_patient`
--

CREATE TABLE `ra_diag_patient` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_diag_patient`
--

INSERT INTO `ra_diag_patient` (`id`, `patient_id`, `diagnosis`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 1, 'demo data', '2022-03-19 05:39:05', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_exa_patient`
--

CREATE TABLE `ra_exa_patient` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `s_bp` int NOT NULL,
  `d_bp` int NOT NULL,
  `pr` int NOT NULL,
  `temp` int NOT NULL,
  `spo2` int NOT NULL,
  `rbs` int NOT NULL,
  `weight` int NOT NULL,
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
(1, 1, 110, 90, 80, 98, 0, 0, 0, '', '', '2022-03-19 05:39:05', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_group`
--

CREATE TABLE `ra_group` (
  `id` int NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_group`
--

INSERT INTO `ra_group` (`id`, `groupname`, `permission`) VALUES
(1, 'Administrator', 'a:36:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:11:\"createBrand\";i:9;s:11:\"updateBrand\";i:10;s:9:\"viewBrand\";i:11;s:11:\"deleteBrand\";i:12;s:14:\"createCategory\";i:13;s:14:\"updateCategory\";i:14;s:12:\"viewCategory\";i:15;s:14:\"deleteCategory\";i:16;s:11:\"createStore\";i:17;s:11:\"updateStore\";i:18;s:9:\"viewStore\";i:19;s:11:\"deleteStore\";i:20;s:15:\"createAttribute\";i:21;s:15:\"updateAttribute\";i:22;s:13:\"viewAttribute\";i:23;s:15:\"deleteAttribute\";i:24;s:13:\"createProduct\";i:25;s:13:\"updateProduct\";i:26;s:11:\"viewProduct\";i:27;s:13:\"deleteProduct\";i:28;s:11:\"createOrder\";i:29;s:11:\"updateOrder\";i:30;s:9:\"viewOrder\";i:31;s:11:\"deleteOrder\";i:32;s:11:\"viewReports\";i:33;s:13:\"updateCompany\";i:34;s:11:\"viewProfile\";i:35;s:13:\"updateSetting\";}'),
(2, 'Clinic', 'a:19:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:13:\"createPatient\";i:9;s:13:\"updatePatient\";i:10;s:11:\"viewPatient\";i:11;s:13:\"deletePatient\";i:12;s:14:\"createPharmacy\";i:13;s:14:\"updatePharmacy\";i:14;s:12:\"viewPharmacy\";i:15;s:14:\"deletePharmacy\";i:16;s:11:\"viewReports\";i:17;s:11:\"viewProfile\";i:18;s:13:\"updateSetting\";}\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `ra_history`
--

CREATE TABLE `ra_history` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `history` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_history`
--

INSERT INTO `ra_history` (`id`, `patient_id`, `history`, `created_date`, `is_deleted`, `deleted_date`) VALUES
(1, 1, 'Demo complaint', '2022-03-19 05:39:04', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ra_investigation`
--

CREATE TABLE `ra_investigation` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `investigation` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ra_med_patient`
--

CREATE TABLE `ra_med_patient` (
  `med_patient_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `med_id` int NOT NULL,
  `quantity` int NOT NULL,
  `type` varchar(100) NOT NULL,
  `total_cost` int NOT NULL,
  `highlighted` enum('0','1') NOT NULL,
  `assign_date` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_med_patient`
--

INSERT INTO `ra_med_patient` (`med_patient_id`, `patient_id`, `med_id`, `quantity`, `type`, `total_cost`, `highlighted`, `assign_date`) VALUES
(1, 1, 2, 1, 'Bot', 300, '1', 1647668369);

-- --------------------------------------------------------

--
-- Table structure for table `ra_patient`
--

CREATE TABLE `ra_patient` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
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

INSERT INTO `ra_patient` (`id`, `name`, `year`, `month`, `day`, `gender`, `address`, `created_date`, `deleted_date`, `is_deleted`) VALUES
(1, 'Danial', 60, 0, 0, 1, 'New York', '2022-03-19 05:37:39', '0000-00-00 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ra_patient_visit`
--

CREATE TABLE `ra_patient_visit` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `visited_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_patient_visit`
--

INSERT INTO `ra_patient_visit` (`id`, `patient_id`, `visited_date`) VALUES
(1, 1, '2022-03-19 05:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `ra_pharmacy`
--

CREATE TABLE `ra_pharmacy` (
  `id` int NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `tab_quantity` int DEFAULT '0',
  `used_quantity` int NOT NULL,
  `remain_quantity` int NOT NULL,
  `remain_tab_quantity` int DEFAULT '0',
  `register_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sell_type` varchar(100) NOT NULL,
  `actual_price` int NOT NULL,
  `selling_price` int NOT NULL,
  `profit_price` varchar(255) NOT NULL,
  `tab_price` int NOT NULL,
  `status` enum('1','0') NOT NULL,
  `is_deleted` enum('1','0') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_pharmacy`
--

INSERT INTO `ra_pharmacy` (`id`, `medicine_name`, `quantity`, `tab_quantity`, `used_quantity`, `remain_quantity`, `remain_tab_quantity`, `register_date`, `expire_date`, `description`, `sell_type`, `actual_price`, `selling_price`, `profit_price`, `tab_price`, `status`, `is_deleted`, `created_date`, `deleted_date`) VALUES
(1, 'Allopurinol', 100, 1000, 0, 100, 100000, '2022-03-19', '2024-10-29', '', 'Bot', 15, 20, '5(33%)', 0, '1', '0', '2022-03-19 05:31:32', NULL),
(2, 'Alemtuzumab', 200, 5, 1, 199, 995, '2022-03-19', '2024-11-19', 'Primis nihil consequatur eligendi facilisi fusce, hic, nisi aliquam fames? Penatibus? Enim, elit, a ex delectus harum, rhoncus perspiciatis, bibendum sapien corrupti fermentum nec! Molestias non omnis class, parturient interdum? Repudiandae nobis, volupta', 'Bot', 200, 300, '100(50%)', 60, '1', '0', '2022-03-19 05:33:00', NULL),
(3, 'Amifostine', 20, 0, 0, 20, 0, '2022-03-19', '2024-10-31', '', 'Unit', 100, 200, '100(100%)', 0, '1', '0', '0000-00-00 00:00:00', NULL),
(4, 'dolutegravir', 20, 0, 0, 20, 0, '2022-03-19', '2022-03-30', 'Adipisci, facilisi? Dis soluta, mattis? Tempora? Ornare iste, suspendisse et.', 'Tube', 100, 200, '100(100%)', 0, '1', '0', '2022-03-19 05:36:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ra_pres_patient`
--

CREATE TABLE `ra_pres_patient` (
  `pres_patient_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `pres_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `highlighted` enum('0','1') DEFAULT NULL,
  `assign_date` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ra_user`
--

CREATE TABLE `ra_user` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ra_user`
--

INSERT INTO `ra_user` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `phone`, `gender`) VALUES
(1, 'adminknst', '$2y$10$yfi5nUQGXUZtMdl27dWAyOd/jMOmATBpiUvJDmUu9hJ5Ro6BE5wsK', 'admin@admin.com', 'john', 'doe', '80789998', 0),
(2, 'admin', '$2y$10$NQqqebbQcvX/wzdziVNWn.P5BmwzKGqQd/yZ7WzzVdOWeyhmnSKNm', 'r@gmail.com', 'admin', 'admin', '09111111111', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ra_usergroup`
--

CREATE TABLE `ra_usergroup` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_diagnosis`
--
ALTER TABLE `ra_diagnosis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_diag_patient`
--
ALTER TABLE `ra_diag_patient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_exa_patient`
--
ALTER TABLE `ra_exa_patient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_group`
--
ALTER TABLE `ra_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_history`
--
ALTER TABLE `ra_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_investigation`
--
ALTER TABLE `ra_investigation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ra_med_patient`
--
ALTER TABLE `ra_med_patient`
  MODIFY `med_patient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_patient`
--
ALTER TABLE `ra_patient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_patient_visit`
--
ALTER TABLE `ra_patient_visit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ra_pharmacy`
--
ALTER TABLE `ra_pharmacy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ra_pres_patient`
--
ALTER TABLE `ra_pres_patient`
  MODIFY `pres_patient_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ra_user`
--
ALTER TABLE `ra_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ra_usergroup`
--
ALTER TABLE `ra_usergroup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
