//import 'dart:io';

//import 'contoh_tugas.dart';

import 'dart:io';

// void sayHello(String tulisan, String Function(String) filter) { //ini higher order function
//   var filterTulisan = filter(tulisan);
//   print('tampil tulisan $filterTulisan');
// }

//   List<String> kata = ["bodoh", "gila", "kambing", "babi", "jamet"];
//   String filterTulisan(String tulisan) { //ini higher order function
//   if (tulisan == 'bodoh') {
//     return '*****';
//   }
//    if (tulisan == 'gila') {
//     return '****';
//   }
//    if (tulisan == 'kambing') {
//     return '*******';
//   }
//    if (tulisan == 'babi') {
//     return '****';
//   }
//   if (tulisan == 'jamet') {
//     return '*****';
//     } else {
//     return filterTulisan(tulisan);
//   }
// }
void main(){
  stdout.write('Silahkan masukkan kata yang ingin di ubah: ');
  var input = stdin.readLineSync();
  var kecilFunction= (String tulisan) => tulisan.toLowerCase();
  var kapitalFunction= (String tulisan) => tulisan.toUpperCase();
  
  var tampilPertama = kecilFunction;
  print("ubah kata ke lowercase: $kecilFunction");
  print("ubah kata ke uppercase: $kapitalFunction");

  // var tampilPertama = kecilFunction;
  // print(tampilPertama);
  // var tampilKedua = kapitalFunction;
  // print(tampilKedua);

  }

  

