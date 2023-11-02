class DataDiri { 
  String? nama;

void sayHallo(String nama) {
  print('haloooo $nama, my name ${this.nama}');
  }
}

class DataTurunan extends DataDiri {}

void main() {
  var tampilData = DataDiri();
  tampilData.nama = 'xixi';
  tampilData.sayHallo('opiiii');

  var tampilTurunan = DataTurunan();
  tampilTurunan.nama = 'arbini';
  tampilTurunan.sayHallo('capi');
}