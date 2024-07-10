-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 08:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentanathi`
--

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `pid` int(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `pcontent` longtext NOT NULL,
  `type` varchar(100) NOT NULL,
  `stype` varchar(100) NOT NULL,
  `bedroom` int(50) NOT NULL,
  `bathroom` int(50) NOT NULL,
  `kitchen` int(50) NOT NULL,
  `size` int(50) NOT NULL,
  `price` int(50) NOT NULL,
  `location` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `feature` longtext NOT NULL,
  `pimage` varchar(300) NOT NULL,
  `pimage1` varchar(300) NOT NULL,
  `pimage2` varchar(300) NOT NULL,
  `pimage3` varchar(300) NOT NULL,
  `pimage4` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `tittledeedID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `resID` varchar(15) NOT NULL,
  `propertyID` int(50) NOT NULL,
  `userID` int(50) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tittledeed`
--

CREATE TABLE `tittledeed` (
  `titledeed` varchar(10) NOT NULL,
  `landlord` varchar(100) NOT NULL,
  `landlordID` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `propertyAddress` mediumtext NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tittledeed`
--

INSERT INTO `tittledeed` (`titledeed`, `landlord`, `landlordID`, `email`, `contactno`, `propertyAddress`, `password`) VALUES
('NGO8942', 'Ngobeni Lukholo', '8902157854085', 'Lngobeni@gmail.com', '0734885256', '234 Wane Str\r\nWitbank\r\n1035', '12345'),
('OKR7862', 'Ruth Smith', '7805136548089', 'ruth@gmail.com', '0734885258', '14 Diederich Str\r\nNedbank Center\r\nWitbank\r\n1035', '12345'),
('PAL2029', 'Palesa Nkosi', '8009250564082', 'palesa@gmail.com', '0786584524', '15 Rodger Str\r\nTasbet Park\r\nWitbank\r\n1035', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(50) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `uphone` varchar(20) NOT NULL,
  `upass` varchar(50) NOT NULL,
  `utype` varchar(50) NOT NULL,
  `uimage` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `uemail`, `uphone`, `upass`, `utype`, `uimage`) VALUES
(2, 'Palesa Mohlala', 'palesamohlala31@gmail.com', '0732648585', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'avatarm7-min.jpg'),
(3, 'Siphe Nkosi', 'nkosi@gmail.com', '0732648583', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'avatarm2-min.JPG');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `tittleFK` (`tittledeedID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`resID`),
  ADD KEY `fk1` (`propertyID`),
  ADD KEY `fk3` (`userID`);

--
-- Indexes for table `tittledeed`
--
ALTER TABLE `tittledeed`
  ADD PRIMARY KEY (`titledeed`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `pid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `tittleFK` FOREIGN KEY (`tittledeedID`) REFERENCES `tittledeed` (`titledeed`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `proFK` FOREIGN KEY (`propertyID`) REFERENCES `property` (`pid`),
  ADD CONSTRAINT `uidFK` FOREIGN KEY (`userID`) REFERENCES `user` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
