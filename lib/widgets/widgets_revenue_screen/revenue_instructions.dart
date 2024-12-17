import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/theme/colors.dart';

class InstrucoesReceita extends StatelessWidget {
  final Receita? receita;
  const InstrucoesReceita({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}