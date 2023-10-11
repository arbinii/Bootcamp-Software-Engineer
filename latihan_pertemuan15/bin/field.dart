class Orang { //class
  String nama = 'ovi'; //field
  String? alamat;
  final negara = 'konoha wkwk';
}

void main() {
  var orang1 = Orang(); //object
  print(orang1.nama);
  print(orang1.alamat);
  print(orang1.negara);
}