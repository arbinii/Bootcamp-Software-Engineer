int getHitung(int value) {
  if (value ==1) {
    return 1;
  } else {
    return value + getHitung( value - 1);
  }
}

int getHitungLoop(int value) {
  var result = 0;
  for (var i = 0; i <= value; i++) {
    result += i;
  }
  return result;
}

void main() {
  //menggunakan statis kode
  var tampilHitungPertama = 0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10;
  print(tampilHitungPertama);

  //menggunakan looping kode
  var tampilHitungKedua = getHitungLoop(10);
  print(tampilHitungKedua);

  //menggunakan recursif kode
  var tampilHitungKetiga = getHitung(10);
  print(tampilHitungKetiga);
}