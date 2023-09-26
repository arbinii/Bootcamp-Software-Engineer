import 'dart:io';


void main( ) {
  print('PROGRAM KALKULATOR');
  stdout.write( ' \n Menu~ \n Silahkan Pilih Yang Ingin Kamu lakukan : \n 1. Penjumlahan \n 2. Pengurangan \n 3. Perkalian \n 4. Pembagian \n 5. Hasil Bagi \n 6. Exit \n Silahkan Pilih : ' ) ;
  double? n = double.parse( stdin.readLineSync( ) ! ) ;


  // memberikan variable pertama
  stdout.write( ' \n Masukkan Nilai Pertama : ' ) ;
  var nullableStringNilai1 = stdin.readLineSync( );
  if (nullableStringNilai1 == null || nullableStringNilai1.isEmpty){
      print('Nilai pertama tidak diinputkan');
  
      return;
    }
    
    
    double nilai1 = double.parse(nullableStringNilai1);
    //int nullableStringNilai1;
    //print(nullableStringNilai1);


  // memberikan variable kedua
  stdout.write( ' \n Masukkan Nilai Kedua : ' ) ;
  var nullableStringNilai2 = stdin.readLineSync( );
  if (nullableStringNilai2 == null || nullableStringNilai2.isEmpty) {
      print('Nilai kedua tidak diinputkan');
  
      return;
  
    }
    
    
    double nilai2 = double.parse(nullableStringNilai2);

    /*String text = '''
    Silahkan pilih operasi
    1. pemjumlahan
    2. pengurangan
    3. perkalian
    4. pembagian
    5. hasil bagi
    pilihan anda?
    ''';
    stdout.write(text);
    pilihan = double.parse(stdin.readLineSync()!);*/



  // switch case
  switch ( n ) {

    case 0 :



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