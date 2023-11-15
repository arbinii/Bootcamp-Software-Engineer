
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie_provider.dart';

import 'homescreen.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: const MyApp(),
    create: (_) => MovieProvider(), // Membuat objek ChangeNotifier baru
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}


