class DataDiri { 
  String nama = 'opiiii';

void sayHallo(String nama) {
  print('haloooo $nama, my name diri ${this.nama}');
  }
}

  class DataTurunan extends DataDiri {
  String nama = 'turunan opiiii';
  void sayHallo(String nama) {
    print('haloo $nama, my name turunan ${this.nama}');
  }


  void getNamaParent() {
    print(super.nama);
  }

  void getNamaTurunan() {
    print(nama);
  }
}

void main() {
  var tampilTurunan = DataTurunan();
  tampilTurunan.getNamaParent();
  tampilTurunan.getNamaTurunan();
}