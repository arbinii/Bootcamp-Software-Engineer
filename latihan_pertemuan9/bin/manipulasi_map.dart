void main(){
  var names = <String, String>{};
  //manipulasi menambahkan data
  names['pertama'] = 'ovi';
  names['kedua'] = 'arbini';
  names['ketiga'] = 'manis';
  names['keempat'] = 'hehe';
  print(names);
  //manipulasi mengambil key tertentu
  print(names['kedua']);
  //manipulasi menghapus key tertentu
  names.remove('ketiga');
  print(names);
}