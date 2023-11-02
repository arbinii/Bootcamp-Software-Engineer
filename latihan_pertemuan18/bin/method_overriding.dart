class DataDiri { 
  String? nama;

void sayHallo(String nama) {
  print('haloooo $nama, my name ${this.nama}');
  }
}

class DataTurunan extends DataDiri {
  void sayHallo(String nama) {
    print('haloo $nama, my name turunan ${this.nama}');
  }
}

void main() {
  var tampilData = DataDiri();
  tampilData.nama = 'xixi';
  tampilData.sayHallo('opiiii');

  var tampilTurunan = DataTurunan();
  tampilTurunan.nama = 'arbini';
  tampilTurunan.sayHallo('capi');
}