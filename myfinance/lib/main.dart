import 'package:myfinance/domain/models/category_model.dart';
import 'package:myfinance/domain/models/transaction_model.dart';
import 'package:myfinance/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox<Transaction>('transactions');
  await Hive.openBox<CategoryModel>('categories');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        title: 'My Finance',
      ), // Mulai dari SplashScreen
    );
  }
}
