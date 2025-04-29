CREATE DATABASE IF NOT EXISTS perusahaan;
USE perusahaan;

CREATE TABLE produk (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(50),
    nama VARCHAR(100),
    stok INT,
    harga DECIMAL(10, 2)
);

CREATE TABLE pembelian (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE,
    nomor VARCHAR(50),
    jumlah INT,
    harga DECIMAL(10, 2),
    vendor_id INT
);

CREATE TABLE vendor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    kontak VARCHAR(100)
);

CREATE TABLE pesanan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE,
    total DECIMAL(10, 2),
    pelanggan_id INT,
    kartu_id INT
);

CREATE TABLE pelanggan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(50),
    nama VARCHAR(100),
    kartu_id INT
);

CREATE TABLE kartu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    diskon DECIMAL(5, 2)
);

CREATE TABLE pembayaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE,
    jumlah DECIMAL(10, 2),
    metode_pembayaran VARCHAR(50)
);

CREATE TABLE kartu_iuran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kartu_id INT,
    jumlah_iuran DECIMAL(10, 2)
);

CREATE VIEW pesanan_pelanggan_kartu AS
SELECT pesanan.id, 
       pesanan.tanggal, 
       pesanan.total, 
       pelanggan.kode,
       pelanggan.nama,
       kartu.nama AS nama_kartu, 
       kartu.diskon
FROM pesanan
INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
INNER JOIN kartu ON pelanggan.kartu_id = kartu.id;

CREATE VIEW pembelian_produk_vendor AS
SELECT pembelian.id, 
       pembelian.tanggal, 
       pembelian.nomor, 
       pembelian.jumlah, 
       pembelian.harga, 
       vendor.nama, 
       vendor.kontak
FROM pembelian
INNER JOIN vendor ON pembelian.vendor_id = vendor.id;

CREATE TABLE pesanan_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pesanan_id INT,
    produk_id INT,
    qty INT,
    harga_jual DECIMAL(10, 2),
    FOREIGN KEY (pesanan_id) REFERENCES pesanan(id),
    FOREIGN KEY (produk_id) REFERENCES produk(id)
);

CREATE VIEW pesanan_pelanggan_produk AS
SELECT pesanan.id, 
       pesanan.tanggal, 
       pesanan.total, 
       produk.nama AS nama_produk,
       produk.kode, 
       produk.stok, 
       pesanan_items.qty, 
       pesanan_items.harga_jual
FROM pesanan
INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id
INNER JOIN produk ON pesanan_items.produk_id = produk.id;

START TRANSACTION;

INSERT INTO produk (kode, nama, stok, harga) 
VALUES ('PRD001', 'Produk A', 50, 10000),
       ('PRD002', 'Produk B', 30, 15000),
       ('PRD003', 'Produk C', 20, 20000);

UPDATE produk 
SET stok = 40 
WHERE kode = 'PRD001';

SAVEPOINT sebelum_hapus_pembayaran;

DELETE FROM pembayaran 
WHERE id = 5;

ROLLBACK TO SAVEPOINT sebelum_hapus_pembayaran;

UPDATE kartu_iuran 
SET jumlah_iuran = 50000 
WHERE id = 2;

COMMIT;
