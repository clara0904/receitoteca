﻿import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitoteca/models/provider/categorias_provider.dart';
import 'package:receitoteca/models/provider/receita_random_provider.dart';
import 'package:receitoteca/widgets/widgets_home_screen/random_revenue.dart';
import 'package:receitoteca/widgets/widgets_home_screen/recomendation.dart';
import 'package:receitoteca/widgets/widgets_home_screen/scrool_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    final receitaProvider = Provider.of<ReceitaRandomProvider>(context, listen: false);
    final categoriasProvider = Provider.of<CategoriasProvider>(context, listen: false);

    Future.microtask(() {
      receitaProvider.fetchReceita();
      categoriasProvider.fetchCategorias();
    });
  }

  @override
  Widget build(BuildContext context) {
    final receitaProvider = Provider.of<ReceitaRandomProvider>(context);
    final categoriaProvider = Provider.of<CategoriasProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Receitoteca',
          ),
        ),
        body: receitaProvider.receita == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    children: [
                      RecomendacaoReceita(receita: receitaProvider.receita),

                      ScroolCategory(categorias: categoriaProvider.categorias),

                      ChangeNotifierProvider(
                        create: (_) => ReceitaRandomProvider(),
                        child: const SorteadorReceita(),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
