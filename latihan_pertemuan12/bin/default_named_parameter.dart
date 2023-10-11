
void main(){
  sayHallo();
  sayHallo(namaDepan: 'ovi', namaBelakang: 'arbi');
  sayHallo(namaBelakang: 'arbi', namaDepan: 'ov');
  sayHallo(namaDepan: 'ovi');
  sayHallo(namaBelakang: 'arbi');
}

//default named parameter tidak perlu menggunakan tanda tanya (?)
void sayHallo({String namaDepan = '', String namaBelakang = ''}) {
  var tampil = 'nama saya $namaDepan $namaBelakang';
  print(tampil);
}

