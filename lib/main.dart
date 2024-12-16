import 'package:flutter/material.dart';
import 'package:receitoteca/screens/home_screen.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/theme/colors.dart';

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
        colorSchemeSeed: ColorsApp.backgroundAppBar,
        scaffoldBackgroundColor: ColorsApp.backgroundPrimario,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorsApp.backgroundAppBar,
          titleTextStyle: TextStyle(
            color: ColorsApp.corFonteSecundaria,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: ColorsApp.corFonteSecundaria),
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

//const Color.fromARGB(255, 9, 59, 100)
