
void main(){
  sayHallo(namaDepan: 'ovi', namaBelakang: 'arbi');
  sayHallo(namaBelakang: 'arbi', namaDepan: 'ovi');
  sayHallo(namaDepan: 'ovi');
}

//required parameter menjadikan parameter tersebut harus diisi, tidak boleh nullable
void sayHallo({required String namaDepan, String namaBelakang = ''}) {
  var tampil = 'nama saya $namaDepan $namaBelakang';
  print(tampil);
}

