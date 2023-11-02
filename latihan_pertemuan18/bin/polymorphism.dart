class KepalaSekolah {
  String nama = 'ovi';
}

class GuruSekolah extends KepalaSekolah {
  String nama = 'capi';
}

class MuridSekolah extends GuruSekolah {
  String nama = 'xixi';
}

void sayHallo(KepalaSekolah data) {
  print(data.nama);
}

//walaupun type datanya bukan kepalasekolah, itu tetap bisa karena
//gurusekolah dan muridsekolah adalah turunan dari kepala sekolah
void main() {
  sayHallo(KepalaSekolah());
  sayHallo(GuruSekolah());
  sayHallo(MuridSekolah());
}

