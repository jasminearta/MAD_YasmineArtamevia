import 'kendaraan.dart';

class Mobil extends Kendaraan {
  int jumlahPintu;

  Mobil(String merek, String model, int tahun, this.jumlahPintu) : super(merek, model, tahun);

  @override
  void servis() {
    print('Servis mobil $merek $model dilakukan.');
  }

  @override
  void tampilkanInformasi() {
    print('Mobil: $merek $model ($tahun) - $jumlahPintu Pintu');
  }
}
