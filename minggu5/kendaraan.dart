abstract class Kendaraan {
  String merek;
  String model;
  int tahun;

  Kendaraan(this.merek, this.model, this.tahun);

  void servis(); // Method abstract untuk servis kendaraan

  void tampilkanInformasi(); // Method untuk menampilkan informasi kendaraan
}
