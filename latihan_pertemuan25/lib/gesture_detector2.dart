import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Detector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _title;

  final Random _random = new Random();
  Color _color = Colors.orange;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _title = "Gesture Detector";
  }

  void _chageTitle(String title){
    setState(() {
      _title = title;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_title!),

      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              _chageTitle("onTap Clicked");
            },
            child:_buildItem("Click with tap"),

          ),
          GestureDetector(
            onDoubleTap: (){
              _chageTitle("onDoubleTap Clicked");
            },
            child: _buildItem("Click with double tap"),
          ),
          GestureDetector(
            onLongPress: (){
              _chageTitle("onLongPress Clicked");
            },
            child: _buildItem("Click with long press"),
          ),
          GestureDetector(
            onVerticalDragDown: (dragDetails){
              _chageTitle("onTap Clicked");
            },
            child: _buildItem("Click with tap"),
          ),
          GestureDetector(
            onHorizontalDragEnd: (dragDetails){
              _chageTitle("Horizontal Drag Clicked");
            },
            child: _buildItem("Horizontal Drag"),
          ),
          GestureDetector(
            onScaleEnd: (dragDetails){
              _chageTitle("Scale Clicked");
            },
            child: _buildItem("onScaleEnd Clicked"),
          ),



        ],
      ),
    );
  }

  Widget _buildItem(String title){
    return Container(
      margin: EdgeInsets.all(14.0),
      padding: EdgeInsets.all(14.0),
      color: Colors.pink,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}
