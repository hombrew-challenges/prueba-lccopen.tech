-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2016 at 12:46 AM
-- Server version: 5.5.47-0+deb8u1
-- PHP Version: 5.6.17-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lccopentech`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipos`
--

CREATE TABLE IF NOT EXISTS `equipos` (
`id` int(11) NOT NULL,
  `equipo` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipos`
--

INSERT INTO `equipos` (`id`, `equipo`) VALUES
(1, 'real madrid'),
(2, 'manchester united'),
(3, 'barcelona'),
(4, 'yankees de nueva york');

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE IF NOT EXISTS `marcas` (
`id` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`id`, `marca`) VALUES
(1, 'nike'),
(2, 'adidas'),
(3, 'puma'),
(4, 'under armour'),
(5, 'quicksilver'),
(6, 'reebok');

-- --------------------------------------------------------

--
-- Table structure for table `relevancias`
--

CREATE TABLE IF NOT EXISTS `relevancias` (
`id` int(11) NOT NULL,
  `relevancia` varchar(30) NOT NULL,
  `veces_buscada` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relevancias`
--

INSERT INTO `relevancias` (`id`, `relevancia`, `veces_buscada`) VALUES
(1, 'real madrid ', 3),
(2, 'yankees de nueva york ', 3),
(3, 'quicksilver ', 1),
(10, 'franelas ', 4),
(11, 'reebok ', 1),
(12, 'puma ', 1),
(13, 'guantes ', 1),
(14, 'sweaters ', 1),
(15, 'manchester united ', 1),
(16, 'barcelona ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ropas`
--

CREATE TABLE IF NOT EXISTS `ropas` (
`id` int(11) NOT NULL,
  `ropa` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ropas`
--

INSERT INTO `ropas` (`id`, `ropa`) VALUES
(1, 'franelas'),
(2, 'shorts'),
(3, 'zapatos'),
(4, 'guantes'),
(5, 'sweaters');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipos`
--
ALTER TABLE `equipos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relevancias`
--
ALTER TABLE `relevancias`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ropas`
--
ALTER TABLE `ropas`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipos`
--
ALTER TABLE `equipos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `relevancias`
--
ALTER TABLE `relevancias`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ropas`
--
ALTER TABLE `ropas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
