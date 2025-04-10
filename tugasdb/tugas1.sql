-- Membuat database
CREATE DATABASE dbpos;

-- Menggunakan database
USE dbpos;

-- Tabel kartu
CREATE TABLE kartu(
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(6) UNIQUE,
    nama VARCHAR(30) NOT NULL,
    diskon DOUBLE,
    iuran DOUBLE
);

-- Tabel pelanggan
CREATE TABLE pelanggan(
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    jk CHAR(1),
    tmp_lahir VARCHAR(30),
    tgl_lahir DATE,
    email VARCHAR(45),
    kartu_id INT NOT NULL REFERENCES kartu(id)
);

-- Tabel pesanan
CREATE TABLE pesanan(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE,
    total DOUBLE,
    pelanggan_id INT NOT NULL REFERENCES pelanggan(id)
);

-- Tabel pembayaran
CREATE TABLE pembayaran(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nokuitansi VARCHAR(10) UNIQUE,
    tanggal DATE,
    jumlah DOUBLE,
    ke INT,
    pesanan_id INT NOT NULL REFERENCES pesanan(id)
);

-- Tabel jenis_produk
CREATE TABLE jenis_produk(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(45)
);

-- Tabel produk
CREATE TABLE produk(
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10),
    nama VARCHAR(45),
    harga_beli DOUBLE,
    harga_jual DOUBLE,
    stok INT,
    min_stok INT,
    jenis_produk_id INT NOT NULL REFERENCES jenis_produk(id)
);

-- Tabel pesanan_items
CREATE TABLE pesanan_items(
    id INT AUTO_INCREMENT PRIMARY KEY,
    produk_id INT NOT NULL REFERENCES produk(id),
    pesanan_id INT NOT NULL REFERENCES pesanan(id),
    qty INT,
    harga DOUBLE
);

-- Tabel vendor
CREATE TABLE vendor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomor VARCHAR(4),
    nama VARCHAR(40),
    kota VARCHAR(30),
    kontak VARCHAR(30)
);

-- Tabel pembelian
CREATE TABLE pembelian(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(45),
    nomor VARCHAR(10),
    produk_id INT NOT NULL REFERENCES produk(id),
    jumlah INT,
    harga DOUBLE,
    vendor_id INT NOT NULL REFERENCES vendor(id)
);
