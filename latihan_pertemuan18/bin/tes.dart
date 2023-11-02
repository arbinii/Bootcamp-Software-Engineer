import 'dart:io';

String filterNama(String nama, List<String> filter){ 
  String filterTulisan = nama; 
  

for (String tulisan in filter) { 
    filterTulisan = filterTulisan.replaceAll(tulisan, '*****'.padLeft(tulisan.length, ''));
  }

  return filterTulisan;
}

void main() {
  stdout.write('Silahkan masukkan kata yang ingin di ubah: ');
  String input = stdin.readLineSync()!;
  List<String> filter = [
    "jelek",
    "kambing",
    "burik",
    "babi",
    "busuk",
    "gila",
    "jijik"
  ];
  
String filterTulisan = filterNama(input, filter);
     var lowercase = filterTulisan.toLowerCase();
     var uppercase = filterTulisan.toUpperCase();
     print("kata yang di filter : $filterTulisan");
     print("ubah kata ke lowercase        : $lowercase");
     print("ubah kata ke uppercase        : $uppercase");

  
}


  