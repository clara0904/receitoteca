import 'package:flutter/material.dart';
import 'package:receitoteca/models/lista_receitas.dart';
import 'package:receitoteca/theme/colors.dart';

class CardListaReceitas extends StatelessWidget {
  final Meals meal;
  const CardListaReceitas({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
    color: ColorsApp.backgroundCard,
    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), 
    ),
    elevation: 5,
    child: ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          meal.strMealThumb ?? '',
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(
          meal.strMeal ?? 'Sem título',
          style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold,
            color: ColorsApp.corFonteSecundaria,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
  );
  }
}