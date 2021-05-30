-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2021 at 07:30 PM
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
(1, 'student', 'Welcome to the Course Management System software', '<marquee>Hi students</marquee>\r\n<br>\r\nFeel free to use the software responsibly.', '2021-05-30 14:45:51', 'bg-img.jpg'),
(2, 'professor', 'Hello professors', 'Make sure that all students comply with the website regulations.', '2021-05-30 14:51:11', 'teacher.jpg'),
(3, 'both', 'Admin\\\'s role', 'Students can report any discomforts to the admin.', '2021-05-30 14:51:54', NULL);

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
(23, 'CS6108', 'file', 'os_assignment_8,10_2019103585 1.pdf', 'Assignment Based on last module', '', '2021-05-30 14:55:42'),
(24, 'CS6108', 'link', 'https://drive.google.com/file/d/1RZ-hyFIT4yvhsEZp0kiGhy6lizBWj1Jf/view?usp=sharing', 'OS Handwritten Notes - 1', 'Read from these notes', '2021-05-30 14:56:53'),
(25, 'CS6108', 'video', 'https://www.youtube.com/embed/YcRd3WMbXnE', 'Basics of Operating Systems', 'Watch the whole playlist', '2021-05-30 14:58:25'),
(26, 'CS6108', 'code', '<video controls>\r\n  <source src=\"https://www.w3schools.com/html/mov_bbb.mp4\" type=\"video/mp4\">\r\n  Your browser does not support HTML video.\r\n</video>', 'This is an example to embed code', 'Make sure that you remove the width characteristics while doing so.', '2021-05-30 15:00:35'),
(27, 'CS6106', 'video', 'https://www.youtube.com/embed/wOD02sezmX8', 'ER Diagrams', 'Watch the entire playlist', '2021-05-30 15:07:34');

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
('CS6101', 'Programming with C', 1502),
('CS6103', 'Application Devlopement Practices', 1603),
('CS6104', 'Data Structures and Algorithms', 1923),
('CS6105', 'Digital Fundamentals and Computer Organization', 1603),
('CS6106', 'Database Management Systems', 1923),
('CS6108', 'Operating Systems', 1502);

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
(11, 7, 'student', 2019103555, 'Should we submit diagrams for disk scheduling.', '2021-05-30 15:02:59'),
(12, 7, 'prof', 1502, 'Yes you have to do', '2021-05-30 15:03:11'),
(13, 8, 'prof', 1923, '31st May', '2021-05-30 15:06:23');

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
(7, 'CS6108', 'Add any doubts to the given assignment here.', 'prof', 1502, '2021-05-30 15:02:17'),
(8, 'CS6106', 'When is the project submission?', 'student', 2019103516, '2021-05-30 15:05:34');

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
(9, 'CS6108', 'Submit the given assignment before 02/06/2021.', 'assignments.pdf', '2021-05-30 15:01:39'),
(10, 'CS6106', 'Project submission on 31-05-2021', '', '2021-05-30 15:07:55');

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
(1502, 'Ramanathan', 'rama', 'rama@gmail.com', 9994863760),
(1603, 'Sheldon Cooper', 'tbbt', 'sheldon@gmail.com', 9876123401),
(1923, 'Kamala Vishwanathan', 'kamals', 'kamal@gmail.com', 9897312341);

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
(2019103516, 'CS6105'),
(2019103516, 'CS6106'),
(2019103516, 'CS6108'),
(2019103555, 'CS6105'),
(2019103555, 'CS6106'),
(2019103555, 'CS6108');

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
(2018104512, 'Leonard Hofstader', 'penny', '2001-08-15', 'Caltech, California', 'leonard@gmail.com', 9813412340),
(2019103513, 'Bhuvneshwar', 'bhuvi', '2001-06-01', 'This is a dummy address', 'bhuvi@email.com', 9012398765),
(2019103516, 'Dheepak Raaj', 'dheepak', '2001-07-28', 'Mariamman nagar, Chengalpattu', 'dheepak@gmail.com', 9412341234),
(2019103555, 'PRANAVA RAMAN B M S', 'bmspr', '2002-05-01', 'SHRI RAM BHAVANAM, 53/74,', 'bmspr1502@gmail.com', 9443501317),
(2019103560, 'Preeti Krishnaveni', 'preet', '2002-02-19', '16, Tarnaka, Hyderabad', 'preeti@gmail.com', 7231412341),
(2019103588, 'Sugavaneshwaran', 'sugav', '2000-11-10', '14, Anna Salai,  Namakkal', 'sugav@gmail.com', 9092698827),
(2019103611, 'Naresh Prasanna', 'escn', '1990-06-16', '13, Govindapuram, Tirunalveli', 'naresh@gmail.com', 9865432112);

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
(11, 2019103555, 'Change', 'My name is Pranava Raman not Pranav, can you change that.', '2021-05-29 17:45:21', 1);

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

CREATE VIEW `all_courses`  AS  select `course_details`.`courseid` AS `courseid`,`course_details`.`name` AS `course_name`,`prof_details`.`profno` AS `profno`,`prof_details`.`name` AS `prof_name` from (`course_details` join `prof_details` on(`course_details`.`profno` = `prof_details`.`profno`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_all_courses_student`
--
DROP TABLE IF EXISTS `view_all_courses_student`;

CREATE VIEW `view_all_courses_student`  AS  select `all_courses`.`courseid` AS `courseid`,`all_courses`.`course_name` AS `course_name`,`all_courses`.`prof_name` AS `prof_name`,`student_courses`.`rollno` AS `rollno` from (`all_courses` left join `student_courses` on(`all_courses`.`courseid` = `student_courses`.`courseid`)) ;

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
  MODIFY `notid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_data`
--
ALTER TABLE `course_data`
  MODIFY `dataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `course_forum_ans`
--
ALTER TABLE `course_forum_ans`
  MODIFY `ansid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `course_forum_qn`
--
ALTER TABLE `course_forum_qn`
  MODIFY `qnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_notifications`
--
ALTER TABLE `course_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
