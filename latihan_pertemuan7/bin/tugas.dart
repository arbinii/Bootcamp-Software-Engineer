import 'dart:io';
void main(){
  print("PROGRAM KALKULATOR SEDERHANA");
  stdout.write("SILAHKAN MASUKKAN NOMINAL PERTAMA : ");
  var nullableStringSatu = stdin.readLineSync();
  stdout.write("SILAHKAN MASUKKAN NOMINAL KEDUA : ");
  var nullableStringDua = stdin.readLineSync();

  if (nullableStringSatu != null && nullableStringDua != null){
    print("BERIKUT MERUPAKAN HASILNYA");
    double a = double.parse(nullableStringSatu);
    double b = double.parse(nullableStringDua);
    double hasil;

    //operator penjumlahan 
    hasil = a + b;
    print(" $a + $b = $hasil");
    //print(hasil);

  }
}