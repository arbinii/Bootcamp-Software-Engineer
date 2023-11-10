import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Color> myColor = [ // final digunakan untuk mendefinisikan varialblenya menggunkan final karena menggunakan StatelessWidget
    Colors.purple,
    Colors.pink,
    Colors.blue,
    Colors.amber
    ];

    final List<Widget> myList = List.generate( 
    50,
    (index) => Text(
      "${index + 1}", //agar list numbernya dimulai dari 1 bukan 0
      style: TextStyle(
        fontSize : 20 + double.parse(index.toString()),
      ),
    ),
    );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View"),
        ),
        body: ListView(
          children: myList,
        ),
      ),   
    );
   }
}