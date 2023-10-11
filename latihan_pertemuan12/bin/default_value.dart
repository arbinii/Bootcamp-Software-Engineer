
void main() {
  sayHallo('ovi', 'arbini');
  sayHallo('siapaaa?');
}
//default value todak perlu menggunakan tanda tanya (?) seperti opsional parameter
void sayHallo(String namaDepan, [String namaBelakang = '']) { // default value menambahkan tanda = kedalam perintahnya.
  var tampil = 'nama saya $namaDepan $namaBelakang';
  print(tampil);
}