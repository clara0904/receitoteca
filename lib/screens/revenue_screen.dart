import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_receita.dart';
import 'package:receitoteca/theme/colors.dart';
import 'package:receitoteca/widgets/image_revenue.dart';
import 'package:receitoteca/widgets/title.dart';

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
            'Receitoteca',
          ),
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
                        child: TemaTitulo(
                          titulo: '${receita!.meals!.first.strMeal}', 
                          size: 32,
                        ),
                      ),
                      Image.network(
                        receita!.meals!.first.strMealThumb ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Ingredientes:',
                        style: TextStyle(
                          color: ColorsApp.corFontePrimaria,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ...List.generate(20, (index) {
                        final ingredient = receita!.meals!.first
                            .toJson()['strIngredient${index + 1}'];
                        final measure = receita!.meals!.first
                            .toJson()['strMeasure${index + 1}'];

                        if (ingredient != null && ingredient.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '${(measure != null && measure.trim().isNotEmpty) ? measure : '-'} $ingredient',
                              style: TextStyle(fontSize: 18, color: ColorsApp.corFontePrimaria),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink(); 
                        }
                      }),
                      const SizedBox(height: 20),
                      Text(
                        'Instruções:',
                        style: TextStyle(fontSize: 20, 
                          color: ColorsApp.corFontePrimaria,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${receita!.meals!.first.strInstructions}',
                        style: TextStyle(fontSize: 18, color: ColorsApp.corFontePrimaria),
                      ),
                      const SizedBox(height: 20,),
                      Visibility(
                        visible: receita!.meals!.first.strYoutube!.isNotEmpty,
                        child: Row(
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
                                style: TextStyle(fontSize: 18, color: ColorsApp.corFontePrimaria),
                                overflow: TextOverflow.clip, 
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

