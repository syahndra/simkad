-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2025 at 05:28 PM
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
  `statAjuan` enum('dalam proses','ditolak','sudah diproses','revisi','selesai') NOT NULL DEFAULT 'dalam proses',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ajuancapil`
--

INSERT INTO `ajuancapil` (`idCapil`, `idOpdes`, `idLayanan`, `noKK`, `nik`, `nama`, `noAkta`, `keterangan`, `token`, `statAjuan`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '3329010102120001', '3329135305250001', 'ALENA SAFIRA', '3329-LU-02062025-0046', 'coba ngasih keterangan', 'afe8jk', 'selesai', '2025-06-01 23:41:45', '2025-06-10 06:46:32'),
(4, 2, 5, '3329136712000003', '3329135305250001', 'RUHWI', '3329-KM-02062025-0059', NULL, 'fzd342', 'selesai', '2025-06-03 18:49:18', '2025-06-10 06:46:20'),
(5, 2, 2, '3329136712000001', '3329014505840005', 'Arhan', '3329-LU-02062025-0046', NULL, 'ddeb27', 'dalam proses', '2025-06-05 01:10:52', '2025-06-10 03:41:05');

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
  `statAjuan` enum('dalam proses','ditolak','sudah diproses','revisi','selesai') DEFAULT 'dalam proses',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ajuandafduk`
--

INSERT INTO `ajuandafduk` (`idDafduk`, `idOpdes`, `idLayanan`, `noKK`, `nik`, `nama`, `keterangan`, `token`, `statAjuan`, `created_at`, `updated_at`) VALUES
(3, 2, 1, '3329136712000003', '3329135305250001', 'ALENA SAFIRA', NULL, 'gfh743', 'selesai', '2025-06-02 01:14:33', '2025-06-03 20:43:42'),
(4, 3, 10, '3329136712000003', '3329135305250002', 'Robert', 'Pindah semua anggota keluarga', 'ief825', 'sudah diproses', '2025-06-03 21:13:02', '2025-06-03 21:29:04'),
(5, 2, 10, '3329136712000003', '3329014505840005', 'Albert', 'pindah hanya anak pertama', 'kjf754', 'sudah diproses', '2025-06-03 21:22:52', '2025-06-03 21:29:09'),
(7, 3, 8, '3329136712000001', '3329135305250002', 'Toni Setiawan', NULL, '9fO84g', 'dalam proses', '2025-06-10 06:17:53', '2025-06-10 06:17:53');

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

--
-- Dumping data for table `finaldokumen`
--

INSERT INTO `finaldokumen` (`idFinDok`, `idAjuan`, `jenis`, `filename`, `filePath`, `created_at`, `updated_at`) VALUES
(1, 3, 'dafduk', 'KK - HENGKI', 'dokumen_final/Mp25zYVSjtrMhjMthy8dQRTK2Syfi1I5qywKdgPq.pdf', '2025-06-04 19:30:03', '2025-06-10 01:43:39'),
(2, 1, 'capil', 'AKTA LAHIR - ALENA SAFIRA', 'dokumen_final/cEKH0TbYifAg3abzkzBMfPSOpJfLTrtz2c755Ovi.pdf', '2025-06-04 20:58:17', '2025-06-04 20:59:43'),
(3, 4, 'capil', 'AKTA MATI - RUHWI', 'dokumen_final/u7ERxfENH3bV7GxWsAR4Y81YlT9wPyGf3Iv89p9P.pdf', '2025-06-09 06:57:49', '2025-06-09 06:57:49');

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
(1, 5, 6),
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

--
-- Dumping data for table `respon`
--

INSERT INTO `respon` (`idRespon`, `idUser`, `idAjuan`, `jenis`, `respon`, `created_at`, `updated_at`) VALUES
(3, 7, 1, 'capil', NULL, '2025-06-03 18:17:38', '2025-06-03 18:48:12'),
(6, 7, 4, 'capil', NULL, '2025-06-03 19:17:10', '2025-06-03 19:50:01'),
(7, 6, 3, 'dafduk', NULL, '2025-06-03 19:25:47', '2025-06-03 19:59:31'),
(9, 15, 4, 'dafduk', NULL, '2025-06-03 21:29:04', '2025-06-03 21:29:04'),
(10, 15, 5, 'dafduk', NULL, '2025-06-03 21:29:09', '2025-06-03 21:29:09');

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
  `roleUser` enum('superadmin','admin','opDinCapil','opDinDafduk','operatorKecamatan','operatorDesa','') NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `nama`, `username`, `email`, `password`, `roleUser`, `status`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin', 'superadmin@gmail.com', '$2y$12$WYTUBNGmQTuKG6GTX5TPBer6fvR3/HxFlQ.mVDnlJHRiP/i8kYjCG', 'superadmin', 'aktif', NULL, NULL),
(4, 'admin1', 'admin1', 'admin1@gmail.com', '$2y$12$4NDaLJPdEFSAXr55XjsKdeQ71FLULKyxnawogFItRbfcDQrdYwhru', 'admin', 'aktif', '2025-05-01 08:31:05', '2025-06-03 21:03:48'),
(5, 'kecamatan tonjong', 'kecamatan_tonjong', 'kecamatan_tonjong@gmail.com', '$2y$12$/k450AxFIAf0vY4wZtyXyOCCbgRvGlp.LIFEUCKL.crfdNq7tKIQi', 'operatorKecamatan', 'aktif', '2025-05-01 18:33:10', '2025-06-03 21:05:48'),
(6, 'kecamatan brebes', 'kecamatan_brebes', 'kecamatan_brebes@gmail.com', '$2y$12$eRvtk6g/ZMMj0gHc67asT.ioto6xIJ1TSaXm0q4GWn6aBIj3AY8nq', 'operatorKecamatan', 'aktif', '2025-05-01 18:42:38', '2025-06-03 21:06:04'),
(7, 'dinas capil', 'dinas_capil', 'dinas_capil@gmail.com', '$2y$12$SeuCQplSgYP3fWexiCH9Wu2M1tXPsGFtVEA4u3ZKseASD6rX3x24S', 'opDinCapil', 'aktif', '2025-05-01 18:52:20', '2025-06-03 21:05:18'),
(9, 'desa kalimati', 'desa_kalimati', 'desa_kalimati@gmail.com', '$2y$12$61Lqk4/8Dvab7ZinFMhHl.ZWXbwbj5OSe4266wlFc5yBNqe6Xc7QW', 'operatorDesa', 'aktif', '2025-05-03 02:36:07', '2025-06-03 21:06:44'),
(10, 'admin2', 'admin2', 'admin2@gmail.com', '$2y$12$o5nGh3eaKfvMB/Jk57SWEO6ifz8f9M3W5Xmch.LhYFDaNZyTw0UZO', 'admin', 'aktif', '2025-05-05 18:25:59', '2025-06-03 21:03:30'),
(11, 'desa kutamendala', 'desa_kutamendala', 'desa_kutamendala@gmail.com', '$2y$12$cTiOzakLftVpWPlfnmEEleU3Ap4.OGZTPKDWnfaU1wcLks3O/GDvy', 'operatorDesa', 'aktif', '2025-05-05 18:31:15', '2025-06-03 21:07:06'),
(14, 'admin3', 'admin3', 'admin3@gmail.com', '$2y$12$hJawn.ckdrxVhx8semOEQ.KX/DrOW2C4Zhfgzi9F5Uz55SZ9yZWTu', 'admin', 'aktif', '2025-06-03 21:03:05', '2025-06-03 21:03:05'),
(15, 'dinas dafduk', 'dinas_dafduk', 'dinas_dafduk@gmail.com', '$2y$12$UzQMaASkgOOuAx5EGjPCTOWTNzEkZ81wyuspYKSPreTbjHO/gDnN.', 'opDinDafduk', 'aktif', '2025-06-03 21:04:54', '2025-06-03 21:04:54');

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
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ajuancapil`
--
ALTER TABLE `ajuancapil`
  MODIFY `idCapil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ajuandafduk`
--
ALTER TABLE `ajuandafduk`
  MODIFY `idDafduk` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `desa`
--
ALTER TABLE `desa`
  MODIFY `idDesa` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `finaldokumen`
--
ALTER TABLE `finaldokumen`
  MODIFY `idFinDok` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `idKec` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `idLayanan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT for table `operatorkec`
--
ALTER TABLE `operatorkec`
  MODIFY `idOpkec` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `respon`
--
ALTER TABLE `respon`
  MODIFY `idRespon` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
