-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2021 at 08:37 AM
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
-- Database: `cmsproject`
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
(2, 'student', 'photo', 'students see this photo', '2021-05-19 23:46:36', 'Upload/bg-img.jpg'),
(5, 'student', 'dbms', 'dbms lab', '2021-05-21 11:28:58', 'Upload/dbms_img.png');

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
(1, 'o1', 'link', 'https://drive.google.com/file/d/1eH5HX3ULSuqzLHv6sVQABx-rP8oeCpns/view?usp=sharing', 'Abraham Silberschatz - Operating Systems', 'This is the book for the entire semester\r\n\r\nCheck stfuff\r\n\r\n\r\nasdfasdf\r\n\r\n\r\nasdfa', '2021-05-22 08:38:35'),
(2, 'o1', 'video', 'https://www.youtube.com/embed/vBURTt97EkA', 'Introduction to OS', 'Introductory video\r\n\r\nsome stuff', '2021-05-22 08:59:05'),
(3, 'o1', 'link', 'https://drive.google.com/file/d/1RZ-hyFIT4yvhsEZp0kiGhy6lizBWj1Jf/view?usp=sharing', 'OS Handwritten Notes', 'Go through these notes to view the information.', '2021-05-22 13:25:42'),
(5, 'o1', 'code', '<video width=\'100%\' controls><source src=\"https://www.w3schools.com/html/mov_bbb.mp4\" type=\"video/mp4\"></video>', 'This Post is to check if information can be embedded', 'Writing some shit here\r\n<br>\r\ndoes this work??', '2021-05-22 18:48:34'),
(7, 'd1', 'link', 'https://www.youtube.com/watch?v=lVHZMkMpbRU', 'Youtube Link', 'As a link', '2021-05-24 19:24:25'),
(12, 'd1', 'file', 'toc assignment.pdf', 'Checking the upload', 'again', '2021-05-27 08:43:40'),
(13, 'd1', 'file', '1.jpeg', 'Just an image', 'View karo', '2021-05-27 19:33:39');

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
('m1', 'maths calculus', 1),
('m2', 'maths LA', 2),
('o1', 'os', 1),
('w1', 'webdevelopment', 2);

-- --------------------------------------------------------

--
-- Table structure for table `course_notifications`
--

CREATE TABLE `course_notifications` (
  `id` int(11) NOT NULL,
  `courseid` varchar(10) NOT NULL,
  `content` text NOT NULL,
  `file` text DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_notifications`
--

INSERT INTO `course_notifications` (`id`, `courseid`, `content`, `file`, `time`) VALUES
(1, 'd1', 'Checking notification...', NULL, '2021-05-27 11:53:00'),
(2, 'd1', 'hELLO', '', '2021-05-27 19:42:24'),
(3, 'd1', 'This is image sent as notification', '3.jpeg', '2021-05-27 19:43:03');

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
(8, 2019103516, 'd2'),
(9, 2019103516, 'm1');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`rollno`, `name`, `password`, `DOB`, `Address`) VALUES
(2019103513, 'bhuvi', 'bhuvi', '2001-06-01', 'xyz'),
(2019103516, 'dheepak', 'dheepak', '2001-07-28', 'abc'),
(2019103518, 'rahul', 'rahul', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_update`
--

CREATE TABLE `student_update` (
  `id` int(10) NOT NULL,
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `newpassword` varchar(20) NOT NULL,
  `newname` varchar(20) NOT NULL,
  `newdob` date NOT NULL,
  `newaddress` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_update`
--

INSERT INTO `student_update` (`id`, `rollno`, `newpassword`, `newname`, `newdob`, `newaddress`) VALUES
(1, 2019103516, 'dheepak28', 'dheepakraaj', '2021-05-28', 'hello'),
(2, 2019103513, 'bhuvanesh', 'bhuvaneshwar', '2021-05-15', 'no,8 bgubvgyfc '),
(3, 2019103516, 'bhuvanesh', 'dheepakraaj', '0000-00-00', '');

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
-- Indexes for table `course_notifications`
--
ALTER TABLE `course_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseid` (`courseid`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `rollno` (`rollno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `notid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_data`
--
ALTER TABLE `course_data`
  MODIFY `dataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `course_notifications`
--
ALTER TABLE `course_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student_update`
--
ALTER TABLE `student_update`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Constraints for table `course_notifications`
--
ALTER TABLE `course_notifications`
  ADD CONSTRAINT `course_notifications_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course_details` (`courseid`);

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
