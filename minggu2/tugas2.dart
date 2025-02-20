void main() {
  // List menyimpan daftar nama mahasiswa
  List<String> daftarMahasiswa = [
    "Rizky",
    "Siti",
    "Dian",
    "Fajar",
    "Nina"
  ];

  // Set menyimpan mata kuliah unik
  Set<String> mataKuliahUnik = {
    "Aljabar Linear",
    "Struktur Data",
    "Fisika Dasar",
    "Statistika",
    "Sistem Operasi"
  };

  // Map menyimpan data mahasiswa
  Map<String, Map<String, dynamic>> dataMahasiswa = {
    "Rizky": {
      "NIM": "0110223001",
      "Mata Kuliah": ["Aljabar Linear", "Fisika Dasar"]
    },
    "Siti": {
      "NIM": "0110223002",
      "Mata Kuliah": ["Struktur Data", "Sistem Operasi"]
    },
    "Dian": {
      "NIM": "0110223003",
      "Mata Kuliah": ["Statistika", "Aljabar Linear"]
    },
    "Fajar": {
      "NIM": "0110223004",
      "Mata Kuliah": ["Fisika Dasar", "Sistem Operasi"]
    },
    "Nina": {
      "NIM": "0110223005",
      "Mata Kuliah": ["Struktur Data", "Statistika"]
    }
  };

  // Menambahkan mahasiswa baru
  daftarMahasiswa.add("Aditya Pratama");
  dataMahasiswa["Aditya Pratama"] = {
    "NIM": "0110223010",
    "Mata Kuliah": ["Struktur Data", "Aljabar Linear", "Sistem Operasi"]
  };

  // Memasukkan mata kuliah mahasiswa baru ke dalam Set agar tetap unik
  mataKuliahUnik.addAll(["Struktur Data", "Aljabar Linear", "Sistem Operasi"]);

  // Menghapus satu mahasiswa (misalnya, "Siti")
  daftarMahasiswa.remove("Siti");
  dataMahasiswa.remove("Siti");

  // Menampilkan daftar mahasiswa setelah perubahan
  print("Daftar Mahasiswa setelah perubahan:");
  dataMahasiswa.forEach((nama, data) {
    print("Nama: $nama");
    print("NIM: ${data["NIM"]}");
    print("Mata Kuliah: ${data["Mata Kuliah"].join(", ")}");
    print("------------------------");
  });

  // Menampilkan daftar mata kuliah unik
  print("Mata Kuliah Unik:");
  print(mataKuliahUnik.join(", "));
}
