import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/widgets/theme_title.dart';

class ImagemPrincipalReceita extends StatelessWidget {
  final Receita? receita;
  const ImagemPrincipalReceita({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: 
            TemaTitulo(
              titulo: '${receita!.meals!.first.strMeal}', 
              size: 32,
            ),
          ),
          Image.network(
            receita!.meals!.first.strMealThumb ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}