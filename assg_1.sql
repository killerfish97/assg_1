-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jul 12, 2022 at 04:23 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assg_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `options_tbl`
--

CREATE TABLE `options_tbl` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `certification_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `options_tbl`
--

INSERT INTO `options_tbl` (`id`, `question_id`, `certification_id`, `name`, `score`) VALUES
(1, 1, 1, 'Less than 10% of applicable land', 0),
(2, 1, 1, '10-24% of applicable land', 1),
(3, 1, 1, '25-49% of applicable land, or;', 2),
(4, 1, 1, '50+% of applicable land is utilized for the p', 3),
(5, 2, 1, 'Less than 2% of applicable land', 1),
(6, 2, 1, '2-4% of applicable land incorporates; plants ', 2),
(7, 2, 1, '5-9+% of applicable land incorporates plants ', 3),
(8, 2, 1, '10%+ of applicable land incorporates plants t', 3);

-- --------------------------------------------------------

--
-- Table structure for table `question_tbl`
--

CREATE TABLE `question_tbl` (
  `id` int(11) NOT NULL,
  `certification_id` int(11) NOT NULL,
  `section_id` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `sub_title` varchar(1000) NOT NULL,
  `question_no` varchar(250) NOT NULL,
  `question` varchar(250) NOT NULL,
  `option_type` varchar(250) NOT NULL,
  `note` varchar(250) NOT NULL,
  `documents` varchar(250) NOT NULL,
  `is_answered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_tbl`
--

INSERT INTO `question_tbl` (`id`, `certification_id`, `section_id`, `title`, `sub_title`, `question_no`, `question`, `option_type`, `note`, `documents`, `is_answered`) VALUES
(1, 1, 'Arable, fresh produce', 'Cover-cropping', 'Cover crops are planted between the harvest of one crop and the planting of another on the same piece of land. To maximize the agronomical and ecological benefits from cover crops, they should be planted for a minimum of two months. (Refer regenagri Stand', '1.1', 'On average over a three-year period, cover-cropping occurs on:', 'single', '', '', 0),
(2, 1, 'Arable, pastoral, fresh produce, top fruits', 'Perennial cropping', 'Perennial crops are plants that do not require replanting each year ranging from perennial grasslands, shrubs, perennial biomass crops and even trees. The farmers should dedicate a small percentage of land towards the installation and maintenance of peren', '2.1', 'Perennial cropping is incorporated into:', 'single', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `options_tbl`
--
ALTER TABLE `options_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qus_ans_rel` (`question_id`);

--
-- Indexes for table `question_tbl`
--
ALTER TABLE `question_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `options_tbl`
--
ALTER TABLE `options_tbl`
  ADD CONSTRAINT `qus_ans_rel` FOREIGN KEY (`question_id`) REFERENCES `question_tbl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
