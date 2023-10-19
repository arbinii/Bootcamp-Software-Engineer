class DataDiri {
  String nama = 'ovi';
  String? alamat;
  final gender = 'perempuan';

  //pada class, hanya memiliki satu constructor saja
  //tapi satu constructor bis memiliki sub constructor lebih dari 1
  //syaratnya nama sub tidak boleh ada yang sama
    DataDiri(this.nama, this.alamat); // initial formal parameter  

    DataDiri.iniSubConstructorSatu(this.nama);
    
    DataDiri.iniSubConstructorDua(this.alamat);

    }


void main() {
  var tampilData = DataDiri('arbini', 'sumbawa'); //object
  print(tampilData.nama);
  print(tampilData.alamat);

  //memanggil sub constructor
  var tampilSubData1 = DataDiri.iniSubConstructorSatu('pikabuuu');
  print(tampilSubData1.nama);
  print(tampilSubData1.alamat);

   var tampilSubData2 = DataDiri.iniSubConstructorDua('korea');
  print(tampilSubData2.nama);
  print(tampilSubData2.alamat);

}