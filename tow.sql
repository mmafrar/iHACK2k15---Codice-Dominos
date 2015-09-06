-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 05, 2015 at 10:37 AM
-- Server version: 5.5.35
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `absd`
--
CREATE DATABASE IF NOT EXISTS `absd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `absd`;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `STOCK_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STOCK_CODE` varchar(10) NOT NULL,
  `STOCK_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`STOCK_ID`) USING BTREE,
  UNIQUE KEY `UNI_STOCK_NAME` (`STOCK_NAME`),
  UNIQUE KEY `UNI_STOCK_CODE` (`STOCK_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_detail`
--

CREATE TABLE IF NOT EXISTS `stock_detail` (
  `STOCK_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `COMP_NAME` varchar(100) NOT NULL,
  `COMP_DESC` varchar(255) NOT NULL,
  `REMARK` varchar(255) NOT NULL,
  `LISTED_DATE` date NOT NULL,
  PRIMARY KEY (`STOCK_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stock_detail`
--
ALTER TABLE `stock_detail`
  ADD CONSTRAINT `FK_STOCK_ID` FOREIGN KEY (`STOCK_ID`) REFERENCES `stock` (`STOCK_ID`);
--
-- Database: `assignment24`
--
CREATE DATABASE IF NOT EXISTS `assignment24` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `assignment24`;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `ptnId` int(11) NOT NULL,
  `modle` varchar(100) DEFAULT NULL,
  `colour` varchar(100) DEFAULT NULL,
  `numPlate` varchar(10) DEFAULT NULL,
  KEY `ptnId` (`ptnId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dispensary`
--

CREATE TABLE IF NOT EXISTS `dispensary` (
  `disId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  PRIMARY KEY (`disId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `drId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  PRIMARY KEY (`drId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE IF NOT EXISTS `drug` (
  `drgId` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(100) DEFAULT NULL,
  `formula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`drgId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `ptnId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `drId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ptnId`),
  KEY `drId` (`drId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_drug`
--

CREATE TABLE IF NOT EXISTS `patient_drug` (
  `ptnId` int(11) DEFAULT NULL,
  `drgId` int(11) DEFAULT NULL,
  KEY `ptnId` (`ptnId`),
  KEY `drgId` (`drgId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`ptnId`) REFERENCES `patient` (`ptnId`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`drId`) REFERENCES `doctor` (`drId`);

--
-- Constraints for table `patient_drug`
--
ALTER TABLE `patient_drug`
  ADD CONSTRAINT `patient_drug_ibfk_1` FOREIGN KEY (`ptnId`) REFERENCES `patient` (`ptnId`),
  ADD CONSTRAINT `patient_drug_ibfk_2` FOREIGN KEY (`drgId`) REFERENCES `drug` (`drgId`);
--
-- Database: `fooddiet`
--
CREATE DATABASE IF NOT EXISTS `fooddiet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fooddiet`;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_profile_id` int(11) NOT NULL,
  `status` varchar(200) DEFAULT NULL,
  `pic_if_path` varchar(200) DEFAULT NULL,
  `date_post` varchar(200) DEFAULT NULL,
  `time_post` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `user_profile_id` (`user_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bmi_levle`
--

CREATE TABLE IF NOT EXISTS `bmi_levle` (
  `bmi_levle_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `level_bmi` int(11) NOT NULL,
  PRIMARY KEY (`bmi_levle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `diet_plan`
--

CREATE TABLE IF NOT EXISTS `diet_plan` (
  `diet_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_week` varchar(200) DEFAULT NULL,
  `bmi_levle_id` int(11) NOT NULL,
  `breakfast` varchar(200) NOT NULL,
  `break1` varchar(200) DEFAULT NULL,
  `lunch` varchar(200) NOT NULL,
  `break2` varchar(200) DEFAULT NULL,
  `dinner` varchar(200) NOT NULL,
  PRIMARY KEY (`diet_plan_id`),
  KEY `bmi_levle_id` (`bmi_levle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `excecise`
--

CREATE TABLE IF NOT EXISTS `excecise` (
  `excecise_id` int(11) NOT NULL AUTO_INCREMENT,
  `excecise_name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`excecise_id`),
  UNIQUE KEY `excecise_name` (`excecise_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feed_back`
--

CREATE TABLE IF NOT EXISTS `feed_back` (
  `feed_back_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_profile_id` int(11) NOT NULL,
  `user_feed_back` varchar(200) NOT NULL,
  PRIMARY KEY (`feed_back_id`),
  KEY `user_profile_id` (`user_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fitness_schedule_detail`
--

CREATE TABLE IF NOT EXISTS `fitness_schedule_detail` (
  `fitness_schedule_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_profile_id` int(11) NOT NULL,
  `excecise_id` int(11) NOT NULL,
  `bmi_levle_id` int(11) NOT NULL,
  `day_week` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fitness_schedule_detail_id`),
  KEY `user_profile_id` (`user_profile_id`),
  KEY `excecise_id` (`excecise_id`),
  KEY `bmi_levle_id` (`bmi_levle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_comment`
--

CREATE TABLE IF NOT EXISTS `post_comment` (
  `post_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  `user_comment` varchar(200) NOT NULL,
  `date_commented` varchar(200) DEFAULT NULL,
  `time_commented` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`post_comment_id`),
  KEY `user_profile_id` (`user_profile_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `question_detail`
--

CREATE TABLE IF NOT EXISTS `question_detail` (
  `question_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_profile_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`question_detail_id`),
  KEY `user_profile_id` (`user_profile_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE IF NOT EXISTS `recipe` (
  `recipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_diet`
--

CREATE TABLE IF NOT EXISTS `user_diet` (
  `user_diet_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_profile_id` int(11) NOT NULL,
  `diet_plan_id` int(11) NOT NULL,
  `bmi_levle_id` int(11) NOT NULL,
  PRIMARY KEY (`user_diet_id`),
  UNIQUE KEY `diet_plan_id` (`diet_plan_id`),
  KEY `user_profile_id` (`user_profile_id`),
  KEY `bmi_levle_id` (`bmi_levle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_Name` varchar(200) NOT NULL,
  `last_Name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(200) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `waistSize` int(11) NOT NULL,
  `occupation` varchar(200) NOT NULL,
  `working_hours` int(11) NOT NULL,
  `anydiseases` varchar(200) DEFAULT NULL,
  `taking_medicines` varchar(200) DEFAULT NULL,
  `userName` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `photo_path_of_user` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_profile_id`,`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diet_plan`
--
ALTER TABLE `diet_plan`
  ADD CONSTRAINT `diet_plan_ibfk_1` FOREIGN KEY (`bmi_levle_id`) REFERENCES `bmi_levle` (`bmi_levle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feed_back`
--
ALTER TABLE `feed_back`
  ADD CONSTRAINT `feed_back_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fitness_schedule_detail`
--
ALTER TABLE `fitness_schedule_detail`
  ADD CONSTRAINT `fitness_schedule_detail_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fitness_schedule_detail_ibfk_2` FOREIGN KEY (`excecise_id`) REFERENCES `excecise` (`excecise_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fitness_schedule_detail_ibfk_3` FOREIGN KEY (`bmi_levle_id`) REFERENCES `bmi_levle` (`bmi_levle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_comment`
--
ALTER TABLE `post_comment`
  ADD CONSTRAINT `post_comment_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_comment_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question_detail`
--
ALTER TABLE `question_detail`
  ADD CONSTRAINT `question_detail_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_detail_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_diet`
--
ALTER TABLE `user_diet`
  ADD CONSTRAINT `user_diet_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_diet_ibfk_2` FOREIGN KEY (`bmi_levle_id`) REFERENCES `bmi_levle` (`bmi_levle_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `library`
--
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `BookId` varchar(10) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Authour` varchar(100) NOT NULL,
  `PYear` varchar(4) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BookId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookId`, `Title`, `Authour`, `PYear`, `Publisher`) VALUES
('b001', 'Magam Soliya', 'Raj Madawala', '2014', 'RRRR'),
('b002', 'Babara', 'asha', '2014', 'sss');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `MemId` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  PRIMARY KEY (`MemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemId`, `Name`, `Address`, `Contact`) VALUES
('m001', 'Asha', 'Galle', '0771222222');

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE IF NOT EXISTS `trans` (
  `TransID` varchar(10) NOT NULL,
  `BookId1` varchar(10) NOT NULL,
  `BookId2` varchar(10) NOT NULL,
  `MemId` varchar(10) NOT NULL,
  `IssuedDate` date NOT NULL,
  `RecievedDate` date NOT NULL,
  PRIMARY KEY (`TransID`),
  KEY `BookId1` (`BookId1`),
  KEY `BookId2` (`BookId2`),
  KEY `MemId` (`MemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`TransID`, `BookId1`, `BookId2`, `MemId`, `IssuedDate`, `RecievedDate`) VALUES
('t001', 'b001', 'b002', 'm001', '2015-08-13', '2015-08-13');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trans`
--
ALTER TABLE `trans`
  ADD CONSTRAINT `trans_ibfk_1` FOREIGN KEY (`BookId1`) REFERENCES `book` (`BookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_ibfk_2` FOREIGN KEY (`BookId2`) REFERENCES `book` (`BookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_ibfk_3` FOREIGN KEY (`MemId`) REFERENCES `member` (`MemId`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `emp_view`
--
CREATE TABLE IF NOT EXISTS `emp_view` (
`Emp_No` varchar(5)
,`Emp_Name` varchar(10)
,`Dept` varchar(10)
);
-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `Emp_No` varchar(5) NOT NULL,
  `Emp_Name` varchar(10) DEFAULT NULL,
  `Dept` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Emp_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_No`, `Emp_Name`, `Dept`) VALUES
('123', 'Silva', 'SAL'),
('144', 'Bandu', 'FIN'),
('179', 'Damith', 'SAL');

-- --------------------------------------------------------

--
-- Structure for view `emp_view`
--
DROP TABLE IF EXISTS `emp_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emp_view` AS select `employee`.`Emp_No` AS `Emp_No`,`employee`.`Emp_Name` AS `Emp_Name`,`employee`.`Dept` AS `Dept` from `employee` where (`employee`.`Dept` = 'SAL') WITH CASCADED CHECK OPTION;
--
-- Database: `tow`
--
CREATE DATABASE IF NOT EXISTS `tow` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tow`;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(3) NOT NULL AUTO_INCREMENT,
  `group_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `visibility` text NOT NULL,
  `editing` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(3) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `members` text NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(3) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `post` text NOT NULL,
  `visibility` text NOT NULL,
  `editing` text NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `task_id` int(3) NOT NULL AUTO_INCREMENT,
  `group_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `assigned` text NOT NULL,
  `compeleted` char(1) NOT NULL,
  `visibility` text NOT NULL,
  `editing` text NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `dob` date NOT NULL,
  `type` varchar(10) NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
