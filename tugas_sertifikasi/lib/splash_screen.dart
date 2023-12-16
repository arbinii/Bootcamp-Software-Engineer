import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      });
    });

     new Timer(Duration(milliseconds: 10), () {
       setState(() {
         _isVisible = true;
      });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Mengatur warna latar belakang menjadi putih
      child: AnimatedOpacity( //memberikan efek animasi pada opasitas (transparansi)
        opacity: _isVisible ? 1.0 : 0, // mengatur nilai opasitas atau kegelapan yang akan dicapai
        duration: Duration(milliseconds: 1200), //mengatur berapa lama perubahan tersebut akan berlangsung
        child: Center(
          child: Container(
            height: 250.0,
           // width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/arbini.png'),
                fit: BoxFit.fill, //mengatr gambar sesuai dengan ukuran boxnya
              ),
            ),
          ),
        ),
      ),
    );
  }
}
