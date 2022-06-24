-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2022 at 11:16 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `SubTitle` varchar(255) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `Image`, `Title`, `SubTitle`, `UserId`) VALUES
(80, 'https://itbook.store/img/books/9781617294723.png', 'Serverless Applications with Node.js', 'Using AWS Lambda and Claudia.js', 34),
(83, 'https://itbook.store/img/books/9781784391584.png', 'Learning Laravel\'s Eloquent', 'Develop amazing data-based applications with Eloquent, the Laravel framework ORM', 35),
(84, 'https://itbook.store/img/books/9781783287031.png', 'Getting Started with Laravel 4', 'Discover Laravel - one of the most expressive, robust, and flexible PHP web application frameworks around', 36),
(85, 'https://itbook.store/img/books/9781784391584.png', 'Learning Laravel\'s Eloquent', 'Develop amazing data-based applications with Eloquent, the Laravel framework ORM', 36),
(86, 'https://itbook.store/img/books/1001642413967.png', '100 Laravel Quick Tips', '', 36),
(87, 'https://itbook.store/img/books/9781783287031.png', 'Getting Started with Laravel 4', 'Discover Laravel - one of the most expressive, robust, and flexible PHP web application frameworks around', 37),
(88, 'https://itbook.store/img/books/9781491936085.png', 'Laravel: Up and Running', 'A Framework for Building Modern PHP Apps', 37);

-- --------------------------------------------------------

--
-- Table structure for table `theuser`
--

CREATE TABLE `theuser` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Profession` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Pass_word` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theuser`
--

INSERT INTO `theuser` (`id`, `fullName`, `Email`, `Profession`, `Image`, `Pass_word`) VALUES
(31, 'Nassima', 'Nassima@gmail.com', 'best sister', 'C:\\fakepath\\5x5  usa (1) copie.jpg', 'Nassima@1235kkllklk'),
(34, 'Omar', 'omar@gmail.com', 'PHP', '', 'omar@123LKMiuiiu'),
(35, 'aLI', 'ali@gmail.com', 'COD', 'C:\\fakepath\\5x5  usa (1) copie.jpg', 'Rainober@12547'),
(36, 'Agra', 'Agra@gmail.com', 'Teacher', 'C:\\fakepath\\5x5  usa (1) copie.jpg', 'Rainover1254@j'),
(37, 'Imane', 'Imane@gmail.com', 'teacher', '', 'Imane122@oipII');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `SubTitle` varchar(255) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `Image`, `Title`, `SubTitle`, `UserId`) VALUES
(109, 'https://itbook.store/img/books/9781449333607.png', 'Node.js for PHP Developers', 'Porting PHP to Node.js', 34),
(110, 'https://itbook.store/img/books/9781484200384.png', 'Pro Express.js', 'Master Express.js: The Node.js Framework For Your Web Development', 34),
(111, 'https://itbook.store/img/books/9781617294723.png', 'Serverless Applications with Node.js', 'Using AWS Lambda and Claudia.js', 34),
(114, 'https://itbook.store/img/books/9781784391584.png', 'Learning Laravel\'s Eloquent', 'Develop amazing data-based applications with Eloquent, the Laravel framework ORM', 35),
(115, 'https://itbook.store/img/books/9781783287031.png', 'Getting Started with Laravel 4', 'Discover Laravel - one of the most expressive, robust, and flexible PHP web application frameworks around', 36),
(116, 'https://itbook.store/img/books/9781784391584.png', 'Learning Laravel\'s Eloquent', 'Develop amazing data-based applications with Eloquent, the Laravel framework ORM', 36),
(117, 'https://itbook.store/img/books/1001642413967.png', '100 Laravel Quick Tips', '', 36),
(119, 'https://itbook.store/img/books/9781491936085.png', 'Laravel: Up and Running', 'A Framework for Building Modern PHP Apps', 37);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `theuser`
--
ALTER TABLE `theuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `theuser`
--
ALTER TABLE `theuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `theuser` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `theuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
