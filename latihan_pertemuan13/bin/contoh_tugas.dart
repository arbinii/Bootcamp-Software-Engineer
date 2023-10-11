void main() {
  var tampil = terbilang(59000);
  print(tampil);
}

String terbilang(int value) {
  int num = value.abs();
  Map<String, String> _digits = {
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
  if (num < 12) {
    result = _digits[num.toString()];
  } else if (num < 20) {
    var cek = terbilang(num - 10);
    result = "$cek belas";
  } else if (num < 100) {
    var nom1 = terbilang(num ~/ 10);
    var nom2 = terbilang(num % 10) == 'nol' ? "" : terbilang(num % 10);
    result = '$nom1 puluh $nom2';
  } else if (num < 200) {
    var nom1 = terbilang(num - 100);
    result = ' seratur $nom1';
  } else if (num < 1000) {
    var nom1 = terbilang(num ~/ 100);
    var nom2 = terbilang(num % 100) == 'nol' ? "" : terbilang(num % 100);
    result = '$nom1 ratus $nom2';
  } else if (num < 2000) {
    var nom1 = terbilang(num - 1000);
    result = ' seribu $nom1';
  } else if (num < 1000000) {
    var nom1 = terbilang(num ~/ 1000);
    var nom2 = terbilang(num % 1000) == 'nol' ? "" : terbilang(num % 1000);
    result = '$nom1 ribu $nom2';
  } else if (num < 1000000000) {
    var nom1 = terbilang(num ~/ 1000000);
    var nom2 =
        terbilang(num % 1000000) == 'nol' ? "" : terbilang(num % 1000000);
    result = '$nom1 juta $nom2';
  } else if (num < 1000000000000) {
    var nom1 = terbilang(num ~/ 1000000000);
    var nom2 =
        terbilang(num % 1000000000) == 'nol' ? "" : terbilang(num % 1000000000);
    result = '$nom1 milyar $nom2';
  } else if (num < 1000000000000000) {
    var nom1 = terbilang(num ~/ 1000000000000);
    var nom2 = terbilang(num % 1000000000000) == 'nol'
        ? ""
        : terbilang(num % 1000000000000);
    result = '$nom1 trilyun $nom2';
  } else {
    result = _digits[num.toString()];
  }
  return result.toString();
}