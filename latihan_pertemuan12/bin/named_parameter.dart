
void main(){
  sayHallo();
  sayHallo(namaDepan: 'ovi', namaBelakang: 'arbi');
  sayHallo(namaBelakang: 'arbi', namaDepan: 'ov');
  sayHallo(namaDepan: 'ovi');
  sayHallo(namaBelakang: 'arbi');
}

//named parameter ditandai dengan adanya kurung kurawal dan semua bersifat opsional sehingga perlu diberikan tanda tanya (?)
void sayHallo({String? namaDepan, String? namaBelakang}) {
  var tampil = 'nama saya $namaDepan $namaBelakang';
  print(tampil);
}

