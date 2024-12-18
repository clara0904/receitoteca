import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias_provider.dart';
import 'package:receitoteca/models/lista_receitas_provider.dart';
import 'package:receitoteca/models/receita_provider.dart';
import 'package:receitoteca/repositories/repositorio_receitas.dart';
import 'package:receitoteca/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:receitoteca/theme/colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReceitaProvider(),),
        ChangeNotifierProvider(create: (context) => CategoriasProvider(),),
      ],
      child: const Receitoteca(),
    )
  );
}

class Receitoteca extends StatelessWidget {
  const Receitoteca({super.key});

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