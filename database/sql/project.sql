-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 21, 2017 at 02:17 PM
-- Server version: 10.1.23-MariaDB-1~jessie
-- PHP Version: 7.0.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `duedate` date NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`id`, `name`, `description`, `duedate`, `active`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Assignment 1', 'Assignment 1 Description', '2017-05-31', 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(2, 'Assignment 2', 'Assignment 2 Description', '2017-05-31', 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(3, 'Assignment 3', 'Assignment 3 Description', '2017-05-15', 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `student_answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(100) NOT NULL,
  `guideline` varchar(100) NOT NULL,
  `score` int(3) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `assignment_id`, `name`, `description`, `guideline`, `score`, `active`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'คำถามข้อที่ 1-1', 'จงโปรแกรม XXXXXX', 'Hint!! ใช้พื้นฐานคณิตศาสตร์เบื้องต้นช่วย', 3, 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(2, 1, 'คำถามข้อที่ 1-2', 'จงโปรแกรม YYYYYYY', '', 5, 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(3, 1, 'คำถามข้อที่ 1-3', 'จงโปรแกรม ZZZZZZ', '', 1, 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(4, 2, 'คำถามข้อที่ 2-1', 'จงโปรแกรม 11111111111', '', 5, 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(5, 2, 'คำถามข้อที่ 2-2', 'จงโปรแกรม 2222222222', '', 5, 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(6, 3, 'คำถามข้อที่ 3-1', 'จงโปรแกรม ABABABAB', '', 10, 1, 0, '2017-05-17 12:32:48', '2017-05-17 12:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', '2017-05-15 17:07:41', '2017-05-15 17:07:41'),
(2, 'Teacher', '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(3, 'Student', '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(4, 'TA', '2017-05-17 12:32:48', '2017-05-17 12:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `student_answer`
--

CREATE TABLE `student_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `script` text NOT NULL,
  `score` int(11) NOT NULL,
  `result` tinyint(1) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_answer`
--

INSERT INTO `student_answer` (`id`, `question_id`, `user_id`, `script`, `score`, `result`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'def quadcube (x):\r\n  x = int(x)\r\n  return x**2, x**3\r\n\r\na, b = quadcube(raw_input())\r\nprint a', 3, 1, 'Completed', '2017-05-17 12:32:48', '2017-05-21 14:23:28'),
(6, 2, 2, 'y = 0\r\nfor x in raw_input().split(\' \'):\r\n  x = int(x);\r\n  y = x + y\r\nprint y', 5, 1, 'Completed', '2017-05-17 12:32:48', '2017-05-21 13:39:02'),
(7, 3, 2, 'def hello (what):\r\n  text = raw_input()+\", \" + what + \"!\"\r\n  print text\r\nhello (\"World\")', 1, 1, 'Completed', '2017-05-17 12:32:48', '2017-05-21 00:44:44');

-- --------------------------------------------------------

--
-- Table structure for table `sub_comment`
--

CREATE TABLE `sub_comment` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_case`
--

CREATE TABLE `test_case` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `input` text NOT NULL,
  `output` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_case`
--

INSERT INTO `test_case` (`id`, `question_id`, `input`, `output`, `created_at`, `updated_at`) VALUES
(1, 2, '[{ \"value\" : \"10\", \"type\" : \"int\" }, { \"value\" : \"-2\", \"type\" : \"int\" }]', '[{ \"value\" :\"8\", \"type\" : \"int\" }]', '2017-05-20 07:35:48', '2017-05-20 07:35:48'),
(2, 2, '[{ \"value\" : \"10\", \"type\" : \"int\" }, { \"value\" : \"2\", \"type\" : \"int\" }]', '[{ \"value\" : 12, \"type\" : \"int\" }]', '2017-05-20 07:35:48', '2017-05-20 07:35:48'),
(3, 3, '[{ \"value\" : \"Hello\", \"type\" : \"string\" }]', '[{ \"value\" : \"Hello, World!\", \"type\" : \"string\" }]', '2017-05-20 07:35:48', '2017-05-20 07:35:48'),
(4, 1, '[{ \"value\" : \"3\", \"type\" : \"int\" }]', '[{ \"value\" : \"9\", \"type\" : \"int\" }]', '2017-05-20 07:35:48', '2017-05-20 07:35:48'),
(5, 1, '[{ \"value\" : \"8\", \"type\" : \"int\" }]', '[{ \"value\" : \"64\", \"type\" : \"int\" }]', '2017-05-20 07:35:48', '2017-05-20 07:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `regisdate` date NOT NULL,
  `remember_token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role_id`, `user`, `password`, `firstname`, `lastname`, `email`, `active`, `deleted`, `regisdate`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '$2y$10$6YdJ84G0ZY8n1oKnir.Hw.vZcLrH19r1./w.xEGu1u1zFFq9M4cJ2', 'David', 'Williams', 'admin@admin.com', 1, 0, '2017-04-03', NULL, '2017-05-15 17:07:41', '2017-05-15 17:07:41'),
(2, 2, 'Teacher01', '', 'Teacher01', 'LasteName01', 'Teacher01@chula.ac.th', 1, 0, '2017-05-01', NULL, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(3, 2, 'Teacher01', '', 'Teacher01', 'LasteName01', 'Teacher01@chula.ac.th', 1, 0, '2017-05-01', NULL, '2017-05-17 12:32:48', '2017-05-17 12:32:48'),
(4, 2, 'Teacher01', '', 'Teacher01', 'LasteName01', 'Teacher01@chula.ac.th', 1, 0, '2017-05-01', NULL, '2017-05-17 12:32:48', '2017-05-17 12:32:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_fk_user_id` (`user_id`),
  ADD KEY `comment_fk_student_answer_id` (`student_answer_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_fk_id` (`assignment_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_answer`
--
ALTER TABLE `student_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_answer_fk_user_id` (`user_id`),
  ADD KEY `student_answer_fk_question_id` (`question_id`);

--
-- Indexes for table `sub_comment`
--
ALTER TABLE `sub_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_comment_fk_user_id` (`user_id`),
  ADD KEY `sub_comment_fk_comment_id` (`comment_id`);

--
-- Indexes for table `test_case`
--
ALTER TABLE `test_case`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_fk_id` (`question_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_fk_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `student_answer`
--
ALTER TABLE `student_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sub_comment`
--
ALTER TABLE `sub_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_case`
--
ALTER TABLE `test_case`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_fk_student_answer_id` FOREIGN KEY (`student_answer_id`) REFERENCES `student_answer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `assignment_fk_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`);

--
-- Constraints for table `student_answer`
--
ALTER TABLE `student_answer`
  ADD CONSTRAINT `student_answer_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_answer_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_comment`
--
ALTER TABLE `sub_comment`
  ADD CONSTRAINT `sub_comment_fk_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_comment_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_case`
--
ALTER TABLE `test_case`
  ADD CONSTRAINT `question_fk_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `role_fk_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
