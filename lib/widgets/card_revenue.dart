import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/theme/colors.dart';

class ReceitaCard extends StatelessWidget {
  final Receita? receita;
  const ReceitaCard({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(top: 8.0),  
      ),
      child: Container(
        width: double.infinity,
        child: Card(
          color: ColorsApp.backgroundCard,
          elevation: 6,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    receita!.meals!.first.strMealThumb ?? '',
                    fit: BoxFit.cover,
                    width: 108,
                    height: 108,
                  ),
                ),
              ),
              const SizedBox(width: 2,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receita!.meals!.first.strMeal ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorsApp.corFonteSecundaria,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Categoria: ${receita!.meals!.first.strCategory}',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsApp.corFonteSecundaria,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Culinária: ${receita!.meals!.first.strArea}',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsApp.corFonteSecundaria,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star_border,
                            color: Color.fromARGB(255, 255, 211, 53),
                          ),
                          const SizedBox(width: 8,),
                          Icon(
                            Icons.bookmark_outline,
                            color: ColorsApp.corFonteSecundaria,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ReceitaScreen(endpoint: receita!.meals!.first.idMeal!),
          ),
        );
      },
    );
  }
}