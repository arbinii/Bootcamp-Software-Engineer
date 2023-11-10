import 'package:flutter/material.dart';

void main() {
  runApp(Pertemuan20());
}

class Pertemuan20 extends StatelessWidget {
  const Pertemuan20({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text ("Aplikasi Halo"),
        ),
        body:  Center(
          child: Container(
            color: Colors.pink,
            width: 150,
            height: 100,
            child: Text(
            "Halooo ini opiii hehe😋🦕",
            style: TextStyle(
              fontWeight: FontWeight.bold, //tebal
              fontStyle: FontStyle.italic, //cetak miring miring
              color: Colors.deepPurple, //warna ungu
              fontSize: 20), //ukuran 20
              ),
          ),
        ),
      ),
    );
  }
}