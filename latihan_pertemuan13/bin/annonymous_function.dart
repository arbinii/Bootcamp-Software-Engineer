void main() {
  var kapitalFunction = (String tulisan) {
    return tulisan.toUpperCase();
  };
  //menggunakan fitur short expession jika simple
  var kecilFunction = (String tulisan) => tulisan.toLowerCase();

  var tampilPertama = kapitalFunction('ini oviiiiii');
  print(tampilPertama);

  var tampilKedua = kecilFunction('INI OVIIIIII');
  print(tampilKedua);
}