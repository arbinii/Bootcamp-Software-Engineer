void main() {
  var tampil = convert(19989);
  print(tampil);
}

String convert(int value) {
  int num = value.abs();
  Map<String, String> _angka = {
    "0": "nol",
    "1": "satu",
    "2": "dua",
    "3": "tiga",
    "4": "empat",
    "5": "lima",
    "6": "enam",
    "7": "tujuh",
    "8": "delapan",
    "9": "sembilan",
    "10": "sepuluh",
    "11": "sebelas",
  };
  var result = null;
  if (num  < 12) {
      result = _angka[num.toString()];
   } else if (num < 20) {
    var cek = convert(num - 10);
    result = "$cek belas";
  
  } else if (num < 100) {
    var nom1 = convert(num ~/ 10); 
    var nom2 = convert(num % 10) == " nol " ? " " : convert(num % 10); 
    result = '$nom1 puluh $nom2';  
    } else if (num >= 100 && num <= 199) {
      result = "seratus " + convert(num % 100);
    } else if (num >= 200 && num <= 999) {
      result = convert(num ~/ 100) + " seratus " + convert(num % 100);
    } else if (num >= 1000 && num <= 1999) {
      result = "seribu " + convert(num % 1000);
    } else if (num >= 2000 && num <= 999999) {
      result = convert(num ~/ 1000) + " seribu " + convert(num % 1000);
    } else if (num >= 1000000 && num <= 999999999) {
      result = convert(num ~/ 1000000) + " juta " + convert(num % 1000000);
    } else if (num >= 1000000000 && num <= 999999999999) {
      result = convert(num ~/ 1000000000) + " milyar " + convert(num % 1000000000);
    } else if (num >= 1000000000000 && num <= 999999999999999) {
      result = convert(num ~/ 1000000000000) + " trilyun " + convert(num % 1000000000000);
    } else if (num >= 1000000000000000 && num <= 999999999999999999) {
      result = convert(num~/ 1000000000000000) + " kuadriliun " + convert(num % 1000000000000000);
  } else {
    result = _angka[num.toString()];
  }
  return result.toString();
}