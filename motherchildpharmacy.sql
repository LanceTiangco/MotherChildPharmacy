-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 04:33 AM
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
-- Database: `motherchildpharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `audittrail`
--

CREATE TABLE `audittrail` (
  `auditID` int(11) NOT NULL,
  `AccountID` int(100) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) NOT NULL,
  `Status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audittrail`
--

INSERT INTO `audittrail` (`auditID`, `AccountID`, `action`, `description`, `created_at`, `ip_address`, `Status`) VALUES
(1, 3, 'Profile Update', 'User updated a profile with new data: Name: Sayra, Last Name: Jacksona, Role: Admin, Account Name: E002_sjacksona', '2024-10-12 09:50:51', '::1', '1'),
(2, 3, 'Profile Update', 'User updated a profile with new data: Name: Sayra, Last Name: Jackson, Role: Admin, Account Name: E002_sjackson', '2024-10-12 09:51:35', '::1', '1'),
(3, 3, 'Login', 'User logged in successfully.', '2024-10-14 05:58:03', '::1', '1'),
(4, 3, 'Profile Update', 'User updated a profile with new data: Name: Sayra, Last Name: Jacksona, Role: Admin, Account Name: E002_sjacksona', '2024-10-14 05:59:41', '::1', '1'),
(5, 3, 'Logout', 'User logged out successfully.', '2024-10-14 06:01:33', '::1', '1'),
(6, 3, 'Login', 'User logged in successfully.', '2024-10-14 06:01:52', '::1', '1'),
(7, 3, 'Password Reset', 'Password reset successfully for account: E002_sjacksona', '2024-10-14 06:16:30', '::1', '1'),
(8, 3, 'Profile Update', 'User updated a profile with new data: Name: Sayra, Last Name: Jackson, Role: Admin, Account Name: E002_sjackson', '2024-10-14 06:19:02', '::1', '1'),
(9, 3, 'Password Reset', 'Password reset successfully for account: E002_sjackson', '2024-10-14 06:19:09', '::1', '1'),
(10, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-10-14 06:24:04', '::1', '1'),
(11, 3, 'Add User', 'Added user: Aileen Castro with account name E004_acastro.', '2024-10-14 06:42:56', '::1', '1'),
(12, 3, 'Add User', 'Added user: Aileen Castro with account name E004_acastro.', '2024-10-14 06:44:48', '::1', '1'),
(13, 3, 'View User Details', 'Viewed details for account: E004_acastro', '2024-10-14 06:45:14', '::1', '1'),
(14, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-10-14 06:45:37', '::1', '1'),
(15, 3, 'Password Reset', 'Password reset successfully for account: E004_acastro', '2024-10-14 06:45:44', '::1', '1'),
(16, 3, 'Archive User', 'Archived user account: E004_acastro', '2024-10-14 06:46:01', '::1', '1'),
(17, 3, 'Unarchive User', 'Unarchived user with account name: E004_acastro.', '2024-10-14 10:27:07', '::1', '1'),
(18, 3, 'Change Password', 'User successfully changed their own password.', '2024-10-14 10:38:26', '::1', '1'),
(19, 3, 'Change Password', 'User failed to change their own password by entering the old password as the new password.', '2024-10-14 10:44:53', '::1', ''),
(20, 3, 'Change Password', 'User failed to change their own password by entering the old password as the new password.', '2024-10-14 10:45:17', '::1', ''),
(21, 3, 'Profile Update', 'User successfully updated their own profile (Picture: , Name: Lancelot Tiangco).', '2024-10-14 10:51:32', '::1', '1'),
(22, 3, 'Profile Update', 'User successfully updated their own profile (Name: Lance Tiangco).', '2024-10-14 10:54:01', '::1', '1'),
(23, 3, 'Add User', 'Added user: c test with account name E005_ctest.', '2024-10-14 10:59:03', '::1', '1'),
(24, 3, 'Logout', 'User logged out successfully.', '2024-10-14 10:59:21', '::1', '1'),
(25, 5, 'Login', 'User logged in successfully.', '2024-10-14 10:59:31', '::1', '1'),
(26, 5, 'Logout', 'User logged out successfully.', '2024-10-14 10:59:49', '::1', '1'),
(27, 3, 'Login', 'User logged in successfully.', '2024-10-14 10:59:57', '::1', '1'),
(28, 3, 'View Order', 'User viewed a purchase order\'s details (OrderID: PO-01).', '2024-10-14 11:19:13', '::1', '1'),
(29, 3, 'View Order', 'User viewed a purchase order\'s details (OrderID: PO-01).', '2024-10-14 11:19:31', '::1', '1'),
(30, 3, 'Logout', 'User logged out successfully.', '2024-10-14 12:02:17', '::1', '1'),
(31, 3, 'Login', 'User logged in successfully.', '2024-10-15 01:41:19', '::1', '1'),
(32, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-15 03:42:25', '::1', '1'),
(33, 3, 'Logout', 'User logged out successfully.', '2024-10-15 03:57:03', '::1', '1'),
(34, 3, 'Login', 'User logged in successfully.', '2024-10-15 03:59:42', '::1', '1'),
(35, 3, 'Logout', 'User logged out successfully.', '2024-10-15 04:00:13', '::1', '1'),
(36, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-16 02:44:57', '::1', '1'),
(37, 3, 'Create Order', 'Created purchase order (OrderID: 2).', '2024-10-16 02:45:15', '::1', '1'),
(38, 3, 'View Order', 'User viewed a purchase order\'s details (OrderID: PO-02).', '2024-10-16 02:45:18', '::1', '1'),
(39, 3, 'View Order', 'User viewed a purchase order\'s details (OrderID: PO-02).', '2024-10-16 02:45:21', '::1', '1'),
(40, 3, 'Logout', 'User logged out successfully.', '2024-10-16 03:23:09', '::1', '1'),
(41, 3, 'Auto Backup Failed', 'Automatic database backup failed.', '2024-10-16 03:23:09', '::1', '1'),
(42, 3, 'Login', 'User logged in successfully.', '2024-10-16 03:26:54', '::1', '1'),
(43, 3, 'Logout', 'User logged out successfully.', '2024-10-16 03:27:16', '::1', '1'),
(44, 3, 'Auto Backup Failed', 'Automatic database backup failed.', '2024-10-16 03:27:16', '::1', '1'),
(45, 3, 'Login', 'User logged in successfully.', '2024-10-16 03:30:46', '::1', '1'),
(46, 3, 'Logout', 'User logged out successfully.', '2024-10-16 03:30:48', '::1', '1'),
(47, 3, 'Backup Failed', 'Database backup failed.', '2024-10-16 03:30:48', '::1', '1'),
(48, 3, 'Login', 'User logged in successfully.', '2024-10-16 03:34:52', '::1', '1'),
(49, 3, 'Logout', 'User logged out successfully.', '2024-10-16 03:34:58', '::1', '1'),
(50, 3, 'Backup', 'Database backup created successfully.', '2024-10-16 03:34:58', '::1', '1'),
(51, 3, 'Login', 'User logged in successfully.', '2024-10-16 03:39:27', '::1', '1'),
(52, 3, 'Logout', 'User logged out successfully.', '2024-10-16 03:40:00', '::1', '1'),
(53, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-16 03:40:00', '::1', '1'),
(54, 3, 'Login', 'User logged in successfully.', '2024-10-16 03:42:06', '::1', '1'),
(55, 3, 'Logout', 'User logged out successfully.', '2024-10-16 03:44:11', '::1', '1'),
(56, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-16 03:44:12', '::1', '1'),
(57, 3, 'Login', 'User failed to login (Incorrect password).', '2024-10-16 03:50:35', '::1', ''),
(58, 3, 'Login', 'User logged in successfully.', '2024-10-16 03:52:39', '::1', '1'),
(59, 3, 'Logout', 'User logged out successfully.', '2024-10-16 04:20:03', '::1', '1'),
(60, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-16 04:20:03', '::1', '1'),
(61, 3, 'Login', 'User logged in successfully.', '2024-10-20 08:10:31', '::1', '1'),
(62, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-20 08:37:45', '::1', '1'),
(63, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-20 11:46:58', '::1', '1'),
(64, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-21 11:43:05', '::1', '1'),
(65, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-21 11:44:12', '::1', '1'),
(66, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-21 12:30:40', '::1', '1'),
(67, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-21 12:50:05', '::1', '1'),
(68, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-21 14:30:21', '::1', '1'),
(69, 3, 'Create Order', 'Created purchase order (OrderID: 3).', '2024-10-21 14:31:00', '::1', '1'),
(70, 3, 'Logout', 'User logged out successfully.', '2024-10-21 14:48:41', '::1', '1'),
(71, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-21 14:48:42', '::1', '1'),
(72, 3, 'Login', 'User logged in successfully.', '2024-10-27 08:13:41', '::1', '1'),
(73, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-27 08:17:52', '::1', '1'),
(74, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-27 09:26:03', '::1', '1'),
(75, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-27 09:28:11', '::1', '1'),
(76, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-27 10:52:37', '::1', '1'),
(77, 3, 'Received Delivery', 'User successfully received delivery (Delivery ID: DE-01).', '2024-10-27 10:52:56', '::1', '1'),
(78, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-27 12:46:01', '::1', '1'),
(79, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-27 12:48:03', '::1', '1'),
(80, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-10-27 13:00:31', '::1', '1'),
(81, 3, 'View User Details', 'Viewed details for account: E004_acastro', '2024-10-27 13:02:14', '::1', '1'),
(82, 3, 'View User Details', 'Viewed details for account: E004_acastro', '2024-10-27 13:03:16', '::1', '1'),
(83, 3, 'Logout', 'User logged out successfully.', '2024-10-27 13:13:32', '::1', '1'),
(84, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-27 13:13:32', '::1', '1'),
(85, 3, 'Login', 'User logged in successfully.', '2024-10-27 14:49:36', '::1', '1'),
(86, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-27 14:53:25', '::1', '1'),
(87, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-27 14:53:38', '::1', '1'),
(88, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-27 14:53:51', '::1', '1'),
(89, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-27 15:14:32', '::1', '1'),
(90, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-27 15:15:10', '::1', '1'),
(91, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-27 15:16:29', '::1', '1'),
(92, 3, 'Create Order', 'Created purchase order (OrderID: 4).', '2024-10-27 15:18:11', '::1', '1'),
(93, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-27 16:08:51', '::1', '1'),
(94, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-27 16:10:12', '::1', '1'),
(95, 3, 'Logout', 'User logged out successfully.', '2024-10-27 16:13:57', '::1', '1'),
(96, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-27 16:13:57', '::1', '1'),
(97, 3, 'Login', 'User logged in successfully.', '2024-10-29 14:09:42', '::1', '1'),
(98, 3, 'View User Details', 'Viewed details for account: E005_ctest', '2024-10-29 14:09:58', '::1', '1'),
(99, 3, 'Archive User', 'Archived user account: E005_ctest', '2024-10-29 14:11:03', '::1', '1'),
(100, 3, 'Unarchive User', 'Unarchived user with account name: E005_ctest.', '2024-10-29 14:11:10', '::1', '1'),
(101, 3, 'View User Details', 'Viewed details for account: E005_ctest', '2024-10-29 14:11:13', '::1', '1'),
(102, 3, 'Profile Update', 'User updated a profile with new data: Name: The, Last Name: Shrek, Role: Pharmacy Assistant, Account Name: E005_tshrek', '2024-10-29 14:11:21', '::1', '1'),
(103, 3, 'Archive User', 'Archived user account: E005_tshrek', '2024-10-29 14:11:25', '::1', '1'),
(104, 3, 'Add User', 'Added user: Cashier Ashiera with account name E006_cashiera.', '2024-10-29 14:13:40', '::1', '1'),
(105, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-29 14:18:30', '::1', '1'),
(106, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-29 15:34:56', '::1', '1'),
(107, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-10-29 16:08:59', '::1', '1'),
(108, 3, 'Logout', 'User logged out successfully.', '2024-10-29 17:11:01', '::1', '1'),
(109, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-29 17:11:01', '::1', '1'),
(110, 6, 'Login', 'User logged in successfully.', '2024-10-29 17:12:49', '::1', '1'),
(111, 6, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-29 17:13:25', '::1', '1'),
(112, 6, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-29 17:19:02', '::1', '1'),
(113, 6, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-29 17:21:59', '::1', '1'),
(114, 6, 'Logout', 'User logged out successfully.', '2024-10-29 17:22:06', '::1', '1'),
(115, 6, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-29 17:22:06', '::1', '1'),
(116, 3, 'Login', 'User logged in successfully.', '2024-10-29 17:22:16', '::1', '1'),
(117, 3, 'View Invoice', 'User viewed a transaction\'s details (Invoice ID: IN-01).', '2024-10-29 17:23:10', '::1', '1'),
(118, 3, 'Logout', 'User logged out successfully.', '2024-10-29 17:33:27', '::1', '1'),
(119, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-29 17:33:27', '::1', '1'),
(120, 3, 'Login', 'User logged in successfully.', '2024-10-31 01:29:32', '::1', '1'),
(121, 3, 'Goods Issue', 'User manually adjusted the stock of a product. (ItemID: 2, Quantity: 4).', '2024-10-31 01:43:51', '::1', '1'),
(122, 3, 'Archive Product', 'User archived a product. (ItemID: 11).', '2024-10-31 02:59:27', '::1', '1'),
(123, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-10-31 03:10:52', '::1', '1'),
(124, 3, 'Archive Supplier', 'User archived a supplier. (SupplierID: 2).', '2024-10-31 03:11:00', '::1', '1'),
(125, 3, 'Unarchive Supplier', 'User unarchived a supplier. (SupplierID: 2).', '2024-10-31 03:11:05', '::1', '1'),
(126, 3, 'Logout', 'User logged out successfully.', '2024-10-31 03:47:56', '::1', '1'),
(127, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-10-31 03:47:56', '::1', '1'),
(128, 3, 'Login', 'User logged in successfully.', '2024-11-03 09:59:35', '::1', '1'),
(129, 3, 'Logout', 'User logged out successfully.', '2024-11-03 16:27:16', '::1', '1'),
(130, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-03 16:27:16', '::1', '1'),
(131, 3, 'Login', 'User logged in successfully.', '2024-11-04 17:57:22', '::1', '1'),
(132, 3, 'Logout', 'User logged out successfully.', '2024-11-04 19:06:11', '::1', '1'),
(133, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-04 19:06:12', '::1', '1'),
(134, 3, 'Login', 'User logged in successfully.', '2024-11-05 07:07:48', '::1', '1'),
(135, 3, 'Logout', 'User logged out successfully.', '2024-11-05 07:09:33', '::1', '1'),
(136, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-05 07:09:33', '::1', '1'),
(137, 3, 'Login', 'User logged in successfully.', '2024-11-05 12:57:58', '::1', '1'),
(138, 3, 'Logout', 'User logged out successfully.', '2024-11-05 12:58:21', '::1', '1'),
(139, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-05 12:58:21', '::1', '1'),
(140, 3, 'Login', 'User logged in successfully.', '2024-11-05 13:03:01', '::1', '1'),
(141, 3, 'Logout', 'User logged out successfully.', '2024-11-05 13:04:56', '::1', '1'),
(142, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-05 13:04:57', '::1', '1'),
(143, 3, 'Login', 'User logged in successfully.', '2024-11-05 13:18:44', '::1', '1'),
(144, 3, 'Create Order', 'Created purchase order (OrderID: 5).', '2024-11-05 13:30:15', '::1', '1'),
(145, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-05 13:45:01', '::1', '1'),
(146, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-05 13:45:30', '::1', '1'),
(147, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-05 13:45:37', '::1', '1'),
(148, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-05 13:49:19', '::1', '1'),
(149, 3, 'Received Delivery', 'User successfully received delivery (Delivery ID: DE-02).', '2024-11-05 14:24:45', '::1', '1'),
(150, 3, 'Archive Product', 'User archived a product. (ItemID: 6).', '2024-11-05 14:45:54', '::1', '1'),
(151, 3, 'Archive Product', 'User archived a product. (ItemID: 5).', '2024-11-05 14:46:02', '::1', '1'),
(152, 3, 'Unarchive Product', 'User unarchived a product. (ItemID: 5).', '2024-11-05 14:46:07', '::1', '1'),
(153, 3, 'Archive Product', 'User archived a product. (ItemID: 7).', '2024-11-05 14:46:13', '::1', '1'),
(154, 3, 'Archive Product', 'User archived a product. (ItemID: 8).', '2024-11-05 14:46:19', '::1', '1'),
(155, 3, 'Product Update', 'User updated the details of a product. (ItemID: 10).', '2024-11-05 14:53:25', '::1', '1'),
(156, 3, 'Product Update', 'User updated the details of a product. (ItemID: 10).', '2024-11-05 14:53:33', '::1', '1'),
(157, 3, 'Archive Product', 'User archived a product. (ItemID: 10).', '2024-11-05 14:54:02', '::1', '1'),
(158, 3, 'Add Product', 'User added a new product. (ItemID: 12).', '2024-11-05 14:58:27', '::1', '1'),
(159, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-05 15:20:25', '::1', '1'),
(160, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-05 15:20:25', '::1', '1'),
(161, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-05 15:20:32', '::1', '1'),
(162, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-05 15:20:32', '::1', '1'),
(163, 3, 'Logout', 'User logged out successfully.', '2024-11-05 15:55:54', '::1', '1'),
(164, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-05 15:55:55', '::1', '1'),
(165, 3, 'Login', 'User logged in successfully.', '2024-11-06 06:33:20', '::1', '1'),
(166, 3, 'Create Order', 'Created purchase order (OrderID: 6).', '2024-11-06 06:34:59', '::1', '1'),
(167, 3, 'Received Delivery', 'User successfully received delivery (Delivery ID: DE-03).', '2024-11-06 06:35:22', '::1', '1'),
(168, 3, 'Create Order', 'Created purchase order (OrderID: 7).', '2024-11-06 07:54:45', '::1', '1'),
(169, 3, 'Received Delivery', 'User successfully received delivery (Delivery ID: DE-04).', '2024-11-06 07:55:46', '::1', '1'),
(170, 3, 'Logout', 'User logged out successfully.', '2024-11-06 07:56:08', '::1', '1'),
(171, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-06 07:56:08', '::1', '1'),
(172, 3, 'Login', 'User logged in successfully.', '2024-11-06 17:41:11', '::1', '1'),
(173, 3, 'Archive Product', 'User archived a product. (ItemID: 12).', '2024-11-06 18:53:40', '::1', '1'),
(174, 3, 'Unarchive Product', 'User unarchived a product. (ItemID: 6).', '2024-11-06 18:53:48', '::1', '1'),
(175, 3, 'Unarchive Product', 'User unarchived a product. (ItemID: 7).', '2024-11-06 18:55:43', '::1', '1'),
(176, 3, 'Product Update', 'User updated the details of a product. (ItemID: 4).', '2024-11-06 18:56:35', '::1', '1'),
(177, 3, 'Product Update', 'User updated the details of a product. (ItemID: 5).', '2024-11-06 18:59:24', '::1', '1'),
(178, 3, 'Product Update', 'User updated the details of a product. (ItemID: 6).', '2024-11-06 19:01:21', '::1', '1'),
(179, 3, 'Product Update', 'User updated the details of a product. (ItemID: 7).', '2024-11-06 19:02:30', '::1', '1'),
(180, 3, 'Product Update', 'User updated the details of a product. (ItemID: 2).', '2024-11-06 19:04:24', '::1', '1'),
(181, 3, 'Product Update', 'User updated the details of a product. (ItemID: 2).', '2024-11-06 19:42:10', '::1', '1'),
(182, 3, 'Product Update', 'User updated the details of a product. (ItemID: 2).', '2024-11-06 19:51:22', '::1', '1'),
(183, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:36:35', '::1', '1'),
(184, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:36:36', '::1', '1'),
(185, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:36:48', '::1', '1'),
(186, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:36:48', '::1', '1'),
(187, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:37:02', '::1', '1'),
(188, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:37:02', '::1', '1'),
(189, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:37:21', '::1', '1'),
(190, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-06 20:37:21', '::1', '1'),
(191, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-06 21:21:01', '::1', '1'),
(192, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-06 21:45:56', '::1', '1'),
(193, 3, 'Logout', 'User logged out successfully.', '2024-11-06 22:42:16', '::1', '1'),
(194, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-06 22:42:16', '::1', '1'),
(195, 3, 'Login', 'User logged in successfully.', '2024-11-07 05:56:23', '::1', '1'),
(196, 3, 'Logout', 'User logged out successfully.', '2024-11-07 05:59:08', '::1', '1'),
(197, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-07 05:59:08', '::1', '1'),
(198, 3, 'Login', 'User failed to login (Incorrect password).', '2024-11-07 13:00:33', '::1', ''),
(199, 3, 'Login', 'User logged in successfully.', '2024-11-07 13:00:40', '::1', '1'),
(200, 3, 'Login', 'User logged in successfully.', '2024-11-07 15:32:28', '::1', '1'),
(201, 3, 'Archive Supplier', 'User archived a supplier. (SupplierID: 2).', '2024-11-07 15:35:46', '::1', '1'),
(202, 3, 'Unarchive Supplier', 'User unarchived a supplier. (SupplierID: 2).', '2024-11-07 15:35:54', '::1', '1'),
(203, 3, 'Archive Supplier', 'User archived a supplier. (SupplierID: 2).', '2024-11-07 15:36:48', '::1', '1'),
(204, 3, 'Unarchive Supplier', 'User unarchived a supplier. (SupplierID: 2).', '2024-11-07 15:41:37', '::1', '1'),
(205, 3, 'Archive Supplier', 'User archived a supplier. (SupplierID: 2).', '2024-11-07 15:41:43', '::1', '1'),
(206, 3, 'Unarchive Supplier', 'User unarchived a supplier. (SupplierID: 2).', '2024-11-07 15:42:32', '::1', '1'),
(207, 3, 'Archive Supplier', 'User archived a supplier. (SupplierID: 2).', '2024-11-07 15:43:47', '::1', '1'),
(208, 3, 'Unarchive Supplier', 'User unarchived a supplier. (SupplierID: 2).', '2024-11-07 15:43:52', '::1', '1'),
(209, 3, 'Archive Supplier', 'User archived a supplier. (SupplierID: 2).', '2024-11-07 15:44:19', '::1', '1'),
(210, 3, 'Unarchive Supplier', 'User unarchived a supplier. (SupplierID: 2).', '2024-11-07 15:44:42', '::1', '1'),
(211, 3, 'Unarchive Product', 'User unarchived a product. (ItemID: 12).', '2024-11-07 15:47:11', '::1', '1'),
(212, 3, 'Archive Product', 'User archived a product. (ItemID: 12).', '2024-11-07 15:47:28', '::1', '1'),
(213, 3, 'Logout', 'User logged out successfully.', '2024-11-07 15:55:52', '::1', '1'),
(214, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-07 15:55:52', '::1', '1'),
(215, 3, 'Login', 'User logged in successfully.', '2024-11-07 15:56:06', '::1', '1'),
(216, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-07 16:02:47', '::1', '1'),
(217, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-07 16:05:49', '::1', '1'),
(218, 3, 'View User Details', 'Viewed details for account: E004_acastro', '2024-11-07 16:06:10', '::1', '1'),
(219, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-07 16:58:38', '::1', '1'),
(220, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-07 17:19:17', '::1', '1'),
(221, 3, 'Logout', 'User logged out successfully.', '2024-11-07 17:19:48', '::1', '1'),
(222, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-07 17:19:49', '::1', '1'),
(223, 6, 'Login', 'User failed to login (Incorrect password).', '2024-11-08 17:39:06', '::1', ''),
(224, 6, 'Login', 'User logged in successfully.', '2024-11-08 17:39:19', '::1', '1'),
(225, 6, 'Logout', 'User logged out successfully.', '2024-11-08 17:39:57', '::1', '1'),
(226, 6, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-08 17:39:57', '::1', '1'),
(227, 3, 'Login', 'User logged in successfully.', '2024-11-08 17:40:05', '::1', '1'),
(228, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-08 18:10:53', '::1', '1'),
(229, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-08 18:10:54', '::1', '1'),
(230, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-08 18:10:57', '::1', '1'),
(231, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-08 18:10:59', '::1', '1'),
(232, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-08 18:11:02', '::1', '1'),
(233, 3, 'Login', 'User logged in successfully.', '2024-11-09 08:04:23', '::1', '1'),
(234, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-09 09:32:39', '::1', '1'),
(235, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-09 09:50:40', '::1', '1'),
(236, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-09 13:04:24', '::1', '1'),
(237, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-09 17:36:08', '::1', '1'),
(238, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 1).', '2024-11-09 18:22:29', '::1', '1'),
(239, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 1).', '2024-11-09 18:22:29', '::1', '1'),
(240, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-09 18:22:58', '::1', '1'),
(241, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-09 18:22:58', '::1', '1'),
(242, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-09 18:32:39', '::1', '1'),
(243, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-09 18:32:39', '::1', '1'),
(244, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-09 18:33:02', '::1', '1'),
(245, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-09 18:33:03', '::1', '1'),
(246, 3, 'Process Sales', 'User successfully processed a transaction (Invoice ID: IN-06).', '2024-11-09 18:45:09', '::1', '1'),
(247, 3, 'View User Details', 'Viewed details for account: E006_cashiera', '2024-11-09 18:48:58', '::1', '1'),
(248, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-09 18:54:28', '::1', '1'),
(249, 3, 'View User Details', 'Viewed details for account: E002_sjackson', '2024-11-09 18:54:31', '::1', '1'),
(250, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-09 19:00:13', '::1', '1'),
(251, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-10 03:19:03', '::1', '1'),
(252, 3, 'Logout', 'User logged out successfully.', '2024-11-10 03:19:48', '::1', '1'),
(253, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-10 10:28:58', '::1', '1'),
(254, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-10 10:30:37', '::1', '1'),
(255, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-10 11:08:15', '::1', '1'),
(256, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-10 11:08:39', '::1', '1'),
(257, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-10 12:35:41', '::1', '1'),
(258, 3, 'Logout', 'User logged out successfully.', '2024-11-10 12:39:45', '::1', '1'),
(259, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-10 12:39:45', '::1', '1'),
(260, 3, 'Login', 'User logged in successfully.', '2024-11-10 12:39:53', '::1', '1'),
(261, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-10 12:40:02', '::1', '1'),
(262, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-10 13:46:52', '::1', '1'),
(263, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-10 13:47:32', '::1', '1'),
(264, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-10 13:51:39', '::1', '1'),
(265, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-10 21:56:01', '::1', '1'),
(266, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-10 21:56:30', '::1', '1'),
(267, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-10 21:57:11', '::1', '1'),
(268, 3, 'Logout', 'User logged out successfully.', '2024-11-10 21:57:28', '::1', '1'),
(269, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-10 21:57:28', '::1', '1'),
(270, 3, 'Login', 'User logged in successfully.', '2024-11-13 16:41:41', '::1', '1'),
(271, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-13 16:48:45', '::1', '1'),
(272, 3, 'Database Restore', 'Database \'motherchildpharmacy\' restored by user.', '2024-11-13 19:35:06', '::1', '1'),
(273, 3, 'Product Update', 'User updated the details of a product. (ItemID: 2).', '2024-11-13 19:55:26', '::1', '1'),
(274, 3, 'Process Sales', 'User successfully processed a transaction (Invoice ID: IN-07).', '2024-11-13 19:55:38', '::1', '1'),
(275, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-13 20:40:35', '::1', '1'),
(276, 3, 'Product Update', 'User updated the details of a product. (ItemID: 2).', '2024-11-13 20:41:03', '::1', '1'),
(277, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 1).', '2024-11-13 20:44:56', '::1', '1'),
(278, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 1).', '2024-11-13 20:44:56', '::1', '1'),
(279, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-13 20:45:01', '::1', '1'),
(280, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-13 20:45:01', '::1', '1'),
(281, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-13 21:10:55', '::1', '1'),
(282, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-13 21:56:08', '::1', '1'),
(283, 3, 'Logout', 'User logged out successfully.', '2024-11-13 21:56:42', '::1', '1'),
(284, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-13 21:56:42', '::1', '1'),
(285, 3, 'Login', 'User failed to login (Incorrect password).', '2024-11-14 23:16:30', '::1', ''),
(286, 3, 'Login', 'User logged in successfully.', '2024-11-14 23:16:36', '::1', '1'),
(287, 3, 'Logout', 'User logged out successfully.', '2024-11-14 23:17:15', '::1', '1'),
(288, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-14 23:17:16', '::1', '1'),
(289, 3, 'Login', 'User logged in successfully.', '2024-11-26 16:02:25', '::1', '1'),
(290, 3, 'Logout', 'User logged out successfully.', '2024-11-26 16:08:21', '::1', '1'),
(291, 3, 'Automatic Backup', 'As the user was the last to log off, automatic database backup creation was executed successfully.', '2024-11-26 16:08:21', '::1', '1'),
(292, 3, 'Login', 'User logged in successfully.', '2024-11-27 12:32:57', '::1', '1'),
(293, 3, 'Stock Adjustment', 'Stock adjustment for ItemID: 2, LotNumber: 1H17359, New Quantity: 48, Adjustment: -1', '2024-11-28 18:51:13', '::1', '1'),
(294, 3, 'Stock Adjustment', 'Stock adjustment for ItemID: 2, LotNumber: 1H17359, New Quantity: 50, Adjustment: 2', '2024-11-28 18:58:20', '::1', '1'),
(295, 3, 'Process Sales', 'User successfully processed a transaction (Invoice ID: IN-08).', '2024-11-28 19:04:03', '::1', '1'),
(296, 3, 'Received Delivery', 'User successfully received delivery (Delivery ID: DE-05).', '2024-11-29 04:45:54', '::1', '1'),
(297, 3, 'Cancel Order', 'User successfully cancelled an order (OrderID: PO-04).', '2024-11-29 04:56:29', '::1', '1'),
(298, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-29 04:58:33', '::1', '1'),
(299, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-29 04:58:33', '::1', '1'),
(300, 3, 'Database Backup', 'Backup initiated for database \'motherchildpharmacy\' by user.', '2024-11-29 05:00:40', '::1', '1'),
(301, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-29 05:16:24', '::1', '1'),
(302, 3, 'Update Supplier', 'User updated a supplier (SupplierID: 2).', '2024-11-29 05:16:24', '::1', '1'),
(303, 3, 'Stock Adjustment', 'Stock adjustment for ItemID: 2, LotNumber: 1H17359, New Quantity: 46, Adjustment: 1', '2024-11-29 05:20:01', '::1', '1'),
(304, 3, 'Stock Adjustment', 'Stock adjustment for ItemID: 2, LotNumber: 1H17359, New Quantity: 50, Adjustment: 4', '2024-11-29 05:34:28', '::1', '1'),
(305, 3, 'Create Order', 'Created purchase order (OrderID: 8).', '2024-11-29 05:37:58', '::1', '1'),
(306, 3, 'Received Delivery', 'User successfully received delivery (Delivery ID: DE-06).', '2024-11-29 05:40:52', '::1', '1'),
(307, 3, 'Process Sales', 'User successfully processed a transaction (Invoice ID: IN-09).', '2024-11-29 05:46:06', '::1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `DeliveryID` int(11) NOT NULL,
  `PurchaseOrderID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `DeliveryDate` datetime DEFAULT current_timestamp(),
  `ReceivedBy` int(10) UNSIGNED NOT NULL,
  `TotalDeliveredItems` int(11) NOT NULL,
  `DeliveryStatus` enum('Pending','Back Order','Completed','Returned') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`DeliveryID`, `PurchaseOrderID`, `SupplierID`, `DeliveryDate`, `ReceivedBy`, `TotalDeliveredItems`, `DeliveryStatus`) VALUES
(1, 2, 1, '2024-10-27 18:52:56', 3, 50, 'Back Order'),
(2, 5, 1, '2024-11-05 22:24:45', 3, 100, 'Completed'),
(3, 6, 1, '2024-11-06 14:35:22', 3, 90, 'Completed'),
(4, 7, 2, '2024-11-06 15:55:46', 3, 30, 'Completed'),
(5, 2, 1, '2024-11-29 12:45:54', 3, 50, 'Completed'),
(6, 8, 1, '2024-11-29 13:40:52', 3, 50, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_items`
--

CREATE TABLE `delivery_items` (
  `ItemID` int(11) NOT NULL,
  `DeliveryID` int(11) NOT NULL,
  `LotNumber` varchar(50) NOT NULL,
  `ExpiryDate` date NOT NULL,
  `QuantityDelivered` int(11) NOT NULL,
  `Bonus` int(11) NOT NULL DEFAULT 0,
  `QuantityRemaining` int(11) NOT NULL,
  `NetAmount` float NOT NULL DEFAULT 0,
  `isExpired` enum('0','1','','') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_items`
--

INSERT INTO `delivery_items` (`ItemID`, `DeliveryID`, `LotNumber`, `ExpiryDate`, `QuantityDelivered`, `Bonus`, `QuantityRemaining`, `NetAmount`, `isExpired`) VALUES
(2, 1, '1H17359', '2025-03-28', 50, 5, 50, 400, '0'),
(2, 2, 'GG', '2026-11-05', 100, 0, 100, 900, '0'),
(2, 3, '123GG', '2025-11-06', 90, 5, 92, 1000, '0'),
(2, 5, '1HT222', '2027-11-29', 50, 0, 50, 450, '0'),
(3, 4, 'NFP11127', '2027-11-11', 30, 5, 3, 210, '0'),
(3, 6, 'NFP5002926', '2027-11-29', 50, 0, 50, 350, '0');

-- --------------------------------------------------------

--
-- Table structure for table `goodsissue`
--

CREATE TABLE `goodsissue` (
  `IssueID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Reason` text NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goodsissue`
--

INSERT INTO `goodsissue` (`IssueID`, `ItemID`, `Quantity`, `Reason`, `Timestamp`) VALUES
(2, 2, 48, 'Negative adjustment (-1) for lot: 1H17359', '2024-11-28 11:51:13'),
(3, 2, 50, 'Positive adjustment (+2) for lot: 1H17359', '2024-11-28 11:58:20'),
(4, 2, 46, 'Positive adjustment (+1) for lot: 1H17359', '2024-11-28 22:20:01'),
(5, 2, 50, 'Positive adjustment (+4) for lot: 1H17359', '2024-11-28 22:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `goodsreturn`
--

CREATE TABLE `goodsreturn` (
  `goodsReturnID` int(11) NOT NULL,
  `originalInvoiceID` int(11) NOT NULL,
  `newInvoiceID` int(11) NOT NULL,
  `returnDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`returnDetails`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ItemID` int(11) NOT NULL,
  `GenericName` varchar(255) DEFAULT NULL,
  `BrandName` varchar(255) DEFAULT NULL,
  `ItemType` varchar(50) DEFAULT NULL,
  `Mass` varchar(50) DEFAULT NULL,
  `UnitOfMeasure` varchar(20) DEFAULT NULL,
  `InStock` int(10) NOT NULL DEFAULT 0,
  `Ordered` int(10) NOT NULL DEFAULT 0,
  `ReorderLevel` int(11) NOT NULL DEFAULT 0,
  `PricePerUnit` decimal(10,2) DEFAULT NULL,
  `Discount` int(11) NOT NULL DEFAULT 0,
  `VAT_exempted` tinyint(4) NOT NULL DEFAULT 0,
  `SupplierID` int(11) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `Status` enum('Active','Inactive','Archived') NOT NULL DEFAULT 'Active',
  `ProductIcon` varchar(255) DEFAULT NULL,
  `ProductCode` varchar(50) DEFAULT NULL,
  `ExcessStock` int(10) NOT NULL DEFAULT 0,
  `Markup` decimal(10,2) NOT NULL DEFAULT 0.05
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ItemID`, `GenericName`, `BrandName`, `ItemType`, `Mass`, `UnitOfMeasure`, `InStock`, `Ordered`, `ReorderLevel`, `PricePerUnit`, `Discount`, `VAT_exempted`, `SupplierID`, `Notes`, `Status`, `ProductIcon`, `ProductCode`, `ExcessStock`, `Markup`) VALUES
(2, 'Biogesic', 'Paracetamol', 'Medicine', '500', 'Mg', 283, 0, 11, 9.45, 1, 0, 1, '', 'Active', 'products-icon/biogesic.png', '', 0, 0.05),
(3, 'Phenylephrine', 'Neozep Forte', 'Medicine', '500', 'Mg', 50, 0, 10, 7.35, 1, 0, 2, '', 'Active', 'products-icon/neozep.png', 'NeozepForte500mg', 0, 0.05),
(4, 'Ibuprofen', 'Advil', 'Medicine', '200', 'Mg', 0, 0, 0, 9.00, 1, 0, 1, '', 'Active', 'products-icon/Advil.png', 'AdvilIbuprofen200mg', 0, 0.05),
(5, 'Hyoscine Paracetamol', 'Buscopan Venus', 'Medicine', '500', 'Mg', 0, 0, 0, 40.00, 1, 0, 2, '', 'Active', 'products-icon/buscopanVenus.png', 'BuscopanVenus500Mg', 0, 0.05),
(6, 'Loperamide', 'Diatabs', 'Medicine', '2', 'Mg', 0, 0, 0, 7.50, 1, 0, NULL, '', 'Active', 'products-icon/Diatabs.png', 'DiatabsLoperamide2mg', 0, 0.05),
(7, 'Loperamide', 'Imodium', 'Medicine', '2', 'Mg', 0, 0, 0, 19.00, 1, 0, NULL, '', 'Active', 'products-icon/Imodium.png', 'ImodiumLoperamide2mg', 0, 0.05),
(8, 'Aluminum Hydroxide Magnesium Hydroxide Simeticone', 'Kremil-S', 'Medicine', '441', 'Mg', 0, 0, 0, 9.70, 1, 0, NULL, '', 'Archived', 'products-icon/kremilS.png', 'KremilS30mg', 0, 0.05),
(10, 'Bisacodyl', 'Dulcolax', 'Medicine', '5', 'Mg', 0, 0, 0, 25.70, 1, 0, NULL, '', 'Archived', 'products-icon/dulcolax.png', 'Dulcolax5mg', 0, 0.05),
(11, 'Ibuprofen', 'Medicol Advance', 'Medicine', '200', 'Mg', 0, 0, 0, 6.75, 1, 0, NULL, '', 'Archived', 'products-icon/medicol.png', 'MedicolAdvance200mg', 0, 0.05),
(12, 'Product', 'Sample', 'Medicine', '500', 'Mg', 0, 0, 0, 5.50, 1, 1, NULL, '', 'Archived', '../resources/img/default_Icon.png', 'ALGN5829921', 0, 0.05);

-- --------------------------------------------------------

--
-- Table structure for table `productlot`
--

CREATE TABLE `productlot` (
  `LotNumber` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ExpirationDate` date NOT NULL,
  `isExpired` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `ItemID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_suppliers`
--

INSERT INTO `product_suppliers` (`ItemID`, `SupplierID`) VALUES
(2, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorders`
--

CREATE TABLE `purchaseorders` (
  `PurchaseOrderID` int(11) NOT NULL,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `SupplierID` int(11) NOT NULL,
  `AccountID` int(10) UNSIGNED NOT NULL,
  `OrderDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`OrderDetails`)),
  `TotalItems` int(11) NOT NULL,
  `ReceivedItems` int(11) NOT NULL DEFAULT 0,
  `NetAmount` decimal(10,2) DEFAULT NULL,
  `Status` enum('Back Order','Pending','Received','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`PurchaseOrderID`, `OrderDate`, `SupplierID`, `AccountID`, `OrderDetails`, `TotalItems`, `ReceivedItems`, `NetAmount`, `Status`) VALUES
(1, '2024-10-10 10:09:03', 2, 3, '{\"1\":{\"itemID\":\"3\",\"qty\":100},\"2\":{\"itemID\":\"5\",\"qty\":200}}', 300, 0, NULL, 'Cancelled'),
(2, '2024-10-16 10:45:15', 1, 3, '{\"1\":{\"itemID\":\"2\",\"qty\":100}}', 100, 100, NULL, 'Received'),
(3, '2024-10-21 22:31:00', 2, 3, '{\"1\":{\"itemID\":\"3\",\"qty\":100},\"2\":{\"itemID\":\"5\",\"qty\":50}}', 150, 0, NULL, 'Cancelled'),
(4, '2024-10-27 23:18:11', 2, 3, '{\"1\":{\"itemID\":\"3\",\"qty\":20}}', 20, 0, NULL, 'Cancelled'),
(5, '2024-11-05 21:30:15', 1, 3, '{\"1\":{\"itemID\":\"2\",\"qty\":100}}', 100, 100, NULL, 'Received'),
(6, '2024-11-06 14:34:59', 1, 3, '{\"1\":{\"itemID\":\"2\",\"qty\":90}}', 90, 90, NULL, 'Received'),
(7, '2024-11-06 15:54:45', 2, 3, '{\"1\":{\"itemID\":\"3\",\"qty\":30}}', 30, 30, NULL, 'Received'),
(8, '2024-11-29 13:37:58', 1, 3, '{\"1\":{\"itemID\":\"3\",\"qty\":50}}', 50, 50, NULL, 'Received');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `InvoiceID` int(11) NOT NULL,
  `SaleDate` datetime DEFAULT current_timestamp(),
  `AccountID` int(10) UNSIGNED DEFAULT NULL,
  `SalesDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`SalesDetails`)),
  `TotalItems` int(11) NOT NULL,
  `Subtotal` decimal(10,2) DEFAULT 0.00,
  `Tax` decimal(10,2) DEFAULT 0.00,
  `vatable_sales` decimal(10,2) NOT NULL,
  `vat_exempt_sales` decimal(10,2) NOT NULL,
  `Discount` decimal(10,2) DEFAULT 0.00,
  `NetAmount` decimal(10,2) GENERATED ALWAYS AS (`Subtotal` - `Discount` - `RefundAmount`) STORED,
  `AmountPaid` decimal(10,2) DEFAULT 0.00,
  `AmountChange` decimal(10,2) GENERATED ALWAYS AS (`AmountPaid` - `NetAmount`) STORED,
  `PaymentMethod` enum('Cash','GCash') NOT NULL,
  `Status` enum('Sales','Returned','Return/Exchange','ReturnedForExchange') NOT NULL,
  `RefundAmount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`InvoiceID`, `SaleDate`, `AccountID`, `SalesDetails`, `TotalItems`, `Subtotal`, `Tax`, `vatable_sales`, `vat_exempt_sales`, `Discount`, `AmountPaid`, `PaymentMethod`, `Status`, `RefundAmount`) VALUES
(1, '2024-09-29 01:34:29', 3, '{\n	\"1\":{\n		\"itemID\":\"2\",\n		\"qty\":5,\n		\"price\":\"9.00\"\n	},\n	\"2\":{\n		\"itemID\":\"3\",\n		\"qty\":3,\n		\"price\":\"7.35\"\n	}\n}', 8, 67.05, 7.18, 0.00, 0.00, 0.00, 70.00, 'Cash', 'Sales', 0.00),
(2, '2024-10-05 23:06:36', 3, '{\"1\":{\"itemID\":\"2\",\"qty\":9,\"price\":\"9.45\"}}\r\n', 9, 85.05, 9.11, 0.00, 0.00, 0.00, 100.00, 'Cash', 'Sales', 0.00),
(3, '2024-11-09 01:49:59', 3, '{\"1\":{\"itemID\":\"2\",\"qty\":1,\"price\":\"9.00\"}}\r\n', 1, 9.00, 1.08, 0.00, 0.00, 0.00, 11.00, 'Cash', 'Sales', 0.00),
(4, '2024-11-09 17:28:12', 3, '{\"1\":{\"itemID\":\"3\",\"qty\":1,\"price\":\"7.35\"}}\r\n', 1, 7.35, 0.88, 0.00, 0.00, 0.00, 8.00, 'Cash', 'Sales', 0.00),
(5, '2024-11-09 20:12:43', 3, '{\"1\":{\"itemID\":\"2\",\"qty\":2,\"price\":\"9.00\"}, \"2\":{\"itemID\":\"3\",\"qty\":1,\"price\":\"7.35\"}}\n', 3, 25.35, 2.72, 0.00, 0.00, 7.24, 19.00, 'Cash', 'Sales', 0.00),
(6, '2024-11-10 02:45:09', 3, '{\"1\":{\"itemID\":\"3\",\"qty\":25,\"price\":\"7.35\"}}', 25, 183.75, 19.69, 0.00, 0.00, 0.00, 184.00, 'Cash', 'Sales', 0.00),
(7, '2024-11-14 03:55:38', 3, '{\"1\":{\"itemID\":\"2\",\"qty\":5,\"price\":\"75.00\"}}', 5, 375.00, 40.18, 334.82, 0.00, 0.00, 400.00, 'Cash', 'Sales', 0.00),
(8, '2024-11-29 03:04:03', 3, '{\"1\":{\"itemID\":\"2\",\"qty\":5,\"price\":\"9.45\"}}', 5, 47.25, 5.06, 42.19, 0.00, 0.00, 47.25, 'Cash', 'Sales', 0.00),
(9, '2024-11-29 13:46:06', 3, '{\"1\":{\"itemID\":\"3\",\"qty\":5,\"price\":\"7.35\"}}', 5, 36.75, 3.94, 32.81, 0.00, 0.00, 40.00, 'Cash', 'Sales', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seniorlog`
--

CREATE TABLE `seniorlog` (
  `seniorID` varchar(999) NOT NULL,
  `idType` varchar(999) NOT NULL,
  `fullName` varchar(999) NOT NULL,
  `InvoiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `AgentName` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(255) NOT NULL DEFAULT '''N/A''',
  `Status` enum('Active','Inactive','Archived') DEFAULT 'Active',
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `SupplierName`, `AgentName`, `Phone`, `Email`, `Status`, `Notes`) VALUES
(1, 'Metro Drug Inc. (MDI)', 'Agent MDI', '09171239183', 'mdi@metrodrug.com.ph', 'Active', NULL),
(2, 'Zuellig Pharma Corporation', 'Agent K', '09221262941', 'zpspeakup@zuelligpharma.com', 'Active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `AccountID` int(10) UNSIGNED NOT NULL,
  `employeeName` varchar(255) NOT NULL,
  `employeeLName` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `accountName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `picture` text NOT NULL DEFAULT 'profile_icon.png',
  `dateCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `connected` enum('1','0') NOT NULL DEFAULT '0',
  `SuppliersPerms` enum('on','off') NOT NULL DEFAULT 'off',
  `TransactionsPerms` enum('on','off') NOT NULL DEFAULT 'off',
  `InventoryPerms` enum('on','off') NOT NULL DEFAULT 'off',
  `POSPerms` enum('on','off') NOT NULL DEFAULT 'off',
  `REPerms` enum('on','off') NOT NULL DEFAULT 'off',
  `POPerms` enum('on','off') NOT NULL DEFAULT 'off',
  `UsersPerms` enum('on','off') NOT NULL DEFAULT 'off'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`AccountID`, `employeeName`, `employeeLName`, `role`, `accountName`, `password`, `picture`, `dateCreated`, `status`, `connected`, `SuppliersPerms`, `TransactionsPerms`, `InventoryPerms`, `POSPerms`, `REPerms`, `POPerms`, `UsersPerms`) VALUES
(2, 'Sayra', 'Jackson', 'Admin', 'E002_sjackson', 'jackson-e002', 'Chichi.jpg', '2024-09-22 21:27:48', 'Active', '0', 'on', 'on', 'on', 'on', 'on', 'on', 'on'),
(3, 'Lance', 'Tiangco', 'Admin', 'E003_ltiangco', 'lancetiangco26!!', 'dubu2.jpg', '2024-09-01 23:42:57', 'Active', '1', 'on', 'on', 'on', 'on', 'on', 'on', 'on'),
(4, 'Aileen', 'Castro', 'Admin', 'E004_acastro', 'castro-e004', 'owner.png', '2024-10-14 14:44:48', 'Active', '0', 'on', 'on', 'on', 'on', 'on', 'on', 'on'),
(5, 'The', 'Shrek', 'Pharmacy Assistant', 'E005_tshrek', 'test-e005', 'Shrek.png', '2024-10-14 18:59:03', 'Inactive', '0', 'off', 'on', 'off', 'on', 'on', 'off', 'off'),
(6, 'Cashier', 'Ashiera', 'Pharmacy Assistant', 'E006_cashiera', 'ashiera-e006', 'cashier.png', '2024-10-29 22:13:40', 'Active', '0', 'off', 'on', 'off', 'on', 'on', 'off', 'off');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audittrail`
--
ALTER TABLE `audittrail`
  ADD PRIMARY KEY (`auditID`),
  ADD KEY `AT_ForeignKey_ItemID` (`AccountID`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`DeliveryID`),
  ADD KEY `FK_PurchaseOrderID` (`PurchaseOrderID`),
  ADD KEY `FK_SupplierID` (`SupplierID`),
  ADD KEY `FK_ReceivedBy` (`ReceivedBy`);

--
-- Indexes for table `delivery_items`
--
ALTER TABLE `delivery_items`
  ADD PRIMARY KEY (`ItemID`,`DeliveryID`,`LotNumber`),
  ADD UNIQUE KEY `LotNumber` (`LotNumber`),
  ADD KEY `FK_DeliveryID` (`DeliveryID`);

--
-- Indexes for table `goodsissue`
--
ALTER TABLE `goodsissue`
  ADD PRIMARY KEY (`IssueID`),
  ADD KEY `GI_ForeignKey_ItemID` (`ItemID`);

--
-- Indexes for table `goodsreturn`
--
ALTER TABLE `goodsreturn`
  ADD KEY `GR_ForeignKey_InvoiceID` (`originalInvoiceID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `ForeignKey_SupplierID` (`SupplierID`);

--
-- Indexes for table `productlot`
--
ALTER TABLE `productlot`
  ADD PRIMARY KEY (`LotNumber`),
  ADD KEY `PL_ForeignKey_ItemID` (`ItemID`);

--
-- Indexes for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`ItemID`,`SupplierID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD PRIMARY KEY (`PurchaseOrderID`),
  ADD KEY `PO_ForeignKey_AccountID` (`AccountID`),
  ADD KEY `PO_ForeignKey_SupplierID` (`SupplierID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `ForeignKey_AccountID` (`AccountID`);

--
-- Indexes for table `seniorlog`
--
ALTER TABLE `seniorlog`
  ADD KEY `AT_ForeignKey_InvoiceID` (`InvoiceID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`),
  ADD UNIQUE KEY `SupplierName` (`SupplierName`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`AccountID`),
  ADD UNIQUE KEY `accountName` (`accountName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audittrail`
--
ALTER TABLE `audittrail`
  MODIFY `auditID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `DeliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `goodsissue`
--
ALTER TABLE `goodsissue`
  MODIFY `IssueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `PurchaseOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `AccountID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audittrail`
--
ALTER TABLE `audittrail`
  ADD CONSTRAINT `AT_ForeignKey_ItemID` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`);

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `FK_PurchaseOrderID` FOREIGN KEY (`PurchaseOrderID`) REFERENCES `purchaseorders` (`PurchaseOrderID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ReceivedBy` FOREIGN KEY (`ReceivedBy`) REFERENCES `users` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `delivery_items`
--
ALTER TABLE `delivery_items`
  ADD CONSTRAINT `FK_DeliveryID` FOREIGN KEY (`DeliveryID`) REFERENCES `deliveries` (`DeliveryID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `goodsissue`
--
ALTER TABLE `goodsissue`
  ADD CONSTRAINT `GI_ForeignKey_ItemID` FOREIGN KEY (`ItemID`) REFERENCES `inventory` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `goodsreturn`
--
ALTER TABLE `goodsreturn`
  ADD CONSTRAINT `GR_ForeignKey_InvoiceID` FOREIGN KEY (`originalInvoiceID`) REFERENCES `sales` (`InvoiceID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `ForeignKey_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `productlot`
--
ALTER TABLE `productlot`
  ADD CONSTRAINT `PL_ForeignKey_ItemID` FOREIGN KEY (`ItemID`) REFERENCES `inventory` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD CONSTRAINT `product_suppliers_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `inventory` (`ItemID`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_suppliers_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`) ON DELETE CASCADE;

--
-- Constraints for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD CONSTRAINT `PO_ForeignKey_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `PO_ForeignKey_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `ForeignKey_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `seniorlog`
--
ALTER TABLE `seniorlog`
  ADD CONSTRAINT `AT_ForeignKey_InvoiceID` FOREIGN KEY (`InvoiceID`) REFERENCES `sales` (`InvoiceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
