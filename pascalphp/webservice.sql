-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2018 at 02:29 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE `biodata` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nohp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`id`, `nama`, `nohp`) VALUES
(17, 'Ahmad Tauhid', '081907558324'),
(19, 'Pandu Logistik', '081999'),
(23, 'Ahmad Tauhid', '081907558324'),
(24, 'Nurma Susanti', '01929'),
(25, 'Pandu Langi', '009988772'),
(26, 'Ahmad Tauhid', '081907558324'),
(27, 'Nurma Susanti', '01929'),
(28, 'Pandu Langi', '009988772'),
(29, 'Ahmad Tauhid', '081907558324'),
(30, 'Nurma Susanti', '01929'),
(31, 'Pandu Langi', '009988772'),
(32, 'Ahmad Tauhid', '081907558324'),
(33, 'Nurma Susanti', '01929'),
(34, 'Pandu Langi', '009988772'),
(35, 'Ahmad Tauhid', '081907558324'),
(36, 'Nurma Susanti', '01929'),
(37, 'Pandu Langi', '009988772'),
(38, 'Ahmad Tauhid', '081907558324'),
(39, 'Nurma Susanti', '01929'),
(40, 'Pandu Langi', '009988772'),
(42, 'Nurma Susanti', '01929'),
(43, 'Pandu Langi', '009988772'),
(46, 'Pandu Langi', '009988772'),
(47, 'Ahmad Tauhid', '081907558324'),
(49, 'Pandu Langi', '009988772'),
(50, 'Ahmad Tauhid', '081907558324'),
(51, 'Nurma Susanti', '01929'),
(52, 'Pandu Langi', '009988772'),
(54, 'Nurma Susanti', '01929'),
(55, 'Pandu Langi', '009988772'),
(56, 'Ahmad Tauhid', '081907558324'),
(57, 'Nurma Susanti', '01929'),
(58, 'Pandu Langi', '009988772'),
(59, 'Ahmad Tauhid', '081907558324'),
(60, 'Nurma Susanti', '01929'),
(61, 'Pandu Langi', '009988772'),
(62, 'Ahmad Tauhid', '081907558324'),
(63, 'Nurma Susanti', '01929'),
(64, 'Pandu Langi', '009988772'),
(67, 'Susabol', '088213456'),
(68, 'Jalaludin Rumi', '938387374'),
(69, 'Hello', '42'),
(70, 'berhasil', '098182'),
(71, 'yeahhh', '0819283'),
(72, 'Pandu Langi', '009988772'),
(73, 'Pandu Langiiiiiiii', '0099887722222'),
(75, 'Jamal Mirdad', '101010101');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
