import 'package:flutter/material.dart';
import 'package:receitoteca/models/provider/categorias_provider.dart';
import 'package:receitoteca/models/provider/lista_receitas_provider.dart';
import 'package:receitoteca/models/provider/receita_random_provider.dart';
import 'package:receitoteca/models/provider/receita_provider.dart';
import 'package:receitoteca/repositories/repositorio_receitas.dart';
import 'package:receitoteca/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:receitoteca/theme/colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReceitaRandomProvider(),),
        ChangeNotifierProvider(create: (context) => CategoriasProvider(),),
        ChangeNotifierProvider(create: (context) => ListaReceitasProvider(RepositorioReceitas('')),),
        ChangeNotifierProvider(create: (context) => ReceitaProvider(),),
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