class DataDiri {
  var namaDepan = '';
  var namaBelakang = '';
  var namaLengkap = '';
  
 //kegunaan initializer list adalah dia tidak terhalangi oleh variable shadowing
  DataDiri(this.namaLengkap) 
    : namaDepan = namaLengkap.split(" ")[0],
      namaBelakang = namaLengkap.split(" ")[1] {
    print('buat data baru yaaa');
  }
}

void main( ){
  var tampilNama = DataDiri('Novi Arbiniiii');
  print(tampilNama.namaDepan);
  print(tampilNama.namaBelakang);
  print(tampilNama.namaLengkap);

}