class DataDiri {
  String nama = 'ovi';
  String? alamat;
  final gender = 'perempuan';

  //untuk mempersingkat constructor jika isinya hanya menampilkan atau mengubah default field
  //maka dapat menggunakan cara initial formal parameter
    DataDiri(this.nama, this.alamat); // initial formal parameter  
    }


void main() {
  var tampilData = DataDiri('arbini', 'sumbawa'); //object
  print(tampilData.nama);
  print(tampilData.alamat);
}