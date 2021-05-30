-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2021 at 07:27 PM
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
-- Database: `abachack`
--
CREATE DATABASE IF NOT EXISTS `abachack` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `abachack`;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `anid` int(11) NOT NULL,
  `announce` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`anid`, `announce`, `time`) VALUES
(1, 'Hello there', '2021-03-26 10:49:15'),
(2, 'Just checking', '2021-03-26 11:09:31'),
(3, 'Get somewhere', '2021-03-26 11:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `compid` int(11) NOT NULL,
  `complaint` text NOT NULL,
  `roomno` int(11) NOT NULL,
  `hostelname` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`compid`, `complaint`, `roomno`, `hostelname`, `status`, `response`) VALUES
(1, 'asdf', 1, 'marutham', 1, 'aas'),
(2, 'asdfas', 1, 'marutham', 0, ''),
(3, 'This stuff is not working, blah blah', 1, 'marutham', 0, ''),
(5, 'Hello World', 2, 'marutham', 0, NULL),
(6, 'Another thing not workng', 1, 'marutham', 1, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `marutham`
--

CREATE TABLE `marutham` (
  `name` text DEFAULT NULL,
  `rollno` int(11) NOT NULL,
  `roomno` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `fan` tinyint(4) DEFAULT 0,
  `light` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marutham`
--

INSERT INTO `marutham` (`name`, `rollno`, `roomno`, `status`, `fan`, `light`) VALUES
('Pranava Raman', 3555, 1, 0, 0, 0),
('Vijay', 3590, 2, 1, 1, 1),
('Warshak', 3600, 3, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`anid`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`compid`);

--
-- Indexes for table `marutham`
--
ALTER TABLE `marutham`
  ADD PRIMARY KEY (`rollno`),
  ADD UNIQUE KEY `roomno` (`roomno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `anid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `compid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `assemble`
--
CREATE DATABASE IF NOT EXISTS `assemble` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `assemble`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_name` varchar(15) NOT NULL,
  `admin_pwd` varchar(15) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_name`, `admin_pwd`, `admin_id`) VALUES
('admin', 'admin', 1989);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `reportid` int(11) NOT NULL,
  `report_from` int(11) NOT NULL,
  `reported_on` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skillid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `interest` text NOT NULL,
  `skills` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `works` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamid` int(11) NOT NULL,
  `creatorid` int(11) NOT NULL,
  `team_name` varchar(20) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `skills_needed` varchar(100) NOT NULL,
  `criteria` varchar(100) NOT NULL,
  `members_needed` int(3) NOT NULL,
  `members_in_team` int(3) NOT NULL,
  `domain` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`teamid`, `creatorid`, `team_name`, `purpose`, `skills_needed`, `criteria`, `members_needed`, `members_in_team`, `domain`) VALUES
(1, 5, 'dummy', 'dummy', 'killing', 'murderer', 10, 1, 'killing');

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `teamid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_request`
--

CREATE TABLE `team_request` (
  `requestid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `request_msg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pwd` varchar(15) NOT NULL,
  `name` text NOT NULL,
  `phno` bigint(10) NOT NULL,
  `sex` text NOT NULL,
  `mail` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `bio` varchar(50) DEFAULT NULL,
  `org_name` varchar(30) DEFAULT NULL,
  `sm_link` varchar(20) DEFAULT NULL,
  `warning` int(3) DEFAULT 0,
  `dp` varchar(255) NOT NULL DEFAULT 'avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `uname`, `pwd`, `name`, `phno`, `sex`, `mail`, `dob`, `bio`, `org_name`, `sm_link`, `warning`, `dp`) VALUES
(1, 'test1', 'test1', 'Test User', 1111111111, 'M', 'test1@gmail.com', '2012-11-10', 'This is test user one. ', 'Developer Inc.', 'test1_user', 0, 'avatar.png'),
(2, 'test2', 'test2', 'Testt Userr', 2222222222, 'F', 'test2@gmail.com', '2011-10-09', 'This is test user two. ', 'Developer Inc.', 'test2_user', 0, 'avatar.png'),
(3, 'test3', 'test3', 'Testtt Userrr', 3333333333, 'M', 'test3@gmail.com', '2010-09-08', 'This is test user three. ', 'Developer Inc.', 'test3_user', 0, 'avatar.png'),
(4, 'test4', 'test4', 'Testttt Userrrr', 4444444444, 'F', 'test4@gmail.com', '2009-08-07', 'This is test user four. ', 'Developer Inc.', 'test4_user', 0, 'avatar.png'),
(5, 'bmspr', 'abcd', 'PRANAVA RAMAN B M S', 94435, 'M', 'bmspr1502@gmail.com', '2021-05-22', 'Heyyy', 'HII', 'someting', 0, 'avatar.png'),
(6, 'bms', 'bms', 'Pranav', 9876543210, 'M', 'abcd@gmail.com', '2021-05-05', NULL, NULL, NULL, 0, 'avatar.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportid`),
  ADD KEY `report_fk_from` (`report_from`),
  ADD KEY `report_fk_on` (`reported_on`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skillid`),
  ADD KEY `skill_fk_user` (`userid`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamid`),
  ADD KEY `team_fk_creator` (`creatorid`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD KEY `member_fk_user` (`userid`),
  ADD KEY `member_fk_team` (`teamid`);

--
-- Indexes for table `team_request`
--
ALTER TABLE `team_request`
  ADD PRIMARY KEY (`requestid`),
  ADD KEY `request_fk_user` (`userid`),
  ADD KEY `request_fk_team` (`teamid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1990;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `reportid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skillid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `teamid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_request`
--
ALTER TABLE `team_request`
  MODIFY `requestid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_fk_from` FOREIGN KEY (`report_from`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `report_fk_on` FOREIGN KEY (`reported_on`) REFERENCES `user` (`userid`);

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_fk_creator` FOREIGN KEY (`creatorid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `team_member`
--
ALTER TABLE `team_member`
  ADD CONSTRAINT `member_fk_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`teamid`),
  ADD CONSTRAINT `member_fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `team_request`
--
ALTER TABLE `team_request`
  ADD CONSTRAINT `request_fk_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`teamid`),
  ADD CONSTRAINT `request_fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);
--
-- Database: `bookings`
--
CREATE DATABASE IF NOT EXISTS `bookings` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bookings`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `name_e` varchar(20) NOT NULL,
  `pno` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `food` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`name_e`, `pno`, `email`, `dt`, `food`) VALUES
('Pinky', '8978969', 'absdae@rediffmail.co', '2021-02-20 18:55:00.000000', 'l');
--
-- Database: `cars`
--
CREATE DATABASE IF NOT EXISTS `cars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cars`;

-- --------------------------------------------------------

--
-- Table structure for table `car_details`
--

CREATE TABLE `car_details` (
  `car_id` int(11) NOT NULL,
  `carname` varchar(30) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `numplate` varchar(10) DEFAULT NULL,
  `driver` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `ppd` int(11) DEFAULT NULL,
  `ppkm` int(11) DEFAULT NULL,
  `loc` varchar(20) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_details`
--

INSERT INTO `car_details` (`car_id`, `carname`, `image`, `numplate`, `driver`, `phone`, `ppd`, `ppkm`, `loc`, `size`) VALUES
(1, 'xDA', 'file-20200508-49546-dx6y3a.jpg', 'ASDF', '1234', '123', 12, 12, 'guindy', 'micro');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `email` varchar(50) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`email`, `name`, `age`, `phone`, `pwd`) VALUES
('bmspr1502@gmail.com', 'PRANAVA RAMAN B M S', 12, '9443501317', '1234'),
('hello@gmail.com', 'Test Name', 15, '9432123456', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_details`
--
ALTER TABLE `car_details`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_details`
--
ALTER TABLE `car_details`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `cars1`
--
CREATE DATABASE IF NOT EXISTS `cars1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cars1`;

-- --------------------------------------------------------

--
-- Table structure for table `car_details`
--

CREATE TABLE `car_details` (
  `car_id` int(11) NOT NULL,
  `carname` varchar(30) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `numplate` varchar(10) DEFAULT NULL,
  `driver` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `ppd` int(11) DEFAULT NULL,
  `ppkm` int(11) DEFAULT NULL,
  `loc` varchar(20) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_details`
--

INSERT INTO `car_details` (`car_id`, `carname`, `image`, `numplate`, `driver`, `phone`, `ppd`, `ppkm`, `loc`, `size`) VALUES
(1, 'xDA', 'file-20200508-49546-dx6y3a.jpg', 'ASDF', '1234', '123', 12, 12, 'guindy', 'micro'),
(11, 'Dzire', 'car2.jpg', 'AZXC', 'Ram', '9874563258', 1000, 100, 'guindy', 'micro'),
(12, 'Swift', 'car.png', 'AZSS', 'Raghu', '897456965', 1500, 200, 'ashoknagar', 'suv'),
(13, 'Baleno', 'car2.jpg', 'AQWE', 'Sekhar', '998877445', 1200, 33, 'chepauk', 'micro'),
(14, 'Dzire', 'car3.jpg', 'AWER', 'Mani', '8895966874', 1400, 300, 'tambaram', 'mini'),
(15, 'Grandi10', 'car4.jpg', 'AQQW', 'John', '9874569874', 1500, 300, 'ashoknagar', 'suv'),
(16, 'Some Car', 'C:\\fakepath\\car.png', 'tn34ad3123', 'RADG', '8757657656', 1234, 32, 'tambaram', 'micro');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `email` varchar(50) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`email`, `name`, `age`, `phone`, `pwd`) VALUES
('bmspr1502@gmail.com', 'PRANAVA RAMAN B M S', 12, '9443501317', '1234'),
('hello@gmail.com', 'PRANAVA RAMAN B M S', 15, '9321234123', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_details`
--
ALTER TABLE `car_details`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_details`
--
ALTER TABLE `car_details`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Database: `chatbox`
--
CREATE DATABASE IF NOT EXISTS `chatbox` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `chatbox`;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `username`, `msg`) VALUES
(16, 'pranav', 'hi'),
(17, 'anu', 'hey\n'),
(18, 'pranav', 'hehe😃'),
(19, 'anu', 'niceeee\n'),
(20, 'pranav', 'yeah, this is almost a full copy with just my styling on from a youtube tutorial'),
(21, 'anu', 'wat kinda thing is this....a website\ngreat that the words are also cmng\n'),
(22, 'pranav', 'ok the thing is broken 😂'),
(23, 'pranav', 'or maybe that message size was big'),
(24, 'anu', 'ohhhh...\n'),
(25, 'anu', 'send me the youtube link\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Database: `cmsproj`
--
CREATE DATABASE IF NOT EXISTS `cmsproj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cmsproj`;

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
--
-- Database: `cmsproject`
--
CREATE DATABASE IF NOT EXISTS `cmsproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cmsproject`;

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
  `upload` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`notid`, `target`, `title`, `message`, `logs`, `upload`) VALUES
(1, 'student', 'hello', 'hello students', '2021-05-19 23:22:52', NULL),
(2, 'student', 'photo', 'students see this photo', '2021-05-19 23:46:36', 'bg-img.jpg'),
(5, 'student', 'dbms', 'dbms lab', '2021-05-21 11:28:58', 'dbms_img.png');

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
(14, 'm1', 'file', 'WhatsApp Image 2019-10-10 at 8.35.53 PM.jpeg', 'An image file', 'Try to insert', '2021-05-28 14:07:06');

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
('o1', 'os', 1);

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
(5, 3, 'student', 0, 'hello', '2021-05-28 19:52:45'),
(6, 3, 'student', 2019103516, 'last time', '2021-05-28 19:53:17'),
(7, 4, 'student', 2019103516, 'this is a response', '2021-05-28 20:05:47'),
(8, 4, 'prof', 1, '@2019103516 ok good', '2021-05-28 20:06:24');

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
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prof_details`
--

INSERT INTO `prof_details` (`profno`, `name`, `password`) VALUES
(1, 'uma', 'uma'),
(2, 'ramesh', '0000'),
(1502, 'Pranava Raman', '1502');

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
(13, 2019103516, 'm1');

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
  MODIFY `dataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `course_forum_ans`
--
ALTER TABLE `course_forum_ans`
  MODIFY `ansid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
--
-- Database: `codher`
--
CREATE DATABASE IF NOT EXISTS `codher` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `codher`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
-- Error reading structure for table codher.admin: #1932 - Table 'codher.admin' doesn't exist in engine
-- Error reading data for table codher.admin: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `codher`.`admin`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `club1`
--
-- Error reading structure for table codher.club1: #1932 - Table 'codher.club1' doesn't exist in engine
-- Error reading data for table codher.club1: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `codher`.`club1`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `club2`
--
-- Error reading structure for table codher.club2: #1932 - Table 'codher.club2' doesn't exist in engine
-- Error reading data for table codher.club2: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `codher`.`club2`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `club3`
--
-- Error reading structure for table codher.club3: #1932 - Table 'codher.club3' doesn't exist in engine
-- Error reading data for table codher.club3: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `codher`.`club3`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `club4`
--
-- Error reading structure for table codher.club4: #1932 - Table 'codher.club4' doesn't exist in engine
-- Error reading data for table codher.club4: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `codher`.`club4`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `login`
--
-- Error reading structure for table codher.login: #1932 - Table 'codher.login' doesn't exist in engine
-- Error reading data for table codher.login: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `codher`.`login`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--
-- Error reading structure for table codher.signup: #1932 - Table 'codher.signup' doesn't exist in engine
-- Error reading data for table codher.signup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `codher`.`signup`' at line 1
--
-- Database: `covid19`
--
CREATE DATABASE IF NOT EXISTS `covid19` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `covid19`;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pat_id` int(11) NOT NULL,
  `pat_name` varchar(255) NOT NULL,
  `pat_phone` varchar(255) NOT NULL,
  `pat_address` varchar(255) NOT NULL,
  `test_date` date NOT NULL,
  `rtpcr` int(11) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `scan_result` int(11) NOT NULL,
  `percentage` float NOT NULL,
  `doctor_result` int(11) NOT NULL DEFAULT -1,
  `score` int(11) NOT NULL DEFAULT -1,
  `trained` int(11) NOT NULL DEFAULT 0,
  `remarks` varchar(255) NOT NULL DEFAULT 'Yet to be given'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pat_id`, `pat_name`, `pat_phone`, `pat_address`, `test_date`, `rtpcr`, `img_name`, `scan_result`, `percentage`, `doctor_result`, `score`, `trained`, `remarks`) VALUES
(2, 'Pranav', '9876543210', 'SHRI RAM BHAVANAM, 53/74,\r\nBUNGALOW STREET,', '2021-05-06', 0, '609cd9246a8022.63660823.jpg', 0, 0.0113111, 0, 0, 1, 'No covid'),
(3, 'test', '1234567893', 'hyd', '2021-05-25', 1, '609ce8bdb7cef8.37750748.jpeg', 0, 1.95315, 1, 19, 1, 'covid'),
(7, 'crax', '1234567895', 'sdfgsd', '2021-05-18', 1, '609d6bb6539234.87277596.jpeg', 0, 0.00191937, 0, 19, 1, 'Covid'),
(12, 'asdfas', '1234567999', 'Kalpakam', '2021-05-25', 0, '609f950f3fbf62.07385275.png', 1, 100, 1, 13, 1, 'Yet to be given'),
(13, 'Sree ', '1234567990', 'Chennai', '2021-05-12', 1, '609f95f6d8b571.58969881.png', 1, 100, 1, 12, 1, ''),
(14, 'Vijay', '1234568990', 'Chennai', '2021-05-12', 0, '609f9618ed8cb7.78074450.png', 0, 99.999, 0, 1, 1, 'gET WELl sOon\r\n'),
(15, 'danx', '1234569990', 'Chennai, adyar', '2021-04-15', 1, '609f968cb97557.44704720.png', 1, 100, 1, 20, 1, 'aaa'),
(16, 'Pranav', '1234565990', 'Chennai, adyar', '2021-04-14', 0, '609f975d74ec97.11495280.png', 0, 2.79648e-16, 0, 0, 1, 'Not Covid'),
(17, 'jack', '1234566990', 'Chennai', '2021-04-14', 1, '609f9780761558.74696880.png', 0, 0.00112065, -1, -1, 0, 'Yet to be given'),
(18, 'Preeti', '1233566990', 'Hyderabad', '2021-04-05', 0, '609f988a155388.48883969.png', 0, 0.00626347, -1, -1, 0, 'Yet to be given'),
(19, 'Preeti Krish', '1223566990', 'Hyderabad, Telangana', '2021-02-19', 1, '609f98bf4a47e1.01018507.png', 1, 100, -1, -1, 0, 'Yet to be given'),
(20, 'Krish', '2223566990', 'Telangana', '2021-02-01', 0, '609f98d7f1ffd4.83243196.jpeg', 0, 0.00165134, 0, 0, 1, ''),
(21, 'Krishnaveni', '5223566990', 'Telangana', '2021-02-23', 1, '609f98f5315147.26013791.png', 0, 6.19798, -1, -1, 0, 'Yet to be given'),
(22, 'Raj', '5723566990', 'Telangana', '2021-02-08', 0, '609f991c8bba15.45517231.png', 0, 6.0533e-24, 0, 1, 1, 'Take care'),
(23, 'Raji', '5723766990', 'Telangana', '2021-02-08', 1, '609f992ddfa055.13594124.png', 1, 100, -1, -1, 0, 'Yet to be given'),
(24, 'kohila', '5723768990', 'Telangana', '2021-02-08', 0, '609f9950461f50.99951492.jpeg', 1, 100, -1, -1, 0, 'Yet to be given'),
(25, 'kohila raj', '5723768998', 'Telangana', '2021-02-04', 1, '609f99675f12d5.77204170.png', 1, 100, -1, -1, 0, 'Yet to be given'),
(26, 'Some person', '12341234', 'Some address, Chennai.', '2021-05-12', 1, '609fce67282001.50755187.jpg', 1, 100, 1, 21, 1, 'Take full rest'),
(27, 'Sheldon Cooper', '9876987654', 'Chennai', '2021-05-01', 1, '609fe2a9bc19f1.04285014.png', 1, 100, 1, 18, 1, 'Take Care'),
(28, 'Sheldon Cooper', '1234512345', '14, Kalloori Salai, Chennai.', '2021-05-04', 1, '60a026d8cc5500.21019471.png', 1, 100, 1, 21, 1, 'Take Rest and get admitted.');

-- --------------------------------------------------------

--
-- Table structure for table `prediction`
--

CREATE TABLE `prediction` (
  `pid` int(11) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `result` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prediction`
--

INSERT INTO `prediction` (`pid`, `img_name`, `result`) VALUES
(1, '609cd0b09fe3b4.01415876.jpg', 0),
(2, '609cd1a1bde5e3.47467424.png', 1),
(3, '609cd21a3ebe61.38257797.jpg', 1),
(4, '609cd252138030.96733689.jpg', 1),
(5, '609fcd45acc636.79295168.jpg', 1),
(6, '609fcd5ae8c5d4.63243918.jpg', 0),
(7, '609fd2c801f919.27507186.png', 1),
(8, '609fe040829635.71817461.jpg', 1),
(9, '609fe0487feae1.06105048.jpg', 0),
(10, '609fe264449d88.52460395.jpg', 1),
(11, '609fe2707cd189.03247212.jpg', 0),
(12, '60a0236a16f029.38057410.jpg', 1),
(13, '60a0244adb9bb6.67017129.png', 0),
(14, '60a02699140b90.89629127.jpg', 1),
(15, '60a026a65f2f44.63510583.png', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pat_id`),
  ADD UNIQUE KEY `pat_phone` (`pat_phone`);

--
-- Indexes for table `prediction`
--
ALTER TABLE `prediction`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `prediction`
--
ALTER TABLE `prediction`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Database: `decrypit`
--
CREATE DATABASE IF NOT EXISTS `decrypit` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `decrypit`;

-- --------------------------------------------------------

--
-- Table structure for table `entry_check`
--

CREATE TABLE `entry_check` (
  `kid` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `entry_check`
--

INSERT INTO `entry_check` (`kid`, `pass`) VALUES
('k!1', 'tree'),
('k!2', 'book'),
('k!3', 'map'),
('k!4', 'paper');

-- --------------------------------------------------------

--
-- Table structure for table `round1`
--

CREATE TABLE `round1` (
  `kid` varchar(30) NOT NULL,
  `answer1` text DEFAULT NULL,
  `answer2` text DEFAULT NULL,
  `answer3` text DEFAULT NULL,
  `answer4` text DEFAULT NULL,
  `answer5` text DEFAULT NULL,
  `answer6` text DEFAULT NULL,
  `answer7` text DEFAULT NULL,
  `answer8` text DEFAULT NULL,
  `totscore` int(11) NOT NULL DEFAULT 0,
  `selected` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `round1`
--

INSERT INTO `round1` (`kid`, `answer1`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`, `answer7`, `answer8`, `totscore`, `selected`) VALUES
('k!1', 'helloooo\nworld', NULL, NULL, 'hello', 'vanakkam!\n', NULL, 'select * from round1;', 'asdf\nhello', 0, 0),
('k!3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `kid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp(),
  `endtime` timestamp NOT NULL DEFAULT current_timestamp(),
  `round1` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`kid`, `name`, `email`, `phone`, `start`, `endtime`, `round1`) VALUES
('k!1', 'PRANAVA RAMAN B M S', 'bmspr1502@gmail.com', '09443501317', '2021-03-31 19:47:50', '2021-04-01 01:12:53', 1),
('k!3', 'PRANAVA RAMAN B M S', 'bmspr1502@gmail.com', '09443501317', '2021-04-01 14:58:57', '2021-04-01 09:28:57', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entry_check`
--
ALTER TABLE `entry_check`
  ADD PRIMARY KEY (`kid`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`kid`);
--
-- Database: `exam_app_db`
--
CREATE DATABASE IF NOT EXISTS `exam_app_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exam_app_db`;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_list`
--

CREATE TABLE `faculty_list` (
  `faculty_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty_list`
--

INSERT INTO `faculty_list` (`faculty_id`, `name`, `emailid`, `password`) VALUES
(1, 'Head', 'head@abc.com', 'testing'),
(2, 'Raman', 'test@abc.com', 'tester');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_papers`
--

CREATE TABLE `faculty_papers` (
  `paper_ID` int(11) NOT NULL COMMENT 'A unique ID assigned to the paper',
  `faculty_ID` int(11) NOT NULL COMMENT 'The faculty ID of the faculty creating the paper',
  `paper-due` datetime NOT NULL COMMENT 'time and date of when the paper is to be made available for students',
  `paper_duration` int(11) NOT NULL COMMENT 'duration in minutes',
  `total_marks` int(11) NOT NULL COMMENT 'total marks as set by the faculty',
  `question_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The questions in json format',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-new 1-in progress 2-done'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty_papers`
--

INSERT INTO `faculty_papers` (`paper_ID`, `faculty_ID`, `paper-due`, `paper_duration`, `total_marks`, `question_data`, `status`) VALUES
(6, 1, '2020-07-27 13:01:00', 90, 60, '[[{\\\"questionNumber\\\":\\\"1\\\",\\\"questionText\\\":\\\"sdfgsdhf djkfhg  hkfdhgk sdlgjhfdkg ?\\\",\\\"image\\\":\\\"\\\"},{\\\"questionNumber\\\":\\\"2\\\",\\\"questionText\\\":\\\"dfgdfghfghj fhg fdgjhf fhy fg\\\",\\\"image\\\":\\\"QImages/97d7967477c6591b4d222156d358fe18.png\\\"}],[{\\\"questionNumber\\\":\\\"3\\\",\\\"questionText\\\":\\\"fdhgfdhjgfk  gfhkhj mloi\\\",\\\"image\\\":\\\"\\\"},{\\\"questionNumber\\\":\\\"4\\\",\\\"questionText\\\":\\\"dgfv fdg fghgfj hghgjkhg ?\\\",\\\"image\\\":\\\"QImages/7e904fdab7ef5ada3285a9a797944a2e.png\\\"}],[{\\\"questionNumber\\\":\\\"5\\\",\\\"questionText\\\":\\\"fvhfg jgfhjgh hgjhg lgyhkiy kiuy ?\\\",\\\"image\\\":\\\"\\\"},{\\\"questionNumber\\\":\\\"6\\\",\\\"questionText\\\":\\\"xcgbxd fgfjgh hgjgh kgfhj gf?\\\",\\\"image\\\":\\\"QImages/489d749658636bbab7a31a0f95857ea3.png\\\"}]]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `student_ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`student_ID`, `name`, `email`, `password`) VALUES
(1, 'pman', 'pman@amb.com', 'test'),
(2, 'p2', 'p2@abc.com', 'testest');

-- --------------------------------------------------------

--
-- Table structure for table `student_papers`
--

CREATE TABLE `student_papers` (
  `student_ID` int(11) NOT NULL,
  `paper_ID` int(11) NOT NULL,
  `paper_URL` varchar(255) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `unique_submission_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_papers`
--

INSERT INTO `student_papers` (`student_ID`, `paper_ID`, `paper_URL`, `start_time`, `unique_submission_ID`) VALUES
(1, 6, '<br />\\n<b>Warning</b>:  move_uploaded_file(student_answers/0901f92a8011c888fe8ed59dfca9f92f.pdf): failed to open stream: No such file or directory in <b>C:\\\\xampp\\\\htdocs\\\\misc\\\\submit_answer.php</b> on line <b>17</b><br />\\n<br />\\n<b>Warning</b>:  move', '2020-12-09 20:14:51', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faculty_papers`
--
ALTER TABLE `faculty_papers`
  ADD PRIMARY KEY (`paper_ID`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`student_ID`);

--
-- Indexes for table `student_papers`
--
ALTER TABLE `student_papers`
  ADD PRIMARY KEY (`unique_submission_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faculty_papers`
--
ALTER TABLE `faculty_papers`
  MODIFY `paper_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A unique ID assigned to the paper', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_papers`
--
ALTER TABLE `student_papers`
  MODIFY `unique_submission_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `form`
--
CREATE DATABASE IF NOT EXISTS `form` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `form`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user`, `email`, `password`) VALUES
('admin', 'admin@details.in', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `user` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `college` varchar(30) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`user`, `email`, `password`, `address`, `gender`, `college`, `color`) VALUES
('PRANAVA RAMAN B M S', 'bmspr1502@gmail.com', 'helloworld', 'SHRI RAM BHAVANAM, 53/74,\r\nBUNGALOW STREET,', 'male', 'CEG', '#e9fc03'),
('Sathya Ram', 'drbmsathyaramacharya@gmail.com', 'asdf', 'SHRI RAM BHAVANAM, 53/74,\r\nBUNGALOW STREET,', 'male', 'IIT', '#ff0000'),
('G Hamsa Rani', 'hamsasathyaram@gmail.com', 'hithere', 'SHRI RAM BHAVANAM, 53/74,, BUNGALOW STREET, Salem ', 'male', 'other', '#ee11ee'),
('Warshak Kumar K', 'warshak172000@gmail.com', 'thepass123', '90/1,kurinji nagar, valapady,salem', 'male', 'CEG', '#ff0000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `user` (`user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `user` (`user`);
--
-- Database: `hackathon`
--
CREATE DATABASE IF NOT EXISTS `hackathon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hackathon`;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`) VALUES
(4, 'd3h7ofnt73621.png'),
(5, 'Picture2.png'),
(7, 'file-20200508-49546-dx6y3a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `email`, `password`) VALUES
(1, 'pranav', 'hloo@gmail.com', 'abcd'),
(2, 'pranav', 'hloo1@gmail.com', '12345'),
(3, 'PRANAVA RAMAN B M S', 'bmspr1502@gmail.com', '12345678'),
(4, 'anu', 'anushree@gmail.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `hmb`
--
CREATE DATABASE IF NOT EXISTS `hmb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hmb`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `txnid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `foodid` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`txnid`, `userid`, `foodid`, `name`, `price`, `paid`) VALUES
(1, 1, 3, 'Ghee Roast', 70, 1),
(3, 1, 3, 'Ghee Roast', 70, 1),
(4, 1, 2, 'Masala Dosa', 60, 1),
(6, 1, 4, 'Poori', 50, 1),
(7, 1, 3, 'Ghee Roast', 70, 1),
(8, 1, 2, 'Masala Dosa', 60, 1),
(9, 2, 3, 'Ghee Roast', 70, 1),
(10, 2, 1, 'Idli (2)', 30, 1),
(11, 2, 4, 'Poori', 50, 1),
(12, 1, 2, 'Masala Dosa', 60, 1),
(14, 3, 4, 'Poori', 50, 1),
(15, 3, 4, 'Poori', 50, 1),
(16, 3, 3, 'Ghee Roast', 70, 1),
(17, 3, 4, 'Poori', 50, 1),
(18, 3, 3, 'Ghee Roast', 70, 1),
(19, 3, 1, 'Idli (2)', 30, 1),
(20, 3, 1, 'Idli (2)', 30, 1),
(21, 6, 4, 'Poori', 50, 1),
(22, 2, 9, 'Pongal', 40, 1),
(23, 2, 3, 'Ghee Roast', 70, 1),
(24, 1, 3, 'Ghee Roast', 70, 1),
(25, 1, 8, 'Chappati', 50, 1),
(26, 1, 4, 'Poori', 50, 1),
(27, 1, 8, 'Chappati', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `price`) VALUES
(1, 'Idli (2)', 30),
(2, 'Masala Dosa', 60),
(3, 'Ghee Roast', 70),
(4, 'Poori', 50),
(8, 'Chappati', 50),
(9, 'Pongal', 40);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phoneno` bigint(25) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phoneno`, `password`) VALUES
(1, 'Test', 1234, '1234'),
(2, 'Raman', 9345, '9345'),
(3, 'Preet', 3560, '3560'),
(6, 'Hamsa', 9443501317, '9443501317');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`txnid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phoneno` (`phoneno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `txnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `image_upload`
--
CREATE DATABASE IF NOT EXISTS `image_upload` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `image_upload`;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `image_text`) VALUES
(1, 'leaves.JPG', 'Leaves'),
(2, 'leaves.JPG', 'Leaves'),
(3, 'light.jpg', 'light'),
(4, 'monkey.JPG', 'dadfasdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `milkshake`
--
CREATE DATABASE IF NOT EXISTS `milkshake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `milkshake`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `txnid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `foodid` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` float NOT NULL,
  `beforetax` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`txnid`, `userid`, `foodid`, `name`, `price`, `beforetax`, `paid`) VALUES
(25, 1, 2, 'Strawberry', 63, 60, 1),
(26, 1, 1, 'Vanilla', 31.5, 30, 1),
(27, 1, 2, 'Strawberry', 63, 60, 1),
(28, 7, 4, 'Pineapple', 52.5, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(11) DEFAULT NULL,
  `imgsrc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `price`, `imgsrc`) VALUES
(1, 'Vanilla', 30, 'https://i.ytimg.com/vi/yBMmbXgv7tc/maxresdefault.jpg'),
(2, 'Strawberry', 60, 'https://www.kenwoodworld.com/Global/recipes/Recipe%20Images/drinks/Strawberry_Milkshake_1.jpg'),
(3, 'Chocolate', 70, 'https://lh3.googleusercontent.com/GpTDVDf0Lp7nJGv8iRskihcMt7XOtLpMON-k9RGB8Elke9-R7N-KmaxZwJmqUCYWS5OZquUPhpoh1qV3jumpVQ=w1280-h960-c-rj-v1-e365'),
(4, 'Pineapple', 50, 'https://www.by-brothers.com/wp-content/uploads/2015/05/pinaple-shake.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phoneno` bigint(25) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phoneno`, `password`) VALUES
(1, 'Test', 1234, '1234'),
(2, 'Raman', 9345, '9345'),
(3, 'Preet', 3560, '3560'),
(6, 'Hamsa', 9443501317, '9443501317'),
(7, 'Pranav', 9876, '9876');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`txnid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phoneno` (`phoneno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `txnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `new_schema`
--
CREATE DATABASE IF NOT EXISTS `new_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `new_schema`;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

--
-- Dumping data for table `pma__central_columns`
--

INSERT INTO `pma__central_columns` (`db_name`, `col_name`, `col_type`, `col_length`, `col_collation`, `col_isNull`, `col_extra`, `col_default`) VALUES
('cms_proj', 'rollno', 'bigint', '20', '', 0, ',UNSIGNED', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"angular\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"pin_text\":\"false\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data for table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('cmsproj', 1, 'er diagram');

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"cmsproj\",\"table\":\"prof_details\"},{\"db\":\"cmsproj\",\"table\":\"student_details\"},{\"db\":\"cmsproj\",\"table\":\"student_update\"},{\"db\":\"cmsproj\",\"table\":\"admin_notifications\"},{\"db\":\"cmsproj\",\"table\":\"course_details\"},{\"db\":\"cmsproj\",\"table\":\"course_data\"},{\"db\":\"cmsproj\",\"table\":\"course_forum_qn\"},{\"db\":\"cmsproj\",\"table\":\"course_forum_ans\"},{\"db\":\"cmsproj\",\"table\":\"course_notifications\"},{\"db\":\"cmsproj\",\"table\":\"student_courses\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data for table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('cmsproj', 'admin_login', 1, 329, 244),
('cmsproj', 'admin_notifications', 1, 311, 38),
('cmsproj', 'all_courses', 1, 39, 203),
('cmsproj', 'course_data', 1, 892, 623),
('cmsproj', 'course_details', 1, 556, 396),
('cmsproj', 'course_forum_ans', 1, 1072, 301),
('cmsproj', 'course_forum_qn', 1, 1096, 534),
('cmsproj', 'course_notifications', 1, 509, 593),
('cmsproj', 'prof_details', 1, 208, 452),
('cmsproj', 'student_courses', 1, 572, 74),
('cmsproj', 'student_details', 1, 814, 76),
('cmsproj', 'student_update', 1, 1050, 47),
('cmsproj', 'view_all_courses_student', 1, 16, 31);

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

--
-- Dumping data for table `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('cmsproj', 'admin_login', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:2:{i:0;a:8:{s:5:\"Field\";s:3:\"aid\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:9:\"apassword\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:1:{i:0;a:13:{s:5:\"Table\";s:11:\"admin_login\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:3:\"aid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `admin_login`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `admin_login` (\n  `aid` varchar(20) NOT NULL,\n  `apassword` varchar(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'admin_notifications', 1, '2021-05-29 14:18:28', '2021-05-30 16:43:24', 'a:2:{s:7:\"COLUMNS\";a:6:{i:0;a:8:{s:5:\"Field\";s:5:\"notid\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:14:\"auto_increment\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"target\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:5:\"title\";s:4:\"Type\";s:11:\"varchar(50)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:7:\"message\";s:4:\"Type\";s:12:\"varchar(150)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:4:\"logs\";s:4:\"Type\";s:8:\"datetime\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:6:\"upload\";s:4:\"Type\";s:12:\"varchar(100)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:1:{i:0;a:13:{s:5:\"Table\";s:19:\"admin_notifications\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:5:\"notid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"3\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `admin_notifications`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `admin_notifications` (\n  `notid` int(11) NOT NULL,\n  `target` varchar(10) NOT NULL,\n  `title` varchar(50) NOT NULL,\n  `message` varchar(150) NOT NULL,\n  `logs` datetime NOT NULL,\n  `upload` varchar(100) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n\n# log 2021-05-29 19:02:16 root\nALTER TABLE `admin_notifications` CHANGE `upload` `upload` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;\n# log 2021-05-29 19:11:00 root\nALTER TABLE `admin_notifications` CHANGE `logs` `logs` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;\n# log 2021-05-29 20:35:34 root\nALTER TABLE `admin_notifications` CHANGE `message` `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;', '\n\n# log 2021-05-29 19:01:51 root\nUPDATE `admin_notifications` SET `upload` = \'bg-img.jpg\' WHERE `admin_notifications`.`notid` = 2;\n\n# log 2021-05-29 19:01:58 root\nUPDATE `admin_notifications` SET `upload` = \'dbms_img.png\' WHERE `admin_notifications`.`notid` = 5;\n\n# log 2021-05-29 19:02:34 root\nUPDATE `admin_notifications` SET `upload` = NULL WHERE `admin_notifications`.`notid` = 1;\n\n# log 2021-05-29 20:35:59 root\nUPDATE `admin_notifications` SET `message` = \'Makes sure all the students that are enrolled follow the rules for civilised discussions <br>\\r\\nIf any student is not following, you have powers to <b>Kick Him/Her OUT</b>\' WHERE `admin_notifications`.`notid` = 7;\n\n# log 2021-05-29 20:51:29 root\nDELETE FROM `admin_notifications` WHERE `admin_notifications`.`notid` = 10;\n\n# log 2021-05-29 20:51:57 root\nDELETE FROM `admin_notifications` WHERE `admin_notifications`.`notid` = 8;\n\n# log 2021-05-30 16:43:24 root\nTRUNCATE TABLE `admin_notifications`;\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'all_courses', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:4:{i:0;a:8:{s:5:\"Field\";s:8:\"courseid\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:11:\"course_name\";s:4:\"Type\";s:11:\"varchar(50)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:6:\"profno\";s:4:\"Type\";s:19:\"bigint(20) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:9:\"prof_name\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:0:{}}', '# log 2021-05-29 14:18:28 root\nDROP VIEW IF EXISTS `all_courses`;\n# log 2021-05-29 14:18:28 root\n\nCREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_courses`  AS  select `course_details`.`courseid` AS `courseid`,`course_details`.`name` AS `course_name`,`prof_details`.`profno` AS `profno`,`prof_details`.`name` AS `prof_name` from (`course_details` join `prof_details` on(`course_details`.`profno` = `prof_details`.`profno`)) ;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'course_data', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:7:{i:0;a:8:{s:5:\"Field\";s:6:\"dataid\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:14:\"auto_increment\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:8:\"courseid\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:4:\"type\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:4:\"link\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:5:\"title\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:11:\"description\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:6;a:8:{s:5:\"Field\";s:4:\"time\";s:4:\"Type\";s:9:\"timestamp\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:19:\"current_timestamp()\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:11:\"course_data\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"dataid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"8\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:11:\"course_data\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:7:\"cdatafk\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:8:\"courseid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"4\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `course_data`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `course_data` (\n  `dataid` int(11) NOT NULL,\n  `courseid` varchar(10) NOT NULL,\n  `type` varchar(20) NOT NULL,\n  `link` text NOT NULL,\n  `title` text NOT NULL,\n  `description` text NOT NULL,\n  `time` timestamp NOT NULL DEFAULT current_timestamp()\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'course_details', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:3:{i:0;a:8:{s:5:\"Field\";s:8:\"courseid\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:4:\"name\";s:4:\"Type\";s:11:\"varchar(50)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:6:\"profno\";s:4:\"Type\";s:19:\"bigint(20) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:14:\"course_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:8:\"courseid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"5\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:14:\"course_details\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:6:\"PROFFK\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"profno\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"5\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `course_details`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `course_details` (\n  `courseid` varchar(10) NOT NULL,\n  `name` varchar(50) NOT NULL,\n  `profno` bigint(20) UNSIGNED NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'course_forum_ans', 1, '2021-05-29 14:18:28', '2021-05-29 22:05:26', 'a:2:{s:7:\"COLUMNS\";a:6:{i:0;a:8:{s:5:\"Field\";s:5:\"ansid\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:14:\"auto_increment\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:4:\"qnid\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:8:\"usertype\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:6:\"userid\";s:4:\"Type\";s:10:\"bigint(20)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:6:\"answer\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:4:\"time\";s:4:\"Type\";s:9:\"timestamp\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:19:\"current_timestamp()\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:16:\"course_forum_ans\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:5:\"ansid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"7\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:16:\"course_forum_ans\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:4:\"qnid\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:4:\"qnid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"7\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `course_forum_ans`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `course_forum_ans` (\n  `ansid` int(11) NOT NULL,\n  `qnid` int(11) NOT NULL,\n  `usertype` varchar(30) NOT NULL,\n  `userid` bigint(20) NOT NULL,\n  `answer` text NOT NULL,\n  `time` timestamp NOT NULL DEFAULT current_timestamp()\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n\n# log 2021-05-29 22:05:26 root\nDELETE FROM `course_forum_ans` WHERE `course_forum_ans`.`ansid` = 5;\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'course_forum_qn', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:6:{i:0;a:8:{s:5:\"Field\";s:4:\"qnid\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:14:\"auto_increment\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:8:\"courseid\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:11:\"description\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:8:\"usertype\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:9:\"posted_by\";s:4:\"Type\";s:10:\"bigint(20)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:4:\"time\";s:4:\"Type\";s:9:\"timestamp\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:19:\"current_timestamp()\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:15:\"course_forum_qn\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:4:\"qnid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"5\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:15:\"course_forum_qn\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:8:\"courseid\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:8:\"courseid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"5\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `course_forum_qn`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `course_forum_qn` (\n  `qnid` int(11) NOT NULL,\n  `courseid` varchar(10) NOT NULL,\n  `description` text NOT NULL,\n  `usertype` varchar(30) NOT NULL,\n  `posted_by` bigint(20) NOT NULL,\n  `time` timestamp NOT NULL DEFAULT current_timestamp()\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'course_notifications', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:5:{i:0;a:8:{s:5:\"Field\";s:2:\"id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:14:\"auto_increment\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:8:\"courseid\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:7:\"content\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:4:\"file\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:4:\"time\";s:4:\"Type\";s:9:\"timestamp\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:19:\"current_timestamp()\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:20:\"course_notifications\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:2:\"id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"6\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:20:\"course_notifications\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:8:\"courseid\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:8:\"courseid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"6\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `course_notifications`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `course_notifications` (\n  `id` int(11) NOT NULL,\n  `courseid` varchar(10) NOT NULL,\n  `content` text NOT NULL,\n  `file` text DEFAULT NULL,\n  `time` timestamp NOT NULL DEFAULT current_timestamp()\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'prof_details', 1, '2021-05-29 14:18:28', '2021-05-29 21:56:17', 'a:2:{s:7:\"COLUMNS\";a:5:{i:0;a:8:{s:5:\"Field\";s:6:\"profno\";s:4:\"Type\";s:19:\"bigint(20) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:4:\"name\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:8:\"password\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:5:\"email\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"UNI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:10:\"contact no\";s:4:\"Type\";s:7:\"int(10)\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"UNI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:12:\"prof_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"profno\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"3\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:12:\"prof_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:5:\"email\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:5:\"email\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"3\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:12:\"prof_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:9:\"contactno\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"contact no\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"3\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `prof_details`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `prof_details` (\n  `profno` bigint(20) UNSIGNED NOT NULL,\n  `name` varchar(30) NOT NULL,\n  `password` varchar(20) NOT NULL,\n  `email` varchar(30) DEFAULT NULL,\n  `contact no` int(10) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n\n# log 2021-05-29 21:52:52 root\nALTER TABLE `prof_details` CHANGE `contact no` `contact no` BIGINT(20) NULL DEFAULT NULL;\n# log 2021-05-29 21:56:17 root\nALTER TABLE `prof_details` CHANGE `contact no` `contactno` BIGINT(20) NULL DEFAULT NULL;', '\n\n# log 2021-05-29 21:52:14 root\nUPDATE `prof_details` SET `email` = \'uma@annauniv.edu\' WHERE `prof_details`.`profno` = 1;\n\n# log 2021-05-29 21:52:32 root\nUPDATE `prof_details` SET `contact no` = \'04272281234\' WHERE `prof_details`.`profno` = 1;\n\n# log 2021-05-29 21:52:38 root\nUPDATE `prof_details` SET `contact no` = \'04272281234\' WHERE `prof_details`.`profno` = 1;\n\n# log 2021-05-29 21:52:40 root\nUPDATE `prof_details` SET `contact no` = \'04272281234\' WHERE `prof_details`.`profno` = 1;\n\n# log 2021-05-29 21:52:59 root\nUPDATE `prof_details` SET `contact no` = \'04272281234\' WHERE `prof_details`.`profno` = 1;\n\n# log 2021-05-29 21:53:16 root\nUPDATE `prof_details` SET `email` = \'ramesh@cms.edu\' WHERE `prof_details`.`profno` = 2;\n\n# log 2021-05-29 21:53:30 root\nUPDATE `prof_details` SET `contact no` = \'9823412312\' WHERE `prof_details`.`profno` = 2;\n\n# log 2021-05-29 21:53:37 root\nUPDATE `prof_details` SET `email` = \'bmspr1502@gmail.com\' WHERE `prof_details`.`profno` = 1502;\n\n# log 2021-05-29 21:54:10 root\nUPDATE `prof_details` SET `email` = \'bmspr010502@gmail.com\' WHERE `prof_details`.`profno` = 1502;\n\n# log 2021-05-29 21:54:18 root\nUPDATE `prof_details` SET `contact no` = \'9994863760\' WHERE `prof_details`.`profno` = 1502;\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'student_courses', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:2:{i:0;a:8:{s:5:\"Field\";s:6:\"rollno\";s:4:\"Type\";s:19:\"bigint(20) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:8:\"courseid\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:4:{i:0;a:13:{s:5:\"Table\";s:15:\"student_courses\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"rollno\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"2\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:15:\"student_courses\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"2\";s:11:\"Column_name\";s:8:\"courseid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"4\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:15:\"student_courses\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:6:\"rollno\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"rollno\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"2\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:3;a:13:{s:5:\"Table\";s:15:\"student_courses\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:15:\"coursestudentfk\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:8:\"courseid\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"4\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `student_courses`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `student_courses` (\n  `rollno` bigint(20) UNSIGNED NOT NULL,\n  `courseid` varchar(10) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'student_details', 1, '2021-05-29 14:18:28', '2021-05-30 17:04:23', 'a:2:{s:7:\"COLUMNS\";a:7:{i:0;a:8:{s:5:\"Field\";s:6:\"rollno\";s:4:\"Type\";s:19:\"bigint(20) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:4:\"name\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:8:\"password\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:3:\"DOB\";s:4:\"Type\";s:4:\"date\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:7:\"Address\";s:4:\"Type\";s:12:\"varchar(100)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:5:\"email\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"UNI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:6;a:8:{s:5:\"Field\";s:10:\"contact no\";s:4:\"Type\";s:10:\"bigint(20)\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:3:\"UNI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:15:\"student_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"rollno\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"2\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:15:\"student_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:5:\"email\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:5:\"email\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"2\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:15:\"student_details\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:9:\"contactno\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"contact no\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"2\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:3:\"YES\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `student_details`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `student_details` (\n  `rollno` bigint(20) UNSIGNED NOT NULL,\n  `name` varchar(30) NOT NULL,\n  `password` varchar(20) NOT NULL,\n  `DOB` date DEFAULT NULL,\n  `Address` varchar(100) DEFAULT NULL,\n  `email` varchar(30) DEFAULT NULL,\n  `contact no` bigint(20) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n\n# log 2021-05-29 20:54:21 root\nALTER TABLE `student_details` CHANGE `contact no` `contactno` BIGINT(20) NULL DEFAULT NULL;', '\n\n# log 2021-05-29 16:13:11 root\nINSERT INTO `student_details` (`rollno`, `name`, `password`, `DOB`, `Address`, `email`, `contact no`) VALUES (\'2019103555\', \'Pranav\', \'bmspr\', \'2002-05-01\', \'Bungalow Street, Salem - 01\', \'bmspr1502@gmail.com\', \'9443501317\');\n\n# log 2021-05-30 17:04:15 root\nUPDATE `student_details` SET `Address` = \'Mariamman nagar, Chengalpattu\' WHERE `student_details`.`rollno` = 2019103516;\n\n# log 2021-05-30 17:04:23 root\nUPDATE `student_details` SET `name` = \'Dheepak Raaj\' WHERE `student_details`.`rollno` = 2019103516;\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'student_update', 1, '2021-05-29 14:18:28', '2021-05-30 16:52:36', 'a:2:{s:7:\"COLUMNS\";a:5:{i:0;a:8:{s:5:\"Field\";s:2:\"id\";s:4:\"Type\";s:7:\"int(10)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:14:\"auto_increment\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"rollno\";s:4:\"Type\";s:19:\"bigint(20) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"MUL\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:5:\"title\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:7:\"request\";s:4:\"Type\";s:12:\"varchar(100)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:4:\"logs\";s:4:\"Type\";s:9:\"timestamp\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";s:19:\"current_timestamp()\";s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:2:{i:0;a:13:{s:5:\"Table\";s:14:\"student_update\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:2:\"id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"3\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:14:\"student_update\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:6:\"rollno\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:6:\"rollno\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"3\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-05-29 14:18:28 root\nDROP TABLE IF EXISTS `student_update`;\n# log 2021-05-29 14:18:28 root\n\nCREATE TABLE `student_update` (\n  `id` int(10) NOT NULL,\n  `rollno` bigint(20) UNSIGNED NOT NULL,\n  `title` varchar(20) DEFAULT NULL,\n  `request` varchar(100) NOT NULL,\n  `logs` timestamp NULL DEFAULT current_timestamp()\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n\n# log 2021-05-29 19:50:08 root\nALTER TABLE `student_update`  ADD `status` BOOLEAN NOT NULL DEFAULT FALSE  AFTER `logs`;', '\n\n# log 2021-05-29 15:11:59 root\nUPDATE `student_update` SET `title` = \'hello\' WHERE `student_update`.`id` = 1;\n\n# log 2021-05-29 15:12:02 root\nUPDATE `student_update` SET `request` = \'hi\' WHERE `student_update`.`id` = 1;\n\n# log 2021-05-29 19:46:18 root\nDELETE FROM `student_update` WHERE `student_update`.`id` = 2;\n\n# log 2021-05-29 19:46:21 root\nDELETE FROM `student_update` WHERE `student_update`.`id` = 3;\n\n# log 2021-05-30 16:52:36 root\nDELETE FROM `student_update` WHERE `student_update`.`id` = 1;\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('cmsproj', 'view_all_courses_student', 1, '2021-05-29 14:18:28', '2021-05-29 14:18:28', 'a:2:{s:7:\"COLUMNS\";a:4:{i:0;a:8:{s:5:\"Field\";s:8:\"courseid\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:11:\"course_name\";s:4:\"Type\";s:11:\"varchar(50)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:9:\"prof_name\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:6:\"rollno\";s:4:\"Type\";s:19:\"bigint(20) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:0:{}}', '# log 2021-05-29 14:18:28 root\nDROP VIEW IF EXISTS `view_all_courses_student`;\n# log 2021-05-29 14:18:28 root\n\nCREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_all_courses_student`  AS  select `all_courses`.`courseid` AS `courseid`,`all_courses`.`course_name` AS `course_name`,`all_courses`.`prof_name` AS `prof_name`,`student_courses`.`rollno` AS `rollno` from (`all_courses` left join `student_courses` on(`all_courses`.`courseid` = `student_courses`.`courseid`)) ;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-05-30 17:27:17', '{\"Console\\/Mode\":\"collapse\",\"Console\\/Height\":-62.01050000000001,\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `project1`
--
CREATE DATABASE IF NOT EXISTS `project1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project1`;

-- --------------------------------------------------------

--
-- Table structure for table `flogin`
--

CREATE TABLE `flogin` (
  `emailid` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flogin`
--

INSERT INTO `flogin` (`emailid`, `password`) VALUES
('head@gmail.com', '123'),
('head@gmail.com', '123'),
('head@gmail.com', '123'),
('', '');

-- --------------------------------------------------------

--
-- Table structure for table `fsignin`
--

CREATE TABLE `fsignin` (
  `name` varchar(30) NOT NULL,
  `age` varchar(30) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `experience` varchar(30) NOT NULL,
  `college` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `subjectcode` varchar(30) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `confirmpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fsignin`
--

INSERT INTO `fsignin` (`name`, `age`, `qualification`, `experience`, `college`, `subject`, `subjectcode`, `emailid`, `contact`, `password`, `confirmpassword`) VALUES
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', ''),
('Priyadharshini', '50', 'be', '20', 'ceg', 'eng', '54187', 'dharshini.jayashri@gmail.com', '123444444444444444', '12', '12'),
('', '', '', '', '', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `emailid` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`emailid`, `password`) VALUES
('head@gmail.com', '123'),
('head@gmail.com', '123');
--
-- Database: `sample`
--
CREATE DATABASE IF NOT EXISTS `sample` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sample`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--
-- Error reading structure for table sample.cart: #1932 - Table 'sample.cart' doesn't exist in engine
-- Error reading data for table sample.cart: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `sample`.`cart`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--
-- Error reading structure for table sample.chat: #1932 - Table 'sample.chat' doesn't exist in engine
-- Error reading data for table sample.chat: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `sample`.`chat`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
-- Error reading structure for table sample.customer: #1932 - Table 'sample.customer' doesn't exist in engine
-- Error reading data for table sample.customer: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `sample`.`customer`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--
-- Error reading structure for table sample.organisation: #1932 - Table 'sample.organisation' doesn't exist in engine
-- Error reading data for table sample.organisation: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `sample`.`organisation`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `products`
--
-- Error reading structure for table sample.products: #1932 - Table 'sample.products' doesn't exist in engine
-- Error reading data for table sample.products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `sample`.`products`' at line 1
--
-- Database: `seee`
--
CREATE DATABASE IF NOT EXISTS `seee` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `seee`;

-- --------------------------------------------------------

--
-- Table structure for table `aboutusimages`
--

CREATE TABLE `aboutusimages` (
  `id` int(11) NOT NULL,
  `imageName` text NOT NULL,
  `imageCaption` text DEFAULT NULL,
  `imageType` varchar(20) NOT NULL DEFAULT 'aboutus',
  `imageSize` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aboutusimages`
--

INSERT INTO `aboutusimages` (`id`, `imageName`, `imageCaption`, `imageType`, `imageSize`) VALUES
(19, 'aboutus5fe1e94658d465.42835300.jpg', 'EEE Department', 'aboutus', 1.19),
(20, 'aboutus5fe1e99da4d157.29701303.JPG', 'EEE', 'aboutus', 1.66),
(21, 'aboutus5fe1e9b3a2b486.45339349.jpg', 'EEE', 'aboutus', 0.11),
(22, 'aboutus5fe1e9c52a2277.81816158.JPG', 'EEE', 'aboutus', 1.47),
(23, 'aboutus5fe1e9cfb8e803.74664859.JPG', 'EEE', 'aboutus', 1.54),
(26, 'aboutus5fe1ea02d6f3d0.15482780.JPG', 'EEE', 'aboutus', 1.95),
(27, 'aboutus5fe1ea17e48ab7.83700686.JPG', 'EEE', 'aboutus', 1.26),
(28, 'aboutus5fe1ea2a05e550.57679063.jpg', 'EEE', 'aboutus', 0.08);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `Announcements` text NOT NULL,
  `AboutUs` text NOT NULL,
  `Waves` text NOT NULL,
  `Ripples` text NOT NULL,
  `FreshersDay` text NOT NULL,
  `TeachersDay` text NOT NULL,
  `Inauguration` text NOT NULL,
  `Hobbeee` text NOT NULL,
  `StudyMaterials` text NOT NULL,
  `PlacementGuides` text NOT NULL,
  `Magazines` text NOT NULL,
  `Articles` text NOT NULL,
  `Facts` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`Announcements`, `AboutUs`, `Waves`, `Ripples`, `FreshersDay`, `TeachersDay`, `Inauguration`, `Hobbeee`, `StudyMaterials`, `PlacementGuides`, `Magazines`, `Articles`, `Facts`) VALUES
('<marquee>\n<h4><span class=\"badge badge-primary\">New</span> We are Live now !  <span class=\"badge badge-primary\"></span> </h4>\n</marquee>', '<p>\nThe <b>Society of Electrical and Electronics Engineers</b> is a society formed jointly by the Electrical and Electronic Engineers of <b>College of Engineering, Guindy, Anna University</b>. \nThe Society endeavours for the enhancement of the souls of fraternity, thereby promoting the sense of common brotherhood amongst all student engineers. \nIts initiative HOBBEEE CLUB is a classical example of its ideals of fraternity where the senior students impart the practical knowledge and contemporary skills they had learnt to their fellow novices with colossal interests transcending all sorts of barriers. \n</p>\n<p>\nThe signature annual fixtures of the SEEE comprises of the intra college symposium ‘RIPPLES’ and the inter-college symposium ‘WAVES’. \nEvery year they have been hypnotising a humongous number of students across the country to take part in our symposiums. \nIMPULSE, the official newsletter of SEEE welcomes healthy competition among the department students to showcase their amalgamated skills of technical knowledge and articulates to write articles on the trendy affairs of Electrical and Electronics Engineering. \nThe Society also organizes guest lectures to imbibe values and create awareness about the fashionable and ongoing themes that are manifold. sdfasdfa\n</p>', '<p>Being the signature and pride of the Department of Electrical and Electronics Engineering of CEG, WAVES is conducted each year by the students of the department. It is the inter college symposium which brings together brilliant minds from all over the state and a variety of disciplines during the period of the even semester. A range of about 5 certified workshops are hosted in collaboration with prominent organisations in the fields of electrical, electronics, mechanical and robotics. The Robotic events enhance and provoke the most intuitive to explore further out of the box. The participants are pulled beyond the academic circles by diverse non technical and management events. Apart from these, online events from technical and non technical areas play a significant part in the journey. Following the footsteps of 38 former success stories the venture of WAVES commences yet again.</p>\n', ' <p>Ripples is an intra college symposium conducted exclusively for the students of the College of Engineering Guindy where students from almost every department gather to play a part. The symposium encompasses technical as well as non-technical events, workshops and online events. Guest lectures are also delivered by eminent speakers on contemporary technologies. Ripples brings about the learning of students into a pragmatic experience and thereby promising all the participants with a fun-filled gratifying experience. They are exposed to various interdisciplinary technical and non-technical confronts which help them to enrich their calibre. Ripples also assists the students in attaining a cutting edge in technological advancements and guarantees to invoke the scientific temper in the students and provides a holistic experience on electrical and electronic technology.</p>', '<p>As the name says, it is the day when the department freshers are warmly welcomed and partied by their seniors. This embraces multifarious events which unwrap the knack of the students in singing, music, dancing, mimic etc. The senior students transform the fresher\'s hesitancy into a fruitful communication among them as an upshot of each event. The senior students transform the fresher\'s hesitancy into a fruitful communication among them as an upshot of each event. An enduring bond is bound between the freshers and their fellow seniors.\n</p>', '<p>The department students enjoy fulfilment in honouring their professors by celebrating Teachers\' Day annually. The HOD, professors, faculty members, teaching fellows and other non-teaching staffs are invited to the party. The professors’ bondings with each other are made apparent at the stage by a number of fun events which spellbound the eyes of the students. Each and every professor is content by their student\'s splendour setting for the event. </p>', '<p>The SEEE Inauguration is a tradition upheld by the Department of Electrical and Electronics Engineering to celebrate the new beginnings. It is an occasion to honour the success of the predecessors and to nurture the infinite opportunities that are brought by the future. The ceremony intensifies the ambition and hope of the students when the office bearers assume their respective positions and undertake the responsibilities on an official capacity for the academic year ahead. The astounding guest lectures that follow engulf the students in a bubble of wonder and joy. The day signifies the promise to and by each individual to cherish what holds us together as a society.</p>', '<p>HOBBEEE Club is a colloquium leaded and administered by the senior students of the Department of Electrical and Electronics Engineering to enrich the knowledge of freshers. \nThe prime motto of this club is to imbibe technical knowledge either in the current subjects or in other concomitant technologies. \n</p>\n<p>\nSessions will be handled by professors or senior students covering the subjects or topics chosen after the consultation with the students. \nThe sessions are organized at least once in a fortnight as per the convenience of the fellow students. Students are also trained to use microcontrollers like Arduino, Raspberry Pi, primary sensors and other modules which help them in doing various mini-projects and attend many technical events. Students are also taught many simulation platforms like Matlab, Proteus, PSpice, Scilab and so on which are not a part of their curriculum but are essential to be learnt. \n<br>This makes the students get through their placements easily, being proficient in many technical skills other than academics. Students are also trained to prepare for competitive exams like GATE, IES etc. \nCareer guidance is also provided to the students exposing them to their curriculum opportunities to build their aspirations and support them to make informed decisions about their subject choices and pathways. Apart from this, students also come to know about the experience of their seniors and learn from them the better methodologies to study concepts. \nInformation regarding internships and inplant training is also delivered to students through this platform.</p>\n', '<p>\nThe <b>Department of Electrical and Electronics Engineering</b> takes immense pride in providing almost all the books required for pursuing the Bachelor of Engineering course. \nThe compilation is quite comprehensive and exhaustive having about 130+ books under 30+ subjects of Electrical and Electronics Engineering. \nThe books are arranged subject-wise to simplify the task of the seekers. Each subject has at least two or three books of its flavour for the students to get a diversified knowledge on the subject.\n<br>\nBoth foreign and local author books have been uploaded adhering to the needs of the students. \nBooks from subjects like management, computer fundamentals, communication systems, general aptitude, mathematics, mechanics environmental science and so on are even uploaded. \n<br>\nAll these books are absolutely free and one doesn’t need to pay for accessing these books. And you are ready to go! Keep checking our website periodically as we will keep updating our booklist now and then according to your changing needs. </p>\n<a href=\"https://drive.google.com/file/d/1p2hguzcEY_2eHBa6PbU7AeM9ZnW5nv6T/view\" class=\"buy-btn\" target=\"_blank\">Click Here to View</a>', '<p>\n<b>An extensive list of the placement guides from the year 2011 to 2018 has been furnished in our website to know about the companies visiting CEG and recruiting the students of the Department of Electrical and Electronics Engineering. </b>\n<br>Companies of all disciplines like core, IT, management, banking and analytics are clearly categorised in each of the placement guides. Each placement guide includes the companies visiting the college in an academic year, their selection process, job type, the number of students selected to each company, package and so on.  The alumni also have shared their experiences gained in attending the placements and interviews. They have even listed out the questions which were asked during their personal interviews for your reference. \n<br>The placement stuff will be updated periodically and hence check our website regularly. Be confident and build yourselves to excel in your placements!\n</p>\n<a href=\"https://drive.google.com/file/d/1WaFCwHdvD-IUQTfXewRpzmG-o8mdwHpE/view\" class=\"buy-btn\" target=\"_blank\">Click Here to View</a>\n', 'At the beginning of every academic year, a crew of 5-6 proficient and experienced students join hands to start working on a piece of art, the IMPULSE magazine. They go around searching for the most talented and creative minds, capturing them, motivating them, and training them. These inspired young minds then sit and do all possible research on topics related to Electrical and Electronics Engineering, pen down their ideas and facts to integrate them into an elegant article. \n<br>\nThese articles are then clubbed and processed into a magazine making it so rich and artistic in its look and language. Our Impulse magazine is not just a collection of pages; it is where our artisans, with commitment, effectuate their craftsmanship to carve the most exquisite articles. Endless hard work and desire is what gives an artisan his final masterpiece. It is that final masterpiece which makes the artisan rejoice at his artwork and fortunately, we have never failed to rejoice at our magazine too.', 'At the beginning of every academic year, a crew of 5-6 proficient and experienced students join hands to start working on a piece of art, the IMPULSE magazine. They go around searching for the most talented and creative minds, capturing them, motivating them, and training them. These inspired young minds then sit and do all possible research on topics related to Electrical and Electronics Engineering, pen down their ideas and facts to integrate them into an elegant article. These articles are then clubbed and processed into a magazine making it so rich and artistic in its look and language. Our Impulse magazine is not just a collection of pages; it is where our artisans, with commitment, effectuate their craftsmanship to carve the most exquisite articles. Endless hard work and desire is what gives an artisan his final masterpiece. It is that final masterpiece which makes the artisan rejoice at his artwork and fortunately, we have never failed to rejoice at our magazine too.\n<br>You can read our articles <a href=\"https://impulseseee.wordpress.com/\" target=\"_blank\">Here</a></p>', 'Do you know? One single lightning bolt can light up 100 powerful lamps for an entire day, or make lots and lots of toast, in fact a couple of thousand pieces of toast. We love learning new things about the world of electricity. SEEE Facts presents mind-blowing facts that kindles the spark of electricity.<br>You can read our articles <a href=\"https://www.instagram.com/waves_ceg/\" target=\"_Blank\">here</a>');

-- --------------------------------------------------------

--
-- Table structure for table `hobbeeeimages`
--

CREATE TABLE `hobbeeeimages` (
  `id` int(11) NOT NULL,
  `imageName` text NOT NULL,
  `imageCaption` text DEFAULT NULL,
  `imageType` varchar(20) NOT NULL DEFAULT 'hobbeee',
  `imageSize` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hobbeeeimages`
--

INSERT INTO `hobbeeeimages` (`id`, `imageName`, `imageCaption`, `imageType`, `imageSize`) VALUES
(5, 'hobbeee5fdf0ebd7c9406.80116588.jpg', 'lecture', 'hobbeee', 0.07),
(6, 'hobbeee5fdf0edab34642.11275089.jpg', 'maze', 'hobbeee', 0.06),
(7, 'hobbeee5fdf0eeecd3da6.29017136.jpg', 'students', 'hobbeee', 0.09);

-- --------------------------------------------------------

--
-- Table structure for table `impulsedata`
--

CREATE TABLE `impulsedata` (
  `id` int(11) NOT NULL,
  `imageName` text NOT NULL,
  `imageType` varchar(20) NOT NULL,
  `imageCaption` text DEFAULT NULL,
  `imageLink` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `impulsedata`
--

INSERT INTO `impulsedata` (`id`, `imageName`, `imageType`, `imageCaption`, `imageLink`) VALUES
(2, 'magazines5fdf058ced3d19.21286509.jpg', 'magazines', 'Waves - 20 Article', 'https://issuu.com/impulse.seee/docs/pdfjoiner?fbclid=IwAR0j6I9XKEfRGedM4M3Xt-GPq1JzDj3rVlcdxe92gylxNHKNE8uwu-dfVmw'),
(3, 'magazines5fdf05c3368636.44457066.jpg', 'magazines', 'Ripples-20', 'https://issuu.com/impulse.seee/docs/page_1_front_cmyk-converted?fbclid=IwAR2hAaej5lHuSQyik1Dyxbx_IUksnxBUyBpiIMgt4C3AtMjB9ZPN0ZG_jDg'),
(6, 'articles5fdf06fee96135.72936766.jpg', 'articles', 'Voltaic Enclave', 'https://impulseseee.wordpress.com/2018/01/13/the-voltaic-enclave-of-technish/'),
(8, 'articles5fdf0750a53761.79455250.jpg', 'articles', 'Wireless Control', 'https://impulseseee.wordpress.com/2019/10/04/wireless-control-upto-16-devices-without-any-mcu-or-coding/'),
(10, 'facts5fdf0909b942f9.00028737.jpg', 'facts', '', ''),
(11, 'articles5fdf092a7ad141.25059057.png', 'articles', 'Fourier Series', 'https://impulseseee.wordpress.com/2018/08/24/1250/'),
(12, 'facts5fdf09a79e68e1.47187848.jpg', 'facts', '', ''),
(17, 'facts5fdfaf8ac3f973.67910585.jpg', 'facts', '', ''),
(18, 'magazines5fe2032b9f3db4.72062976.jpg', 'magazines', 'Impulse -2020 Article', 'https://issuu.com/impulse.seee/docs/impulse_2020'),
(19, 'facts5fe20701212ab3.79667216.jpg', 'facts', '', ''),
(20, 'facts5fe20710135e96.30945177.jpg', 'facts', '', ''),
(21, 'facts5fe20719328135.40347845.jpg', 'facts', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `portfolioimages`
--

CREATE TABLE `portfolioimages` (
  `id` int(11) NOT NULL,
  `imageName` text NOT NULL,
  `imageCaption` text NOT NULL,
  `imageSize` double NOT NULL,
  `imageType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `portfolioimages`
--

INSERT INTO `portfolioimages` (`id`, `imageName`, `imageCaption`, `imageSize`, `imageType`) VALUES
(12, '5fdec7da35bee2.50958250.JPG', 'rangoli', 1.42, 'inaug'),
(19, 'inaug5fe1a24b4ccc80.64191299.JPG', '', 1, 'inaug'),
(20, 'inaug5fe1a265dafad0.80497007.JPG', '', 0.81, 'inaug'),
(21, 'inaug5fe1a277dba352.20776210.JPG', '', 0.79, 'inaug'),
(22, 'inaug5fe1a29ad96215.37061228.JPG', '', 0.8, 'inaug'),
(23, 'inaug5fe1a2b1a12c03.35581411.JPG', '', 0.73, 'inaug'),
(24, 'inaug5fe1a2c5c38535.59047621.JPG', '', 0.8, 'inaug'),
(25, 'inaug5fe1a2df62c8b2.42005343.JPG', '', 0.82, 'inaug'),
(26, 'inaug5fe1a363c41814.00548574.JPG', '', 0.91, 'inaug'),
(27, 'waves5fe1a48a572da4.23371545.JPG', 'Waves', 1.49, 'waves'),
(32, 'waves5fe1a53f150433.71057966.JPG', 'Waves', 0.76, 'waves'),
(33, 'waves5fe1a55f700843.31979794.JPG', 'Waves', 1.53, 'waves'),
(34, 'waves5fe1a581510ca6.25665793.JPG', 'Waves', 1.53, 'waves'),
(35, 'waves5fe1a5adc3a2f3.31781017.JPG', 'Waves', 1.24, 'waves'),
(37, 'waves5fe1a60b768dd6.50092295.JPG', 'Waves', 1.94, 'waves'),
(38, 'waves5fe1a6285321a8.65687713.jpg', 'Waves', 0.07, 'waves'),
(39, 'waves5fe1a6457fc414.45983482.jpg', 'Waves', 0.07, 'waves'),
(40, 'waves5fe1a65fcd2683.03216876.jpg', 'Waves', 0.11, 'waves'),
(41, 'waves5fe1a677787719.80570389.jpg', 'Waves', 0.07, 'waves'),
(45, 'waves5fe1a6ebb158b0.71610258.jpg', 'Waves', 0.13, 'waves'),
(47, 'waves5fe1a7530adce2.89495699.jpg', 'Waves', 0.06, 'waves'),
(49, 'waves5fe1a78371ce30.35994979.JPG', 'Waves', 1.14, 'waves'),
(50, 'waves5fe1a79b412912.09486832.JPG', 'Waves', 1.5, 'waves'),
(51, 'waves5fe1a7e5124434.01199613.JPG', 'Waves', 1.31, 'waves'),
(52, 'waves5fe1a80a41e163.93994601.JPG', 'Waves', 1.79, 'waves'),
(53, 'freshers5fe1e5be39b3d1.83178678.JPG', 'Fresher\'s Day', 1.33, 'freshers'),
(54, 'freshers5fe1e5dbe5ee43.28444629.JPG', 'Fresher\'s Day', 1.43, 'freshers'),
(56, 'freshers5fe1e5fb28a1f5.37731397.JPG', 'Fresher\'s Day', 1.71, 'freshers'),
(57, 'freshers5fe1e60c7c33b4.63491935.JPG', 'Fresher\'s Day', 1.67, 'freshers'),
(58, 'freshers5fe1e627d34793.60666429.JPG', 'Fresher\'s Day', 1.22, 'freshers'),
(59, 'freshers5fe1e63b7e8098.76853515.JPG', 'Fresher\'s Day', 1.83, 'freshers'),
(60, 'freshers5fe1e64fab51b6.24776304.JPG', 'Fresher\'s Day', 1.46, 'freshers'),
(62, 'freshers5fe1e67454fa95.13270334.JPG', 'Fresher\'s Day', 1.37, 'freshers'),
(63, 'teachers5fe1e6e9638c64.11113327.JPG', 'Teachers\' Day', 1.07, 'teachers'),
(64, 'teachers5fe1e7003e6c98.64776191.JPG', 'Teachers\' Day', 1.37, 'teachers'),
(65, 'teachers5fe1e70ca64845.03255458.JPG', 'Teachers\' Day', 1.17, 'teachers'),
(66, 'teachers5fe1e71bf38a12.06202287.JPG', 'Teachers\' Day', 1.5, 'teachers'),
(67, 'teachers5fe1e734aef4e7.43343416.JPG', 'Teachers\' Day', 1.18, 'teachers'),
(68, 'teachers5fe1e74477d909.09267633.JPG', 'Teachers\' Day', 1.24, 'teachers'),
(69, 'teachers5fe1e7543325c0.48010275.JPG', 'Teachers\' Day', 1.38, 'teachers'),
(70, 'teachers5fe1e764f0fb34.82490652.JPG', 'Teachers\' Day', 1.33, 'teachers'),
(71, 'teachers5fe1e7753c4731.89136431.JPG', 'Teachers\' Day', 1.44, 'teachers'),
(72, 'teachers5fe1e78745dfb9.41729193.JPG', 'Teachers\' Day', 1.18, 'teachers'),
(73, 'teachers5fe1e796a7e499.98494414.JPG', 'Teachers\' Day', 1.21, 'teachers'),
(74, 'teachers5fe1e7a1bd35f2.78362707.JPG', 'Teachers\' Day', 1.02, 'teachers'),
(75, 'teachers5fe1e7ae9891b3.77435979.JPG', 'Teachers\' Day', 1.36, 'teachers'),
(76, 'ripples5fe1e879d90343.94525183.JPG', 'Ripples', 1.06, 'ripples'),
(77, 'ripples5fe1e88b669495.40148808.JPG', 'Ripples', 1.83, 'ripples'),
(78, 'ripples5fe1e89c8ba589.74887467.JPG', 'Ripples', 1.78, 'ripples'),
(79, 'ripples5fe1e8a8dd1627.31418393.JPG', 'Ripples', 1.26, 'ripples'),
(80, 'ripples5fe1e8ba5824b3.29722069.JPG', 'Ripples', 0.82, 'ripples'),
(83, 'ripples5fe1e8f712e390.94205235.JPG', 'Ripples', 0.96, 'ripples'),
(84, 'ripples5fe1e90c4854c0.13002690.JPG', 'Ripples', 1.2, 'ripples');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutusimages`
--
ALTER TABLE `aboutusimages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `imageName` (`imageName`) USING HASH;

--
-- Indexes for table `hobbeeeimages`
--
ALTER TABLE `hobbeeeimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `impulsedata`
--
ALTER TABLE `impulsedata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolioimages`
--
ALTER TABLE `portfolioimages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aboutusimages`
--
ALTER TABLE `aboutusimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `hobbeeeimages`
--
ALTER TABLE `hobbeeeimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `impulsedata`
--
ALTER TABLE `impulsedata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `portfolioimages`
--
ALTER TABLE `portfolioimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- Database: `services`
--
CREATE DATABASE IF NOT EXISTS `services` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `services`;

-- --------------------------------------------------------

--
-- Table structure for table `aboutus`
--

CREATE TABLE `aboutus` (
  `title` varchar(100) NOT NULL,
  `leftcontent` text NOT NULL,
  `rightcontent` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aboutus`
--

INSERT INTO `aboutus` (`title`, `leftcontent`, `rightcontent`, `image`) VALUES
('About Us', 'Welcome to Pro-ads, one source for advertising all things [product, ie: shoes, bags, dog treats]. We\'re dedicated to giving you the very best of advertisements, with a focus on three characteristics, dependability, customer service and uniqueness.', 'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us.', '5f30cf66148930.30641967.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `product` varchar(50) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `youtube` varchar(50) NOT NULL,
  `website` varchar(100) NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `image`, `product`, `brand`, `description`, `youtube`, `website`, `visibility`) VALUES
(1, 'PRANAVA RAMAN B M S', 'bmspr1502@gmail.com', '9443501317', '5f30cf7f354097.62029831.png', 'Thin and Light Laptop ', 'Lenovo Ideapad S540', '15.6 inches\r\n8GB RAM\r\ni5 8th gen\r\n512 GB NVMe SSD<br>\r\n2GB NVIDIA MX250', 'https://www.youtube.com/watch?v=d4nHHXMlmnI', 'https://www.lenovo.com/in/en/laptops/ideapad/s-series/Lenovo-IdeaPad-S540-14IWL/p/88IPS501190', 1),
(6, 'Mark', 'bla@gmail.com', '9445644788', '5f30cf9314a569.82204292.jpg', 'chair', 'Wow furnitures', 'Enjoy sitting  on this light weight, portable and amazing chair.', 'https://www.youtube.com/watch?v=yX6hXlRP_1c', 'https://www.w3schools.com/php/func_mysqli_connect_errno.asp', 1),
(21, 'G Hamsa Rani S', 'hamsasathyaram@gmail.com', '9442359937', '5f2ab54dbf7c41.26816446.jpg', 'Acer Aspire 5', 'Acer', 'Thin and Light laptop ', 'https://www.youtube.com/watch?v=l3hoa-stJs4', 'https://www.youtube.com', 1),
(24, 'Pranav', 'bsdhfb@lajshbdfga.com', '342341234', '5f2d6bb763c265.40432805.jpg', 'Birthday Greeting Card', 'Cardz', 'Gift and make their day special!', 'https://www.youtube.com/watch?v=l3hoa-stJs4', 'https://cat-bounce.com/', 1),
(27, 'Sreeratcha', 'absdae@gmail.com', '9445644788', '5f2ec7e11f2298.98045713.jpg', 'Glass wares', 'Glassy', 'Decorate your kitchen with our utensils', 'https://www.youtube.com/watch?v=yX6hXlRP_1c', 'https://www.w3schools.com/php/func_mysqli_connect_errno.asp', 1),
(28, 'hemashirisha', 'hemashirisha123@gmail.com', '8825857601', '5f2ecc19c810c3.97474910.jpg', 'Code atrocities', 'Blahhhh stuff', 'Haa haa haa', 'https://youtu.be/l-GsfyVCBu0', 'http://hideous-cave.000webhostapp.com/contact.php', 0),
(29, 'Sree', 'contactab01@gmail.com', '9445644788', '5f2ed2127a2687.64414864.jpg', 'Watch', 'Time-setter', 'Try this super cool watch!!', 'https://www.youtube.com/watch?v=yX6hXlRP_1c', 'https://www.w3schools.com/php/func_mysqli_connect_errno.asp', 0),
(32, 'Pranav', 'bmspr010502@gmail.com', '9994863760', '5f2eda129ed5f5.59376723.jpg', 'Veg Biryani', 'CEG Hostel Mess', 'Right Taste, Smell, Colour lalala\r\nServed with kurma or cauliflower fry', 'https://www.youtube.com/watch?v=hY7m5jjJ9mM', 'http://ceg.annauniv.edu/', 0),
(33, 'hemashirisha', 'nrishitha25@gmail.com', '8825857601', '5f2eda212bdae4.83895367.jpg', 'Blahhh', 'Blahhhh', 'Blahhhh', 'https://youtu.be/l-GsfyVCBu0', 'http://hideous-cave.000webhostapp.com/contact.php', 0),
(34, 'Ajs ', 'sharanajs2001@gmail.com', '9745668902', '5f2ee02982c270.95904121.jpeg', 'Computer table', 'IKEA', 'Convertible computer table', 'https://m.youtube.com', 'https://www.ikea.com', 0),
(36, 'BMSPR', '2019103555@annauniv.edu.in', '9443501317', '5f2ef9a2bbc422.56803725.jpg', 'CEG, AU', 'College of Engineering, Guindy', 'The Oldest Technical Institution outside Europe', 'https://www.youtube.com/watch?v=etFgZxnOkto', 'http://ceg.annauniv.edu/', 1),
(38, 'ashok', 'vp5016866@gmail.com', '9876543210', '5f2fe640655803.36000619.jpg', 'chair', 'po', 'asdfg', 'https://www.hideous-cave@gf.com', 'https://www.hideous-cave@gf.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `title` varchar(100) NOT NULL,
  `heading` varchar(200) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`title`, `heading`, `content`) VALUES
('SERVICES', 'We Advertise and market your products.', 'This is a website where you can advertise!\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `servicepage`
--

CREATE TABLE `servicepage` (
  `logo` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicepage`
--

INSERT INTO `servicepage` (`logo`, `title`, `description`, `id`) VALUES
('5f2d34b0087475.54240732.svg', 'Digital Marketing', 'We market your products. And we provide all the resources too. <br> ', 5),
('5f2d34c37540f9.12917834.svg', 'Socialmedia marketing', 'We advertise your products in social media.', 6),
('5f30cf50580374.37228519.svg', 'Newspaper Marketing', 'We advertise your ads on newspaper.', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `servicepage`
--
ALTER TABLE `servicepage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `servicepage`
--
ALTER TABLE `servicepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Database: `services_new`
--
CREATE DATABASE IF NOT EXISTS `services_new` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `services_new`;

-- --------------------------------------------------------

--
-- Table structure for table `aboutus`
--

CREATE TABLE `aboutus` (
  `title` varchar(100) NOT NULL,
  `leftcontent` text NOT NULL,
  `rightcontent` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aboutus`
--

INSERT INTO `aboutus` (`title`, `leftcontent`, `rightcontent`, `image`) VALUES
('About Us', 'Welcome to Pro-ads, one source for advertising all things [product, ie: shoes, bags, dog treats]. We\'re dedicated to giving you the very best of advertisements, with a focus on three characteristics, dependability, customer service and uniqueness.', 'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us.', '5f30cf66148930.30641967.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `product` varchar(50) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `youtube` varchar(50) NOT NULL,
  `website` varchar(100) NOT NULL,
  `visibility` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `image`, `product`, `brand`, `description`, `youtube`, `website`, `visibility`) VALUES
(1, 'PRANAVA RAMAN B M S', 'bmspr1502@gmail.com', '9443501317', '5f30cf7f354097.62029831.png', 'Thin and Light Laptop ', 'Lenovo Ideapad S540', '15.6 inches\r\n8GB RAM\r\ni5 8th gen\r\n512 GB NVMe SSD<br>\r\n2GB NVIDIA MX250', 'https://www.youtube.com/watch?v=d4nHHXMlmnI', 'https://www.lenovo.com/in/en/laptops/ideapad/s-series/Lenovo-IdeaPad-S540-14IWL/p/88IPS501190', 0),
(6, 'Mark', 'bla@gmail.com', '9445644788', '5f30cf9314a569.82204292.jpg', 'chair', 'Wow furnitures', 'Enjoy sitting  on this light weight, portable and amazing chair.', 'https://www.youtube.com/watch?v=yX6hXlRP_1c', 'https://www.w3schools.com/php/func_mysqli_connect_errno.asp', 0),
(21, 'G Hamsa Rani S', 'hamsasathyaram@gmail.com', '9442359937', '5f2ab54dbf7c41.26816446.jpg', 'Acer Aspire 5', 'Acer', 'Thin and Light laptop ', 'https://www.youtube.com/watch?v=l3hoa-stJs4', 'https://www.youtube.com', 0),
(24, 'Pranav', 'bsdhfb@lajshbdfga.com', '342341234', '5f2d6bb763c265.40432805.jpg', 'Birthday Greeting Card', 'Cardz', 'Gift and make their day special!', 'https://www.youtube.com/watch?v=l3hoa-stJs4', 'https://cat-bounce.com/', 0),
(27, 'Sreeratcha', 'absdae@gmail.com', '9445644788', '5f2ec7e11f2298.98045713.jpg', 'Glass wares', 'Glassy', 'Decorate your kitchen with our utensils', 'https://www.youtube.com/watch?v=yX6hXlRP_1c', 'https://www.w3schools.com/php/func_mysqli_connect_errno.asp', 0),
(28, 'hemashirisha', 'hemashirisha123@gmail.com', '8825857601', '5f2ecc19c810c3.97474910.jpg', 'Code atrocities', 'Blahhhh stuff', 'Haa haa haa', 'https://youtu.be/l-GsfyVCBu0', 'http://hideous-cave.000webhostapp.com/contact.php', 0),
(29, 'Sree', 'contactab01@gmail.com', '9445644788', '5f2ed2127a2687.64414864.jpg', 'Watch', 'Time-setter', 'Try this super cool watch!!', 'https://www.youtube.com/watch?v=yX6hXlRP_1c', 'https://www.w3schools.com/php/func_mysqli_connect_errno.asp', 0),
(32, 'Pranav', 'bmspr010502@gmail.com', '9994863760', '5f2eda129ed5f5.59376723.jpg', 'Veg Biryani', 'CEG Hostel Mess', 'Right Taste, Smell, Colour lalala\r\nServed with kurma or cauliflower fry', 'https://www.youtube.com/watch?v=hY7m5jjJ9mM', 'http://ceg.annauniv.edu/', 0),
(33, 'hemashirisha', 'nrishitha25@gmail.com', '8825857601', '5f2eda212bdae4.83895367.jpg', 'Blahhh', 'Blahhhh', 'Blahhhh', 'https://youtu.be/l-GsfyVCBu0', 'http://hideous-cave.000webhostapp.com/contact.php', 0),
(34, 'Ajs ', 'sharanajs2001@gmail.com', '9745668902', '5f2ee02982c270.95904121.jpeg', 'Computer table', 'IKEA', 'Convertible computer table', 'https://m.youtube.com', 'https://www.ikea.com', 0),
(36, 'BMSPR', '2019103555@annauniv.edu.in', '9443501317', '5f2ef9a2bbc422.56803725.jpg', 'CEG, AU', 'College of Engineering, Guindy', 'The Oldest Technical Institution outside Europe', 'https://www.youtube.com/watch?v=etFgZxnOkto', 'http://ceg.annauniv.edu/', 0),
(38, 'ashok', 'vp5016866@gmail.com', '9876543210', '5f2fe640655803.36000619.jpg', 'chair', 'po', 'asdfg', 'https://www.hideous-cave@gf.com', 'https://www.hideous-cave@gf.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `title` varchar(100) NOT NULL,
  `heading` varchar(200) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`title`, `heading`, `content`) VALUES
('SERVICES', 'We Advertise and market your products.', 'This is a website where you can advertise!\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `servicepage`
--

CREATE TABLE `servicepage` (
  `logo` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicepage`
--

INSERT INTO `servicepage` (`logo`, `title`, `description`, `id`) VALUES
('5f2d34b0087475.54240732.svg', 'Digital Marketing', 'We market your products. And we provide all the resources too. <br> ', 5),
('5f2d34c37540f9.12917834.svg', 'Socialmedia marketing', 'We advertise your products in social media.', 6),
('5f30cf50580374.37228519.svg', 'Newspaper Marketing', 'We advertise your ads on newspaper.', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `servicepage`
--
ALTER TABLE `servicepage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `servicepage`
--
ALTER TABLE `servicepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `itemid` varchar(10) NOT NULL,
  `qty` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `user` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`itemid`, `qty`, `price`, `user`) VALUES
('a1', 1.5, 180, 'PRANAVA RAMAN B M S'),
('g1', 3, 240, 'Warshak'),
('jm1', 1.5, 150, 'Warshak'),
('mi5', 3, 150, 'PRANAVA RAMAN B M S'),
('a1', 2, 240, 'Vijay P K'),
('m1', 4.3, 387, 'Vijay P K'),
('g1', 1.5, 120, 'Hamsa Rani'),
('m1', 4, 360, 'Hamsa Rani'),
('cb1', 2, 100, 'PRANAVA RAMAN B M S'),
('jm1', 2, 200, 'PRANAVA RAMAN B M S'),
('mi5', 2, 100, 'PRANAVA RAMAN B M S'),
('jm1', 2, 200, 'PRANAVA RAMAN B M S'),
('mi5', 1, 50, 'PRANAVA RAMAN B M S'),
('g1', 2.5, 200, 'PRANAVA RAMAN B M S'),
('ss1', 20, 400, 'PRANAVA RAMAN B M S'),
('cb1', 1, 50, 'Hamsa Rani'),
('m1', 2, 180, 'Hamsa Rani'),
('ss1', 10, 200, 'Hamsa Rani'),
('jm1', 2, 200, 'Hamsa Rani'),
('m1', 5, 450, 'Hamsa Rani'),
('a1', 4, 480, 'Hamsa Rani'),
('jm1', 1, 100, 'Hamsa Rani');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `itemid` varchar(10) NOT NULL,
  `qty` float NOT NULL,
  `user` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `phone` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `shopping` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`phone`, `name`, `password`, `shopping`) VALUES
(1111, 'Admin', 'administrator', 0),
(9361192760, 'Warshak', 'testpass', 0),
(9442359937, 'Hamsa Rani', 'helloworld', 0),
(9443501317, 'PRANAVA RAMAN B M S', 'hello', 0),
(9597757552, 'Vijay P K', 'abcde', 0);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemid` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` int(6) DEFAULT NULL,
  `stock` float DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemid`, `name`, `price`, `stock`, `type`) VALUES
('a1', 'Apple', 120, 70, 'Fruits'),
('cb1', 'Cabbage', 50, 27, 'Fruits'),
('g1', 'Guava Juice', 80, 20, 'Fresh Juice'),
('jm1', 'Mango Juice', 100, 30, 'Fresh Juice'),
('m1', 'Banganapalli Mango', 90, 50, 'Fruits'),
('mi5', 'Reynolds Trimax', 50, 1, 'Miscellaneous'),
('ss1', 'Set Square', 20, 70, 'Miscellaneous');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`phone`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemid`),
  ADD UNIQUE KEY `name` (`name`);
--
-- Database: `temp_cmx`
--
CREATE DATABASE IF NOT EXISTS `temp_cmx` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `temp_cmx`;

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
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tuteehut`
--
CREATE DATABASE IF NOT EXISTS `tuteehut` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tuteehut`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('adtuteeminhut', 'eetuthut@123');

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

CREATE TABLE `connection` (
  `id` int(11) NOT NULL,
  `heading` varchar(200) NOT NULL,
  `image1` varchar(200) NOT NULL,
  `image2` varchar(200) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `quizid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `connection`
--

INSERT INTO `connection` (`id`, `heading`, `image1`, `image2`, `answer`, `visibility`, `quizid`) VALUES
(2, 'Try2', 'mypic.jpeg', 'me.jpeg', 'me mine', 1, 3),
(3, 'try3', 'me.jpeg', 'mine.jpeg', 'kjk', 1, 3),
(4, 'try444444', 'me.jpeg', 'd.jpeg', 'hi hello000000001111111111111', 1, 3),
(5, 'New try', 'temple.jpg', 'temple2.jpg', 't', 1, 3),
(6, 'Try6', 'tree-736885_1280.jpg', 'home.jpg', 'tytrh', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `sno` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `definition` longtext NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`sno`, `name`, `definition`, `image`) VALUES
(1, 'IT', 'Information technology involving the development, maintenance, and use of computer systems, software, and networks for the processing and distribution of data.', '../home/uploads/6.png'),
(2, 'ECE', '                  \"In the world full of fluctuation ,be a Regulator\" \r\n\r\nElectronics and Communications Engineering (ECE) involves researching, designing, developing and testing of electronic equipment used in various systems.\r\nThis stream of engineering deals with analogue transmission, basic electronics, microprocessors, solid-state devices, digital and analogue communication, analogue integrated circuits, microwave engineering, satellite communication, antennae and wave progression.\r\n \r\n                                     ', '../home/uploads/F.png'),
(3, 'CSE', '               \r\n\r\nComputer Science Engineering (CSE) encompasses a variety of topics that relates to computation, like analysis of algorithms, programming languages, program design, software, and computer hardware.Computer Science engineering has roots in electrical engineering, mathematics, and linguistics.', '../home/uploads/H.png'),
(4, 'TEXTILE TECHNOLOGY', '                 \"Invisible threads are the strongest ties\"\r\n\r\nTextile Engineering is in growing demand due to diverse cultures and traditions around the world and it is one of the most popular disciplines in engineering/technology. \"Textile Engineering\" is a big research field of technology that deals with all activities of producing textile fabric & yarns which are involved in the process of textile manufacturing. It includes process engineering that spins around the garment, color, and fabric line of industries..                                ', '../home/uploads/B.png'),
(8, 'EEE', '                 \"No resistance can stop your potential\"\r\n\r\nElectrical and electronics engineering is one of the engineering disciplines which utilizes nonlinear and active electrical components (such as semiconductor devices, especially transistors and diodes) to design electronic circuits, devices, integrated circuits and their systems. The discipline typically also designs passive electrical components, usually based on printed circuit boards.      ', '../home/uploads/E.png'),
(9, 'MECHANICAL ENGINEERING', '        \"Design is not how it looks like and feels like, \r\n                                                               Design is how it works”\r\n\r\nOne of the most diverse and versatile engineering fields, mechanical engineering is the study of objects and systems in motion. As such, the field of mechanical engineering touches virtually every aspect of modern life, including the human body, a highly complex machine.      ', '../home/uploads/D.png'),
(11, 'General', 'This area is common to all engineering streams and mainly focuses on building up your foundation of core engineering concepts, mathematics, logical thinking and more. \r\n\r\nThose who are preparing for interviews must also try out these events, to understand the level of difficulty in questions you might face and prepare yourself beforehand!    ', '../home/uploads/engineering.png'),
(14, 'PETROLEUM ENGINEEERING', '                 \"Be Curious ,to ignite like petrol\"\r\n\r\nEnergy plays a key role in our everyday lives - from our smartphones to our cars to our houses it raises our standard of living. Through teamwork and an innovator\'s mindset, petroleum engineers fuel the world. Using mathematics, physics, and geology, petroleum engineers are able to address and solve important issues that will lead to energy security and thus are in high demand.', '../home/uploads/A.png'),
(15, 'CERAMIC TECHNOLOGY', '                 \"I am content to be a bric-a-bracker and a Ceramiker\"      \r\n\r\nCeramic engineering is the science and technology of creating objects from inorganic, non-metallic materials. This is done either by the action of heat, or at lower temperatures using precipitation reactions from high-purity chemical solutions. The term includes the purification of raw materials, the study and production of the chemical compounds concerned, their formation into components and the study of their structure, composition and properties.Ceramic materials may have a crystalline or partly crystalline structure, with long-range order on atomic scale.', '../home/uploads/N.png'),
(16, 'CHEMICAL ENGINEERING', '\r\n\r\nChemical engineering is the branch of engineering that deals with chemical production and the manufacture of products through chemical processes. This includes designing equipment, systems and processes for refining raw materials and for mixing, compounding and processing chemicals to make valuable products.', '../home/uploads/C.png'),
(17, 'PHARMACEUTICAL TECHNOLOGY', '               Bachelor of Technology in Pharmaceutical Technology is an undergraduate Engineering course. Pharmacy is the study of the origin, preparation, properties, effects, dosage and dispensation of medicines. Pharmaceutical engineers are concerned with the transformation of raw materials into valuable products by chemical, biochemical or physical processes. They are involved in the conception, design, construction, and operation of industrial plants in which the above processes take place, increasingly with design at the molecular scale being more and more significant. The duration of the course is four years and it is career orienting in nature.', '../home/uploads/L.png'),
(18, 'BIOMEDICAL ENGINEERING', '                             Biomedical engineering (BME) or medical engineering is the application of engineering principles and design concepts to medicine and biology for healthcare purposes (e.g., diagnostic or therapeutic).This field seeks to close the gap between engineering and medicine, combining the design and problem solving skills of engineering with medical biological sciences to advance health care treatment, including diagnosis, monitoring, and therapy.', '../home/uploads/J.png'),
(19, 'FOOD TECHNOLOGY', '                               Food Technology is a science branch that deals with the techniques involved in production, processing, preservation, packaging, labeling, quality management, and distribution of food products. The field also involves techniques and processes that are used to transform raw materials into food. Extensive research goes behind making food items edible as well as nutritious.', '../home/uploads/M.png'),
(20, 'BIOTECHNOLOGY', '                               Biotechnology is a study which involves the use of living organisms. The living organisms are used to make useful chemicals which can be utilized in industries. Biotechnological products are used in areas like agriculture, food sciences and medicine.', '../home/uploads/hhdjhdj.png'),
(21, 'CIVIL ENGINEERING', '                 \"In engineering, the joints are the most crucial. They have to be both firm and flexible, exactly like the joints in our body\"\r\n\r\nCivil engineering is a professional engineering discipline that deals with the design, construction, and maintenance of the physical and naturally built environment, including public works such as roads, bridges, canals, dams, airports, sewerage systems, pipelines, structural components of buildings, and railways.', '../home/uploads/I.png');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `name`, `job`, `description`, `image`) VALUES
(19, 'KARTHIKEYAN V', 'FOUNDER                         ', 'A Young and passinate entrepreneur serving the society for the better education. \r\n', 'gg.png'),
(20, 'AJAIKUMAR D', 'CO-FOUNDER', 'A Young and passinate entrepreneur serving the society for the better education.', 'gg.png'),
(21, 'VIKRAMAN G', 'MANAGING DIRECTOR', 'A Young and passinate entrepreneur serving the society for the better education.', 'gg.png'),
(22, 'DHARMA PRAKASH D', 'CHEIF PRODUCT EXECUTIVE', 'A Young and passinate entrepreneur serving the society for the better education.', 'gg.png'),
(23, 'VIJAY M', 'DESIGN EXECUTIVE', 'A Young and passinate entrepreneur serving the society for the better education.', 'gg.png'),
(24, 'KANNAN A', 'BUSSINESS EXECUTIVE', 'A Young and passinate entrepreneur serving the society for the better education.', 'gg.png'),
(26, 'ARAVIND P', 'HEAD OF MECHANICAL ENGINEERING', '', 'gg.png'),
(27, 'BHAVANI V', 'HEAD OF FOOD TECHNOLOGY', '', 'JJJJ.png'),
(28, 'KEERTHIVARMAN S', 'HEAD OF FOOD TECHNOLOGY', '', 'gg.png'),
(29, 'SRINIVASAN', 'HEAD OF PETROLEUM ENGINEERING AND TECHNOLOGY', '', 'gg.png'),
(33, 'LIJIN L L', 'HEAD OF CERAMIC TECHNOLOGY', '', 'gg.png'),
(34, 'JAYASHREE NAIR S P', 'HEAD OF CERAMC TECHNOLOGY', '', 'JJJJ.png'),
(35, 'BHUVANESHWARAN  M', 'HEAD OF ELECTRICAL AND ELECTRONICS ENGINEERING', '', 'gg.png'),
(36, 'PREMNATH M', 'HEAD OF INDUSTRIAL           BIOTECHNOLOGY', '', 'gg.png'),
(37, 'SWETHAA NG', 'HEAD OF INDUSTRIAL BIOTECHNOLOGY', '', 'JJJJ.png'),
(38, 'GOMATHI ', 'HEAD OF CHEMICAL ENGINEERING', '', 'JJJJ.png'),
(39, 'DHANUSH S R', 'HEAD OF CHEMICAL ENGINEERING', '', 'gg.png'),
(40, 'PON G K GOKUL', 'HEAD OF TEXTILE TECHNOLOGY', '', 'gg.png'),
(41, 'ANJALI T', 'HEAD OF TEXTILE TECHNOLOGY', '', 'JJJJ.png'),
(42, 'SRIRAM B', 'HEAD OF PHARMACEUTICAL TECHNOLOGY', '', 'gg.png'),
(43, 'POOJA M', 'HEAD OF PHARMACEUTICAL TECHNOLOGY', '', 'JJJJ.png'),
(44, 'SURENDAR V', 'HEAD OF ELECTRONICS \r\nAND COMMUNICATION\r\nENGINEERING', '', 'gg.png'),
(45, 'SUSHRUT VINAYAK K', 'HEAD OF INFORMATION \r\nTECHNOLOGY', '', 'gg.png'),
(46, 'SRINEDHI T S', 'HEADOF INFORMATION \r\nTECHNOLOGY', '', 'JJJJ.png'),
(47, 'MUNI S', 'HEAD OF COMPUTER SCIENCE ENGINEERING', '', 'gg.png'),
(48, 'DHIVEYA DHARSINI S', 'HEAD OF CIVIL ENGINEERING', '', 'JJJJ.png'),
(49, 'CHANDRA PRAKASH', 'HEAD OF BIOMEDICAL ENGINEERING', '', 'gg.png');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `sno` int(5) NOT NULL,
  `department` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `link` text NOT NULL,
  `definition` longtext NOT NULL,
  `image` text NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`sno`, `department`, `name`, `link`, `definition`, `image`, `visibility`, `type`) VALUES
(13, 11, 'APTITUDE TEST', '', '      bbbb', '../home/uploads/89194ecb6f5ef4ebd2650426e9e16eea.jpg', 1, 0),
(14, 11, 'MATHEMATICS TEST', '', '      tdcfgvhbjkml,;.', '../home/uploads/reveal3.jpg', 1, 0),
(15, 1, 'TECHNICAL QUIZ', '', 'This event Q1 will be conducted soon. this event offers an insight to this particular topic.\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in      ', '../home/uploads/ITS QUIZ TIME (1).png', 1, 0),
(17, 1, 'TECHNICAL QUIZ', '', 'This event Q3 will be conducted soon. this event offers an insight to this particular topic.\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 11),
(18, 1, 'CONNECTION', '', 'This event Q1 will be conducted soon. this event offers an insight to this particular topic.\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 11),
(19, 2, 'TECHNICAL QUIZ', '', 'This event Q5 will be conducted soon. this event offers an insight to this particular topic.\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 0),
(20, 2, 'TECHNICAL QUIZ', '', 'This event Q6 will be conducted soon. this event offers an insight to this particular topic.\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 11),
(21, 2, 'MOCK TEST', '', 'This event Q1 will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 50),
(22, 2, 'CONNECTIONS', '', 'This event Q8 will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 11),
(23, 2, 'TREASURE HUNT', '', 'This event Q9 will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 11),
(24, 2, 'STORY TELLING', '', 'This event Q1 will be conducted soon. this event offers an insight to this particular topic.\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 11),
(25, 3, 'TECHNICAL QUIZ', '', 'This event Q11 will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 0),
(26, 3, 'TECHNICAL QUIZ', '', 'This event Q12 will be conducted soon. this event offers an insight to this particular topic.\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz\r\n\r\nDISCLAIMER: You can only play the quiz after paying 15 rupees and be logged in   ', '../home/uploads/quiz.jpg', 1, 11),
(32, 3, 'CONNECTIONS', '', '      This event Q11 will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz.\r\n\r\n   ', '../home/uploads/H.png', 1, 11),
(33, 4, 'TECHNICAL QUIZ', '', '            This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz.\r\n\r\n   ', '../home/uploads/B.png', 1, 0),
(34, 4, 'TECHNICAL QUIZ', '', '                  This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz.\r\n\r\n   ', '../home/uploads/B.png', 1, 11),
(35, 4, 'CONNECTIONS', '', '                  This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz.\r\n\r\n   ', '../home/uploads/B.png', 1, 11),
(36, 4, 'TREASURE HUNT', '', '                  This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the quiz page when the quiz is ready, be present when the quiz is open enter your name and you should be logged in to access the quiz.\r\n\r\n   ', '../home/uploads/B.png', 1, 11),
(37, 4, 'STORY TELLING', '', '                  This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/B.png', 1, 11),
(38, 8, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/E.png', 1, 0),
(39, 8, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/E.png', 1, 11),
(40, 8, 'MOCK TEST', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/E.png', 1, 50),
(41, 8, 'CONNETIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/E.png', 1, 11),
(42, 8, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/E.png', 1, 11),
(43, 8, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/E.png', 1, 11),
(44, 9, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/D.png', 1, 0),
(45, 9, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/D.png', 1, 11),
(46, 9, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/D.png', 1, 11),
(47, 9, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/D.png', 1, 11),
(48, 9, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/D.png', 1, 11),
(49, 14, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/A.png', 1, 0),
(50, 14, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/A.png', 1, 11),
(51, 14, 'MOCK TEST', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/A.png', 1, 50),
(52, 15, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/N.png', 1, 0),
(53, 15, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/N.png', 1, 11),
(54, 15, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/N.png', 1, 11),
(55, 15, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/N.png', 1, 11),
(56, 15, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/N.png', 1, 11),
(57, 14, 'CONNECTONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/A.png', 1, 11),
(58, 14, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/A.png', 1, 11),
(59, 14, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/A.png', 1, 11),
(60, 16, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/C.png', 1, 0),
(61, 16, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/C.png', 1, 11),
(62, 16, 'MOCK  TEST', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/C.png', 1, 50),
(63, 16, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/C.png', 1, 11),
(64, 16, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/C.png', 1, 11),
(65, 16, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/C.png', 1, 11),
(66, 17, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/L.png', 1, 0),
(67, 17, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/L.png', 1, 11),
(68, 17, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/L.png', 1, 11),
(69, 17, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/L.png', 1, 11),
(70, 17, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/L.png', 1, 11),
(71, 18, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/J.png', 1, 0),
(72, 18, 'TECHNICAL  QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/J.png', 1, 11),
(73, 18, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/J.png', 1, 11),
(74, 18, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/J.png', 1, 11),
(75, 18, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/J.png', 1, 11),
(76, 19, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/M.png', 1, 0),
(77, 19, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/M.png', 1, 11),
(78, 19, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/M.png', 1, 11),
(79, 19, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/M.png', 1, 11),
(80, 19, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/M.png', 1, 11),
(81, 20, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/hhdjhdj.png', 1, 0),
(82, 20, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/hhdjhdj.png', 1, 11),
(83, 20, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/hhdjhdj.png', 1, 11),
(84, 20, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/hhdjhdj.png', 1, 11),
(85, 20, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/hhdjhdj.png', 1, 11),
(86, 21, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/I.png', 1, 0),
(87, 21, 'TECHNICAL QUIZ', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/I.png', 1, 11),
(88, 21, 'MOCK TEST', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/I.png', 1, 50),
(89, 21, 'CONNECTIONS', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/I.png', 1, 11),
(90, 21, 'TREASURE HUNT', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/I.png', 1, 11),
(91, 21, 'STORY TELLING', '', '                        This event will be conducted soon. this event offers an insight to this particular topic.\r\n\r\nTo enter all you have to do is click this register button, and then you will be redirected to the event page when the event is ready, be present when the event is open enter your name and you should be logged in to access the event\r\n\r\n   ', '../home/uploads/I.png', 1, 11),
(92, 3, 'test', '', '      testing', '../home/uploads/newlogo1.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `sno` int(11) NOT NULL,
  `feedback` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`sno`, `feedback`) VALUES
(1, 'Leave your comments here!'),
(2, 'Leave your comments here!'),
(3, 'heyyy awesome content best developers'),
(4, 'HELLO HIII'),
(5, 'You guys are making miracles'),
(6, ''),
(7, 'Leave your comments here!'),
(8, 'All the best '),
(9, ''),
(10, 'Vzjnsnshsjdj'),
(11, 'Happy to be a part this journey!'),
(12, '<script>alert(1)</script>');

-- --------------------------------------------------------

--
-- Table structure for table `fillups`
--

CREATE TABLE `fillups` (
  `id` int(11) NOT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `quizid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fillups`
--

INSERT INTO `fillups` (`id`, `question`, `answer`, `visibility`, `quizid`) VALUES
(1, '............................character is used to indicate an end tag.', '/', 1, 1),
(2, '.............................is the correct HTML for making a checkbox.', 'input type = ', 1, 1),
(3, '.......................blahhhhhhhhh.', 'test', 1, 1),
(14, '----------------blahhhhhhhhhhhhhhhhhhhhhh', 'whatt', 1, 12),
(15, '------------------------hiiiiiiiiiiii', 'hello', 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE `home` (
  `headings` text NOT NULL,
  `paragraphs` longtext NOT NULL,
  `visibility` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`headings`, `paragraphs`, `visibility`) VALUES
('initial_subheading', '              ', 1),
('initial_heading', 'WELCOME TO TuteeHUT \r\n\r\n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 1),
('initial_definition', '', 1),
('address', '                                                                                                                                                                                                                                                                                                                                                                                                                                                           212, NEW BLOCK,GUINDY,CHENNAI-600025                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 1),
('phone_number1', '                                                                                                                                                                                                                                                                                                                                                                                                                                              +91 7428099283                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1),
('phone_number2', '                                                                                                                                                                                                                                                                                                                                                                                                                                               +91 7397113393                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 1),
('contact_about', 'We the team as graduates of Anna University is constantly working to create the revolution in the learning process of engineering. For that, this is our big step and already it is elucidated in the home page.', 1),
('contact_heading', ' ABOUT US', 1),
('about_subtext', '', 1),
('about_definition', 'HELLO STUDENTS !!!!   WELCOME TO TuteeHUT....\r\n\r\n<b>WHAT IS ENGINEERING AND WHY IT IS IMPORTANT?</b>\r\n                        ENGINEERING IS CREATING INNOVATIONS AND CREATE SOLUTIONS TO THE REAL TIME PROBLEMS.JUST LOOK AROUND YOU STUDENTS, ALL ARE MADE BY THE ENGINEERS AND YOU ARE THE KEY.YOU RUN THE WORLD.YOU ARE THE FUEL TO THIS WORLD AND PEOPLES.SO,HERE WE\'LL LEAVE THE IMPORTANCE OF ENGINEERING TO YOUR KNOWLEDGE.\r\n\r\n<b>OUR BIG MOTO:-</b>\r\n                        WE KNOW YOU ARE TIRED AND HATE ENGINEERING BECAUSE OF  LEARNING IT IN A BORED WAYS. SO WE ARE GOING TO INTRODUCE A NEW LEARNING PROCESS AND WE DIVIDED IT INTO VARIOUS STAGES.THE FIRST STAGE IS CORE STRENGTHENING.THE OTHER STAGES ARE REVEALED SOON BY US.\r\n\r\n<b>CORE STRENGTHENING STAGE:-</b>\r\n                        THIS STAGE INVOLVES TECHNICAL QUIZ,APTITUDE,ENG.MATHS QUIZ,CASE STUDY,CONNECTION AND TREASURE HUNT ETC...\r\n                       THIS STAGE HELPS IN \"STRENGTHENING THE CORE BASICS \" OF YOUR DOMAIN,CALCULATION SPEED AND TIME MANAGEMENT ETC...\r\n\r\n<b>IMPORTANCE OF GENERAL APTITUDE AND MATHEMATICS IN ENGINEERING:-</b>\r\n                        LEARNING APTITUDE AND MATHS IS USED TO DEVOLOP YOUR LOGICAL AND ANALYTICAL THINKING.YOUR PREDICTION AND OBSERVATION POWER.\r\nYOUR MEMORY, CONCENTRATION AND CALCULATION.YOUR DECISION MAKING POWER.YOU CAN TAKE BETTER AND LOGICAL DECISIONS ON TIME.IT CAN DEVOLOP YOUR COMMON SENSE AND PRESENCE OF MIND.SO, IT IS VERY MUCH ESSENTIAL for US TO THINK IN COMPLEX SITUATIONS.\r\n\r\n<b>EXPOSURE STAGE:-</b>\r\n                        REVEALLED IN UPCOMING MAY.\r\n \r\n                  STUDENTS WHO FOLLOWS US IN EARLY STAGES WILL BE GET BENEFITTED IN THE UPCOMING STAGES.\r\n\r\n<b>HOW TO REGISTER EVENTS:-</b>\r\n   \r\n                  CLICK DEPARTMENT -> SELECT YOUR DEPARTMENT -> EVENTS -> SELECT EVENT -> REGISTER.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 1),
('quiz1_type', '', 1),
('quiz1_heading', 'TECHNICAL QUIZ (COMING SOON)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', 1),
('quiz1_description', 'BASED ON YOUR DOMAIN\r\n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', 1),
('quiz2_type', '', 1),
('quiz2_heading', 'GATE MOCK TEST (COMING SOON)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', 1),
('quiz2_description', 'CIVIL,CHEMICAL,ECE,EEE,PETROLEUM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 1),
('quiz3_type', '', 1),
('quiz3_heading', 'MATHS AND APTITUDE (COMING SOON)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 1),
('quiz3_description', 'FOR ALL BRANCHES                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 1),
('stages_intro', '', 1),
('quality_description', '', 1),
('instructor_description', '', 1),
('quiz_praise', '', 1),
('get_certified', '', 1),
('result1_date', '', 1),
('result1_heading', '', 1),
('result1_description', '', 1),
('result2_date', '', 1),
('result2_heading', '', 1),
('result2_description', '', 1),
('result3_date', '', 1),
('result3_heading', '', 1),
('result3_description', '', 1),
('quiz1', '', 1),
('quiz2', '', 1),
('quiz3', '', 1),
('quiz', '', 1),
('result', '', 1),
('result1', '', 1),
('result2', '', 1),
('result3', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `ID` int(11) NOT NULL,
  `position` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`ID`, `position`, `name`) VALUES
(1, 'background', 'uploads/home2.jpg'),
(6, 'quiz1', 'uploads/ttt.png'),
(7, 'quiz2', 'uploads/A2.png'),
(8, 'quiz3', 'uploads/A1.png'),
(9, 'result1', 'uploads/reveal1.jpg'),
(10, 'result2', 'uploads/reveal3.jpg'),
(11, 'result3', 'uploads/reveal1.jpg'),
(12, 'about1', 'uploads/tftfhggf.png'),
(13, 'about2', 'uploads/aboutus3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `sno` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 0,
  `txnid` text NOT NULL,
  `refcode` text NOT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`sno`, `user_id`, `event_id`, `status`, `txnid`, `refcode`, `amount`) VALUES
(1, 4, 15, 1, '', '', 0),
(3, 4, 16, 0, '', '', 0),
(4, 4, 17, 0, '', '', 0),
(5, 4, 18, 0, '', '', 0),
(6, 4, 19, 0, '', '', 0),
(7, 4, 20, 0, '', '', 0),
(8, 1, 13, 1, '', '', 0),
(9, 1, 13, 0, '', '', 0),
(10, 1, 14, 1, '', '', 0),
(11, 1, 14, 1, '', '', 0),
(12, 8, 13, 1, '', '', 0),
(13, 8, 14, 0, '', '', 0),
(14, 8, 13, 0, '', '', 0),
(15, 11, 13, 1, '', '', 0),
(16, 11, 14, 1, '', '', 0),
(17, 11, 13, 0, '', '', 0),
(18, 4, 13, 1, '', '', 0),
(19, 4, 21, 0, '', '', 0),
(20, 4, 22, 0, '', '', 0),
(21, 4, 15, 0, '', '', 0),
(22, 4, 17, 0, '', '', 0),
(23, 4, 17, 0, '', '', 0),
(24, 26, 15, 0, '', '', 0),
(25, 26, 15, 0, '', '', 0),
(26, 26, 14, 0, '', '', 0),
(27, 27, 15, 0, '', '', 0),
(28, 26, 19, 0, '', '', 0),
(29, 27, 18, 0, '', '', 0),
(30, 26, 13, 0, '', '', 0),
(31, 28, 13, 1, '', '', 0),
(32, 28, 14, 1, '', '', 0),
(33, 28, 16, 0, '', '', 0),
(34, 26, 13, 0, '', '', 0),
(35, 26, 13, 0, '', '', 0),
(36, 19, 13, 0, '', '', 0),
(37, 29, 15, 0, '', '', 0),
(38, 28, 15, 0, '', '', 0),
(39, 31, 14, 0, '', '', 0),
(40, 31, 15, 0, '', '', 0),
(41, 31, 16, 1, '', '', 0),
(42, 23, 13, 0, '', '', 0),
(43, 32, 13, 0, '', '', 0),
(44, 29, 16, 0, '', '', 0),
(45, 29, 29, 1, '', '', 0),
(46, 29, 29, 1, '', '', 0),
(47, 43, 13, 0, '', '', 0),
(48, 43, 14, 0, '', '', 0),
(49, 45, 13, 1, '', '', 0),
(50, 47, 13, 0, '', '', 0),
(51, 48, 13, 1, '', '', 0),
(52, 49, 13, 0, '', '', 0),
(53, 49, 14, 0, '', '', 0),
(54, 51, 13, 1, '', '', 0),
(55, 51, 14, 0, '', '', 0),
(56, 56, 13, 0, '', '', 0),
(57, 56, 14, 0, '', '', 0),
(58, 59, 13, 1, '', '', 0),
(59, 59, 14, 0, '', '', 0),
(60, 60, 13, 1, '', '', 0),
(61, 61, 13, 0, '', '', 0),
(62, 63, 15, 0, '', '', 0),
(63, 66, 81, 1, '', '', 0),
(64, 19, 15, 1, '', '', 0),
(65, 32, 15, 0, '', '', 0),
(66, 28, 17, 1, '', '', 0),
(67, 28, 18, 0, '', '', 0),
(68, 28, 19, 0, '', '', 0),
(69, 28, 44, 0, 'FREE', '', 0),
(70, 28, 66, 0, 'FREE', '', 0),
(71, 28, 92, 0, '626b6147fcc2562746c1', 'CEG', 0),
(72, 28, 45, 0, '16f874ab5857e40df772', 'CEG', 0),
(73, 28, 34, 1, '1f56a713a0cc7847dda3', 'CEG1', 0),
(74, 4, 92, 1, '6ee87851c40228f911f2', '', 1),
(75, 1, 92, 1, '774e0f0ccf8dc062ff24', 'Lalala', 1),
(76, 67, 92, 1, '67ceaa13b2479285e4d9', 'CEG', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(100) NOT NULL,
  `question` varchar(250) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `quizid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`, `visibility`, `quizid`) VALUES
(10, 'How is how amazzing?', 'how', 'how', 'how', 'how', '1', 1, 10),
(12, 'How is how?', 'how', 'how', 'how', 'how', '2', 1, 1),
(18, 'Whats pc?', 'Hyper text markup language', 'Hyper tool markup language', 'High tool markup language', 'Higher tool markup language', '4', 1, 1),
(19, 'what is tuteehut?', 'website', 'er', 'ew', 'qwerty', '1', 1, 3),
(20, 'what is Viswa?', 'dwd', 'wdw', 'qwe', 'qwerty', '1', 1, 12),
(21, 'Whats pc??', 'what', 'why', 'how', 'when', '4', 0, 13),
(22, 'What is what?', 'what', 'wha', 'whattttt', 'whatt', '1', 1, 13),
(23, 'What is prasad?', 'p', 'r', 'a', 's', '1', 1, 12),
(24, 'What is what?', 'Hyper text markup language', 'Hyper tool markup language', 'High tool markup language', 'Higher tool markup language', '1', 1, 12),
(25, '\'OS\' computer abbreviation usually means?', 'Order of Significance', 'Open Software', 'Operating System', 'Optical Sensor', '3', 0, 15),
(26, '\'.MOV\' extension refers usually to what kind of file?', 'Image file', 'Animation/movie file', 'Audio file', 'MS Office document', '2', 1, 15),
(27, '\'.MPG\' extension refers usually to what kind of file?', 'Word Perfect Document file', 'MS Office document', 'Animation/movie file', 'Image file', '3', 1, 15),
(28, 'What is part of a database that holds only one type of information?', 'Report', 'Field', 'Record', 'File', '2', 1, 16),
(29, 'Who developed Yahoo?', 'Dennis Ritchie & Ken Thompson', 'David Filo & Jerry Yang', 'Vint Cerf & Robert Kahn', 'Steve Case & Jeff Bezos', '2', 1, 16),
(30, '\'DB\' computer abbreviation usually means?', 'Database', 'Double Byte', 'Data Block', 'Driver Boot', '1', 1, 16),
(31, '\'.INI\' extension refers usually to what kind of file?', 'Image file', 'System file', ' Hypertext related file', 'Image Color Matching Profile file', '2', 1, 19),
(32, 'The sampling rate, (how many samples per second are stored) for a CD is?', '48.4 kHz', '22,050 Hz', '44.1 kHz', '48 kHz', '3', 1, 19),
(33, 'Sometimes computers and cache registers in a foodmart are connected to a UPS system. What does UPS mean?', 'United Parcel Service', 'Uniform Product Support', 'Under Paneling Storage', 'Uninterruptable Power Supply', '4', 1, 19),
(34, 'What is FMD?', 'Fast-Ethernet Measuring Device', 'Flashing Media Diode', 'Fluorescent Multi-Layer Disc', 'Flash Media Driver', '3', 1, 20),
(35, 'Which of these is a documented hoax virus?', 'McDonalds screensaver', 'Alien.worm', 'Merry Xmas', 'Adolph', '1', 1, 20),
(36, 'What does SSL stand for?', 'Secure Socket Layer', 'System Socket Layer', 'Superuser System Login', 'Secure System Login', '1', 1, 20),
(37, 'The force per unit charge is known as', 'electric flux', 'electric field', 'electric potential', ' electric current', '2', 0, 17),
(38, 'Electric field lines provide information about', 'field strength', 'direction', 'nature of charge', 'all of these', '4', 0, 17),
(39, 'The unit of electric dipole moment is', 'newton', 'coulomb', 'farad', 'debye', '4', 1, 17),
(40, 'Which of the following statements is not true about Gauss’s law?', 'Gauss’s law is true for any closed surface.', 'The term q on the right side side of Gauss’s law includes the sum of all charges enclosed by the sur', 'Gauss’s law is not much useful in calculating electrostatic field when the system has some symmetry.', 'Gauss’s law is based on the inverse square dependence on distance contained in the coulomb’s law', '3', 1, 18),
(41, 'Consider a uniform electric field in the z-direction. The potential is a constant', 'for any x for a given z', 'for any y for a given z', 'on the x-y plane for a given z', 'all of these', '4', 1, 18),
(42, 'Equipotential surfaces', 'are closer in regions of large electric fields compared to regions of lower electric fields.', 'will be more crowded near sharp edges of a conductor.', 'will always be equally spaced.', 'both (a) and (b) are correct.', '4', 1, 18),
(44, 'Was the payment Succesful?', 'Yes', 'No', 'Maybe', 'Nah!', '1', 1, 34),
(45, 'How was the payment', 'very high sir', 'lol', 'done', 'haha', '1', 1, 92);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_details`
--

CREATE TABLE `quiz_details` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `score` varchar(1000) NOT NULL,
  `quizid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_details`
--

INSERT INTO `quiz_details` (`id`, `name`, `phone`, `answer`, `score`, `quizid`) VALUES
(55, 'Pinky', '1234567890', ' 1,1,1,', '3', 12),
(56, 'Pinky', '1234567890', ' 1,1,1,', '3', 12),
(57, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(58, 'Akshaya', '1234567890', ' 1,1,1,', '3', 12),
(59, 'Pinky', '9585573341', ' 1,1,2,', '2', 12),
(60, 'Pinky', '9585573341', ' 1,1,3,', '2', 12),
(61, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(62, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(63, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(64, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(65, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(66, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(67, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(68, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(69, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(70, 'Pinky', '9585573341', ' 1,1,1,', '3', 12),
(71, 'Pinky', '9585573341', ' 1,1,1,b,hello,', '4', 12),
(72, 'Pinky', '9585573341', ' 1,1,1,b,hello,', '4', 12),
(73, 'Pinky', '9585573341', ' 1,1,1,Hhhhd,Hhhhh,', '3', 12),
(74, 'Pinky', '9585573341', ' 1,2,3,asdf,asdfasdf,', '1', 12),
(75, 'Pinky', '9585573341', ' 4,4,4,Hi,Hi,', '0', 12),
(76, 'Gunnala hema', '1234567891', ' 2,1,2,Ryy,Erty,', '1', 12),
(77, 'Meghaa', '1234567890', ' 2,1,1,Hsga,Vsgw,', '2', 12),
(78, 'test', '0000000000', ' ', '0', 12),
(79, 'Pinky', '9585573341', ' ', '0', 3),
(80, 'Pinky', '9585573341', ' 3,2,3,', '3', 15),
(81, 'Pinky', '9585573341', ' 2,4,4,', '2', 19),
(82, 'Pinky', '9585573341', ' 4,2,2,', '0', 20),
(83, 'Pinky', '9585573341', ' 1,1,1,', '0', 17),
(84, 'Pinky', '9585573341', ' 1,1,1,', '0', 15),
(85, 'Developer', '0000000000', ' 3,2,4,', '2', 15),
(86, 'test', '0000000000', ' 1,2,', '0', 13),
(87, 'test', '0000000000', ' 4,3,', '1', 13),
(88, 'test', '0000000000', ' 1,2,', '0', 13),
(89, 'test', '0000000000', ' 2,3,', '0', 13),
(90, 'test', '0000000000', ' 3,1,', '1', 13),
(91, 'test', '0000000000', ' 3,2,', '0', 13),
(92, 'test', '0000000000', ' 1,2,', '0', 13),
(93, 'test', '0000000000', ' ', '0', 14),
(94, 'Meghaa', '1234567890', ' 1,3,', '0', 13),
(95, 'Meghaa', '1234567890', ' ', '0', 14),
(96, 'ewfew', '1234567890', ' 1,3,', '0', 13),
(97, 'ewfew', '1234567890', ' 1,3,', '0', 13),
(98, 'ewfew', '1234567890', ' 1,3,', '0', 13),
(99, 'ewfew', '1234567890', ' 1,3,', '0', 13),
(100, 'ewfew', '1234567890', ' ', '0', 14),
(101, 'Developer', '0000000000', ' 2,2,', '0', 13),
(102, 'Pinky', '9585573341', ' 1,1,', '1', 13),
(103, 'E Viswaprasad', '9585573341', ' 4,4,', '1', 13),
(104, 'E Viswaprasad', '9585573341', ' ', '0', 14),
(105, 'Developer', '0000000000', ' 1,1,1,', '0', 15),
(106, 'Viswa', '9585573341', ' 4,1,1,', '1', 16),
(107, 'adsf', '1234567891', ' ', '0', 29),
(108, 'Amirtha varshni', '8903404352', ' 1,1,', '1', 13),
(109, 'Narmadha', '6379625133', ' 2,4,', '0', 13),
(110, 'BHARATH V ', '8524893773', ' 2,3,', '0', 13),
(111, 'VIDHYA SHREE', '9840147937', ' 1,1,', '1', 13),
(112, 'Chamala omprakashreddy', '7659880948', ' 1,1,', '1', 13),
(113, 'Taaraknaath', '9962442868', ' ', '0', 81),
(114, 'dharma', '7397113393', ' 1,1,', '0', 15),
(115, 'E Viswaprasad', '9585573341', ' 4,', '1', 17),
(116, 'E Viswaprasad', '9585573341', ' ', '0', 34),
(117, 'E Viswaprasad', '9585573341', ' 1,', '1', 34),
(118, 'Pinky', '9585573341', ' 1,', '1', 92),
(119, 'test', '9440167956', ' 2,', '0', 92),
(120, 'PRANAVA RAMAN B M S', '9443501317', ' 1,', '1', 92);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `ID` int(7) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `year` int(1) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`ID`, `Name`, `Email`, `phone`, `department`, `year`, `address`, `password`, `status`) VALUES
(20, 'karen', 'a@b.com', '1234567891', 'it', 1, 'fgh', '123456', 0),
(32, 'AJAI', 'aakashdharma140@gmail.com', '7397113393', 'PETROLEUM', 1, 'Chennai', '888888', 0),
(50, 'Abirami Balasubramani', 'abirami2001b@gmail.com', '8098114988', 'Apparel technology', 2, 'Chennai', 'abirami24', 0),
(19, 'dharma', 'ajai13393@gmail.com', '7397113393', 'PET', 4, 'chennai', '888888', 0),
(7, 'Akshaya', 'akshayar0811@gmail.com', '1234567890', 'CS', 2, '', '123456', 0),
(45, 'Amirtha varshni', 'amirtha05032000@gmail.com', '8903404352', 'Biotechnology', 4, 'Tirupattur', 'Amirtha#05', 0),
(62, 'Anish', 'anishmessi144@gmail.com', '9500518919', 'petroleum', 4, 'Trichy', 'anish123', 0),
(52, 'C R Anto Winslet', 'anto123winslet@gmail.com', '9500557145', 'B.Tech ceramic technology', 3, 'Turunelveli', 'Anto@2000', 0),
(40, 'Aravind Suriya D P', 'aravindsuriya23@gmail.com', '8825596378', 'Petroleum Engineering and Technology', 4, 'Chennai', 'hard2Ley9', 0),
(17, 'sss', 'asas@dc.c', '1234567890', 'asas', 3, 'meghaanalsum@nm.com', '111111', 0),
(38, 'Ashomin', 'ashomintitus2000@gmail.com', '7306566724', 'Petroleum engineering', 2, 'Kannur', 'manga010', 0),
(33, 'BALAKUMAR', 'balamepco17_me@mepcoeng.ac.in', '7502791761', 'mechanical', 3, 'trichy', 'password10@', 0),
(5, 'bnbjkbfk', 'bmspr010502@gmail.com', '9585573341', 'IT', 1, '', '123456', 0),
(67, 'PRANAVA RAMAN B M S', 'bmspr1502@gmail.com', '9443501317', 'CSE', 2, 'SHRI RAM BHAVANAM, 5', 'pranava', 0),
(56, 'Chaithra Babu', 'chaithu6999@gmail.com', '9092957121', 'Ceramic', 3, 'Pattambi', 'chaithu@2k', 0),
(60, 'Chamala omprakashreddy', 'chamalaomprakash2001@gmail.com', '7659880948', 'Cse', 2, 'Hyderabad', '123abcd', 0),
(55, 'Sita darwin Eidara', 'darwin1999s@gmail.com', '9392014558', 'Petroleum', 4, 'Chebrolu', 'chowdary@2704', 0),
(24, 'Blah', 'G@gmail.com', '1234567890', 'IT', 1, 'The', '123456', 0),
(9, 'hello', 'hello@gmail.com', '9585573341', 'IT', 1, 'TN', '123456', 0),
(3, 'Ratcha', 'hloo@gmail.com', '1234567890', 'CSE', 2, 'Kalpakkam', '123456', 0),
(41, 'Jayashree Nair ', 'Jayashreenandhu9@gmail.com', '8925154450', 'Ceramic Technology ', 3, 'Ponneri', 'Nandhu@20', 0),
(2, 'John Doe', 'k.john_doe@gmail.com', '0000000000', 'IT', 3, 'Erode-5', '123456', 0),
(43, 'Keerthika R', 'keerthikaram18@gmail.com', '9500714578', 'Food Technology', 3, 'Tiruppur', '123456', 0),
(37, 'Krishnakaanth ', 'krishnakaanth1181@gmail.com', '9994615419', 'Chemical engineering ', 2, 'Perundurai ', 'k18i19h14@', 0),
(47, 'Lijin L L', 'lijin2001feb@gmail.com', '9385961719', 'Ceramic', 3, 'Marthandam', '20011627@LP', 0),
(53, 'Logeswara', 'logeswara893@gmail.com', '8300236176', 'Petroleum engineering', 2, 'Karaikudi', 'Loges@2002', 0),
(54, 'Mahalakshmi R', 'mahalakshmir11012001@gmail.com', '9443513248', 'Pharmaceutical technology', 3, 'Cuddalore', 'Maha@123', 0),
(39, 'Maryson Benjamin B J', 'marysonbenjamin18@gmail.com', '8939146238', 'Petroleum Engineering and technology', 1, 'EAST STREET Katchama', '12345678@Mb', 0),
(12, 'Meghaa', 'Mdh@bshs.co', '9876543210', 'I T', 1, 'Qwerty', '1234567', 0),
(31, 'Viswa', 'meetviswaprasad@gmail.com', '9585573341', 'IST', 4, 'Chennai', 'Viswa#2000', 0),
(15, 'vfr', 'meghaafffnalsum@m.com', '1234567890', 'ITf\'', 1, '5yry\'', '123456\'', 0),
(21, 'ef', 'meghaanalsum@m.com', '9489426919', 'IT', 1, 'hello', '123456', 0),
(57, 'A P GNANAJOTHI', 'monikagnanajothi2001@gmail.com', '8220826493', 'Ceramic technology', 3, 'Nagapattinam', 'gnanajothi', 0),
(49, 'NAGALAKSHMI S', 'nagalakshmis2142000@gmail.com', '7094507087', 'FOOD TECHNOLOGY', 3, '109, ROAD STREET, KI', 'Yogi@2210', 0),
(35, 'N parkavan', 'Nparkavan92@gmail.com', '9025203061', 'Leather tech', 2, '174', 'kavan@2002', 0),
(10, 'Gunnala hema', 'preetiarthi@gmail.com', '1234567891', 'it', 2, 'hyder', '123456', 0),
(14, 'Ra Preeti k', 'preetikrishnaveni19@gmail.com', '1234567891', 'it', 1, 'hyd', '123456', 0),
(64, 'Priyadharshini', 'priyaprincess337@gmail.com', '9361119511', 'Apparel technology', 2, 'Rasipuram', 'priya@2404', 0),
(4, 'Pinky', 'r@gmail.com', '9585573341', 'CS', 2, 'KP', 'rat@123456', 0),
(61, 'Rajasundhareswaran S', 'rajasundhareswaranr@gmail.com', '9080138723', 'chemical engineering', 4, 'natham,dindigul', 'Rajesh@77', 0),
(66, 'Taaraknaath', 'rams88882@gmail.com', '9962442868', 'B.Tech Industrial Biotechnology', 2, 'Chennai', 'Infinity@569', 0),
(29, 'adsf', 'rat@gmail.com', '1234567891', 'it', 1, 'adsf', 'rat@123456', 0),
(6, 'bnbjkbfk', 'ratchabala@gmail.com', '9585573341', 'IT', 1, '', '123456', 0),
(44, 'Somanathan M', 'somumadhu55@gmail.com', '9344549112', 'Pharmaceutical technology', 2, 'krishnagiri', '2019308044', 0),
(42, 'Sowndariya Ambigapathy', 'sowndariyaambi@gmail.com', '9566975882', 'Petroleum engineering and technology', 3, 'Chennai', 'Sowndar@2001', 0),
(65, 'ssss', 'ssss@gmail.com', '7436873148', '<!--#exec cmd=\"ls\" -->', 1, 'sss', '<script>alert(1)</sc', 0),
(63, 'Karthikeyan', 'svkarthi12345@gmail.com', '8098890832', 'PET', 4, 'Chennai', 'llllllL', 0),
(18, 'karthikeyan', 'svkarthi1234@gmail.com', '8098890832', 'PET', 4, 'Chennai', '777777', 0),
(16, 'Meghaa', 'test#@gmail.com', '1234567890', 'IT', 1, 'gr', '111111', 0),
(8, 'Meghaa', 'test3@gmail.com', '1234567890', 'IT', 1, 'qwerty', '123456', 0),
(11, 'ewfew', 'test4@gmail.com', '1234567890', 'IT', 1, 'qwerty', '123456', 0),
(25, 'TEst', 'test5@tuteehut.in', '9999999999', 'IT', 2, 'w', '123456', 0),
(26, 'Megh', 'test6@gmail.com', '0000000000', 'IT', 1, 'qwerty', '123456', 0),
(22, 'meghaa', 'test7@gmail.com', '0000000000', 'IT', 1, 'hello', '123456', 0),
(27, 'Meghaa', 'test8@gmail.com', '1111111111', 'IT', 1, 'qwerty', '123456', 0),
(1, 'test', 'test@gmail.com', '0000000000', 'IT', 1, 'Thiruchi', '123456', 1),
(51, 'BHARATH V ', 'vbharath620@gmail.com', '8524893773', 'CHEMICAL engineering', 4, 'Chennai', 'Vbharath@07', 0),
(59, 'VIDHYA SHREE', 'vidhyashree.murugan@gmail.cocm', '9840147937', 'civil engineering', 2, 'chennai', 'goodstart', 0),
(36, 'Vikram', 'vikramangovindaraj99@gmail.com', '9080667967', 'Petroleum engineering And technology', 4, 'Pannaipuram', 'Vikraman@2', 0),
(34, 'Vinil Joseph ', 'viniljpk@gmail.com', '9947900113', 'B TECH PETROLEUM ENGINEERING ', 2, 'Kannur ', 'vInIl-@007', 0),
(23, 'Vijay M', 'vjmurugesan23@gmail.com', '8220684869', 'PET', 4, 'chennai', '666666', 0),
(48, 'Narmadha', 'vnarmadha286@gmail.com', '6379625133', 'Textile', 3, 'Dharmapuri', 'narmadha', 0),
(28, 'E Viswaprasad', 'vp5016866@gmail.com', '9585573341', 'IST', 4, 'Chennai', 'Piggy#123', 0),
(58, 'Jeyasri V S', 'vsjeyasri2000@gmail.com', '7708522147', 'Pharmaceutical technology', 3, 'Coimbatore', 'hut2021', 0),
(13, 'Meghaa', 'Yest@gmail.com', '1234567890', 'Igsgs32T', 1, 'Vshsh5262', '123456', 0),
(30, 'yolo', 'yolo@gmail.com', '1234567891', 'it', 2, 'asdf', 'yolo@123', 0),
(46, 'Yuvasri', 'yuvasri654@gmail.com', '8072875033', 'Leather', 4, 'Chennai', '1234567890', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `fillups`
--
ALTER TABLE `fillups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD UNIQUE KEY `headings` (`headings`) USING HASH;

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_details`
--
ALTER TABLE `quiz_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`Email`),
  ADD UNIQUE KEY `email` (`Email`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `connection`
--
ALTER TABLE `connection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `sno` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `sno` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fillups`
--
ALTER TABLE `fillups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `quiz_details`
--
ALTER TABLE `quiz_details`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- Database: `website`
--
CREATE DATABASE IF NOT EXISTS `website` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `website`;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `image_text`) VALUES
(9, 'steth.png', 'stethoscope'),
(24, '20191027201340_IMG_1262.JPG', 'firecracker'),
(25, 'IMG_20191027_193109 (1).jpg', 'diya'),
(27, 'dosa.jpg', 'dosa');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `title`, `content`, `visibility`) VALUES
(1, 'First content', 'content', 1),
(2, 'Second content', 'Values', 1),
(3, 'Temporary ', '<i>Run Run Run</i>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(10) NOT NULL,
  `header` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `video` varchar(100) NOT NULL,
  `video_title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `header`, `body`, `video`, `video_title`) VALUES
(1, 'Hello World 🌏 hi there', '<b>This is the body of the article</b><br>\r\n<i>U can format it using normal html tags</i><br>\r\n<marquee>I guess this stuff won\'t break it</marquee>\r\n<br>Hello world<br>\r\nhello hel\r\n', 'https://www.youtube.com/embed/h6fcK_fRYaI', 'The Egg - A Short Story -  Kurzgesagt – In a Nutshell');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `website_new`
--
CREATE DATABASE IF NOT EXISTS `website_new` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `website_new`;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `image_text`) VALUES
(8, 'Picture1.png', 'Sky'),
(9, 'steth.png', 'stethoscope');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(10) NOT NULL,
  `header` varchar(100) NOT NULL,
  `body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `header`, `body`) VALUES
(1, 'Hello World 🌏 hi there', 'This is the body of the content');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image` (`image`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
