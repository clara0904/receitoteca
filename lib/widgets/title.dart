import 'package:flutter/material.dart';
import 'package:receitoteca/theme/colors.dart';

class TemaTitulo extends StatelessWidget {
  final String titulo;
  final double size;
  const TemaTitulo({super.key, required this.titulo, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: TextStyle(
        fontSize: size,
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
    );
  }
}