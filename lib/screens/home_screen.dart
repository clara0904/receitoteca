import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_categoria.dart';
import 'package:receitoteca/repositories/repositorio_random.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/theme/colors.dart';
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
          title: Text(
            'Receitoteca',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: ColorsApp.corFonteSecundaria,
            ),
          ),
          centerTitle: true,
          backgroundColor: ColorsApp.backgroundAppBar,
        ),
        body: receita == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recomendado para você:',
                        style: TextStyle(
                          fontSize: 24,
                          color: ColorsApp.corFontePrimaria,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 8.0,
                              color: Colors.black.withOpacity(0.3),
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
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,  
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: ImageRevenue(
                            receita: receita,
                          ),
                        ),
                      ),
                    const SizedBox(height: 18),
                    Text(
                      'Categorias:',
                      style: TextStyle(
                        fontSize: 22,
                        color: ColorsApp.corFontePrimaria,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            blurRadius: 8.0,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                      categorias.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CategoriaButton(categorias: categorias,),
                          )
                          : Center(
                              child: Text(
                                'Nenhuma categoria encontrada.',
                                style: TextStyle(color: ColorsApp.corFontePrimaria),
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
