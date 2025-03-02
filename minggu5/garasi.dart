import 'kendaraan.dart';

class Garasi {
  List<Kendaraan> kendaraanList = [];

  // Menambahkan kendaraan ke garasi
  void tambahKendaraan(Kendaraan kendaraan) {
    kendaraanList.add(kendaraan);
  }

  // Menampilkan daftar kendaraan
  void tampilkanDaftarKendaraan() {
    print('Daftar Kendaraan di Garasi:');
    for (var kendaraan in kendaraanList) {
      kendaraan.tampilkanInformasi();
    }
  }

  // Melakukan servis untuk semua kendaraan
  void servisSemuaKendaraan() {
    print('Melakukan servis untuk semua kendaraan...');
    for (var kendaraan in kendaraanList) {
      kendaraan.servis();
    }
  }
}
