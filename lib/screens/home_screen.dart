import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_categoria.dart';
import 'package:receitoteca/repositories/repositorio_random.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/widgets/categoria_button.dart';
import 'package:receitoteca/widgets/image_revenue.dart';
import 'package:receitoteca/widgets/random_revenue.dart';

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
            'RECEITOTECA',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 4, 43, 77),
        ),
        body: receita == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receita do dia',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ReceitaScreen(
                                endpoint: receita!.meals!.first.idMeal!,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: ImageRevenue(
                            receita: receita,
                          ),
                        ),
                      ),
                    const SizedBox(height: 18),
                    const Text(
                      'Escolha sua receita por categoria:',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                      categorias.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoriaButton(categorias: categorias,),
                          )
                          : const Center(
                              child: Text(
                                'Nenhuma categoria encontrada.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                      const SizedBox(height: 20),
                      const SorteadorReceita(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
