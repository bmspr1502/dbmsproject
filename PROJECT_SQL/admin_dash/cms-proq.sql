-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2021 at 08:56 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_proj`
--

-- --------------------------------------------------------

--
-- Table structure for table `course_data`
--

CREATE TABLE `course_data` (
  `dataid` int(11) NOT NULL,
  `courseid` varchar(10) NOT NULL,
  `type` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course_details`
--

CREATE TABLE `course_details` (
  `courseid` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profno` bigint(20) UNSIGNED NOT NULL,
  `noofstudents` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_details`
--

INSERT INTO `course_details` (`courseid`, `name`, `profno`, `noofstudents`) VALUES
('c123', 'Human Values', 9876, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prof_courses`
--

CREATE TABLE `prof_courses` (
  `pid` int(11) NOT NULL,
  `profno` bigint(30) UNSIGNED DEFAULT NULL,
  `courseid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prof_courses`
--

INSERT INTO `prof_courses` (`pid`, `profno`, `courseid`) VALUES
(1, 9876, 'c123');

-- --------------------------------------------------------

--
-- Table structure for table `prof_details`
--

CREATE TABLE `prof_details` (
  `profno` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `noofcourses` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prof_details`
--

INSERT INTO `prof_details` (`profno`, `name`, `password`, `noofcourses`) VALUES
(9876, 'Ramachandran', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `uid` int(10) UNSIGNED NOT NULL,
  `rollno` bigint(20) UNSIGNED DEFAULT NULL,
  `courseid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`uid`, `rollno`, `courseid`) VALUES
(3, 1234, 'c123');

--
-- Triggers `student_courses`
--
DELIMITER $$
CREATE TRIGGER `add_courses` BEFORE INSERT ON `student_courses` FOR EACH ROW UPDATE student_details
SET noofcourses = noofcourses + 1
WHERE student_details.rollno = rollno
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `drop_courses` BEFORE DELETE ON `student_courses` FOR EACH ROW UPDATE student_details
SET noofcourses = noofcourses - 1
WHERE student_details.rollno = rollno
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `name` varchar(30) NOT NULL,
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(20) NOT NULL,
  `noofcourses` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`name`, `rollno`, `password`, `noofcourses`) VALUES
('test', 1234, '1234', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_data`
--
ALTER TABLE `course_data`
  ADD PRIMARY KEY (`dataid`),
  ADD KEY `cdatafk` (`courseid`);

--
-- Indexes for table `course_details`
--
ALTER TABLE `course_details`
  ADD PRIMARY KEY (`courseid`);

--
-- Indexes for table `prof_courses`
--
ALTER TABLE `prof_courses`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `profno` (`profno`),
  ADD KEY `coursefk` (`courseid`);

--
-- Indexes for table `prof_details`
--
ALTER TABLE `prof_details`
  ADD PRIMARY KEY (`profno`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `rollno` (`rollno`),
  ADD KEY `coursestudentfk` (`courseid`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`rollno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_data`
--
ALTER TABLE `course_data`
  MODIFY `dataid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prof_courses`
--
ALTER TABLE `prof_courses`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_data`
--
ALTER TABLE `course_data`
  ADD CONSTRAINT `cdatafk` FOREIGN KEY (`courseid`) REFERENCES `course_details` (`courseid`);

--
-- Constraints for table `prof_courses`
--
ALTER TABLE `prof_courses`
  ADD CONSTRAINT `coursefk` FOREIGN KEY (`courseid`) REFERENCES `course_details` (`courseid`),
  ADD CONSTRAINT `prof_courses_ibfk_1` FOREIGN KEY (`profno`) REFERENCES `prof_details` (`profno`);

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `coursestudentfk` FOREIGN KEY (`courseid`) REFERENCES `course_details` (`courseid`),
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student_details` (`rollno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;