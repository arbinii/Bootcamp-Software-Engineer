import 'dart:io';
void main() {
  print('PROGRAM KALKULATOR SEDERHANA :)');
 
  stdout.write('Masukkan Nilai Pertama : ');
  double a = double.parse(stdin.readLineSync()!);
  stdout.write('Masukkan Nilai Kedua : ');
  double b = double.parse(stdin.readLineSync()!);

    print('Berikut adalah hasilnyaaaa');
    double hasil;

    //penjumlahan 
    hasil = a + b;
    print('$a + $b = $hasil');
    
    //pengurangan
    hasil = a - b;
    print('$a - $b = $hasil');

    //perkalian
    hasil = a * b;
    print('$a * $b = $hasil');

    //pembagian
    hasil = a / b;
    print('$a / $b = $hasil');

    //hasil bagi
    hasil = a % b;
    print('$a % $b = $hasil');
}