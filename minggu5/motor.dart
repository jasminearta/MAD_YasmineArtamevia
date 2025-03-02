import 'kendaraan.dart';

class Motor extends Kendaraan {
  String jenisKeranjang;

  Motor(String merek, String model, int tahun, this.jenisKeranjang) : super(merek, model, tahun);

  @override
  void servis() {
    print('Servis motor $merek $model dilakukan.');
  }

  @override
  void tampilkanInformasi() {
    print('Motor: $merek $model ($tahun) - $jenisKeranjang');
  }
}
