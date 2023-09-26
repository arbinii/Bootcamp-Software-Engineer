import 'dart:io';

void main (){
  String? choice;

  print('\nPROGRAM KALKULATOR SEDERHANA KELOMPOK 4');
  print('Pilih operasi:');
  print('1. Penjumlahan (+)');
  print('2. Pengurangan (-)');
  print('3. Perkalian (*)');
  print('4. Pembagian (/)');
  print('5. Modulus (%)');

  while (choice == null || !['1', '2', '3', '4', '5'].contains(choice)) {  
    stdout.write('Silahkan masukkan nomor operasi yang anda inginkan: ');
    choice = stdin.readLineSync() ?? '';

    if (!['1', '2', '3', '4', '5'].contains(choice)) {
      stdout.write('Pilihan tidak valid. Silakan pilih angka 1, 2, 3, 4, atau 5.');
    }
  }

  double? num1;
  double? num2;

  while (num1 == null) {
    stdout.write('Masukkan angka pertama: ');
    String? inputNum1 = stdin.readLineSync();
    num1 = double.tryParse(inputNum1 ?? '');

    if (num1 == null) {
      print('Input tidak sesuai. Silakan masukkan angka.');
    }
  }

  while (num2 == null) {
    stdout.write('Masukkan angka kedua: ');
    String? inputNum2 = stdin.readLineSync();
    num2 = double.tryParse(inputNum2 ?? '');

    if (num2 == null) {
      print('Input tidak sesuai. Silakan masukkan angka.');
    }
  }

  double result = 0;

  switch(choice){
    case '1' :
      result = num1 + num2;
      break;
    case '2' :
      result = num1 - num2;
      break;
    case '3' :
      result = num1 * num2;
      break;
    case '4' :
      result = num1 / num2;
      break;
    case '5' :
      result = num1 % num2;
      break;
  }

  print('Berikut merupakan hasilnya: $result');
  var selesai = 'Perhitungan selesai';

  stdout.write('Apakah mau melakukan perhitungan lagi? (y/t): ');
  String jawab = stdin.readLineSync()!;
  if(jawab == 'y'){
    return main();
  }
  else{
    print(selesai);
  }
}