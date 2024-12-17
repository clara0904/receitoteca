import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_categoria.dart';
import 'package:receitoteca/repositories/repositorio_random.dart';
import 'package:receitoteca/widgets/widgets_home_screen/random_revenue.dart';
import 'package:receitoteca/widgets/widgets_home_screen/recomendation.dart';
import 'package:receitoteca/widgets/widgets_home_screen/scrool_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AleatoriaRepositorio repository = AleatoriaRepositorio();
  final RepositorioCategoria repositorio = RepositorioCategoria();
  
  List<Categories> categorias = [];
  Receita? receita;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchCategorias();
  }

  void fetchData() async {
    await repository.getReceita();
    setState(() {
      receita = repository.receita;
    });
  }

  void fetchCategorias() async {
    List<Categories> fetchedCategorias = await repositorio.getCategorias();
    setState(() {
      categorias = fetchedCategorias;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Receitoteca',
          ),
        ),
        body: receita == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  children: [

                  RecomendacaoReceita(receita:  receita,),

                  ScroolCategory(categorias: categorias,),

                  const SorteadorReceita(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
