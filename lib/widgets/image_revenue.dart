import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';

class ImageRevenue extends StatelessWidget {
  final Receita? receita;
  const ImageRevenue({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4/3,
          child: Image.network(
            receita!.meals!.first.strMealThumb ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Text(
            receita!.meals!.first.strMeal ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
