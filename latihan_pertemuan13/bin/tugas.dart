import 'dart:io';
void main() {
  stdout.write('Masukkan angka: ');
  var input = stdin.readLineSync();

  if (input != null) {
    var number = int.tryParse(input);
    if (number != null) {
      var terbilang = convertToWords(number);
      print('$number dalam terbilang: $terbilang');
    } else {
      print('Input tidak valid.');
    }
  }
}

String convertToWords(int number) {
  if (number == 0) {
    return "Nol";
  }

  List<String> units = ["", "Satu", "Dua", "Tiga", "Empat", "Lima", "Enam", "Tujuh", "Delapan", "Sembilan"];
  List<String> teens = ["Sepuluh", "Sebelas", "Dua Belas", "Tiga Belas", "Empat Belas", "Lima Belas", "Enam Belas", "Tujuh Belas",
    "Delapan Belas", "Sembilan Belas"];
  List<String> tens = ["", "Sepuluh", "Dua Puluh", "Tiga Puluh", "Empat Puluh", "Lima Puluh", "Enam Puluh", "Tujuh Puluh",
    "Delapan Puluh", "Sembilan Puluh"];

  String result = "";
  if (number >= 1000000000000) {                                     
    int trilyun = number ~/ 1000000000000;
    result += "${convertToWords(trilyun)} Trilyun ";
    number %= 1000000000000;
    }

  if (number >= 1000000000) {
    int milyar = number ~/ 1000000000;
    result += "${convertToWords(milyar)} Miliar ";
    number %= 1000000000;
  }

  if (number >= 1000000) {
    int juta = number ~/ 1000000;
    result += "${convertToWords(juta)} Juta ";
    number %= 1000000;
  }

  if (number >= 2000) {
    int ribu = number ~/ 1000;
    result += "${convertToWords(ribu)} Ribu ";
    number %= 1000;
  } 
  
  else if (number >= 1000) {
    result += "Seribu ";
    number %= 1000;
  }

  if (number >= 200) {
    int ratus = number ~/ 100;
    result += "${units[ratus]} Ratus ";
    number %= 100;
  } 
  
  else if (number >= 100) {
    result += "Seratus ";
    number %= 100;
  }

  if (number >= 20) {
    int puluh = number ~/ 10;
    result += "${tens[puluh]} " ;
    number %= 10;
  } 
  
  if (number >= 10) {
    result += "${teens[number - 10]} ";
    number = 0;
  }

  else if (number > 0) {
    result += "${units[number]} ";
  }

  return result.trim();
}