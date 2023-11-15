
import 'package:flutter/material.dart';
import 'dart:math';
import 'movie.dart';

// Daftar film
final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: "Movie $index",
        price: "Rp.${Random().nextInt(30000) + 15000}"));
       // runtime: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  // Semua film (yang akan ditampilkan di layar Beranda)
  final List<Movie> _movies = initialData;
  
  // mengambil semua film
  List<Movie> get movies => _movies;

  // Film favorit (yang akan ditampilkan di layar MyList)
  final List<Movie> _myList = [];

  // mengambil film favorit
  List<Movie> get myList => _myList;

  // Menambahkan film ke daftar favorit
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  // Menghapus film dari daftar favorit
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}