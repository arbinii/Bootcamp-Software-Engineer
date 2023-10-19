class DataDiri {
  String nama = 'ovi';
  String? alamat;
  final gender = 'perempuan';

  //jika terjadi variable shadow, maka disarankan menggunakan this keyword
  //contoh this.namavariable/field
    DataDiri(String nama, String alamat) { 
      this.nama = nama; 
      this.alamat = alamat; 
    }
}

void main() {
  var tampilData = DataDiri('arbini', 'sumbawa'); //object
  print(tampilData.nama);
  print(tampilData.alamat);
}