import 'dart:io';

void main (){
  print('PROGRAM KALKULATOR SEDERHANA');

  stdout.write('Masukkan angka pertama: ');
  String? inputNum1 = stdin.readLineSync();
    if (inputNum1 == null || inputNum1.isEmpty) {
      print('Angka pertama tidak diinput. Apa yang mau dihitung?');
      return;
    }
    double num1 = double.parse(inputNum1);

  stdout.write('Masukkan angka kedua: ');
  String? inputNum2 = stdin.readLineSync();
    if (inputNum2 == null || inputNum2.isEmpty) {
      print('Input dulu angka kedua kalau mau lanjut ke hasil perhitungan');
      return;
    }
    double num2 = double.parse(inputNum2);

  /*
  stdout.write('Masukkan angka pertama: ');
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan angka kedua: ');
  double num2 = double.parse(stdin.readLineSync()!);
  */

  print('Berikut merupakan hasilnya:');

  //jumlah
  var hasilJumlah = num1 + num2;
  print('$num1 + $num2 = $hasilJumlah');

  //kurang
  var hasilKurang = num1 - num2;
  print('$num1 - $num2 = $hasilKurang');

  //kali
  var hasilKali = num1 * num2;
  print('$num1 * $num2 = $hasilKali');

  //bagi
  var hasilBagi = num1 / num2;
  print('$num1 / $num2 = $hasilBagi');

  //habis bagi
  var hasilHabisBagi = num1 % num2;
  print('$num1 % $num2 = $hasilHabisBagi');
}