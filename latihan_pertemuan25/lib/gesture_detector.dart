import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _title;

  final Random _random = new Random();
  Color _color = Colors.purpleAccent;

  @override 
  void initState() {
    super.initState();
    _title = "Gesture Detector";
  }

  void _changeTitle(String title) {
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
            onTap: () {
              _changeTitle("onTap Clicked");
            },
            child: _buildItem("Click with tap"),
          ),
           GestureDetector(
            onDoubleTap: () {
              _changeTitle("onDoubleTap Clicked");
            },
            child: _buildItem("Click with double tap"),
          ),
           GestureDetector(
            onLongPress: () {
              _changeTitle("onLongPress Clicked");
            },
            child: _buildItem("Click with long press"),
          ),
           GestureDetector(
            onVerticalDragDown: (dragDetails) {
              _changeTitle("onTap Clicked");
            },
            child: _buildItem("Click with tap"),
          ),
           GestureDetector(
            onHorizontalDragEnd: (dragDetails) {
              _changeTitle("Horizontal Drag Clicked");
            },
            child: _buildItem("Horizontal Drag"),
          ),
           GestureDetector(
            onScaleEnd: (dragDetails) {
              _changeTitle("Scale Clicked");
            },
            child: _buildItem("OnScale Clicked"),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title) {
    return Container(
      margin:  EdgeInsets.all(14.0),
      padding: EdgeInsets.all(14.0),
      color: Colors.deepPurpleAccent,
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