import 'minggu5/garasi.dart';
import 'minggu5/mobil.dart';
import 'minggu5/motor.dart';

void main() {
  // Membuat objek Garasi
  Garasi garasi = Garasi();

  // Membuat objek kendaraan
  Mobil mobil = Mobil('Toyota', 'Camry', 2022, 4);
  Motor motor = Motor('Yamaha', 'R15', 2020, 'Tanpa Keranjang');

  // Menambahkan kendaraan ke garasi
  print('Menambahkan kendaraan ke garasi...\n');
  garasi.tambahKendaraan(mobil);
  garasi.tambahKendaraan(motor);

  // Menampilkan daftar kendaraan
  garasi.tampilkanDaftarKendaraan();

  // Melakukan servis semua kendaraan
  garasi.servisSemuaKendaraan();
}
