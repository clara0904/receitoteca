import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/widgets/widgets_home_screen/image_revenue.dart';
import 'package:receitoteca/widgets/theme_title.dart';

class RecomendacaoReceita extends StatelessWidget {
  //final BuildContext context;
  final Receita? receita;
  const RecomendacaoReceita({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TemaTitulo(titulo: 'Recomendado para você:', size: 22),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReceitaScreen(
                    endpoint: receita!.meals!.first.idMeal!,
                  ),
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,  
            ),
            child: SizedBox(
              width: double.infinity,
              child: ImageRevenue(
                receita: receita,
              ),
            ),
          ),
        ],
      ),
    );
  }
}