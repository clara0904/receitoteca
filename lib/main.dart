import 'package:flutter/material.dart';
import 'package:receitoteca/screens/home_screen.dart';
import 'package:receitoteca/screens/revenue_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitoteca',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color.fromARGB(255, 9, 59, 100)
      ),
      home: const HomeScreen(),
    );
  }
}

//const Color.fromARGB(255, 9, 59, 100)
