
-- TABEL USERS
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) UNIQUE,
    password VARCHAR(255),
    level ENUM('admin', 'kasir')
);

INSERT INTO users (username, password, level) VALUES
('admin', 'admin123', 'admin'),
('kasir1', 'kasir123', 'kasir');

-- TABEL KARTU
CREATE TABLE kartu (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    diskon INT,
    iuran DOUBLE
);

INSERT INTO kartu (kode, nama, diskon, iuran) VALUES
('B01', 'Bronze', 5, 10000),
('S01', 'Silver', 10, 20000),
('G01', 'Gold', 15, 30000);

-- TABEL PELANGGAN
CREATE TABLE pelanggan (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    jk ENUM('L', 'P'),
    tmp_lahir VARCHAR(30),
    tgl_lahir DATE,
    email VARCHAR(40),
    alamat TEXT,
    kartu_id INT NOT NULL,
    FOREIGN KEY (kartu_id) REFERENCES kartu(id)
);

INSERT INTO pelanggan (kode, nama, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id) VALUES
('C001', 'Ahmad', 'L', 'Jakarta', '1990-01-01', 'ahmad@mail.com', 'Jl. Merdeka 1', 1),
('C002', 'Siti', 'P', 'Bandung', '1992-03-04', 'siti@mail.com', 'Jl. Merdeka 2', 2);

-- TABEL JENIS PRODUK
CREATE TABLE jenis_produk (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(45)
);

INSERT INTO jenis_produk (nama) VALUES
('Makanan'),
('Minuman');

-- TABEL PRODUK
CREATE TABLE produk (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    harga_beli DOUBLE,
    harga_jual DOUBLE,
    stok INT,
    min_stok INT,
    jenis_produk_id INT,
    FOREIGN KEY (jenis_produk_id) REFERENCES jenis_produk(id)
);

INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES
('P001', 'Roti', 3000, 5000, 100, 10, 1),
('P002', 'Teh Botol', 4000, 6000, 80, 15, 2);

-- TABEL VENDOR
CREATE TABLE vendor (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomor VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    kota VARCHAR(45),
    kontak VARCHAR(45)
);

INSERT INTO vendor (nomor, nama, kota, kontak) VALUES
('V001', 'PT Sumber Makanan', 'Jakarta', '021-123456'),
('V002', 'PT Minum Segar', 'Bandung', '022-654321');

-- TABEL PEMBELIAN
CREATE TABLE pembelian (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE,
    nomor VARCHAR(10) UNIQUE,
    produk_id INT,
    jumlah INT,
    harga DOUBLE,
    vendor_id INT,
    FOREIGN KEY (produk_id) REFERENCES produk(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

INSERT INTO pembelian (tanggal, nomor, produk_id, jumlah, harga, vendor_id) VALUES
('2025-04-28', 'PB001', 1, 50, 3000, 1),
('2025-04-28', 'PB002', 2, 60, 4000, 2);

-- TABEL PESANAN
CREATE TABLE pesanan (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(45),
    nomor VARCHAR(10) UNIQUE,
    pelanggan_id INT NOT NULL,
    kasir_id INT NOT NULL,
    FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id),
    FOREIGN KEY (kasir_id) REFERENCES users(id)
);

INSERT INTO pesanan (tanggal, nomor, pelanggan_id, kasir_id) VALUES
('2025-04-29', 'PN001', 1, 2),
('2025-04-29', 'PN002', 2, 2);

-- TABEL PESANAN ITEMS
CREATE TABLE pesanan_items (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    produk_id INT,
    pesanan_id INT,
    qty INT,
    harga DOUBLE,
    FOREIGN KEY (produk_id) REFERENCES produk(id),
    FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
);

INSERT INTO pesanan_items (produk_id, pesanan_id, qty, harga) VALUES
(1, 1, 2, 5000),
(2, 1, 1, 6000),
(2, 2, 3, 6000);
