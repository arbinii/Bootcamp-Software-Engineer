void sayHello(String tulisan, String Function(String) filter) { //ini higher order function
  var filterTulisan = filter(tulisan);
  print('tampil tulisan $filterTulisan');
}

String filterTulisan(String tulisan) { //ini higher order function
  if (tulisan == 'bodoh') {
    return '*****';
  } else {
    return tulisan;
  }
}

void main() {
  sayHello('pintar', filterTulisan);
  sayHello('bodoh', filterTulisan);
}