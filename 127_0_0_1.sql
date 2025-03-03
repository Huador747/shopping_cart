-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2025 at 06:46 PM
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
-- Database: `mon_aft`
--
CREATE DATABASE IF NOT EXISTS `mon_aft` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mon_aft`;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `FilesID` int(4) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `FilesName` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`FilesID`, `Name`, `FilesName`) VALUES
(1, 'BTS', '2.jpg'),
(2, 'BUS', '4.png'),
(3, 'seventeen', '4.png'),
(4, 'nct127', '1.png'),
(5, 'boynextdoor', '3.jpg'),
(6, 'nct127', '1.png'),
(7, 'prim', '2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`FilesID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `FilesID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'mon_aft', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"orders\",\"orders_detail\",\"product\"],\"table_structure[]\":[\"orders\",\"orders_detail\",\"product\"],\"table_data[]\":[\"orders\",\"orders_detail\",\"product\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"shopping_cart\",\"table\":\"orders\"},{\"db\":\"shopping_cart\",\"table\":\"products\"},{\"db\":\"mon_aft\",\"table\":\"files\"},{\"db\":\"mon_aft\",\"table\":\"product\"},{\"db\":\"mon_aft\",\"table\":\"orders_detail\"},{\"db\":\"mon_aft\",\"table\":\"employee\"},{\"db\":\"mon_aft\",\"table\":\"webboard\"},{\"db\":\"mon_aft\",\"table\":\"orders\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-03-02 17:22:14', '{\"Console\\/Mode\":\"show\",\"Console\\/Height\":91.98949999999999}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `project4`
--
CREATE DATABASE IF NOT EXISTS `project4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project4`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'panyawat@gmail.com', '$2y$10$mozNjBL2EIosgpMJ5/D5ZOmf5m7/bPj/nIbrhnISF98fka6NsqHku'),
(2, 'panyawat@gami', '$2y$10$0PKNfqFQoMhvkIAWeVpHqO8e758tcNo2ScWqcx/e3oXBQ16iIjXMO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `project4 (1)`
--
CREATE DATABASE IF NOT EXISTS `project4 (1)` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project4 (1)`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `locker_id` varchar(20) NOT NULL,
  `baggage_count` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_name`, `locker_id`, `baggage_count`, `duration`, `start_time`, `end_time`, `payment_status`, `status`) VALUES
(1, 'jjj', '10', 1, 2, '2025-02-26 07:19:00', '2025-02-26 09:19:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(2, 'jjj', '10', 1, 2, '2025-02-26 07:19:00', '2025-02-26 09:19:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(3, 'jjj', '01', 1, 2, '2025-02-26 07:22:00', '2025-02-26 09:22:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(4, 'jjj', '01', 1, 2, '2025-02-26 07:23:00', '2025-02-26 09:23:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(5, 'kkk', '17', 1, 3, '2025-02-26 08:26:00', '2025-02-26 11:26:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(6, 'bam', '16', 2, 4, '2025-02-26 11:33:00', '2025-02-26 04:33:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(7, 'bammy', '16', 1, 2, '2025-02-26 09:37:00', '2025-02-26 11:37:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(8, 'bambam', '17', 2, 3, '2025-02-27 07:41:00', '2025-02-27 09:42:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(9, 'bambam', '01', 2, 3, '2025-02-26 07:51:00', '2025-02-26 10:51:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(10, 'gg', '12', 2, 6, '2025-02-26 20:14:00', '2025-02-26 14:14:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(11, 'แบม', '01', 2, 2, '2025-02-26 22:51:00', '2025-02-26 12:51:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(12, 'น้ำอิง', '20', 2, 3, '2025-02-26 21:53:00', '2025-02-26 12:53:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(13, 'ปริมคุง', '10', 3, 9, '2025-02-26 22:03:00', '2025-02-26 19:03:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(14, 'ปอฝ้าย', '15', 2, 8, '2025-02-26 22:06:00', '2025-02-26 17:07:00', 'รอการชำระเงิน', 'กำลังใช้งาน'),
(15, 'อิงอิง', '20', 1, 2, '2025-02-27 07:02:00', '2025-02-27 09:02:00', '', ''),
(16, 'ปริมปริม', '14', 3, 3, '2025-02-27 09:24:00', '2025-02-27 23:24:00', '', ''),
(17, 'ปริมปริม', '14', 3, 2, '2025-02-27 06:28:00', '2025-02-27 01:28:00', '', ''),
(18, 'bee', '18', 3, 8, '2025-02-27 15:22:00', '2025-02-27 23:22:00', '', ''),
(19, 'pim', '16', 2, 6, '2025-02-27 15:27:00', '2025-02-27 21:27:00', '', ''),
(20, 'ปอฝ้าย', '20', 2, 4, '2025-02-27 16:16:00', '2025-02-27 20:16:00', '', ''),
(21, 'numing', '20', 2, 5, '2025-02-27 16:46:00', '2025-02-27 21:46:00', '', ''),
(22, 'lol', '14', 2, 7, '2025-02-27 17:00:00', '2025-02-28 00:00:00', '', ''),
(23, 'พิม ว่างมาก', '20', 1, 6, '2025-02-27 20:34:00', '2025-02-28 02:34:00', '', ''),
(24, 'งานเยอะ เอาแต่นอน', '20', 2, 4, '2025-02-27 20:39:00', '2025-02-28 00:39:00', '', ''),
(25, 'mink kkk', '19', 1, 5, '2025-02-27 21:09:00', '2025-02-28 02:09:00', '', ''),
(26, 'ง่วงนอนสุดๆ', '08', 1, 3, '2025-02-27 21:26:00', '2025-02-28 00:26:00', '', ''),
(27, 'อยากนอนมากๆ', '06', 2, 6, '2025-02-27 21:31:00', '2025-02-28 03:31:00', '', ''),
(28, 'จุงจุง', '09', 2, 5, '2025-02-27 22:13:00', '2025-02-28 03:13:00', '', ''),
(29, 'bb', '12', 2, 1, '2025-02-27 23:07:00', '2025-02-28 00:07:00', '', ''),
(30, 'ปีใหม่', '16', 3, 6, '2025-02-27 23:26:00', '2025-02-28 05:26:00', '', ''),
(31, 'ลิง', '19', 2, 3, '2025-02-27 23:32:00', '2025-02-28 02:32:00', 'ชำระเงินแล้ว', ''),
(32, 'น้อย', '17', 1, 5, '2025-02-27 23:35:00', '2025-02-28 04:35:00', 'ชำระเงินแล้ว', 'กำลังใช้งาน'),
(33, 'momojaeg', '15', 1, 2, '2025-02-27 23:40:00', '2025-02-28 01:40:00', 'ชำระเงินแล้ว', 'กำลังใช้งาน');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirm_password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `first_name`, `last_name`, `phone_number`, `email`, `password`, `confirm_password`, `created_at`) VALUES
(1, '', 'คุง', '0981234567', 'ppbg@gmail.com', '123456', '123456', '2025-02-27 09:11:51'),
(2, '', 'จีนพุด', '0812345678', 'aom@gmail.com', '098765', '098765', '2025-02-27 09:14:55'),
(3, '', 'คิมม่อม', '0987654321', 'kimmon@gmail.com', '567890', '567890', '2025-02-27 09:16:34'),
(4, '', 'ggggg', '0234567890', 'fd@gmail.com', '6789078', '6789078', '2025-02-27 09:56:41'),
(5, '', 'อยากนอนต่อ', '0954478781', 'ppf@gmail.com', '123456', '123456', '2025-02-27 14:21:11'),
(7, 'bar', 'bi', '0987456123', 'teetee@gmail.com', '789456', '789456', '2025-02-27 14:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'ppbb@example.com', 'password123456'),
(2, 'oppo@example.com', 'password456789'),
(3, 'ddd@example.com', 'password789123'),
(4, 'nong@example.com', 'password890122'),
(5, 'ning@example.com', 'password555555'),
(6, 'bee@example.com', 'password232323'),
(7, 'top@example.com', 'password565656'),
(8, 'miv@example.com', 'password089764'),
(9, 'min@example.com', 'password084976'),
(10, 'play@example.com', 'password767676'),
(11, 'ppbb@gmail.com', NULL),
(12, 'pkl@gmail.com', NULL),
(13, 'pg@gmail.com', NULL),
(14, 'lovf@gmail.com', NULL),
(15, 'lop@gmail.com', NULL),
(16, 'poo@gmail.com', NULL),
(17, 'lko@gmail.com', NULL),
(18, 'pop@gmail.com', NULL),
(19, 'play@gmail.com', NULL),
(20, 'wonwoo@gmail.com', NULL),
(21, 'dino@gmail.com', NULL),
(22, 'goh@gmail.com', NULL),
(23, 'bto@gmail.com', NULL),
(24, 'glo@gmail.com', '85757567'),
(25, 'momo@gmail.com', '1234567'),
(26, 'huo@gmail.com', '678595959'),
(27, 'gggg@gmail.com', '875757575'),
(28, 'wer@gmail.com', '345678'),
(29, 'dg@gmail.com', '5678904'),
(30, 'hot@gmail.com', '123456'),
(31, 'aj@gmail.com', '789456'),
(32, 'dex@gmail.com', '789456'),
(33, 'pipi@gmail.com', '789456'),
(34, 'kk@gmail.com', '$2y$10$gzJgsrJODRRSHCqdR.S/VOb2qsMyNZGErDhxGqfgu4mkBCXpsAcAe'),
(35, 'pim@gmail.com', '232323'),
(36, 'bam@gmail.com', '123456'),
(37, 'hhh@gmail.com', '123456'),
(38, 'yy@gmail.com', '123456'),
(39, 'users@gmail.com', '123456'),
(40, 'gg@gmail.com', '121324'),
(41, 'hgo@gmail.com', '456123'),
(42, 'gh@gmail.com', '254613'),
(43, 'yg@gmail.com', '123456'),
(44, 'vee@gmail.com', '1234796'),
(45, 'LOL23@gamil.com', '08564777'),
(46, 'ggggg@gmail.com', '123456'),
(47, 'fdd@gmail.com', '123456'),
(48, 'ploo@gamil.com', '123456'),
(49, 'poll45@gmail.com', '258796'),
(50, 'fhghg@gmail.com', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- Database: `shopping_cart`
--
CREATE DATABASE IF NOT EXISTS `shopping_cart` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shopping_cart`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_status` varchar(50) DEFAULT 'pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank`
--

CREATE TABLE `tbl_bank` (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(100) NOT NULL,
  `b_type` varchar(100) NOT NULL,
  `b_number` varchar(20) NOT NULL,
  `b-owner` varchar(100) NOT NULL,
  `bn_name` varchar(100) NOT NULL,
  `b_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member`
--

CREATE TABLE `tbl_member` (
  `member_id` int(11) NOT NULL,
  `m_user` varchar(20) NOT NULL,
  `m_pass` varchar(20) NOT NULL,
  `m_level` varchar(50) NOT NULL,
  `m_name` varchar(100) NOT NULL,
  `m_email` varchar(100) NOT NULL,
  `m_tel` varchar(20) NOT NULL,
  `m_address` varchar(200) NOT NULL,
  `m_img` varchar(250) NOT NULL,
  `date_save` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_member`
--

INSERT INTO `tbl_member` (`member_id`, `m_user`, `m_pass`, `m_level`, `m_name`, `m_email`, `m_tel`, `m_address`, `m_img`, `date_save`) VALUES
(1, 'admin', 'admin', 'admin', 'admin_dev', 'devtai@gmail.com', '0983738651', 'กรุงเทพมหานคร', '92306749720210628_000204.png', '2021-06-01 19:04:28'),
(12, 'trcdro', '123456', 'member', 'trcdr', 'trcdro@gmail.com', '0628696397', '25', '69040226020250222_022420.png', '2025-02-21 18:47:13'),
(13, 'trcdradmin', '123', 'admin', 'teerachai', 'trcdro@gmail.com', '0628696397', '23/2', '12437071720250227_035446.png', '2025-02-26 20:54:46'),
(14, 'aom', '123456', 'member', 'aom', 'aom@gmail.com', '123', '123', '73049912720250227_162529.jpg', '2025-02-27 09:25:29'),
(15, 'panyawat', '123456', 'member', 'panyawat', 'panyawatkrutnak@gmail.com', '0908539822', 'กรุงเทพ', '', '2025-02-28 14:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int(20) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `type_id` int(20) NOT NULL,
  `p_spec` text NOT NULL,
  `p_detail` text NOT NULL,
  `p_img` varchar(200) NOT NULL,
  `p_price` int(20) NOT NULL,
  `p_qty` varchar(20) NOT NULL,
  `p_unit` varchar(20) NOT NULL,
  `p_view` int(20) NOT NULL,
  `datesave` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`p_id`, `p_name`, `type_id`, `p_spec`, `p_detail`, `p_img`, `p_price`, `p_qty`, `p_unit`, `p_view`, `datesave`) VALUES
(2, 'Daiwa STEEZ SV TW', 5, 'ลูกปืนรอก : 12 CRBB + 1	\r\nอัตราทดเฟือง  : 7.8:1\r\nอัตรากรอสายต่อ 1 รอบ : 30.7 เมตร\r\nแรงดึงสูงสุด 11 กิโลกรัม\r\nน้ำหนัก : 28.3 กรัม\r\nอัตราการจุสายเอ็น : 14/100 , 16/90 (หน้าตัดสาย/เมตร)\r\nอัตราการจุสายถัก : 30/115, 40/85  (หน้าตัดสาย/เมตร)\r\n', 'สัมผัสประสบการณ์กับ Daiwa Steez SV รอกเบทแคสติ้งที่เป็นการปฏิวัติใหม่ในการตกปลา การออกแบบตัวบอดี้ที่กระชับใหม่ช่วยให้คุณรู้สึกสะดวกสบายและทนทาน ซึ่งมั่นใจได้ว่าคุณสามารถตกปลาได้ตลอดทั้งวันโดยไม่รู้สึกเมื่อยล้า เทคโนโลยี HYPERDRIVE DESIGN ช่วยเพิ่มพลังและประสิทธิภาพในการตกปลา ทำให้การโยนสายไกลขึ้นและการดึงลื่นไหลขึ้น ขอบคุณ A7075 SV BOOST Spool ที่ช่วยลดการหมุนของสปูลและเพิ่มความแม่นยำในการโยน ซึ่งจะช่วยให้คุณได้เปรียบในการตกปลาในทุกสภาพแวดล้อม\r\n\r\nระบบ T-Wing System (TWS) ที่ได้รับการปรับปรุงช่วยลดแรงเสียดทานของสาย ทำให้ไม่เกิดการพันกันระหว่างการโยนและการดึงสาย ตัวเครื่องทำจากแมกนีเซียมทั้งเฟรมและแผ่นข้าง ช่วยให้ Daiwa Steez SV มีความแข็งแกร่งและทนทาน แต่ยังคงน้ำหนักเบาได้อย่างน่าประทับใจ\r\n\r\nควบคุมประสบการณ์การตกปลาของคุณด้วยระบบ Ultimate Tournament Drag (UTD) ที่ให้ความลื่นไหลและความดันเบรกที่เสถียรที่สุด มือจับแบบ 90 มม. ที่ออกแบบมาให้สะดวกในการจับและควบคุมช่วยให้คุณมั่นใจในทุกการเคลื่อนไหว การตกปลาในทุก ๆ นาทีจะเต็มไปด้วยความสนุกสนานไม่ว่าจะเป็นนักตกปลามือโปรหรือนักตกปลามือใหม่ Daiwa Steez SV จะยกระดับการผจญภัยในการตกปลาให้สูงขึ้นไปอีกระดับ โยนทุกครั้งให้คุ้มค่าด้วยเทคโนโลยี', '40202819420250226_215731.png', 25285, '10', 'ชิ้น', 85, '2025-03-02 17:43:00'),
(3, 'Daiwa ZILLION SV TW', 5, 'ลูกปืนรอก : 9(8BB+1RB)		\r\nอัตราทดเฟือง  : 7.8:1\r\nอัตรากรอสายต่อ 1 รอบ : 26.3 เมตร\r\nแรงดึงสูงสุด 11 กิโลกรัม\r\nน้ำหนัก : 190 กรัม\r\nอัตราการจุสายเอ็น : 14/100, 16/85 (หน้าตัดสาย/เมตร)\r\nอัตราการจุสายถัก : 30/100, 40/80  (หน้าตัดสาย/เมตร)', 'สไตล์, นวัตกรรม, การวิจัย และความหลงใหล รวมตัวกันในความสำเร็จของการสร้าง New Zillion SV TW ด้วยประสบการณ์และการวิจัยกว่า 40 ปีในระบบเบรกแม่เหล็ก เราได้เพิ่มระบบ SV BOOSTER SYSTEM ใหม่ที่มอบการควบคุมที่คุณรู้จักและชื่นชอบจาก SV Concept พร้อมกับประโยชน์เพิ่มเติมในการเพิ่มระยะการโยนที่ไกลขึ้น นอกจากนี้ยังมาพร้อมกับ HYPER DRIVE DESIGN ใหม่ที่ช่วยให้การดึงสายลื่นไหลและการหมุนมีพลังมากยิ่งขึ้น ซึ่งประกอบด้วยเทคโนโลยีหลัก 4 อย่าง ได้แก่ HYPER DRIVE DIGIGEAR, HYPER DOUBLE SUPPORT, HYPER ARMED HOUSING และ HYPER TOUGH CLUTCH\r\n:HYPER DRIVE DIGIGEAR - การออกแบบเกียร์ใหม่ทำให้ฟันเกียร์มีประสิทธิภาพในการถ่ายพลังงานมากขึ้น ทำให้ชุดเกียร์รู้สึกลื่นไหลและมีพลังมากขึ้น พร้อมทั้งลดเสียงจากเกียร์\r\n:HYPER DOUBLE SUPPORT - ระบบรองรับตลับลูกปืนสองตัวสำหรับเกียร์พินยอนช่วยลดการยืดหยุ่นและทำให้การดึงสาย/การหมุนเกียร์ลื่นไหล\r\n:HYPER ARMED HOUSING - รอกมาพร้อมกับเฟรมและแผ่นข้างอะลูมิเนียมที่ช่วยเพิ่มความแข็งแกร่งและความแม่นยำในการทำงานของส่วนประกอบภายใน\r\n:HYPER TOUGH CLUTCH - กลไกคลัตช์ที่ได้รับการออกแบบและเสริมความทนทานเพิ่มขึ้น ช่วยให้รอกมีอายุการใช้งานที่ยาวนานและประสิทธิภาพสูงขึ้น\r\nคุณสมบัติทั้งหมดเหล่านี้ร่วมกันทำให้ Zillion SV TW ใหม่เป็นตัวอย่างที่สมบูรณ์แบบของการออกแบบ, ฟังก์ชัน และนวัตกรรมที่ไม่มีใครเหมือน', '127859733120250226_214715.png', 12474, '7', 'ชิ้น', 29, '2025-03-02 16:01:21'),
(6, 'Casting Megatron 200', 5, 'ลูกปืนรอก  : 7+1 ตลับ		 \r\nอัตราทดเฟือง  :  6.4:1 สปูนหมุน:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 29.3 เมตร\r\nแรงดึงสูงสุด 13 กิโลกรัม\r\nน้ำหนัก : 258 กรัม\r\nอัตราการจุสายเอ็น  :  0.35/160, 0.40/120 หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก  :  0.32/160, 0.38/123 หน้าตัดสาย(มิล)/เมตร', 'รอกเบทแคสติ้งความจุสูงขนาดใหญ่\r\nKastKing MegaTron 200 มาพร้อมกับเฟรมที่กว้างขึ้นและสปูลความจุสูง รองรับสายโมโนขนาด 17 ปอนด์ได้ถึง 120 เมตร และให้แรงเบรกสูงสุดถึง 28.6 ปอนด์ ด้วยระบบเบรกคาร์บอนแบบสามดิสก์ที่ลื่นไหลอย่างเหนือชั้น รอกนี้เหมาะอย่างยิ่งสำหรับการใช้กับเหยื่อสวิมเบทขนาดใหญ่, ครังก์เบทแบบดำน้ำลึก, เหยื่อขนาดมัสกี้, ปลาดุก, ปลาแซลมอน/สตีลเฮด และอื่น ๆ อีกมากมาย ออกแบบมาให้ใช้งานได้ทั้งในน้ำจืดและน้ำเค็ม\r\n\r\nการออกแบบแบบโลว์โปรไฟล์\r\nแม้ว่ารอก KastKing MegaTron 200 จะมาพร้อมกับเฟรมที่ใหญ่ขึ้นและความจุสายที่สูงกว่ารอกเบทแคสติ้งทั่วไป แต่ยังคงได้รับการออกแบบให้มีรูปทรงแบบโลว์โปรไฟล์ เพื่อให้การตกปลาตลอดทั้งวันเป็นไปอย่างสะดวกสบาย เฟรมและฝาข้างทำจากกราฟิตที่มีน้ำหนักเบาแต่แข็งแกร่ง ออกแบบมาให้พอดีกับมือเพื่อการจับที่สบาย นอกจากนี้ ยังมาพร้อมกับแขนกว้านอะลูมิเนียมขนาด 105 มม. และปุ่มจับคอร์ค 3A ที่สวยงาม มั่นใจได้ว่าคุณจะสามารถควบคุมรอกได้อย่างมั่นคงตลอดการใช้งาน', '78664675720250226_230521.png', 2532, '5', 'ชิ้น', 25, '2025-03-02 17:07:49'),
(7, 'Casking Kestrel Elite Magnesium', 5, 'อัตรากรอสายต่อ 1 รอบ : 29.1 เมตร\r\nแรงดึงสูงสุด 6 กิโลกรัม\r\nน้ำหนัก : 125 กรัม\r\nอัตราการจุสายเอ็น : 0.24/80, 0.26/60 หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.03/150, 0.10/120 หน้าตัดสาย(มิล)/เมตร', 'รอกที่สมบูรณ์แบบสำหรับการตกปลาแบบฟิเนส\r\nKestrel Elite BFS (Bait Finesse System) เป็นรอกเบทแคสติ้งที่เบาที่สุดในตลาด ด้วยน้ำหนักเพียง 4.4 ออนซ์! รอกนี้ช่วยให้นักตกปลาสามารถโยนเหยื่อที่มีน้ำหนักเบาได้ไกลขึ้นและแม่นยำยิ่งขึ้น พร้อมทั้งลดการเกิดแบ็คแลชได้เกือบหมด นอกจากนี้ ด้วยน้ำหนักที่เบาและขนาดที่กะทัดรัด ทำให้ Kestrel Elite เป็นรอกที่ใช้งานได้ง่าย สบายมือ และเหมาะสำหรับการตกปลาตลอดทั้งวัน\r\n\r\nเทคโนโลยีเบรกขั้นสูง\r\nระบบเบรก FAF (Flyout Arc Finesse) ได้รับการออกแบบมาโดยเฉพาะสำหรับการตกปลาแบบฟิเนส โดยใช้แม่เหล็กเบรกแบบครึ่งวงแหวนสองตัวที่สามารถปรับการทำงานโดยอัตโนมัติเพื่อชะลอการหมุนของสปูลเมื่อจำเป็น ช่วยลดโอกาสการเกิดแบ็คแลช เมื่อความเร็วของสปูลลดลง สนามแม่เหล็กภายในจะอ่อนลง และแม่เหล็กจะหดตัวเพื่อเพิ่มระยะการโยน นอกจากนี้ ยังมีปุ่มปรับเบรกภายนอกที่สามารถปรับแต่งความเร็วของสปูลได้อย่างแม่นยำ เหมาะสำหรับการใช้กับเหยื่อขนาดเล็ก', '193289542420250226_231622.jpg', 6750, '5', 'ชิ้น', 1, '2025-03-02 06:32:19'),
(8, 'KastKing Royale Legend Pro', 5, 'ลูกปืนรอก : 11+1 ตลับ		 \r\nอัตราทดเฟือง 8.0:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 31.7 นิ้ว\r\nแรงดึงสูงสุด 7.2 กิโลกรัม\r\nน้ำหนัก : 155 กรัม\r\nอัตราการจุสายเอ็น : 0.45/128, 0.55/82 หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.18/180, 0.24/120 หน้าตัดสาย(มิล)/เมตร', 'การตีสายที่ดีขึ้นและความอเนกประสงค์สูง\r\nรอกเบทแคสติ้ง Royale Legend Pro ได้รับการออกแบบทางวิศวกรรมอย่างเชี่ยวชาญ มาพร้อมกับระบบเบรก AutoMag Dual Braking System ที่รวมแหวนแม่เหล็กแบบชิ้นเดียวและระบบเบรกแรงเหวี่ยงเข้าด้วยกัน ช่วยเพิ่มระยะการตีสายและลดปัญหาโอเวอร์รัน อัตราทดเกียร์เร็ว 8.0:1 รองรับการใช้งานกับเหยื่อและเทคนิคที่หลากหลาย สามารถเก็บสายได้เร็วเพื่อตีเหยื่อต่อเนื่อง ลดโอกาสพลาดช็อตจากปลาที่โจมตีเหยื่อแบบฉับพลัน\r\n\r\nสัมผัสพลังเบรกสูงสุด 16 ปอนด์ ด้วยระบบเบรกอันล้ำสมัยของ KastKing – ARC (Arch Resistance Control) ที่ออกแบบมาเพื่อให้การหน่วงสายเป็นไปอย่างลื่นไหลและทรงพลัง ด้วยแผ่นเบรกคาร์บอนเดี่ยว ARC ปฏิวัติระบบเบรกให้มีประสิทธิภาพเหนือชั้น พร้อมทั้งเกียร์หลักอะลูมิเนียมที่ตัดด้วยความแม่นยำและเกียร์พินยอนทองเหลืองที่แข็งแกร่ง มอบความทนทานและพลังการทำงานที่ยอดเยี่ยม', '104116349020250227_000728.jpg', 3105, '5', 'ชิ้น', 1, '2025-02-26 17:08:48'),
(9, 'Daiwa TATULA SV TW103', 5, 'ลูกปืนรอก : 7(2CRBB) 5BB + 1 ตลับ		 \r\nอัตราทดเฟือง 7.1:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 28 นิ้ว\r\nแรงดึงสูงสุด 5 กิโลกรัม\r\nน้ำหนัก : 190 กรัม\r\nอัตราการจุสายเอ็น : 0.40/90, 0.45/80 หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.24/150, 0.32/100 หน้าตัดสาย(มิล)/เมตร', 'เมื่อคุณคิดว่ารอก Tatula SV ไม่สามารถดีขึ้นไปได้อีกแล้ว Daiwa ก็ภูมิใจนำเสนอรอก Tatula SV TW103 ขนาด 100 ที่เล็กกว่าเดิม ทีมพัฒนาของเราได้ออกแบบรอก Tatula SV นี้ให้เป็นรอกที่เล็กที่สุดและเบาที่สุด พร้อมประสิทธิภาพที่ปลอดภัยที่สุดที่เราเคยสร้างมา รอก Tatula SV ตัวนี้มีน้ำหนักเพียง 6.7 ออนซ์ และเป็นรอกเบทแคสติ้งที่เบาที่สุดและควบคุมการตีได้ดีที่สุดในตลาดวันนี้\r\n\r\nสิ่งที่ทำให้รอกนี้พิเศษคือระบบสปูล SV ที่ได้รับสิทธิบัตร และเทคโนโลยี Airbrake ทั้งสองฟีเจอร์ทำงานร่วมกันเพื่อช่วยลดการเกิดแบ็คแลช ในขณะเดียวกันก็ทำให้รอกสามารถตีเหยื่อได้ไกลและแม่นยำมากขึ้นด้วยการใช้ทั้งเทคโนโลยีแม่เหล็กและแรงเหวี่ยงในการเบรก\r\n\r\nสปูล Daiwa Zero Adjust ช่วยให้คุณปรับตั้งความตึงของสปูลได้อย่างละเอียดและระบบ T-Wing Level Wind ช่วยเปิดช่องทางการให้น้ำหนักสายได้ดีขึ้น ทั้งหมดนี้ทำงานร่วมกันเพื่อให้การตีเหยื่อไกลและแม่นยำ พร้อมทั้งให้คุณควบคุมรอกได้อย่างสบายใจโดยไม่ต้องกังวลเรื่องแบ็คแลชแม้ในสภาพลมแรง การตกปลาด้วยเหยื่อข้ามน้ำ หรือการโยนเหยื่อที่มีน้ำหนักเบา\r\n\r\nความสะดวกสบายเพิ่มขึ้นด้วยการออกแบบที่กระทัดรัดและจับถนัดมือ รวมถึงปุ่มจับที่มีการสัมผัสนุ่ม รอก SV TWS103 ถูกสร้างขึ้นจากเฟรมอะลูมิเนียมที่ให้ความแข็งแรงและการทำงานที่ลื่นไหล\r\n\r\nTatula SV ขนาด 100 มีให้เลือกทั้งเกียร์อัตราทดปกติ (6.3:1) เกียร์อัตราทดสูง (7.3:1) และเกียร์อัตราทดเร็ว (8.1:1) ซึ่งทั้งหมดมีทั้งรุ่นมือซ้ายและมือขวา เมื่อคุณมองหาการตกปลาด้วยรอกเบทแคสติ้งขนาดเล็ก เบา และจับถนัดมือ ไม่ต้องมองหาที่ไหนอีกแล้ว TATULA SV TW103 คือคำตอบในการเปลี่ยนแปลงตลาดรอกเบทแคสติ้ง', '66344512820250227_001937.png', 6900, '201', 'ชิ้น', 0, '2025-02-26 17:19:37'),
(10, 'Shimano CALCUTTA CONQUEST 100A', 5, 'ลูกปืนรอก : 13+1 ตลับ		 \r\nอัตราทดเฟือง 4.8:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 22 นิ้ว\r\nแรงดึงสูงสุด 6 กิโลกรัม\r\nน้ำหนัก : 235 กรัม\r\nอัตราการจุสายเอ็น : 0.28/160, 0.30/140 หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.24/170, 0.38/110 หน้าตัดสาย(มิล)/เมตร', 'ความทนทานสูง\r\nรอกนี้ผลิตจากวัสดุที่แข็งแรง เช่น อลูมิเนียมและสแตนเลส ทำให้ทนทานต่อการใช้งานหนักและการกัดกร่อนจากน้ำทะเล ทำให้มันเหมาะกับการตกปลาในสภาพแวดล้อมที่ท้าทาย เช่น การตกปลาน้ำเค็มหรือทะเลลึก\r\n\r\nวามลื่นไหลของการใช้งาน\r\nระบบเกียร์ของรอกนี้ทำงานได้ลื่นไหลและเงียบ โดยไม่ทำให้เกิดการสะดุดระหว่างการดึงเหยื่อหรือเมื่อปลาติดสาย ทำให้การตกปลาเป็นไปอย่างมีประสิทธิภาพและสนุกสนาน\r\n\r\nระบบเบรกที่ดี\r\nระบบเบรกของ Calcutta Conquest ออกแบบมาให้ใช้งานได้อย่างแม่นยำและมีประสิทธิภาพ ทำให้สามารถควบคุมการดึงของปลาได้ดี โดยเฉพาะกับปลาขนาดใหญ่ที่มักจะมีแรงดึงสูง', '154171052420250227_005209.png', 21500, '3', 'ชิ้น', 1, '2025-02-26 17:52:14'),
(11, 'Shimano CALCUTTA B', 5, 'ลูกปืนรอก : 3+1 ตลับ		 \r\nอัตราทดเฟือง 5:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 24 นิ้ว\r\nแรงดึงสูงสุด 7.7 กิโลกรัม\r\nน้ำหนัก : 332 กรัม\r\nอัตราการจุสายเอ็น : 0.35/301, 0.45/146 หน้าตัดสาย(มิล)/เมตร', 'ซีรีส์ Calcutta: ความทนทานและคุณภาพจาก Shimano\r\nรอกซีรีส์ Calcutta เป็นตัวแทนของคุณภาพ ความหลากหลาย ความน่าเชื่อถือ และมูลค่าระยะยาวของ Shimano รอก Calcutta เหมาะสำหรับการใช้งานเกือบทุกประเภท ทั้งในน้ำจืดและน้ำเค็ม ด้วยระบบเบรก Cross Carbon และ A-RB (Anti-Rust Bearings) รอก Calcutta จะมอบประสบการณ์การใช้งานที่มั่นคงและยาวนานสำหรับคุณ', '157829941620250227_011051.png', 8770, '6', 'ชิ้น', 1, '2025-02-26 18:11:14'),
(12, 'Shimano CORVALUS', 5, 'ลูกปืนรอก : 3+1 ตลับ		 \r\nอัตราทดเฟือง 5.2:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 22 นิ้ว\r\nแรงดึงสูงสุด 5 กิโลกรัม\r\nน้ำหนัก : 335 กรัม\r\nอัตราการจุสายเอ็น : 0.35/300, 0.45/180 หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.24/170, 0.45/110 หน้าตัดสาย(มิล)/เมตร', 'Corvalus: ฐานที่แข็งแกร่งเพื่อประสิทธิภาพที่ดียิ่งขึ้น\r\nไม่ว่าคุณจะทำอะไร การเริ่มต้นด้วยฐานที่แข็งแกร่งจะทำให้ทุกสิ่งที่สร้างขึ้นมาดียิ่งขึ้น ดังนั้นเราจึงเริ่มต้น Corvalus ด้วยเฟรมอะลูมิเนียมหล่อขึ้นรูปชิ้นเดียวที่ทนทานต่อการใช้งานหนัก เพิ่ม Super Stopper ระบบป้องกันการหมุนย้อนกลับเพื่อการตั้งเบ็ดที่มั่นคง และระบบเบรก Variable Braking System (VBS) ที่ช่วยให้การควบคุมง่ายดายและแม่นยำ', '4303642720250227_011832.png', 3710, '10', 'ชิ้น', 0, '2025-02-26 18:18:32'),
(13, 'Shimano CARDIFF A', 5, 'ลูกปืนรอก : 4+1 ตลับ		 \r\nอัตราทดเฟือง 5.8:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 24 นิ้ว\r\nแรงดึงสูงสุด 4.5 กิโลกรัม\r\nน้ำหนัก : 252 กรัม\r\nอัตราการจุสายเอ็น : 0.35/210, 0.45/165 หน้าตัดสาย(มิล)/เมตร', 'Shimano CARDIFF A เป็นรอกเบทแคสติ้งที่มีคุณสมบัติที่โดดเด่นหลายประการ เพื่อให้การตกปลาเป็นไปอย่างราบรื่นและมีประสิทธิภาพ โดยบางระบบที่มีในรอก Shimano CARDIFF A ได้แก่:\r\nระบบเบรก VBS (Variable Brake System): ช่วยให้การปรับเบรกเป็นไปอย่างสะดวกและแม่นยำ โดยปรับการเบรกตามน้ำหนักของเหยื่อและสภาพการตกปลา เพื่อป้องกันการเกิดแบ็คแลชและเพิ่มระยะการโยน\r\n\r\nระบบ Super Stopper: ระบบป้องกันการหมุนย้อนกลับที่ช่วยให้การตั้งเบ็ดเป็นไปอย่างมั่นคง เมื่อมีการดึงสายอย่างรวดเร็ว\r\n\r\nA-RB (Anti-Rust Bearings): ระบบตลับลูกปืนที่มีการเคลือบป้องกันสนิม เพิ่มความทนทานและความลื่นไหลในการใช้งานในสภาพแวดล้อมที่มีความชื้นสูง เช่น น้ำเค็ม\r\n\r\nเฟรมอะลูมิเนียม: ด้วยเฟรมที่ทำจากวัสดุอะลูมิเนียมที่มีความแข็งแรง ทนทาน ช่วยเพิ่มความทนทานและลดน้ำหนักของรอก', '2446820020250227_013026.png', 3, '4380', 'ชิ้น', 1, '2025-03-01 18:49:31'),
(14, 'KastKing Royale Legend Pro 2000', 6, 'ลูกปืนรอก : 10+1 ตลับ \r\nอัตราทดเฟือง 6.2:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 31.4 นิ้ว\r\nแรงดึงสูงสุด 9 กิโลกรัม\r\nน้ำหนัก : 258 กรัม\r\nอัตราการจุสายเอ็น : 0.28/170, 0.30/145,  หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.55/130 0.65/110,  หน้าตัดสาย(มิล)/เมตร \r\n', 'ส่วนประกอบระดับพรีเมียม\r\nรอก KastKing Royale Legend Pro Spinning ได้รับการออกแบบและผลิตตามมาตรฐานที่เข้มงวด โดยมีเกียร์หลักอะลูมิเนียม Digi-cut ที่ได้รับการเคลือบแข็งจากอุตสาหกรรมอวกาศ พร้อมความแข็งแรง Rockwell Hardness ที่ 80 ซึ่งแข็งแกร่งกว่าเกียร์ที่ทำจากโลหะผสมซิงค์ถึง 30% และเบากว่า 60% นอกจากนี้ยังมาพร้อมกับอัตราทดเกียร์สูง 6.2:1 ที่ช่วยให้การเก็บสายและการตกปลาได้อย่างรวดเร็วและมีประสิทธิภาพมากขึ้น\r\n\r\nการออกแบบที่สร้างสรรค์เพื่อความลื่นไหล\r\nรอก Royale Legend Pro Spinning ได้ปรับปรุงการตีเหยื่อใหม่ด้วยการออกแบบสปูลที่ได้รับสิทธิบัตร ซึ่งช่วยลดแรงเสียดทานของสายและเพิ่มระยะการตีเหยื่อ พร้อมทั้งให้การควบคุมที่ยอดเยี่ยม นวัตกรรมนี้ผสานกับระบบตลับลูกปืน MaxiDur สแตนเลสสตีลแบบป้องกันสองชั้นจำนวน 10+1 ตัว ซึ่งการันตีการทำงานที่ลื่นไหลและเชื่อถือได้ในทุกสภาพแวดล้อม นอกจากนี้ โรเตอร์ของรอกที่มีการออกแบบทางอากาศพลศาสตร์ยังช่วยลดความต้านทานและเพิ่มประสิทธิภาพการใช้งานโดยรวม', '138600721920250227_014122.jpg', 3000, '10', 'ชิ้น', 7, '2025-03-02 07:33:31'),
(15, 'KastKing Royale Legend Glory 2000', 6, 'ลูกปืนรอก : 7+1 ตลับ \r\nอัตราทดเฟือง 6.2:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 33.7 นิ้ว\r\nแรงดึงสูงสุด 8 กิโลกรัม\r\nน้ำหนัก : 257 กรัม\r\nอัตราการจุสายเอ็น : 0.28/170, 0.30/145,  หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.55/130 0.65/110,  หน้าตัดสาย(มิล)/เมตร', 'ประสิทธิภาพที่ลื่นไหลและรวดเร็ว\r\nรอก Royale Legend Glory Spinning ได้รับการสนับสนุนด้วยตลับลูกปืนสแตนเลสสตีลแบบป้องกันสองชั้นจำนวน 7 ตัว และตลับลูกปืนป้องกันการหมุนย้อนกลับ ซึ่งมอบการทำงานที่ลื่นไหลและเชื่อถือได้แม้ในขณะรับน้ำหนักมาก นอกจากนี้ ด้วยอัตราทดเกียร์ 6.2:1 ที่รวดเร็ว ทำให้ความเร็วเป็นคุณสมบัติที่สำคัญของรอกนี้ โดยมีอัตราการเก็บสายที่ 38.3 IPT (อินช์ต่อรอบ) ในขนาด 4000 การเก็บสายอย่างรวดเร็วช่วยให้คุณสามารถตีเหยื่อต่อเนื่องได้อย่างรวดเร็วเมื่อการกระทำเกิดขึ้นเร็ว และให้ความควบคุมที่ดียิ่งขึ้นในระหว่างการตกปลา\r\n\r\nความแข็งแกร่งและความทนทาน\r\nรอก KastKing Royale Legend Glory Spin Fishing มาพร้อมกับเกียร์ขับเคลื่อนโลหะผสมซิงค์, แกนหลักสแตนเลสขนาดใหญ่ และเกียร์พินยอนทองเหลือง ที่ให้การทำงานที่ลื่นไหลและน่าทึ่ง แม้ในสภาวะที่ท้าทายที่สุด โดยวัสดุเหล่านี้ช่วยให้รอกมีความแข็งแกร่งและทนทานต่อการใช้งานหนัก ทั้งยังมอบประสิทธิภาพที่ยอดเยี่ยมในการตกปลาในทุกสภาพแวดล้อม', '66363960420250227_014441.jpg', 1699, '2', 'ชิ้น', 4, '2025-03-02 06:31:38'),
(16, 'KastKing MegaJaws Elite 3000', 6, 'ลูกปืนรอก : 10+1 ตลับ \r\nอัตราทดเฟือง 6.2:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 35.5 นิ้ว\r\nแรงดึงสูงสุด 8 กิโลกรัม\r\nน้ำหนัก : 198 กรัม\r\nอัตราการจุสายเอ็น : 0.30/155, 0.35/83,  หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.55/118 0.65/100,  หน้าตัดสาย(มิล)/เมตร', 'ออกแบบเพื่อการแข่งขัน – วิศวกรรมเพื่อชัยชนะ\r\nรอก KastKing MegaJaws Elite Pro Tour Level Spinning ถูกสร้างขึ้นตามมาตรฐานที่แม่นยำ โดยมีเกียร์หลักอะลูมิเนียม Digi-cut อุตสาหกรรมอวกาศ 2014 ที่ได้รับการเคลือบแข็งด้วยความแข็ง Rockwell ที่ 82 ซึ่งแข็งแกร่งกว่าเกียร์โลหะผสมซิงค์ถึง 15% และผ่านการขึ้นรูปที่มีความแม่นยำระดับไมโครเมตร (µm) ตัวบอดี้ Uni-Frame อะลูมิเนียมอุตสาหกรรมอวกาศและโรเตอร์คาร์บอนมอบความเบาที่สุดในการตกปลา สำหรับนักตกปลาในระดับโปรและนักตกปลาผู้เลือกสรร\r\n\r\nส่วนประกอบระเวิลล์คลาส\r\nรอก MegaJaws Elite Spinning มาพร้อมกับบาแอลสายอลูมิเนียม 6061 แบบชิ้นเดียวที่ไร้รอยต่อและไม่เป็นสนิม ซึ่งจะไม่ทำให้สายตกหรือหยุดชะงักเมื่อทำการโยนเหยื่อ ขนาดของสปูลอลูมิเนียม 6061 ของ MegaJaws Elite Tournament ทำให้รอกนี้เหมาะสำหรับทุกสภาพการตกปลา รอยปากสปูลที่ได้รับสิทธิบัตรช่วยเพิ่มระยะการตีเหยื่อและปรับปรุงการควบคุมสาย ขนาด 2500 ของรอกมีการออกแบบสปูลที่ตื้น ในขณะที่ขนาด 2000 และ 3000 มาพร้อมกับการออกแบบสปูลที่ลึกเพื่อเพิ่มความจุของสาย', '101508105220250227_014917.jpg', 4750, '7', 'ชิ้น', 3, '2025-03-02 12:17:52'),
(17, 'KastKing Kapstan Elite Saltwater 8000', 6, 'ลูกปืนรอก : 6+1+1 ตลับ \r\nอัตราทดเฟือง 5.7:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 40.3 นิ้ว\r\nแรงดึงสูงสุด 25 กิโลกรัม\r\nน้ำหนัก : 867 กรัม\r\nอัตราการจุสายเอ็น : 0.28/170, 0.30/145,  หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.75/120 0.85/100,  หน้าตัดสาย(มิล)/เมตร', 'ลื่นไหลและเชื่อถือได้อย่างเหนือระดับ\r\nรอก Kapstan Elite ทุกตัวมาพร้อมกับตลับลูกปืนสแตนเลสสตีลแบบป้องกันสองชั้นจำนวน 6 ตัว ที่ให้ความรู้สึกที่ลื่นไหลอย่างยอดเยี่ยมแม้ในสภาพแวดล้อมที่ยากลำบาก นอกจากนี้ยังมีตลับลูกปืนโพลิเมอร์แบบลูกกลิ้งที่ออกแบบพิเศษ ซึ่งมีความแข็งแรงสูงและไม่เป็นสนิม พร้อมกับตลับลูกปืนสแตนเลสสตีลแบบทิศทางเดียว 8-pin เพื่อป้องกันไม่ให้เฟืองหมุนย้อนกลับ\r\n\r\nเกียร์คุณภาพระดับอวกาศ\r\nรอก Kapstan Elite มาพร้อมกับเกียร์พินยอนจากโลหะผสมอวกาศ HRB 90 ที่มีความแข็งแรงสูง ซึ่งทำจากโลหะผสมทองเหลืองแมงกานีส ที่รับประกันความทนทานสูงสุดและการทำงานที่ลื่นไหล เกียร์ที่ทนทานเหล่านี้มีความทนทานมากกว่าอะลูมิเนียมถึง 20% และทนทานกว่าโลหะผสมซิงค์ถึง 95%\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '6556955720250227_015301.jpg', 4380, '7', 'ชิ้น', 0, '2025-02-26 18:53:01'),
(18, 'KastKing Zephyr 1000 SFS  1000', 6, 'ลูกปืนรอก : 7+1 ตลับ \r\nอัตราทดเฟือง 5.2:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 23.8 นิ้ว\r\nแรงดึงสูงสุด 4.5 กิโลกรัม\r\nน้ำหนัก : 150 กรัม\r\nอัตราการจุสายเอ็น :0.16/75 0.26/60,  หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.26/200 0.28/150,  หน้าตัดสาย(มิล)/เมตร \r\n', 'การดึงเบรกคาร์บอนไฟเบอร์ลื่นไหลอย่างยอดเยี่ยม\r\nรอก KastKing Zephyr Spinning มาพร้อมกับระบบเบรกคาร์บอนไฟเบอร์ที่ลื่นไหลอย่างยอดเยี่ยม ขนาด 500 รองรับการดึงเบรกคาร์บอนไฟเบอร์สูงสุดถึง 8.8 ปอนด์ ขนาด 1000 และ 2000 รองรับการดึงเบรกสูงสุดถึง 18 ปอนด์ ขนาด 3000 และ 4000 รองรับการดึงเบรกสูงสุดถึง 22 ปอนด์\r\n\r\nพลังมหาศาล\r\nรอกนี้มาพร้อมกับตัวรอกจากกราฟิกที่ทนทานต่อการกัดกร่อน, ปกคลุมรอกและโรเตอร์ที่ทำจากกราฟิก, แกนหลักสแตนเลสขนาดใหญ่, เกียร์พินยอนทองเหลือง และตลับลูกปืนสแตนเลสสตีลแบบป้องกันสองชั้นในตำแหน่งสำคัญ ที่ไม่ยอมแพ้ในขณะที่ต่อสู้กับปลารางวัล', '8785247820250227_015534.jpg', 1450, '8', 'ชิ้น', 0, '2025-02-26 18:55:34'),
(19, 'DAIWA LEGALIS LT 1000', 6, 'ลูกปืนรอก : 5+1 ตลับ \r\nอัตราทดเฟือง 5.2:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 25.5 นิ้ว\r\nแรงดึงสูงสุด 5 กิโลกรัม\r\nน้ำหนัก : 184 กรัม\r\nอัตราการจุสายเอ็น :0.16/75 0.26/60,  หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.26/200 0.28/150,  หน้าตัดสาย(มิล)/เมตร', 'รูปลักษณ์ล้ำสมัยพร้อมเทคโนโลยีล้ำหน้า\r\nรอก Daiwa Legalis LT โดดเด่นด้วยรูปลักษณ์ที่ทันสมัย พร้อมราคาที่คุ้มค่าแต่เปี่ยมไปด้วยคุณสมบัติด้านการออกแบบและวิศวกรรม ตัวรอก LT (Light yet Tough) ผลิตจากคาร์บอนคอมโพสิตน้ำหนักเบา แข็งแกร่งกว่าวัสดุทั่วไป ทำให้รอกมีอัตราส่วนความแข็งแรงต่อน้ำหนักที่ยอดเยี่ยม ช่วยลดความเมื่อยล้าจากการใช้งานตลอดทั้งวัน\r\n\r\nเทคโนโลยีที่ล้ำหน้า:\r\nABS (Advanced Ballistic System) Spool – ออกแบบให้เป็นทรงเรียวกลับ ช่วยลดแรงเสียดทานของสายขณะออกจากสปูล เพิ่มระยะการตีสาย และสามารถบรรจุสายได้มากขึ้นเพื่อรองรับแรงดึงจากปลาขนาดใหญ่\r\nAir Rotor & Air Bail – ผลิตจากคาร์บอนคอมโพสิตที่มีน้ำหนักเบาแต่แข็งแรงกว่าดีไซน์ทั่วไป\r\nระบบลูกปืนลื่นไหล – มาพร้อมตลับลูกปืน 6 ตัว และลูกปืนโรลเลอร์ 1 ตัว เพื่อการทำงานที่ราบรื่น\r\nดีไซน์ที่คุ้มค่า – หายากในตลาดรอกสปินนิ่งที่จะมีเทคโนโลยีระดับสูงในราคาที่เข้าถึงได้ แต่ Daiwa Legalis LT คือคำตอบ!', '152919474320250227_015840.jpg', 2520, '7', 'ชิ้น', 0, '2025-02-26 18:58:40'),
(20, 'DAIWA LAGUNA LT 2500', 6, 'ลูกปืนรอก : 3+1 ตลับ \r\nอัตราทดเฟือง 5.2:1 สปูนหมุนเก็บสาย:ต่อการหมุน\r\nอัตรากรอสายต่อ 1 รอบ : 29.5 นิ้ว\r\nแรงดึงสูงสุด 10 กิโลกรัม\r\nน้ำหนัก : 255 กรัม\r\nอัตราการจุสายเอ็น :0.26/145 0.28/100,  หน้าตัดสาย(มิล)/เมตร\r\nอัตราการจุสายถัก : 0.28/180 0.30/155,  หน้าตัดสาย(มิล)/เมตร', 'Daiwa Laguna LT – เบาแต่แข็งแกร่ง\r\nDaiwa Laguna LT คือรอกที่พัฒนาภายใต้แนวคิด LT (Light & Tough) โดยมีโครงสร้าง True Carbon Frame ที่ช่วยลดน้ำหนักและขนาดลง แต่ยังคงความแข็งแรงเทียบเท่าวัสดุทั่วไป\r\n\r\nเทคโนโลยีเด่น:\r\n:Air Rotor System – ปรับสมดุลการหมุน ลดน้ำหนักโรเตอร์ลง 15% เพื่อการหมุนที่ลื่นไหล\r\n :ลูกปืน 3+1 – ให้ประสิทธิภาพการหมุนที่เหนือกว่ารอกราคาสมระดับ\r\n:ก้านหมุนอะลูมิเนียมขึ้นรูป – ดีไซน์แบบ Swept Back พร้อมมือจับขนาดใหญ่ จับกระชับใช้งานง่าย\r\nมีให้เลือกตั้งแต่ขนาด 1000 ถึง 3000 เหมาะกับนักตกปลาทุกระดับที่ต้องการสัมผัสนวัตกรรมของ Daiwa ในราคาที่คุ้มค่า', '184568702320250227_020455.jpg', 1520, '5', 'ชิ้น', 1, '2025-02-26 19:26:22'),
(21, 'Karryall Tackle Backpack', 11, '(ขนาด: 13” x 10.24” x 17.72”)', 'กระเป๋าเป้สำหรับอุปกรณ์ตกปลาพร้อมที่ใส่คันเบ็ด ทำจากผ้า Oxford 600D ความหนาแน่นสูงและซับใน 210D ให้ความทนทานและใช้งานได้ยาวนานเป็นพิเศษ เคลือบ PVC กันน้ำเพื่อปกป้องของใช้ภายในให้แห้ง ด้านล่างเป็นวัสดุคอมโพสิตกันน้ำแบบเต็มพื้นที่ พร้อมแผ่นกันลื่น 2 จุด ช่วยให้กระเป๋าอยู่กับที่อย่างมั่นคง', '19017172620250227_022107.jpg', 600, '3', 'ใบ', 10, '2025-03-02 12:42:04'),
(22, 'Fishing Tackle Bags', 11, '(ขนาด 19.7” x 13” x 10.6”)', 'กระเป๋าใส่อุปกรณ์ตกปลา Hoss: ช่องหลักขนาดใหญ่สามารถใส่กล่องอุปกรณ์ตกปลา ขนาด 3600 ได้ 7 กล่อง (แนวนอนหรือแนวตั้ง) ไม่รวมในชุด แต่สามารถซื้อแยกจาก KastKing ได้ นอกจากนี้ยังมีช่องเก็บของด้านในสำหรับของใช้เล็กๆ เช่น กุญแจ กระเป๋าสตางค์ หรือโทรศัพท์ พร้อมช่องซิปและช่องเสียบด้านนอก 7 ช่อง สำหรับเก็บกล่องอุปกรณ์เพิ่มเติม', '211262756820250227_022226.jpg', 750, '1', 'ใบ', 4, '2025-03-02 07:13:33'),
(23, 'Speed Demon Pro Fishing Pliers ', 11, 'ขนาด 7.5 นิ้ว\r\nสแตนเลส 420 เคลือบกันสนิม แข็งแรงกว่าคีมอะลูมิเนียม 46% ทนทานทั้งน้ำจืดและน้ำเค็ม\r\nใบมีดทังสเตนคาร์ไบด์ ตัดสายโมโน ฟลูโอโรคาร์บอน และสายถักได้ง่าย\r\nกรรไกรตัดสายด้านข้าง ตัดได้ชิดปมสะดวก\r\nคีมอเนกประสงค์ ถอดเบ็ด บีบตะกั่ว ทำสายลีดเดอร์ ปรับเหยื่อ และตัดลวด\r\nด้ามจับ SuperPolymer กันลื่น ใช้งานมือเดียวสะดวก\r\nมาพร้อม ปลอกคีม+สายคล้องป้องกันตกน้ำ', '', '125685402220250227_022352.jpg', 250, '10', 'ชิ้น', 10, '2025-03-02 13:02:06'),
(24, 'Brutus Foldable Extendable Fishing Net', 11, 'วัสดุอะลูมิเนียมอัลลอย 6063 แข็งแรง ทนทาน ไม่บิดงอหรือแตกร้าว\r\nด้ามจับหนา 1 มม. รองรับน้ำหนักได้สูงสุด 20 กก. (44 ปอนด์)\r\nรุ่น Large PVC รองรับได้ 15 กก. (33 ปอนด์)\r\n', 'สวิงช้อนปลาแบบพับได้และยืดได้ ใช้งานสะดวก พกพาง่าย\r\nน้ำหนักเบา ใช้งานสะดวก', '164816110220250227_023101.jpg', 300, '4', 'อัน', 1, '2025-02-26 19:31:22'),
(25, 'TriPolymer Advanced Monofilament Fishing Line', 12, 'ความยาว 270 เมตร', 'สายโมโนฟิลาเมนต์ขั้นสูงรุ่นใหม่แบบ Tri-Extrusion\r\nTriPolymer Advanced Monofilament ผลิตด้วยกระบวนการ Triple Cross Head Extrusion ซึ่งรวม Nylon 6, Nylon 6,6 และ Nylon 12 เข้าไว้ด้วยกัน ทำให้ได้สายโมโนฟิลาเมนต์ที่ล้ำสมัยอย่างแท้จริง!\r\n\r\nการหักเหของแสงต่ำ\r\nTriPolymer Advanced Monofilament ผลิตจาก โพลีเมอร์ไนลอน 100% 3 ชั้น ทำให้มีคุณสมบัติการหักเหของแสงต่ำ คล้ายกับฟลูออโรคาร์บอน ปลาจึงมองไม่เห็นสายใต้น้ำ\r\n\r\nผิวเรียบลื่นเป็นพิเศษ\r\nTriPolymer Advanced Monofilament ผลิตด้วยกระบวนการ Tri-Extrusion 3 ชั้น ที่รวมคุณสมบัติที่ดีที่สุดของไนลอน 3 ชนิด ได้แก่ Nylon 12 ที่แข็งแรง, Nylon 6,6 ที่ทนต่อการเสียดสีสูง และ Nylon 6 ที่อ่อนนุ่มและยืดหยุ่น ทำให้ได้พื้นผิวที่เรียบลื่นกว่าโมโนฟิลาเมนต์ทั่วไป ช่วยให้เหวี่ยงสายได้ไกลขึ้นและลดแรงเสียดทานกับไกด์คันเบ็ด!', '137818112720250227_034115.png', 300, '5', 'ชิ้น', 13, '2025-03-02 12:42:14'),
(26, 'World\'s Premium Monofilament Fishing Line ', 12, 'ความยาว 270 เมตร', 'หน่วยความจำต่ำ (Low Memory)\r\nสายตกปลา KastKing Monofilament ผลิตด้วยเทคโนโลยี Paralleled Roll Track ที่ช่วยป้องกันไม่ให้สายจมลึกลงไปในสปูล ลดปัญหา Line Memory ทำให้ม้วนสายได้ง่าย ควบคุมการเหวี่ยงสายได้ดี และลดการเกิด Backlashes และ Wind Knots เพื่อประสบการณ์ตกปลาที่ลื่นไหลและสนุกยิ่งขึ้น!\r\n\r\nทนต่อการขีดข่วน (Abrasion Resistant)\r\nสายตกปลา KastKing Monofilament มีขนาดเส้นผ่านศูนย์กลางที่บางกว่า แต่แข็งแกร่งและทนต่อการขีดข่วนสูง เหมาะสำหรับใช้เป็นสายลีดเดอร์ ไม่ว่าคุณจะตกปลาในน้ำจืดหรือน้ำเค็ม ในการแข่งขันหรือเพื่อความสนุก KastKing Monofilament มอบประสิทธิภาพที่เหนือกว่าสายโมโนฟิลาเมนต์ทั่วไป!', '135184120820250227_034026.png', 269, '7', 'ชิ้น', 5, '2025-02-26 21:51:52'),
(27, 'TriPolymer Crappie Advanced Monofilament Fishing Line', 12, 'ความยาว 270 เมตร', 'เรียบลื่นเป็นพิเศษ (Super Smooth)\r\nสายตกปลาโมโนฟิลาเมนต์ผ่านกระบวนการ Tri-Extrusion 3 ชั้น ผสานคุณสมบัติที่ดีที่สุดไว้ในเส้นเดียว ได้แก่ Nylon 12 ที่แข็งแรง, Nylon 6,6 ที่ทนต่อการขีดข่วนสูง และ Nylon 6 ที่ให้ความยืดหยุ่นและความนุ่มลื่น พื้นผิวเรียบลื่นกว่าสายโมโนฟิลาเมนต์ทั่วไป ช่วยให้เหวี่ยงได้ไกลขึ้น และลดแรงเสียดทานกับไกด์คันเบ็ดให้น้อยที่สุด!\r\n\r\nทนต่อการขีดข่วนสูงเป็นพิเศษ\r\nสายโมโนฟิลาเมนต์นี้มี ความทนทานต่อการขีดข่วนสูงกว่าสายคอพอลิเมอร์โมโนฟิลาเมนต์และฟลูออโรคาร์บอนทั่วไปถึง 2 เท่า! ช่วยให้ตกปลาในพื้นที่ที่มีสิ่งกีดขวางหนัก เช่น ท่าเรือ กองไม้ใต้น้ำ หรือพื้นหิน ได้อย่างมั่นใจโดยไม่ต้องกังวลว่าสายจะขาดง่าย นอกจากนี้ ความทนทานที่สูงขึ้นยังช่วยเพิ่มความแข็งแรงของปม ลดโอกาสสูญเสียปลาจากปมหลุดหรือขาดระหว่างต่อสู้!', '143089800120250227_033927.png', 300, '6', 'ชิ้น', 3, '2025-03-02 12:23:43'),
(28, 'Destron  Monofilament Fishing Line', 12, '', 'กระบวนการอัดรีดเฉพาะ (Proprietary Extrusion Process)\r\nDestron Monofilament Fishing Line ใช้กระบวนการอัดรีดเฉพาะที่ใช้เรซินไนลอนในการผลิตสายโมโนฟิลาเมนต์คุณภาพสูง ทำให้ได้สายตกปลาที่มีความทนทานและประสิทธิภาพสูงสุดในการใช้งาน!\r\n\r\nทนต่อการขีดข่วนสูงเป็นพิเศษ\r\nDestron Monofilament Fishing Line มีความทนทานต่อการขีดข่วนสูงกว่าสายคอพอลิเมอร์โมโนฟิลาเมนต์ทั่วไป ช่วยเพิ่มความแข็งแรงของปม ทำให้สูญเสียปลาน้อยลง จากปัญหาสายขาดหรือแตก!', '17144962720250227_034511.png', 370, '2', 'ชิ้น', 2, '2025-02-26 20:57:33'),
(29, 'DuraBlend Monofilament Leader Line', 12, '', 'KastKing - แบรนด์ที่ได้รับรางวัล ICAST 2015 นำเสนอ ผู้นำโมโนฟิลาเมนต์ที่แข็งแกร่งและทนทาน ซึ่งมีความต้านทานแรงดึงสูงที่สุด โดยขนาด 80 ปอนด์ที่แสดงในภาพเป็นเพียงขนาดตัวอย่างเท่านั้น ยังมีขนาดอื่นๆ ให้เลือกตามต้องการ\r\n\r\nKastKing DuraBlend Monofilament Leader ถูกพัฒนาขึ้นเพื่อเป็นวัสดุผู้นำที่ทนทานและทนต่อการขีดข่วนมากที่สุดในปัจจุบัน\r\n\r\nให้พลังในการต่อสู้ที่ยอดเยี่ยม, KastKing DuraBlend Mono Leader มีความแข็งแกร่งในการรับแรงกระแทก, ความทนทานต่อการขีดข่วนที่ยอดเยี่ยม และความแข็งแรงของปมที่สูง นอกจากนี้ DuraBlend Mono Leaders ยังมีคุณสมบัติที่นักตกปลาคาดหวังในผู้นำคุณภาพสูง เช่น การยืดตัวต่ำและความชัดเจนที่โดดเด่น\r\n\r\nผลิตด้วยกระบวนการควบคุมคุณภาพที่เข้มงวด, DuraBlend Mono Leader คุณภาพสูงนี้มีลักษณะการจำหน่ายที่มี หน่วยความจำต่ำ คงความนุ่มและยืดหยุ่น ในขณะที่ยังคงอัตราส่วน ความแข็งแรงต่อเส้นผ่านศูนย์กลางที่สูง ทำให้สายมีขนาดเล็กแต่แข็งแรง พร้อมทั้งเพิ่มความจุของม้วนได้มากขึ้นสำหรับการต่อสู้กับปลาขนาดใหญ่\r\n\r\nแพ็คเกจดีไซน์ใหม่สำหรับ DuraBlend leader line สูงถึง 100 ปอนด์ ช่วยปกป้องสายและสะดวกต่อการใช้งานโดยไม่พันกัน DuraBlend ขนาด 100-200 ปอนด์ มาพร้อมกับการห่อสายในแพ็คเกจที่นุ่มนวล.', '139324560420250227_034814.png', 340, '10', 'ชิ้น', 0, '2025-02-26 20:48:14'),
(30, 'J-BRAID X8 GRAND BRAIDED LINE - GREY LIGHT', 13, 'สี WALLEYE\r\nความยาว 17 เซนติเมตร\r\nน้ำหนักเหยื่อ 155 กรัม\r\nขนาดตัวเบ็ด 4/0 ', 'คุณสมบัติ: ชิ้นส่วนที่ทนทานพิเศษของ Daiwa ที่ออกแบบมาอย่างละเอียด, รูปแบบลวดลายเกล็ดที่แกะสลักด้วยมือช่วยเพิ่มความสวยงามและความสมจริง, ใบพัดหน้าหมาย (Forward Facing Front Prop) สำหรับรุ่นลอยน้ำ (Floating Model), ใบพัดย้อนกลับ (Reverse Prop) สำหรับรุ่น SS และ FS, ใบมีดสแตนเลสที่ช่วยเพิ่มการสั่นสะเทือน เสียง และการเคลื่อนไหว, ตะขอคมพิเศษขนาด 4/0 ที่คมมากเพื่อการจับปลาที่มีประสิทธิภาพ, ดวงตาสามมิติที่สมจริงเพิ่มความเป็นธรรมชาติให้กับเหยื่อ.', '78624672220250227_040720.png', 236, '10', 'ชิ้น', 8, '2025-03-01 19:19:18'),
(31, 'TD MINNOW', 13, 'สี WAKASAGI\r\nความยาว 7.62 เซนติเมตร\r\nน้ำหนักเหยื่อ 20 กรัม\r\nขนาดตัวเป็น เบอร์ 10', 'Daiwa TD Minnow ช่วยให้การปั่นสายได้ไกลและสร้างเสียงกระทบที่ดังเมื่อมันเคลื่อนที่ผ่านน้ำ พร้อมด้วยการออกแบบที่มีสีสันสดใสหลายแบบ ทำให้เป็นล่อที่ควรมีสำหรับนักตกปลาทุกคนที่ชื่นชอบการตกปลาด้วยล่อที่หายากและไม่เหมือนใคร', '174941330520250227_042942.png', 370, '10', 'ชิ้น', 3, '2025-02-26 21:29:42'),
(32, 'SALTIGA DORADO POPPER', 13, 'สี LASER PINK PURPLE\r\nความยาว 7.62 เซนติเมตร\r\nน้ำหนักเหยื่อ 17 กรัม\r\nขนาดตัวเบ็ด 1/0', 'ความมั่นคงในขณะทำการเคลื่อนที่พร้อมกับการเบี่ยงเบนปริมาณน้ำจำนวนมากในระหว่างการตกลงช้าๆ และสร้างเสียงได้มาก รุ่นลอยน้ำช่วยให้คุณสามารถสร้างการเคลื่อนไหวที่สร้างความตื่นเต้นบนผิวน้ำ ดึงดูดความสนใจจากสัตว์นักล่าที่อยู่ในรัศมีที่กว้าง', '35574263720250227_043020.png', 480, '11', 'ชิ้น', 3, '2025-02-26 21:30:20'),
(33, 'QUNAI SPOON', 13, 'สี IKURA\r\nความยาว  7.62\r\nน้ำหนักเหยื่อ 11 กรัม\r\nขนาดตัวเบ็ด เบอร์ 4', 'เลียนแบบการเคลื่อนไหวตามธรรมชาติของเหยื่อ, ทำให้โอกาสในการจับปลาประสบความสำเร็จเพิ่มขึ้น ไม่ว่าคุณจะเป็นนักตกปลาที่มีประสบการณ์หรือเพิ่งเริ่มต้น, Daiwa Qunai Spoon คือสิ่งที่คุณต้องมีในกล่องอุปกรณ์ของคุณ', '182467820420250227_042523.png', 270, '12', 'ชิ้น', 1, '2025-02-26 21:29:50'),
(34, 'SC SHAD', 13, 'สี LASER PINK PURPLE\r\nความยาว 5 เซนติเมตร\r\nน้ำหนักเหยื่อ 17 กรัม\r\nขนาดตัวเบ็ด เบอร์ 12', 'Daiwa SC Shad มีรูปลักษณ์ที่สมจริงสุดๆ พร้อมด้วยตาที่สั่นและสีสันที่ดูเหมือนของจริงที่จะดึงดูดปลาจากระยะไกล SC Shad มีความยาว 2 นิ้ว และมีสีสันที่หลากหลาย  ที่ดูเป็นธรรมชาติ ซึ่งปลาหลายชนิดไม่สามารถต้านทานได้', '99078104120250227_042738.png', 300, '10', 'ชิ้น', 2, '2025-03-02 12:29:51'),
(35, 'J-BRAID X8 GRAND BRAIDED LINE - GREY LIGHT', 12, 'ความยาว 270 เมตร\r\nGrey Light  \r\nการถัก 8 เส้น หรือ เชือกถัก 8 เส้น\r\n', 'ขอแนะนำ J-BRAID x8 GRAND สายเบรดอันยอดเยี่ยมใหม่จากครอบครัว J-Braid ของ Daiwa ที่แข็งแรงและทนทานต่อการขัดสี แต่ยังคงมีความยืดหยุ่นเพียงพอที่จะเคลื่อนตัวได้ราบเรียบบนม้วนสาย สาย J-Braid x8 GRAND เป็นสายคุณภาพสูงที่ใช้วัสดุชั้นยอดจากประเทศญี่ปุ่น สายนี้ถักจาก Izanas วัสดุใหม่ที่ใช้เทคโนโลยีสมัยใหม่และมีการถัก 8 เส้น ซึ่งทำให้สายนี้มีความยืดหยุ่นและทนทานต่อการขัดสีได้ดีกว่าสาย 4 เส้นทั่วไปถึง 4 เท่า', '70726798820250227_044204.png', 370, '10', 'ชิ้น', 4, '2025-02-26 21:51:10'),
(36, 'J-BRAID x8 GRAND BRAIDED LINE - MULTI COLOR', 12, 'ความยาว 300 เมตร\r\nMulti Color\r\nการถัก 8 เส้น หรือ เชือกถัก 8 เส้น', 'ขอแนะนำ J-BRAID x8 GRAND สายเบรดสุดยอดใหม่ในครอบครัว J-Braid ของ Daiwa ที่แข็งแกร่งและทนทานต่อการขัดสี แต่ยังคงมีความยืดหยุ่นพอสมควรเพื่อให้สายวางตัวได้อย่างราบเรียบบนม้วน สาย J-Braid x8 GRAND นี้เป็นสายเบรดคุณภาพสูงที่ทำจากวัสดุที่ดีที่สุดจากญี่ปุ่น โดยมีการถัก 8 เส้น ซึ่งใช้วัสดุใหม่ชื่อว่า Izanas ที่มีเทคโนโลยีทันสมัย และทำให้สายนี้มีความยืดหยุ่นสูงและทนทานต่อการขัดสีได้ดีกว่าสาย 4 เส้นทั่วไปถึง 4 เท่า\r\n\r\nJ-BRAID™ MULTI COLOR - การเข้าถึงระดับความลึกที่ต้องการไม่เคยง่ายขนาดนี้มาก่อน สายนี้จะมีการเปลี่ยนสีทุกๆ 10 เมตร ทำให้คุณสามารถเข้าถึงพื้นที่ที่ปลาอาจจะอยู่ได้อย่างรวดเร็ว', '104741263920250227_044612.png', 450, '10', 'ชิ้น', 2, '2025-02-27 07:01:35'),
(37, 'SALTIGA x12 BRAIDED LINE', 12, 'ความยาว 1,800 เมตร\r\nMulti Color\r\nการถัก 12 เส้น หรือ เชือกถัก 12 เส้น\r\n\r\n', 'Daiwa’s Saltiga X12 braid พาสายการตกปลาขึ้นไปอีกขั้นด้วยความแข็งแกร่งและประสิทธิภาพที่ยอดเยี่ยม ด้วยการถักสายเบรด 12 เส้น Saltiga X12 ให้ความเรียบลื่นและทนทานต่อการขัดสีที่ไม่มีใครเทียบได้ พร้อมกับยังคงรักษาความบางของเส้นสายไว้ได้ สายเบรดระดับพรีเมียมนี้เหมาะสำหรับนักตกปลาที่ต้องการเป้าหมายใหญ่ ด้วยเทคนิคการตกปลาหลายรูปแบบ ตั้งแต่การตกปลาลึกสำหรับปลากะมงไปจนถึงการตกปลาด้วยเหยื่อเบาๆ สำหรับปลาปะการังที่แข็งแรง\r\n\r\nตัวบ่งชี้การเปลี่ยนสีช่วยให้การติดตามระดับความลึกง่ายขึ้น โดยการเปลี่ยนสีทุกๆ 10 เมตร พร้อมด้วยตัวบ่งชี้ที่ 5 เมตรและ 1 เมตรเพื่อแสดงความลึกและการเคลื่อนไหวของสาย', '35145474420250227_045106.png', 1500, '10', 'ชิ้น', 1, '2025-02-26 22:06:46'),
(38, 'J-BRAID x4 BRAIDED LINE - MULTI COLOR', 12, 'ความยาว 300 เมตร\r\nMulti Color\r\nการถัก 4 เส้น หรือ เชือกถัก 4 เส้น', 'J-BRAID x4 เหมาะสำหรับความทนทานต่อการขูดขีดและการผูกปมได้ง่าย รวมถึงการจัดการสายที่สะดวก เส้นใย 4 ตัวช่วยให้เส้นมีเส้นผ่านศูนย์กลางบางลง ซึ่งเหมาะสำหรับการเพิ่มความยาวของสายบนรีลเมื่อจำเป็น J-BRAID x4 ผลิตจากวัสดุ Dyneema คุณภาพสูงจากญี่ปุ่น ด้วยมาตรฐานการผลิตที่พิสูจน์แล้วของ Daiwa ทำให้ J-Braid เป็นหนึ่งในสายถักที่ดีที่สุดในตลาดปัจจุบัน', '93540895220250227_045408.png', 250, '5', 'ชิ้น', 6, '2025-02-27 07:01:26'),
(39, 'DAIWA PRYMAL FRONT LOAD BOX', 11, '(ขนาด: 13” x 10.24” x 17.72”)\r\n3 ถาดเก็บของ\r\nเหมาะสำหรับเหยื่อ, จิ๊ก, อุปกรณ์ตกปลา, ครีมกันแดด และเครื่องมือ', 'ให้คุณมีพื้นที่จัดเก็บด้านบนสำหรับสายและอุปกรณ์ตกปลา สามารถจัดเก็บกล่อง Daiwa 3600 ได้ 3 กล่อง พร้อมตัวแบ่งที่มีลิ้นชักแบบจดสิทธิบัตร ให้คุณเข้าถึงเหยื่อและอุปกรณ์ได้อย่างง่ายดาย\r\n\r\nกล่องตกปลานี้มีพื้นที่จัดเก็บมากมาย กระเป๋าด้านบนขนาดใหญ่สามารถใส่ถาดเก็บของ 3 ถาด ที่วางแว่นกันแดดที่มีการออกแบบขึ้นรูป พร้อมกระเป๋าด้านข้างที่มีซิป 2 ช่อง ที่จับขนาดใหญ่ สายสะพายไหล่ที่รองรับได้ดีและการจัดระเบียบอุปกรณ์ตกปลาอย่างยอดเยี่ยมที่สามารถพกพาไปได้ทุกที่', '206141966220250227_045724.png', 799, '3', 'ใบ', 19, '2025-02-27 07:11:44'),
(40, 'AbuGarcia Vengeance  Casting Rod', 9, 'ผลิตจากกราไฟต์ (Graphite) ด้ามจับ EVA Handle\r\nModel Number VENC69-6 (รุ่นคันเบ็ด)\r\nRod Action (แอคชั่นของคันเบ็ด): Fast\r\nGuide Type  (ชนิดของไกด์) \r\nStainless Steel Guides\r\n Guides (ไกด์) 9', 'ซีรีส์คันเบ็ด Vengeance รุ่นอัปเดตมอบประสิทธิภาพ สไตล์ และความทนทานในดีไซน์ที่สมดุลและน้ำหนักเบา สร้างขึ้นด้วยกราไฟต์ 24 ตันที่มีโมดูลัสระดับกลาง เพื่อให้คันเบ็ดมีความแข็งแรงและความไวสูง ช่วยเพิ่มประสิทธิภาพการตกปลาให้ดียิ่งขึ้น มาพร้อมไกด์สแตนเลสที่ช่วยให้การตีสายลื่นไหลและแม่นยำ ด้ามจับ EVA แบบแยกส่วนช่วยให้จับได้สบายมือและใช้งานได้ยาวนานโดยไม่เมื่อยล้า อีกทั้งยังเป็นคันเบ็ดที่ให้ประสิทธิภาพสูงในราคาที่คุ้มค่า ไม่ว่าคุณจะเป็นนักตกปลามืออาชีพหรือมือใหม่ Vengeance series จะช่วยให้คุณสัมผัสคุณภาพที่ยอดเยี่ยมและความคุ้มค่าในทุกๆ การตกปลา', '72723800020250227_150241.png', 2300, '5', 'ชิ้น', 4, '2025-03-02 12:43:25'),
(41, 'AbuGarcia Jordan Lee Casting Rod', 9, 'ผลิตจากกราไฟต์ 24 ตัน ด้ามจับ Winn split grip\r\nModel Number (รุ่นคันเบ็ด)\r\n•    JLEEC610-7\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    JLEEC610-7: 10 - 20lb\r\n•    JLEECW70-5: 8 - 17 lb\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    JLEEC610-7: Fast\r\n•    JLEECW70-5: Moderate Fast\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Stainless Steel\r\n•  Guides (ไกด์) 9', 'Jordan Lee เป็นชื่อที่ได้รับความนิยมอย่างมากในวงการตกปลา เขาสร้างประวัติศาสตร์ด้วยการคว้าแชมป์ Classic สองสมัยติดต่อกัน และเป็นผู้ชนะรายการ MLF Bass Pro Tour ครั้งแรก เราได้ร่วมมือโดยตรงกับ Jordan Lee เพื่อออกแบบและปรับแต่งแอคชั่นของคันเบ็ดให้เหมาะกับสไตล์การตกปลาของเขา โดยมีรุ่นเฉพาะทางถึง 14 แบบ ที่ตอบโจทย์เทคนิคการตกปลาที่แตกต่างกัน JLEE Pro Rods จึงเป็นตัวเลือกที่เหมาะสมสำหรับนักตกปลาแบสทุกคน', '25290338220250227_150850.png', 3300, '7', 'คัน', 4, '2025-03-02 17:33:14'),
(42, 'KastKing Royale Legend Pro Casting Rods', 9, 'ผลิตจากกราไฟต์ ด้ามจับ EVA & Cork Handle\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDCSTRLP-72JW2PU\r\n•    KRDCSTRLP-710HC2PU\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDCSTRLP-72JW2PU : 10-20\r\n•    KRDCSTRLP-710HC2PU : 12-25\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDCSTRLP-72JW2PU : Fast\r\n•    KRDCSTRLP-710HC2PU : Fast\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Fuji FazLite Guides\r\n•  Guides (ไกด์) 10', 'Ultimate Sensitivity – คันเบ็ด KastKing Royale Legend Pro สำหรับตกปลาบาส ผลิตจากกราไฟต์ KastFlex IM7 คุณภาพสูง ผ่านกระบวนการรีดภายใต้แรงดันสูง พร้อมเคลือบด้วย Nano Resin ทำให้ได้คันเบ็ดที่ทั้งเบาและไวต่อการสัมผัสสุดขีด มอบความแข็งแกร่งและความรู้สึกในการตกปลาที่เหนือชั้น\r\n\r\nFuji FazLite Guides – คันเบ็ด Royale Legend Pro Bass Fishing Rods มาพร้อมกับไกด์ Fuji Stainless Steel K Frame ที่มี FazLite Inserts ช่วยควบคุมสายได้อย่างมีประสิทธิภาพ ลดปัญหาสายพันกันโดยให้วงไกด์ช่วยดันสายออกไปด้านหน้าโดยอัตโนมัติ มุมเอียงของวงไกด์ที่ออกแบบมาอย่างแม่นยำช่วยให้การคลายตัวของสายทำได้รวดเร็ว ใช้งานได้ดีกับสาย Mono, Braid และ Fluorocarbon ให้การตีสายที่ลื่นไหลและทนทานสูงสุด', '128758550020250227_151157.png', 3150, '6', 'คัน', 8, '2025-03-02 13:01:42'),
(43, 'KastKing Kong Casting Rods', 9, 'ผลิตจากกราไฟต์ ด้ามจับ EVA\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDCSTKG-66XH1\r\n•    KRDCSTKG-7M2\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDCSTKG-66XH1 : 50-100\r\n•    KRDCSTKG-7M2 : 10-20\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDCSTKG-66XH1 : Fast\r\n•    KRDCSTKG-7M2 : Fast\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Stainless-Steel Double Foot Guides\r\n•  Guides (ไกด์) 8', 'คันเบ็ดกราไฟต์ S-Curve ที่ทรงพลัง\r\nคันเบ็ด KastKing KONG ถูกออกแบบมาสำหรับนักตกปลาที่ต้องการล่าปลาขนาดใหญ่ทั้งน้ำจืดและน้ำเค็ม! โครงสร้างแบลงค์กราไฟต์ 100% S-Curve มีความแข็งแกร่งสูง เสริมด้วยเทคโนโลยี Nano-Resin ทำให้มีพลังยกที่ยอดเยี่ยม แต่ยังคงมีน้ำหนักเบาและไวต่อสัมผัสอย่างน่าทึ่ง\r\n\r\nไกด์ขาคู่สแตนเลสสตีล\r\nเนื่องจากคันเบ็ด KastKing KONG ถูกออกแบบมาเพื่อรองรับปลาขนาดยักษ์ ทุกองค์ประกอบจึงต้องแข็งแกร่งเป็นพิเศษ เราเลือกใช้เฉพาะ ไกด์ขาคู่สแตนเลสสตีล ที่ทนทาน และเสริมด้วยวงแหวน Titanium Oxide ที่ลื่นเป็นพิเศษ ออกแบบมาให้ทำงานได้อย่างไร้ที่ติ แม้ใช้กับสายถักขนาดหนัก ???????? การผสมผสานระหว่างโครงสร้างที่แข็งแกร่งและวงแหวนที่ทนทาน ทำให้คันเบ็ดนี้เหมาะกับสภาพแวดล้อมสุดโหด!', '58901767320250227_151749.png', 2700, '6', 'คัน', 1, '2025-02-27 08:50:20'),
(44, 'DAIWA ZILLION RODS', 9, 'ผลิตจากกราไฟต์ ด้ามจับ Carbon MQ Grip\r\nModel Number (รุ่นคันเบ็ด)\r\n•    ZLON681MRB-FL\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDCSTRLP-72JW2PU : 10-20\r\n•    KRDCSTRLP-710HC2PU : 12-25\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•  moderate\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์Fuji  Alconite K Style Guide\r\n•  Guides  9 (ไกด์)', 'แนะนำคันเบ็ด Daiwa Zillion Bass รุ่นใหม่ล่าสุดที่ออกแบบมาเพื่อยกระดับประสบการณ์การตกปลาให้เหนือชั้นไปอีกขั้น คันเบ็ดรุ่นนี้มาพร้อมกับเทคโนโลยีล้ำสมัยและงานฝีมือระดับสูง มอบประสิทธิภาพและความแม่นยำที่เหนือกว่า Carbon MQ Grip ในส่วนก้นคันช่วยเพิ่มความไว ลดน้ำหนักโดยรวม และให้การควบคุมที่ดีเยี่ยม พร้อมลดอาการเมื่อยล้าระหว่างการตีเหยื่อและกรอเหยื่อเป็นเวลานาน FLEX LITE ถูกออกแบบมาสำหรับการใช้กับเหยื่อประเภท Moving Bait โดยให้ฟีลลิ่งคล้ายไฟเบอร์กลาส แต่มีน้ำหนักเบากว่าแบบดั้งเดิมอย่างมาก ด้วยเทคโนโลยี SVF GLASS ของ Daiwa ที่ควบคุมปริมาณเรซิน ทำให้คันเบ็ดเบาขึ้นอย่างที่ไม่เคยมีมาก่อน SVF Nanoplus Technology เพิ่มทั้งความแข็งแกร่งและความไวต่อสัมผัส ช่วยให้คุณเชื่อมต่อกับโลกใต้น้ำได้ดีขึ้น X45 Technology ลดการบิดของคันขณะเหวี่ยงเหยื่อ ช่วยให้การตีเหยื่อแม่นยำขึ้นและระยะทางไกลขึ้น Air Sensor Seat ลดจุดสัมผัสกับมือของคุณ เพิ่มความไวต่อแรงกัดของปลา แม้แต่การกัดที่เบาที่สุดก็สามารถรับรู้ได้ Fuji K Guide System เพิ่มความทนทานและการจัดการสายที่ลื่นไหล ลดแรงเสียดทานและปัญหาสายพันกัน ให้การตกปลาของคุณราบรื่นกว่าที่เคย Daiwa Zillion Bass Rods เป็นตัวเลือกที่สมบูรณ์แบบสำหรับนักตกปลาที่ต้องการคันเบ็ดที่ทั้งเบา ไว และทรงพลัง', '38967436320250227_152703.png', 5900, '1', 'คัน', 5, '2025-02-27 08:47:06'),
(45, 'KastKing Royale Legend Pro Casting Rods', 9, 'ผลิตจากกราไฟต์ ด้ามจับ EVA & Cork Handle\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDCSTRLP-72JW2PU\r\n•    KRDCSTRLP-710HC2PU\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDCSTRLP-72JW2PU : 10-20\r\n•    KRDCSTRLP-710HC2PU : 12-25\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDCSTRLP-72JW2PU : Fast\r\n•    KRDCSTRLP-710HC2PU : Fast\r\n Guide Type (ชนิดของไกด์)\r\n•   ไกด์ Fuji FazLite Guides\r\n•    Guides (ไกด์) 10', 'KastKing Royale Legend Pro Bass Fishing Rods ถูกออกแบบมาเพื่อมอบประสบการณ์ตกปลาที่เหนือกว่า ด้วยโครงสร้างจาก High Modulus KastFlex IM7 Graphite Blanks ผสานกับ Nano Resins ทำให้คันเบ็ดมีความไวสูง น้ำหนักเบา แต่ยังคงความแข็งแกร่งเป็นพิเศษ ช่วยให้สามารถรับรู้แรงกัดของปลาได้อย่างแม่นยำ Fuji FazLite Guides ช่วยจัดการสายเบ็ดได้อย่างราบรื่น ด้วยโครงสร้างจากสเตนเลสสตีล K Frame และ FazLite Inserts ซึ่งช่วยลดแรงเสียดทาน ป้องกันปัญหาสายพันกัน และรองรับการใช้งานกับสายประเภท Mono, Braid และ Fluorocarbon ได้เป็นอย่างดี นอกจากนี้ คันเบ็ดยังมาพร้อมกับด้ามจับ SlipLock Technology ที่เคลือบด้วยพื้นผิวซิลิโคนแบบพิเศษ เพิ่มแรงยึดเกาะสูงสุด แม้ในสภาพเปียกน้ำ พร้อมทั้งมีอายุการใช้งานที่ยาวนานกว่าปกติถึง 5 ปี ตัวคันยังถูกเสริมด้วยโครงสร้าง Strong & Sensitive Construction ที่ให้การจับที่มั่นคงผ่าน Custom Spinning & Casting Reel Seats ซึ่งช่วยยึดรอกให้อยู่กับที่ รวมถึง Custom Foregrip และ Built-in Hook Keeper ที่ช่วยป้องกันไม่ให้เบ็ดพันกับอุปกรณ์อื่นๆ อีกทั้งยังมีเทคโนโลยี KastKing PTS (Power Transition System) ที่ช่วยให้คันเบ็ดแบบ 2 ท่อนสามารถถ่ายทอดพลังได้อย่างราบรื่น', '10579604220250228_202324.jpg', 3150, '110', 'คัน', 5, '2025-03-02 12:29:34'),
(46, 'KastKing Valiant Eagle Passage Travel Fishing Rods (4 ท่อน)', 9, 'ผลิตจากกราไฟต์คาร์บอน ด้ามจับ EVA\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDCSTVEP-7MH4\r\n•    KRDCSTVEP-76H4\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDCSTVEP-7MH4 : 10-20\r\n•    KRDCSTVEP-76H4 : 15-40\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDCSTKG-66XH1 : Fast\r\n•    KRDCSTKG-7M2 : Fast\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Titanium Oxide Performance Line Guides\r\n•  Guides (ไกด์) 10', 'KastKing Valiant Eagle Passage Travel Rods ถูกออกแบบมาเพื่อนักเดินทางที่ต้องการพกพาคันเบ็ดคู่ใจไปทุกที่ ผลิตจาก KastFlex IM6 30T Graphite Blanks ซึ่งเป็นกราไฟต์คุณภาพสูงที่ให้ทั้งความแข็งแกร่งและความไว ช่วยให้สามารถแทงเบ็ดได้อย่างแม่นยำและตอบสนองต่อแรงกัดของปลาได้อย่างดีเยี่ยม แม้ว่าจะเป็นคันเบ็ดแบบหลายท่อน แต่การออกแบบช่วยให้ให้ความรู้สึกเหมือนคันเบ็ดแบบ 1 หรือ 2 ท่อน พร้อมรองรับการตกปลาน้ำจืดและน้ำเค็มได้อย่างมีประสิทธิภาพ อีกทั้งยังมาพร้อมกับไกด์สาย Titanium Oxide ที่มีความแข็งแกร่ง ทนต่อแรงเสียดทานของสายเบ็ดรุ่นใหม่ที่ได้รับความนิยมในปัจจุบัน ไม่เกิดรอยจากแรงดึงของปลาใหญ่ และช่วยให้สามารถตีสายได้ในระยะที่ไกลขึ้น รุ่นนี้ยังมาพร้อมกับองค์ประกอบระดับพรีเมียม เช่น ด้ามจับไม้ก๊อกที่ให้สัมผัสกระชับมือ และที่นั่งรอกที่ทำจากกราไฟต์หรืออะลูมิเนียม CNC ตามแต่ละรุ่น อีกทั้งยังมาพร้อมกับหลอดใส PET ที่ช่วยปกป้องคันเบ็ดของคุณระหว่างการเดินทาง', '136720405420250227_155541.jpg', 3600, '55', 'คัน', 0, '2025-02-27 08:55:41'),
(47, 'abuGarcia Veritas Spinning Rod (Prior Gen)', 10, ' ผลิตจากกราไฟต์ 30 ตัน  ด้ามจับ EVA \r\nModel Number (รุ่นคันเบ็ด)\r\n•    VTPS66-5\r\n•    VTPS66-6\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    VTPS66-5: 6 - 12 lb\r\n•    VTPS66-6: 8 - 14 lb\r\nRod Action (แอคชั่นของคันเบ็ด)\r\n•    VTPS66-5: Fast\r\n•    VTPS66-6: Moderate Fast\r\nGuide Type (ชนิดของไกด์)\r\n•  Stainless Steel/Aluminum Oxide\r\n•  Guides (ไกด์) 8', 'Abu Garcia Veritas Spinning Rod (Prior Gen) คือคันเบ็ดที่ออกแบบมาเพื่อนักตกปลาที่ต้องการทั้งความทนทานและประสิทธิภาพในการใช้งาน โครงสร้างของคันเบ็ดผลิตจาก 30 Ton Graphite ที่ผ่านการพัฒนาให้มีน้ำหนักเบา แต่ยังคงความแข็งแกร่งสูงสุด ช่วยเพิ่มความไวต่อแรงกัดของปลาและการควบคุมที่แม่นยำ เทคโนโลยี SubLayer Armor™ ช่วยเสริมความแข็งแรงให้กับโครงสร้างของคันเบ็ดโดยการเสริมชั้นวัสดุเพิ่มเติม ทำให้สามารถรับแรงดึงสูงได้โดยไม่ลดทอนความไวของคัน\r\n\r\nนอกจากนี้ Abu Garcia Veritas Spinning Rod ยังมาพร้อมกับ Fuji Reel Seat ที่ออกแบบมาให้จับกระชับมือและช่วยให้การส่งพลังไปยังคันเบ็ดเป็นไปอย่างมีประสิทธิภาพ ระบบไกด์ Titanium Alloy Guides with Zirconium Inserts ช่วยลดแรงเสียดทานของสายเบ็ด ทำให้สามารถตีเหยื่อได้ในระยะที่ไกลขึ้นและลดปัญหาสายพันกัน\r\n\r\nด้ามจับใช้วัสดุ High-Density EVA Grip ที่ให้ความสบายในการถือและช่วยให้ควบคุมคันเบ็ดได้ดีขึ้นแม้ในสภาพอากาศเปียกชื้น คันเบ็ดรุ่นนี้มีหลายขนาดและระดับพลังงานให้เลือกเพื่อตอบโจทย์เทคนิคการตกปลาที่แตกต่างกัน ไม่ว่าจะเป็นการตกปลาน้ำจืดหรือน้ำเค็ม Abu Garcia Veritas Spinning Rod เป็นตัวเลือกที่ยอดเยี่ยมสำหรับนักตกปลาที่มองหาคันเบ็ดที่ให้ทั้งความทนทาน น้ำหนักเบา และประสิทธิภาพสูงสุด', '138433559520250227_160005.jpg', 4000, '42', 'คัน', 3, '2025-03-02 12:41:59'),
(48, 'abuGarcia Vengeance® Spinning Rod', 10, 'ผลิตจากกราไฟต์ 24 ตัน ด้ามจับ EVA\r\n•  Model Number (รุ่นคันเบ็ด)\r\n•    VENS66-5\r\n•    VENS69-4\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    VENS66-5: 6 - 12 lb\r\n•    VENS69-4: 6 - 10 lb\r\nRod Action (แอคชั่นของคันเบ็ด)\r\n•    ทุกตัวเป็น Fast Action\r\nGuide Type (ชนิดของไกด์)\r\n•  Stainless Steel/Aluminum Oxide\r\n•  Guides (ไกด์) 8', 'Abu Garcia Vengeance® Spinning Rod คือคันเบ็ดที่ออกแบบมาเพื่อมอบทั้งความแข็งแกร่งและความไวในการใช้งาน เหมาะสำหรับนักตกปลาที่ต้องการประสิทธิภาพในราคาที่คุ้มค่า โครงสร้างของคันเบ็ดผลิตจาก 24 Ton Graphite Construction ที่ให้ทั้งความทนทานและน้ำหนักเบา พร้อมช่วยให้สามารถรับรู้แรงกัดของปลาได้อย่างแม่นยำ\r\n\r\nคันเบ็ดรุ่นนี้มาพร้อมกับ Stainless Steel Guides with Titanium Oxide Inserts ที่ช่วยลดแรงเสียดทานของสายเบ็ด รองรับการใช้งานกับสายประเภท Mono, Fluorocarbon และ Braid ได้อย่างมีประสิทธิภาพ ระบบ Texas-Rigged Hook Keeper ช่วยให้สามารถเก็บเบ็ดได้สะดวก ไม่พันกันระหว่างการเดินทางหรือการจัดเก็บ\r\n\r\nด้ามจับทำจาก High-Density EVA Grip ให้ความกระชับและความสบายในการใช้งาน แม้ในสภาพอากาศเปียกชื้น พร้อม Exposed Blank Reel Seat ที่ช่วยเพิ่มความไวในการส่งพลังจากสายเบ็ดไปยังมือของผู้ใช้ ทำให้สามารถตอบสนองต่อแรงกัดของปลาได้อย่างรวดเร็ว\r\n\r\nAbu Garcia Vengeance® Spinning Rod เป็นคันเบ็ดที่ให้ทั้งความคุ้มค่า แข็งแรง และไวต่อสัมผัส เหมาะสำหรับทั้งนักตกปลามือใหม่และมืออาชีพที่ต้องการคันเบ็ดที่ตอบโจทย์ทุกสถานการณ์ในการตกปลา', '68316945720250227_160119.jpg', 2000, '78', 'คัน', 1, '2025-02-27 09:01:41'),
(49, 'KastKing WideEye Walleye Fishing Rod', 10, 'ผลิตจากกราไฟต์คาร์บอน ด้ามจับ EVA\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDSPNWE-62PJML1\r\n•    KRDSPNWE-77SR1\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDSPNWE-62PJML1 : 4-10\r\n•    KRDSPNWE-77SR1 : 4-8\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDSPNWE-62PJML1 : Extra Fast\r\n•    KRDSPNWE-77SR1 : Fast\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Fuji Tangle Free K-Frame Guides\r\n•  Guides (ไกด์) 9', 'KastKing WideEye Walleye Rods ถูกออกแบบมาเพื่อมอบทั้งพลังและความไวระดับสูงสุดในการตกปลา ด้วยโครงสร้างจาก Toray IM9 Graphite Blanks ที่ใช้เทคโนโลยี Nano-Resin ที่มีค่าแรงดึงสูงถึง 640K ทำให้คันเบ็ดมีน้ำหนักเบาแต่ยังคงความแข็งแกร่ง รองรับเทคนิคการตกปลาแบบเฉพาะทางได้อย่างมีประสิทธิภาพ\r\n\r\nคันเบ็ดรุ่นนี้มาพร้อมกับ Fuji Tangle Free K-Frame Guides สำหรับรุ่น Spinning และ Fuji L-Frame Baitcaster Guides สำหรับรุ่น Casting ช่วยลดปัญหาสายพันกันและเพิ่มความลื่นไหลของสาย นอกจากนี้ ยังใช้ Fuji IPS Reel Seats สำหรับรุ่น Spinning และ Fuji TCS Reel Seats สำหรับรุ่น Casting เพื่อให้สามารถจับได้อย่างกระชับและควบคุมคันเบ็ดได้อย่างมีเสถียรภาพ\r\n\r\nหนึ่งในจุดเด่นสำคัญของ WideEye Walleye Rods คือการลดน้ำหนักของคันเบ็ดให้เบาที่สุดเท่าที่เคยมีมา โดยมีน้ำหนักเริ่มต้นเพียง 3.5 ออนซ์ ลดอาการเมื่อยล้าจากการใช้งานเป็นเวลานาน วัสดุ High-Carbon IM9 ผสานกับ AAA Cork Split Rear Handle ในรุ่น Spinning ช่วยให้จับได้กระชับและมั่นคงในทุกจังหวะการตกปลา\r\n\r\nคันเบ็ดรุ่นนี้ออกแบบมารองรับเทคนิคตกปลาเฉพาะทาง เช่น Jigging, Rigging, Slip Bobber Presentations และ Trolling เพื่อให้ได้ผลลัพธ์ที่ดีที่สุดในการตกปลา Walleye', '197784333120250227_160911.jpg', 3400, '70', 'คัน', 0, '2025-02-27 09:09:11'),
(50, 'KastKing Zephyr Dual Tip Spinning Rod ', 10, 'ผลิตจากกราไฟต์คาร์บอน ด้ามจับ EVA\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDSPNZP-62MLM2BK \r\n•    KRDSPNZP-68MLM2BK \r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDSPNZP-62MLM2BK : 6-12\r\n•    KRDSPNZP-68MLM2BK :  8-14\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDSPNZP-62MLM2BK : Fast	\r\n•    KRDSPNZP-68MLM2BK : Fast	\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Fuji O-ring Guides\r\n•  Guides (ไกด์) 10', 'astKing Zephyr Dual Tip Fishing Rods คือคันเบ็ดที่ออกแบบมาให้มีน้ำหนักเบาและไวต่อสัมผัส ผลิตจากวัสดุ KastFlex IM6 Graphite ที่ให้สมดุลระหว่างพลัง ความทนทาน และความไวต่อแรงกัดของปลาอย่างลงตัว เหมาะสำหรับนักตกปลาทุกระดับ ตั้งแต่มือใหม่ไปจนถึงมืออาชีพ\r\n\r\nคันเบ็ดรุ่นนี้มาพร้อมกับ Fuji O-ring Guides ที่ให้ความลื่นไหลของสายเบ็ด ลดแรงเสียดทาน ช่วยให้การตีเหยื่อเป็นไปอย่างมีประสิทธิภาพ การออกแบบไกด์ให้รองรับ 360 องศา ช่วยลดการสึกหรอของสายเบ็ดและลดปัญหาสายพันกัน รองรับสายเบ็ดทุกประเภท ไม่ว่าจะเป็น Braid, Mono หรือ Fluorocarbon\r\n\r\nจุดเด่นของ KastKing Zephyr Dual Tip Rods คือ Interchangeable Dual Power Tips หรือปลายคันเบ็ดที่สามารถสลับเปลี่ยนได้ตามสภาพแวดล้อมการตกปลา โดยแต่ละปลายจะมีระดับพลังที่แตกต่างกัน ซึ่งระบุไว้อย่างชัดเจนที่จุดเชื่อมต่อ ทั้งสองปลายใช้ Fuji O-rings เพื่อให้มั่นใจว่าการส่งสายเป็นไปอย่างลื่นไหลและลดความเสียหายของสาย\r\n\r\nKastKing Zephyr Dual Tip Fishing Rods คือคันเบ็ดที่ออกแบบมาให้มีน้ำหนักเบาและไวต่อสัมผัส ผลิตจากวัสดุ KastFlex IM6 Graphite ที่ให้สมดุลระหว่างพลัง ความทนทาน และความไวต่อแรงกัดของปลาอย่างลงตัว เหมาะสำหรับนักตกปลาทุกระดับ ตั้งแต่มือใหม่ไปจนถึงมืออาชีพ\r\n\r\nคันเบ็ดรุ่นนี้มาพร้อมกับ Fuji O-ring Guides ที่ให้ความลื่นไหลของสายเบ็ด ลดแรงเสียดทาน ช่วยให้การตีเหยื่อเป็นไปอย่างมีประสิทธิภาพ การออกแบบไกด์ให้รองรับ 360 องศา ช่วยลดการสึกหรอของสายเบ็ดและลดปัญหาสายพันกัน รองรับสายเบ็ดทุกประเภท ไม่ว่าจะเป็น Braid, Mono หรือ Fluorocarbon\r\n\r\nจุดเด่นของ KastKing Zephyr Dual Tip Rods คือ Interchangeable Dual Power Tips หรือปลายคันเบ็ดที่สามารถสลับเปลี่ยนได้ตามสภาพแวดล้อมการตกปลา โดยแต่ละปลายจะมีระดับพลังที่แตกต่างกัน ซึ่งระบุไว้อย่างชัดเจนที่จุดเชื่อมต่อ ทั้งสองปลายใช้ Fuji O-rings เพื่อให้มั่นใจว่าการส่งสายเป็นไปอย่างลื่นไหลและลดความเสียหายของสาย\r\n\r\nโครงสร้างของคันเบ็ดได้รับการออกแบบให้ใช้งานได้หลากหลายและสบายมือ Drop Shot Hook Keeper ที่อยู่ด้านหลังของด้ามจับช่วยให้สามารถเก็บเบ็ดได้สะดวก รองรับทั้ง Drop Shot weights, เหยื่อแข็ง และเบ็ดเดี่ยว ด้ามจับทำจาก High-Density Black EVA ทั้งส่วน Foregrip, Handle และ Rear Grip ให้ความกระชับและกันลื่นได้ดีในทุกสภาพอากาศ\r\n\r\n\r\n', '167800347920250228_212132.jpg', 2000, '45', 'คัน', 0, '2025-02-28 14:21:32');
INSERT INTO `tbl_product` (`p_id`, `p_name`, `type_id`, `p_spec`, `p_detail`, `p_img`, `p_price`, `p_qty`, `p_unit`, `p_view`, `datesave`) VALUES
(51, 'KastKing Royale Legend Pro Spinning Rods', 10, 'ผลิตจากกราไฟต์คาร์บอน ด้ามจับ EVA\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDSPNRLP-610FS2PU	\r\n•    KRDSPNRLP-76PS2PU \r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDSPNRLP-610FS2PU : 6-10\r\n•    KRDSPNRLP-76PS2PU  : 10-20\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDSPNRLP-610FS2PU :	Fast\r\n•    KRDSPNRLP-76PS2PU  :	Fast\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Fuji FazLite Guides\r\n•  Guides (ไกด์) 10', 'KastKing Royale Legend Pro Bass Fishing Rods ถูกออกแบบมาเพื่อมอบความไวระดับสูงสุด ด้วยโครงสร้างจาก High Modulus KastFlex IM7 Graphite Blanks ที่ผ่านกระบวนการขึ้นรูปภายใต้แรงดันสูงและเสริมด้วย Nano Resins ทำให้คันเบ็ดมีความไวต่อสัมผัสและน้ำหนักเบาเป็นพิเศษ พร้อมทั้งให้ความแข็งแรงที่เหนือกว่า\r\n\r\nคันเบ็ดรุ่นนี้ใช้ระบบ Fuji FazLite Guides ที่ประกอบด้วย Fuji Stainless Steel K Frame Guides พร้อม FazLite Inserts ช่วยให้สายเบ็ดสามารถไหลผ่านได้อย่างลื่นไหล ลดปัญหาสายพันกัน และช่วยให้การตีเหยื่อเป็นไปอย่างมีประสิทธิภาพ ตัวไกด์ถูกออกแบบให้มีมุมเอียงเล็กน้อยเพื่อลดแรงเสียดทาน ช่วยให้ปล่อยสายได้อย่างรวดเร็ว รองรับสายได้ทุกประเภทไม่ว่าจะเป็น Mono, Braid หรือ Fluorocarbon\r\n\r\nด้ามจับของคันเบ็ดใช้เทคโนโลยี SlipLock Technology Handles ที่ให้การยึดเกาะที่ยอดเยี่ยมแม้ในสภาวะที่เปียกลื่น ด้วยพื้นผิว ซิลิโคนพิเศษ ที่มีร่องลึกเพื่อเพิ่มแรงยึดเกาะ ลดความลื่นไถล และสามารถใช้งานได้ยาวนานกว่า 5 ปี โดยไม่สูญเสียประสิทธิภาพ\r\n\r\nคันเบ็ดรุ่นนี้ยังมาพร้อมกับโครงสร้างที่ทั้งแข็งแกร่งและไวต่อสัมผัส ด้วย Custom Spinning & Casting Reel Seats ที่ให้ความกระชับและมั่นคงในการจับ คันเบ็ดยังมี Custom Foregrip และ Built-in Hook Keeper ที่ช่วยเก็บเบ็ดอย่างปลอดภัย ลดปัญหาเบ็ดพันกับอุปกรณ์ตกปลาอื่น ๆ นอกจากนี้ยังมีระบบ KastKing PTS (Power Transition System) ซึ่งช่วยให้คันเบ็ดแบบ 2 ท่อนสามารถถ่ายเทพลังได้อย่างราบรื่นเหมือนคันเบ็ดแบบท่อนเดียว', '59226872920250227_161740.jpg', 2100, '23', 'คัน', 0, '2025-02-27 09:17:40'),
(52, 'KastKing Perigee II Fishing Rods', 10, 'ผลิตจากกราไฟต์คาร์บอน ด้ามจับ EVA\r\nModel Number (รุ่นคันเบ็ด)\r\n•    KRDSPNPG2-56UL2-C\r\n•    KRDSPNPG2-56L2-C\r\nLine Rating (เวทสายที่รองรับ, LB)\r\n•    KRDSPNPG2-56UL2-C : 2-6\r\n•    KRDSPNPG2-56L2-C : 4-8\r\n Rod Action (แอคชั่นของคันเบ็ด)\r\n•    KRDSPNPG2-56UL2-C : Medium Fast\r\n•    KRDSPNPG2-56L2-C : Fast\r\n Guide Type (ชนิดของไกด์)\r\n•  ไกด์ Fuji O-Ring Line Guides\r\n•  Guides (ไกด์) 7', 'KastKing Perigee II Fishing Rods มาพร้อมกับโครงสร้าง Toray 24-Ton Carbon Matrix KastFlex Blank Technology ที่ให้ทั้งพลัง ความแข็งแกร่ง และความแม่นยำ มีให้เลือกถึง 42 ขนาด ตั้งแต่ Ultra Light Spinning Rod สำหรับปลาขนาดเล็ก ไปจนถึง Heavy 7’ Spinning Rod และ Baitcaster Rod ที่มีระดับพลังตั้งแต่ Medium ถึง Heavy Power สามารถใช้งานได้หลากหลาย ทั้งการตกปลากะพง (Bass), ปลาเทราต์ (Trout), วอลอาย (Walleye), แซลมอน (Salmon), แคทฟิช (Catfish), สตีลเฮด (Steelhead) หรือแม้แต่การตกปลาน้ำเค็ม\r\n\r\nคันเบ็ดรุ่นนี้ใช้ ส่วนประกอบระดับพรีเมียม ไม่ว่าจะเป็น Fuji O-Ring Line Guides ที่ช่วยให้สายไหลลื่น ลดแรงเสียดทาน Ergonomic Graphite High-Strength Reel Seats ที่ให้ความมั่นคงในการจับ High-Density EVA Grips ที่ช่วยให้จับถนัดมือ ลดความเมื่อยล้าระหว่างการตกปลา Saf-T Keeper Hook Holder สำหรับเก็บเบ็ดอย่างปลอดภัย และผิวคาร์บอนไฟเบอร์แบบ \"Bare and Beautiful\" ที่ให้ทั้งความไวและน้ำหนักเบา\r\n\r\nด้วยเทคโนโลยี KastKing PTS (Power Transition System) ที่ใช้ Hybrid Spigot Joints ช่วยให้คันเบ็ดแบบ 2 ท่อน มีการถ่ายเทพลังอย่างราบรื่นตลอดแนวโครงสร้าง พร้อมการพันคันเบ็ดด้วยเทคนิค 4 มุมองศา (0⁰, 45⁰, 90⁰, 135⁰) ทำให้คันเบ็ดแข็งแรงขึ้น และให้ความรู้สึกเหมือนคันเบ็ด ท่อนเดียว', '191308607520250227_162354.jpg', 1800, '30', 'คัน', 22, '2025-03-02 17:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_type`
--

CREATE TABLE `tbl_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_type`
--

INSERT INTO `tbl_type` (`type_id`, `type_name`) VALUES
(5, 'รอกเบทเคสติ้ง'),
(6, 'รอกสปินนิ่ง'),
(9, 'คันเบ็ดเคสติ้ง'),
(10, 'คันเบ็ดสปินนิ่ง'),
(11, 'อุปกรณ์เสริม'),
(12, 'สายเบ็ด'),
(13, 'เหยื่อปลอม');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bank`
--
ALTER TABLE `tbl_bank`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `tbl_type`
--
ALTER TABLE `tbl_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bank`
--
ALTER TABLE `tbl_bank`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_member`
--
ALTER TABLE `tbl_member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tbl_type`
--
ALTER TABLE `tbl_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
