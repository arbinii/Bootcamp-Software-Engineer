// void main() {
//   List<String> kata = ["gila", "bodoh", "kambing", "babi"];
  import 'dart:io';

import 'higher_order_function.dart';

void sayHello(String tulisan, String Function(String) filter) { //ini higher order function
  var filterTulisan = filter(tulisan);
  print("BADWORDS : $filterTulisan");
}

String badWords(String word) { //ini higher order function
  if (word == 'bodoh' || word == 'gila') {
    return '*****';
  } else {
    return word;
  }
}
void main() {
  stdout.write('silahkan masukkan kata yang ingin ditulis : ');
  var input = stdin.readLineSync();

  sayHello('gila kau yaa', filterTulisan);
  sayHello('bodoh', filterTulisan);
}