import 'dart:io';

// Fungsi untuk menghitung total gaji pegawai
double hitungTotalGaji(double gajiPokok, double tunjangan) {
  return gajiPokok + tunjangan;
}

// Fungsi dengan default parameter untuk menentukan tunjangan berdasarkan jabatan
double hitungTunjangan(String jabatan, [double tunjangan = 500000]) {
  if (jabatan.toLowerCase() == 'manager') {
    return 2000000;
  } else if (jabatan.toLowerCase() == 'supervisor') {
    return 1500000;
  }
  return tunjangan; // Default tunjangan
}

// Fungsi rekursif untuk menghitung bonus tahunan berdasarkan jumlah tahun kerja
double hitungBonus(int tahunKerja) {
  if (tahunKerja == 0) {
    return 0;
  }
  return 1000000 + hitungBonus(tahunKerja - 1);
}

// Arrow function untuk menghitung gaji bersih setelah pajak (10%)
double hitungGajiBersih(double gaji) => gaji * 0.9;

void main() {
  // Menerima input jumlah pegawai
  stdout.write("Masukkan jumlah pegawai: ");
  int jumlahPegawai = int.parse(stdin.readLineSync()!);

  List<Map<String, dynamic>> pegawaiList = [];

  // Menggunakan perulangan for untuk memasukkan data pegawai
  for (int i = 1; i <= jumlahPegawai; i++) {
    stdout.write("Masukkan nama pegawai ke-$i: ");
    String nama = stdin.readLineSync()!;

    stdout.write("Masukkan jabatan pegawai ke-$i: ");
    String jabatan = stdin.readLineSync()!;

    stdout.write("Masukkan tahun kerja pegawai ke-$i: ");
    int tahunKerja = int.parse(stdin.readLineSync()!);

    double tunjangan = hitungTunjangan(jabatan);
    double bonus = hitungBonus(tahunKerja);
    double gajiPokok = 5000000; // Misalnya gaji pokok semua pegawai sama
    double totalGaji = hitungTotalGaji(gajiPokok, tunjangan) + bonus;
    double gajiBersih = hitungGajiBersih(totalGaji);

    pegawaiList.add({
      'ID': i,
      'Nama': nama,
      'Jabatan': jabatan,
      'Tahun Kerja': tahunKerja,
      'Total Gaji': totalGaji,
      'Gaji Bersih': gajiBersih,
    });
  }

  print("\nDaftar Pegawai:");
  for (var pegawai in pegawaiList) {
    print(pegawai);
  }

  // Menampilkan pegawai dengan ID genap dan ganjil menggunakan while loop
  int i = 0;
  print("\nPegawai dengan ID Genap:");
  while (i < pegawaiList.length) {
    if (pegawaiList[i]['ID'] % 2 == 0) {
      print(pegawaiList[i]);
    }
    i++;
  }

  int j = 0;
  print("\nPegawai dengan ID Ganjil:");
  do {
    if (pegawaiList[j]['ID'] % 2 != 0) {
      print(pegawaiList[j]);
    }
    j++;
  } while (j < pegawaiList.length);

  // Menggunakan for-in untuk mencetak data pegawai
  print("\nMencetak data pegawai dengan for-in loop:");
  for (var pegawai in pegawaiList) {
    print(pegawai);
  }

  // Menggunakan foreach untuk mencetak data pegawai
  print("\nMencetak data pegawai dengan foreach:");
  pegawaiList.forEach((pegawai) => print(pegawai));
}
