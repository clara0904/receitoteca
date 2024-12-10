import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_receita.dart';
import 'package:receitoteca/widgets/image_revenue.dart';

class ReceitaScreen extends StatefulWidget {
  final String endpoint;
  const ReceitaScreen({super.key, required this.endpoint});

  @override
  State<ReceitaScreen> createState() => _ReceitaScreenState();
}

class _ReceitaScreenState extends State<ReceitaScreen> {
  late final ReceitaRepositorio repository;
  Receita? receita;

  @override
  void initState() {
    super.initState();
    repository = ReceitaRepositorio(widget.endpoint);
    fetchData();
  }

  void fetchData() async {
    await repository.getReceita();
    setState(() {
      receita = repository.receita;
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
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: receita == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          '${receita!.meals!.first.strMeal}',
                          style: const TextStyle(fontSize: 32, color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(2, 2),
                            ),],
                          ),
                        ),
                      ),
                      ImageRevenue(receita: receita, visibleName: false, visibleStyle: false,),
                      const SizedBox(height: 20),
                      Text(
                        'Ingredientes: \n${receita!.meals!.first.strMeasure1} ${receita!.meals!.first.strIngredient1}',
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Instruções: \n${receita!.meals!.first.strInstructions}',
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.youtube,
                            color: Colors.red,
                            size: 34,
                          ),
                          const SizedBox(width: 10), 
                          Expanded(
                            child: Text(
                              'Acesse o passo a passo no YouTube: \n${receita!.meals!.first.strYoutube}',
                              style: const TextStyle(fontSize: 18, color: Colors.white),
                              overflow: TextOverflow.clip, 
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

