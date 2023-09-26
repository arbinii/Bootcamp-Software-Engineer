void main(){
  dynamic data = 100;
  var tampilData = data as String;
  print(tampilData); 
  // untuk menggunakan as harus berhati-hati karena as bukan fungsi konversi, sehingga jika data di awal interger dan dipaksa dijadikan String maka akan tampil error seperti ini
  //kenapa yang ditas erro karena tipe datanya int harusnya menulis as int, bukan as string
}