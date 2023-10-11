
import 'dart:io';

void main() {
  String mainString;
  stdout.write('Silahkan masukkan kata yang ingin di ubah: ');
  mainString = stdin.readLineSync()!;
      print("ubah kata ke lowercase : ${mainString.toLowerCase()}");
      print("ubah kata ke uppercase : ${mainString.toUpperCase()}");
}