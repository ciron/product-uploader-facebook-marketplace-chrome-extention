-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 17, 2025 at 06:28 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extension_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `availability` enum('in stock','out of stock','pre-order') NOT NULL,
  `category` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image_url`, `price`, `availability`, `category`, `brand`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Modern Sofa', 'A stylish modern sofa for your living room.', 'uploads/image_1.png', '499.99', 'in stock', 'Living Room', 'FurnitureCo', 0, '2025-01-14 08:50:01', '2025-01-14 11:40:34'),
(2, 'Dining Table', 'A sturdy wooden dining table.', 'uploads/image_2.png', '299.99', 'in stock', 'Dining Room', 'WoodWorks', 0, '2025-01-14 08:50:01', '2025-01-14 11:40:34'),
(3, 'Office Chair', 'Ergonomic office chair with lumbar support.', 'uploads/image_3.png', '129.99', 'in stock', 'Office', 'ComfortSeating', 0, '2025-01-14 08:50:01', '2025-01-14 11:40:34'),
(4, 'Garden Bench', 'A beautiful garden bench made of teak.', 'uploads/image_4.png', '249.99', 'in stock', 'Outdoor', 'NatureWood', 0, '2025-01-14 08:50:01', '2025-01-14 11:40:34'),
(5, 'Bed Frame', 'Queen-sized bed frame with a minimalist design.', 'uploads/image_5.png', '399.99', 'in stock', 'Bedroom', 'SleepWell', 0, '2025-01-14 08:50:01', '2025-01-14 11:40:34'),
(6, 'Bookshelf', 'Tall bookshelf with five adjustable shelves.', 'uploads/image_6.png', '149.99', 'in stock', 'Living Room', 'LibraryEssentials', 0, '2025-01-14 08:50:01', '2025-01-14 02:50:09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
