void main(){
  var kehadiran = 80;
  var nilaiTugas = 80;

  var nilaiAkhirKehadiran = kehadiran >= 75;
  var nilaiAkhirTugas = nilaiTugas >= 75;

  var lulus = nilaiAkhirKehadiran == true && nilaiAkhirTugas == true;
  print(lulus);
}