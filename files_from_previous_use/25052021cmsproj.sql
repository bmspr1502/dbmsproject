-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2021 at 04:00 PM
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
-- Database: `cmsproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `aid` varchar(20) NOT NULL,
  `apassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`aid`, `apassword`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `notid` int(11) NOT NULL,
  `target` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` varchar(150) NOT NULL,
  `logs` datetime NOT NULL,
  `upload` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`notid`, `target`, `title`, `message`, `logs`, `upload`) VALUES
(1, 'student', 'hello', 'hello students', '2021-05-19 23:22:52', ''),
(2, 'student', 'photo', 'students see this photo', '2021-05-19 23:46:36', 'Upload/IMG-20210212-WA0110.jpg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_courses`
-- (See below for the actual view)
--
CREATE TABLE `all_courses` (
`courseid` varchar(10)
,`course_name` varchar(50)
,`profno` bigint(20) unsigned
,`prof_name` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `course_data`
--

CREATE TABLE `course_data` (
  `dataid` int(11) NOT NULL,
  `courseid` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `link` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_data`
--

INSERT INTO `course_data` (`dataid`, `courseid`, `type`, `link`, `title`, `description`, `time`) VALUES
(1, 'o1', 'link', 'https://drive.google.com/file/d/1eH5HX3ULSuqzLHv6sVQABx-rP8oeCpns/view?usp=sharing', 'Abraham Silberschatz - Operating Systems', 'This is the book for the entire semester\r\n\r\nCheck stfuff', '2021-05-22 08:38:35'),
(2, 'o1', 'video', 'https://www.youtube.com/embed/vBURTt97EkA', 'Introduction to OS', 'Introductory video', '2021-05-22 08:59:05'),
(3, 'o1', 'link', 'https://drive.google.com/file/d/1RZ-hyFIT4yvhsEZp0kiGhy6lizBWj1Jf/view?usp=sharing', 'OS Handwritten Notes', 'Go through these notes to view the information.', '2021-05-22 13:25:42'),
(5, 'o1', 'code', '<video width=\'100%\' controls><source src=\"https://www.w3schools.com/html/mov_bbb.mp4\" type=\"video/mp4\"></video>', 'This Post is to check if information can be embedded', 'Writing some shit here\r\n<br>\r\ndoes this work??', '2021-05-22 18:48:34'),
(7, 'd1', 'link', 'https://www.youtube.com/watch?v=lVHZMkMpbRU', 'Youtube Link', 'As a link', '2021-05-24 19:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `course_details`
--

CREATE TABLE `course_details` (
  `courseid` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profno` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_details`
--

INSERT INTO `course_details` (`courseid`, `name`, `profno`) VALUES
('d1', 'dbms', 1),
('d2', 'Dsa', 2),
('d4', 'Linear Algebra', 2),
('o1', 'os', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prof_details`
--

CREATE TABLE `prof_details` (
  `profno` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prof_details`
--

INSERT INTO `prof_details` (`profno`, `name`, `password`) VALUES
(1, 'uma', 'uma'),
(2, 'ramesh', '0000');

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
(4, 2019103516, 'd1'),
(5, 2019103516, 'o1'),
(6, 2019103513, 'd2'),
(7, 2019103518, 'o1');

--
-- Triggers `student_courses`
--
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
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `noofcourses` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `DOB` date NOT NULL DEFAULT '2021-05-25'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`rollno`, `name`, `password`, `noofcourses`, `DOB`) VALUES
(2019103513, 'bhuvi', 'bhuvi', 3, '0000-00-00'),
(2019103516, 'dheepak', 'dheepak', 3, '0000-00-00'),
(2019103518, 'rahul', 'rahul', 3, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `student_update`
--

CREATE TABLE `student_update` (
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `newpassword` varchar(20) NOT NULL,
  `newname` varchar(20) NOT NULL,
  `newdob` date NOT NULL,
  `newaddress` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_update`
--

INSERT INTO `student_update` (`rollno`, `newpassword`, `newname`, `newdob`, `newaddress`) VALUES
(2019103516, 'dheepak28', 'dheepakraaj', '2021-05-28', 'hello'),
(2019103513, 'bhuvanesh', 'bhuvaneshwar', '2021-05-15', 'no,8 bgubvgyfc '),
(2019103516, 'bhuvanesh', 'dheepakraaj', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_all_courses_student`
-- (See below for the actual view)
--
CREATE TABLE `view_all_courses_student` (
`courseid` varchar(10)
,`course_name` varchar(50)
,`prof_name` varchar(30)
,`rollno` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Structure for view `all_courses`
--
DROP TABLE IF EXISTS `all_courses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_courses`  AS  select `course_details`.`courseid` AS `courseid`,`course_details`.`name` AS `course_name`,`prof_details`.`profno` AS `profno`,`prof_details`.`name` AS `prof_name` from (`course_details` join `prof_details` on(`course_details`.`profno` = `prof_details`.`profno`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_all_courses_student`
--
DROP TABLE IF EXISTS `view_all_courses_student`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_all_courses_student`  AS  select `all_courses`.`courseid` AS `courseid`,`all_courses`.`course_name` AS `course_name`,`all_courses`.`prof_name` AS `prof_name`,`student_courses`.`rollno` AS `rollno` from (`all_courses` left join `student_courses` on(`all_courses`.`courseid` = `student_courses`.`courseid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`notid`);

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
  ADD PRIMARY KEY (`courseid`),
  ADD KEY `PROFFK` (`profno`);

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
-- Indexes for table `student_update`
--
ALTER TABLE `student_update`
  ADD KEY `rollno` (`rollno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `notid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_data`
--
ALTER TABLE `course_data`
  MODIFY `dataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_data`
--
ALTER TABLE `course_data`
  ADD CONSTRAINT `cdatafk` FOREIGN KEY (`courseid`) REFERENCES `course_details` (`courseid`);

--
-- Constraints for table `course_details`
--
ALTER TABLE `course_details`
  ADD CONSTRAINT `PROFFK` FOREIGN KEY (`profno`) REFERENCES `prof_details` (`profno`);

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `coursestudentfk` FOREIGN KEY (`courseid`) REFERENCES `course_details` (`courseid`),
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student_details` (`rollno`);

--
-- Constraints for table `student_update`
--
ALTER TABLE `student_update`
  ADD CONSTRAINT `student_update_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `student_details` (`rollno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
