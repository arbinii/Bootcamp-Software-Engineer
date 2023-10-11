void sayHello(String nama, String Function(String)filter){ // menggunakan higher order function
  var filternama = filter(nama); 
  print('halooo $filternama');
}
String filternama(String nama) { 
  if (nama == 'jelek') {
    return '*****';
  } else {
    return nama;
  }
}

void main(){
  sayHello('jelek', filternama);
  sayHello('ovi', filternama);

  print('silahkan masukkan kalimat yang ingin di convert: ${this.nama}');
  var upperFunction = (String nama){
    return nama.toUpperCase();
  };

  var lowerFunction = (String nama) => nama.toLowerCase(); // mnggunakan anonymous function
  
  var result1 = upperFunction('Ovi Jelek');
  print(result1);

  var result2 = lowerFunction('Ovi Jelek');
  print(result2);
}