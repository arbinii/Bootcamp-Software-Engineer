class DataDiri {
  String nama = 'ovi';
  String? alamat;
  final gender = 'perempuan';

  //contoh variable shadowing yaitu ada dua nama variable yang sama
  //sehingga perubahan pada variable atau field tersebut tidak terjadi
    DataDiri(String nama, String alamat) { 
      nama = nama; //field nama tidak berubah
      alamat = alamat; //field alamat tidak berubah
    }
}

void main() {
  var tampilData = DataDiri('arbini', 'sumbawa'); //object
  print(tampilData.nama);
  print(tampilData.alamat);
}