-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2024 pada 17.50
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_detail` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status` enum('Pending','Processed','Delivered','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `favorit`
--

CREATE TABLE `favorit` (
  `id_favorit` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `favorit`
--

INSERT INTO `favorit` (`id_favorit`, `id_produk`, `id_user`) VALUES
(1, 13, 10),
(2, 8, 3),
(3, 10, 1),
(4, 13, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(3, 'Clothing', '2024-05-31 20:18:03', '2024-05-31 20:18:03'),
(4, 'Shoes', '2024-05-31 20:18:22', '2024-05-31 20:18:22'),
(5, 'Accesories', '2024-05-31 20:18:39', '2024-05-31 20:18:39'),
(6, 'Bag', '2024-05-31 20:20:12', '2024-05-31 20:20:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000002_create_kategori_table', 1),
(3, '0001_01_01_000002_create_produk_table', 1),
(4, '0001_01_01_000000_create_user_table', 2),
(5, '2024_05_31_153128_create_personal_access_tokens_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','processing','completed','cancelled') NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id_order`, `id_user`, `order_date`, `total_amount`, `status`, `alamat`) VALUES
(9, 1, '2024-06-08', 500000.00, 'cancelled', 'Jln. Panyalai RT 01 RW 02 Kp. Baru'),
(10, 9, '2024-05-01', 1461000.00, 'completed', 'Jl. Pasar baru'),
(11, 8, '2024-06-06', 2000000.00, 'pending', 'Jl. Bukit tinggi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id_detail` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price_per_unit` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id_detail`, `id_order`, `id_produk`, `quantity`, `price_per_unit`, `subtotal`) VALUES
(3, 9, 11, 2, 150000.00, 300000.00),
(4, 9, 18, 1, 200000.00, 200000.00),
(5, 10, 9, 3, 99000.00, 297000.00),
(6, 10, 20, 1, 250000.00, 25000.00),
(7, 10, 16, 2, 15000.00, 30000.00),
(8, 10, 28, 1, 99000.00, 99000.00),
(9, 10, 10, 3, 10000.00, 30000.00),
(10, 10, 30, 2, 499000.00, 998000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `otp`
--

CREATE TABLE `otp` (
  `user_id` int(11) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `otp`
--

INSERT INTO `otp` (`user_id`, `otp`, `created_at`, `expires_at`) VALUES
(1, '1234', '2024-06-12 21:42:06', '2024-06-12 21:47:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `jumlah_pembayaran` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `no_resi` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Processed','Delivered','Cancelled') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Trigger `pesanan`
--
DELIMITER $$
CREATE TRIGGER `before_insert_pesanan` BEFORE INSERT ON `pesanan` FOR EACH ROW BEGIN
    SET NEW.no_resi = CONCAT('00', NEW.id_pesanan);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_pesanan` BEFORE UPDATE ON `pesanan` FOR EACH ROW BEGIN
    SET NEW.no_resi = CONCAT('00', NEW.id_pesanan);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `gambar`, `harga`, `stock`, `keterangan`, `created_at`, `updated_at`) VALUES
(6, 3, 'Black 1950s Butterfly Patchwork Vintage Dress', '1717253353.jpg', 299000.00, 30, 'Petticoats added for volume sold separately. Composition: 100% Polyester Stretch: No Stretch Closure: Front Buttons Length: Knee-Length Butterfly mesh stitching', '2024-06-01 07:49:13', '2024-06-06 01:18:52'),
(7, 3, 'Cute Sweater Strawberry edit', '1718175984.jpg', 250000.00, 15, 'The latest swater with original quality and affordable prices can support your appearance', '2024-06-01 07:59:18', '2024-06-12 00:06:24'),
(8, 3, 'Cute Sweater Flower', '1717254015.jpg', 199000.00, 20, 'The latest swater with original quality and affordable prices can support your appearance', '2024-06-01 08:00:15', '2024-06-06 01:19:26'),
(9, 5, 'Black and white sunglasses', '1717254230.jpg', 99000.00, 10, 'Look with the latest fashion style using glasses', '2024-06-01 08:03:50', '2024-06-06 01:19:41'),
(10, 5, 'Hair Accessories', '1717254371.jpg', 10000.00, 100, 'Sustainably made in England with the finest couture silk, these Scrunchies are renowned \'the best silk scrunchies on the market\' by Glamour Magazine', '2024-06-01 08:06:11', '2024-06-06 01:19:52'),
(11, 6, 'bamboo circular bag', '1717254773.jpg', 150000.00, 24, 'Bamboo bags are cute, structured straw bags in rectangular and circular styles that girls love.', '2024-06-01 08:12:53', '2024-06-06 01:20:13'),
(12, 6, 'Bag Black Cute', '1717254826.jpg', 150000.00, 15, 'Cute bag with good quality', '2024-06-01 08:13:46', '2024-06-06 01:20:50'),
(13, 4, 'Converse black', '1717255084.jpg', 799000.00, 30, 'The selection of Converse shoe collections in casual style is right. Not only that, this branded sneakers model also makes it easy to wear and provides more active free movement.', '2024-06-01 08:18:04', '2024-06-06 01:21:03'),
(14, 4, 'Converse Chuck Taylor All Star', '1717255198.jpg', 899000.00, 20, 'The selection of Converse shoe collections in casual style is right. Not only that, this branded sneakers model also makes it easy to wear and provides more active free movement.', '2024-06-01 08:19:58', '2024-06-06 01:21:18'),
(15, 5, 'Rhinestone Flower Decor Bracelet', '1717255442.jpg', 59000.00, 15, 'Yellow gold fashionable collar glass link embellished jewelry', '2024-06-01 08:24:02', '2024-06-06 01:21:31'),
(16, 5, 'Flower Bracelet', '1717255588.jpg', 15000.00, 15, 'Flower bracelet cute', '2024-06-01 08:26:28', '2024-06-06 01:21:43'),
(18, 6, 'Pink bag', '1717255843.jpg', 200000.00, 20, 'Gorgeous pink clutch bag', '2024-06-01 08:30:43', '2024-06-06 01:21:55'),
(19, 3, 'Hoodies Women Casual', '1717256785.jpg', 250000.00, 12, 'Hoodies women casual aesthetic kawaii pink', '2024-06-01 08:46:25', '2024-06-06 01:20:37'),
(20, 3, 'Jaket Women Casual', '1717256815.jpg', 250000.00, 10, 'Jaket women casual aesthetic kawaii pink', '2024-06-01 08:46:55', '2024-06-06 01:22:18'),
(21, 3, 'Sweater', '1717257074.jpg', 150000.00, 12, 'Sweater cute aesthetic', '2024-06-01 08:51:14', '2024-06-06 01:22:31'),
(22, 3, 'Sweater love', '1717257098.jpg', 150000.00, 20, 'Sweater cute aesthetic love', '2024-06-01 08:51:38', '2024-06-06 01:22:07'),
(23, 4, 'Women shoes', '1717257263.jpg', 299000.00, 20, 'Women shoes with good quality', '2024-06-01 08:54:23', '2024-06-06 01:22:42'),
(24, 4, 'Sandal Rose Pink', '1717257384.jpg', 99000.00, 40, 'This pair of Oran Sandals are in Rose Petale calfskin with the iconic H crossover strap and rose petale leather soles.', '2024-06-01 08:56:24', '2024-06-06 01:22:53'),
(25, 4, 'New Balance', '1717257445.jpg', 699000.00, 5, 'New Balance MR530SG Blanc / Indigo naturel - White / 10', '2024-06-01 08:57:25', '2024-06-06 01:23:07'),
(26, 4, 'New Balance', '1717257484.jpg', 699000.00, 5, 'New Balance Kids 480 (Little Kid) Girl\'s Shoes White/Orb Pink : 13.5 Little Kid W', '2024-06-01 08:58:04', '2024-06-06 01:23:18'),
(27, 5, 'Paisley Silk Bandana', '1717257647.jpg', 49000.00, 10, 'Accent your look with this bandana, made with luxuriously soft silk.', '2024-06-01 09:00:47', '2024-06-06 01:23:33'),
(28, 5, 'Minimalist Solid Headband', '1717257774.jpg', 99000.00, 50, 'Pink casual collar fabric plain wide headband embellished women accessories', '2024-06-01 09:02:54', '2024-06-06 01:24:21'),
(29, 6, 'Tote Bag', '1717257909.jpg', 150000.00, 30, 'Indulge in luxury with our Handmade Genuine Leather Tote Shopping Bag.', '2024-06-01 09:05:09', '2024-06-06 01:25:01'),
(30, 6, 'Miu Miu Bag', '1717258123.jpg', 499000.00, 50, 'Miu Miu Wander matelassé shoulder bag Highlights black lambskin nappa leather matelassé effect gold-tone', '2024-06-01 09:08:43', '2024-06-06 01:24:34'),
(32, 6, 'Tote Bag', '1717258338.jpg', 150000.00, 50, 'Tote bag with soft and cute material', '2024-06-01 09:12:18', '2024-06-06 01:24:45'),
(35, 4, 'Sepatu Adidas', '1718175890.jpg', 250000.00, 10, 'Sepatu adidas dengan kualitas oke banget', '2024-06-12 00:04:51', '2024-06-12 00:04:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8djalzGXfzHA2GcCzCZhB0H6W5bW8WY8nl5nXuDo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGZvcVdRVExhU09XWUdkd3RzWGR3aHRwZ3FpNk1rbFZzSVRVTW81TSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1718179313),
('coFrxLK0v8v2FuKcpESYEUfzpsEWeb2CfXxFtVYo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzFVN2VRMlZvbXpaZjA3SldkQ0ZBMU1MREdkRlpmSkthWlRLb00wWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1718176392),
('nB0bOExuYqauTDoMHwLCaH4i6SgXSbWtudT8eIKc', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN1FiSGNPU2tEMjNaZjE0S1N5YTBudDZZWXdIcGhRbXpzaGRybWNCeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlcnMvOS9wZGYiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O30=', 1718032892);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` enum('Pemasukan','Pengeluaran') NOT NULL,
  `jumlah` decimal(15,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `category` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_type`, `jumlah`, `description`, `date`, `category`, `payment_method`, `reference_number`, `id_user`, `id_order`, `status`, `created_at`, `updated_at`) VALUES
(11, 'Pemasukan', 200000.00, 'contoh pemasukan', '2024-06-12', 'office', 'cash', 'tidak ada', NULL, NULL, 'completed', '2024-06-12 00:59:22', '2024-06-12 00:59:49'),
(12, 'Pengeluaran', 200000.00, 'keperluan kantor', '2024-06-12', 'office supplies', 'cash', 'tidak ada', NULL, NULL, 'completed', '2024-06-12 01:00:32', '2024-06-12 01:00:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code_verification` varchar(10) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `user_status` enum('unverified','verified','banned') DEFAULT 'unverified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `fullname`, `username`, `email`, `password`, `nohp`, `created_at`, `updated_at`, `code_verification`, `otp_expiry`, `user_status`) VALUES
(1, 'Rizka Wulandari', 'rizka', 'rizka@gmail.com', '$2y$12$MV4G0oqcZOACKO1Jey9BjuVMMXejhMGX3fluvN9bsNPqgeEiTFYqO', '081266673392', NULL, '2024-06-06 00:30:23', NULL, NULL, 'unverified'),
(3, 'Nadira Aprilia', 'nadira', 'nadira@gmail.com', '$2y$12$JW/PSPuGdodLl4R3THB/GuPyiBKiCmiLhNzVlZLb8CTtMXLlGmOGe', '081270631452', '2024-06-06 00:36:40', '2024-06-06 00:36:40', NULL, NULL, 'unverified'),
(5, 'Yulianti', 'yuli', 'antiyuli2828@gmail.com', '$2y$12$QLnB9lXlahTNWHOh8ZQ7zuSAgtPXE9RaDmnnk5iXT06FJZnHFtS92', '081270631452', '2024-06-06 03:04:43', '2024-06-06 03:04:43', '6857', '2024-06-12 17:58:51', 'verified'),
(8, 'Riski miati', 'riski', 'riski@gmail.com', '12345', '08129373923', NULL, NULL, NULL, NULL, 'unverified'),
(9, 'Hana Lara', 'hana', 'hana@gmail.com', '12345', '08120839202', NULL, NULL, NULL, NULL, 'unverified'),
(10, 'abe abraham', 'abe', 'abe@gmail.com', '$2y$12$ATXof6EXhFOBbpUaouN8..vA3l.3wevnht5GgR9xsAaSknGtFjEEu', '081270631452', '2024-06-08 07:27:27', '2024-06-08 07:27:27', NULL, NULL, 'unverified');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`id_favorit`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`user_id`,`otp`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `produk_id_kategori_foreign` (`id_kategori`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_order` (`id_order`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_username_unique` (`username`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `favorit`
--
ALTER TABLE `favorit`
  MODIFY `id_favorit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`),
  ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `favorit_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `favorit_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `otp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
