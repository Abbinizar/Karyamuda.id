-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2017 at 12:12 AM
-- Server version: 10.1.24-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `karyamud_karya`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL DEFAULT 'Tanpa Judul',
  `berita` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Tersolusikan','Belum Tersolusikan') NOT NULL DEFAULT 'Belum Tersolusikan',
  `kategori` enum('Pariwisata','Sosial','Pendidikan') NOT NULL DEFAULT 'Pendidikan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `judul`, `berita`, `id_user`, `tanggal`, `status`, `kategori`) VALUES
(3, 'Tanpa Judul', 'Saya Mencoba', 4, '2017-10-31 03:00:11', 'Belum Tersolusikan', 'Pendidikan'),
(6, 'Kurangnya penunjang belajar di daerah pelosok desa Panggong, Johan Pahlawan, Aceh BaratPanggong', 'Penunjang belajar adalah salah satu faktor pendukung keberhasilan dalam pengajaran. Penunjang belajar yang dimaksud seperti buku pembelajaran, globe. Apabila kurangnya penunjang belajar dapat menghambat kinerja dari pengajaran. Di daerah pelosok desa Panggong, Johan Pahlawan, Aceh Barat kurangnya penunjang belajar seperti buku pembelajaran dan hal tersebut sangat menghambat pembelajaran mereka.\r\nAyo bantu mengatasi permasalahan mereka..', 4, '2017-11-03 01:11:59', 'Tersolusikan', 'Pendidikan'),
(7, 'Kurangnya minat masyarakat pada pariwisata Aceh Barat', 'Aceh Barat memiliki banyak pariwisata indah seperti  Pantai Lhok Bubon,  Pantai Suak Ribee, Mesjid Agung Kota melaboh. Tetapi kurangnya masyarakat Indonesia mengerti pariwisata tersebut', 4, '2017-11-03 03:16:39', 'Belum Tersolusikan', 'Pariwisata');

-- --------------------------------------------------------

--
-- Table structure for table `detail_solusi_like`
--

CREATE TABLE `detail_solusi_like` (
  `id_detail_solusi_like` int(11) NOT NULL,
  `id_solusi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_solusi_like`
--

INSERT INTO `detail_solusi_like` (`id_detail_solusi_like`, `id_solusi`, `id_user`) VALUES
(2, 1, 1),
(4, 3, 3),
(5, 2, 3),
(6, 3, 1),
(8, 5, 1),
(9, 5, 3),
(10, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ide`
--

CREATE TABLE `ide` (
  `id_ide` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL DEFAULT 'Tanpa Judul',
  `ide` text NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kategori` enum('Pariwisata','Sosial','Pendidikan') NOT NULL DEFAULT 'Pendidikan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ide`
--

INSERT INTO `ide` (`id_ide`, `id_user`, `judul`, `ide`, `tanggal`, `kategori`) VALUES
(1, 1, 'Tanpa Judul', 'satu', '2017-10-30 02:45:23', 'Pendidikan'),
(2, 3, 'Tanpa Judul', 'aku', '2017-10-31 06:48:55', 'Pendidikan'),
(3, 1, 'test', 'saya', '2017-11-01 05:14:28', 'Pariwisata'),
(4, 1, 'test', 'saya', '2017-11-01 05:21:18', 'Pendidikan'),
(5, 3, 'Membuat desa literasi digital', 'Dengan berkembangnya zaman yang semakin cepat, teknologi semakin membuat semua pekerjaan semakin efisien dan efektif, di meulaboh sangat potensial karena penduduknya yang sudah menggunakan internet bisa dibilang banyak.', '2017-11-03 03:21:41', 'Pendidikan');

--
-- Triggers `ide`
--
DELIMITER $$
CREATE TRIGGER `id_ai` AFTER INSERT ON `ide` FOR EACH ROW UPDATE users set jumlah_solusi = jumlah_ide+1 where id = new.id_user
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `komunitas`
--

CREATE TABLE `komunitas` (
  `id_komunitas` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `id_provinsi`, `nama`) VALUES
(1, 1, 'Kabupaten Aceh Barat'),
(2, 1, 'Kabupaten Aceh Barat Daya'),
(3, 1, 'Kabupaten Aceh Besar'),
(4, 1, 'Kabupaten Aceh Jaya'),
(5, 1, 'Kabupaten Aceh Selatan'),
(6, 1, 'Kabupaten Aceh Singkil'),
(7, 1, 'Kabupaten Aceh Tamiang'),
(8, 1, 'Kabupaten Aceh Tengah'),
(9, 1, 'Kabupaten Aceh Tenggara'),
(10, 1, 'Kabupaten Aceh Utara'),
(11, 1, 'Kabupaten Aceh Timur'),
(12, 1, 'Kabupaten Bireuen'),
(13, 1, 'Kabupaten Bener Meriah'),
(14, 1, 'Kabupaten Nagan Raya'),
(15, 1, 'Kabupaten Gayo Lues'),
(16, 1, 'Kabupaten Pidie'),
(17, 1, 'Kabupaten Pidie Jaya'),
(18, 1, 'Kota Banda Aceh'),
(19, 1, 'Kabupaten Simeulue'),
(20, 1, 'Kota Lhokseumawe'),
(21, 1, 'Kota Langsa'),
(22, 1, 'Kota Subulussalam'),
(23, 1, 'Kota Sabang');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` tinyint(4) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama`) VALUES
(1, 'Nanggro Aceh Darussalam'),
(2, 'Sumatra Utara '),
(3, 'Sumatra Selatan'),
(4, 'Sumatra Barat'),
(5, 'Bengkulu'),
(6, 'Riau'),
(7, 'Kepulauan Riau'),
(8, 'Jambi'),
(9, 'Lampung'),
(10, 'Bangka Belitung'),
(11, 'Kalimantan Barat '),
(12, 'Kalimantan Timur'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Utara'),
(16, 'Banten '),
(17, 'DKI Jakarta '),
(18, 'Jawa Barat '),
(19, 'Jawa Tengah'),
(20, 'DI Yogyakarta '),
(21, 'Jawa Timur'),
(22, 'Bali'),
(23, 'Nusa Tenggara Timur'),
(24, 'Nusa Tenggara Barat'),
(25, 'Gorontalo'),
(26, 'Sulawesi Barat'),
(27, 'Sulawesi Tengah'),
(28, 'Sulawesi Utara \r\n'),
(29, 'Sulawesi Tenggara'),
(30, 'Sulawesi Selatan '),
(31, 'Maluku'),
(32, 'Maluku Utara'),
(33, 'Papua'),
(34, 'Papua Barat');

-- --------------------------------------------------------

--
-- Table structure for table `relawan`
--

CREATE TABLE `relawan` (
  `id_relawan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_solusi` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relawan`
--

INSERT INTO `relawan` (`id_relawan`, `id_user`, `id_solusi`, `tanggal`) VALUES
(14, 3, 1, '2017-11-03 02:57:58'),
(15, 22, 1, '2017-11-03 03:01:25');

--
-- Triggers `relawan`
--
DELIMITER $$
CREATE TRIGGER `relawan_ai` AFTER INSERT ON `relawan` FOR EACH ROW UPDATE users set jumlah_solusi = jumlah_relawan+1 where id = new.id_user
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE `solusi` (
  `id_solusi` int(11) NOT NULL,
  `id_berita` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `solusi` text,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Solusi','Belum') NOT NULL DEFAULT 'Belum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`id_solusi`, `id_berita`, `id_user`, `solusi`, `tanggal`, `status`) VALUES
(1, 6, 3, 'Dengan permasalahan kurangnya penunjang belajar dapat diatasi dengan cara pengumpulan buku bekas untuk digunakan di daerah pelosok tersebut. Buku bekas yang dikumpulkan bisa berupa buku pelajar sesuai tingkatan sekolah, buku cerita.', '2017-11-03 01:40:48', 'Solusi'),
(8, 7, 3, 'solusi saya', '2017-11-03 06:28:07', 'Belum');

--
-- Triggers `solusi`
--
DELIMITER $$
CREATE TRIGGER `solusi ai` AFTER INSERT ON `solusi` FOR EACH ROW UPDATE users set jumlah_solusi = jumlah_solusi+1 where id = new.id_user
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `solusi_au` AFTER UPDATE ON `solusi` FOR EACH ROW if new.status = 'Solusi' THEN
UPDATE berita SET status = 'Tersolusikan' where id_berita = new.id_berita;
end IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `universitas`
--

CREATE TABLE `universitas` (
  `id_universitas` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `id_kota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `universitas`
--

INSERT INTO `universitas` (`id_universitas`, `nama`, `telepon`, `id_kota`) VALUES
(1, 'Institut Seni dan Bu', '0', 0),
(2, 'Politeknik Negeri Lh', '0', 0),
(3, 'Akademi Komunitas Ne', '0', 0),
(4, 'Universitas Syiah Ku', '0', 0),
(5, 'Universitas Samudra', '0', 0),
(6, ' Universitas Malikus', '0', 0),
(7, 'Universitas Sumatera', '0', 0),
(8, 'Universitas Teuku Um', '0', 0),
(9, 'Universitas Negeri M', '0', 0),
(10, 'Politeknik Negeri Me', '0', 0),
(11, 'Universitas Andalas', '0', 0),
(12, 'Universitas Negeri P', '0', 0),
(13, 'Politeknik Negeri Pa', '0', 0),
(14, 'Politeknik Pertanian', '0', 0),
(15, 'Politeknik Kesehatan', '0', 0),
(16, 'Universitas Riau', '0', 0),
(17, 'Sekolah Tinggi Seni ', '0', 0),
(18, 'Politeknik Negeri Be', '0', 0),
(19, 'Universitas Maritim ', '0', 0),
(20, 'Politeknik Negeri Ba', '0', 0),
(21, 'Politeknik Kesehatan', '0', 0),
(22, 'Universitas Jambi', '0', 0),
(23, 'Universitas Sriwijay', '0', 0),
(24, 'Akademi Komunitas Ne', '0', 0),
(25, 'Politeknik Negeri Sr', '0', 0),
(26, 'Universitas Lampung', '0', 0),
(27, 'Institut Teknologi S', '0', 0),
(28, 'Politeknik Negeri La', '0', 0),
(29, 'Universitas Bangka B', '0', 0),
(30, 'Politeknik Manufaktu', '0', 0),
(31, 'Universitas Sultan A', '0', 0),
(32, 'Universitas Terbuka', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perampuan') NOT NULL DEFAULT 'Laki-laki',
  `id_universitas` int(11) DEFAULT NULL,
  `id_komunitas` int(11) DEFAULT NULL,
  `id_kota` int(11) DEFAULT NULL,
  `tanggal_lahir` varchar(20) DEFAULT '-',
  `jumlah_solusi` int(11) NOT NULL DEFAULT '0',
  `jumlah_relawan` int(11) NOT NULL DEFAULT '0',
  `jumlah_ide` int(11) NOT NULL DEFAULT '0',
  `status` enum('Mahasiswa','Komunitas') NOT NULL DEFAULT 'Mahasiswa',
  `no_hp` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `remember_token`, `nim`, `jenis_kelamin`, `id_universitas`, `id_komunitas`, `id_kota`, `tanggal_lahir`, `jumlah_solusi`, `jumlah_relawan`, `jumlah_ide`, `status`, `no_hp`, `email`, `facebook`, `twitter`, `instagram`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'andry dermawan', '', '$2y$10$jDFRuyuxyQG/AN87fS0wZOxE4vAf4w28J53Ko0ck2whvreHoXF1v2', 'Bg5rlIA2GfFO6O1Xi4xU4L0CtfMGZ6mRpRB3MhQuakV0yaDYLDz2KBXdp2cu', '', 'Laki-laki', 32, 5, NULL, '-', 0, 0, 0, 'Mahasiswa', 0, 'andryderr@gmail.com', '', '', '', 'Saya adalah seorang penulis', '2017-10-29 00:12:42', '2017-11-02 11:03:51'),
(3, 'abbi nizar', '', '$2y$10$YljgnPA7cYxKvglKuP6ypOLHfojyG59.nhjxG9uaGpKH27On4vW82', 'Y4y4EdSqzEVbQbJNjjzGo9rHr12tEexsEtT662zIuFK7IjS4liAXziYosg6Q', NULL, 'Laki-laki', 30, 4, NULL, '-', 3, 1, 1, 'Mahasiswa', NULL, 'abbinizarm@gmail.com', NULL, NULL, NULL, 'Coba tentang saya', '2017-10-29 03:42:54', '2017-11-03 06:09:44'),
(4, 'Karya Muda Aceh', '', '$2y$10$CX7rSTutb2/4Ia/WTa9Zveq4NIUDmg1p8s.KqCleQ.AUN/zCJ/I3W', '1t05oKBylZuhlbptCOB80tf4mzJJkoxKslbdU14bE7Yhzx88lDKagPvvNWX4', NULL, 'Laki-laki', NULL, 4, 1, '-', 0, 0, 0, 'Komunitas', NULL, 'saya@c', NULL, NULL, NULL, NULL, '2017-10-30 12:45:55', '2017-11-06 04:06:50'),
(5, 'Try', '', '$2y$10$.a4HbZinJL.7KkeIib6SJeFYHd.hOmMl7dx5M4lEt2bSOD2mm2ZYi', '3U0mdZBWTWMK4q6NRdkTKJ7cToDMjyLYGAqoAMAradwpyovGO5jcJmm7S8HR', NULL, 'Laki-laki', NULL, 5, 12, '-', 0, 0, 0, 'Komunitas', NULL, 'try@ex.co', NULL, NULL, NULL, NULL, '2017-10-30 13:03:49', '2017-10-31 15:40:13'),
(8, 'Jember', '', '$2y$10$Td4kA10iUIMOqHq444D2AuW28sznnXbwoPdzYdi8dSbAHHepFv6w.', 'iAa7Ibx3YdmQr9d6DgMOqxfs8mk9RPThxz1MZRpO8lFQtfmngjpJlk9Zfd0P', NULL, 'Laki-laki', 1, 0, 13, '-', 0, 0, 0, 'Komunitas', NULL, 'jember@c.m', NULL, NULL, NULL, NULL, '2017-10-30 23:26:29', '2017-10-30 23:32:08'),
(9, 'And', '', '$2y$10$WmHKdWqrAnxtdzSFMbC2b.3ReY.lXytYYD4OjPg2DiKev91wgISou', 'zLrZMhbbGU7aGSo9yW7ekU9iwOpxd208lBpG7w6PZdYQvxNO7nZNE9N5rVP1', NULL, 'Laki-laki', 1, 0, 14, '-', 0, 0, 0, 'Komunitas', NULL, 'And@gmail.com', NULL, NULL, NULL, NULL, '2017-10-31 23:51:17', '2017-11-01 00:00:23'),
(10, 'Test Saja', '', '$2y$10$z0jiM4ojQtyEhEM499v8SuXOrcm3p2QXoBgo9PLnD1lYUmKJDerf2', NULL, NULL, 'Laki-laki', 1, 0, 15, '-', 0, 0, 0, 'Komunitas', NULL, 'test@test.com', NULL, NULL, NULL, NULL, '2017-11-01 00:02:07', '2017-11-01 00:02:07'),
(11, 'Probolinggo', '', '$2y$10$.V6vB6lbMS7.hRJH.s9nj.xTf.5.totTWSyZrrBarWXK0pTK38q..', 'BUbo31SXpgGX2AQ9vn0l7AZGWDu3iYtfTG1q4AsUMlk95EUeHxQN7MM6eh8a', NULL, 'Laki-laki', 1, 0, 16, '-', 0, 0, 0, 'Komunitas', NULL, 'pro@gmail.com', NULL, NULL, NULL, NULL, '2017-11-01 02:27:52', '2017-11-03 03:59:42'),
(12, 'Situbondo', '', '$2y$10$Vw8JxpzIaH2ehFWcVVG5BOp0JfpAkS8TaMFQAkgpFnUfIKYKiDTHO', NULL, NULL, 'Laki-laki', 1, 0, 6, '-', 0, 0, 0, 'Komunitas', NULL, 'sit@ex.co', NULL, NULL, NULL, NULL, '2017-11-01 02:55:01', '2017-11-01 02:55:01'),
(13, 'Laras', '', '$2y$10$5BRvl6Mmmp8XT8Jim5kzbuEboLzAsBS4a6Mpz1C3vXdvEvIAi171m', NULL, NULL, 'Laki-laki', 1, 0, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'larasap@gmail.com', NULL, NULL, NULL, NULL, '2017-11-01 13:12:28', '2017-11-01 13:12:28'),
(14, 'laras', '', '$2y$10$D40L3e71kecGHTUHsep6e.iREXtGn6sEVb6PScpos2VP/zUUM3Eq.', 'B54AX5APwo75HRnOmQzMfJCL1WqXWKmb8HIku7DSL1Uw1JzxIsjPa8NMTWUZ', NULL, 'Laki-laki', 1, 0, 20, '-', 0, 0, 0, 'Komunitas', NULL, 'laras@gmail.com', NULL, NULL, NULL, NULL, '2017-11-01 13:25:31', '2017-11-01 13:46:42'),
(15, 'aldain', '', '$2y$10$gVD4p9CpTWmy/As8TJJRiewevD.IDHBwZFCU428dAkpsGCxioh2n2', NULL, NULL, 'Laki-laki', 1, 0, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'aldiandenisbahri@gmail.com', NULL, NULL, NULL, NULL, '2017-11-02 12:10:15', '2017-11-02 12:10:15'),
(16, 'ahmad', '', '$2y$10$e3duvyfgSC3kcQooEMSdD.jncTP/HiPN6mo9Qrlvmm23TfSVdpILG', NULL, NULL, 'Laki-laki', 1, 0, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'ahmadchoirul01@gmail.com', NULL, NULL, NULL, NULL, '2017-11-02 13:07:01', '2017-11-02 13:07:01'),
(17, 'Beny', '', '$2y$10$LYyaHAaRF6f.5.gQamdtS.WTr4c68vACs/3jEvbxHND2J2FKUxgyO', NULL, NULL, 'Laki-laki', 12, 0, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'benyprasetyo68@gmail.com', NULL, NULL, NULL, NULL, '2017-11-03 00:21:10', '2017-11-03 00:21:10'),
(18, 'Nila', '', '$2y$10$/8by7T3qFlqZ7OlR10Qdaui2iXH.byElRHc.MgJmVvF1ZpD4mnIVS', 'hTultQlVFHh1fIUK2e9GgMWO73fXCQhYj3WD3BCy0E1qXSqZ1NpqlxhTgWsm', NULL, 'Laki-laki', 1, 0, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'nila@gmail.com', NULL, NULL, NULL, NULL, '2017-11-03 00:51:00', '2017-11-03 00:56:22'),
(19, 'laras', '', '$2y$10$O/SptVabj3KFg0Ee./ePS.oVVyY9FvzENRPMfMgOx6eisLAvXnA9e', 'ppbRh3VXOH0C7gpZUbWjwtYGYxC7queZXa3K5q3SXbVLFp2CRPK9hQYtX7rd', NULL, 'Laki-laki', 1, 0, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'laras@yahoo.com', NULL, NULL, NULL, NULL, '2017-11-03 01:46:19', '2017-11-03 01:56:28'),
(20, 'andry', '', '$2y$10$SFNszfVGLf49Rcj.0YOOWedQk/X1SBGjkXffL2AdqyUlBAHa0zUN2', 'BaVP4gFxXM2Jckn5MFI5XBFlQgy1nonRk34fUtg8ZVEvmid6oSDefUOsxWG5', NULL, 'Laki-laki', 19, 2, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'andr@gmail.com', NULL, NULL, NULL, NULL, '2017-11-03 02:30:26', '2017-11-03 02:42:16'),
(21, 'mencoba', '', '$2y$10$Hh4oxxK/0PBUYzDTkrDe1.KlfqA9Q9imQvWqNx82wnXwk4VH6RU1G', 'Ha2Xr6l7Gonqpd6XxkJZ9gnJDl7REsUMpAOrTOFVIvC04HHhiNOeJzBIqFX5', NULL, 'Laki-laki', 19, 11, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'an@gmail.com', NULL, NULL, NULL, NULL, '2017-11-03 02:42:43', '2017-11-03 02:47:26'),
(22, 'nila choirotun', '', '$2y$10$dugi4IR9BQXA1kzB1duui.sSpgPKxQfxtSdBuo1CHwh75g0sdKiFy', 'mU7AHLeJP9aVf9Z6DxhGSAuzeBKhKsVltWUjUiJZL2TvMnhgGSFdTeX7DDSj', NULL, 'Laki-laki', 1, 4, 1, '-', 1, 0, 0, 'Mahasiswa', NULL, 'nilach@gmail.com', NULL, NULL, NULL, NULL, '2017-11-03 02:44:37', '2017-11-03 05:17:55'),
(23, 'banda aceh', '', '$2y$10$U/26Xb/oiu0hS0fq6P.kceP1kVEmqR6870b5tDRmQZ1dCLiGsytfC', 'vlaEL5HMsJcyZvJ5B8NUXinHXk4kfFhaG42izShTguIEJYmldM7trAAEcGpC', NULL, 'Laki-laki', 1, 4, 15, '-', 0, 0, 0, 'Komunitas', NULL, 'aceh@gmail.com', NULL, NULL, NULL, NULL, '2017-11-03 02:46:33', '2017-11-03 05:59:17'),
(24, 'jajaja', '', '$2y$10$ZYy2YyAFRPF5KTXg5phdxeISG/Ebzk3leBzGafKFX3D5J2BJev95S', NULL, NULL, 'Laki-laki', 19, 12, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'jajaja@mail.com', NULL, NULL, NULL, NULL, '2017-11-03 04:17:04', '2017-11-03 04:17:04'),
(25, 'nulled', '', '$2y$10$BVWwrUt9fXXWw0FA2L/WYuDsYafK0rowUTbOT7IBSPFN8nvLhoRZO', 'ake6itkuuvDAqExCBcZ2rnkRyUJc6df7yKxi9p64vt58FJHFJL4CFWihcDcB', NULL, 'Laki-laki', 12, 23, 1, '-', 0, 0, 0, 'Mahasiswa', NULL, 'sofyanartem@gmail.com', NULL, NULL, NULL, NULL, '2017-11-03 11:29:37', '2017-11-03 11:46:09');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_detail`
-- (See below for the actual view)
--
CREATE TABLE `user_detail` (
`id` int(11)
,`nama_kota` varchar(55)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`id` int(11)
,`name` varchar(20)
,`username` varchar(100)
,`password` varchar(255)
,`remember_token` varchar(100)
,`nim` varchar(20)
,`jenis_kelamin` enum('Laki-laki','Perampuan')
,`id_universitas` int(11)
,`id_komunitas` int(11)
,`jumlah_solusi` int(11)
,`jumlah_relawan` int(11)
,`jumlah_ide` int(11)
,`status` enum('Mahasiswa','Komunitas')
,`no_hp` int(11)
,`email` varchar(255)
,`facebook` varchar(255)
,`twitter` varchar(255)
,`instagram` varchar(255)
,`keterangan` text
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `user_detail`
--
DROP TABLE IF EXISTS `user_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`karyamud`@`localhost` SQL SECURITY DEFINER VIEW `user_detail`  AS  select `s`.`id` AS `id`,`d`.`nama` AS `nama_kota` from (`users` `s` left join `kota` `d` on((`s`.`id_kota` = `d`.`id_kota`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`karyamud`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS  select `users`.`id` AS `id`,`users`.`name` AS `name`,`users`.`username` AS `username`,`users`.`password` AS `password`,`users`.`remember_token` AS `remember_token`,`users`.`nim` AS `nim`,`users`.`jenis_kelamin` AS `jenis_kelamin`,`users`.`id_universitas` AS `id_universitas`,`users`.`id_komunitas` AS `id_komunitas`,`users`.`jumlah_solusi` AS `jumlah_solusi`,`users`.`jumlah_relawan` AS `jumlah_relawan`,`users`.`jumlah_ide` AS `jumlah_ide`,`users`.`status` AS `status`,`users`.`no_hp` AS `no_hp`,`users`.`email` AS `email`,`users`.`facebook` AS `facebook`,`users`.`twitter` AS `twitter`,`users`.`instagram` AS `instagram`,`users`.`keterangan` AS `keterangan`,`users`.`created_at` AS `created_at`,`users`.`updated_at` AS `updated_at` from `users` order by `users`.`jumlah_solusi` desc limit 5 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `detail_solusi_like`
--
ALTER TABLE `detail_solusi_like`
  ADD PRIMARY KEY (`id_detail_solusi_like`),
  ADD KEY `id_solusi` (`id_solusi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ide`
--
ALTER TABLE `ide`
  ADD PRIMARY KEY (`id_ide`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `komunitas`
--
ALTER TABLE `komunitas`
  ADD PRIMARY KEY (`id_komunitas`),
  ADD KEY `id_kota` (`id_kota`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`),
  ADD KEY `id_prov` (`id_provinsi`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `relawan`
--
ALTER TABLE `relawan`
  ADD PRIMARY KEY (`id_relawan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_solusi` (`id_solusi`);

--
-- Indexes for table `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`id_solusi`),
  ADD KEY `id_berita` (`id_berita`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `universitas`
--
ALTER TABLE `universitas`
  ADD PRIMARY KEY (`id_universitas`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `detail_solusi_like`
--
ALTER TABLE `detail_solusi_like`
  MODIFY `id_detail_solusi_like` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ide`
--
ALTER TABLE `ide`
  MODIFY `id_ide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `komunitas`
--
ALTER TABLE `komunitas`
  MODIFY `id_komunitas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `relawan`
--
ALTER TABLE `relawan`
  MODIFY `id_relawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `solusi`
--
ALTER TABLE `solusi`
  MODIFY `id_solusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
