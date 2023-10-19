class DataDiri {
  String nama = 'ovi';
  String? alamat;
  final gender = 'perempuan';

  //penamaan constructor harus sama persis dengan nama classnya
  //satu class hanya bisa memiliki satu constructor
    DataDiri(String paramNama, String paramAlamat) { // ini constructor
      nama = paramNama;
      alamat = paramAlamat;
    }
}

void main() {
  var tampilData = DataDiri('arbini', 'sumbawa'); //object
  print(tampilData.nama);
  print(tampilData.alamat);
}