//import 'function.dart';

void main() {
  sayHallo('ovi', 'arbini');
  sayHallo('lah siapa lagiiii');
}
//opsional parameter jangan diletakkan di depan, harus diletakkan pada bagian paling belakang
void sayHallo(String namaDepan, [String? namaBelakang]) { // opsional parameter dapat ditandai opsional dengan menambahkan tanda tanya dan tanda [] kedalam perintahnya.
  var tampil = 'nama saya $namaDepan $namaBelakang';
  print(tampil);
}