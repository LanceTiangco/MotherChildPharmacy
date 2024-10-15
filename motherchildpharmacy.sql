-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 06:00 AM
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
(35, 3, 'Logout', 'User logged out successfully.', '2024-10-15 04:00:13', '::1', '1');

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
  `InStock` int(10) DEFAULT NULL,
  `Ordered` int(10) NOT NULL,
  `ReorderLevel` int(11) DEFAULT NULL,
  `PricePerUnit` decimal(10,2) DEFAULT NULL,
  `Discount` varchar(3) DEFAULT NULL CHECK (`Discount` in ('Yes','No')),
  `SupplierID` int(11) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `Status` enum('Active','Inactive','Archived') NOT NULL DEFAULT 'Active',
  `ProductIcon` varchar(255) DEFAULT NULL,
  `ProductCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ItemID`, `GenericName`, `BrandName`, `ItemType`, `Mass`, `UnitOfMeasure`, `InStock`, `Ordered`, `ReorderLevel`, `PricePerUnit`, `Discount`, `SupplierID`, `Notes`, `Status`, `ProductIcon`, `ProductCode`) VALUES
(2, 'Biogesic', 'Paracetamol', 'Medicine', '100', 'Milligrams', 5, 0, NULL, 200.00, NULL, 1, '', 'Active', 'products-icon/biogesic.png', 'ParacetamolBiogesic100mg'),
(3, 'Phenylephrine', 'Neozep Forte', 'Medicine', '500', 'Milligrams', 3, 0, NULL, 300.00, NULL, 2, '', 'Active', 'products-icon/neozep.png', 'NeozepForte500mg'),
(4, 'Ibuprofen', 'Advil', 'Medicine', '200', 'Milligrams', 0, 0, NULL, 299.00, NULL, 1, '', 'Active', 'products-icon/Advil.png', 'AdvilIbuprofen200mg'),
(5, 'Hyoscine Paracetamol', 'Buscopan Venus', 'Medicine', '500', 'Milligrams', 0, 0, NULL, 499.00, NULL, 2, '', 'Active', 'products-icon/buscopanVenus.png', 'BuscopanVenus500Mg'),
(6, 'Loperamide', 'Diatabs', 'Medicine', '2', 'Milligrams', 0, 0, NULL, 149.00, NULL, NULL, '', '', 'products-icon/Diatabs.png', 'DiatabsLoperamide2mg'),
(7, 'Loperamide', 'Imodium', 'Medicine', '2', 'Milligrams', 0, 0, NULL, 149.00, NULL, NULL, '', '', 'products-icon/Imodium.png', 'ImodiumLoperamide2mg'),
(8, 'Aluminum Hydroxide Magnesium Hydroxide Simeticone', 'Kremil-S', 'Medicine', '30', 'Milligrams', 0, 0, NULL, 499.00, NULL, NULL, '', '', 'products-icon/kremilS.png', 'KremilS30mg'),
(10, 'Bisacodyl', 'Dulcolax', 'Medicine', '5', 'Milligrams', 0, 0, NULL, 149.00, NULL, NULL, '', '', 'products-icon/dulcolax.png', 'Dulcolax5mg'),
(11, 'Ibuprofen', 'Medicol Advance', 'Medicine', '200', 'Milligrams', 0, 0, NULL, 200.00, NULL, NULL, '', '', 'products-icon/medicol.png', 'MedicolAdvance200mg');

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
-- Table structure for table `purchaseorders`
--

CREATE TABLE `purchaseorders` (
  `PurchaseOrderID` int(11) NOT NULL,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `SupplierID` int(11) NOT NULL,
  `AccountID` int(10) UNSIGNED NOT NULL,
  `OrderDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`OrderDetails`)),
  `TotalItems` int(11) NOT NULL,
  `NetAmount` decimal(10,2) DEFAULT NULL,
  `Status` enum('Pending','Received','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`PurchaseOrderID`, `OrderDate`, `SupplierID`, `AccountID`, `OrderDetails`, `TotalItems`, `NetAmount`, `Status`) VALUES
(1, '2024-10-10 10:09:03', 2, 3, '{\"1\":{\"itemID\":\"3\",\"qty\":100},\"2\":{\"itemID\":\"5\",\"qty\":200}}', 300, NULL, 'Cancelled');

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
  `Discount` decimal(10,2) DEFAULT 0.00,
  `NetAmount` decimal(10,2) GENERATED ALWAYS AS (`Subtotal` - `Discount` + `Tax`) STORED,
  `AmountPaid` decimal(10,2) DEFAULT 0.00,
  `AmountChange` decimal(10,2) GENERATED ALWAYS AS (`AmountPaid` - `NetAmount`) STORED,
  `PaymentMethod` enum('Cash','GCash') NOT NULL,
  `Status` enum('Sales','Return','Return/Exchange') NOT NULL,
  `RefundAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`InvoiceID`, `SaleDate`, `AccountID`, `SalesDetails`, `TotalItems`, `Subtotal`, `Tax`, `Discount`, `AmountPaid`, `PaymentMethod`, `Status`, `RefundAmount`) VALUES
(1, '2024-09-29 01:34:29', 3, '{\r\n	\"1\":{\r\n		\"itemID\":\"2\",\r\n		\"qty\":5\r\n	},\r\n	\"2\":{\r\n		\"itemID\":\"3\",\r\n		\"qty\":3\r\n	}\r\n}', 8, 1900.00, 228.00, 0.00, 2500.00, 'Cash', 'Sales', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `AgentName` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Active','Inactive','Archived') DEFAULT 'Active',
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `SupplierName`, `AgentName`, `Phone`, `Email`, `Status`, `Notes`) VALUES
(1, 'Metro Drug Inc. (MDI)', 'Agent MDI', '(02) 8539 4342', 'mdi@metrodrug.com.ph', 'Active', ''),
(2, 'Zuellig Pharma Corporation', 'Agent K', '+63 (2) 908 2222', 'zpspeakup@zuelligpharma.com', 'Active', NULL);

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
(3, 'Lance', 'Tiangco', 'Admin', 'E003_ltiangco', 'lancetiangco26!!', 'dubu2.jpg', '2024-09-01 23:42:57', 'Active', '0', 'on', 'on', 'on', 'on', 'on', 'on', 'on'),
(4, 'Aileen', 'Castro', 'Admin', 'E004_acastro', 'castro-e004', 'owner.png', '2024-10-14 14:44:48', 'Active', '0', 'on', 'on', 'on', 'on', 'on', 'on', 'on'),
(5, 'c', 'test', 'Pharmacy Assistant', 'E005_ctest', 'test-e005', 'Shrek.png', '2024-10-14 18:59:03', 'Active', '0', 'off', 'on', 'off', 'on', 'on', 'off', 'off');

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
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`);

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
  MODIFY `auditID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `goodsissue`
--
ALTER TABLE `goodsissue`
  MODIFY `IssueID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `PurchaseOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `AccountID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audittrail`
--
ALTER TABLE `audittrail`
  ADD CONSTRAINT `AT_ForeignKey_ItemID` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
