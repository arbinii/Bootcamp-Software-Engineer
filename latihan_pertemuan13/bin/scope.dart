void main() {
  //scope awal
  //variable bunga terdapat dalam scope function main
  var bunga ='bunga matahari🌻';
  print(bunga);
  //scope akhir
}

void contoh() {
  print(bunga); //error dan tidak bisa memanggil bunga karena diluar scope
}