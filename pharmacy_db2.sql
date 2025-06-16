-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 06:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy_db2`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `alert_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `alert_type` enum('low_stock','expiry') NOT NULL,
  `alert_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`alert_id`, `product_id`, `alert_type`, `alert_date`) VALUES
(47, 11, '', '2025-05-05 08:58:02'),
(48, 11, '', '2025-05-05 08:58:02'),
(49, 11, '', '2025-05-06 07:51:16'),
(50, 11, '', '2025-05-06 07:51:16'),
(51, 11, '', '2025-05-06 08:24:27'),
(52, 11, '', '2025-05-06 08:24:27'),
(53, 11, '', '2025-05-06 08:24:56'),
(54, 11, '', '2025-05-06 08:24:56'),
(55, 11, '', '2025-05-06 08:37:00'),
(56, 11, '', '2025-05-06 08:37:00'),
(57, 11, '', '2025-05-28 05:39:52'),
(58, 11, '', '2025-05-28 05:39:52'),
(59, 11, '', '2025-05-28 05:46:21'),
(60, 11, '', '2025-05-28 05:46:21'),
(61, 11, '', '2025-05-29 03:02:28'),
(62, 11, '', '2025-05-29 03:02:28'),
(63, 11, '', '2025-05-29 03:02:32'),
(64, 11, '', '2025-05-29 03:02:32'),
(65, 11, '', '2025-05-29 04:06:02'),
(66, 11, '', '2025-05-29 04:06:02'),
(67, 11, '', '2025-05-29 04:24:29'),
(68, 11, '', '2025-05-29 04:24:29'),
(69, 13, '', '2025-05-29 04:24:29'),
(70, 11, '', '2025-05-29 04:25:14'),
(71, 11, '', '2025-05-29 04:25:14'),
(72, 13, '', '2025-05-29 04:25:14'),
(73, 11, '', '2025-06-04 02:25:30'),
(74, 11, '', '2025-06-04 02:25:30'),
(75, 13, '', '2025-06-04 02:25:30'),
(76, 11, '', '2025-06-04 02:26:03'),
(77, 11, '', '2025-06-04 02:26:03'),
(78, 13, '', '2025-06-04 02:26:03'),
(79, 11, '', '2025-06-08 09:54:11'),
(80, 11, '', '2025-06-08 09:54:11'),
(81, 13, '', '2025-06-08 09:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `chronic_diseases` text DEFAULT NULL,
  `age` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `membership_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `phone`, `email`, `address`, `chronic_diseases`, `age`, `weight`, `gender`, `membership_id`) VALUES
(1, 'worrata', 'Mingponwat', '0994495416', 'worrata2545@hotmail.com', 'Dk', 'เบาหวาน,ความดัน', 22, 74.00, 'male', 3),
(3, 'pasakorn', 'mingponwat', '0994495414', 'pmj1999@gmail.com', '-', '', 24, 50.00, '', 3),
(4, 'pattarakit', 'mingponwat', '0635475363', 'pattarakit@hotmail.com', '-', '', 23, 80.00, 'male', 2),
(17, 'worrata', 'mingponwat', '0994495416', 'petch@gmail.com', 'dk', 'ความดัน', 23, 70.00, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dosage_guidelines`
--

CREATE TABLE `dosage_guidelines` (
  `guideline_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `weight_min` decimal(5,2) NOT NULL,
  `weight_max` decimal(5,2) DEFAULT NULL,
  `dosage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosage_guidelines`
--

INSERT INTO `dosage_guidelines` (`guideline_id`, `product_id`, `weight_min`, `weight_max`, `dosage`) VALUES
(1, 1, 0.00, 50.00, '0.5'),
(2, 1, 51.00, 70.00, '1'),
(3, 1, 71.00, 100.00, '1.5');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `membership_id` int(11) NOT NULL,
  `membership_type` varchar(50) NOT NULL,
  `discount_rate` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`membership_id`, `membership_type`, `discount_rate`, `created_at`) VALUES
(1, 'Bronz', 5.00, '2025-02-24 07:45:29'),
(2, 'Silver', 10.00, '2025-02-24 07:45:29'),
(3, 'Gold', 15.00, '2025-02-24 07:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `payment_method`) VALUES
(1, 1, '2025-03-24 14:07:21', 42.50, 'cash'),
(19, 1, '2025-03-25 05:16:12', 42.50, 'cash'),
(20, 1, '2025-03-25 05:16:50', 42.50, 'cash'),
(22, 1, '2025-03-25 05:25:52', 42.50, 'cash'),
(23, 1, '2025-03-25 05:28:43', 42.50, 'cash'),
(24, 1, '2025-03-25 05:32:44', 42.50, 'cash'),
(26, 1, '2025-03-25 10:51:58', 42.50, 'transfer'),
(28, 1, '2025-03-25 11:09:46', 42.50, 'cash'),
(29, NULL, '2025-03-25 11:48:40', NULL, NULL),
(30, 1, '2025-03-25 11:51:42', 42.50, 'cash'),
(31, NULL, '2025-03-25 12:03:57', NULL, NULL),
(32, NULL, '2025-03-25 12:05:51', NULL, NULL),
(33, NULL, '2025-03-26 03:55:53', NULL, NULL),
(34, NULL, '2025-03-26 03:59:30', NULL, NULL),
(35, 1, '2025-03-26 04:00:01', 42.50, 'cash'),
(36, NULL, '2025-03-26 04:02:20', NULL, NULL),
(37, NULL, '2025-03-26 06:41:56', NULL, NULL),
(38, 1, '2025-03-26 06:47:38', 50.00, 'cash'),
(39, NULL, '2025-03-27 10:53:15', NULL, NULL),
(40, NULL, '2025-03-27 10:59:50', NULL, NULL),
(41, NULL, '2025-03-27 11:27:38', NULL, NULL),
(42, 1, '2025-03-27 11:27:43', 42.50, 'cash'),
(43, 1, '2025-03-27 11:27:47', 42.50, 'cash'),
(44, 1, '2025-03-27 11:28:11', 42.50, 'cash'),
(45, 1, '2025-03-27 11:30:47', 42.50, 'cash'),
(46, NULL, '2025-03-27 11:31:01', NULL, NULL),
(47, 1, '2025-03-27 11:31:05', 85.00, 'cash'),
(48, NULL, '2025-03-27 11:32:45', NULL, NULL),
(49, 1, '2025-03-27 11:33:46', 42.50, 'cash'),
(50, 1, '2025-03-27 11:34:34', 42.50, 'cash'),
(51, 1, '2025-03-27 11:35:19', 42.50, 'cash'),
(52, 1, '2025-03-27 11:35:40', 42.50, 'cash'),
(53, 1, '2025-03-27 11:36:37', 42.50, 'cash'),
(54, 1, '2025-03-27 11:36:41', 42.50, 'cash'),
(55, NULL, '2025-03-27 11:47:00', NULL, NULL),
(56, 1, '2025-03-27 11:47:05', 42.50, 'cash'),
(57, NULL, '2025-03-27 12:05:57', NULL, NULL),
(58, NULL, '2025-03-27 12:09:51', NULL, NULL),
(59, NULL, '2025-03-27 12:12:08', NULL, NULL),
(60, NULL, '2025-03-27 12:20:20', NULL, NULL),
(61, NULL, '2025-03-27 12:22:39', NULL, NULL),
(62, 1, '2025-03-27 12:25:09', 50.00, 'cash'),
(63, NULL, '2025-03-27 12:40:33', NULL, NULL),
(64, NULL, '2025-03-27 12:41:09', NULL, NULL),
(65, NULL, '2025-03-27 12:47:54', NULL, NULL),
(66, NULL, '2025-03-27 12:50:21', NULL, NULL),
(67, NULL, '2025-03-27 12:52:42', NULL, NULL),
(68, 1, '2025-03-27 12:54:15', 85.00, 'cash'),
(69, 1, '2025-03-27 14:18:27', 85.00, 'cash'),
(70, NULL, '2025-03-27 14:18:45', NULL, NULL),
(71, NULL, '2025-03-27 14:29:16', NULL, NULL),
(72, 1, '2025-03-27 14:29:36', 42.50, 'cash'),
(73, NULL, '2025-03-31 05:57:27', NULL, NULL),
(74, NULL, '2025-03-31 06:03:41', NULL, NULL),
(75, NULL, '2025-03-31 10:21:44', NULL, NULL),
(76, 1, '2025-03-31 10:25:24', 42.50, 'cash'),
(77, NULL, '2025-03-31 10:27:21', NULL, NULL),
(78, NULL, '2025-03-31 10:31:07', NULL, NULL),
(79, 1, '2025-03-31 10:31:24', 42.50, 'cash'),
(80, NULL, '2025-03-31 10:35:13', NULL, NULL),
(81, 1, '2025-03-31 10:35:59', 42.50, 'cash'),
(82, NULL, '2025-04-02 06:43:00', NULL, NULL),
(83, NULL, '2025-04-02 06:44:34', NULL, NULL),
(84, 1, '2025-04-02 06:44:56', 150.00, 'cash'),
(85, NULL, '2025-04-02 06:45:34', NULL, NULL),
(86, NULL, '2025-04-02 06:45:45', NULL, NULL),
(87, 1, '2025-04-02 06:46:06', 212.50, 'cash'),
(88, NULL, '2025-04-02 06:46:34', NULL, NULL),
(89, 1, '2025-04-02 06:46:59', 255.00, 'cash'),
(90, NULL, '2025-04-02 07:04:04', NULL, NULL),
(91, NULL, '2025-04-02 07:06:29', NULL, NULL),
(92, 1, '2025-04-02 07:06:33', 50.00, 'cash'),
(93, NULL, '2025-04-08 14:19:51', NULL, NULL),
(94, 1, '2025-04-08 14:19:54', 50.00, 'cash'),
(95, 1, '2025-04-08 14:21:23', 50.00, 'cash'),
(96, 1, '2025-04-08 14:21:53', 50.00, 'cash'),
(97, 1, '2025-04-08 14:21:57', 50.00, 'cash'),
(98, 1, '2025-04-08 14:22:52', 50.00, 'cash'),
(99, 1, '2025-04-08 14:25:05', 50.00, 'cash'),
(100, NULL, '2025-04-09 06:46:52', NULL, NULL),
(101, 1, '2025-04-09 06:46:55', 50.00, 'cash'),
(102, NULL, '2025-04-24 14:15:50', NULL, NULL),
(103, 1, '2025-04-24 14:15:53', 50.00, 'cash'),
(104, NULL, '2025-05-05 08:53:57', NULL, NULL),
(105, NULL, '2025-05-05 08:59:01', NULL, NULL),
(106, 1, '2025-05-05 08:59:08', 100.00, 'cash'),
(107, NULL, '2025-05-05 08:59:17', NULL, NULL),
(108, 1, '2025-05-05 08:59:42', 127.50, 'cash'),
(109, NULL, '2025-05-05 09:00:18', NULL, NULL),
(110, 1, '2025-05-05 09:01:45', 200.00, 'cash'),
(111, NULL, '2025-05-05 09:25:28', NULL, NULL),
(112, 1, '2025-05-05 09:28:29', 550.00, 'cash'),
(113, NULL, '2025-05-05 09:28:37', NULL, NULL),
(114, 1, '2025-05-05 09:28:44', 850.00, 'cash'),
(115, NULL, '2025-05-05 09:29:08', NULL, NULL),
(116, 1, '2025-05-05 09:29:12', 50.00, 'cash'),
(117, NULL, '2025-05-06 08:25:45', NULL, NULL),
(118, 1, '2025-05-06 08:25:56', 50.00, 'cash'),
(119, NULL, '2025-05-06 08:26:07', NULL, NULL),
(120, 1, '2025-05-06 08:26:27', 42.50, 'cash'),
(121, NULL, '2025-05-06 08:26:36', NULL, NULL),
(122, 1, '2025-05-06 08:35:30', 50.00, 'cash'),
(123, NULL, '2025-05-06 08:35:46', NULL, NULL),
(124, NULL, '2025-05-06 08:36:18', NULL, NULL),
(125, 1, '2025-05-06 08:36:43', 100.00, 'cash'),
(126, NULL, '2025-05-06 08:48:51', NULL, NULL),
(127, NULL, '2025-05-11 14:21:37', NULL, NULL),
(128, NULL, '2025-05-28 05:46:28', NULL, NULL),
(129, NULL, '2025-05-28 05:52:45', NULL, NULL),
(130, NULL, '2025-05-28 05:53:01', NULL, NULL),
(131, 1, '2025-05-28 05:53:35', 127.50, 'cash'),
(132, NULL, '2025-05-28 05:53:43', NULL, NULL),
(133, 1, '2025-05-28 05:53:46', 50.00, 'cash'),
(134, NULL, '2025-05-29 04:06:21', NULL, NULL),
(135, NULL, '2025-05-29 04:08:38', NULL, NULL),
(136, NULL, '2025-05-29 04:09:05', NULL, NULL),
(137, NULL, '2025-05-29 04:09:35', NULL, NULL),
(138, 1, '2025-05-29 04:14:25', 212.50, 'cash'),
(139, NULL, '2025-05-29 04:14:48', NULL, NULL),
(140, 1, '2025-05-29 04:17:11', 300.00, 'cash'),
(141, NULL, '2025-05-29 04:23:20', NULL, NULL),
(142, 1, '2025-05-29 04:23:25', 2500.00, 'cash'),
(143, NULL, '2025-06-04 02:35:12', NULL, NULL),
(144, NULL, '2025-06-08 09:50:42', NULL, NULL),
(145, 1, '2025-06-08 09:51:50', 50.00, 'cash'),
(146, NULL, '2025-06-08 09:54:45', NULL, NULL),
(147, 1, '2025-06-08 09:55:31', 50.00, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `total_price`) VALUES
(36, 71, 1, 1, 50.00, 50.00),
(53, 104, 8, 1, 50.00, 50.00),
(54, 105, 8, 1, 50.00, 50.00),
(55, 107, 8, 1, 50.00, 50.00),
(56, 109, 8, 1, 50.00, 50.00),
(57, 111, 8, 7, 50.00, 350.00),
(58, 113, 8, 6, 50.00, 300.00),
(59, 115, 8, 1, 50.00, 50.00),
(60, 117, 8, 1, 50.00, 50.00),
(61, 119, 8, 1, 50.00, 50.00),
(62, 121, 8, 1, 50.00, 50.00),
(63, 123, 8, 1, 50.00, 50.00),
(64, 124, 1, 1, 50.00, 50.00),
(65, 126, 8, 1, 50.00, 50.00),
(66, 127, 8, 1, 50.00, 50.00),
(67, 128, 8, 1, 50.00, 50.00),
(68, 129, 8, 1, 50.00, 50.00),
(69, 130, 8, 1, 50.00, 50.00),
(70, 132, 8, 1, 50.00, 50.00),
(71, 134, 8, 1, 50.00, 50.00),
(72, 135, 8, 1, 50.00, 50.00),
(73, 136, 11, 1, 50.00, 50.00),
(74, 137, 8, 2, 50.00, 100.00),
(75, 139, 8, 6, 50.00, 300.00),
(76, 141, 13, 100, 25.00, 2500.00),
(77, 143, 3, 1, 50.00, 50.00),
(78, 144, 3, 1, 50.00, 50.00),
(79, 146, 8, 1, 50.00, 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `warning_conditions` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `restrictions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `ingredients`, `warning_conditions`, `category`, `price`, `stock_quantity`, `expiry_date`, `barcode`, `restrictions`, `created_at`) VALUES
(1, 'akamol', 'paracetamol', 'paracetamol', '-', 'ยาสามัญประจำบ้าน', 50.00, 498, '2026-03-18', '1111111111111111111111', '- ', '2025-03-17 17:00:00'),
(3, 'tylenol', 'paracetamol', 'paracetamol', '-', 'ยาสามัญประจำบ้าน', 50.00, 498, '2026-03-18', '1111111111111111111111', '- ', '2025-03-17 17:00:00'),
(4, 'akamol', 'paracetamol', 'paracetamol', '-', 'ยาสามัญประจำบ้าน', 50.00, 500, '2026-07-08', '1111111111111111111111', '- ', '2025-03-17 17:00:00'),
(8, 'sara', 'ยาแก้แพ้', 'paracetamol', 'ความดัน', 'ยาแก้แพ้', 50.00, 461, '2026-06-24', '0', '-', '2025-04-29 17:00:00'),
(11, 'sara', 'ยาแก้แพ้', 'paracetamol', 'ความดัน', 'ยาแก้แพ้', 50.00, 29, '2025-06-05', '0', '-', '2025-05-04 17:00:00'),
(12, 'sara', 'ยาแก้แพ้', 'paracetamol', 'ความดัน', 'ยาแก้แพ้', 50.00, 500, '2026-05-06', '0', '-', '2025-05-05 17:00:00'),
(13, 'sara', 'ยาแก้แพ้', 'parasetamal', 'ความดัน', '', 25.00, 400, '2025-01-29', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `movement_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `movement_type` enum('import','sale') NOT NULL,
  `quantity` int(11) NOT NULL,
  `movement_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `membership_id` (`membership_id`);

--
-- Indexes for table `dosage_guidelines`
--
ALTER TABLE `dosage_guidelines`
  ADD PRIMARY KEY (`guideline_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`membership_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`movement_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dosage_guidelines`
--
ALTER TABLE `dosage_guidelines`
  MODIFY `guideline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `movement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`membership_id`) ON DELETE SET NULL;

--
-- Constraints for table `dosage_guidelines`
--
ALTER TABLE `dosage_guidelines`
  ADD CONSTRAINT `dosage_guidelines_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movements_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
