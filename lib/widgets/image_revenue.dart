import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';

class ImageRevenue extends StatelessWidget {
  final Receita? receita;
  final bool visibleName;
  final bool visibleStyle;
  const ImageRevenue({super.key, required this.receita, required this.visibleName, required this.visibleStyle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          receita!.meals!.first.strMealThumb ?? '',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Visibility(
          visible: visibleStyle,
          child: Positioned.fill(
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
        ),
        Visibility(
          visible: visibleName,
          child: Positioned(
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
        ),
      ],
    );
  }
}
