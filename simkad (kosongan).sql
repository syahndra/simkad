-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2025 at 04:31 AM
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
-- Table structure for table `ajuancapil`
--

CREATE TABLE `ajuancapil` (
  `idCapil` int(10) UNSIGNED NOT NULL,
  `idOpdes` int(10) UNSIGNED NOT NULL,
  `idLayanan` int(10) UNSIGNED NOT NULL,
  `noKK` varchar(20) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `noAkta` varchar(50) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `token` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `statAjuan` enum('dalam antrian','ditolak','sudah diproses','revisi','selesai') NOT NULL DEFAULT 'dalam antrian',
  `linkBerkas` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `token` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `statAjuan` enum('dalam antrian','ditolak','sudah diproses','revisi','selesai') DEFAULT 'dalam antrian',
  `linkBerkas` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `idDesa` int(11) UNSIGNED NOT NULL,
  `namaDesa` varchar(100) NOT NULL,
  `idKec` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finaldokumen`
--

CREATE TABLE `finaldokumen` (
  `idFinDok` int(10) UNSIGNED NOT NULL,
  `idAjuan` int(10) UNSIGNED NOT NULL,
  `jenis` enum('capil','dafduk') NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(5, 'Akta Kematian', 'capil', 'dinasCapil'),
(6, 'Pembuatan KK Baru', 'dafduk', 'kecamatan'),
(7, 'Pengurangan Anggota Keluarga', 'dafduk', 'kecamatan'),
(8, 'Perubahan Data', 'dafduk', 'kecamatan'),
(9, 'Perpindahan Antardesa, Kecamatan', 'dafduk', 'kecamatan'),
(10, 'Perpindahan AntarKab/Prov', 'dafduk', 'dinasDafduk');

-- --------------------------------------------------------

--
-- Table structure for table `operatordesa`
--

CREATE TABLE `operatordesa` (
  `idOpdes` int(20) UNSIGNED NOT NULL,
  `idUser` int(20) UNSIGNED NOT NULL,
  `idDesa` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operatorkec`
--

CREATE TABLE `operatorkec` (
  `idOpkec` int(20) UNSIGNED NOT NULL,
  `idUser` int(20) UNSIGNED NOT NULL,
  `idKec` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `idToken` int(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `respon`
--

CREATE TABLE `respon` (
  `idRespon` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idAjuan` int(10) UNSIGNED NOT NULL,
  `jenis` enum('capil','dafduk') NOT NULL,
  `respon` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleUser` enum('superadmin','admin','opDinCapil','opDinDafduk','operatorKecamatan','operatorDesa','') NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `nama`, `email`, `password`, `roleUser`, `status`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', '$2y$12$0MzM/Z2G8Qpji642bdznRegw2KB19BtAmX8ihUPP7aaIOI7LDecge', 'superadmin', 'aktif', '2025-06-25 19:46:35', '2025-06-28 22:27:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ajuancapil`
--
ALTER TABLE `ajuancapil`
  ADD PRIMARY KEY (`idCapil`),
  ADD KEY `fk_ajuanCapil_idOpdes` (`idOpdes`),
  ADD KEY `fk_ajuanCapil_idLayanan` (`idLayanan`);

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
-- Indexes for table `finaldokumen`
--
ALTER TABLE `finaldokumen`
  ADD PRIMARY KEY (`idFinDok`);

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
-- Indexes for table `operatordesa`
--
ALTER TABLE `operatordesa`
  ADD PRIMARY KEY (`idOpdes`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idDesa` (`idDesa`);

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
  ADD PRIMARY KEY (`idToken`);

--
-- Indexes for table `respon`
--
ALTER TABLE `respon`
  ADD PRIMARY KEY (`idRespon`),
  ADD KEY `fk_respon_user` (`idUser`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ajuancapil`
--
ALTER TABLE `ajuancapil`
  MODIFY `idCapil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ajuandafduk`
--
ALTER TABLE `ajuandafduk`
  MODIFY `idDafduk` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `desa`
--
ALTER TABLE `desa`
  MODIFY `idDesa` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finaldokumen`
--
ALTER TABLE `finaldokumen`
  MODIFY `idFinDok` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `idKec` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `idLayanan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `operatordesa`
--
ALTER TABLE `operatordesa`
  MODIFY `idOpdes` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operatorkec`
--
ALTER TABLE `operatorkec`
  MODIFY `idOpkec` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `idToken` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `respon`
--
ALTER TABLE `respon`
  MODIFY `idRespon` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ajuancapil`
--
ALTER TABLE `ajuancapil`
  ADD CONSTRAINT `fk_ajuanCapil_idLayanan` FOREIGN KEY (`idLayanan`) REFERENCES `layanan` (`idLayanan`),
  ADD CONSTRAINT `fk_ajuanCapil_idOpdes` FOREIGN KEY (`idOpdes`) REFERENCES `operatordesa` (`idOpdes`);

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
-- Constraints for table `operatorkec`
--
ALTER TABLE `operatorkec`
  ADD CONSTRAINT `operatorkec_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE,
  ADD CONSTRAINT `operatorkec_ibfk_2` FOREIGN KEY (`idKec`) REFERENCES `kecamatan` (`idKec`) ON DELETE CASCADE;

--
-- Constraints for table `respon`
--
ALTER TABLE `respon`
  ADD CONSTRAINT `fk_respon_user` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
