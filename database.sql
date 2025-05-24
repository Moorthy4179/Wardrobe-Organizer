-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2025 at 08:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wardrobe`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id` int(11) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`id`, `items`, `date`) VALUES
(1, '{\"Top\":{\"id\":\"1\",\"name\":\"T-Shirt\",\"type\":\"Top\",\"image_url\":\"67974349531756.03753801.jpg\"},\"Bottom\":{\"id\":\"7\",\"name\":\"Jeans\",\"type\":\"Bottom\",\"image_url\":\"67974456a2dc66.89488323.jpg\"},\"Outerwear\":{\"id\":\"31\",\"name\":\"Coat\",\"type\":\"Outerwear\",\"image_url\":\"679c6d98987411.48908658.jpg\"},\"Accessory\":[{\"id\":\"25\",\"name\":\"Sunglasses\",\"type\":\"Accessory\",\"image_url\":\"679c6be610ccd1.67654871.jpg\"}],\"Shoes\":{\"id\":\"11\",\"name\":\"Boots\",\"type\":\"Shoes\",\"image_url\":\"679744f6114bb0.43845811.jpg\"}}', '2025-02-21'),
(2, '{\"Top\":{\"id\":\"2\",\"name\":\"T-Shirt\",\"type\":\"Top\",\"image_url\":\"6797435c4737b5.04345202.jpg\"},\"Bottom\":{\"id\":\"16\",\"name\":\"Casual Pants\",\"type\":\"Bottom\",\"image_url\":\"67974793b2cb37.60645705.jpg\"},\"Accessory\":[{\"id\":\"27\",\"name\":\"Watch\",\"type\":\"Accessory\",\"image_url\":\"679c6c08a92c20.59231654.jpg\"},{\"id\":\"25\",\"name\":\"Sunglasses\",\"type\":\"Accessory\",\"image_url\":\"679c6be610ccd1.67654871.jpg\"}],\"Shoes\":{\"id\":\"12\",\"name\":\"Flats\",\"type\":\"Shoes\",\"image_url\":\"6797450a9dd285.52219781.jpg\"}}', '2025-02-23'),
(3, '{\"Top\":{\"id\":\"54\",\"name\":\"Shirt\",\"type\":\"Top\",\"image_url\":\"67c56da5af4720.53678804.jpeg\"},\"Bottom\":{\"id\":\"14\",\"name\":\"Jeans\",\"type\":\"Bottom\",\"image_url\":\"67974625d3f3a1.79525178.jpg\"},\"Accessory\":[{\"id\":\"59\",\"name\":\"Watch\",\"type\":\"Accessory\",\"image_url\":\"67c57eb1aec212.54626658.jpeg\"},{\"id\":\"67\",\"name\":\"Sunglasses\",\"type\":\"Accessory\",\"image_url\":\"67c7dd2704c6b6.60921710.jpeg\"}],\"Shoes\":{\"id\":\"65\",\"name\":\"Flats\",\"type\":\"Shoes\",\"image_url\":\"67c580d14f09d6.15031262.jpeg\"}}', '2025-03-20'),
(4, '{\"Top\":{\"id\":\"19\",\"name\":\"Shirt\",\"type\":\"Top\",\"image_url\":\"67c56e03c6e959.50757246.jpeg\"},\"Bottom\":{\"id\":\"14\",\"name\":\"Jeans\",\"type\":\"Bottom\",\"image_url\":\"67974625d3f3a1.79525178.jpg\"},\"Accessory\":[{\"id\":\"21\",\"name\":\"Watch\",\"type\":\"Accessory\",\"image_url\":\"67c57e81303871.46444067.jpg\"}],\"Shoes\":{\"id\":\"10\",\"name\":\"Flats\",\"type\":\"Shoes\",\"image_url\":\"67c580d14f09d6.15031262.jpeg\"}}', '2025-03-27');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `items`) VALUES
(1, '{\"Top\":{\"id\":\"19\",\"name\":\"Shirt\",\"type\":\"Top\",\"image_url\":\"67c56e03c6e959.50757246.jpeg\"},\"Bottom\":{\"id\":\"14\",\"name\":\"Jeans\",\"type\":\"Bottom\",\"image_url\":\"67974625d3f3a1.79525178.jpg\"},\"Accessory\":[{\"id\":\"12\",\"name\":\"Sunglasses\",\"type\":\"Accessory\",\"image_url\":\"67c7dd2704c6b6.60921710.jpeg\"},{\"id\":\"23\",\"name\":\"Watch\",\"type\":\"Accessory\",\"image_url\":\"67c57eb1aec212.54626658.jpeg\"}],\"Shoes\":{\"id\":\"10\",\"name\":\"Flats\",\"type\":\"Shoes\",\"image_url\":\"67c580d14f09d6.15031262.jpeg\"}}'),
(2, '{\"Top\":{\"id\":\"6\",\"name\":\"Hoodie\",\"type\":\"Top\",\"image_url\":\"6797442e59a836.10992766.jpg\"},\"Bottom\":{\"id\":\"16\",\"name\":\"Casual Pants\",\"type\":\"Bottom\",\"image_url\":\"67c92359573ad2.48448859.jpeg\"},\"Accessory\":[{\"id\":\"44\",\"name\":\"Hat\",\"type\":\"Accessory\",\"image_url\":\"67c56ae62e3e35.39559516.jpeg\"}],\"Shoes\":{\"id\":\"24\",\"name\":\"Sneakers\",\"type\":\"Shoes\",\"image_url\":\"67c57f4a5b90a2.98430659.jpeg\"}}'),
(3, '{\"Top\":{\"id\":\"20\",\"name\":\"Shirt\",\"type\":\"Top\",\"image_url\":\"67c56e1c0fb175.28359748.jpeg\"},\"Bottom\":{\"id\":\"14\",\"name\":\"Jeans\",\"type\":\"Bottom\",\"image_url\":\"67974625d3f3a1.79525178.jpg\"},\"Accessory\":[{\"id\":\"21\",\"name\":\"Watch\",\"type\":\"Accessory\",\"image_url\":\"67c57e81303871.46444067.jpg\"},{\"id\":\"11\",\"name\":\"Sunglasses\",\"type\":\"Accessory\",\"image_url\":\"67c7dd0c1ca190.11650826.jpeg\"}],\"Shoes\":{\"id\":\"26\",\"name\":\"Flats\",\"type\":\"Shoes\",\"image_url\":\"67c58037ba6097.23191485.jpeg\"}}'),
(4, '{\"Accessory\":[{\"id\":\"41\",\"name\":\"Scarf\",\"type\":\"Accessory\",\"image_url\":\"67c56a35a83030.95957697.jpeg\"}],\"Shoes\":{\"id\":\"25\",\"name\":\"Sneakers\",\"type\":\"Shoes\",\"image_url\":\"67c57f631cd016.89131545.jpeg\"},\"Bottom\":{\"id\":\"7\",\"name\":\"Casual Pants\",\"type\":\"Bottom\",\"image_url\":\"67c9231959d911.35940374.jpeg\"},\"Top\":{\"id\":\"38\",\"name\":\"Sweater\",\"type\":\"Top\",\"image_url\":\"67c569e83e9bc4.00402657.jpeg\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'Moorthy', 'moorthyn007@gmail.com', 'Moorthy', '2024-12-24 06:06:57'),
(2, 'Ganapathy', 'ganesh@gmail.com', 'Ganesh', '2024-12-24 06:23:53'),
(3, 'Soorya', 'soorya@gmail.com', '123456', '2024-12-24 06:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `wardrobe`
--

CREATE TABLE `wardrobe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `season` varchar(50) NOT NULL,
  `occasion` varchar(50) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wardrobe`
--

INSERT INTO `wardrobe` (`id`, `name`, `type`, `color`, `season`, `occasion`, `image_url`) VALUES
(1, 'T-Shirt', 'Top', 'Red', 'Summer', 'Formal', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyAAAAH/CAYAAACvh7m7AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAz3qSURBVHgB7P1tsG3bdhWG9THmnOtj733Oufc+gQQCB+PAjxTBhQKSnh4J8CexilQlcVJUkgIXlbhsFw4CCT2Z/AKq8iMgCQlLRWxVcFFlnFSohOCU+RGbK'),
(2, 'Jeans', 'Bottom', 'Blue', 'Spring', 'Formal', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyAAAAH/CAYAAACvh7m7AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAz3qSURBVHgB7P1tsG3bdhWG9THmnOtj733Oufc+gQQCB+PAjxTBhQKSnh4J8CexilQlcVJUkgIXlbhsFw4CCT2Z/AKq8iMgCQlLRWxVcFFlnFSohOCU+RGbK'),
(9, 'Hat', 'Top', 'White', 'Winter', 'Casual', 'uploads/6780be6e77e23_wardrobe.png'),
(10, 'Jeans', 'Bottom', 'Red', 'Winter', 'Casual', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAB4AAAAQ4CAYAAADo08FDAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAP+6SURBVHhe7N0HYBRV/gfw7/bdZLPpnfSEkAQCCYQOgkgRFEXBjvUv9nbnFa94nuedp1e8O8ud3lkQFaUIiiJVeg29hZZCeu/b2/+92UlIQjpJSOD3gZfd6bNTdufNb957kvGjRjvRgtPZvJery'),
(11, 'T-Shirt', 'Top', 'Red', 'Winter', 'Casual', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABBMAAAOMCAYAAAAfUftFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAP+lSURBVHhe7P0HcBxnnud5w5T33sARoPfeiZ4iQU+RFCkaUZREI9CK3kr03hvRk7KU1DItT0ktM21m58btjunume3Yu97bve673Tfevb7tu53dnY7bjvhf/');

-- --------------------------------------------------------

--
-- Table structure for table `wardrobe1`
--

CREATE TABLE `wardrobe1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wardrobe1`
--

INSERT INTO `wardrobe1` (`id`, `name`, `type`, `image_url`, `created_at`) VALUES
(1, 'T-Shirt', 'Top', '67974349531756.03753801.jpg', '2025-01-27 08:26:49'),
(2, 'T-Shirt', 'Top', '6797435c4737b5.04345202.jpg', '2025-01-27 08:27:08'),
(3, 'Shirt', 'Top', '679743da90e051.09748249.jpg', '2025-01-27 08:29:14'),
(4, 'Boots', 'Shoes', '67c58090a168f6.69105775.jpeg', '2025-03-03 10:12:32'),
(5, 'Boots', 'Shoes', '67c58055d97875.39846240.jpeg', '2025-03-03 10:11:33'),
(6, 'Hoodie', 'Top', '6797442e59a836.10992766.jpg', '2025-01-27 08:30:38'),
(7, 'Casual Pants', 'Bottom', '67c9231959d911.35940374.jpeg', '2025-03-06 04:22:49'),
(8, 'Jeans', 'Bottom', '67c9232de01c14.35048930.jpeg', '2025-03-06 04:23:09'),
(9, 'T-Shirt', 'Top', '6797448191c0d2.02522382.jpg', '2025-01-27 08:32:01'),
(10, 'Flats', 'Shoes', '67c580d14f09d6.15031262.jpeg', '2025-03-03 10:13:37'),
(11, 'Sunglasses', 'Accessory', '67c7dd0c1ca190.11650826.jpeg', '2025-03-05 05:11:40'),
(12, 'Sunglasses', 'Accessory', '67c7dd2704c6b6.60921710.jpeg', '2025-03-05 05:12:07'),
(13, 'Sneakers', 'Shoes', '6797451b3e3cb9.77362211.jpg', '2025-01-27 08:34:35'),
(14, 'Jeans', 'Bottom', '67974625d3f3a1.79525178.jpg', '2025-01-27 08:39:01'),
(15, 'Casual Pants', 'Bottom', '67c92343726cc1.89608743.jpeg', '2025-03-06 04:23:31'),
(16, 'Casual Pants', 'Bottom', '67c92359573ad2.48448859.jpeg', '2025-03-06 04:23:53'),
(17, 'Casual Pants', 'Bottom', '679747a6bc1219.21826629.jpg', '2025-01-27 08:45:26'),
(18, 'Shirt', 'Top', '67c56da5af4720.53678804.jpeg', '2025-03-03 08:51:49'),
(19, 'Shirt', 'Top', '67c56e03c6e959.50757246.jpeg', '2025-03-03 08:53:23'),
(20, 'Shirt', 'Top', '67c56e1c0fb175.28359748.jpeg', '2025-03-03 08:53:48'),
(21, 'Watch', 'Accessory', '67c57e81303871.46444067.jpg', '2025-03-03 10:03:45'),
(22, 'Shirt', 'Top', '67c57e978253f1.03780028.jpg', '2025-03-03 10:04:07'),
(23, 'Watch', 'Accessory', '67c57eb1aec212.54626658.jpeg', '2025-03-03 10:04:33'),
(24, 'Sneakers', 'Shoes', '67c57f4a5b90a2.98430659.jpeg', '2025-03-03 10:07:06'),
(25, 'Sneakers', 'Shoes', '67c57f631cd016.89131545.jpeg', '2025-03-03 10:07:31'),
(26, 'Flats', 'Shoes', '67c58037ba6097.23191485.jpeg', '2025-03-03 10:11:03'),
(27, 'Watch', 'Accessory', '679c6c08a92c20.59231654.jpg', '2025-01-31 06:22:00'),
(28, 'T-Shirt', 'Top', '67c56c402b1de8.15353038.jpeg', '2025-03-03 08:45:52'),
(29, 'Blazer', 'Outerwear', '679c6dc76f7385.74654549.jpg', '2025-01-31 06:29:27'),
(30, 'Coat', 'Outerwear', '679c6d86670a30.74948465.jpg', '2025-01-31 06:28:22'),
(31, 'Shirt', 'Top', '67c56d82f40271.34691884.jpeg', '2025-03-03 08:51:14'),
(32, 'Jacket', 'Outerwear', '679c6db02bf399.19242569.jpg', '2025-01-31 06:29:04'),
(33, 'Jacket', 'Outerwear', '679c6dd7912c74.45642824.jpg', '2025-01-31 06:29:43'),
(34, 'Shirt', 'Top', '67c56d960e0310.48105864.jpeg', '2025-03-03 08:51:34'),
(35, 'Raincoat', 'Outerwear', '67c5561ad4b2d4.29393676.jpeg', '2025-03-03 07:11:22'),
(36, 'Umbrella', 'Accessory', '67c556b8c28503.15554148.jpeg', '2025-03-03 07:14:00'),
(37, 'Jeans', 'Bottom', '67c922cda4f4e1.86653401.jpeg', '2025-03-06 04:21:33'),
(38, 'Sweater', 'Top', '67c569e83e9bc4.00402657.jpeg', '2025-03-03 08:35:52'),
(39, 'Sweater', 'Top', '67c56a0d79eff1.16492324.jpeg', '2025-03-03 08:36:29'),
(40, 'Sweater', 'Top', '67c56a1fa0a5f6.43767400.jpeg', '2025-03-03 08:36:47'),
(41, 'Scarf', 'Accessory', '67c56a35a83030.95957697.jpeg', '2025-03-03 08:37:09'),
(42, 'Jeans', 'Bottom', '67c922e24b4ce6.30479326.jpeg', '2025-03-06 04:21:54'),
(43, 'Scarf', 'Accessory', '67c56a961027d1.07166560.jpeg', '2025-03-03 08:38:46'),
(44, 'Hat', 'Accessory', '67c56ae62e3e35.39559516.jpeg', '2025-03-03 08:40:06'),
(45, 'Umbrella', 'Accessory', '67c56af4a9dc68.09383527.jpeg', '2025-03-03 08:40:20'),
(46, 'T-Shirt', 'Top', '67c56c25a0e896.56537746.jpeg', '2025-03-03 08:45:25'),
(47, 'Jeans', 'Bottom', '67c922fc824fd9.92107010.jpg', '2025-03-06 04:22:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wardrobe`
--
ALTER TABLE `wardrobe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wardrobe1`
--
ALTER TABLE `wardrobe1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wardrobe`
--
ALTER TABLE `wardrobe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wardrobe1`
--
ALTER TABLE `wardrobe1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
