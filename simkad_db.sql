-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2025 at 06:45 AM
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
-- Database: `simkad`
--

-- --------------------------------------------------------

--
-- Table structure for table `ajuandafduk`
--

CREATE TABLE `ajuandafduk` (
  `idDafduk` int(20) UNSIGNED NOT NULL,
  `idOpdes` int(20) UNSIGNED NOT NULL,
  `idLayanan` int(11) UNSIGNED NOT NULL,
  `noKK` varchar(20) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `statAjuan` enum('belum diproses','ditolak','disetujui','revisi') DEFAULT 'belum diproses',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ajuandafduk`
--

INSERT INTO `ajuandafduk` (`idDafduk`, `idOpdes`, `idLayanan`, `noKK`, `nik`, `nama`, `keterangan`, `statAjuan`, `created_at`, `updated_at`) VALUES
(2, 2, 1, '3329010102120001', '3329014505840005', 'RUHWI', 'coba', 'belum diproses', '2025-06-01 20:51:55', '2025-06-01 21:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `idDesa` int(11) UNSIGNED NOT NULL,
  `namaDesa` varchar(100) NOT NULL,
  `idKec` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `desa`
--

INSERT INTO `desa` (`idDesa`, `namaDesa`, `idKec`) VALUES
(1, 'Cimunding', 17),
(2, 'Tiwulandu', 17),
(3, 'Karangmaja', 17),
(4, 'Cikuya', 17),
(5, 'Banjarharjo', 17),
(6, 'Penanggapan', 17),
(7, 'Sukareja', 17),
(8, 'Cibuniwangi', 17),
(9, 'Cipajang', 17),
(10, 'Dukuhjeruk', 17),
(11, 'Cihaur', 17),
(14, 'Kalimati', 9),
(15, 'Banjaranyar', 9),
(16, 'Kutamendala', 6);

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `idKec` int(11) UNSIGNED NOT NULL,
  `namaKec` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`idKec`, `namaKec`) VALUES
(1, 'Salem'),
(2, 'Bantarkawung'),
(3, 'Bumiayu'),
(4, 'Paguyangan'),
(5, 'Sirampog'),
(6, 'Tonjong'),
(7, 'Jatibarang'),
(8, 'Wanasari'),
(9, 'Brebes'),
(10, 'Songgom'),
(11, 'Kersana'),
(12, 'Losari'),
(13, 'Tanjung'),
(14, 'Bulakamba'),
(15, 'Larangan'),
(16, 'Ketanggungan'),
(17, 'Banjarharjo');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `idLayanan` int(11) UNSIGNED NOT NULL,
  `namaLayanan` varchar(100) NOT NULL,
  `jenis` enum('dafduk','capil') NOT NULL,
  `aksesVer` enum('dinasDafduk','dinasCapil','kecamatan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`idLayanan`, `namaLayanan`, `jenis`, `aksesVer`) VALUES
(1, 'Penambahan Anggota Keluarga', 'dafduk', 'kecamatan'),
(2, 'Akta Kelahiran', 'capil', 'dinasCapil'),
(5, 'Akta Kematian', 'capil', 'dinasCapil');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operatordesa`
--

CREATE TABLE `operatordesa` (
  `idOpdes` int(20) UNSIGNED NOT NULL,
  `idUser` int(20) UNSIGNED NOT NULL,
  `idDesa` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operatordesa`
--

INSERT INTO `operatordesa` (`idOpdes`, `idUser`, `idDesa`) VALUES
(2, 9, 14),
(3, 11, 16);

-- --------------------------------------------------------

--
-- Table structure for table `operatordinas`
--

CREATE TABLE `operatordinas` (
  `idOpdin` int(20) UNSIGNED NOT NULL,
  `idUser` int(20) UNSIGNED NOT NULL,
  `bidang` enum('dafduk','capil') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operatordinas`
--

INSERT INTO `operatordinas` (`idOpdin`, `idUser`, `bidang`) VALUES
(2, 7, 'capil');

-- --------------------------------------------------------

--
-- Table structure for table `operatorkec`
--

CREATE TABLE `operatorkec` (
  `idOpkec` int(20) UNSIGNED NOT NULL,
  `idUser` int(20) UNSIGNED NOT NULL,
  `idKec` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operatorkec`
--

INSERT INTO `operatorkec` (`idOpkec`, `idUser`, `idKec`) VALUES
(1, 5, 8),
(2, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleUser` enum('superadmin','admin','operatorDinas','operatorKecamatan','operatorDesa','') NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `nama`, `username`, `email`, `password`, `roleUser`, `status`, `created_at`, `updated_at`) VALUES
(1, 'M. Syahndra Ramadhan', 'syahndra', 'mohammadsyahndra@gmail.com', '$2y$12$WYTUBNGmQTuKG6GTX5TPBer6fvR3/HxFlQ.mVDnlJHRiP/i8kYjCG', 'superadmin', 'aktif', NULL, NULL),
(4, 'Farohis', 'farohis', 'farohis@gmail.com', '$2y$12$De/KIsm.oIuBWfxHqnFSkO0UEhhPhf2zsjtgv5WN.25SEiiN2Y7mm', 'admin', 'aktif', '2025-05-01 08:31:05', '2025-05-01 08:31:18'),
(5, 'Edi', 'edi', 'edi@gmail.com', '$2y$12$faINwKjpht4NmmPH.YB2P.fbdlQfegLPwXEyC0Ua/HgkKlzMSa4By', 'operatorKecamatan', 'aktif', '2025-05-01 18:33:10', '2025-05-01 18:37:38'),
(6, 'Wildan', 'wildan', 'wildan@gmail.com', '$2y$12$4OJy03RIfSJKf3c5J1i2EelXYwEq6.p7JjYduMm6CjypqEDVrcGz.', 'operatorKecamatan', 'aktif', '2025-05-01 18:42:38', '2025-05-01 18:43:09'),
(7, 'Jimmy', 'jimmy', 'jimmy@gmail.com', '$2y$12$ccsW4AJFpDfvAWTcnwOVOOTkbGSFY7L1U7UQi4Fq/MSHcRkQv7oiW', 'operatorDinas', 'aktif', '2025-05-01 18:52:20', '2025-05-01 18:52:20'),
(9, 'Siyung', 'siyung', 'siyunggg_ganteng@gmail.com', '$2y$12$WYTUBNGmQTuKG6GTX5TPBer6fvR3/HxFlQ.mVDnlJHRiP/i8kYjCG', 'operatorDesa', 'aktif', '2025-05-03 02:36:07', '2025-05-05 18:26:45'),
(10, 'Toni Setiawan', 'toni', 'toni_setiawan@gmail.com', '$2y$12$ji6PkhLjDpv35uS.DPDK2eK8.D9prYH7lFY5c1MxlCnoXFkhtUZm6', 'admin', 'aktif', '2025-05-05 18:25:59', '2025-05-05 18:25:59'),
(11, 'Endah Tri W', 'endahhh', 'endah@gmail.com', '$2y$12$tBmjyhpZE0GUQ72T9Y3MTu.HFkX5z7HXoU8VO/pPULUiTNpSIX5I2', 'operatorDesa', 'aktif', '2025-05-05 18:31:15', '2025-05-05 18:31:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ajuandafduk`
--
ALTER TABLE `ajuandafduk`
  ADD PRIMARY KEY (`idDafduk`),
  ADD KEY `idOpdes` (`idOpdes`),
  ADD KEY `idLayanan` (`idLayanan`);

--
-- Indexes for table `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`idDesa`),
  ADD KEY `id_kecamatan` (`idKec`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`idKec`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`idLayanan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operatordesa`
--
ALTER TABLE `operatordesa`
  ADD PRIMARY KEY (`idOpdes`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idDesa` (`idDesa`);

--
-- Indexes for table `operatordinas`
--
ALTER TABLE `operatordinas`
  ADD PRIMARY KEY (`idOpdin`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `operatorkec`
--
ALTER TABLE `operatorkec`
  ADD PRIMARY KEY (`idOpkec`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idKec` (`idKec`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ajuandafduk`
--
ALTER TABLE `ajuandafduk`
  MODIFY `idDafduk` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `desa`
--
ALTER TABLE `desa`
  MODIFY `idDesa` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `idKec` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `idLayanan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `operatordesa`
--
ALTER TABLE `operatordesa`
  MODIFY `idOpdes` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operatordinas`
--
ALTER TABLE `operatordinas`
  MODIFY `idOpdin` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `operatorkec`
--
ALTER TABLE `operatorkec`
  MODIFY `idOpkec` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ajuandafduk`
--
ALTER TABLE `ajuandafduk`
  ADD CONSTRAINT `ajuandafduk_ibfk_1` FOREIGN KEY (`idOpdes`) REFERENCES `operatordesa` (`idOpdes`),
  ADD CONSTRAINT `ajuandafduk_ibfk_2` FOREIGN KEY (`idLayanan`) REFERENCES `layanan` (`idLayanan`);

--
-- Constraints for table `desa`
--
ALTER TABLE `desa`
  ADD CONSTRAINT `desa_ibfk_1` FOREIGN KEY (`idKec`) REFERENCES `kecamatan` (`idKec`);

--
-- Constraints for table `operatordesa`
--
ALTER TABLE `operatordesa`
  ADD CONSTRAINT `operatordesa_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE,
  ADD CONSTRAINT `operatordesa_ibfk_2` FOREIGN KEY (`idDesa`) REFERENCES `desa` (`idDesa`) ON DELETE CASCADE;

--
-- Constraints for table `operatordinas`
--
ALTER TABLE `operatordinas`
  ADD CONSTRAINT `operatordinas_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE;

--
-- Constraints for table `operatorkec`
--
ALTER TABLE `operatorkec`
  ADD CONSTRAINT `operatorkec_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE,
  ADD CONSTRAINT `operatorkec_ibfk_2` FOREIGN KEY (`idKec`) REFERENCES `kecamatan` (`idKec`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
