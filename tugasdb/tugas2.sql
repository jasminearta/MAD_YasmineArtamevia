TUGAS 6.1 DAN 6.2

Nama 	: Yasmine Artamevia
Mobile App Developer

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.022 sec)

mysql> create database tugas1;
Query OK, 1 row affected (0.067 sec)

mysql> use tugas1;
Database changed
mysql> create table produk(
    -> id int auto_increment primary key,
    -> nama_produk varchar(100),
    -> harga_jual double,
    -> jenis_produk_id int);
Query OK, 0 rows affected (0.026 sec)

mysql> create table pelanggan(
    -> id int auto_increment primary key,
    -> nama varchar(100),
    -> tgl_lahir date);
Query OK, 0 rows affected (0.030 sec)

mysql> DELIMETER $$
    $> create procedure pro_naikan_harga(
    $> in jenis_produk int,
    $> in presentasi_kenaikan int)
    $> begin
    $> update produk
    $> set harga_jual = harga_jual + (harga_jual * presentasi_kenaikan / 100)
    $> where jenis_produk_id = jenis_produk;
    $> END $$
    -> DELIMETER ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DELIMETER $$
create procedure pro_naikan_harga(
in jenis_produk int,
in presenta' at line 1
mysql> DELIMITER $$
mysql> DELIMITER $$
mysql> DELIMITER $$
mysql> DELIMETER $$                                                             ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DELIMETER' at line 1
mysql> DELIMITER $$
mysql> create procedure pro_naikan_harga(
    -> in jenis_produk int,
    -> in presentasi_kenaikan int)
    -> begin
    -> update produk
    -> set harga_jual = harga_jual + (harga_jual * presentasi_kenaikan / 100)
    -> where jenis_produk_id = jenis_produk;
    -> end $$
Query OK, 0 rows affected (0.068 sec)

mysql> DELIMITER ;
mysql> show procedure status where db = 'tugas1';
+--------+------------------+-----------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db     | Name             | Type      | Language | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+--------+------------------+-----------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| tugas1 | pro_naikan_harga | PROCEDURE | SQL      | root@localhost | 2025-04-20 21:37:25 | 2025-04-20 21:37:25 | DEFINER       |         | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
+--------+------------------+-----------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
1 row in set (0.037 sec)

mysql> CALL pro_naikan_harga(1, 10);
Query OK, 0 rows affected (0.022 sec)

mysql> SELECT * FROM produk WHERE jenis_produk_id = 1;
Empty set (0.001 sec)

mysql> INSERT INTO produk (nama_produk, jenis_produk_id, harga_jual)
    -> VALUES ('Produk A', 1, 100000),
    ->        ('Produk B', 1, 200000),
    ->        ('Produk C', 2, 500000);
Query OK, 3 rows affected (0.006 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> CALL pro_naikan_harga(1, 10);
Query OK, 2 rows affected (0.003 sec)

mysql> 
mysql> SELECT * FROM produk;
+----+-------------+------------+-----------------+
| id | nama_produk | harga_jual | jenis_produk_id |
+----+-------------+------------+-----------------+
|  1 | Produk A    |     110000 |               1 |
|  2 | Produk B    |     220000 |               1 |
|  3 | Produk C    |     500000 |               2 |
+----+-------------+------------+-----------------+
3 rows in set (0.001 sec)

mysql> SELECT * FROM produk;
+----+-------------+------------+-----------------+
| id | nama_produk | harga_jual | jenis_produk_id |
+----+-------------+------------+-----------------+
|  1 | Produk A    |     110000 |               1 |
|  2 | Produk B    |     220000 |               1 |
|  3 | Produk C    |     500000 |               2 |
+----+-------------+------------+-----------------+
3 rows in set (0.001 sec)

mysql> ALTER TABLE pembayaran ADD status_pembayaran VARCHAR(25);
ERROR 1146 (42S02): Table 'tugas1.pembayaran' doesn't exist
mysql> CREATE TABLE pesanan (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     pelanggan_id INT,
    ->     tanggal DATE,
    ->     total DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.052 sec)

mysql> CREATE TABLE pembayaran (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     no_kuitansi VARCHAR(20),
    ->     tanggal DATE,
    ->     jumlah DECIMAL(10,2),
    ->     ke INT,
    ->     pesanan_id INT,
    ->     status_pembayaran VARCHAR(25),
    ->     FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
    -> );
Query OK, 0 rows affected (0.016 sec)

mysql> CREATE TABLE produk (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     nama VARCHAR(100),
    ->     stok INT,
    ->     harga DECIMAL(10,2)
    -> );
ERROR 1050 (42S01): Table 'produk' already exists
mysql> CREATE TABLE pesanan (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     pelanggan_id INT,
    ->     tanggal DATE,
    ->     total DECIMAL(10,2)
    -> );
ERROR 1050 (42S01): Table 'pesanan' already exists
mysql> CREATE TABLE pesanan_item (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     pesanan_id INT,
    ->     produk_id INT,
    ->     jumlah INT,
    ->     FOREIGN KEY (pesanan_id) REFERENCES pesanan(id),
    ->     FOREIGN KEY (produk_id) REFERENCES produk(id)
    -> );
Query OK, 0 rows affected (0.025 sec)

mysql> DELIMITER $$
mysql> cmysql> create trigger cek_pembayaran
    -> before insert on pembayaran
    -> for each row
    -> begin 
    -> declare total_bayar decimal(10, 2);
    -> declare total_pesanan decimal(10, 2);
    -> select ifnull(sum(jumlah), 0) into total_bayar from pembayaran where pesanan_id = new.pesanan_id;
    -> select total into total_pesanan from pesanan where id = new.pesanan_id;
    -> if total_bayar + new.jumlah >= total_pesanan then set new.status_pembayaran = 'lunas';
    -> else
    -> set new.status_pembayaran = 'belum lunas';
    -> enf if;
    -> end if;
    -> end$$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cek_pembayaran
before insert on pembayaran
for each row
begin 
declare total_bay' at line 1
mysql> DELIMITER $$
mysql> CREATE TRIGGER cek_pembayaran
    -> before INSERT ON pembayaran 
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE total_bayar DECIMAL(10, 2);
    -> DECLARE total_pesanan DECIMAL(10, 2);
    -> SELECT IFNULL(SUM(jumlah), 0) INTO total_bayar FROM pembayaran WHERE pesanan_id = NEW.pesanan_id;
    -> SELECT total INTO total_pesanan FROM pesanan WHERE id=NEW.pesanan_id;
    -> IF total_bayar + NEW.jumlah >= total_pesanan THEN 
    -> SET NEW.status_pembayaran = 'lunas';
    -> else
    -> set NEW.status_pembayaran = 'belum lunas';
    -> END IF;
    -> END$$
Query OK, 0 rows affected (0.072 sec)

mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE kurangi_stok (
    -> IN produk_id INT,
    -> IN jumlah_pesan INT)
    -> BEGIN
    -> UPDATE produk
    -> SET stok = stok - jumlah_pesan
    -> WHERE id = produk_id;
    -> END$$
Query OK, 0 rows affected (0.018 sec)

mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE TRIGGER trig_kurangi_stok
    -> AFTER INSERT ON pesanan_item
    -> FOR EACH ROW
    -> BEGIN
    -> CALL kurangi_stok(NEW.produk_id, NEW.jumlah);
    -> END$$
Query OK, 0 rows affected (0.028 sec)

mysql> DELIMITER ;
mysql> SELECT * FROM produk;
+----+-------------+------------+-----------------+
| id | nama_produk | harga_jual | jenis_produk_id |
+----+-------------+------------+-----------------+
|  1 | Produk A    |     110000 |               1 |
|  2 | Produk B    |     220000 |               1 |
|  3 | Produk C    |     500000 |               2 |
+----+-------------+------------+-----------------+
3 rows in set (0.010 sec)

mysql> SELECT * FROM pembayaran;
Empty set (0.003 sec)

mysql> INSERT INTO pembayaran (no_kuitansi, tanggal, jumlah, ke, pesanan_id, status_pembayaran)
    -> VALUES ('KWI001', '2023-03-03', 200000, 1, 1, 'Belum Lunas');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`tugas1`.`pembayaran`, CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`))
mysql> SELECT * FROM pesanan WHERE id = 1;
Empty set (0.001 sec)

mysql> INSERT INTO pesanan (id, total)
    -> VALUES (1, 500000);
Query OK, 1 row affected (0.004 sec)

mysql> INSERT INTO pembayaran (no_kuitansi, tanggal, jumlah, ke, pesanan_id, status_pembayaran)
    -> VALUES ('KWI001', '2023-03-03', 200000, 1, 1, 'Belum Lunas');
Query OK, 1 row affected (0.003 sec)

mysql> SELECT * FROM pembayaran;
+----+-------------+------------+-----------+------+------------+-------------------+
| id | no_kuitansi | tanggal    | jumlah    | ke   | pesanan_id | status_pembayaran |
+----+-------------+------------+-----------+------+------------+-------------------+
|  2 | KWI001      | 2023-03-03 | 200000.00 |    1 |          1 | belum lunas       |
+----+-------------+------------+-----------+------+------------+-------------------+
1 row in set (0.001 sec)

mysql> SELECT * FROM pembayaran;
+----+-------------+------------+-----------+------+------------+-------------------+
| id | no_kuitansi | tanggal    | jumlah    | ke   | pesanan_id | status_pembayaran |
+----+-------------+------------+-----------+------+------------+-------------------+
|  2 | KWI001      | 2023-03-03 | 200000.00 |    1 |          1 | belum lunas       |
+----+-------------+------------+-----------+------+------------+-------------------+
1 row in set (0.001 sec)

mysql> UPDATE pembayaran 
    -> SET jumlah = 500000
    -> WHERE no_kuitansi = 'KWI001';
Query OK, 1 row affected (0.004 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM pembayaran WHERE no_kuitansi = 'KWI001';
+----+-------------+------------+-----------+------+------------+-------------------+
| id | no_kuitansi | tanggal    | jumlah    | ke   | pesanan_id | status_pembayaran |
+----+-------------+------------+-----------+------+------------+-------------------+
|  2 | KWI001      | 2023-03-03 | 500000.00 |    1 |          1 | belum lunas       |
+----+-------------+------------+-----------+------+------------+-------------------+
1 row in set (0.002 sec)

mysql> SELECT * FROM pembayaran WHERE no_kuitansi = 'KWI001';
+----+-------------+------------+-----------+------+------------+-------------------+
| id | no_kuitansi | tanggal    | jumlah    | ke   | pesanan_id | status_pembayaran |
+----+-------------+------------+-----------+------+------------+-------------------+
|  2 | KWI001      | 2023-03-03 | 500000.00 |    1 |          1 | belum lunas       |
+----+-------------+------------+-----------+------+------------+-------------------+
1 row in set (0.001 sec)