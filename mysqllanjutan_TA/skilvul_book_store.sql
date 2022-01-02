-- CREATE database bernama skilvulbookstore
	create database skilvulbookstore;
-- Buatlah table bernama penerbit dengan attribute/column yang berisi:
-- 	id
-- 		Tipe data: Integer (10)
-- 		Not Null
-- 		Auto Increment
-- 		Primary Key
-- 	nama
-- 		Tipe data: String
-- 		Max of Length: 50
-- 		NULL
-- 	kota																														
-- 		Tipe data: String
-- 		Max of Length: 50
-- 		NULL

create table penerbit (
    -> id INT (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> nama VARCHAR (50) NULL,
    -> kota VARCHAR (50) NULL);

-- Buatlah table bernama penulis dengan attribute/column yang berisi:
-- 	id
-- 		Tipe data: Integer (10)
-- 		Not Null
-- 		Auto Increment
-- 		Primary Key
-- 	nama
-- 		Tipe data: String
-- 		Max of Length: 50
-- 		NULL
-- 	kota
-- 		Tipe data: String
-- 		Max of Length: 50
-- 		NULL

CREATE TABLE penulis (
    -> id INT (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> nama VARCHAR (50) NULL,
    -> kota VARCHAR (50) NULL);

-- Kita akan melakukan relasi pada table terakhir yang bernama buku terhadap kedua table yang ada.
-- 1 penerbit dapat memiliki banyak buku
-- 1 buku hanya memiliki 1 penulis
-- Buatlah table bernama buku lengkap dengan relasi terhadap penulis dan penerbit dengan attribute/column yang berisi:
-- 	id
-- 		Tipe data: Integer (10)
-- 		Not Null
-- 		Auto Increment
-- 		Primary Key
-- 	ISBN
-- 		Tipe data: String
-- 		Max of length: 50
-- 		NULL
-- 	judul
-- 		Tipe data: String
-- 		Max of length: 50
-- 		NULL
-- 	penulis
-- 		Tipe data: String
-- 		Max of length: 50
-- 		NULL
-- 	penerbit
-- 		Tipe data: Integer (10)
-- 		NULL
-- 	harga
-- 		Tipe data: Integer (10)
-- 		NULL
-- 	stock
-- 		Tipe data: Integer (10)
-- 		NULL

CREATE TABLE `buku` (
  `id` int(10) NOT NULL,
  `ISBN` varchar(50) DEFAULT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `penulis` int(10) DEFAULT NULL,
  `penerbit` int(10) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `stock` int(10) DEFAULT NULL
);

ALTER TABLE `buku`
  ADD CONSTRAINT `fk_penerbit` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`id`),
  ADD CONSTRAINT `fk_penulis` FOREIGN KEY (`penulis`) REFERENCES `penulis` (`id`);

-- Lakukan INNER JOIN dari table buku terhadap table penerbit

	select * from buku inner join penerbit on buku.penerbit = penerbit.id;

-- Lakukan LEFT JOIN dari table buku terhadap table penerbit

	SELECT * FROM buku LEFT JOIN penerbit on buku.penerbit = penerbit.id;

-- Lakukan RIGHT JOIN dari table buku terhadap table penerbit

	SELECT * FROM buku RIGHT JOIN penerbit on buku.penerbit = penerbit.id;

-- Cek nilai MAX dari column harga pada table book yang memiliki jumlah stok buku di bawah 10

	 select max(harga) from buku where stock < 10

-- Cek nilai MIN dari column harga pada table book

	 select min(harga) from buku

-- Gunakan COUNT untuk melihat list data dengan kondisi harga buku di bawah 100000

	select count(id) from buku where harga<10000;