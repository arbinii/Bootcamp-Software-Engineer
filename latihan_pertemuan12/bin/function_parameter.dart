//import 'function.dart';

void main() {
  sayHallo('ovi', 'arbi', 24);
}

void sayHallo(String namaDepan, String namaBelakang, int umur){ // variabelnya gunakan camelcase
  var tampil = 'nama saya $namaDepan $namaBelakang, umur saya $umur tahun';
  print(tampil);
}