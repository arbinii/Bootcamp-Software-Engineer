class Orang {
  String nama = 'ovi';
  String? alamat;
  final negara = 'konoha wkwk';
}

void main() {
  var orang1 = Orang();
  orang1.nama = 'Novi Arbini';
  orang1.alamat = 'Sumbawa';
  print(orang1.nama);
  print(orang1.alamat);
  print(orang1.negara);
}