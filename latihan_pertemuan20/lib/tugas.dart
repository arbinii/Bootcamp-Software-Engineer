import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //var title = 'Skinreport-Today';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          title: Text ("Skinreport-Today"),
        ),
        body: Image.asset(
          'images/troveskin.png',
        ),
      ),
    );
  }
}