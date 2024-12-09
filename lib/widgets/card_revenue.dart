﻿import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/theme/colors.dart';

class ReceitaCard extends StatelessWidget {
  final Receita? receita;
  const ReceitaCard({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsApp.backgroundPrimario,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Categoria: ${receita!.meals!.first.strCategory}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Culinária: ${receita!.meals!.first.strArea}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.bookmark_outline,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}