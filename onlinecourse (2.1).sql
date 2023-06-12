-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 11:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2022-01-31 16:21:18', '2022-01-31 16:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `courseCode` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `courseUnit` varchar(255) DEFAULT NULL,
  `noofSeats` int(11) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `courseCode`, `courseName`, `courseUnit`, `noofSeats`, `creationDate`, `updationDate`, `credits`) VALUES
(1, 'PHP01', 'PHP', '5', 5, '2022-02-10 17:23:28', '13-05-2023 11:08:02 PM', 3),
(2, 'CP001', 'C++', '12', 5, '2022-02-11 00:52:46', '13-05-2023 10:07:09 PM', 2),
(8, 'JVA01', 'Java', '2', 89, '2023-05-22 10:59:03', NULL, 5),
(9, 'PYT01', 'Python', '5', 100, '2023-05-23 05:09:06', NULL, 4),
(10, 'HTML3', 'Html', '56', 90, '2023-05-23 05:10:07', NULL, 2),
(11, 'MNG01', 'Disaster Management', '790', 9999, '2023-05-23 05:11:36', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `courseenrolls`
--

CREATE TABLE `courseenrolls` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `enrollDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courseenrolls`
--

INSERT INTO `courseenrolls` (`id`, `studentRegno`, `pincode`, `session`, `department`, `level`, `semester`, `course`, `enrollDate`) VALUES
(22, '10806121', '560035', 1, 1, 2, 2, 1, '2023-06-11 17:54:42'),
(23, '111', '641001', 1, 1, 1, 1, 1, '2023-06-11 17:55:19'),
(24, '222', '690525', 4, 2, 1, 2, 2, '2023-06-11 17:56:36'),
(25, '333', '560035', 3, 2, 3, 2, 2, '2023-06-11 17:57:19'),
(26, '444', '682041', 3, 4, 1, 1, 2, '2023-06-11 17:58:31'),
(27, '555', '690525', 1, 4, 2, 6, 8, '2023-06-11 17:59:33'),
(28, '123', '570026', 4, 5, 3, 6, 8, '2023-06-11 18:00:30'),
(29, '321', '601103', 4, 5, 3, 6, 9, '2023-06-11 18:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `maxcredits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`, `creationDate`, `maxcredits`) VALUES
(1, 'IT', '2022-02-10 17:23:04', 6),
(2, 'HR', '2022-02-10 17:23:09', 6),
(4, 'cse', '2023-05-22 05:28:36', 5),
(5, 'mech', '2023-05-22 10:57:23', 7);

-- --------------------------------------------------------

--
-- Table structure for table `eval`
--

CREATE TABLE `eval` (
  `name` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `mmarks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eval`
--

INSERT INTO `eval` (`name`, `course`, `mmarks`) VALUES
('PHP-Quiz1', '1', 20),
('PHP-LabEval', '1', 30),
('C++Tutorial', '2', 25),
('C++LabEval', '2', 40),
('JAVA-Quiz1', '8', 20),
('JAVA-Quiz2', '8', 20),
('PYTHON-CaseStudy', '9', 50),
('JAVA-LabEval', '8', 35);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level`, `creationDate`) VALUES
(1, '1', '2022-02-11 00:59:02'),
(2, '2', '2022-02-11 00:59:02'),
(3, '3', '2022-02-11 00:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `sname` varchar(255) NOT NULL,
  `ename` varchar(255) NOT NULL,
  `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`sname`, `ename`, `mark`) VALUES
('Anuj kumar', 'PHP-Quiz1', 10),
('Ram', 'PHP-Quiz1', 15),
('Anuj kumar', 'PHP-LabEval', 20),
('Ram', 'PHP-LabEval', 23),
('Aditya', 'C++Tutorial', 15),
('Pranav', 'C++Tutorial', 20),
('Roy', 'C++Tutorial', 10),
('Aditya', 'C++LabEval', 30),
('Pranav', 'C++LabEval', 25),
('Roy', 'C++LabEval', 20),
('Nagalingam', 'PYTHON-CaseStudy', 45),
('Krishna', 'JAVA-Quiz1', 17),
('Krishna', 'JAVA-Quiz2', 19),
('Sai', 'JAVA-Quiz1', 10),
('Sai', 'JAVA-Quiz2', 13),
('Sai', 'JAVA-LabEval', 31),
('Krishna', 'JAVA-LabEval', 35);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `newstitle` varchar(255) DEFAULT NULL,
  `newsDescription` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `newstitle`, `newsDescription`, `postingDate`) VALUES
(9, 'IDEA Induction Event!', 'We proudly present iDEA: the Integrated Development Environment of Amrita, where your potential knows no bounds. Connect, create, and make a difference! ', '2023-06-12 09:24:49'),
(10, 'Elective Registration Ongoing!!', 'Elective Registration portal is open from, 12/6/23 to 25/6/23.', '2023-06-12 09:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id` int(11) NOT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `semester`, `creationDate`, `updationDate`) VALUES
(1, '1', '2022-02-10 17:22:49', NULL),
(2, '2', '2022-02-10 17:22:55', NULL),
(3, '3', '2022-02-11 00:51:43', NULL),
(5, '4', '2023-05-21 17:13:17', NULL),
(6, '5', '2023-05-22 10:57:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `session`, `creationDate`) VALUES
(1, '2022', '2022-02-10 17:10:59'),
(3, '2023', '2023-05-21 17:13:10'),
(4, '2024', '2023-05-22 10:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentRegno` varchar(255) NOT NULL,
  `studentPhoto` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `cgpa` decimal(10,2) DEFAULT NULL,
  `creationdate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `phnumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentRegno`, `studentPhoto`, `password`, `studentName`, `pincode`, `session`, `department`, `semester`, `cgpa`, `creationdate`, `updationDate`, `mail`, `phnumber`) VALUES
('10806121', '', 'f925916e2754e5e03f75dd58a5733251', 'Anuj kumar', '560035', NULL, NULL, NULL, 7.10, '2022-02-11 00:53:31', NULL, NULL, NULL),
('111', NULL, '61587f3505f272e794b2ec3bd013e69f', 'Ram', '641001', NULL, NULL, NULL, NULL, '2023-06-08 13:03:16', NULL, 'nramgopal01@gmail.com', '916382787042'),
('123', NULL, 'f679caa29988cf88cc72baf27daa07f9', 'Krishna', '570026', NULL, NULL, NULL, NULL, '2023-06-08 13:31:22', NULL, 'krishnanagalingam@gmail.com', '918610982962'),
('222', NULL, '293bd796745dc1f72a7fa9d08b6dae9a', 'Aditya', '690525', NULL, NULL, NULL, NULL, '2023-06-08 13:13:33', NULL, 'akrocks651@gmail.com', '918072111947'),
('321', NULL, 'd14e48301bef8ba9b0b2912ea55c8fa9', 'Nagalingam', '601103', NULL, NULL, NULL, NULL, '2023-06-08 13:32:23', NULL, 'nagu_7835@yahoo.com', '917101732821'),
('333', NULL, '5b112954c8bf3bc5e213f777cb5bc0db', 'Pranav', '560035', NULL, NULL, NULL, NULL, '2023-06-08 13:17:41', NULL, 'spranav.777@outlook.com', '919500030555'),
('444', NULL, '011e03d22a82fbfcedaa49de5cfaa451', 'Roy', '682041', NULL, NULL, NULL, NULL, '2023-06-08 13:19:18', NULL, 'abishekroy2003@gmail.com', '919994637918'),
('555', NULL, 'f050b92075976425459071e62c0c1c38', 'Sai', '690525', NULL, NULL, NULL, NULL, '2023-06-08 13:22:28', NULL, 'saikrishnanr2002@gmail.com', '917021803667');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `username`, `password`) VALUES
(1, 'teacher1', 'c70c5303c715dd5818a7e8ca8d35c256');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `studentRegno`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, '10806121', 0x3a3a3100000000000000000000000000, '2022-02-11 00:55:07', NULL, 1),
(2, '10806121', 0x3a3a3100000000000000000000000000, '2022-02-11 00:57:00', NULL, 1),
(3, '10806121', 0x3a3a3100000000000000000000000000, '2022-02-11 00:57:22', '11-02-2022 06:31:26 AM', 1),
(4, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 09:15:59', '13-05-2023 02:47:15 PM', 1),
(5, '', 0x3a3a3100000000000000000000000000, '2023-05-13 13:59:45', NULL, 1),
(6, '', 0x3a3a3100000000000000000000000000, '2023-05-13 14:00:03', NULL, 1),
(7, '789', 0x3a3a3100000000000000000000000000, '2023-05-13 14:04:38', NULL, 1),
(8, '789', 0x3a3a3100000000000000000000000000, '2023-05-13 14:05:50', '13-05-2023 07:35:55 PM', 1),
(9, '789', 0x3a3a3100000000000000000000000000, '2023-05-13 14:10:21', '13-05-2023 07:41:32 PM', 1),
(10, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 14:15:38', '13-05-2023 07:46:23 PM', 1),
(11, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 14:17:24', '13-05-2023 07:47:30 PM', 1),
(12, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 14:20:11', '13-05-2023 07:52:00 PM', 1),
(13, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 14:22:06', '13-05-2023 07:53:49 PM', 1),
(14, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 14:28:24', '13-05-2023 08:01:21 PM', 1),
(15, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 14:32:31', '13-05-2023 08:02:35 PM', 1),
(16, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 15:48:32', '13-05-2023 09:19:25 PM', 1),
(17, '10806121', 0x3a3a3100000000000000000000000000, '2023-05-13 15:49:43', '13-05-2023 09:19:49 PM', 1),
(18, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 16:39:59', '13-05-2023 10:54:36 PM', 1),
(19, '456', 0x3a3a3100000000000000000000000000, '2023-05-13 17:25:12', '13-05-2023 10:55:42 PM', 1),
(20, '121', 0x3a3a3100000000000000000000000000, '2023-05-13 17:30:15', '13-05-2023 11:01:07 PM', 1),
(21, '121', 0x3a3a3100000000000000000000000000, '2023-05-13 17:32:08', '13-05-2023 11:04:14 PM', 1),
(22, '121', 0x3a3a3100000000000000000000000000, '2023-05-13 17:36:48', '13-05-2023 11:07:33 PM', 1),
(23, '121', 0x3a3a3100000000000000000000000000, '2023-05-13 17:38:15', '13-05-2023 11:54:24 PM', 1),
(24, '121', 0x3a3a3100000000000000000000000000, '2023-05-13 18:30:13', '14-05-2023 12:01:03 AM', 1),
(25, '121', 0x3a3a3100000000000000000000000000, '2023-05-13 18:31:07', '14-05-2023 12:19:23 AM', 1),
(26, '121', 0x3a3a3100000000000000000000000000, '2023-05-21 16:59:36', '21-05-2023 10:29:43 PM', 1),
(27, '121', 0x3a3a3100000000000000000000000000, '2023-05-21 16:59:50', '21-05-2023 10:31:42 PM', 1),
(28, '121', 0x3a3a3100000000000000000000000000, '2023-05-21 17:03:17', '21-05-2023 10:33:49 PM', 1),
(29, '121', 0x3a3a3100000000000000000000000000, '2023-05-21 17:05:35', '21-05-2023 10:36:34 PM', 1),
(30, '222', 0x3a3a3100000000000000000000000000, '2023-05-21 17:09:11', '21-05-2023 10:41:29 PM', 1),
(31, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 04:50:25', '22-05-2023 10:21:37 AM', 1),
(32, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:03:30', '22-05-2023 10:33:38 AM', 1),
(33, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:07:13', '22-05-2023 10:39:00 AM', 1),
(34, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:29:27', '22-05-2023 11:00:16 AM', 1),
(35, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:31:17', NULL, 1),
(36, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:35:07', '22-05-2023 11:08:27 AM', 1),
(37, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:38:32', '22-05-2023 11:17:03 AM', 1),
(38, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:47:08', NULL, 1),
(39, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:48:54', NULL, 1),
(40, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 05:49:42', NULL, 1),
(41, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 06:05:56', '22-05-2023 11:36:51 AM', 1),
(42, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 06:09:54', '22-05-2023 11:43:30 AM', 1),
(43, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 06:45:15', '22-05-2023 12:15:53 PM', 1),
(44, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 10:28:02', '22-05-2023 03:58:24 PM', 1),
(45, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 10:37:31', '22-05-2023 04:07:44 PM', 1),
(46, '2323', 0x3a3a3100000000000000000000000000, '2023-05-22 10:54:02', '22-05-2023 04:26:53 PM', 1),
(47, '1313', 0x3a3a3100000000000000000000000000, '2023-05-22 11:00:52', '22-05-2023 04:31:06 PM', 1),
(48, '122333', 0x3a3a3100000000000000000000000000, '2023-05-22 14:30:09', '22-05-2023 08:05:37 PM', 1),
(49, '122333', 0x3a3a3100000000000000000000000000, '2023-05-22 14:35:45', '22-05-2023 08:05:48 PM', 1),
(50, '122333', 0x3a3a3100000000000000000000000000, '2023-05-22 14:39:52', '22-05-2023 08:10:01 PM', 1),
(51, '04', 0x3a3a3100000000000000000000000000, '2023-05-23 03:51:04', '23-05-2023 09:21:28 AM', 1),
(52, '059', 0x3a3a3100000000000000000000000000, '2023-05-23 05:18:26', '23-05-2023 10:56:49 AM', 1),
(53, '04', 0x3a3a3100000000000000000000000000, '2023-05-23 05:53:56', '23-05-2023 11:23:59 AM', 1),
(54, '059', 0x3a3a3100000000000000000000000000, '2023-05-23 06:04:40', '23-05-2023 11:36:13 AM', 1),
(55, '059', 0x3a3a3100000000000000000000000000, '2023-05-23 06:10:05', '23-05-2023 11:41:10 AM', 1),
(56, '059', 0x3a3a3100000000000000000000000000, '2023-05-23 06:11:41', '23-05-2023 11:41:59 AM', 1),
(57, '444', 0x3a3a3100000000000000000000000000, '2023-05-23 06:14:31', '23-05-2023 11:44:35 AM', 1),
(58, '444', 0x3a3a3100000000000000000000000000, '2023-05-23 06:19:56', '23-05-2023 11:54:30 AM', 1),
(59, '04', 0x3a3a3100000000000000000000000000, '2023-05-23 06:29:39', '23-05-2023 11:59:45 AM', 1),
(60, '122333', 0x3a3a3100000000000000000000000000, '2023-06-01 11:16:03', '01-06-2023 04:46:07 PM', 1),
(61, '1313', 0x3a3a3100000000000000000000000000, '2023-06-01 11:16:57', '01-06-2023 04:47:00 PM', 1),
(62, '1313', 0x3a3a3100000000000000000000000000, '2023-06-04 08:06:54', '04-06-2023 01:36:55 PM', 1),
(63, '122333', 0x3a3a3100000000000000000000000000, '2023-06-05 15:48:08', '05-06-2023 09:18:11 PM', 1),
(64, '1111', 0x3a3a3100000000000000000000000000, '2023-06-05 15:51:40', '05-06-2023 09:21:45 PM', 1),
(65, '1111', 0x3a3a3100000000000000000000000000, '2023-06-05 16:29:23', '05-06-2023 09:59:25 PM', 1),
(66, '111', 0x3a3a3100000000000000000000000000, '2023-06-07 05:56:29', '07-06-2023 11:37:11 AM', 1),
(67, '111', 0x3a3a3100000000000000000000000000, '2023-06-07 06:07:23', '07-06-2023 11:37:30 AM', 1),
(68, '111', 0x3a3a3100000000000000000000000000, '2023-06-07 06:08:03', '07-06-2023 11:39:29 AM', 1),
(69, '2221', 0x3a3a3100000000000000000000000000, '2023-06-07 06:18:04', '07-06-2023 11:48:07 AM', 1),
(70, '111', 0x3a3a3100000000000000000000000000, '2023-06-07 07:05:34', '07-06-2023 12:35:38 PM', 1),
(71, '2221', 0x3a3a3100000000000000000000000000, '2023-06-07 07:06:31', '07-06-2023 12:37:39 PM', 1),
(72, '111', 0x3a3a3100000000000000000000000000, '2023-06-08 13:04:17', '08-06-2023 06:34:46 PM', 1),
(73, '111', 0x3a3a3100000000000000000000000000, '2023-06-08 13:11:20', '08-06-2023 06:41:45 PM', 1),
(74, '555', 0x3a3a3100000000000000000000000000, '2023-06-08 13:25:12', '08-06-2023 06:56:36 PM', 1),
(75, '555', 0x3a3a3100000000000000000000000000, '2023-06-08 13:26:46', '08-06-2023 06:56:52 PM', 1),
(76, '555', 0x3a3a3100000000000000000000000000, '2023-06-08 13:28:11', '08-06-2023 06:58:31 PM', 1),
(77, '111', 0x3a3a3100000000000000000000000000, '2023-06-11 13:28:52', NULL, 1),
(78, '10806121', 0x3a3a3100000000000000000000000000, '2023-06-11 17:09:23', '11-06-2023 10:52:53 PM', 1),
(79, '10806121', 0x3a3a3100000000000000000000000000, '2023-06-11 17:25:19', '11-06-2023 10:56:41 PM', 1),
(80, '123', 0x3a3a3100000000000000000000000000, '2023-06-11 17:44:04', '11-06-2023 11:14:15 PM', 1),
(81, '111', 0x3a3a3100000000000000000000000000, '2023-06-11 17:45:57', '11-06-2023 11:16:51 PM', 1),
(82, '10806121', 0x3a3a3100000000000000000000000000, '2023-06-11 17:47:44', NULL, 1),
(83, '10806121', 0x3a3a3100000000000000000000000000, '2023-06-11 17:54:21', '11-06-2023 11:24:46 PM', 1),
(84, '111', 0x3a3a3100000000000000000000000000, '2023-06-11 17:55:01', '11-06-2023 11:25:26 PM', 1),
(85, '222', 0x3a3a3100000000000000000000000000, '2023-06-11 17:55:59', '11-06-2023 11:26:40 PM', 1),
(86, '333', 0x3a3a3100000000000000000000000000, '2023-06-11 17:56:57', '11-06-2023 11:27:27 PM', 1),
(87, '444', 0x3a3a3100000000000000000000000000, '2023-06-11 17:57:46', '11-06-2023 11:28:37 PM', 1),
(88, '555', 0x3a3a3100000000000000000000000000, '2023-06-11 17:58:58', '11-06-2023 11:29:37 PM', 1),
(89, '123', 0x3a3a3100000000000000000000000000, '2023-06-11 18:00:04', '11-06-2023 11:30:33 PM', 1),
(90, '321', 0x3a3a3100000000000000000000000000, '2023-06-11 18:00:46', '11-06-2023 11:31:11 PM', 1),
(91, '123', 0x3a3a3100000000000000000000000000, '2023-06-12 07:35:42', '12-06-2023 01:05:44 PM', 1),
(92, '123', 0x3a3a3100000000000000000000000000, '2023-06-12 07:35:56', '12-06-2023 01:06:16 PM', 1),
(93, '123', 0x3a3a3100000000000000000000000000, '2023-06-12 07:45:42', '12-06-2023 01:18:11 PM', 1),
(94, '123', 0x3a3a3100000000000000000000000000, '2023-06-12 08:44:04', '12-06-2023 02:14:13 PM', 1),
(95, '321', 0x3a3a3100000000000000000000000000, '2023-06-12 09:05:31', '12-06-2023 02:38:21 PM', 1),
(96, '123', 0x3a3a3100000000000000000000000000, '2023-06-12 09:23:47', '12-06-2023 02:53:53 PM', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentRegno`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
