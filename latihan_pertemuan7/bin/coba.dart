import 'dart:io';


void main( ) {
  print('PROGRAM KALKULATOR');
  stdout.write( 'MENU~~ \n Silahkan Pilih Yang Ingin Kamu lakukan : \n 1. Penjumlahan \n 2. Pengurangan \n 3. Perkalian \n 4. Pembagian \n 5. Hasil Bagi \n 6. Exit \n Silahkan Pilih : ' ) ;
  double? n = double.parse( stdin.readLineSync( ) ! ) ;


  // memberikan variable pertama
  stdout.write( ' \n Masukkan Nilai Pertama : ' ) ;
  String? inputNilai1 = stdin.readLineSync( );
  if (inputNilai1 == null || inputNilai1.isEmpty){
      print('Nilai pertama tidak diinputkan');
  
      return;
    }
    double nilai1 = double.parse(inputNilai1);


  // memberikan variable kedua
  stdout.write( ' \n Masukkan Nilai Kedua : ' ) ;
  String? inputNilai2 = stdin.readLineSync( );
  if (inputNilai2 == null || inputNilai2.isEmpty) {
      print('Nilai kedua tidak diinputkan');
      return;
    }
    double nilai2 = double.parse(inputNilai2);



  // switch case
  switch ( n ) {


    // penjumlahan
    case 1 :
      double tambah = nilai1 + nilai2 ;
      stdout.write( ' \n Hasilnya adalah : ' ) ;
      print( tambah ) ;
      break ;


    // Pengurangan
    case 2 :
      double kurang = nilai1 - nilai2 ; 
      print( ' \n Hasilnya adalah : ' ) ;
      print( kurang ) ;
      break ;


    // Perkalian
    case 3 :
      double kali = nilai1 * nilai2 ;
      print( ' \n Hasilnya adalah : ' ) ;
      print( kali ) ;
      break ;


    // Pembagian
    case 4 :
      double bagi = nilai1 / nilai2 ;
      print( ' \n Hasilnya adalah : ' ) ;
      print( bagi ) ;
      break ;

      // Hasil Bagi
    case 5 :
      double hasilbagi = nilai1 % nilai2 ;
      print( ' \n Hasilnya adalah : ' ) ;
      print( hasilbagi ) ;
      break ;



    // Jika Nilai Tidak sesuai
    default :
      print( 'Jawaban salah' ) ;
  }
}