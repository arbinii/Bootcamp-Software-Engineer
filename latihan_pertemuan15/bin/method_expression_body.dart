class Orang {
  String nama = 'ovi';
  String? alamat;
  final negara = 'konoha wkwk';
  void sayHello (String parameterName) { //ini method
    print('Helloooo $parameterName, nama saya $nama');
  }

  String getName () {
    return 'Hello nama saya $nama, saya tinggal di $alamat';
  }

void waktuMulai() => print('silahkan dimulai'); // ini contoh method expression body
void waktuBerakhir() => print('waktu habis');
String getMenang() => 'selamat anda menang';
}

void main() {
  var orang1 = Orang();
  orang1.nama = 'ovii arbini';
  orang1.alamat = 'sumbawa';
  print(orang1.nama);
  print(orang1.alamat);
  print(orang1.negara);

  orang1.sayHello('cupaiiii');
  print(orang1.getName());

  orang1.waktuMulai();
  orang1.waktuBerakhir();
  print(orang1.getMenang());
}