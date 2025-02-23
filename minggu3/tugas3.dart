import 'dart:io';

void main() {
  // Input nama dan nilai dari pengguna
  print("Masukan nama:");
  String nama = stdin.readLineSync()!;

  print("Masukan nilai:");
  int nilai = int.parse(stdin.readLineSync()!);

  // Pengecekan menggunakan if-else
  print("\nPengecekan menggunakan if-else:");
  if (nilai >= 90) {
    print("Nama: $nama");
    print("Nilai: $nilai");
    print("Kategori: A - Sangat Baik");
  } else if (nilai >= 80) {
    print("Nama: $nama");
    print("Nilai: $nilai");
    print("Kategori: B - Baik");
  } else if (nilai >= 70) {
    print("Nama: $nama");
    print("Nilai: $nilai");
    print("Kategori: C - Cukup");
  } else if (nilai >= 60) {
    print("Nama: $nama");
    print("Nilai: $nilai");
    print("Kategori: D - Kurang");
  } else {
    print("Nama: $nama");
    print("Nilai: $nilai");
    print("Kategori: E - Gagal");
  }

  // Pengecekan menggunakan switch case
  print("\nPengecekan menggunakan switch case:");
  String kategori;
  
  switch (nilai ~/ 10) {
    case 10:
    case 9:
      kategori = 'A';
      break;
    case 8:
      kategori = 'B';
      break;
    case 7:
      kategori = 'C';
      break;
    case 6:
      kategori = 'D';
      break;
    default:
      kategori = 'E';
  }

  print("Nama: $nama");
  print("Nilai: $nilai");
  print("Kategori: $kategori");
}
