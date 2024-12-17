import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/theme/colors.dart';

class ListaIngredientes extends StatelessWidget {
  final Receita? receita;
  const ListaIngredientes({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}