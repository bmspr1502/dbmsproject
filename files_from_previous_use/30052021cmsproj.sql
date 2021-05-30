-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 10:14 PM
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
  `message` text NOT NULL,
  `logs` timestamp NOT NULL DEFAULT current_timestamp(),
  `upload` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`notid`, `target`, `title`, `message`, `logs`, `upload`) VALUES
(1, 'student', 'hello', 'hello students', '2021-05-19 17:52:52', NULL),
(2, 'student', 'photo', 'students see this photo', '2021-05-19 18:16:36', 'bg-img.jpg'),
(5, 'student', 'dbms', 'dbms lab', '2021-05-21 05:58:58', 'dbms_img.png'),
(6, 'student', 'Abraham Silberschatz - Operating Systems', 'This is a very important book\r\ndo read y\'all', '2021-05-29 17:35:30', 'Annotation 2020-08-07 101231.jpg'),
(7, 'professor', 'Important notification for professors', 'Makes sure all the students that are enrolled follow the rules for civilised discussions <br>\r\nIf any student is not following, you have powers to <b>Kick Him/Her OUT</b>', '2021-05-29 18:34:27', ''),
(9, 'professor', 'Some file', 'Check', '2021-05-29 18:44:33', 'WhatsApp Image 2019-10-10 at 8.16.16 PM.jpeg'),
(11, 'professor', 'this', 'will work', '2021-05-29 18:51:01', NULL);

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
(13, 'd1', 'file', '1.jpeg', 'Just an image', 'View karo', '2021-05-27 19:33:39'),
(19, 'd1', 'video', ' https://www.youtube.com/embed/6Iu45VZGQDk', 'dbms', 'dbms intro', '2021-05-28 07:18:54'),
(21, 'o1', 'file', '4TH SEM.png', '4th sem file', 'heyyyy', '2021-05-29 13:35:02');

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
('cs6202', 'Theory of Computation', 1502),
('d1', 'dbms', 1),
('d2', 'Dsa', 2),
('m1', 'maths calculus', 1),
('m2', 'maths LA', 2),
('o1', 'os', 1);

--
-- Triggers `course_details`
--
DELIMITER $$
CREATE TRIGGER `forcoursedata` BEFORE DELETE ON `course_details` FOR EACH ROW DELETE from course_data WHERE courseid=OLD.courseid
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `forcourseforumqn` BEFORE DELETE ON `course_details` FOR EACH ROW DELETE from course_forum_qn WHERE courseid=OLD.courseid
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `forcoursenotification` BEFORE DELETE ON `course_details` FOR EACH ROW DELETE from course_notifications WHERE courseid=OLD.courseid
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `forstudentcoursesbycourse` BEFORE DELETE ON `course_details` FOR EACH ROW DELETE FROM student_courses WHERE courseid=OLD.courseid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course_forum_ans`
--

CREATE TABLE `course_forum_ans` (
  `ansid` int(11) NOT NULL,
  `qnid` int(11) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `answer` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_forum_ans`
--

INSERT INTO `course_forum_ans` (`ansid`, `qnid`, `usertype`, `userid`, `answer`, `time`) VALUES
(1, 1, 'student', 2019103516, 'And this is a model solution, hope it will work.', '2021-05-28 08:22:58'),
(2, 1, 'prof', 1, 'Some response', '2021-05-28 19:22:56'),
(6, 3, 'student', 2019103516, 'last time', '2021-05-28 19:53:17'),
(7, 4, 'student', 2019103516, 'this is a response', '2021-05-28 20:05:47'),
(8, 4, 'prof', 1, '@2019103516 ok good', '2021-05-28 20:06:24'),
(9, 5, 'prof', 1, 'okiee', '2021-05-29 11:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `course_forum_qn`
--

CREATE TABLE `course_forum_qn` (
  `qnid` int(11) NOT NULL,
  `courseid` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `usertype` varchar(30) NOT NULL,
  `posted_by` bigint(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_forum_qn`
--

INSERT INTO `course_forum_qn` (`qnid`, `courseid`, `description`, `usertype`, `posted_by`, `time`) VALUES
(1, 'm1', 'This is an example for forum question, The description can be big, (as long as it is not pages long).', 'prof', 1, '2021-05-28 08:21:49'),
(2, 'm1', 'Adding A New question', 'prof', 1, '2021-05-28 17:38:15'),
(3, 'o1', 'Adding A New question', 'prof', 1, '2021-05-28 18:18:04'),
(4, 'd1', 'Hello', 'prof', 1, '2021-05-28 19:48:27'),
(5, 'o1', 'Check Student question ☑ ', 'student', 2019103516, '2021-05-28 19:53:47');

--
-- Triggers `course_forum_qn`
--
DELIMITER $$
CREATE TRIGGER `forcourseforumans` BEFORE DELETE ON `course_forum_qn` FOR EACH ROW DELETE FROM course_forum_ans WHERE qnid=OLD.qnid
$$
DELIMITER ;

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
(3, 'd1', 'This is image sent as notification', '3.jpeg', '2021-05-27 19:43:03'),
(5, 'd1', 'hello', '', '2021-05-28 08:52:38'),
(7, 'o1', 'Hoooo', '', '2021-05-28 14:15:36'),
(8, 'm1', 'Sending a notification', '', '2021-05-28 18:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `prof_details`
--

CREATE TABLE `prof_details` (
  `profno` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contactno` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prof_details`
--

INSERT INTO `prof_details` (`profno`, `name`, `password`, `email`, `contactno`) VALUES
(1, 'uma', 'uma', 'uma@annauniv.edu', 4272281234),
(2, 'ramesh', '0000', 'ramesh@cms.edu', 9823412312),
(1502, 'Pranava Raman', '1502', 'bmspr010502@gmail.com', 9994863760);

--
-- Triggers `prof_details`
--
DELIMITER $$
CREATE TRIGGER `forcoursedetails` BEFORE DELETE ON `prof_details` FOR EACH ROW DELETE from course_details WHERE 
profno=OLD.profno
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `courseid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`rollno`, `courseid`) VALUES
(2019103516, 'd1'),
(2019103516, 'd2'),
(2019103516, 'm1'),
(2019103516, 'o1'),
(2019103555, 'd1'),
(2019103555, 'o1');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contactno` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`rollno`, `name`, `password`, `DOB`, `Address`, `email`, `contactno`) VALUES
(2019103513, 'Bhuvneshwar', 'bhuvi', '2001-06-01', 'This is a dummy address', 'bhuvi@email.com', 234524),
(2019103516, 'dheepak', 'dheepak', '2001-07-28', 'abc', 'dheepak@gmail.com', NULL),
(2019103555, 'Pranav', 'bmspr', '2002-05-01', 'Bungalow Street, Salem - 01', 'bmspr1502@gmail.com', 9443501317);

--
-- Triggers `student_details`
--
DELIMITER $$
CREATE TRIGGER `forstudentcourses` BEFORE DELETE ON `student_details` FOR EACH ROW DELETE from student_courses WHERE
rollno=OLD.rollno
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `forstudentupdate` BEFORE DELETE ON `student_details` FOR EACH ROW DELETE from student_update WHERE rollno=OLD.rollno
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_update`
--

CREATE TABLE `student_update` (
  `id` int(10) NOT NULL,
  `rollno` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `request` varchar(100) NOT NULL,
  `logs` timestamp NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_update`
--

INSERT INTO `student_update` (`id`, `rollno`, `title`, `request`, `logs`, `status`) VALUES
(1, 2019103516, 'hello', 'hi', '2021-05-28 19:36:34', 1),
(11, 2019103555, 'Change', 'My name is Pranava Raman not Pranav, can you change that.', '2021-05-29 17:45:21', 0);

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
-- Indexes for table `course_forum_ans`
--
ALTER TABLE `course_forum_ans`
  ADD PRIMARY KEY (`ansid`),
  ADD KEY `qnid` (`qnid`);

--
-- Indexes for table `course_forum_qn`
--
ALTER TABLE `course_forum_qn`
  ADD PRIMARY KEY (`qnid`),
  ADD KEY `courseid` (`courseid`);

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
  ADD PRIMARY KEY (`profno`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contactno` (`contactno`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`rollno`,`courseid`),
  ADD KEY `rollno` (`rollno`),
  ADD KEY `coursestudentfk` (`courseid`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`rollno`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contactno` (`contactno`);

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
  MODIFY `notid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `course_data`
--
ALTER TABLE `course_data`
  MODIFY `dataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `course_forum_ans`
--
ALTER TABLE `course_forum_ans`
  MODIFY `ansid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `course_forum_qn`
--
ALTER TABLE `course_forum_qn`
  MODIFY `qnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_notifications`
--
ALTER TABLE `course_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student_update`
--
ALTER TABLE `student_update`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Constraints for table `course_forum_ans`
--
ALTER TABLE `course_forum_ans`
  ADD CONSTRAINT `course_forum_ans_ibfk_1` FOREIGN KEY (`qnid`) REFERENCES `course_forum_qn` (`qnid`);

--
-- Constraints for table `course_forum_qn`
--
ALTER TABLE `course_forum_qn`
  ADD CONSTRAINT `course_forum_qn_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course_details` (`courseid`);

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
